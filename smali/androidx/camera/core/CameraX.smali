.class public final Landroidx/camera/core/CameraX;
.super Ljava/lang/Object;
.source "CameraX.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/CameraX$InternalInitState;
    }
.end annotation


# static fields
.field private static final MIN_LOG_LEVEL_LOCK:Ljava/lang/Object;

.field private static final RETRY_SLEEP_MILLIS:J = 0x1f4L

.field private static final RETRY_TOKEN:Ljava/lang/String; = "retry_token"

.field private static final TAG:Ljava/lang/String; = "CameraX"

.field private static final WAIT_INITIALIZED_TIMEOUT_MILLIS:J = 0xbb8L

.field private static final sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAppContext:Landroid/content/Context;

.field private final mCameraExecutor:Ljava/util/concurrent/Executor;

.field private mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

.field final mCameraRepository:Landroidx/camera/core/impl/CameraRepository;

.field private final mCameraXConfig:Landroidx/camera/core/CameraXConfig;

.field private mDefaultConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

.field private final mInitInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mInitState:Landroidx/camera/core/CameraX$InternalInitState;

.field private final mInitializeLock:Ljava/lang/Object;

.field private final mMinLogLevel:Ljava/lang/Integer;

.field private final mSchedulerHandler:Landroid/os/Handler;

.field private final mSchedulerThread:Landroid/os/HandlerThread;

.field private mShutdownInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 94
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/camera/core/CameraX;->MIN_LOG_LEVEL_LOCK:Ljava/lang/Object;

    .line 96
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/camera/core/CameraXConfig$Provider;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "configProvider"    # Landroidx/camera/core/CameraXConfig$Provider;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Landroidx/camera/core/impl/CameraRepository;

    invoke-direct {v0}, Landroidx/camera/core/impl/CameraRepository;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mCameraRepository:Landroidx/camera/core/impl/CameraRepository;

    .line 72
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mInitializeLock:Ljava/lang/Object;

    .line 88
    sget-object v0, Landroidx/camera/core/CameraX$InternalInitState;->UNINITIALIZED:Landroidx/camera/core/CameraX$InternalInitState;

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    .line 90
    nop

    .line 91
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mShutdownInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 100
    if-eqz p2, :cond_0

    .line 101
    invoke-interface {p2}, Landroidx/camera/core/CameraXConfig$Provider;->getCameraXConfig()Landroidx/camera/core/CameraXConfig;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    goto :goto_0

    .line 103
    :cond_0
    nop

    .line 104
    invoke-static {p1}, Landroidx/camera/core/CameraX;->getConfigProvider(Landroid/content/Context;)Landroidx/camera/core/CameraXConfig$Provider;

    move-result-object v1

    .line 106
    .local v1, "provider":Landroidx/camera/core/CameraXConfig$Provider;
    if-eqz v1, :cond_3

    .line 112
    invoke-interface {v1}, Landroidx/camera/core/CameraXConfig$Provider;->getCameraXConfig()Landroidx/camera/core/CameraXConfig;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    .line 115
    .end local v1    # "provider":Landroidx/camera/core/CameraXConfig$Provider;
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    invoke-virtual {v1, v0}, Landroidx/camera/core/CameraXConfig;->getCameraExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v1

    .line 116
    .local v1, "executor":Ljava/util/concurrent/Executor;
    iget-object v2, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    invoke-virtual {v2, v0}, Landroidx/camera/core/CameraXConfig;->getSchedulerHandler(Landroid/os/Handler;)Landroid/os/Handler;

    move-result-object v2

    .line 117
    .local v2, "schedulerHandler":Landroid/os/Handler;
    if-nez v1, :cond_1

    new-instance v3, Landroidx/camera/core/CameraExecutor;

    invoke-direct {v3}, Landroidx/camera/core/CameraExecutor;-><init>()V

    goto :goto_1

    :cond_1
    move-object v3, v1

    :goto_1
    iput-object v3, p0, Landroidx/camera/core/CameraX;->mCameraExecutor:Ljava/util/concurrent/Executor;

    .line 118
    if-nez v2, :cond_2

    .line 119
    new-instance v3, Landroid/os/HandlerThread;

    const-string v4, "CameraX-scheduler"

    const/16 v5, 0xa

    invoke-direct {v3, v4, v5}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v3, p0, Landroidx/camera/core/CameraX;->mSchedulerThread:Landroid/os/HandlerThread;

    .line 121
    iget-object v3, p0, Landroidx/camera/core/CameraX;->mSchedulerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 122
    iget-object v3, p0, Landroidx/camera/core/CameraX;->mSchedulerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-static {v3}, Landroidx/core/os/HandlerCompat;->createAsync(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object v3

    iput-object v3, p0, Landroidx/camera/core/CameraX;->mSchedulerHandler:Landroid/os/Handler;

    goto :goto_2

    .line 124
    :cond_2
    iput-object v0, p0, Landroidx/camera/core/CameraX;->mSchedulerThread:Landroid/os/HandlerThread;

    .line 125
    iput-object v2, p0, Landroidx/camera/core/CameraX;->mSchedulerHandler:Landroid/os/Handler;

    .line 129
    :goto_2
    iget-object v3, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    sget-object v4, Landroidx/camera/core/CameraXConfig;->OPTION_MIN_LOGGING_LEVEL:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v3, v4, v0}, Landroidx/camera/core/CameraXConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mMinLogLevel:Ljava/lang/Integer;

    .line 130
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mMinLogLevel:Ljava/lang/Integer;

    invoke-static {v0}, Landroidx/camera/core/CameraX;->increaseMinLogLevelReference(Ljava/lang/Integer;)V

    .line 132
    invoke-direct {p0, p1}, Landroidx/camera/core/CameraX;->initInternal(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mInitInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 133
    return-void

    .line 107
    .end local v2    # "schedulerHandler":Landroid/os/Handler;
    .local v1, "provider":Landroidx/camera/core/CameraXConfig$Provider;
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "CameraX is not configured properly. The most likely cause is you did not include a default implementation in your build such as \'camera-camera2\'."

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static decreaseMinLogLevelReference(Ljava/lang/Integer;)V
    .locals 5
    .param p0, "minLogLevel"    # Ljava/lang/Integer;

    .line 454
    sget-object v0, Landroidx/camera/core/CameraX;->MIN_LOG_LEVEL_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 455
    if-nez p0, :cond_0

    .line 456
    :try_start_0
    monitor-exit v0

    return-void

    .line 459
    :cond_0
    sget-object v1, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 461
    .local v1, "refCount":I
    if-nez v1, :cond_1

    .line 463
    sget-object v2, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_0

    .line 466
    :cond_1
    sget-object v2, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 468
    :goto_0
    invoke-static {}, Landroidx/camera/core/CameraX;->updateOrResetMinLogLevel()V

    .line 469
    .end local v1    # "refCount":I
    monitor-exit v0

    .line 470
    return-void

    .line 469
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static getConfigProvider(Landroid/content/Context;)Landroidx/camera/core/CameraXConfig$Provider;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .line 154
    const-string v0, "CameraX"

    const/4 v1, 0x0

    .line 155
    .local v1, "configProvider":Landroidx/camera/core/CameraXConfig$Provider;
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationFromContext(Landroid/content/Context;)Landroid/app/Application;

    move-result-object v2

    .line 156
    .local v2, "application":Landroid/app/Application;
    instance-of v3, v2, Landroidx/camera/core/CameraXConfig$Provider;

    if-eqz v3, :cond_0

    .line 158
    move-object v1, v2

    check-cast v1, Landroidx/camera/core/CameraXConfig$Provider;

    goto :goto_1

    .line 163
    :cond_0
    :try_start_0
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v3

    .line 164
    .local v3, "appContext":Landroid/content/Context;
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    new-instance v5, Landroid/content/ComponentName;

    const-class v6, Landroidx/camera/core/impl/MetadataHolderService;

    invoke-direct {v5, v3, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v6, 0x280

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v4

    .line 168
    .local v4, "serviceInfo":Landroid/content/pm/ServiceInfo;
    const/4 v5, 0x0

    .line 169
    .local v5, "defaultProviderClassName":Ljava/lang/String;
    iget-object v6, v4, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    if-eqz v6, :cond_1

    .line 170
    iget-object v6, v4, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    const-string/jumbo v7, "androidx.camera.core.impl.MetadataHolderService.DEFAULT_CONFIG_PROVIDER"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    .line 174
    :cond_1
    if-nez v5, :cond_2

    .line 175
    const-string v6, "No default CameraXConfig.Provider specified in meta-data. The most likely cause is you did not include a default implementation in your build such as \'camera-camera2\'."

    invoke-static {v0, v6}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    const/4 v0, 0x0

    return-object v0

    .line 181
    :cond_2
    nop

    .line 182
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 183
    .local v6, "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    new-array v8, v7, [Ljava/lang/Class;

    .line 184
    invoke-virtual {v6, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    new-array v7, v7, [Ljava/lang/Object;

    .line 185
    invoke-virtual {v8, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/CameraXConfig$Provider;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v7

    .line 195
    .end local v3    # "appContext":Landroid/content/Context;
    .end local v4    # "serviceInfo":Landroid/content/pm/ServiceInfo;
    .end local v5    # "defaultProviderClassName":Ljava/lang/String;
    .end local v6    # "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_1

    .line 186
    :catch_0
    move-exception v3

    goto :goto_0

    :catch_1
    move-exception v3

    goto :goto_0

    :catch_2
    move-exception v3

    goto :goto_0

    :catch_3
    move-exception v3

    goto :goto_0

    :catch_4
    move-exception v3

    goto :goto_0

    :catch_5
    move-exception v3

    goto :goto_0

    :catch_6
    move-exception v3

    .line 193
    .local v3, "e":Ljava/lang/Exception;
    :goto_0
    const-string v4, "Failed to retrieve default CameraXConfig.Provider from meta-data"

    invoke-static {v0, v4, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 198
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v1
.end method

.method private static increaseMinLogLevelReference(Ljava/lang/Integer;)V
    .locals 5
    .param p0, "minLogLevel"    # Ljava/lang/Integer;

    .line 435
    sget-object v0, Landroidx/camera/core/CameraX;->MIN_LOG_LEVEL_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 436
    if-nez p0, :cond_0

    .line 437
    :try_start_0
    monitor-exit v0

    return-void

    .line 440
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string/jumbo v2, "minLogLevel"

    const/4 v3, 0x3

    const/4 v4, 0x6

    invoke-static {v1, v3, v4, v2}, Landroidx/core/util/Preconditions;->checkArgumentInRange(IIILjava/lang/String;)I

    .line 442
    const/4 v1, 0x1

    .line 445
    .local v1, "refCount":I
    sget-object v2, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 446
    sget-object v2, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 448
    :cond_1
    sget-object v2, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 449
    invoke-static {}, Landroidx/camera/core/CameraX;->updateOrResetMinLogLevel()V

    .line 450
    .end local v1    # "refCount":I
    monitor-exit v0

    .line 451
    return-void

    .line 450
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private initAndRetryRecursively(Ljava/util/concurrent/Executor;JLandroid/content/Context;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 7
    .param p1, "cameraExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "startMs"    # J
    .param p4, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "J",
            "Landroid/content/Context;",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 283
    .local p5, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    new-instance v0, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda4;

    move-object v1, p0

    move-object v3, p1

    move-wide v5, p2

    move-object v2, p4

    move-object v4, p5

    .end local p1    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p2    # "startMs":J
    .end local p4    # "context":Landroid/content/Context;
    .end local p5    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    .local v2, "context":Landroid/content/Context;
    .local v3, "cameraExecutor":Ljava/util/concurrent/Executor;
    .local v4, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    .local v5, "startMs":J
    invoke-direct/range {v0 .. v6}, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/CameraX;Landroid/content/Context;Ljava/util/concurrent/Executor;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V

    invoke-interface {v3, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 370
    return-void
.end method

.method private initInternal(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 262
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mInitializeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 263
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    sget-object v2, Landroidx/camera/core/CameraX$InternalInitState;->UNINITIALIZED:Landroidx/camera/core/CameraX$InternalInitState;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "CameraX.initInternal() should only be called once per instance"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 265
    sget-object v1, Landroidx/camera/core/CameraX$InternalInitState;->INITIALIZING:Landroidx/camera/core/CameraX$InternalInitState;

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    .line 266
    new-instance v1, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/CameraX;Landroid/content/Context;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 272
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private setStateToInitialized()V
    .locals 2

    .line 373
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mInitializeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 374
    :try_start_0
    sget-object v1, Landroidx/camera/core/CameraX$InternalInitState;->INITIALIZED:Landroidx/camera/core/CameraX$InternalInitState;

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    .line 375
    monitor-exit v0

    .line 376
    return-void

    .line 375
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private shutdownInternal()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 380
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mInitializeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 381
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mSchedulerHandler:Landroid/os/Handler;

    const-string/jumbo v2, "retry_token"

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 382
    sget-object v1, Landroidx/camera/core/CameraX$1;->$SwitchMap$androidx$camera$core$CameraX$InternalInitState:[I

    iget-object v2, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    invoke-virtual {v2}, Landroidx/camera/core/CameraX$InternalInitState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 393
    :pswitch_0
    sget-object v1, Landroidx/camera/core/CameraX$InternalInitState;->SHUTDOWN:Landroidx/camera/core/CameraX$InternalInitState;

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    .line 394
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mMinLogLevel:Ljava/lang/Integer;

    invoke-static {v1}, Landroidx/camera/core/CameraX;->decreaseMinLogLevelReference(Ljava/lang/Integer;)V

    .line 395
    new-instance v1, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/CameraX;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mShutdownInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    goto :goto_0

    .line 388
    :pswitch_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "CameraX could not be shutdown when it is initializing."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 384
    :pswitch_2
    sget-object v1, Landroidx/camera/core/CameraX$InternalInitState;->SHUTDOWN:Landroidx/camera/core/CameraX$InternalInitState;

    iput-object v1, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    .line 385
    const/4 v1, 0x0

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 421
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mShutdownInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    monitor-exit v0

    return-object v1

    .line 422
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static updateOrResetMinLogLevel()V
    .locals 2

    .line 476
    sget-object v0, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 477
    invoke-static {}, Landroidx/camera/core/Logger;->resetMinLogLevel()V

    .line 478
    return-void

    .line 483
    :cond_0
    sget-object v0, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 484
    invoke-static {v1}, Landroidx/camera/core/Logger;->setMinLogLevel(I)V

    goto :goto_0

    .line 485
    :cond_1
    sget-object v0, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 486
    invoke-static {v1}, Landroidx/camera/core/Logger;->setMinLogLevel(I)V

    goto :goto_0

    .line 487
    :cond_2
    sget-object v0, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 488
    invoke-static {v1}, Landroidx/camera/core/Logger;->setMinLogLevel(I)V

    goto :goto_0

    .line 489
    :cond_3
    sget-object v0, Landroidx/camera/core/CameraX;->sMinLogLevelReferenceCountMap:Landroid/util/SparseArray;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 490
    invoke-static {v1}, Landroidx/camera/core/Logger;->setMinLogLevel(I)V

    .line 492
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public getCameraDeviceSurfaceManager()Landroidx/camera/core/impl/CameraDeviceSurfaceManager;
    .locals 2

    .line 210
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    return-object v0

    .line 211
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CameraX not initialized yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCameraFactory()Landroidx/camera/core/impl/CameraFactory;
    .locals 2

    .line 144
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    return-object v0

    .line 145
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CameraX not initialized yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCameraRepository()Landroidx/camera/core/impl/CameraRepository;
    .locals 1

    .line 224
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraRepository:Landroidx/camera/core/impl/CameraRepository;

    return-object v0
.end method

.method public getDefaultConfigFactory()Landroidx/camera/core/impl/UseCaseConfigFactory;
    .locals 2

    .line 234
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mDefaultConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mDefaultConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    return-object v0

    .line 235
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CameraX not initialized yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getInitializeFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 248
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mInitInternalFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method isInitialized()Z
    .locals 3

    .line 429
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mInitializeLock:Ljava/lang/Object;

    monitor-enter v0

    .line 430
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    sget-object v2, Landroidx/camera/core/CameraX$InternalInitState;->INITIALIZED:Landroidx/camera/core/CameraX$InternalInitState;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 431
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$initAndRetryRecursively$1$androidx-camera-core-CameraX(Ljava/util/concurrent/Executor;JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 6
    .param p1, "cameraExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "startMs"    # J
    .param p4, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 346
    iget-object v4, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v5, p4

    .end local p1    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p2    # "startMs":J
    .end local p4    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v1, "cameraExecutor":Ljava/util/concurrent/Executor;
    .local v2, "startMs":J
    .local v5, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/CameraX;->initAndRetryRecursively(Ljava/util/concurrent/Executor;JLandroid/content/Context;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    return-void
.end method

.method synthetic lambda$initAndRetryRecursively$2$androidx-camera-core-CameraX(Landroid/content/Context;Ljava/util/concurrent/Executor;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p4, "startMs"    # J

    .line 287
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p1}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationFromContext(Landroid/content/Context;)Landroid/app/Application;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    .line 288
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 289
    invoke-static {p1}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    .line 291
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    .line 292
    invoke-virtual {v0, v1}, Landroidx/camera/core/CameraXConfig;->getCameraFactoryProvider(Landroidx/camera/core/impl/CameraFactory$Provider;)Landroidx/camera/core/impl/CameraFactory$Provider;

    move-result-object v0

    .line 293
    .local v0, "cameraFactoryProvider":Landroidx/camera/core/impl/CameraFactory$Provider;
    if-eqz v0, :cond_4

    .line 299
    iget-object v2, p0, Landroidx/camera/core/CameraX;->mCameraExecutor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Landroidx/camera/core/CameraX;->mSchedulerHandler:Landroid/os/Handler;

    invoke-static {v2, v3}, Landroidx/camera/core/impl/CameraThreadConfig;->create(Ljava/util/concurrent/Executor;Landroid/os/Handler;)Landroidx/camera/core/impl/CameraThreadConfig;

    move-result-object v2

    .line 302
    .local v2, "cameraThreadConfig":Landroidx/camera/core/impl/CameraThreadConfig;
    iget-object v3, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    .line 303
    invoke-virtual {v3, v1}, Landroidx/camera/core/CameraXConfig;->getAvailableCamerasLimiter(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraSelector;

    move-result-object v3

    .line 304
    .local v3, "availableCamerasLimiter":Landroidx/camera/core/CameraSelector;
    iget-object v4, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    invoke-interface {v0, v4, v2, v3}, Landroidx/camera/core/impl/CameraFactory$Provider;->newInstance(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/impl/CameraFactory;

    move-result-object v4

    iput-object v4, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    .line 306
    iget-object v4, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    .line 307
    invoke-virtual {v4, v1}, Landroidx/camera/core/CameraXConfig;->getDeviceSurfaceManagerProvider(Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;)Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;

    move-result-object v4

    .line 308
    .local v4, "surfaceManagerProvider":Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;
    if-eqz v4, :cond_3

    .line 313
    iget-object v5, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    iget-object v6, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    .line 314
    invoke-interface {v6}, Landroidx/camera/core/impl/CameraFactory;->getCameraManager()Ljava/lang/Object;

    move-result-object v6

    iget-object v7, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    .line 315
    invoke-interface {v7}, Landroidx/camera/core/impl/CameraFactory;->getAvailableCameraIds()Ljava/util/Set;

    move-result-object v7

    .line 313
    invoke-interface {v4, v5, v6, v7}, Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;->newInstance(Landroid/content/Context;Ljava/lang/Object;Ljava/util/Set;)Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/core/CameraX;->mSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    .line 317
    iget-object v5, p0, Landroidx/camera/core/CameraX;->mCameraXConfig:Landroidx/camera/core/CameraXConfig;

    .line 318
    invoke-virtual {v5, v1}, Landroidx/camera/core/CameraXConfig;->getUseCaseConfigFactoryProvider(Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;)Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;

    move-result-object v5

    .line 319
    .local v5, "configFactoryProvider":Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;
    if-eqz v5, :cond_2

    .line 324
    iget-object v6, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    invoke-interface {v5, v6}, Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;->newInstance(Landroid/content/Context;)Landroidx/camera/core/impl/UseCaseConfigFactory;

    move-result-object v6

    iput-object v6, p0, Landroidx/camera/core/CameraX;->mDefaultConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 326
    instance-of v6, p2, Landroidx/camera/core/CameraExecutor;

    if-eqz v6, :cond_1

    .line 327
    move-object v6, p2

    check-cast v6, Landroidx/camera/core/CameraExecutor;

    .line 328
    .local v6, "executor":Landroidx/camera/core/CameraExecutor;
    iget-object v7, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    invoke-virtual {v6, v7}, Landroidx/camera/core/CameraExecutor;->init(Landroidx/camera/core/impl/CameraFactory;)V

    .line 331
    .end local v6    # "executor":Landroidx/camera/core/CameraExecutor;
    :cond_1
    iget-object v6, p0, Landroidx/camera/core/CameraX;->mCameraRepository:Landroidx/camera/core/impl/CameraRepository;

    iget-object v7, p0, Landroidx/camera/core/CameraX;->mCameraFactory:Landroidx/camera/core/impl/CameraFactory;

    invoke-virtual {v6, v7}, Landroidx/camera/core/impl/CameraRepository;->init(Landroidx/camera/core/impl/CameraFactory;)V

    .line 334
    iget-object v6, p0, Landroidx/camera/core/CameraX;->mAppContext:Landroid/content/Context;

    iget-object v7, p0, Landroidx/camera/core/CameraX;->mCameraRepository:Landroidx/camera/core/impl/CameraRepository;

    invoke-static {v6, v7, v3}, Landroidx/camera/core/impl/CameraValidator;->validateCameras(Landroid/content/Context;Landroidx/camera/core/impl/CameraRepository;Landroidx/camera/core/CameraSelector;)V

    .line 338
    invoke-direct {p0}, Landroidx/camera/core/CameraX;->setStateToInitialized()V

    .line 339
    invoke-virtual {p3, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 368
    move-object v5, p2

    move-object v8, p3

    move-wide v6, p4

    .end local v0    # "cameraFactoryProvider":Landroidx/camera/core/impl/CameraFactory$Provider;
    .end local v2    # "cameraThreadConfig":Landroidx/camera/core/impl/CameraThreadConfig;
    .end local v3    # "availableCamerasLimiter":Landroidx/camera/core/CameraSelector;
    .end local v4    # "surfaceManagerProvider":Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;
    .end local v5    # "configFactoryProvider":Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;
    goto/16 :goto_1

    .line 320
    .restart local v0    # "cameraFactoryProvider":Landroidx/camera/core/impl/CameraFactory$Provider;
    .restart local v2    # "cameraThreadConfig":Landroidx/camera/core/impl/CameraThreadConfig;
    .restart local v3    # "availableCamerasLimiter":Landroidx/camera/core/CameraSelector;
    .restart local v4    # "surfaceManagerProvider":Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;
    .restart local v5    # "configFactoryProvider":Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;
    :cond_2
    new-instance v6, Landroidx/camera/core/InitializationException;

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Invalid app configuration provided. Missing UseCaseConfigFactory."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .end local p4    # "startMs":J
    throw v6

    .line 309
    .end local v5    # "configFactoryProvider":Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .restart local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .restart local p4    # "startMs":J
    :cond_3
    new-instance v5, Landroidx/camera/core/InitializationException;

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Invalid app configuration provided. Missing CameraDeviceSurfaceManager."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .end local p4    # "startMs":J
    throw v5

    .line 294
    .end local v2    # "cameraThreadConfig":Landroidx/camera/core/impl/CameraThreadConfig;
    .end local v3    # "availableCamerasLimiter":Landroidx/camera/core/CameraSelector;
    .end local v4    # "surfaceManagerProvider":Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .restart local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .restart local p4    # "startMs":J
    :cond_4
    new-instance v2, Landroidx/camera/core/InitializationException;

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Invalid app configuration provided. Missing CameraFactory."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .end local p4    # "startMs":J
    throw v2
    :try_end_0
    .catch Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroidx/camera/core/InitializationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    .end local v0    # "cameraFactoryProvider":Landroidx/camera/core/impl/CameraFactory$Provider;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .restart local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .restart local p4    # "startMs":J
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    :goto_0
    move-object v2, v0

    .line 342
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v3, p4

    const-wide/16 v5, 0x9c4

    cmp-long v0, v3, v5

    if-gez v0, :cond_5

    .line 344
    const-string v0, "CameraX"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Retry init. Start time "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " current time "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 345
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 344
    invoke-static {v0, v1, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 346
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mSchedulerHandler:Landroid/os/Handler;

    new-instance v3, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda3;

    move-object v4, p0

    move-object v5, p2

    move-object v8, p3

    move-wide v6, p4

    .end local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .end local p4    # "startMs":J
    .local v5, "cameraExecutor":Ljava/util/concurrent/Executor;
    .local v6, "startMs":J
    .local v8, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    invoke-direct/range {v3 .. v8}, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/CameraX;Ljava/util/concurrent/Executor;JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    const-string/jumbo p2, "retry_token"

    const-wide/16 p3, 0x1f4

    invoke-static {v0, v3, p2, p3, p4}, Landroidx/core/os/HandlerCompat;->postDelayed(Landroid/os/Handler;Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    goto :goto_1

    .line 351
    .end local v5    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local v6    # "startMs":J
    .end local v8    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .restart local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .restart local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .restart local p4    # "startMs":J
    :cond_5
    move-object v5, p2

    move-object v8, p3

    move-wide v6, p4

    .end local p2    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .end local p3    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .end local p4    # "startMs":J
    .restart local v5    # "cameraExecutor":Ljava/util/concurrent/Executor;
    .restart local v6    # "startMs":J
    .restart local v8    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    iget-object p2, p0, Landroidx/camera/core/CameraX;->mInitializeLock:Ljava/lang/Object;

    monitor-enter p2

    .line 352
    :try_start_1
    sget-object p3, Landroidx/camera/core/CameraX$InternalInitState;->INITIALIZING_ERROR:Landroidx/camera/core/CameraX$InternalInitState;

    iput-object p3, p0, Landroidx/camera/core/CameraX;->mInitState:Landroidx/camera/core/CameraX$InternalInitState;

    .line 353
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 354
    instance-of p2, v2, Landroidx/camera/core/impl/CameraValidator$CameraIdListIncorrectException;

    if-eqz p2, :cond_6

    .line 357
    const-string p2, "CameraX"

    const-string/jumbo p3, "The device might underreport the amount of the cameras. Finish the initialize task since we are already reaching the maximum number of retries."

    invoke-static {p2, p3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    invoke-virtual {v8, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    goto :goto_1

    .line 361
    :cond_6
    instance-of p2, v2, Landroidx/camera/core/InitializationException;

    if-eqz p2, :cond_7

    .line 362
    invoke-virtual {v8, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    goto :goto_1

    .line 365
    :cond_7
    new-instance p2, Landroidx/camera/core/InitializationException;

    invoke-direct {p2, v2}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v8, p2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 369
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 353
    .restart local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    move-object p3, v0

    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p3
.end method

.method synthetic lambda$initInternal$0$androidx-camera-core-CameraX(Landroid/content/Context;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 268
    iget-object v1, p0, Landroidx/camera/core/CameraX;->mCameraExecutor:Ljava/util/concurrent/Executor;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v4, "context":Landroid/content/Context;
    .local v5, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/CameraX;->initAndRetryRecursively(Ljava/util/concurrent/Executor;JLandroid/content/Context;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 270
    const-string p1, "CameraX initInternal"

    return-object p1
.end method

.method synthetic lambda$shutdownInternal$3$androidx-camera-core-CameraX(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 401
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mSchedulerThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    .line 404
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraExecutor:Ljava/util/concurrent/Executor;

    instance-of v0, v0, Landroidx/camera/core/CameraExecutor;

    if-eqz v0, :cond_0

    .line 405
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraExecutor:Ljava/util/concurrent/Executor;

    check-cast v0, Landroidx/camera/core/CameraExecutor;

    .line 407
    .local v0, "executor":Landroidx/camera/core/CameraExecutor;
    invoke-virtual {v0}, Landroidx/camera/core/CameraExecutor;->deinit()V

    .line 409
    .end local v0    # "executor":Landroidx/camera/core/CameraExecutor;
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mSchedulerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 411
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 412
    return-void
.end method

.method synthetic lambda$shutdownInternal$4$androidx-camera-core-CameraX(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 397
    iget-object v0, p0, Landroidx/camera/core/CameraX;->mCameraRepository:Landroidx/camera/core/impl/CameraRepository;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraRepository;->deinit()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 400
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v1, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/CameraX$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/CameraX;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    iget-object v2, p0, Landroidx/camera/core/CameraX;->mCameraExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 413
    const-string v1, "CameraX shutdownInternal"

    return-object v1
.end method

.method public shutdown()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 258
    invoke-direct {p0}, Landroidx/camera/core/CameraX;->shutdownInternal()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
