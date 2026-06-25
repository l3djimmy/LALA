.class public final Lcom/hardlineforge/lala/data/VideoDao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
.source "VideoDao_Impl.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/data/VideoDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityInsertAdapter<",
        "Lcom/hardlineforge/lala/data/Video;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u0008\u0010\u0003\u001a\u00020\u0004H\u0014J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0002H\u0014\u00a8\u0006\n"
    }
    d2 = {
        "com/hardlineforge/lala/data/VideoDao_Impl$1",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/Video;",
        "createQuery",
        "",
        "bind",
        "",
        "statement",
        "Landroidx/sqlite/SQLiteStatement;",
        "entity",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hardlineforge/lala/data/VideoDao_Impl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/data/VideoDao_Impl;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/hardlineforge/lala/data/VideoDao_Impl;

    iput-object p1, p0, Lcom/hardlineforge/lala/data/VideoDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/VideoDao_Impl;

    .line 36
    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/hardlineforge/lala/data/Video;)V
    .locals 7
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/hardlineforge/lala/data/Video;

    const-string v0, "statement"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "entity"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    const/4 v0, 0x1

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 41
    const/4 v0, 0x2

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getEntryId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 42
    const/4 v0, 0x3

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 43
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getDurationSeconds()I

    move-result v0

    int-to-long v0, v0

    const/4 v2, 0x4

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 44
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getThumbnailUri()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "_tmpThumbnailUri":Ljava/lang/String;
    const/4 v1, 0x5

    if-nez v0, :cond_0

    .line 46
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 48
    :cond_0
    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 50
    :goto_0
    iget-object v1, p0, Lcom/hardlineforge/lala/data/VideoDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/VideoDao_Impl;

    invoke-static {v1}, Lcom/hardlineforge/lala/data/VideoDao_Impl;->access$get__converters$p(Lcom/hardlineforge/lala/data/VideoDao_Impl;)Lcom/hardlineforge/lala/data/Converters;

    move-result-object v1

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getTimestamp()Ljava/time/Instant;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v1

    .line 51
    .local v1, "_tmp":Ljava/lang/Long;
    const/4 v2, 0x6

    if-nez v1, :cond_1

    .line 52
    invoke-interface {p1, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 54
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {p1, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 56
    :goto_1
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getGpsLat()Ljava/lang/Double;

    move-result-object v2

    .line 57
    .local v2, "_tmpGpsLat":Ljava/lang/Double;
    const/4 v3, 0x7

    if-nez v2, :cond_2

    .line 58
    invoke-interface {p1, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 60
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-interface {p1, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 62
    :goto_2
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/Video;->getGpsLon()Ljava/lang/Double;

    move-result-object v3

    .line 63
    .local v3, "_tmpGpsLon":Ljava/lang/Double;
    const/16 v4, 0x8

    if-nez v3, :cond_3

    .line 64
    invoke-interface {p1, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 66
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-interface {p1, v4, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 68
    :goto_3
    return-void
.end method

.method public bridge synthetic bind(Landroidx/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 1
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Ljava/lang/Object;

    .line 36
    move-object v0, p2

    check-cast v0, Lcom/hardlineforge/lala/data/Video;

    invoke-virtual {p0, p1, v0}, Lcom/hardlineforge/lala/data/VideoDao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/hardlineforge/lala/data/Video;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 37
    const-string v0, "INSERT OR REPLACE INTO `videos` (`id`,`entryId`,`uri`,`durationSeconds`,`thumbnailUri`,`timestamp`,`gpsLat`,`gpsLon`) VALUES (?,?,?,?,?,?,?,?)"

    return-object v0
.end method
