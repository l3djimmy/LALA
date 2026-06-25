.class public final Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;
.super Ljava/lang/Object;
.source "VideoFrameDao_Impl.kt"

# interfaces
.implements Lcom/hardlineforge/lala/data/VideoFrameDao;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0008\u0007\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u000eJ\u001c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0096@\u00a2\u0006\u0002\u0010\u0013J\u0016\u0010\u0014\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u0012H\u0096@\u00a2\u0006\u0002\u0010\u0013R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;",
        "Lcom/hardlineforge/lala/data/VideoFrameDao;",
        "__db",
        "Landroidx/room/RoomDatabase;",
        "<init>",
        "(Landroidx/room/RoomDatabase;)V",
        "__insertAdapterOfVideoFrame",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/VideoFrame;",
        "__converters",
        "Lcom/hardlineforge/lala/data/Converters;",
        "insert",
        "",
        "frame",
        "(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getByVideoId",
        "",
        "videoId",
        "",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "deleteByVideoId",
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

.field public static final Companion:Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;


# instance fields
.field private final __converters:Lcom/hardlineforge/lala/data/Converters;

.field private final __db:Landroidx/room/RoomDatabase;

.field private final __insertAdapterOfVideoFrame:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->Companion:Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->$stable:I

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

    iput-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    .line 30
    nop

    .line 31
    iput-object p1, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 32
    new-instance v0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$1;-><init>(Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;)V

    check-cast v0, Landroidx/room/EntityInsertAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__insertAdapterOfVideoFrame:Landroidx/room/EntityInsertAdapter;

    .line 49
    nop

    .line 22
    return-void
.end method

.method public static final synthetic access$get__converters$p(Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;)Lcom/hardlineforge/lala/data/Converters;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;

    .line 20
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    return-object v0
.end method

.method static final deleteByVideoId$lambda$2(Ljava/lang/String;Ljava/lang/String;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 2
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$videoId"    # Ljava/lang/String;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    invoke-interface {p2, p0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 108
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 109
    const/4 v1, 0x1

    .line 110
    .local v1, "_argIndex":I
    :try_start_0
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 111
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    .end local v1    # "_argIndex":I
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 114
    nop

    .line 115
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    .line 113
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v1
.end method

.method static final getByVideoId$lambda$1(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 23
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "$videoId"    # Ljava/lang/String;
    .param p2, "this$0"    # Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;
    .param p3, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v1, p3

    const-string v0, "_connection"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    move-object/from16 v2, p0

    invoke-interface {v1, v2}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v3

    .line 59
    .local v3, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 60
    const/4 v0, 0x1

    .line 61
    .local v0, "_argIndex":I
    move-object/from16 v4, p1

    :try_start_0
    invoke-interface {v3, v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 62
    const-string v5, "id"

    invoke-static {v3, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 63
    .local v5, "_columnIndexOfId":I
    const-string v6, "videoId"

    invoke-static {v3, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 64
    .local v6, "_columnIndexOfVideoId":I
    const-string v7, "frameNumber"

    invoke-static {v3, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 65
    .local v7, "_columnIndexOfFrameNumber":I
    const-string v8, "timeOffsetMs"

    invoke-static {v3, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 66
    .local v8, "_columnIndexOfTimeOffsetMs":I
    const-string v9, "uri"

    invoke-static {v3, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 67
    .local v9, "_columnIndexOfUri":I
    const-string v10, "extractedAt"

    invoke-static {v3, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 68
    .local v10, "_columnIndexOfExtractedAt":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    check-cast v11, Ljava/util/List;

    .line 69
    .local v11, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 70
    const/4 v12, 0x0

    .line 71
    .local v12, "_item":Lcom/hardlineforge/lala/data/VideoFrame;
    const/4 v13, 0x0

    .line 72
    .local v13, "_tmpId":Ljava/lang/String;
    invoke-interface {v3, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v16, v14

    .line 73
    .end local v13    # "_tmpId":Ljava/lang/String;
    .local v16, "_tmpId":Ljava/lang/String;
    const/4 v13, 0x0

    .line 74
    .local v13, "_tmpVideoId":Ljava/lang/String;
    invoke-interface {v3, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v17

    .line 75
    .end local v13    # "_tmpVideoId":Ljava/lang/String;
    .local v17, "_tmpVideoId":Ljava/lang/String;
    const/4 v13, 0x0

    .line 76
    .local v13, "_tmpFrameNumber":I
    invoke-interface {v3, v7}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v14

    long-to-int v13, v14

    .line 77
    const/4 v14, 0x0

    .line 78
    .local v14, "_tmpTimeOffsetMs":I
    move/from16 v22, v0

    .end local v0    # "_argIndex":I
    .local v22, "_argIndex":I
    invoke-interface {v3, v8}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v0

    long-to-int v0, v0

    .line 79
    .end local v14    # "_tmpTimeOffsetMs":I
    .local v0, "_tmpTimeOffsetMs":I
    const/4 v1, 0x0

    .line 80
    .local v1, "_tmpUri":Ljava/lang/String;
    invoke-interface {v3, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v20

    .line 81
    .end local v1    # "_tmpUri":Ljava/lang/String;
    .local v20, "_tmpUri":Ljava/lang/String;
    const/4 v1, 0x0

    .line 82
    .local v1, "_tmpExtractedAt":Ljava/time/Instant;
    const/4 v14, 0x0

    .line 83
    .local v14, "_tmp":Ljava/lang/Long;
    invoke-interface {v3, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 84
    const/4 v14, 0x0

    goto :goto_1

    .line 86
    :cond_0
    invoke-interface {v3, v10}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    move-object v14, v15

    .line 88
    :goto_1
    move-object/from16 v15, p2

    move/from16 v19, v0

    .end local v0    # "_tmpTimeOffsetMs":I
    .local v19, "_tmpTimeOffsetMs":I
    iget-object v0, v15, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v0, v14}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v0

    .line 89
    .local v0, "_tmp_1":Ljava/time/Instant;
    if-eqz v0, :cond_1

    .line 92
    move-object/from16 v21, v0

    .line 94
    .end local v1    # "_tmpExtractedAt":Ljava/time/Instant;
    .local v21, "_tmpExtractedAt":Ljava/time/Instant;
    new-instance v15, Lcom/hardlineforge/lala/data/VideoFrame;

    move/from16 v18, v13

    .end local v13    # "_tmpFrameNumber":I
    .local v18, "_tmpFrameNumber":I
    invoke-direct/range {v15 .. v21}, Lcom/hardlineforge/lala/data/VideoFrame;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)V

    .line 95
    .end local v12    # "_item":Lcom/hardlineforge/lala/data/VideoFrame;
    .local v15, "_item":Lcom/hardlineforge/lala/data/VideoFrame;
    invoke-interface {v11, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v1, p3

    move/from16 v0, v22

    goto :goto_0

    .line 89
    .end local v15    # "_item":Lcom/hardlineforge/lala/data/VideoFrame;
    .end local v18    # "_tmpFrameNumber":I
    .end local v21    # "_tmpExtractedAt":Ljava/time/Instant;
    .restart local v1    # "_tmpExtractedAt":Ljava/time/Instant;
    .restart local v12    # "_item":Lcom/hardlineforge/lala/data/VideoFrame;
    .restart local v13    # "_tmpFrameNumber":I
    :cond_1
    move/from16 v18, v13

    .end local v13    # "_tmpFrameNumber":I
    .restart local v18    # "_tmpFrameNumber":I
    new-instance v13, Ljava/lang/IllegalStateException;

    .line 90
    const-string v15, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v3    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "$videoId":Ljava/lang/String;
    .end local p2    # "this$0":Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;
    .end local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .end local v1    # "_tmpExtractedAt":Ljava/time/Instant;
    .end local v12    # "_item":Lcom/hardlineforge/lala/data/VideoFrame;
    .end local v14    # "_tmp":Ljava/lang/Long;
    .end local v16    # "_tmpId":Ljava/lang/String;
    .end local v17    # "_tmpVideoId":Ljava/lang/String;
    .end local v18    # "_tmpFrameNumber":I
    .end local v19    # "_tmpTimeOffsetMs":I
    .end local v20    # "_tmpUri":Ljava/lang/String;
    .end local v22    # "_argIndex":I
    .local v0, "_argIndex":I
    .restart local v3    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "$videoId":Ljava/lang/String;
    .restart local p2    # "this$0":Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;
    .restart local p3    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_2
    move/from16 v22, v0

    .line 99
    .end local v0    # "_argIndex":I
    .end local v5    # "_columnIndexOfId":I
    .end local v6    # "_columnIndexOfVideoId":I
    .end local v7    # "_columnIndexOfFrameNumber":I
    .end local v8    # "_columnIndexOfTimeOffsetMs":I
    .end local v9    # "_columnIndexOfUri":I
    .end local v10    # "_columnIndexOfExtractedAt":I
    .end local v11    # "_result":Ljava/util/List;
    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 100
    return-object v11

    .line 99
    :catchall_0
    move-exception v0

    invoke-interface {v3}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v0
.end method

.method static final insert$lambda$0(Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;Lcom/hardlineforge/lala/data/VideoFrame;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;
    .param p1, "$frame"    # Lcom/hardlineforge/lala/data/VideoFrame;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__insertAdapterOfVideoFrame:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 53
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public deleteByVideoId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .param p1, "videoId"    # Ljava/lang/String;
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

    .line 105
    const-string v0, "DELETE FROM video_frames WHERE videoId = ?"

    .line 106
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0, p1}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

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

.method public getByVideoId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 5
    .param p1, "videoId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 56
    const-string v0, "SELECT * FROM video_frames WHERE videoId = ? ORDER BY frameNumber"

    .line 57
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0, p1, p0}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2, p2}, Landroidx/room/util/DBUtil;->performSuspending(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public insert(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "frame"    # Lcom/hardlineforge/lala/data/VideoFrame;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;Lcom/hardlineforge/lala/data/VideoFrame;)V

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

    .line 53
    return-object v0
.end method
