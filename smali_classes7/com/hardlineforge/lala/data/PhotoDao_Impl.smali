.class public final Lcom/hardlineforge/lala/data/PhotoDao_Impl;
.super Ljava/lang/Object;
.source "PhotoDao_Impl.kt"

# interfaces
.implements Lcom/hardlineforge/lala/data/PhotoDao;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0010J\u0016\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0010J\u001c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0096@\u00a2\u0006\u0002\u0010\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/PhotoDao_Impl;",
        "Lcom/hardlineforge/lala/data/PhotoDao;",
        "__db",
        "Landroidx/room/RoomDatabase;",
        "<init>",
        "(Landroidx/room/RoomDatabase;)V",
        "__insertAdapterOfPhoto",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/Photo;",
        "__converters",
        "Lcom/hardlineforge/lala/data/Converters;",
        "__deleteAdapterOfPhoto",
        "Landroidx/room/EntityDeleteOrUpdateAdapter;",
        "insert",
        "",
        "photo",
        "(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "delete",
        "getByEntryId",
        "",
        "entryId",
        "",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
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

.field public static final Companion:Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;


# instance fields
.field private final __converters:Lcom/hardlineforge/lala/data/Converters;

.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfPhoto:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/hardlineforge/lala/data/Photo;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfPhoto:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/hardlineforge/lala/data/Photo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->Companion:Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;

    const-string v0, "__db"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/hardlineforge/lala/data/Converters;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/Converters;-><init>()V

    iput-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    .line 34
    nop

    .line 35
    iput-object p1, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 36
    new-instance v0, Lcom/hardlineforge/lala/data/PhotoDao_Impl$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$1;-><init>(Lcom/hardlineforge/lala/data/PhotoDao_Impl;)V

    check-cast v0, Landroidx/room/EntityInsertAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__insertAdapterOfPhoto:Landroidx/room/EntityInsertAdapter;

    .line 69
    new-instance v0, Lcom/hardlineforge/lala/data/PhotoDao_Impl$2;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$2;-><init>()V

    check-cast v0, Landroidx/room/EntityDeleteOrUpdateAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__deleteAdapterOfPhoto:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 76
    nop

    .line 24
    return-void
.end method

.method public static final synthetic access$get__converters$p(Lcom/hardlineforge/lala/data/PhotoDao_Impl;)Lcom/hardlineforge/lala/data/Converters;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/data/PhotoDao_Impl;

    .line 22
    iget-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    return-object v0
.end method

.method static final delete$lambda$1(Lcom/hardlineforge/lala/data/PhotoDao_Impl;Lcom/hardlineforge/lala/data/Photo;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/PhotoDao_Impl;
    .param p1, "$photo"    # Lcom/hardlineforge/lala/data/Photo;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__deleteAdapterOfPhoto:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 84
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final getByEntryId$lambda$2(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/PhotoDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 27
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$entryId"    # Ljava/lang/String;
    .param p2, "this$0"    # Lcom/hardlineforge/lala/data/PhotoDao_Impl;
    .param p3, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p3

    const-string v0, "_connection"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    move-object/from16 v2, p0

    invoke-interface {v1, v2}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v3

    .line 90
    .local v3, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 91
    const/4 v0, 0x1

    .line 92
    .local v0, "_argIndex":I
    move-object/from16 v4, p1

    :try_start_0
    invoke-interface {v3, v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 93
    const-string v5, "id"

    invoke-static {v3, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 94
    .local v5, "_columnIndexOfId":I
    const-string v6, "entryId"

    invoke-static {v3, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 95
    .local v6, "_columnIndexOfEntryId":I
    const-string v7, "uri"

    invoke-static {v3, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 96
    .local v7, "_columnIndexOfUri":I
    const-string v8, "caption"

    invoke-static {v3, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 97
    .local v8, "_columnIndexOfCaption":I
    const-string v9, "timestamp"

    invoke-static {v3, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 98
    .local v9, "_columnIndexOfTimestamp":I
    const-string v10, "gpsLat"

    invoke-static {v3, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 99
    .local v10, "_columnIndexOfGpsLat":I
    const-string v11, "gpsLon"

    invoke-static {v3, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 100
    .local v11, "_columnIndexOfGpsLon":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    check-cast v12, Ljava/util/List;

    .line 101
    .local v12, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v13

    if-eqz v13, :cond_5

    .line 102
    const/4 v13, 0x0

    .line 103
    .local v13, "_item":Lcom/hardlineforge/lala/data/Photo;
    const/4 v14, 0x0

    .line 104
    .local v14, "_tmpId":Ljava/lang/String;
    invoke-interface {v3, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v17, v15

    .line 105
    .end local v14    # "_tmpId":Ljava/lang/String;
    .local v17, "_tmpId":Ljava/lang/String;
    const/4 v14, 0x0

    .line 106
    .local v14, "_tmpEntryId":Ljava/lang/String;
    invoke-interface {v3, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v18

    .line 107
    .end local v14    # "_tmpEntryId":Ljava/lang/String;
    .local v18, "_tmpEntryId":Ljava/lang/String;
    const/4 v14, 0x0

    .line 108
    .local v14, "_tmpUri":Ljava/lang/String;
    invoke-interface {v3, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v19

    .line 109
    .end local v14    # "_tmpUri":Ljava/lang/String;
    .local v19, "_tmpUri":Ljava/lang/String;
    const/4 v14, 0x0

    .line 110
    .local v14, "_tmpCaption":Ljava/lang/String;
    invoke-interface {v3, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 111
    const/4 v14, 0x0

    move-object/from16 v20, v14

    goto :goto_1

    .line 113
    :cond_0
    invoke-interface {v3, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v15

    move-object v14, v15

    move-object/from16 v20, v14

    .line 115
    .end local v14    # "_tmpCaption":Ljava/lang/String;
    .local v20, "_tmpCaption":Ljava/lang/String;
    :goto_1
    const/4 v14, 0x0

    .line 116
    .local v14, "_tmpTimestamp":Ljava/time/Instant;
    const/4 v15, 0x0

    .line 117
    .local v15, "_tmp":Ljava/lang/Long;
    invoke-interface {v3, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 118
    const/4 v15, 0x0

    goto :goto_2

    .line 120
    :cond_1
    invoke-interface {v3, v9}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v15, v16

    .line 122
    :goto_2
    move-object/from16 v1, p2

    move/from16 v24, v0

    .end local v0    # "_argIndex":I
    .local v24, "_argIndex":I
    iget-object v0, v1, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v15}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 123
    .local v0, "_tmp_1":Ljava/time/Instant;
    if-eqz v0, :cond_4

    .line 126
    move-object/from16 v21, v0

    .line 128
    .end local v14    # "_tmpTimestamp":Ljava/time/Instant;
    .local v21, "_tmpTimestamp":Ljava/time/Instant;
    const/4 v14, 0x0

    .line 129
    .local v14, "_tmpGpsLat":Ljava/lang/Double;
    invoke-interface {v3, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_2

    .line 130
    const/4 v14, 0x0

    move-object/from16 v22, v14

    goto :goto_3

    .line 132
    :cond_2
    invoke-interface {v3, v10}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v16

    move-object/from16 v14, v16

    move-object/from16 v22, v14

    .line 134
    .end local v14    # "_tmpGpsLat":Ljava/lang/Double;
    .local v22, "_tmpGpsLat":Ljava/lang/Double;
    :goto_3
    const/4 v14, 0x0

    .line 135
    .local v14, "_tmpGpsLon":Ljava/lang/Double;
    invoke-interface {v3, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_3

    .line 136
    const/4 v14, 0x0

    move-object/from16 v23, v14

    goto :goto_4

    .line 138
    :cond_3
    invoke-interface {v3, v11}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v16

    move-object/from16 v14, v16

    move-object/from16 v23, v14

    .line 140
    .end local v14    # "_tmpGpsLon":Ljava/lang/Double;
    .local v23, "_tmpGpsLon":Ljava/lang/Double;
    :goto_4
    new-instance v16, Lcom/hardlineforge/lala/data/Photo;

    invoke-direct/range {v16 .. v23}, Lcom/hardlineforge/lala/data/Photo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/Double;Ljava/lang/Double;)V

    move-object/from16 v13, v16

    .line 141
    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v1, p3

    move/from16 v0, v24

    goto/16 :goto_0

    .line 123
    .end local v21    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v22    # "_tmpGpsLat":Ljava/lang/Double;
    .end local v23    # "_tmpGpsLon":Ljava/lang/Double;
    .local v14, "_tmpTimestamp":Ljava/time/Instant;
    :cond_4
    move-object/from16 v16, v0

    .end local v0    # "_tmp_1":Ljava/time/Instant;
    .local v16, "_tmp_1":Ljava/time/Instant;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 124
    const-string v21, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v3    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$entryId":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/PhotoDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    .end local v13    # "_item":Lcom/hardlineforge/lala/data/Photo;
    .end local v14    # "_tmpTimestamp":Ljava/time/Instant;
    .end local v15    # "_tmp":Ljava/lang/Long;
    .end local v16    # "_tmp_1":Ljava/time/Instant;
    .end local v17    # "_tmpId":Ljava/lang/String;
    .end local v18    # "_tmpEntryId":Ljava/lang/String;
    .end local v19    # "_tmpUri":Ljava/lang/String;
    .end local v20    # "_tmpCaption":Ljava/lang/String;
    .end local v24    # "_argIndex":I
    .local v0, "_argIndex":I
    .restart local v3    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$entryId":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/PhotoDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_5
    move/from16 v24, v0

    .line 145
    .end local v0    # "_argIndex":I
    .end local v5    # "_columnIndexOfId":I
    .end local v6    # "_columnIndexOfEntryId":I
    .end local v7    # "_columnIndexOfUri":I
    .end local v8    # "_columnIndexOfCaption":I
    .end local v9    # "_columnIndexOfTimestamp":I
    .end local v10    # "_columnIndexOfGpsLat":I
    .end local v11    # "_columnIndexOfGpsLon":I
    .end local v12    # "_result":Ljava/util/List;
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 146
    return-object v12

    .line 145
    :catchall_0
    move-exception v0

    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final insert$lambda$0(Lcom/hardlineforge/lala/data/PhotoDao_Impl;Lcom/hardlineforge/lala/data/Photo;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/PhotoDao_Impl;
    .param p1, "$photo"    # Lcom/hardlineforge/lala/data/Photo;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__insertAdapterOfPhoto:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 80
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "photo"    # Lcom/hardlineforge/lala/data/Photo;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/Photo;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/PhotoDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/hardlineforge/lala/data/PhotoDao_Impl;Lcom/hardlineforge/lala/data/Photo;)V

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

    .line 84
    return-object v0
.end method

.method public getByEntryId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .param p1, "entryId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/Photo;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 87
    const-string v0, "SELECT * FROM photos WHERE entryId = ?"

    .line 88
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/hardlineforge/lala/data/PhotoDao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, p1, p0}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/PhotoDao_Impl;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public insert(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "photo"    # Lcom/hardlineforge/lala/data/Photo;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/Photo;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/PhotoDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/hardlineforge/lala/data/PhotoDao_Impl;Lcom/hardlineforge/lala/data/Photo;)V

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

    .line 80
    return-object v0
.end method
