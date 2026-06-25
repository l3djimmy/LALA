.class public final Landroidx/camera/core/internal/utils/VideoUtil;
.super Ljava/lang/Object;
.source "VideoUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAbsolutePathFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;
    .locals 10
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "contentUri"    # Landroid/net/Uri;

    .line 44
    const-string/jumbo v0, "_data"

    const/4 v1, 0x0

    .line 49
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v6, v2

    .line 50
    .local v6, "proj":[Ljava/lang/String;
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v7, 0x0

    move-object v4, p0

    move-object v5, p1

    .end local p0    # "resolver":Landroid/content/ContentResolver;
    .end local p1    # "contentUri":Landroid/net/Uri;
    .local v4, "resolver":Landroid/content/ContentResolver;
    .local v5, "contentUri":Landroid/net/Uri;
    :try_start_1
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    move-object v1, p0

    .line 51
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/database/Cursor;

    move-object v1, p0

    .line 52
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result p0

    .line 53
    .local p0, "columnIndex":I
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 54
    invoke-interface {v1, p0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 61
    if-eqz v1, :cond_0

    .line 62
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 54
    :cond_0
    return-object p1

    .line 55
    .end local v6    # "proj":[Ljava/lang/String;
    .end local p0    # "columnIndex":I
    :catch_0
    move-exception v0

    move-object p0, v0

    goto :goto_0

    .line 61
    .end local v4    # "resolver":Landroid/content/ContentResolver;
    .end local v5    # "contentUri":Landroid/net/Uri;
    .local p0, "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "contentUri":Landroid/net/Uri;
    :catchall_0
    move-exception v0

    move-object v4, p0

    move-object v5, p1

    move-object p0, v0

    .end local p0    # "resolver":Landroid/content/ContentResolver;
    .end local p1    # "contentUri":Landroid/net/Uri;
    .restart local v4    # "resolver":Landroid/content/ContentResolver;
    .restart local v5    # "contentUri":Landroid/net/Uri;
    goto :goto_1

    .line 55
    .end local v4    # "resolver":Landroid/content/ContentResolver;
    .end local v5    # "contentUri":Landroid/net/Uri;
    .restart local p0    # "resolver":Landroid/content/ContentResolver;
    .restart local p1    # "contentUri":Landroid/net/Uri;
    :catch_1
    move-exception v0

    move-object v4, p0

    move-object v5, p1

    move-object p0, v0

    .line 56
    .end local p1    # "contentUri":Landroid/net/Uri;
    .restart local v4    # "resolver":Landroid/content/ContentResolver;
    .restart local v5    # "contentUri":Landroid/net/Uri;
    .local p0, "e":Ljava/lang/RuntimeException;
    :goto_0
    :try_start_2
    const-string/jumbo p1, "VideoUtil"

    const-string v0, "Failed in getting absolute path for Uri %s with Exception %s"

    .line 58
    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 56
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string p1, ""
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 61
    if-eqz v1, :cond_1

    .line 62
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 59
    :cond_1
    return-object p1

    .line 61
    .end local p0    # "e":Ljava/lang/RuntimeException;
    :catchall_1
    move-exception v0

    move-object p0, v0

    :goto_1
    if-eqz v1, :cond_2

    .line 62
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 64
    :cond_2
    throw p0
.end method
