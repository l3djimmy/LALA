.class public final Lcom/hardlineforge/lala/data/AppDatabase_Impl;
.super Lcom/hardlineforge/lala/data/AppDatabase;
.source "AppDatabase_Impl.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0011\u001a\u00020\u0012H\u0014J\u0008\u0010\u0013\u001a\u00020\u0014H\u0014J\u0008\u0010\u0015\u001a\u00020\u0016H\u0016J\"\u0010\u0017\u001a\u001c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0019\u0012\u000e\u0012\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00190\u001a0\u0018H\u0014J\u0016\u0010\u001b\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0008\u0001\u0012\u00020\u001d0\u00190\u001cH\u0016J*\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u001f0\u001a2\u001a\u0010 \u001a\u0016\u0012\u000c\u0012\n\u0012\u0006\u0008\u0001\u0012\u00020\u001d0\u0019\u0012\u0004\u0012\u00020\u001d0\u0018H\u0016J\u0008\u0010!\u001a\u00020\u0006H\u0016J\u0008\u0010\"\u001a\u00020\u0008H\u0016J\u0008\u0010#\u001a\u00020\nH\u0016J\u0008\u0010$\u001a\u00020\u000cH\u0016J\u0008\u0010%\u001a\u00020\u000eH\u0016J\u0008\u0010&\u001a\u00020\u0010H\u0016R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/AppDatabase_Impl;",
        "Lcom/hardlineforge/lala/data/AppDatabase;",
        "<init>",
        "()V",
        "_logEntryDao",
        "Lkotlin/Lazy;",
        "Lcom/hardlineforge/lala/data/LogEntryDao;",
        "_photoDao",
        "Lcom/hardlineforge/lala/data/PhotoDao;",
        "_videoDao",
        "Lcom/hardlineforge/lala/data/VideoDao;",
        "_videoFrameDao",
        "Lcom/hardlineforge/lala/data/VideoFrameDao;",
        "_editHistoryDao",
        "Lcom/hardlineforge/lala/data/EditHistoryDao;",
        "_customCategoryDao",
        "Lcom/hardlineforge/lala/data/CustomCategoryDao;",
        "createOpenDelegate",
        "Landroidx/room/RoomOpenDelegate;",
        "createInvalidationTracker",
        "Landroidx/room/InvalidationTracker;",
        "clearAllTables",
        "",
        "getRequiredTypeConverterClasses",
        "",
        "Lkotlin/reflect/KClass;",
        "",
        "getRequiredAutoMigrationSpecClasses",
        "",
        "Landroidx/room/migration/AutoMigrationSpec;",
        "createAutoMigrations",
        "Landroidx/room/migration/Migration;",
        "autoMigrationSpecs",
        "logEntryDao",
        "photoDao",
        "videoDao",
        "videoFrameDao",
        "editHistoryDao",
        "customCategoryDao",
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


# instance fields
.field private final _customCategoryDao:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/hardlineforge/lala/data/CustomCategoryDao;",
            ">;"
        }
    .end annotation
.end field

.field private final _editHistoryDao:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/hardlineforge/lala/data/EditHistoryDao;",
            ">;"
        }
    .end annotation
.end field

.field private final _logEntryDao:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/hardlineforge/lala/data/LogEntryDao;",
            ">;"
        }
    .end annotation
.end field

.field private final _photoDao:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/hardlineforge/lala/data/PhotoDao;",
            ">;"
        }
    .end annotation
.end field

.field private final _videoDao:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/hardlineforge/lala/data/VideoDao;",
            ">;"
        }
    .end annotation
.end field

.field private final _videoFrameDao:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/hardlineforge/lala/data/VideoFrameDao;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Lcom/hardlineforge/lala/data/AppDatabase;-><init>()V

    .line 30
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_logEntryDao:Lkotlin/Lazy;

    .line 34
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_photoDao:Lkotlin/Lazy;

    .line 38
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda2;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_videoDao:Lkotlin/Lazy;

    .line 42
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda3;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_videoFrameDao:Lkotlin/Lazy;

    .line 46
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda4;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_editHistoryDao:Lkotlin/Lazy;

    .line 50
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$$ExternalSyntheticLambda5;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_customCategoryDao:Lkotlin/Lazy;

    .line 27
    return-void
.end method

.method static final _customCategoryDao$lambda$5(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 51
    new-instance v0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;

    move-object v1, p0

    check-cast v1, Landroidx/room/RoomDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    return-object v0
.end method

.method static final _editHistoryDao$lambda$4(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 47
    new-instance v0, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;

    move-object v1, p0

    check-cast v1, Landroidx/room/RoomDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    return-object v0
.end method

.method static final _logEntryDao$lambda$0(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/LogEntryDao_Impl;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 31
    new-instance v0, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;

    move-object v1, p0

    check-cast v1, Landroidx/room/RoomDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    return-object v0
.end method

.method static final _photoDao$lambda$1(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/PhotoDao_Impl;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 35
    new-instance v0, Lcom/hardlineforge/lala/data/PhotoDao_Impl;

    move-object v1, p0

    check-cast v1, Landroidx/room/RoomDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/PhotoDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    return-object v0
.end method

.method static final _videoDao$lambda$2(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/VideoDao_Impl;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 39
    new-instance v0, Lcom/hardlineforge/lala/data/VideoDao_Impl;

    move-object v1, p0

    check-cast v1, Landroidx/room/RoomDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/VideoDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    return-object v0
.end method

.method static final _videoFrameDao$lambda$3(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 43
    new-instance v0, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;

    move-object v1, p0

    check-cast v1, Landroidx/room/RoomDatabase;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    return-object v0
.end method

.method public static final synthetic access$internalInitInvalidationTracker(Lcom/hardlineforge/lala/data/AppDatabase_Impl;Landroidx/sqlite/SQLiteConnection;)V
    .locals 0
    .param p0, "$this"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 27
    invoke-virtual {p0, p1}, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->internalInitInvalidationTracker(Landroidx/sqlite/SQLiteConnection;)V

    return-void
.end method


# virtual methods
.method public clearAllTables()V
    .locals 4

    .line 232
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "log_entries"

    aput-object v2, v0, v1

    const-string v1, "photos"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    const-string v3, "videos"

    aput-object v3, v0, v1

    const/4 v1, 0x3

    const-string v3, "video_frames"

    aput-object v3, v0, v1

    const/4 v1, 0x4

    const-string v3, "edit_history"

    aput-object v3, v0, v1

    const/4 v1, 0x5

    const-string v3, "custom_categories"

    aput-object v3, v0, v1

    invoke-super {p0, v2, v0}, Lcom/hardlineforge/lala/data/AppDatabase;->performClear(Z[Ljava/lang/String;)V

    .line 233
    return-void
.end method

.method public createAutoMigrations(Ljava/util/Map;)Ljava/util/List;
    .locals 1
    .param p1, "autoMigrationSpecs"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lkotlin/reflect/KClass<",
            "+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/room/migration/Migration;",
            ">;"
        }
    .end annotation

    const-string v0, "autoMigrationSpecs"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 252
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    .line 253
    .local v0, "_autoMigrations":Ljava/util/List;
    return-object v0
.end method

.method protected createInvalidationTracker()Landroidx/room/InvalidationTracker;
    .locals 7

    .line 226
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    .line 227
    .local v0, "_shadowTablesMap":Ljava/util/Map;
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    .line 228
    .local v1, "_viewTables":Ljava/util/Map;
    new-instance v2, Landroidx/room/InvalidationTracker;

    move-object v3, p0

    check-cast v3, Landroidx/room/RoomDatabase;

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "log_entries"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "photos"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "videos"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "video_frames"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "edit_history"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-string v6, "custom_categories"

    aput-object v6, v4, v5

    invoke-direct {v2, v3, v0, v1, v4}, Landroidx/room/InvalidationTracker;-><init>(Landroidx/room/RoomDatabase;Ljava/util/Map;Ljava/util/Map;[Ljava/lang/String;)V

    return-object v2
.end method

.method protected createOpenDelegate()Landroidx/room/RoomOpenDelegate;
    .locals 1

    .line 55
    new-instance v0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$createOpenDelegate$_openDelegate$1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl$createOpenDelegate$_openDelegate$1;-><init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V

    check-cast v0, Landroidx/room/RoomOpenDelegate;

    .line 222
    .local v0, "_openDelegate":Landroidx/room/RoomOpenDelegate;
    return-object v0
.end method

.method public bridge synthetic createOpenDelegate()Landroidx/room/RoomOpenDelegateMarker;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->createOpenDelegate()Landroidx/room/RoomOpenDelegate;

    move-result-object v0

    check-cast v0, Landroidx/room/RoomOpenDelegateMarker;

    return-object v0
.end method

.method public customCategoryDao()Lcom/hardlineforge/lala/data/CustomCategoryDao;
    .locals 1

    .line 266
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_customCategoryDao:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/CustomCategoryDao;

    return-object v0
.end method

.method public editHistoryDao()Lcom/hardlineforge/lala/data/EditHistoryDao;
    .locals 1

    .line 264
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_editHistoryDao:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/EditHistoryDao;

    return-object v0
.end method

.method public getRequiredAutoMigrationSpecClasses()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lkotlin/reflect/KClass<",
            "+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;>;"
        }
    .end annotation

    .line 247
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    .line 248
    .local v0, "_autoMigrationSpecsSet":Ljava/util/Set;
    return-object v0
.end method

.method protected getRequiredTypeConverterClasses()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Ljava/util/List<",
            "Lkotlin/reflect/KClass<",
            "*>;>;>;"
        }
    .end annotation

    .line 236
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    .line 237
    .local v0, "_typeConvertersMap":Ljava/util/Map;
    const-class v1, Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v2, Lcom/hardlineforge/lala/data/LogEntryDao_Impl;->Companion:Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    const-class v1, Lcom/hardlineforge/lala/data/PhotoDao;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v2, Lcom/hardlineforge/lala/data/PhotoDao_Impl;->Companion:Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    const-class v1, Lcom/hardlineforge/lala/data/VideoDao;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v2, Lcom/hardlineforge/lala/data/VideoDao_Impl;->Companion:Lcom/hardlineforge/lala/data/VideoDao_Impl$Companion;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/VideoDao_Impl$Companion;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    const-class v1, Lcom/hardlineforge/lala/data/VideoFrameDao;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v2, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;->Companion:Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    const-class v1, Lcom/hardlineforge/lala/data/EditHistoryDao;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v2, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;->Companion:Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    const-class v1, Lcom/hardlineforge/lala/data/CustomCategoryDao;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    sget-object v2, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->Companion:Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    return-object v0
.end method

.method public logEntryDao()Lcom/hardlineforge/lala/data/LogEntryDao;
    .locals 1

    .line 256
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_logEntryDao:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/LogEntryDao;

    return-object v0
.end method

.method public photoDao()Lcom/hardlineforge/lala/data/PhotoDao;
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_photoDao:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/PhotoDao;

    return-object v0
.end method

.method public videoDao()Lcom/hardlineforge/lala/data/VideoDao;
    .locals 1

    .line 260
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_videoDao:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/VideoDao;

    return-object v0
.end method

.method public videoFrameDao()Lcom/hardlineforge/lala/data/VideoFrameDao;
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->_videoFrameDao:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/data/VideoFrameDao;

    return-object v0
.end method
