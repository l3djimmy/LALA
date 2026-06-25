.class public final Landroidx/camera/core/impl/utils/ContextUtil;
.super Ljava/lang/Object;
.source "ContextUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    return-void
.end method

.method public static getApplicationContext(Landroid/content/Context;)Landroid/content/Context;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 40
    .local v0, "applicationContext":Landroid/content/Context;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_0

    .line 41
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->getAttributionTag(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "attributeTag":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 44
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->createAttributionContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v2

    return-object v2

    .line 47
    .end local v1    # "attributeTag":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getApplicationFromContext(Landroid/content/Context;)Landroid/app/Application;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 77
    const/4 v0, 0x0

    .line 78
    .local v0, "application":Landroid/app/Application;
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    .line 79
    .local v1, "appContext":Landroid/content/Context;
    :goto_0
    instance-of v2, v1, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_1

    .line 80
    instance-of v2, v1, Landroid/app/Application;

    if-eqz v2, :cond_0

    .line 81
    move-object v0, v1

    check-cast v0, Landroid/app/Application;

    .line 82
    goto :goto_1

    .line 84
    :cond_0
    move-object v2, v1

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-static {v2}, Landroidx/camera/core/impl/utils/ContextUtil;->getBaseContext(Landroid/content/ContextWrapper;)Landroid/content/Context;

    move-result-object v1

    goto :goto_0

    .line 87
    :cond_1
    :goto_1
    return-object v0
.end method

.method public static getBaseContext(Landroid/content/ContextWrapper;)Landroid/content/Context;
    .locals 3
    .param p0, "context"    # Landroid/content/ContextWrapper;

    .line 55
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 56
    .local v0, "baseContext":Landroid/content/Context;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_0

    .line 57
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->getAttributionTag(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "attributeTag":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 60
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->createAttributionContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v2

    return-object v2

    .line 64
    .end local v1    # "attributeTag":Ljava/lang/String;
    :cond_0
    return-object v0
.end method
