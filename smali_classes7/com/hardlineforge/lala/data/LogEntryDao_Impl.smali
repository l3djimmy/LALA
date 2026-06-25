.class public final Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
.super Ljava/lang/Object;
.source "LogEntryDao_Impl.kt"

# interfaces
.implements Lcom/hardlineforge/lala/data/LogEntryDao;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u0000 %2\u00020\u0001:\u0001%B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0011J\u0016\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0011J\u0016\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0011J\u0014\u0010\u0015\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00170\u0016H\u0016J\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u0019\u001a\u00020\u001aH\u0096@\u00a2\u0006\u0002\u0010\u001bJ\u001c\u0010\u001c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00170\u00162\u0006\u0010\u001d\u001a\u00020\u001aH\u0016J\u001c\u0010\u001e\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00170\u00162\u0006\u0010\u001f\u001a\u00020\u001aH\u0016J$\u0010 \u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00170\u00162\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\"H\u0016J\u0016\u0010$\u001a\u00020\u00132\u0006\u0010\u0019\u001a\u00020\u001aH\u0096@\u00a2\u0006\u0002\u0010\u001bR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006&"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/LogEntryDao_Impl;",
        "Lcom/hardlineforge/lala/data/LogEntryDao;",
        "__db",
        "Landroidx/room/RoomDatabase;",
        "<init>",
        "(Landroidx/room/RoomDatabase;)V",
        "__insertAdapterOfLogEntry",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        "__converters",
        "Lcom/hardlineforge/lala/data/Converters;",
        "__deleteAdapterOfLogEntry",
        "Landroidx/room/EntityDeleteOrUpdateAdapter;",
        "__updateAdapterOfLogEntry",
        "insert",
        "",
        "entry",
        "(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "delete",
        "",
        "update",
        "getAll",
        "Lkotlinx/coroutines/flow/Flow;",
        "",
        "getById",
        "id",
        "",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getByCategory",
        "category",
        "search",
        "query",
        "getByDateRange",
        "start",
        "Ljava/time/Instant;",
        "end",
        "deleteById",
        "Companion",
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


# static fields
.field public static final $stable:I

.field public static final Companion:Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;


# instance fields
.field private final __converters:Lcom/hardlineforge/lala/data/Converters;

.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfLogEntry:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfLogEntry:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfLogEntry:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->Companion:Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;

    const-string v0, "__db"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Lcom/hardlineforge/lala/data/Converters;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/Converters;-><init>()V

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    .line 39
    nop

    .line 40
    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 41
    new-instance v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$1;-><init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V

    check-cast v0, Landroidx/room/EntityInsertAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__insertAdapterOfLogEntry:Landroidx/room/EntityInsertAdapter;

    .line 94
    new-instance v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$2;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$2;-><init>()V

    check-cast v0, Landroidx/room/EntityDeleteOrUpdateAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__deleteAdapterOfLogEntry:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 101
    new-instance v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$3;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$3;-><init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V

    check-cast v0, Landroidx/room/EntityDeleteOrUpdateAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__updateAdapterOfLogEntry:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 155
    nop

    .line 27
    return-void
.end method

.method public static final synthetic access$get__converters$p(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    .line 25
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    return-object v0
.end method

.method static final delete$lambda$1(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p1, "$entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__deleteAdapterOfLogEntry:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 164
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final deleteById$lambda$8(Ljava/lang/String;Ljava/lang/String;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 2
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$id"    # Ljava/lang/String;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 723
    invoke-interface {p2, p0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 724
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 725
    const/4 v1, 0x1

    .line 726
    .local v1, "_argIndex":I
    :try_start_0
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 727
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 729
    .end local v1    # "_argIndex":I
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 730
    nop

    .line 731
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    .line 729
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v1
.end method

.method static final getAll$lambda$3(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 38
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v0, "_connection"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 173
    move-object/from16 v3, p0

    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v4

    .line 174
    .local v4, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 175
    :try_start_0
    const-string v0, "id"

    invoke-static {v4, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 176
    .local v0, "_columnIndexOfId":I
    const-string v5, "timestamp"

    invoke-static {v4, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 177
    .local v5, "_columnIndexOfTimestamp":I
    const-string v6, "timezone"

    invoke-static {v4, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 178
    .local v6, "_columnIndexOfTimezone":I
    const-string v7, "gpsLat"

    invoke-static {v4, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 179
    .local v7, "_columnIndexOfGpsLat":I
    const-string v8, "gpsLon"

    invoke-static {v4, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 180
    .local v8, "_columnIndexOfGpsLon":I
    const-string v9, "gpsAccuracy"

    invoke-static {v4, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 181
    .local v9, "_columnIndexOfGpsAccuracy":I
    const-string v10, "category"

    invoke-static {v4, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 182
    .local v10, "_columnIndexOfCategory":I
    const-string v11, "locationName"

    invoke-static {v4, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 183
    .local v11, "_columnIndexOfLocationName":I
    const-string v12, "comment"

    invoke-static {v4, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 184
    .local v12, "_columnIndexOfComment":I
    const-string v13, "tags"

    invoke-static {v4, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 185
    .local v13, "_columnIndexOfTags":I
    const-string v14, "createdAt"

    invoke-static {v4, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 186
    .local v14, "_columnIndexOfCreatedAt":I
    const-string v15, "updatedAt"

    invoke-static {v4, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 187
    .local v15, "_columnIndexOfUpdatedAt":I
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    check-cast v16, Ljava/util/List;

    move-object/from16 v17, v16

    .line 188
    .local v17, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v16

    if-eqz v16, :cond_a

    .line 189
    const/16 v16, 0x0

    .line 190
    .local v16, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v18, 0x0

    .line 191
    .local v18, "_tmpId":Ljava/lang/String;
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v21, v19

    .line 192
    .end local v18    # "_tmpId":Ljava/lang/String;
    .local v21, "_tmpId":Ljava/lang/String;
    const/16 v18, 0x0

    .line 193
    .local v18, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v19, 0x0

    .line 194
    .local v19, "_tmp":Ljava/lang/Long;
    invoke-interface {v4, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 195
    const/16 v19, 0x0

    move/from16 v33, v0

    move-object/from16 v0, v19

    goto :goto_1

    .line 197
    :cond_0
    invoke-interface {v4, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v19, v20

    move/from16 v33, v0

    move-object/from16 v0, v19

    .line 199
    .end local v19    # "_tmp":Ljava/lang/Long;
    .local v0, "_tmp":Ljava/lang/Long;
    .local v33, "_columnIndexOfId":I
    :goto_1
    iget-object v2, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v2, v0}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    .local v2, "_tmp_1":Ljava/time/Instant;
    const-string v19, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    if-eqz v2, :cond_9

    .line 203
    move-object/from16 v22, v2

    .line 205
    .end local v18    # "_tmpTimestamp":Ljava/time/Instant;
    .local v22, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v18, 0x0

    .line 206
    .local v18, "_tmpTimezone":Ljava/lang/String;
    :try_start_1
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v23

    .line 207
    .end local v18    # "_tmpTimezone":Ljava/lang/String;
    .local v23, "_tmpTimezone":Ljava/lang/String;
    const/16 v18, 0x0

    .line 208
    .local v18, "_tmpGpsLat":Ljava/lang/Double;
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 209
    const/16 v18, 0x0

    move-object/from16 v24, v18

    goto :goto_2

    .line 211
    :cond_1
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v20

    move-object/from16 v18, v20

    move-object/from16 v24, v18

    .line 213
    .end local v18    # "_tmpGpsLat":Ljava/lang/Double;
    .local v24, "_tmpGpsLat":Ljava/lang/Double;
    :goto_2
    const/16 v18, 0x0

    .line 214
    .local v18, "_tmpGpsLon":Ljava/lang/Double;
    invoke-interface {v4, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 215
    const/16 v18, 0x0

    move-object/from16 v25, v18

    goto :goto_3

    .line 217
    :cond_2
    invoke-interface {v4, v8}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v20

    move-object/from16 v18, v20

    move-object/from16 v25, v18

    .line 219
    .end local v18    # "_tmpGpsLon":Ljava/lang/Double;
    .local v25, "_tmpGpsLon":Ljava/lang/Double;
    :goto_3
    const/16 v18, 0x0

    .line 220
    .local v18, "_tmpGpsAccuracy":Ljava/lang/Float;
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 221
    const/16 v18, 0x0

    move-object/from16 v34, v2

    move-object/from16 v26, v18

    goto :goto_4

    .line 223
    :cond_3
    move-object/from16 v34, v2

    .end local v2    # "_tmp_1":Ljava/time/Instant;
    .local v34, "_tmp_1":Ljava/time/Instant;
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v2

    double-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    move-object/from16 v18, v2

    move-object/from16 v26, v18

    .line 225
    .end local v18    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .local v26, "_tmpGpsAccuracy":Ljava/lang/Float;
    :goto_4
    const/4 v2, 0x0

    .line 226
    .local v2, "_tmpCategory":Ljava/lang/String;
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v27

    .line 227
    .end local v2    # "_tmpCategory":Ljava/lang/String;
    .local v27, "_tmpCategory":Ljava/lang/String;
    const/4 v2, 0x0

    .line 228
    .local v2, "_tmpLocationName":Ljava/lang/String;
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 229
    const/4 v2, 0x0

    move-object/from16 v28, v2

    goto :goto_5

    .line 231
    :cond_4
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    move-object/from16 v28, v2

    .line 233
    .end local v2    # "_tmpLocationName":Ljava/lang/String;
    .local v28, "_tmpLocationName":Ljava/lang/String;
    :goto_5
    const/4 v2, 0x0

    .line 234
    .local v2, "_tmpComment":Ljava/lang/String;
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v29

    .line 235
    .end local v2    # "_tmpComment":Ljava/lang/String;
    .local v29, "_tmpComment":Ljava/lang/String;
    const/4 v2, 0x0

    .line 236
    .local v2, "_tmpTags":Ljava/lang/String;
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v30

    .line 237
    .end local v2    # "_tmpTags":Ljava/lang/String;
    .local v30, "_tmpTags":Ljava/lang/String;
    const/4 v2, 0x0

    .line 238
    .local v2, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v3, 0x0

    .line 239
    .local v3, "_tmp_2":Ljava/lang/Long;
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 240
    const/4 v3, 0x0

    goto :goto_6

    .line 242
    :cond_5
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v3, v18

    .line 244
    :goto_6
    move-object/from16 v35, v0

    .end local v0    # "_tmp":Ljava/lang/Long;
    .local v35, "_tmp":Ljava/lang/Long;
    iget-object v0, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v3}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 245
    .local v0, "_tmp_3":Ljava/time/Instant;
    if-eqz v0, :cond_8

    .line 248
    move-object/from16 v31, v0

    .line 250
    .end local v2    # "_tmpCreatedAt":Ljava/time/Instant;
    .local v31, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v2, 0x0

    .line 251
    .local v2, "_tmpUpdatedAt":Ljava/time/Instant;
    const/16 v18, 0x0

    .line 252
    .local v18, "_tmp_4":Ljava/lang/Long;
    invoke-interface {v4, v15}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_6

    .line 253
    const/16 v18, 0x0

    move-object/from16 v36, v0

    move-object/from16 v0, v18

    goto :goto_7

    .line 255
    :cond_6
    invoke-interface {v4, v15}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v36

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v18, v20

    move-object/from16 v36, v0

    move-object/from16 v0, v18

    .line 257
    .end local v18    # "_tmp_4":Ljava/lang/Long;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .local v36, "_tmp_3":Ljava/time/Instant;
    :goto_7
    move-object/from16 v18, v2

    .end local v2    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v18, "_tmpUpdatedAt":Ljava/time/Instant;
    iget-object v2, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v2, v0}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v2

    .line 258
    .local v2, "_tmp_5":Ljava/time/Instant;
    if-eqz v2, :cond_7

    .line 261
    move-object/from16 v32, v2

    .line 263
    .end local v18    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v32, "_tmpUpdatedAt":Ljava/time/Instant;
    new-instance v20, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct/range {v20 .. v32}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    move-object/from16 v16, v20

    .line 264
    move-object/from16 v20, v0

    move-object/from16 v1, v16

    move-object/from16 v0, v17

    .end local v16    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v17    # "_result":Ljava/util/List;
    .local v0, "_result":Ljava/util/List;
    .local v1, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .local v20, "_tmp_4":Ljava/lang/Long;
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v3, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v17, v0

    move/from16 v0, v33

    goto/16 :goto_0

    .line 258
    .end local v1    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    .end local v32    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .restart local v16    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v17    # "_result":Ljava/util/List;
    .restart local v18    # "_tmpUpdatedAt":Ljava/time/Instant;
    :cond_7
    move-object/from16 v20, v0

    move-object/from16 v0, v17

    .end local v17    # "_result":Ljava/util/List;
    .local v0, "_result":Ljava/util/List;
    .restart local v20    # "_tmp_4":Ljava/lang/Long;
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 259
    move-object/from16 v17, v0

    .end local v0    # "_result":Ljava/util/List;
    .restart local v17    # "_result":Ljava/util/List;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v1

    .line 245
    .end local v18    # "_tmpUpdatedAt":Ljava/time/Instant;
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    .end local v31    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v36    # "_tmp_3":Ljava/time/Instant;
    .local v0, "_tmp_3":Ljava/time/Instant;
    .local v2, "_tmpCreatedAt":Ljava/time/Instant;
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_8
    move-object/from16 v36, v0

    .end local v0    # "_tmp_3":Ljava/time/Instant;
    .restart local v36    # "_tmp_3":Ljava/time/Instant;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 246
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 200
    .end local v3    # "_tmp_2":Ljava/lang/Long;
    .end local v22    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v23    # "_tmpTimezone":Ljava/lang/String;
    .end local v24    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v25    # "_tmpGpsLon":Ljava/lang/Double;
    .end local v26    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .end local v27    # "_tmpCategory":Ljava/lang/String;
    .end local v28    # "_tmpLocationName":Ljava/lang/String;
    .end local v29    # "_tmpComment":Ljava/lang/String;
    .end local v30    # "_tmpTags":Ljava/lang/String;
    .end local v34    # "_tmp_1":Ljava/time/Instant;
    .end local v35    # "_tmp":Ljava/lang/Long;
    .end local v36    # "_tmp_3":Ljava/time/Instant;
    .local v0, "_tmp":Ljava/lang/Long;
    .local v2, "_tmp_1":Ljava/time/Instant;
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v18, "_tmpTimestamp":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_9
    move-object/from16 v35, v0

    move-object/from16 v34, v2

    .end local v0    # "_tmp":Ljava/lang/Long;
    .end local v2    # "_tmp_1":Ljava/time/Instant;
    .restart local v34    # "_tmp_1":Ljava/time/Instant;
    .restart local v35    # "_tmp":Ljava/lang/Long;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 201
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 266
    .end local v16    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v18    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v21    # "_tmpId":Ljava/lang/String;
    .end local v33    # "_columnIndexOfId":I
    .end local v34    # "_tmp_1":Ljava/time/Instant;
    .end local v35    # "_tmp":Ljava/lang/Long;
    .local v0, "_columnIndexOfId":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_a
    move/from16 v33, v0

    .line 268
    .end local v0    # "_columnIndexOfId":I
    .end local v5    # "_columnIndexOfTimestamp":I
    .end local v6    # "_columnIndexOfTimezone":I
    .end local v7    # "_columnIndexOfGpsLat":I
    .end local v8    # "_columnIndexOfGpsLon":I
    .end local v9    # "_columnIndexOfGpsAccuracy":I
    .end local v10    # "_columnIndexOfCategory":I
    .end local v11    # "_columnIndexOfLocationName":I
    .end local v12    # "_columnIndexOfComment":I
    .end local v13    # "_columnIndexOfTags":I
    .end local v14    # "_columnIndexOfCreatedAt":I
    .end local v15    # "_columnIndexOfUpdatedAt":I
    .end local v17    # "_result":Ljava/util/List;
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 269
    return-object v17

    .line 268
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final getByCategory$lambda$5(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 39
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$category"    # Ljava/lang/String;
    .param p2, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p3, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    const-string v0, "_connection"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 381
    move-object/from16 v3, p0

    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v4

    .line 382
    .local v4, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 383
    const/4 v0, 0x1

    .line 384
    .local v0, "_argIndex":I
    move-object/from16 v5, p1

    :try_start_0
    invoke-interface {v4, v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 385
    const-string v6, "id"

    invoke-static {v4, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 386
    .local v6, "_columnIndexOfId":I
    const-string v7, "timestamp"

    invoke-static {v4, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 387
    .local v7, "_columnIndexOfTimestamp":I
    const-string v8, "timezone"

    invoke-static {v4, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 388
    .local v8, "_columnIndexOfTimezone":I
    const-string v9, "gpsLat"

    invoke-static {v4, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 389
    .local v9, "_columnIndexOfGpsLat":I
    const-string v10, "gpsLon"

    invoke-static {v4, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 390
    .local v10, "_columnIndexOfGpsLon":I
    const-string v11, "gpsAccuracy"

    invoke-static {v4, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 391
    .local v11, "_columnIndexOfGpsAccuracy":I
    const-string v12, "category"

    invoke-static {v4, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 392
    .local v12, "_columnIndexOfCategory":I
    const-string v13, "locationName"

    invoke-static {v4, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 393
    .local v13, "_columnIndexOfLocationName":I
    const-string v14, "comment"

    invoke-static {v4, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 394
    .local v14, "_columnIndexOfComment":I
    const-string v15, "tags"

    invoke-static {v4, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 395
    .local v15, "_columnIndexOfTags":I
    move/from16 v16, v0

    .end local v0    # "_argIndex":I
    .local v16, "_argIndex":I
    const-string v0, "createdAt"

    invoke-static {v4, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 396
    .local v0, "_columnIndexOfCreatedAt":I
    const-string v2, "updatedAt"

    invoke-static {v4, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 397
    .local v2, "_columnIndexOfUpdatedAt":I
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    check-cast v17, Ljava/util/List;

    move-object/from16 v18, v17

    .line 398
    .local v18, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v17

    if-eqz v17, :cond_a

    .line 399
    const/16 v17, 0x0

    .line 400
    .local v17, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v19, 0x0

    .line 401
    .local v19, "_tmpId":Ljava/lang/String;
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v22, v20

    .line 402
    .end local v19    # "_tmpId":Ljava/lang/String;
    .local v22, "_tmpId":Ljava/lang/String;
    const/16 v19, 0x0

    .line 403
    .local v19, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v20, 0x0

    .line 404
    .local v20, "_tmp":Ljava/lang/Long;
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 405
    const/16 v20, 0x0

    move-object/from16 v3, v20

    goto :goto_1

    .line 407
    :cond_0
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v20, v21

    move-object/from16 v3, v20

    .line 409
    .end local v20    # "_tmp":Ljava/lang/Long;
    .local v3, "_tmp":Ljava/lang/Long;
    :goto_1
    iget-object v5, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v5, v3}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 410
    .local v5, "_tmp_1":Ljava/time/Instant;
    const-string v20, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    if-eqz v5, :cond_9

    .line 413
    move-object/from16 v23, v5

    .line 415
    .end local v19    # "_tmpTimestamp":Ljava/time/Instant;
    .local v23, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v19, 0x0

    .line 416
    .local v19, "_tmpTimezone":Ljava/lang/String;
    :try_start_1
    invoke-interface {v4, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v24

    .line 417
    .end local v19    # "_tmpTimezone":Ljava/lang/String;
    .local v24, "_tmpTimezone":Ljava/lang/String;
    const/16 v19, 0x0

    .line 418
    .local v19, "_tmpGpsLat":Ljava/lang/Double;
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_1

    .line 419
    const/16 v19, 0x0

    move-object/from16 v25, v19

    goto :goto_2

    .line 421
    :cond_1
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v21

    move-object/from16 v19, v21

    move-object/from16 v25, v19

    .line 423
    .end local v19    # "_tmpGpsLat":Ljava/lang/Double;
    .local v25, "_tmpGpsLat":Ljava/lang/Double;
    :goto_2
    const/16 v19, 0x0

    .line 424
    .local v19, "_tmpGpsLon":Ljava/lang/Double;
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_2

    .line 425
    const/16 v19, 0x0

    move-object/from16 v26, v19

    goto :goto_3

    .line 427
    :cond_2
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v21

    move-object/from16 v19, v21

    move-object/from16 v26, v19

    .line 429
    .end local v19    # "_tmpGpsLon":Ljava/lang/Double;
    .local v26, "_tmpGpsLon":Ljava/lang/Double;
    :goto_3
    const/16 v19, 0x0

    .line 430
    .local v19, "_tmpGpsAccuracy":Ljava/lang/Float;
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 431
    const/16 v19, 0x0

    move-object/from16 v35, v5

    move/from16 v34, v6

    move-object/from16 v27, v19

    goto :goto_4

    .line 433
    :cond_3
    move-object/from16 v35, v5

    move/from16 v34, v6

    .end local v5    # "_tmp_1":Ljava/time/Instant;
    .end local v6    # "_columnIndexOfId":I
    .local v34, "_columnIndexOfId":I
    .local v35, "_tmp_1":Ljava/time/Instant;
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v5

    double-to-float v5, v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    move-object/from16 v19, v5

    move-object/from16 v27, v19

    .line 435
    .end local v19    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .local v27, "_tmpGpsAccuracy":Ljava/lang/Float;
    :goto_4
    const/4 v5, 0x0

    .line 436
    .local v5, "_tmpCategory":Ljava/lang/String;
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v28

    .line 437
    .end local v5    # "_tmpCategory":Ljava/lang/String;
    .local v28, "_tmpCategory":Ljava/lang/String;
    const/4 v5, 0x0

    .line 438
    .local v5, "_tmpLocationName":Ljava/lang/String;
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 439
    const/4 v5, 0x0

    move-object/from16 v29, v5

    goto :goto_5

    .line 441
    :cond_4
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    move-object/from16 v29, v5

    .line 443
    .end local v5    # "_tmpLocationName":Ljava/lang/String;
    .local v29, "_tmpLocationName":Ljava/lang/String;
    :goto_5
    const/4 v5, 0x0

    .line 444
    .local v5, "_tmpComment":Ljava/lang/String;
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v30

    .line 445
    .end local v5    # "_tmpComment":Ljava/lang/String;
    .local v30, "_tmpComment":Ljava/lang/String;
    const/4 v5, 0x0

    .line 446
    .local v5, "_tmpTags":Ljava/lang/String;
    invoke-interface {v4, v15}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v31

    .line 447
    .end local v5    # "_tmpTags":Ljava/lang/String;
    .local v31, "_tmpTags":Ljava/lang/String;
    const/4 v5, 0x0

    .line 448
    .local v5, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v6, 0x0

    .line 449
    .local v6, "_tmp_2":Ljava/lang/Long;
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 450
    const/4 v6, 0x0

    goto :goto_6

    .line 452
    :cond_5
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v6, v19

    .line 454
    :goto_6
    move/from16 v36, v0

    .end local v0    # "_columnIndexOfCreatedAt":I
    .local v36, "_columnIndexOfCreatedAt":I
    iget-object v0, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v6}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 455
    .local v0, "_tmp_3":Ljava/time/Instant;
    if-eqz v0, :cond_8

    .line 458
    move-object/from16 v32, v0

    .line 460
    .end local v5    # "_tmpCreatedAt":Ljava/time/Instant;
    .local v32, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v5, 0x0

    .line 461
    .local v5, "_tmpUpdatedAt":Ljava/time/Instant;
    const/16 v19, 0x0

    .line 462
    .local v19, "_tmp_4":Ljava/lang/Long;
    invoke-interface {v4, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_6

    .line 463
    const/16 v19, 0x0

    move-object/from16 v37, v0

    move-object/from16 v0, v19

    goto :goto_7

    .line 465
    :cond_6
    invoke-interface {v4, v2}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v37

    invoke-static/range {v37 .. v38}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v19, v21

    move-object/from16 v37, v0

    move-object/from16 v0, v19

    .line 467
    .end local v19    # "_tmp_4":Ljava/lang/Long;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .local v37, "_tmp_3":Ljava/time/Instant;
    :goto_7
    move/from16 v38, v2

    .end local v2    # "_columnIndexOfUpdatedAt":I
    .local v38, "_columnIndexOfUpdatedAt":I
    iget-object v2, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v2, v0}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v2

    .line 468
    .local v2, "_tmp_5":Ljava/time/Instant;
    if-eqz v2, :cond_7

    .line 471
    move-object/from16 v33, v2

    .line 473
    .end local v5    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v33, "_tmpUpdatedAt":Ljava/time/Instant;
    new-instance v21, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct/range {v21 .. v33}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    move-object/from16 v5, v21

    .line 474
    .end local v17    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .local v5, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    move-object/from16 v19, v0

    move-object/from16 v0, v18

    .end local v18    # "_result":Ljava/util/List;
    .local v0, "_result":Ljava/util/List;
    .restart local v19    # "_tmp_4":Ljava/lang/Long;
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-object/from16 v18, v0

    move/from16 v6, v34

    move/from16 v0, v36

    move/from16 v2, v38

    goto/16 :goto_0

    .line 468
    .end local v19    # "_tmp_4":Ljava/lang/Long;
    .end local v33    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .local v5, "_tmpUpdatedAt":Ljava/time/Instant;
    .restart local v17    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v18    # "_result":Ljava/util/List;
    :cond_7
    move-object/from16 v19, v0

    move-object/from16 v0, v18

    .end local v0    # "_tmp_4":Ljava/lang/Long;
    .restart local v19    # "_tmp_4":Ljava/lang/Long;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 469
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$category":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 455
    .end local v19    # "_tmp_4":Ljava/lang/Long;
    .end local v32    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v37    # "_tmp_3":Ljava/time/Instant;
    .end local v38    # "_columnIndexOfUpdatedAt":I
    .local v0, "_tmp_3":Ljava/time/Instant;
    .local v2, "_columnIndexOfUpdatedAt":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v5, "_tmpCreatedAt":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$category":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_8
    move-object/from16 v37, v0

    move/from16 v38, v2

    .end local v0    # "_tmp_3":Ljava/time/Instant;
    .end local v2    # "_columnIndexOfUpdatedAt":I
    .restart local v37    # "_tmp_3":Ljava/time/Instant;
    .restart local v38    # "_columnIndexOfUpdatedAt":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 456
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$category":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 410
    .end local v23    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v24    # "_tmpTimezone":Ljava/lang/String;
    .end local v25    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v26    # "_tmpGpsLon":Ljava/lang/Double;
    .end local v27    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .end local v28    # "_tmpCategory":Ljava/lang/String;
    .end local v29    # "_tmpLocationName":Ljava/lang/String;
    .end local v30    # "_tmpComment":Ljava/lang/String;
    .end local v31    # "_tmpTags":Ljava/lang/String;
    .end local v34    # "_columnIndexOfId":I
    .end local v35    # "_tmp_1":Ljava/time/Instant;
    .end local v36    # "_columnIndexOfCreatedAt":I
    .end local v37    # "_tmp_3":Ljava/time/Instant;
    .end local v38    # "_columnIndexOfUpdatedAt":I
    .local v0, "_columnIndexOfCreatedAt":I
    .restart local v2    # "_columnIndexOfUpdatedAt":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v5, "_tmp_1":Ljava/time/Instant;
    .local v6, "_columnIndexOfId":I
    .local v19, "_tmpTimestamp":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$category":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_9
    move/from16 v36, v0

    move/from16 v38, v2

    move-object/from16 v35, v5

    move/from16 v34, v6

    .end local v0    # "_columnIndexOfCreatedAt":I
    .end local v2    # "_columnIndexOfUpdatedAt":I
    .end local v5    # "_tmp_1":Ljava/time/Instant;
    .end local v6    # "_columnIndexOfId":I
    .restart local v34    # "_columnIndexOfId":I
    .restart local v35    # "_tmp_1":Ljava/time/Instant;
    .restart local v36    # "_columnIndexOfCreatedAt":I
    .restart local v38    # "_columnIndexOfUpdatedAt":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 411
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$category":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 476
    .end local v3    # "_tmp":Ljava/lang/Long;
    .end local v17    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v19    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v22    # "_tmpId":Ljava/lang/String;
    .end local v34    # "_columnIndexOfId":I
    .end local v35    # "_tmp_1":Ljava/time/Instant;
    .end local v36    # "_columnIndexOfCreatedAt":I
    .end local v38    # "_columnIndexOfUpdatedAt":I
    .restart local v0    # "_columnIndexOfCreatedAt":I
    .restart local v2    # "_columnIndexOfUpdatedAt":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local v6    # "_columnIndexOfId":I
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$category":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_a
    move/from16 v36, v0

    move/from16 v38, v2

    move/from16 v34, v6

    .line 478
    .end local v0    # "_columnIndexOfCreatedAt":I
    .end local v2    # "_columnIndexOfUpdatedAt":I
    .end local v6    # "_columnIndexOfId":I
    .end local v7    # "_columnIndexOfTimestamp":I
    .end local v8    # "_columnIndexOfTimezone":I
    .end local v9    # "_columnIndexOfGpsLat":I
    .end local v10    # "_columnIndexOfGpsLon":I
    .end local v11    # "_columnIndexOfGpsAccuracy":I
    .end local v12    # "_columnIndexOfCategory":I
    .end local v13    # "_columnIndexOfLocationName":I
    .end local v14    # "_columnIndexOfComment":I
    .end local v15    # "_columnIndexOfTags":I
    .end local v16    # "_argIndex":I
    .end local v18    # "_result":Ljava/util/List;
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 479
    return-object v18

    .line 478
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final getByDateRange$lambda$7(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Ljava/time/Instant;Ljava/time/Instant;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 41
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p2, "$start"    # Ljava/time/Instant;
    .param p3, "$end"    # Ljava/time/Instant;
    .param p4, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    const-string v0, "_connection"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 606
    move-object/from16 v3, p0

    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v4

    .line 607
    .local v4, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 608
    const/4 v0, 0x1

    .line 609
    .local v0, "_argIndex":I
    :try_start_0
    iget-object v5, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    move-object/from16 v6, p2

    invoke-virtual {v5, v6}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v5

    .line 610
    .local v5, "_tmp":Ljava/lang/Long;
    if-nez v5, :cond_0

    .line 611
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 613
    :cond_0
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {v4, v0, v7, v8}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 615
    :goto_0
    const/4 v0, 0x2

    .line 616
    iget-object v7, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    move-object/from16 v8, p3

    invoke-virtual {v7, v8}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v7

    .line 617
    .local v7, "_tmp_1":Ljava/lang/Long;
    if-nez v7, :cond_1

    .line 618
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 620
    :cond_1
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-interface {v4, v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 622
    :goto_1
    const-string v9, "id"

    invoke-static {v4, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 623
    .local v9, "_columnIndexOfId":I
    const-string v10, "timestamp"

    invoke-static {v4, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 624
    .local v10, "_columnIndexOfTimestamp":I
    const-string v11, "timezone"

    invoke-static {v4, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 625
    .local v11, "_columnIndexOfTimezone":I
    const-string v12, "gpsLat"

    invoke-static {v4, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 626
    .local v12, "_columnIndexOfGpsLat":I
    const-string v13, "gpsLon"

    invoke-static {v4, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 627
    .local v13, "_columnIndexOfGpsLon":I
    const-string v14, "gpsAccuracy"

    invoke-static {v4, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 628
    .local v14, "_columnIndexOfGpsAccuracy":I
    const-string v15, "category"

    invoke-static {v4, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 629
    .local v15, "_columnIndexOfCategory":I
    move/from16 v16, v0

    .end local v0    # "_argIndex":I
    .local v16, "_argIndex":I
    const-string v0, "locationName"

    invoke-static {v4, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 630
    .local v0, "_columnIndexOfLocationName":I
    const-string v2, "comment"

    invoke-static {v4, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 631
    .local v2, "_columnIndexOfComment":I
    const-string v3, "tags"

    invoke-static {v4, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 632
    .local v3, "_columnIndexOfTags":I
    move-object/from16 v17, v5

    .end local v5    # "_tmp":Ljava/lang/Long;
    .local v17, "_tmp":Ljava/lang/Long;
    const-string v5, "createdAt"

    invoke-static {v4, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 633
    .local v5, "_columnIndexOfCreatedAt":I
    const-string v6, "updatedAt"

    invoke-static {v4, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 634
    .local v6, "_columnIndexOfUpdatedAt":I
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    check-cast v18, Ljava/util/List;

    move-object/from16 v19, v18

    .line 635
    .local v19, "_result":Ljava/util/List;
    :goto_2
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v18

    if-eqz v18, :cond_c

    .line 636
    const/16 v18, 0x0

    .line 637
    .local v18, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v20, 0x0

    .line 638
    .local v20, "_tmpId":Ljava/lang/String;
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v23, v21

    .line 639
    .end local v20    # "_tmpId":Ljava/lang/String;
    .local v23, "_tmpId":Ljava/lang/String;
    const/16 v20, 0x0

    .line 640
    .local v20, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v21, 0x0

    .line 641
    .local v21, "_tmp_2":Ljava/lang/Long;
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_2

    .line 642
    const/16 v21, 0x0

    move-object/from16 v35, v7

    move-object/from16 v7, v21

    goto :goto_3

    .line 644
    :cond_2
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v21, v22

    move-object/from16 v35, v7

    move-object/from16 v7, v21

    .line 646
    .end local v21    # "_tmp_2":Ljava/lang/Long;
    .local v7, "_tmp_2":Ljava/lang/Long;
    .local v35, "_tmp_1":Ljava/lang/Long;
    :goto_3
    iget-object v8, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v8, v7}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 647
    .local v8, "_tmp_3":Ljava/time/Instant;
    const-string v21, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    if-eqz v8, :cond_b

    .line 650
    move-object/from16 v24, v8

    .line 652
    .end local v20    # "_tmpTimestamp":Ljava/time/Instant;
    .local v24, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v20, 0x0

    .line 653
    .local v20, "_tmpTimezone":Ljava/lang/String;
    :try_start_1
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v25

    .line 654
    .end local v20    # "_tmpTimezone":Ljava/lang/String;
    .local v25, "_tmpTimezone":Ljava/lang/String;
    const/16 v20, 0x0

    .line 655
    .local v20, "_tmpGpsLat":Ljava/lang/Double;
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_3

    .line 656
    const/16 v20, 0x0

    move-object/from16 v26, v20

    goto :goto_4

    .line 658
    :cond_3
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v22

    move-object/from16 v20, v22

    move-object/from16 v26, v20

    .line 660
    .end local v20    # "_tmpGpsLat":Ljava/lang/Double;
    .local v26, "_tmpGpsLat":Ljava/lang/Double;
    :goto_4
    const/16 v20, 0x0

    .line 661
    .local v20, "_tmpGpsLon":Ljava/lang/Double;
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_4

    .line 662
    const/16 v20, 0x0

    move-object/from16 v27, v20

    goto :goto_5

    .line 664
    :cond_4
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v27

    invoke-static/range {v27 .. v28}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v22

    move-object/from16 v20, v22

    move-object/from16 v27, v20

    .line 666
    .end local v20    # "_tmpGpsLon":Ljava/lang/Double;
    .local v27, "_tmpGpsLon":Ljava/lang/Double;
    :goto_5
    const/16 v20, 0x0

    .line 667
    .local v20, "_tmpGpsAccuracy":Ljava/lang/Float;
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_5

    .line 668
    const/16 v20, 0x0

    move-object/from16 v36, v7

    move-object/from16 v37, v8

    move-object/from16 v28, v20

    goto :goto_6

    .line 670
    :cond_5
    move-object/from16 v36, v7

    move-object/from16 v37, v8

    .end local v7    # "_tmp_2":Ljava/lang/Long;
    .end local v8    # "_tmp_3":Ljava/time/Instant;
    .local v36, "_tmp_2":Ljava/lang/Long;
    .local v37, "_tmp_3":Ljava/time/Instant;
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v7

    double-to-float v7, v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    move-object/from16 v20, v7

    move-object/from16 v28, v20

    .line 672
    .end local v20    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .local v28, "_tmpGpsAccuracy":Ljava/lang/Float;
    :goto_6
    const/4 v7, 0x0

    .line 673
    .local v7, "_tmpCategory":Ljava/lang/String;
    invoke-interface {v4, v15}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v29

    .line 674
    .end local v7    # "_tmpCategory":Ljava/lang/String;
    .local v29, "_tmpCategory":Ljava/lang/String;
    const/4 v7, 0x0

    .line 675
    .local v7, "_tmpLocationName":Ljava/lang/String;
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 676
    const/4 v7, 0x0

    move-object/from16 v30, v7

    goto :goto_7

    .line 678
    :cond_6
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v8

    move-object v7, v8

    move-object/from16 v30, v7

    .line 680
    .end local v7    # "_tmpLocationName":Ljava/lang/String;
    .local v30, "_tmpLocationName":Ljava/lang/String;
    :goto_7
    const/4 v7, 0x0

    .line 681
    .local v7, "_tmpComment":Ljava/lang/String;
    invoke-interface {v4, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v31

    .line 682
    .end local v7    # "_tmpComment":Ljava/lang/String;
    .local v31, "_tmpComment":Ljava/lang/String;
    const/4 v7, 0x0

    .line 683
    .local v7, "_tmpTags":Ljava/lang/String;
    invoke-interface {v4, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v32

    .line 684
    .end local v7    # "_tmpTags":Ljava/lang/String;
    .local v32, "_tmpTags":Ljava/lang/String;
    const/4 v7, 0x0

    .line 685
    .local v7, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v8, 0x0

    .line 686
    .local v8, "_tmp_4":Ljava/lang/Long;
    invoke-interface {v4, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_7

    .line 687
    const/4 v8, 0x0

    goto :goto_8

    .line 689
    :cond_7
    invoke-interface {v4, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v33

    invoke-static/range {v33 .. v34}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v8, v20

    .line 691
    :goto_8
    move/from16 v38, v0

    .end local v0    # "_columnIndexOfLocationName":I
    .local v38, "_columnIndexOfLocationName":I
    iget-object v0, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v8}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 692
    .local v0, "_tmp_5":Ljava/time/Instant;
    if-eqz v0, :cond_a

    .line 695
    move-object/from16 v33, v0

    .line 697
    .end local v7    # "_tmpCreatedAt":Ljava/time/Instant;
    .local v33, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v7, 0x0

    .line 698
    .local v7, "_tmpUpdatedAt":Ljava/time/Instant;
    const/16 v20, 0x0

    .line 699
    .local v20, "_tmp_6":Ljava/lang/Long;
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_8

    .line 700
    const/16 v20, 0x0

    move-object/from16 v39, v0

    move-object/from16 v0, v20

    goto :goto_9

    .line 702
    :cond_8
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v39

    invoke-static/range {v39 .. v40}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v20, v22

    move-object/from16 v39, v0

    move-object/from16 v0, v20

    .line 704
    .end local v20    # "_tmp_6":Ljava/lang/Long;
    .local v0, "_tmp_6":Ljava/lang/Long;
    .local v39, "_tmp_5":Ljava/time/Instant;
    :goto_9
    move/from16 v40, v2

    .end local v2    # "_columnIndexOfComment":I
    .local v40, "_columnIndexOfComment":I
    iget-object v2, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v2, v0}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v2

    .line 705
    .local v2, "_tmp_7":Ljava/time/Instant;
    if-eqz v2, :cond_9

    .line 708
    move-object/from16 v34, v2

    .line 710
    .end local v7    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v34, "_tmpUpdatedAt":Ljava/time/Instant;
    new-instance v22, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct/range {v22 .. v34}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    move-object/from16 v7, v22

    .line 711
    .end local v18    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .local v7, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    move-object/from16 v20, v0

    move-object/from16 v0, v19

    .end local v19    # "_result":Ljava/util/List;
    .local v0, "_result":Ljava/util/List;
    .restart local v20    # "_tmp_6":Ljava/lang/Long;
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v8, p3

    move-object/from16 v19, v0

    move-object/from16 v7, v35

    move/from16 v0, v38

    move/from16 v2, v40

    goto/16 :goto_2

    .line 705
    .end local v20    # "_tmp_6":Ljava/lang/Long;
    .end local v34    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v0, "_tmp_6":Ljava/lang/Long;
    .local v7, "_tmpUpdatedAt":Ljava/time/Instant;
    .restart local v18    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v19    # "_result":Ljava/util/List;
    :cond_9
    move-object/from16 v20, v0

    move-object/from16 v0, v19

    .end local v0    # "_tmp_6":Ljava/lang/Long;
    .restart local v20    # "_tmp_6":Ljava/lang/Long;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 706
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p2    # "$start":Ljava/time/Instant;
    .end local p3    # "$end":Ljava/time/Instant;
    .end local p4    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 692
    .end local v20    # "_tmp_6":Ljava/lang/Long;
    .end local v33    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v39    # "_tmp_5":Ljava/time/Instant;
    .end local v40    # "_columnIndexOfComment":I
    .local v0, "_tmp_5":Ljava/time/Instant;
    .local v2, "_columnIndexOfComment":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v7, "_tmpCreatedAt":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p2    # "$start":Ljava/time/Instant;
    .restart local p3    # "$end":Ljava/time/Instant;
    .restart local p4    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_a
    move-object/from16 v39, v0

    move/from16 v40, v2

    .end local v0    # "_tmp_5":Ljava/time/Instant;
    .end local v2    # "_columnIndexOfComment":I
    .restart local v39    # "_tmp_5":Ljava/time/Instant;
    .restart local v40    # "_columnIndexOfComment":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 693
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p2    # "$start":Ljava/time/Instant;
    .end local p3    # "$end":Ljava/time/Instant;
    .end local p4    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 647
    .end local v24    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v25    # "_tmpTimezone":Ljava/lang/String;
    .end local v26    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v27    # "_tmpGpsLon":Ljava/lang/Double;
    .end local v28    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .end local v29    # "_tmpCategory":Ljava/lang/String;
    .end local v30    # "_tmpLocationName":Ljava/lang/String;
    .end local v31    # "_tmpComment":Ljava/lang/String;
    .end local v32    # "_tmpTags":Ljava/lang/String;
    .end local v36    # "_tmp_2":Ljava/lang/Long;
    .end local v37    # "_tmp_3":Ljava/time/Instant;
    .end local v38    # "_columnIndexOfLocationName":I
    .end local v39    # "_tmp_5":Ljava/time/Instant;
    .end local v40    # "_columnIndexOfComment":I
    .local v0, "_columnIndexOfLocationName":I
    .restart local v2    # "_columnIndexOfComment":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v7, "_tmp_2":Ljava/lang/Long;
    .local v8, "_tmp_3":Ljava/time/Instant;
    .local v20, "_tmpTimestamp":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p2    # "$start":Ljava/time/Instant;
    .restart local p3    # "$end":Ljava/time/Instant;
    .restart local p4    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_b
    move/from16 v38, v0

    move/from16 v40, v2

    move-object/from16 v36, v7

    move-object/from16 v37, v8

    .end local v0    # "_columnIndexOfLocationName":I
    .end local v2    # "_columnIndexOfComment":I
    .end local v7    # "_tmp_2":Ljava/lang/Long;
    .end local v8    # "_tmp_3":Ljava/time/Instant;
    .restart local v36    # "_tmp_2":Ljava/lang/Long;
    .restart local v37    # "_tmp_3":Ljava/time/Instant;
    .restart local v38    # "_columnIndexOfLocationName":I
    .restart local v40    # "_columnIndexOfComment":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 648
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p2    # "$start":Ljava/time/Instant;
    .end local p3    # "$end":Ljava/time/Instant;
    .end local p4    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 713
    .end local v18    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v20    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v23    # "_tmpId":Ljava/lang/String;
    .end local v35    # "_tmp_1":Ljava/lang/Long;
    .end local v36    # "_tmp_2":Ljava/lang/Long;
    .end local v37    # "_tmp_3":Ljava/time/Instant;
    .end local v38    # "_columnIndexOfLocationName":I
    .end local v40    # "_columnIndexOfComment":I
    .restart local v0    # "_columnIndexOfLocationName":I
    .restart local v2    # "_columnIndexOfComment":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v7, "_tmp_1":Ljava/lang/Long;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p2    # "$start":Ljava/time/Instant;
    .restart local p3    # "$end":Ljava/time/Instant;
    .restart local p4    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_c
    move/from16 v38, v0

    move/from16 v40, v2

    move-object/from16 v35, v7

    .line 715
    .end local v0    # "_columnIndexOfLocationName":I
    .end local v2    # "_columnIndexOfComment":I
    .end local v3    # "_columnIndexOfTags":I
    .end local v5    # "_columnIndexOfCreatedAt":I
    .end local v6    # "_columnIndexOfUpdatedAt":I
    .end local v7    # "_tmp_1":Ljava/lang/Long;
    .end local v9    # "_columnIndexOfId":I
    .end local v10    # "_columnIndexOfTimestamp":I
    .end local v11    # "_columnIndexOfTimezone":I
    .end local v12    # "_columnIndexOfGpsLat":I
    .end local v13    # "_columnIndexOfGpsLon":I
    .end local v14    # "_columnIndexOfGpsAccuracy":I
    .end local v15    # "_columnIndexOfCategory":I
    .end local v16    # "_argIndex":I
    .end local v17    # "_tmp":Ljava/lang/Long;
    .end local v19    # "_result":Ljava/util/List;
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 716
    return-object v19

    .line 715
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final getById$lambda$4(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Landroidx/sqlite/SQLiteConnection;)Lcom/hardlineforge/lala/data/LogEntry;
    .locals 38
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$id"    # Ljava/lang/String;
    .param p2, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p3, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    const-string v0, "_connection"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 276
    move-object/from16 v3, p0

    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v4

    .line 277
    .local v4, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 278
    const/4 v0, 0x1

    .line 279
    .local v0, "_argIndex":I
    move-object/from16 v5, p1

    :try_start_0
    invoke-interface {v4, v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 280
    const-string v6, "id"

    invoke-static {v4, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 281
    .local v6, "_columnIndexOfId":I
    const-string v7, "timestamp"

    invoke-static {v4, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 282
    .local v7, "_columnIndexOfTimestamp":I
    const-string v8, "timezone"

    invoke-static {v4, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 283
    .local v8, "_columnIndexOfTimezone":I
    const-string v9, "gpsLat"

    invoke-static {v4, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 284
    .local v9, "_columnIndexOfGpsLat":I
    const-string v10, "gpsLon"

    invoke-static {v4, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 285
    .local v10, "_columnIndexOfGpsLon":I
    const-string v11, "gpsAccuracy"

    invoke-static {v4, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 286
    .local v11, "_columnIndexOfGpsAccuracy":I
    const-string v12, "category"

    invoke-static {v4, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 287
    .local v12, "_columnIndexOfCategory":I
    const-string v13, "locationName"

    invoke-static {v4, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 288
    .local v13, "_columnIndexOfLocationName":I
    const-string v14, "comment"

    invoke-static {v4, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 289
    .local v14, "_columnIndexOfComment":I
    const-string v15, "tags"

    invoke-static {v4, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 290
    .local v15, "_columnIndexOfTags":I
    move/from16 v16, v0

    .end local v0    # "_argIndex":I
    .local v16, "_argIndex":I
    const-string v0, "createdAt"

    invoke-static {v4, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 291
    .local v0, "_columnIndexOfCreatedAt":I
    const-string v2, "updatedAt"

    invoke-static {v4, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 292
    .local v2, "_columnIndexOfUpdatedAt":I
    const/16 v17, 0x0

    .line 293
    .local v17, "_result":Lcom/hardlineforge/lala/data/LogEntry;
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v18

    if-eqz v18, :cond_a

    .line 294
    const/16 v18, 0x0

    .line 295
    .local v18, "_tmpId":Ljava/lang/String;
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v21, v19

    .line 296
    .end local v18    # "_tmpId":Ljava/lang/String;
    .local v21, "_tmpId":Ljava/lang/String;
    const/16 v18, 0x0

    .line 297
    .local v18, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v19, 0x0

    .line 298
    .local v19, "_tmp":Ljava/lang/Long;
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 299
    const/16 v19, 0x0

    move-object/from16 v3, v19

    goto :goto_0

    .line 301
    :cond_0
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v19, v20

    move-object/from16 v3, v19

    .line 303
    .end local v19    # "_tmp":Ljava/lang/Long;
    .local v3, "_tmp":Ljava/lang/Long;
    :goto_0
    iget-object v5, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v5, v3}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    .local v5, "_tmp_1":Ljava/time/Instant;
    const-string v19, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    if-eqz v5, :cond_9

    .line 307
    move-object/from16 v22, v5

    .line 309
    .end local v18    # "_tmpTimestamp":Ljava/time/Instant;
    .local v22, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v18, 0x0

    .line 310
    .local v18, "_tmpTimezone":Ljava/lang/String;
    :try_start_1
    invoke-interface {v4, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v23

    .line 311
    .end local v18    # "_tmpTimezone":Ljava/lang/String;
    .local v23, "_tmpTimezone":Ljava/lang/String;
    const/16 v18, 0x0

    .line 312
    .local v18, "_tmpGpsLat":Ljava/lang/Double;
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 313
    const/16 v18, 0x0

    move-object/from16 v24, v18

    goto :goto_1

    .line 315
    :cond_1
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v20

    move-object/from16 v18, v20

    move-object/from16 v24, v18

    .line 317
    .end local v18    # "_tmpGpsLat":Ljava/lang/Double;
    .local v24, "_tmpGpsLat":Ljava/lang/Double;
    :goto_1
    const/16 v18, 0x0

    .line 318
    .local v18, "_tmpGpsLon":Ljava/lang/Double;
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 319
    const/16 v18, 0x0

    move-object/from16 v25, v18

    goto :goto_2

    .line 321
    :cond_2
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v20

    move-object/from16 v18, v20

    move-object/from16 v25, v18

    .line 323
    .end local v18    # "_tmpGpsLon":Ljava/lang/Double;
    .local v25, "_tmpGpsLon":Ljava/lang/Double;
    :goto_2
    const/16 v18, 0x0

    .line 324
    .local v18, "_tmpGpsAccuracy":Ljava/lang/Float;
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 325
    const/16 v18, 0x0

    move-object/from16 v34, v5

    move/from16 v33, v6

    move-object/from16 v26, v18

    goto :goto_3

    .line 327
    :cond_3
    move-object/from16 v34, v5

    move/from16 v33, v6

    .end local v5    # "_tmp_1":Ljava/time/Instant;
    .end local v6    # "_columnIndexOfId":I
    .local v33, "_columnIndexOfId":I
    .local v34, "_tmp_1":Ljava/time/Instant;
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v5

    double-to-float v5, v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    move-object/from16 v18, v5

    move-object/from16 v26, v18

    .line 329
    .end local v18    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .local v26, "_tmpGpsAccuracy":Ljava/lang/Float;
    :goto_3
    const/4 v5, 0x0

    .line 330
    .local v5, "_tmpCategory":Ljava/lang/String;
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v27

    .line 331
    .end local v5    # "_tmpCategory":Ljava/lang/String;
    .local v27, "_tmpCategory":Ljava/lang/String;
    const/4 v5, 0x0

    .line 332
    .local v5, "_tmpLocationName":Ljava/lang/String;
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 333
    const/4 v5, 0x0

    move-object/from16 v28, v5

    goto :goto_4

    .line 335
    :cond_4
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    move-object/from16 v28, v5

    .line 337
    .end local v5    # "_tmpLocationName":Ljava/lang/String;
    .local v28, "_tmpLocationName":Ljava/lang/String;
    :goto_4
    const/4 v5, 0x0

    .line 338
    .local v5, "_tmpComment":Ljava/lang/String;
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v29

    .line 339
    .end local v5    # "_tmpComment":Ljava/lang/String;
    .local v29, "_tmpComment":Ljava/lang/String;
    const/4 v5, 0x0

    .line 340
    .local v5, "_tmpTags":Ljava/lang/String;
    invoke-interface {v4, v15}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v30

    .line 341
    .end local v5    # "_tmpTags":Ljava/lang/String;
    .local v30, "_tmpTags":Ljava/lang/String;
    const/4 v5, 0x0

    .line 342
    .local v5, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v6, 0x0

    .line 343
    .local v6, "_tmp_2":Ljava/lang/Long;
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 344
    const/4 v6, 0x0

    goto :goto_5

    .line 346
    :cond_5
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v6, v18

    .line 348
    :goto_5
    move/from16 v35, v0

    .end local v0    # "_columnIndexOfCreatedAt":I
    .local v35, "_columnIndexOfCreatedAt":I
    iget-object v0, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v6}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 349
    .local v0, "_tmp_3":Ljava/time/Instant;
    if-eqz v0, :cond_8

    .line 352
    move-object/from16 v31, v0

    .line 354
    .end local v5    # "_tmpCreatedAt":Ljava/time/Instant;
    .local v31, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v5, 0x0

    .line 355
    .local v5, "_tmpUpdatedAt":Ljava/time/Instant;
    const/16 v18, 0x0

    .line 356
    .local v18, "_tmp_4":Ljava/lang/Long;
    invoke-interface {v4, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_6

    .line 357
    const/16 v18, 0x0

    move-object/from16 v36, v0

    move-object/from16 v0, v18

    goto :goto_6

    .line 359
    :cond_6
    invoke-interface {v4, v2}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v36

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v18, v20

    move-object/from16 v36, v0

    move-object/from16 v0, v18

    .line 361
    .end local v18    # "_tmp_4":Ljava/lang/Long;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .local v36, "_tmp_3":Ljava/time/Instant;
    :goto_6
    move/from16 v37, v2

    .end local v2    # "_columnIndexOfUpdatedAt":I
    .local v37, "_columnIndexOfUpdatedAt":I
    iget-object v2, v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v2, v0}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v2

    .line 362
    .local v2, "_tmp_5":Ljava/time/Instant;
    if-eqz v2, :cond_7

    .line 365
    move-object/from16 v32, v2

    .line 367
    .end local v5    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v32, "_tmpUpdatedAt":Ljava/time/Instant;
    new-instance v20, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct/range {v20 .. v32}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    .end local v0    # "_tmp_4":Ljava/lang/Long;
    .end local v2    # "_tmp_5":Ljava/time/Instant;
    .end local v3    # "_tmp":Ljava/lang/Long;
    .end local v6    # "_tmp_2":Ljava/lang/Long;
    .end local v17    # "_result":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v21    # "_tmpId":Ljava/lang/String;
    .end local v22    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v23    # "_tmpTimezone":Ljava/lang/String;
    .end local v24    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v25    # "_tmpGpsLon":Ljava/lang/Double;
    .end local v26    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .end local v27    # "_tmpCategory":Ljava/lang/String;
    .end local v28    # "_tmpLocationName":Ljava/lang/String;
    .end local v29    # "_tmpComment":Ljava/lang/String;
    .end local v30    # "_tmpTags":Ljava/lang/String;
    .end local v31    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v32    # "_tmpUpdatedAt":Ljava/time/Instant;
    .end local v34    # "_tmp_1":Ljava/time/Instant;
    .end local v36    # "_tmp_3":Ljava/time/Instant;
    .local v20, "_result":Lcom/hardlineforge/lala/data/LogEntry;
    goto :goto_7

    .line 362
    .end local v20    # "_result":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v0    # "_tmp_4":Ljava/lang/Long;
    .restart local v2    # "_tmp_5":Ljava/time/Instant;
    .restart local v3    # "_tmp":Ljava/lang/Long;
    .restart local v5    # "_tmpUpdatedAt":Ljava/time/Instant;
    .restart local v6    # "_tmp_2":Ljava/lang/Long;
    .restart local v17    # "_result":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v21    # "_tmpId":Ljava/lang/String;
    .restart local v22    # "_tmpTimestamp":Ljava/time/Instant;
    .restart local v23    # "_tmpTimezone":Ljava/lang/String;
    .restart local v24    # "_tmpGpsLat":Ljava/lang/Double;
    .restart local v25    # "_tmpGpsLon":Ljava/lang/Double;
    .restart local v26    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .restart local v27    # "_tmpCategory":Ljava/lang/String;
    .restart local v28    # "_tmpLocationName":Ljava/lang/String;
    .restart local v29    # "_tmpComment":Ljava/lang/String;
    .restart local v30    # "_tmpTags":Ljava/lang/String;
    .restart local v31    # "_tmpCreatedAt":Ljava/time/Instant;
    .restart local v34    # "_tmp_1":Ljava/time/Instant;
    .restart local v36    # "_tmp_3":Ljava/time/Instant;
    :cond_7
    move-object/from16 v18, v0

    .end local v0    # "_tmp_4":Ljava/lang/Long;
    .restart local v18    # "_tmp_4":Ljava/lang/Long;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 363
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$id":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 349
    .end local v18    # "_tmp_4":Ljava/lang/Long;
    .end local v31    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v36    # "_tmp_3":Ljava/time/Instant;
    .end local v37    # "_columnIndexOfUpdatedAt":I
    .local v0, "_tmp_3":Ljava/time/Instant;
    .local v2, "_columnIndexOfUpdatedAt":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v5, "_tmpCreatedAt":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$id":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_8
    move-object/from16 v36, v0

    move/from16 v37, v2

    .end local v0    # "_tmp_3":Ljava/time/Instant;
    .end local v2    # "_columnIndexOfUpdatedAt":I
    .restart local v36    # "_tmp_3":Ljava/time/Instant;
    .restart local v37    # "_columnIndexOfUpdatedAt":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 350
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$id":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 304
    .end local v22    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v23    # "_tmpTimezone":Ljava/lang/String;
    .end local v24    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v25    # "_tmpGpsLon":Ljava/lang/Double;
    .end local v26    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .end local v27    # "_tmpCategory":Ljava/lang/String;
    .end local v28    # "_tmpLocationName":Ljava/lang/String;
    .end local v29    # "_tmpComment":Ljava/lang/String;
    .end local v30    # "_tmpTags":Ljava/lang/String;
    .end local v33    # "_columnIndexOfId":I
    .end local v34    # "_tmp_1":Ljava/time/Instant;
    .end local v35    # "_columnIndexOfCreatedAt":I
    .end local v36    # "_tmp_3":Ljava/time/Instant;
    .end local v37    # "_columnIndexOfUpdatedAt":I
    .local v0, "_columnIndexOfCreatedAt":I
    .restart local v2    # "_columnIndexOfUpdatedAt":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v5, "_tmp_1":Ljava/time/Instant;
    .local v6, "_columnIndexOfId":I
    .local v18, "_tmpTimestamp":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$id":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_9
    move/from16 v35, v0

    move/from16 v37, v2

    move-object/from16 v34, v5

    move/from16 v33, v6

    .end local v0    # "_columnIndexOfCreatedAt":I
    .end local v2    # "_columnIndexOfUpdatedAt":I
    .end local v5    # "_tmp_1":Ljava/time/Instant;
    .end local v6    # "_columnIndexOfId":I
    .restart local v33    # "_columnIndexOfId":I
    .restart local v34    # "_tmp_1":Ljava/time/Instant;
    .restart local v35    # "_columnIndexOfCreatedAt":I
    .restart local v37    # "_columnIndexOfUpdatedAt":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 305
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$id":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 369
    .end local v3    # "_tmp":Ljava/lang/Long;
    .end local v18    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v21    # "_tmpId":Ljava/lang/String;
    .end local v33    # "_columnIndexOfId":I
    .end local v34    # "_tmp_1":Ljava/time/Instant;
    .end local v35    # "_columnIndexOfCreatedAt":I
    .end local v37    # "_columnIndexOfUpdatedAt":I
    .restart local v0    # "_columnIndexOfCreatedAt":I
    .restart local v2    # "_columnIndexOfUpdatedAt":I
    .restart local v4    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local v6    # "_columnIndexOfId":I
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$id":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_a
    move/from16 v35, v0

    move/from16 v37, v2

    move/from16 v33, v6

    .end local v0    # "_columnIndexOfCreatedAt":I
    .end local v2    # "_columnIndexOfUpdatedAt":I
    .end local v6    # "_columnIndexOfId":I
    .restart local v33    # "_columnIndexOfId":I
    .restart local v35    # "_columnIndexOfCreatedAt":I
    .restart local v37    # "_columnIndexOfUpdatedAt":I
    const/16 v20, 0x0

    .line 371
    .end local v17    # "_result":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v20    # "_result":Lcom/hardlineforge/lala/data/LogEntry;
    :goto_7
    nop

    .line 373
    .end local v7    # "_columnIndexOfTimestamp":I
    .end local v8    # "_columnIndexOfTimezone":I
    .end local v9    # "_columnIndexOfGpsLat":I
    .end local v10    # "_columnIndexOfGpsLon":I
    .end local v11    # "_columnIndexOfGpsAccuracy":I
    .end local v12    # "_columnIndexOfCategory":I
    .end local v13    # "_columnIndexOfLocationName":I
    .end local v14    # "_columnIndexOfComment":I
    .end local v15    # "_columnIndexOfTags":I
    .end local v16    # "_argIndex":I
    .end local v20    # "_result":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v33    # "_columnIndexOfId":I
    .end local v35    # "_columnIndexOfCreatedAt":I
    .end local v37    # "_columnIndexOfUpdatedAt":I
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 374
    return-object v20

    .line 373
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final insert$lambda$0(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;Landroidx/sqlite/SQLiteConnection;)J
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p1, "$entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__insertAdapterOfLogEntry:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insertAndReturnId(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)J

    move-result-wide v0

    .line 159
    .local v0, "_result":J
    return-wide v0
.end method

.method static final search$lambda$6(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 39
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$query"    # Ljava/lang/String;
    .param p2, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p3, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const-string v0, "_connection"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 495
    move-object/from16 v4, p0

    invoke-interface {v3, v4}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v5

    .line 496
    .local v5, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 497
    const/4 v0, 0x1

    .line 498
    .local v0, "_argIndex":I
    :try_start_0
    invoke-interface {v5, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 499
    const/4 v0, 0x2

    .line 500
    invoke-interface {v5, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 501
    const/4 v0, 0x3

    .line 502
    invoke-interface {v5, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 503
    const/4 v0, 0x4

    .line 504
    invoke-interface {v5, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 505
    const-string v6, "id"

    invoke-static {v5, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 506
    .local v6, "_columnIndexOfId":I
    const-string v7, "timestamp"

    invoke-static {v5, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 507
    .local v7, "_columnIndexOfTimestamp":I
    const-string v8, "timezone"

    invoke-static {v5, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 508
    .local v8, "_columnIndexOfTimezone":I
    const-string v9, "gpsLat"

    invoke-static {v5, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 509
    .local v9, "_columnIndexOfGpsLat":I
    const-string v10, "gpsLon"

    invoke-static {v5, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 510
    .local v10, "_columnIndexOfGpsLon":I
    const-string v11, "gpsAccuracy"

    invoke-static {v5, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 511
    .local v11, "_columnIndexOfGpsAccuracy":I
    const-string v12, "category"

    invoke-static {v5, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 512
    .local v12, "_columnIndexOfCategory":I
    const-string v13, "locationName"

    invoke-static {v5, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 513
    .local v13, "_columnIndexOfLocationName":I
    const-string v14, "comment"

    invoke-static {v5, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 514
    .local v14, "_columnIndexOfComment":I
    const-string v15, "tags"

    invoke-static {v5, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 515
    .local v15, "_columnIndexOfTags":I
    move/from16 v16, v0

    .end local v0    # "_argIndex":I
    .local v16, "_argIndex":I
    const-string v0, "createdAt"

    invoke-static {v5, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 516
    .local v0, "_columnIndexOfCreatedAt":I
    const-string v1, "updatedAt"

    invoke-static {v5, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 517
    .local v1, "_columnIndexOfUpdatedAt":I
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    check-cast v17, Ljava/util/List;

    move-object/from16 v18, v17

    .line 518
    .local v18, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v5}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v17

    if-eqz v17, :cond_a

    .line 519
    const/16 v17, 0x0

    .line 520
    .local v17, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v19, 0x0

    .line 521
    .local v19, "_tmpId":Ljava/lang/String;
    invoke-interface {v5, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v22, v20

    .line 522
    .end local v19    # "_tmpId":Ljava/lang/String;
    .local v22, "_tmpId":Ljava/lang/String;
    const/16 v19, 0x0

    .line 523
    .local v19, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v20, 0x0

    .line 524
    .local v20, "_tmp":Ljava/lang/Long;
    invoke-interface {v5, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 525
    const/16 v20, 0x0

    move-object/from16 v3, v20

    goto :goto_1

    .line 527
    :cond_0
    invoke-interface {v5, v7}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v20, v21

    move-object/from16 v3, v20

    .line 529
    .end local v20    # "_tmp":Ljava/lang/Long;
    .local v3, "_tmp":Ljava/lang/Long;
    :goto_1
    iget-object v4, v2, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v4, v3}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 530
    .local v4, "_tmp_1":Ljava/time/Instant;
    const-string v20, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    if-eqz v4, :cond_9

    .line 533
    move-object/from16 v23, v4

    .line 535
    .end local v19    # "_tmpTimestamp":Ljava/time/Instant;
    .local v23, "_tmpTimestamp":Ljava/time/Instant;
    const/16 v19, 0x0

    .line 536
    .local v19, "_tmpTimezone":Ljava/lang/String;
    :try_start_1
    invoke-interface {v5, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v24

    .line 537
    .end local v19    # "_tmpTimezone":Ljava/lang/String;
    .local v24, "_tmpTimezone":Ljava/lang/String;
    const/16 v19, 0x0

    .line 538
    .local v19, "_tmpGpsLat":Ljava/lang/Double;
    invoke-interface {v5, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_1

    .line 539
    const/16 v19, 0x0

    move-object/from16 v25, v19

    goto :goto_2

    .line 541
    :cond_1
    invoke-interface {v5, v9}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v21

    move-object/from16 v19, v21

    move-object/from16 v25, v19

    .line 543
    .end local v19    # "_tmpGpsLat":Ljava/lang/Double;
    .local v25, "_tmpGpsLat":Ljava/lang/Double;
    :goto_2
    const/16 v19, 0x0

    .line 544
    .local v19, "_tmpGpsLon":Ljava/lang/Double;
    invoke-interface {v5, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_2

    .line 545
    const/16 v19, 0x0

    move-object/from16 v26, v19

    goto :goto_3

    .line 547
    :cond_2
    invoke-interface {v5, v10}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v21

    move-object/from16 v19, v21

    move-object/from16 v26, v19

    .line 549
    .end local v19    # "_tmpGpsLon":Ljava/lang/Double;
    .local v26, "_tmpGpsLon":Ljava/lang/Double;
    :goto_3
    const/16 v19, 0x0

    .line 550
    .local v19, "_tmpGpsAccuracy":Ljava/lang/Float;
    invoke-interface {v5, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 551
    const/16 v19, 0x0

    move-object/from16 v34, v3

    move-object/from16 v35, v4

    move-object/from16 v27, v19

    goto :goto_4

    .line 553
    :cond_3
    move-object/from16 v34, v3

    move-object/from16 v35, v4

    .end local v3    # "_tmp":Ljava/lang/Long;
    .end local v4    # "_tmp_1":Ljava/time/Instant;
    .local v34, "_tmp":Ljava/lang/Long;
    .local v35, "_tmp_1":Ljava/time/Instant;
    invoke-interface {v5, v11}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v3

    double-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v19, v3

    move-object/from16 v27, v19

    .line 555
    .end local v19    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .local v27, "_tmpGpsAccuracy":Ljava/lang/Float;
    :goto_4
    const/4 v3, 0x0

    .line 556
    .local v3, "_tmpCategory":Ljava/lang/String;
    invoke-interface {v5, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v28

    .line 557
    .end local v3    # "_tmpCategory":Ljava/lang/String;
    .local v28, "_tmpCategory":Ljava/lang/String;
    const/4 v3, 0x0

    .line 558
    .local v3, "_tmpLocationName":Ljava/lang/String;
    invoke-interface {v5, v13}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 559
    const/4 v3, 0x0

    move-object/from16 v29, v3

    goto :goto_5

    .line 561
    :cond_4
    invoke-interface {v5, v13}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    move-object/from16 v29, v3

    .line 563
    .end local v3    # "_tmpLocationName":Ljava/lang/String;
    .local v29, "_tmpLocationName":Ljava/lang/String;
    :goto_5
    const/4 v3, 0x0

    .line 564
    .local v3, "_tmpComment":Ljava/lang/String;
    invoke-interface {v5, v14}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v30

    .line 565
    .end local v3    # "_tmpComment":Ljava/lang/String;
    .local v30, "_tmpComment":Ljava/lang/String;
    const/4 v3, 0x0

    .line 566
    .local v3, "_tmpTags":Ljava/lang/String;
    invoke-interface {v5, v15}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v31

    .line 567
    .end local v3    # "_tmpTags":Ljava/lang/String;
    .local v31, "_tmpTags":Ljava/lang/String;
    const/4 v3, 0x0

    .line 568
    .local v3, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v4, 0x0

    .line 569
    .local v4, "_tmp_2":Ljava/lang/Long;
    invoke-interface {v5, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 570
    const/4 v4, 0x0

    goto :goto_6

    .line 572
    :cond_5
    invoke-interface {v5, v0}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v4, v19

    .line 574
    :goto_6
    move/from16 v36, v0

    .end local v0    # "_columnIndexOfCreatedAt":I
    .local v36, "_columnIndexOfCreatedAt":I
    iget-object v0, v2, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v4}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 575
    .local v0, "_tmp_3":Ljava/time/Instant;
    if-eqz v0, :cond_8

    .line 578
    move-object/from16 v32, v0

    .line 580
    .end local v3    # "_tmpCreatedAt":Ljava/time/Instant;
    .local v32, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v3, 0x0

    .line 581
    .local v3, "_tmpUpdatedAt":Ljava/time/Instant;
    const/16 v19, 0x0

    .line 582
    .local v19, "_tmp_4":Ljava/lang/Long;
    invoke-interface {v5, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_6

    .line 583
    const/16 v19, 0x0

    move-object/from16 v37, v0

    move-object/from16 v0, v19

    goto :goto_7

    .line 585
    :cond_6
    invoke-interface {v5, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v37

    invoke-static/range {v37 .. v38}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v19, v21

    move-object/from16 v37, v0

    move-object/from16 v0, v19

    .line 587
    .end local v19    # "_tmp_4":Ljava/lang/Long;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .local v37, "_tmp_3":Ljava/time/Instant;
    :goto_7
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfUpdatedAt":I
    .local v38, "_columnIndexOfUpdatedAt":I
    iget-object v1, v2, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v1, v0}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v1

    .line 588
    .local v1, "_tmp_5":Ljava/time/Instant;
    if-eqz v1, :cond_7

    .line 591
    move-object/from16 v33, v1

    .line 593
    .end local v3    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v33, "_tmpUpdatedAt":Ljava/time/Instant;
    new-instance v21, Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct/range {v21 .. v33}, Lcom/hardlineforge/lala/data/LogEntry;-><init>(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V

    move-object/from16 v3, v21

    .line 594
    .end local v17    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .local v3, "_item":Lcom/hardlineforge/lala/data/LogEntry;
    move-object/from16 v19, v0

    move-object/from16 v0, v18

    .end local v18    # "_result":Ljava/util/List;
    .local v0, "_result":Ljava/util/List;
    .restart local v19    # "_tmp_4":Ljava/lang/Long;
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v4, p0

    move-object/from16 v3, p3

    move-object/from16 v18, v0

    move/from16 v0, v36

    move/from16 v1, v38

    goto/16 :goto_0

    .line 588
    .end local v19    # "_tmp_4":Ljava/lang/Long;
    .end local v33    # "_tmpUpdatedAt":Ljava/time/Instant;
    .local v0, "_tmp_4":Ljava/lang/Long;
    .local v3, "_tmpUpdatedAt":Ljava/time/Instant;
    .restart local v17    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v18    # "_result":Ljava/util/List;
    :cond_7
    move-object/from16 v19, v0

    move-object/from16 v0, v18

    .end local v0    # "_tmp_4":Ljava/lang/Long;
    .restart local v19    # "_tmp_4":Ljava/lang/Long;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 589
    move-object/from16 v21, v1

    .end local v1    # "_tmp_5":Ljava/time/Instant;
    .local v21, "_tmp_5":Ljava/time/Instant;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v5    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$query":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 575
    .end local v19    # "_tmp_4":Ljava/lang/Long;
    .end local v21    # "_tmp_5":Ljava/time/Instant;
    .end local v32    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v37    # "_tmp_3":Ljava/time/Instant;
    .end local v38    # "_columnIndexOfUpdatedAt":I
    .local v0, "_tmp_3":Ljava/time/Instant;
    .local v1, "_columnIndexOfUpdatedAt":I
    .local v3, "_tmpCreatedAt":Ljava/time/Instant;
    .restart local v5    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$query":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_8
    move-object/from16 v37, v0

    move/from16 v38, v1

    .end local v0    # "_tmp_3":Ljava/time/Instant;
    .end local v1    # "_columnIndexOfUpdatedAt":I
    .restart local v37    # "_tmp_3":Ljava/time/Instant;
    .restart local v38    # "_columnIndexOfUpdatedAt":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 576
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v5    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$query":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0

    .line 530
    .end local v23    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v24    # "_tmpTimezone":Ljava/lang/String;
    .end local v25    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v26    # "_tmpGpsLon":Ljava/lang/Double;
    .end local v27    # "_tmpGpsAccuracy":Ljava/lang/Float;
    .end local v28    # "_tmpCategory":Ljava/lang/String;
    .end local v29    # "_tmpLocationName":Ljava/lang/String;
    .end local v30    # "_tmpComment":Ljava/lang/String;
    .end local v31    # "_tmpTags":Ljava/lang/String;
    .end local v34    # "_tmp":Ljava/lang/Long;
    .end local v35    # "_tmp_1":Ljava/time/Instant;
    .end local v36    # "_columnIndexOfCreatedAt":I
    .end local v37    # "_tmp_3":Ljava/time/Instant;
    .end local v38    # "_columnIndexOfUpdatedAt":I
    .local v0, "_columnIndexOfCreatedAt":I
    .restart local v1    # "_columnIndexOfUpdatedAt":I
    .local v3, "_tmp":Ljava/lang/Long;
    .local v4, "_tmp_1":Ljava/time/Instant;
    .restart local v5    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .local v19, "_tmpTimestamp":Ljava/time/Instant;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$query":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_9
    move/from16 v36, v0

    move/from16 v38, v1

    move-object/from16 v34, v3

    move-object/from16 v35, v4

    .end local v0    # "_columnIndexOfCreatedAt":I
    .end local v1    # "_columnIndexOfUpdatedAt":I
    .end local v3    # "_tmp":Ljava/lang/Long;
    .end local v4    # "_tmp_1":Ljava/time/Instant;
    .restart local v34    # "_tmp":Ljava/lang/Long;
    .restart local v35    # "_tmp_1":Ljava/time/Instant;
    .restart local v36    # "_columnIndexOfCreatedAt":I
    .restart local v38    # "_columnIndexOfUpdatedAt":I
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 531
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v5    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$query":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 596
    .end local v17    # "_item":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v19    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v22    # "_tmpId":Ljava/lang/String;
    .end local v34    # "_tmp":Ljava/lang/Long;
    .end local v35    # "_tmp_1":Ljava/time/Instant;
    .end local v36    # "_columnIndexOfCreatedAt":I
    .end local v38    # "_columnIndexOfUpdatedAt":I
    .restart local v0    # "_columnIndexOfCreatedAt":I
    .restart local v1    # "_columnIndexOfUpdatedAt":I
    .restart local v5    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$query":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_a
    move/from16 v36, v0

    move/from16 v38, v1

    .line 598
    .end local v0    # "_columnIndexOfCreatedAt":I
    .end local v1    # "_columnIndexOfUpdatedAt":I
    .end local v6    # "_columnIndexOfId":I
    .end local v7    # "_columnIndexOfTimestamp":I
    .end local v8    # "_columnIndexOfTimezone":I
    .end local v9    # "_columnIndexOfGpsLat":I
    .end local v10    # "_columnIndexOfGpsLon":I
    .end local v11    # "_columnIndexOfGpsAccuracy":I
    .end local v12    # "_columnIndexOfCategory":I
    .end local v13    # "_columnIndexOfLocationName":I
    .end local v14    # "_columnIndexOfComment":I
    .end local v15    # "_columnIndexOfTags":I
    .end local v16    # "_argIndex":I
    .end local v18    # "_result":Ljava/util/List;
    invoke-interface {v5}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 599
    return-object v18

    .line 598
    :catchall_0
    move-exception v0

    invoke-interface {v5}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final update$lambda$2(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .param p1, "$entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 167
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__updateAdapterOfLogEntry:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 168
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 162
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda8;-><init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 164
    return-object v0
.end method

.method public deleteById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 721
    const-string v0, "DELETE FROM log_entries WHERE id = ?"

    .line 722
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, p1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v3, v4, v2, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_0

    return-object v1

    :cond_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method public getAll()Lkotlinx/coroutines/flow/Flow;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    .line 171
    const-string v0, "SELECT * FROM log_entries ORDER BY timestamp DESC"

    .line 172
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "log_entries"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda6;

    invoke-direct {v3, v0, p0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V

    invoke-static {v1, v4, v2, v3}, Landroidx/room/coroutines/FlowUtil;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    return-object v1
.end method

.method public getByCategory(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .locals 5
    .param p1, "category"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    const-string v0, "category"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 379
    const-string v0, "SELECT * FROM log_entries WHERE category = ? ORDER BY timestamp DESC"

    .line 380
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "log_entries"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v3, v0, p1, p0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V

    invoke-static {v1, v4, v2, v3}, Landroidx/room/coroutines/FlowUtil;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    return-object v1
.end method

.method public getByDateRange(Ljava/time/Instant;Ljava/time/Instant;)Lkotlinx/coroutines/flow/Flow;
    .locals 5
    .param p1, "start"    # Ljava/time/Instant;
    .param p2, "end"    # Ljava/time/Instant;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/time/Instant;",
            "Ljava/time/Instant;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    const-string v0, "start"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "end"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 604
    const-string v0, "SELECT * FROM log_entries WHERE timestamp BETWEEN ? AND ? ORDER BY timestamp DESC"

    .line 605
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "log_entries"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;

    invoke-direct {v3, v0, p0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda7;-><init>(Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Ljava/time/Instant;Ljava/time/Instant;)V

    invoke-static {v1, v4, v2, v3}, Landroidx/room/coroutines/FlowUtil;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    return-object v1
.end method

.method public getById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 274
    const-string v0, "SELECT * FROM log_entries WHERE id = ?"

    .line 275
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda5;

    invoke-direct {v2, v0, p1, p0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public insert(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 160
    return-object v0
.end method

.method public search(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .locals 5
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    const-string v0, "query"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 493
    nop

    .line 484
    const-string v0, "\n        SELECT * FROM log_entries\n        WHERE comment LIKE \'%\' || ? || \'%\'\n           OR locationName LIKE \'%\' || ? || \'%\'\n           OR tags LIKE \'%\' || ? || \'%\'\n           OR category LIKE \'%\' || ? || \'%\'\n        ORDER BY timestamp DESC\n    "

    .line 494
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "log_entries"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v3, v0, p1, p0}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/LogEntryDao_Impl;)V

    invoke-static {v1, v4, v2, v3}, Landroidx/room/coroutines/FlowUtil;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    return-object v1
.end method

.method public update(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$$ExternalSyntheticLambda4;-><init>(Lcom/hardlineforge/lala/data/LogEntryDao_Impl;Lcom/hardlineforge/lala/data/LogEntry;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 168
    return-object v0
.end method
