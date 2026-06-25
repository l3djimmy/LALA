.class public final Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
.source "LogEntryDao_Impl.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/data/LogEntryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityInsertAdapter<",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u0008\u0010\u0003\u001a\u00020\u0004H\u0014J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0002H\u0014\u00a8\u0006\n"
    }
    d2 = {
        "com/hardlineforge/lala/data/LogEntryDao_Impl$1",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/LogEntry;",
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
.field final synthetic this$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    .line 41
    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/hardlineforge/lala/data/LogEntry;)V
    .locals 10
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/hardlineforge/lala/data/LogEntry;

    const-string v0, "statement"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "entity"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    const/4 v0, 0x1

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    invoke-static {v0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->access$get__converters$p(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;

    move-result-object v0

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getTimestamp()Ljava/time/Instant;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v0

    .line 47
    .local v0, "_tmp":Ljava/lang/Long;
    const/4 v1, 0x2

    if-nez v0, :cond_0

    .line 48
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 52
    :goto_0
    const/4 v1, 0x3

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getTimezone()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 53
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v1

    .line 54
    .local v1, "_tmpGpsLat":Ljava/lang/Double;
    const/4 v2, 0x4

    if-nez v1, :cond_1

    .line 55
    invoke-interface {p1, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 57
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-interface {p1, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 59
    :goto_1
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v2

    .line 60
    .local v2, "_tmpGpsLon":Ljava/lang/Double;
    const/4 v3, 0x5

    if-nez v2, :cond_2

    .line 61
    invoke-interface {p1, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 63
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-interface {p1, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 65
    :goto_2
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsAccuracy()Ljava/lang/Float;

    move-result-object v3

    .line 66
    .local v3, "_tmpGpsAccuracy":Ljava/lang/Float;
    const/4 v4, 0x6

    if-nez v3, :cond_3

    .line 67
    invoke-interface {p1, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 69
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    float-to-double v5, v5

    invoke-interface {p1, v4, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 71
    :goto_3
    const/4 v4, 0x7

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 72
    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getLocationName()Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "_tmpLocationName":Ljava/lang/String;
    const/16 v5, 0x8

    if-nez v4, :cond_4

    .line 74
    invoke-interface {p1, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 76
    :cond_4
    invoke-interface {p1, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 78
    :goto_4
    const/16 v5, 0x9

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getComment()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 79
    const/16 v5, 0xa

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getTags()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 80
    iget-object v5, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    invoke-static {v5}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->access$get__converters$p(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;

    move-result-object v5

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getCreatedAt()Ljava/time/Instant;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v5

    .line 81
    .local v5, "_tmp_1":Ljava/lang/Long;
    const/16 v6, 0xb

    if-nez v5, :cond_5

    .line 82
    invoke-interface {p1, v6}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 84
    :cond_5
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {p1, v6, v7, v8}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 86
    :goto_5
    iget-object v6, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    invoke-static {v6}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->access$get__converters$p(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;

    move-result-object v6

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/LogEntry;->getUpdatedAt()Ljava/time/Instant;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v6

    .line 87
    .local v6, "_tmp_2":Ljava/lang/Long;
    const/16 v7, 0xc

    if-nez v6, :cond_6

    .line 88
    invoke-interface {p1, v7}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 90
    :cond_6
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-interface {p1, v7, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 92
    :goto_6
    return-void
.end method

.method public bridge synthetic bind(Landroidx/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 1
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Ljava/lang/Object;

    .line 41
    move-object v0, p2

    check-cast v0, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-virtual {p0, p1, v0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/hardlineforge/lala/data/LogEntry;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 42
    const-string v0, "INSERT OR REPLACE INTO `log_entries` (`id`,`timestamp`,`timezone`,`gpsLat`,`gpsLon`,`gpsAccuracy`,`category`,`locationName`,`comment`,`tags`,`createdAt`,`updatedAt`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)"

    return-object v0
.end method
