.class public final Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;
.super Ljava/lang/Object;
.source "EditHistoryDao_Impl.kt"

# interfaces
.implements Lcom/hardlineforge/lala/data/EditHistoryDao;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u000eJ\u001c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0096@\u00a2\u0006\u0002\u0010\u0013R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;",
        "Lcom/hardlineforge/lala/data/EditHistoryDao;",
        "__db",
        "Landroidx/room/RoomDatabase;",
        "<init>",
        "(Landroidx/room/RoomDatabase;)V",
        "__insertAdapterOfEditHistory",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/EditHistory;",
        "__converters",
        "Lcom/hardlineforge/lala/data/Converters;",
        "insert",
        "",
        "history",
        "(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
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

.field public static final Companion:Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;


# instance fields
.field private final __converters:Lcom/hardlineforge/lala/data/Converters;

.field private final __db:Landroidx/room/RoomDatabase;

.field private final __insertAdapterOfEditHistory:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/hardlineforge/lala/data/EditHistory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->Companion:Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;

    const-string v0, "__db"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/hardlineforge/lala/data/Converters;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/Converters;-><init>()V

    iput-object v0, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    .line 30
    nop

    .line 31
    iput-object p1, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 32
    new-instance v0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$1;-><init>(Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;)V

    check-cast v0, Landroidx/room/EntityInsertAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__insertAdapterOfEditHistory:Landroidx/room/EntityInsertAdapter;

    .line 52
    nop

    .line 22
    return-void
.end method

.method public static final synthetic access$get__converters$p(Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;

    .line 20
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    return-object v0
.end method

.method static final getByEntryId$lambda$1(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 19
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$entryId"    # Ljava/lang/String;
    .param p2, "this$0"    # Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;
    .param p3, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p3

    const-string v0, "_connection"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    move-object/from16 v2, p0

    invoke-interface {v1, v2}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v3

    .line 62
    .local v3, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 63
    const/4 v0, 0x1

    .line 64
    .local v0, "_argIndex":I
    move-object/from16 v4, p1

    :try_start_0
    invoke-interface {v3, v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 65
    const-string v5, "id"

    invoke-static {v3, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 66
    .local v5, "_columnIndexOfId":I
    const-string v6, "entryId"

    invoke-static {v3, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 67
    .local v6, "_columnIndexOfEntryId":I
    const-string v7, "editedAt"

    invoke-static {v3, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 68
    .local v7, "_columnIndexOfEditedAt":I
    const-string v8, "note"

    invoke-static {v3, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 69
    .local v8, "_columnIndexOfNote":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    check-cast v9, Ljava/util/List;

    .line 70
    .local v9, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 71
    const/4 v10, 0x0

    .line 72
    .local v10, "_item":Lcom/hardlineforge/lala/data/EditHistory;
    const/4 v11, 0x0

    .line 73
    .local v11, "_tmpId":Ljava/lang/String;
    invoke-interface {v3, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v12

    .line 74
    .end local v11    # "_tmpId":Ljava/lang/String;
    .local v12, "_tmpId":Ljava/lang/String;
    const/4 v11, 0x0

    .line 75
    .local v11, "_tmpEntryId":Ljava/lang/String;
    invoke-interface {v3, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v13

    .line 76
    .end local v11    # "_tmpEntryId":Ljava/lang/String;
    .local v13, "_tmpEntryId":Ljava/lang/String;
    const/4 v11, 0x0

    .line 77
    .local v11, "_tmpEditedAt":Ljava/time/Instant;
    const/4 v14, 0x0

    .line 78
    .local v14, "_tmp":Ljava/lang/Long;
    invoke-interface {v3, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 79
    const/4 v14, 0x0

    goto :goto_1

    .line 81
    :cond_0
    invoke-interface {v3, v7}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v14, v15

    .line 83
    :goto_1
    move-object/from16 v15, p2

    move/from16 v16, v0

    .end local v0    # "_argIndex":I
    .local v16, "_argIndex":I
    :try_start_1
    iget-object v0, v15, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v14}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 84
    .local v0, "_tmp_1":Ljava/time/Instant;
    if-eqz v0, :cond_2

    .line 87
    move-object v11, v0

    .line 89
    const/16 v17, 0x0

    .line 90
    .local v17, "_tmpNote":Ljava/lang/String;
    invoke-interface {v3, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 91
    const/16 v17, 0x0

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    goto :goto_2

    .line 93
    :cond_1
    invoke-interface {v3, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v17, v18

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    .line 95
    .end local v17    # "_tmpNote":Ljava/lang/String;
    .local v0, "_tmpNote":Ljava/lang/String;
    .local v18, "_tmp_1":Ljava/time/Instant;
    :goto_2
    new-instance v1, Lcom/hardlineforge/lala/data/EditHistory;

    invoke-direct {v1, v12, v13, v11, v0}, Lcom/hardlineforge/lala/data/EditHistory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)V

    .line 96
    .end local v10    # "_item":Lcom/hardlineforge/lala/data/EditHistory;
    .local v1, "_item":Lcom/hardlineforge/lala/data/EditHistory;
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v1, p3

    move/from16 v0, v16

    goto :goto_0

    .line 84
    .end local v1    # "_item":Lcom/hardlineforge/lala/data/EditHistory;
    .end local v18    # "_tmp_1":Ljava/time/Instant;
    .local v0, "_tmp_1":Ljava/time/Instant;
    .restart local v10    # "_item":Lcom/hardlineforge/lala/data/EditHistory;
    :cond_2
    move-object/from16 v18, v0

    .end local v0    # "_tmp_1":Ljava/time/Instant;
    .restart local v18    # "_tmp_1":Ljava/time/Instant;
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 85
    const-string v1, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v3    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$entryId":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    .end local v5    # "_columnIndexOfId":I
    .end local v6    # "_columnIndexOfEntryId":I
    .end local v7    # "_columnIndexOfEditedAt":I
    .end local v8    # "_columnIndexOfNote":I
    .end local v9    # "_result":Ljava/util/List;
    .end local v10    # "_item":Lcom/hardlineforge/lala/data/EditHistory;
    .end local v11    # "_tmpEditedAt":Ljava/time/Instant;
    .end local v12    # "_tmpId":Ljava/lang/String;
    .end local v13    # "_tmpEntryId":Ljava/lang/String;
    .end local v14    # "_tmp":Ljava/lang/Long;
    .end local v16    # "_argIndex":I
    .end local v18    # "_tmp_1":Ljava/time/Instant;
    .restart local v3    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$entryId":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :catchall_0
    move-exception v0

    goto :goto_3

    .line 98
    .local v0, "_argIndex":I
    .restart local v5    # "_columnIndexOfId":I
    .restart local v6    # "_columnIndexOfEntryId":I
    .restart local v7    # "_columnIndexOfEditedAt":I
    .restart local v8    # "_columnIndexOfNote":I
    .restart local v9    # "_result":Ljava/util/List;
    :cond_3
    move-object/from16 v15, p2

    move/from16 v16, v0

    .line 100
    .end local v0    # "_argIndex":I
    .end local v5    # "_columnIndexOfId":I
    .end local v6    # "_columnIndexOfEntryId":I
    .end local v7    # "_columnIndexOfEditedAt":I
    .end local v8    # "_columnIndexOfNote":I
    .end local v9    # "_result":Ljava/util/List;
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 101
    return-object v9

    .line 100
    :catchall_1
    move-exception v0

    move-object/from16 v15, p2

    :goto_3
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final insert$lambda$0(Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;Lcom/hardlineforge/lala/data/EditHistory;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;
    .param p1, "$history"    # Lcom/hardlineforge/lala/data/EditHistory;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__insertAdapterOfEditHistory:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 56
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
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
            "Lcom/hardlineforge/lala/data/EditHistory;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 59
    const-string v0, "SELECT * FROM edit_history WHERE entryId = ? ORDER BY editedAt"

    .line 60
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0, p1, p0}, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public insert(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "history"    # Lcom/hardlineforge/lala/data/EditHistory;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/EditHistory;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;Lcom/hardlineforge/lala/data/EditHistory;)V

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

    .line 56
    return-object v0
.end method
