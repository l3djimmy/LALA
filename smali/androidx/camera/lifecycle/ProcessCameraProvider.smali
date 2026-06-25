.class public final Landroidx/camera/lifecycle/ProcessCameraProvider;
.super Ljava/lang/Object;
.source "ProcessCameraProvider.java"

# interfaces
.implements Landroidx/camera/lifecycle/LifecycleCameraProvider;


# static fields
.field private static final sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;


# instance fields
.field private mCameraX:Landroidx/camera/core/CameraX;

.field private mCameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

.field private mCameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/CameraX;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private final mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

.field private final mLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    new-instance v0, Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-direct {v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;-><init>()V

    sput-object v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 886
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLock:Ljava/lang/Object;

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    .line 109
    nop

    .line 110
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 112
    new-instance v0, Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-direct {v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;-><init>()V

    iput-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    .line 887
    return-void
.end method

.method public static configureInstance(Landroidx/camera/core/CameraXConfig;)V
    .locals 1
    .param p0, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;

    .line 257
    sget-object v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-direct {v0, p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->configureInstanceInternal(Landroidx/camera/core/CameraXConfig;)V

    .line 258
    return-void
.end method

.method private configureInstanceInternal(Landroidx/camera/core/CameraXConfig;)V
    .locals 3
    .param p1, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;

    .line 261
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 262
    :try_start_0
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    iget-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "CameraX has already been configured. To use a different configuration, shutdown() must be called."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 267
    new-instance v1, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/CameraXConfig;)V

    iput-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    .line 268
    monitor-exit v0

    .line 269
    return-void

    .line 268
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getActiveConcurrentCameraInfos()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 863
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 864
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    .line 866
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    .line 867
    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->getActiveConcurrentCameraInfos()Ljava/util/List;

    move-result-object v0

    .line 866
    return-object v0
.end method

.method private getCameraInfoFromCameraSelector(Landroidx/camera/core/CameraSelector;Ljava/util/List;)Landroidx/camera/core/CameraInfo;
    .locals 2
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/CameraSelector;",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;)",
            "Landroidx/camera/core/CameraInfo;"
        }
    .end annotation

    .line 882
    .local p2, "availableCameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    invoke-virtual {p1, p2}, Landroidx/camera/core/CameraSelector;->filter(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 883
    .local v0, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/CameraInfo;

    :goto_0
    return-object v1
.end method

.method private getCameraOperatingMode()I
    .locals 1

    .line 847
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 848
    const/4 v0, 0x0

    return v0

    .line 850
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v0

    return v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/lifecycle/ProcessCameraProvider;",
            ">;"
        }
    .end annotation

    .line 181
    invoke-static {p0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-direct {v0, p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getOrCreateCameraXInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda3;-><init>(Landroid/content/Context;)V

    .line 187
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 182
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method private getOrCreateCameraXInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/CameraX;",
            ">;"
        }
    .end annotation

    .line 191
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 192
    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    monitor-exit v0

    return-object v1

    .line 196
    :cond_0
    new-instance v1, Landroidx/camera/core/CameraX;

    iget-object v2, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    invoke-direct {v1, p1, v2}, Landroidx/camera/core/CameraX;-><init>(Landroid/content/Context;Landroidx/camera/core/CameraXConfig$Provider;)V

    .line 198
    .local v1, "cameraX":Landroidx/camera/core/CameraX;
    new-instance v2, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v1}, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/lifecycle/ProcessCameraProvider;Landroidx/camera/core/CameraX;)V

    invoke-static {v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 221
    iget-object v2, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    monitor-exit v0

    return-object v2

    .line 222
    .end local v1    # "cameraX":Landroidx/camera/core/CameraX;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static synthetic lambda$configureInstanceInternal$3(Landroidx/camera/core/CameraXConfig;)Landroidx/camera/core/CameraXConfig;
    .locals 0
    .param p0, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;

    .line 267
    return-object p0
.end method

.method static synthetic lambda$getInstance$0(Landroid/content/Context;Landroidx/camera/core/CameraX;)Landroidx/camera/lifecycle/ProcessCameraProvider;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cameraX"    # Landroidx/camera/core/CameraX;

    .line 184
    sget-object v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-direct {v0, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setCameraX(Landroidx/camera/core/CameraX;)V

    .line 185
    sget-object v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;

    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setContext(Landroid/content/Context;)V

    .line 186
    sget-object v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->sAppInstance:Landroidx/camera/lifecycle/ProcessCameraProvider;

    return-object v0
.end method

.method static synthetic lambda$getOrCreateCameraXInstance$1(Landroidx/camera/core/CameraX;Ljava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "cameraX"    # Landroidx/camera/core/CameraX;
    .param p1, "input"    # Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 202
    invoke-virtual {p0}, Landroidx/camera/core/CameraX;->getInitializeFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method private setActiveConcurrentCameraInfos(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;)V"
        }
    .end annotation

    .line 871
    .local p1, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 872
    return-void

    .line 874
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    .line 875
    invoke-interface {v0, p1}, Landroidx/camera/core/concurrent/CameraCoordinator;->setActiveConcurrentCameraInfos(Ljava/util/List;)V

    .line 876
    return-void
.end method

.method private setCameraOperatingMode(I)V
    .locals 1
    .param p1, "cameraOperatingMode"    # I

    .line 854
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    if-nez v0, :cond_0

    .line 855
    return-void

    .line 857
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    .line 858
    invoke-interface {v0, p1}, Landroidx/camera/core/concurrent/CameraCoordinator;->setCameraOperatingMode(I)V

    .line 859
    return-void
.end method

.method private setCameraX(Landroidx/camera/core/CameraX;)V
    .locals 0
    .param p1, "cameraX"    # Landroidx/camera/core/CameraX;

    .line 312
    iput-object p1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 313
    return-void
.end method

.method private setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 316
    iput-object p1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mContext:Landroid/content/Context;

    .line 317
    return-void
.end method


# virtual methods
.method public bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/UseCaseGroup;)Landroidx/camera/core/Camera;
    .locals 7
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "useCaseGroup"    # Landroidx/camera/core/UseCaseGroup;

    .line 410
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraOperatingMode()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 414
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setCameraOperatingMode(I)V

    .line 415
    nop

    .line 416
    invoke-virtual {p3}, Landroidx/camera/core/UseCaseGroup;->getViewPort()Landroidx/camera/core/ViewPort;

    move-result-object v4

    invoke-virtual {p3}, Landroidx/camera/core/UseCaseGroup;->getEffects()Ljava/util/List;

    move-result-object v5

    .line 417
    invoke-virtual {p3}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, [Landroidx/camera/core/UseCase;

    .line 415
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .local v2, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v3, "cameraSelector":Landroidx/camera/core/CameraSelector;
    invoke-virtual/range {v1 .. v6}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/ViewPort;Ljava/util/List;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    move-result-object p1

    .line 418
    .local p1, "camera":Landroidx/camera/core/Camera;
    return-object p1

    .line 411
    .end local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v3    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .local p1, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    :cond_0
    move-object v2, p1

    move-object v3, p2

    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v3    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo p2, "bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method varargs bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/ViewPort;Ljava/util/List;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;
    .locals 16
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "viewPort"    # Landroidx/camera/core/ViewPort;
    .param p5, "useCases"    # [Landroidx/camera/core/UseCase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/LifecycleOwner;",
            "Landroidx/camera/core/CameraSelector;",
            "Landroidx/camera/core/ViewPort;",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;[",
            "Landroidx/camera/core/UseCase;",
            ")",
            "Landroidx/camera/core/Camera;"
        }
    .end annotation

    .line 568
    .local p4, "effects":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraEffect;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 572
    nop

    .line 573
    invoke-static/range {p2 .. p2}, Landroidx/camera/core/CameraSelector$Builder;->fromSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v3

    .line 575
    .local v3, "selectorBuilder":Landroidx/camera/core/CameraSelector$Builder;
    array-length v4, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_1

    aget-object v7, v2, v6

    .line 576
    .local v7, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v7}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroidx/camera/core/impl/UseCaseConfig;->getCameraSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraSelector;

    move-result-object v8

    .line 577
    .local v8, "selector":Landroidx/camera/core/CameraSelector;
    if-eqz v8, :cond_0

    .line 578
    invoke-virtual {v8}, Landroidx/camera/core/CameraSelector;->getCameraFilterSet()Ljava/util/LinkedHashSet;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/CameraFilter;

    .line 579
    .local v10, "filter":Landroidx/camera/core/CameraFilter;
    invoke-virtual {v3, v10}, Landroidx/camera/core/CameraSelector$Builder;->addCameraFilter(Landroidx/camera/core/CameraFilter;)Landroidx/camera/core/CameraSelector$Builder;

    .line 580
    .end local v10    # "filter":Landroidx/camera/core/CameraFilter;
    goto :goto_1

    .line 575
    .end local v7    # "useCase":Landroidx/camera/core/UseCase;
    .end local v8    # "selector":Landroidx/camera/core/CameraSelector;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 584
    :cond_1
    invoke-virtual {v3}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v4

    .line 586
    .local v4, "modifiedSelector":Landroidx/camera/core/CameraSelector;
    iget-object v6, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 587
    invoke-virtual {v6}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroidx/camera/core/CameraSelector;->filter(Ljava/util/LinkedHashSet;)Ljava/util/LinkedHashSet;

    move-result-object v6

    .line 588
    .local v6, "cameraInternals":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-virtual {v6}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_c

    .line 592
    nop

    .line 593
    invoke-static {v6}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->generateCameraId(Ljava/util/LinkedHashSet;)Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    move-result-object v7

    .line 595
    .local v7, "cameraId":Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;
    iget-object v8, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    .line 596
    invoke-virtual {v8, v1, v7}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCamera(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;)Landroidx/camera/lifecycle/LifecycleCamera;

    move-result-object v8

    .line 598
    .local v8, "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    iget-object v9, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    .line 599
    invoke-virtual {v9}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameras()Ljava/util/Collection;

    move-result-object v9

    .line 600
    .local v9, "lifecycleCameras":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/lifecycle/LifecycleCamera;>;"
    array-length v10, v2

    :goto_2
    if-ge v5, v10, :cond_5

    aget-object v11, v2, v5

    .line 601
    .local v11, "useCase":Landroidx/camera/core/UseCase;
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 602
    .local v13, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {v13, v11}, Landroidx/camera/lifecycle/LifecycleCamera;->isBound(Landroidx/camera/core/UseCase;)Z

    move-result v14

    if-eqz v14, :cond_3

    if-ne v13, v8, :cond_2

    goto :goto_4

    .line 604
    :cond_2
    new-instance v5, Ljava/lang/IllegalStateException;

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v10

    .line 605
    const-string/jumbo v12, "Use case %s already bound to a different lifecycle."

    invoke-static {v12, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v5, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 609
    .end local v13    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_3
    :goto_4
    goto :goto_3

    .line 600
    .end local v11    # "useCase":Landroidx/camera/core/UseCase;
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 614
    :cond_5
    if-nez v8, :cond_6

    .line 615
    iget-object v5, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    new-instance v10, Landroidx/camera/core/internal/CameraUseCaseAdapter;

    iget-object v11, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 618
    invoke-virtual {v11}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v11

    invoke-interface {v11}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v11

    iget-object v12, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 619
    invoke-virtual {v12}, Landroidx/camera/core/CameraX;->getCameraDeviceSurfaceManager()Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    move-result-object v12

    iget-object v13, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 620
    invoke-virtual {v13}, Landroidx/camera/core/CameraX;->getDefaultConfigFactory()Landroidx/camera/core/impl/UseCaseConfigFactory;

    move-result-object v13

    invoke-direct {v10, v6, v11, v12, v13}, Landroidx/camera/core/internal/CameraUseCaseAdapter;-><init>(Ljava/util/LinkedHashSet;Landroidx/camera/core/concurrent/CameraCoordinator;Landroidx/camera/core/impl/CameraDeviceSurfaceManager;Landroidx/camera/core/impl/UseCaseConfigFactory;)V

    .line 616
    invoke-virtual {v5, v1, v10}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->createLifecycleCamera(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/internal/CameraUseCaseAdapter;)Landroidx/camera/lifecycle/LifecycleCamera;

    move-result-object v8

    move-object v11, v8

    goto :goto_5

    .line 614
    :cond_6
    move-object v11, v8

    .line 623
    .end local v8    # "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    .local v11, "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    :goto_5
    const/4 v5, 0x0

    .line 626
    .local v5, "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/CameraSelector;->getCameraFilterSet()Ljava/util/LinkedHashSet;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/CameraFilter;

    .line 627
    .local v10, "cameraFilter":Landroidx/camera/core/CameraFilter;
    invoke-interface {v10}, Landroidx/camera/core/CameraFilter;->getIdentifier()Landroidx/camera/core/impl/Identifier;

    move-result-object v12

    sget-object v13, Landroidx/camera/core/CameraFilter;->DEFAULT_ID:Landroidx/camera/core/impl/Identifier;

    if-eq v12, v13, :cond_9

    .line 628
    nop

    .line 630
    invoke-interface {v10}, Landroidx/camera/core/CameraFilter;->getIdentifier()Landroidx/camera/core/impl/Identifier;

    move-result-object v12

    .line 629
    invoke-static {v12}, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->getConfigProvider(Ljava/lang/Object;)Landroidx/camera/core/impl/CameraConfigProvider;

    move-result-object v12

    .line 631
    invoke-virtual {v11}, Landroidx/camera/lifecycle/LifecycleCamera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v13

    iget-object v14, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mContext:Landroid/content/Context;

    .line 630
    invoke-interface {v12, v13, v14}, Landroidx/camera/core/impl/CameraConfigProvider;->getConfig(Landroidx/camera/core/CameraInfo;Landroid/content/Context;)Landroidx/camera/core/impl/CameraConfig;

    move-result-object v12

    .line 632
    .local v12, "extendedCameraConfig":Landroidx/camera/core/impl/CameraConfig;
    if-nez v12, :cond_7

    .line 633
    goto :goto_6

    .line 637
    :cond_7
    if-nez v5, :cond_8

    .line 641
    move-object v5, v12

    goto :goto_7

    .line 638
    :cond_8
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v13, "Cannot apply multiple extended camera configs at the same time."

    invoke-direct {v8, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 643
    .end local v10    # "cameraFilter":Landroidx/camera/core/CameraFilter;
    .end local v12    # "extendedCameraConfig":Landroidx/camera/core/impl/CameraConfig;
    :cond_9
    :goto_7
    goto :goto_6

    .line 646
    :cond_a
    invoke-virtual {v11, v5}, Landroidx/camera/lifecycle/LifecycleCamera;->setExtendedConfig(Landroidx/camera/core/impl/CameraConfig;)V

    .line 648
    array-length v8, v2

    if-nez v8, :cond_b

    .line 649
    return-object v11

    .line 652
    :cond_b
    iget-object v10, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    .line 656
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    iget-object v8, v0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 657
    invoke-virtual {v8}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v8

    invoke-interface {v8}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v15

    .line 652
    move-object/from16 v12, p3

    move-object/from16 v13, p4

    invoke-virtual/range {v10 .. v15}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->bindToLifecycleCamera(Landroidx/camera/lifecycle/LifecycleCamera;Landroidx/camera/core/ViewPort;Ljava/util/List;Ljava/util/Collection;Landroidx/camera/core/concurrent/CameraCoordinator;)V

    .line 659
    return-object v11

    .line 589
    .end local v5    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    .end local v7    # "cameraId":Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;
    .end local v9    # "lifecycleCameras":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/lifecycle/LifecycleCamera;>;"
    .end local v11    # "lifecycleCameraToBind":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_c
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v7, "Provided camera selector unable to resolve a camera for the given use case"

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public varargs bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;
    .locals 7
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;
    .param p2, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .param p3, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 382
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraOperatingMode()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 386
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setCameraOperatingMode(I)V

    .line 387
    const/4 v4, 0x0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local p3    # "useCases":[Landroidx/camera/core/UseCase;
    .local v2, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .local v3, "cameraSelector":Landroidx/camera/core/CameraSelector;
    .local v6, "useCases":[Landroidx/camera/core/UseCase;
    invoke-virtual/range {v1 .. v6}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/ViewPort;Ljava/util/List;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    move-result-object p1

    .line 389
    .local p1, "camera":Landroidx/camera/core/Camera;
    return-object p1

    .line 383
    .end local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local v3    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local v6    # "useCases":[Landroidx/camera/core/UseCase;
    .local p1, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local p3    # "useCases":[Landroidx/camera/core/UseCase;
    :cond_0
    move-object v2, p1

    move-object v3, p2

    .end local p1    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .end local p2    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .restart local v2    # "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    .restart local v3    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo p2, "bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bindToLifecycle(Ljava/util/List;)Landroidx/camera/core/ConcurrentCamera;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;",
            ">;)",
            "Landroidx/camera/core/ConcurrentCamera;"
        }
    .end annotation

    .line 449
    .local p1, "singleCameraConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;>;"
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string/jumbo v1, "android.hardware.camera.concurrent"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 454
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraOperatingMode()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6

    .line 459
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x2

    if-lt v0, v2, :cond_5

    .line 463
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v2, :cond_4

    .line 468
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 469
    .local v0, "cameraInfosToBind":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    invoke-virtual {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getAvailableCameraInfos()Ljava/util/List;

    move-result-object v3

    .line 470
    .local v3, "availableCameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    nop

    .line 471
    const/4 v4, 0x0

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    invoke-virtual {v5}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v5

    .line 470
    invoke-direct {p0, v5, v3}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraInfoFromCameraSelector(Landroidx/camera/core/CameraSelector;Ljava/util/List;)Landroidx/camera/core/CameraInfo;

    move-result-object v5

    .line 473
    .local v5, "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    nop

    .line 474
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    invoke-virtual {v1}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v1

    .line 473
    invoke-direct {p0, v1, v3}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraInfoFromCameraSelector(Landroidx/camera/core/CameraSelector;Ljava/util/List;)Landroidx/camera/core/CameraInfo;

    move-result-object v1

    .line 476
    .local v1, "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    if-eqz v5, :cond_3

    if-eqz v1, :cond_3

    .line 479
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 480
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 481
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getActiveConcurrentCameraInfos()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 482
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getActiveConcurrentCameraInfos()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_0

    .line 483
    :cond_0
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v4, "Cameras are already running, call unbindAll() before binding more cameras"

    invoke-direct {v2, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 487
    :cond_1
    :goto_0
    invoke-direct {p0, v2}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setCameraOperatingMode(I)V

    .line 488
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 489
    .local v2, "cameras":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/Camera;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;

    .line 490
    .local v7, "config":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    nop

    .line 491
    invoke-virtual {v7}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v9

    .line 492
    invoke-virtual {v7}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getCameraSelector()Landroidx/camera/core/CameraSelector;

    move-result-object v10

    .line 493
    invoke-virtual {v7}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/camera/core/UseCaseGroup;->getViewPort()Landroidx/camera/core/ViewPort;

    move-result-object v11

    .line 494
    invoke-virtual {v7}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/camera/core/UseCaseGroup;->getEffects()Ljava/util/List;

    move-result-object v12

    .line 495
    invoke-virtual {v7}, Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;->getUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/camera/core/UseCaseGroup;->getUseCases()Ljava/util/List;

    move-result-object v8

    new-array v13, v4, [Landroidx/camera/core/UseCase;

    invoke-interface {v8, v13}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    move-object v13, v8

    check-cast v13, [Landroidx/camera/core/UseCase;

    .line 490
    move-object v8, p0

    invoke-virtual/range {v8 .. v13}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/ViewPort;Ljava/util/List;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    move-result-object v9

    .line 496
    .local v9, "camera":Landroidx/camera/core/Camera;
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 497
    .end local v7    # "config":Landroidx/camera/core/ConcurrentCamera$SingleCameraConfig;
    .end local v9    # "camera":Landroidx/camera/core/Camera;
    goto :goto_1

    .line 498
    :cond_2
    invoke-direct {p0, v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setActiveConcurrentCameraInfos(Ljava/util/List;)V

    .line 499
    new-instance v4, Landroidx/camera/core/ConcurrentCamera;

    invoke-direct {v4, v2}, Landroidx/camera/core/ConcurrentCamera;-><init>(Ljava/util/List;)V

    return-object v4

    .line 477
    .end local v2    # "cameras":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/Camera;>;"
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "Invalid camera selectors in camera configs"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 464
    .end local v0    # "cameraInfosToBind":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    .end local v1    # "secondCameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v3    # "availableCameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    .end local v5    # "firstCameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Concurrent camera is only supporting two  cameras at maximum."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 460
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Concurrent camera needs two camera configs"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 455
    :cond_6
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Camera is already running, call unbindAll() before binding more cameras"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 450
    :cond_7
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Concurrent camera is not supported on the device"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAvailableCameraInfos()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 754
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 755
    .local v0, "availableCameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    iget-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v1}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v1

    .line 756
    .local v1, "cameras":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraInternal;

    .line 757
    .local v3, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 758
    .end local v3    # "camera":Landroidx/camera/core/impl/CameraInternal;
    goto :goto_0

    .line 759
    :cond_0
    return-object v0
.end method

.method public getAvailableConcurrentCameraInfos()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;>;"
        }
    .end annotation

    .line 813
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 815
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 816
    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->getConcurrentCameraSelectors()Ljava/util/List;

    move-result-object v0

    .line 817
    .local v0, "concurrentCameraSelectorLists":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroidx/camera/core/CameraSelector;>;>;"
    invoke-virtual {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getAvailableCameraInfos()Ljava/util/List;

    move-result-object v1

    .line 819
    .local v1, "availableCameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 820
    .local v2, "availableConcurrentCameraInfos":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroidx/camera/core/CameraInfo;>;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 821
    .local v4, "cameraSelectors":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraSelector;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 822
    .local v5, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/CameraSelector;

    .line 823
    .local v7, "cameraSelector":Landroidx/camera/core/CameraSelector;
    invoke-direct {p0, v7, v1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraInfoFromCameraSelector(Landroidx/camera/core/CameraSelector;Ljava/util/List;)Landroidx/camera/core/CameraInfo;

    move-result-object v8

    .line 825
    .local v8, "cameraInfo":Landroidx/camera/core/CameraInfo;
    if-eqz v8, :cond_0

    .line 826
    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 828
    .end local v7    # "cameraSelector":Landroidx/camera/core/CameraSelector;
    .end local v8    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_0
    goto :goto_1

    .line 829
    :cond_1
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 830
    .end local v4    # "cameraSelectors":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraSelector;>;"
    .end local v5    # "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    goto :goto_0

    .line 831
    :cond_2
    return-object v2
.end method

.method public hasCamera(Landroidx/camera/core/CameraSelector;)Z
    .locals 2
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraInfoUnavailableException;
        }
    .end annotation

    .line 729
    :try_start_0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraRepository()Landroidx/camera/core/impl/CameraRepository;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraRepository;->getCameras()Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/camera/core/CameraSelector;->select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 732
    nop

    .line 734
    const/4 v0, 0x1

    return v0

    .line 730
    :catch_0
    move-exception v0

    .line 731
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    return v1
.end method

.method public isBound(Landroidx/camera/core/UseCase;)Z
    .locals 3
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 672
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->getLifecycleCameras()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/lifecycle/LifecycleCamera;

    .line 673
    .local v1, "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    invoke-virtual {v1, p1}, Landroidx/camera/lifecycle/LifecycleCamera;->isBound(Landroidx/camera/core/UseCase;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 674
    const/4 v0, 0x1

    return v0

    .line 676
    .end local v1    # "lifecycleCamera":Landroidx/camera/lifecycle/LifecycleCamera;
    :cond_0
    goto :goto_0

    .line 678
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isConcurrentCameraModeOn()Z
    .locals 2

    .line 842
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraOperatingMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method synthetic lambda$getOrCreateCameraXInstance$2$androidx-camera-lifecycle-ProcessCameraProvider(Landroidx/camera/core/CameraX;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 4
    .param p1, "cameraX"    # Landroidx/camera/core/CameraX;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 199
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 200
    :try_start_0
    iget-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 201
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    new-instance v2, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/CameraX;)V

    .line 203
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 201
    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    .line 205
    .local v1, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v2, Landroidx/camera/lifecycle/ProcessCameraProvider$1;

    invoke-direct {v2, p0, p2, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider$1;-><init>(Landroidx/camera/lifecycle/ProcessCameraProvider;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/CameraX;)V

    .line 215
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 205
    invoke-static {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 216
    .end local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    const-string/jumbo v0, "ProcessCameraProvider-initializeCameraX"

    return-object v0

    .line 216
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method synthetic lambda$shutdown$4$androidx-camera-lifecycle-ProcessCameraProvider()V
    .locals 1

    .line 290
    invoke-virtual {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbindAll()V

    .line 291
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->clear()V

    .line 292
    return-void
.end method

.method public shutdown()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 289
    new-instance v0, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/lifecycle/ProcessCameraProvider;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Threads;->runOnMainSync(Ljava/lang/Runnable;)V

    .line 294
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->getCameraFactory()Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraFactory;->getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/concurrent/CameraCoordinator;->shutdown()V

    .line 298
    :cond_0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    invoke-virtual {v0}, Landroidx/camera/core/CameraX;->shutdown()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    goto :goto_0

    .line 299
    :cond_1
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    :goto_0
    nop

    .line 301
    .local v0, "shutdownFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    iget-object v2, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 302
    :try_start_0
    iput-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXConfigProvider:Landroidx/camera/core/CameraXConfig$Provider;

    .line 303
    iput-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXInitializeFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 304
    iput-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraXShutdownFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 305
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 306
    iput-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mCameraX:Landroidx/camera/core/CameraX;

    .line 307
    iput-object v1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mContext:Landroid/content/Context;

    .line 308
    return-object v0

    .line 305
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public varargs unbind([Landroidx/camera/core/UseCase;)V
    .locals 2
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 699
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 701
    invoke-direct {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getCameraOperatingMode()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 706
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbind(Ljava/util/Collection;)V

    .line 707
    return-void

    .line 702
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "unbind usecase is not supported in concurrent camera mode, call unbindAll() first"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public unbindAll()V
    .locals 1

    .line 719
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 720
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->setCameraOperatingMode(I)V

    .line 721
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider;->mLifecycleCameraRepository:Landroidx/camera/lifecycle/LifecycleCameraRepository;

    invoke-virtual {v0}, Landroidx/camera/lifecycle/LifecycleCameraRepository;->unbindAll()V

    .line 722
    return-void
.end method
