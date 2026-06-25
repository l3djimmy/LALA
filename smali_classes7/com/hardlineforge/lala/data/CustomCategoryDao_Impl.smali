.class public final Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
.super Ljava/lang/Object;
.source "CustomCategoryDao_Impl.kt"

# interfaces
.implements Lcom/hardlineforge/lala/data/CustomCategoryDao;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0008\u0002\u0008\u0007\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0016\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0010J\u0016\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0008H\u0096@\u00a2\u0006\u0002\u0010\u0010J\u0014\u0010\u0012\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00080\u00140\u0013H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;",
        "Lcom/hardlineforge/lala/data/CustomCategoryDao;",
        "__db",
        "Landroidx/room/RoomDatabase;",
        "<init>",
        "(Landroidx/room/RoomDatabase;)V",
        "__insertAdapterOfCustomCategory",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/CustomCategory;",
        "__converters",
        "Lcom/hardlineforge/lala/data/Converters;",
        "__deleteAdapterOfCustomCategory",
        "Landroidx/room/EntityDeleteOrUpdateAdapter;",
        "insert",
        "",
        "category",
        "(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "delete",
        "getAll",
        "Lkotlinx/coroutines/flow/Flow;",
        "",
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

.field public static final Companion:Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;


# instance fields
.field private final __converters:Lcom/hardlineforge/lala/data/Converters;

.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfCustomCategory:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfCustomCategory:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->Companion:Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;

    const-string v0, "__db"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/hardlineforge/lala/data/Converters;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/Converters;-><init>()V

    iput-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    .line 35
    nop

    .line 36
    iput-object p1, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 37
    new-instance v0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$1;-><init>(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;)V

    check-cast v0, Landroidx/room/EntityInsertAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__insertAdapterOfCustomCategory:Landroidx/room/EntityInsertAdapter;

    .line 51
    new-instance v0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$2;

    invoke-direct {v0}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$2;-><init>()V

    check-cast v0, Landroidx/room/EntityDeleteOrUpdateAdapter;

    iput-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__deleteAdapterOfCustomCategory:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 58
    nop

    .line 25
    return-void
.end method

.method public static final synthetic access$get__converters$p(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;

    .line 23
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    return-object v0
.end method

.method static final delete$lambda$1(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;Lcom/hardlineforge/lala/data/CustomCategory;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
    .param p1, "$category"    # Lcom/hardlineforge/lala/data/CustomCategory;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__deleteAdapterOfCustomCategory:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 66
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final getAll$lambda$2(Ljava/lang/String;Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 13
    .param p0, "$_sql"    # Ljava/lang/String;
    .param p1, "this$0"    # Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    invoke-interface {p2, p0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 72
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    nop

    .line 73
    :try_start_0
    const-string v1, "id"

    invoke-static {v0, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 74
    .local v1, "_columnIndexOfId":I
    const-string v2, "name"

    invoke-static {v0, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 75
    .local v2, "_columnIndexOfName":I
    const-string v3, "createdAt"

    invoke-static {v0, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 76
    .local v3, "_columnIndexOfCreatedAt":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/List;

    .line 77
    .local v4, "_result":Ljava/util/List;
    :goto_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 78
    const/4 v5, 0x0

    .line 79
    .local v5, "_item":Lcom/hardlineforge/lala/data/CustomCategory;
    const/4 v6, 0x0

    .line 80
    .local v6, "_tmpId":Ljava/lang/String;
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v7

    .line 81
    .end local v6    # "_tmpId":Ljava/lang/String;
    .local v7, "_tmpId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 82
    .local v6, "_tmpName":Ljava/lang/String;
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v8

    .line 83
    .end local v6    # "_tmpName":Ljava/lang/String;
    .local v8, "_tmpName":Ljava/lang/String;
    const/4 v6, 0x0

    .line 84
    .local v6, "_tmpCreatedAt":Ljava/time/Instant;
    const/4 v9, 0x0

    .line 85
    .local v9, "_tmp":Ljava/lang/Long;
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 86
    const/4 v9, 0x0

    goto :goto_1

    .line 88
    :cond_0
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    move-object v9, v10

    .line 90
    :goto_1
    iget-object v10, p1, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__converters:Lcom/hardlineforge/lala/data/Converters;

    invoke-virtual {v10, v9}, Lcom/hardlineforge/lala/data/Converters;->toInstant(Ljava/lang/Long;)Ljava/time/Instant;

    move-result-object v10

    .line 91
    .local v10, "_tmp_1":Ljava/time/Instant;
    if-eqz v10, :cond_1

    .line 94
    move-object v6, v10

    .line 96
    new-instance v11, Lcom/hardlineforge/lala/data/CustomCategory;

    invoke-direct {v11, v7, v8, v6}, Lcom/hardlineforge/lala/data/CustomCategory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)V

    .line 97
    .end local v5    # "_item":Lcom/hardlineforge/lala/data/CustomCategory;
    .local v11, "_item":Lcom/hardlineforge/lala/data/CustomCategory;
    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 91
    .end local v11    # "_item":Lcom/hardlineforge/lala/data/CustomCategory;
    .restart local v5    # "_item":Lcom/hardlineforge/lala/data/CustomCategory;
    :cond_1
    new-instance v11, Ljava/lang/IllegalStateException;

    .line 92
    const-string v12, "Expected NON-NULL \'java.time.Instant\', but it was NULL."

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .end local p0    # "$_sql":Ljava/lang/String;
    .end local p1    # "this$0":Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
    .end local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    throw v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .end local v5    # "_item":Lcom/hardlineforge/lala/data/CustomCategory;
    .end local v6    # "_tmpCreatedAt":Ljava/time/Instant;
    .end local v7    # "_tmpId":Ljava/lang/String;
    .end local v8    # "_tmpName":Ljava/lang/String;
    .end local v9    # "_tmp":Ljava/lang/Long;
    .end local v10    # "_tmp_1":Ljava/time/Instant;
    .restart local v0    # "_stmt":Landroidx/sqlite/SQLiteStatement;
    .restart local p0    # "$_sql":Ljava/lang/String;
    .restart local p1    # "this$0":Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
    .restart local p2    # "_connection":Landroidx/sqlite/SQLiteConnection;
    :cond_2
    nop

    .line 101
    .end local v1    # "_columnIndexOfId":I
    .end local v2    # "_columnIndexOfName":I
    .end local v3    # "_columnIndexOfCreatedAt":I
    .end local v4    # "_result":Ljava/util/List;
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 102
    return-object v4

    .line 101
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    throw v1
.end method

.method static final insert$lambda$0(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;Lcom/hardlineforge/lala/data/CustomCategory;Landroidx/sqlite/SQLiteConnection;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
    .param p1, "$category"    # Lcom/hardlineforge/lala/data/CustomCategory;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "_connection"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__insertAdapterOfCustomCategory:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 62
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "category"    # Lcom/hardlineforge/lala/data/CustomCategory;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;Lcom/hardlineforge/lala/data/CustomCategory;)V

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

    .line 66
    return-object v0
.end method

.method public getAll()Lkotlinx/coroutines/flow/Flow;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            ">;>;"
        }
    .end annotation

    .line 69
    const-string v0, "SELECT * FROM custom_categories ORDER BY name"

    .line 70
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "custom_categories"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v3, v0, p0}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;)V

    invoke-static {v1, v4, v2, v3}, Landroidx/room/coroutines/FlowUtil;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    return-object v1
.end method

.method public insert(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1, "category"    # Lcom/hardlineforge/lala/data/CustomCategory;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;Lcom/hardlineforge/lala/data/CustomCategory;)V

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

    .line 62
    return-object v0
.end method
