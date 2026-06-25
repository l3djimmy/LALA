.class public abstract Landroidx/camera/core/UseCase;
.super Ljava/lang/Object;
.source "UseCase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/UseCase$State;,
        Landroidx/camera/core/UseCase$StateChangeCallback;,
        Landroidx/camera/core/UseCase$EventCallback;
    }
.end annotation


# instance fields
.field private mAttachedSessionConfig:Landroidx/camera/core/impl/SessionConfig;

.field private mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

.field private mCamera:Landroidx/camera/core/impl/CameraInternal;

.field private mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation
.end field

.field private final mCameraLock:Ljava/lang/Object;

.field private mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation
.end field

.field private mEffect:Landroidx/camera/core/CameraEffect;

.field private mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation
.end field

.field private mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

.field private mState:Landroidx/camera/core/UseCase$State;

.field private final mStateChangeCallbacks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/UseCase$StateChangeCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation
.end field

.field private mViewPortCropRect:Landroid/graphics/Rect;


# direct methods
.method protected constructor <init>(Landroidx/camera/core/impl/UseCaseConfig;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)V"
        }
    .end annotation

    .line 169
    .local p1, "currentConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    .line 93
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mCameraLock:Ljava/lang/Object;

    .line 100
    sget-object v0, Landroidx/camera/core/UseCase$State;->INACTIVE:Landroidx/camera/core/UseCase$State;

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mState:Landroidx/camera/core/UseCase$State;

    .line 146
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 160
    nop

    .line 161
    invoke-static {}, Landroidx/camera/core/impl/SessionConfig;->defaultEmptySessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 170
    iput-object p1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 171
    iput-object p1, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 172
    return-void
.end method

.method private addStateChangeCallback(Landroidx/camera/core/UseCase$StateChangeCallback;)V
    .locals 1
    .param p1, "callback"    # Landroidx/camera/core/UseCase$StateChangeCallback;

    .line 515
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 516
    return-void
.end method

.method private removeStateChangeCallback(Landroidx/camera/core/UseCase$StateChangeCallback;)V
    .locals 1
    .param p1, "callback"    # Landroidx/camera/core/UseCase$StateChangeCallback;

    .line 525
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 526
    return-void
.end method

.method public static snapToSurfaceRotation(I)I
    .locals 3
    .param p0, "orientation"    # I

    .line 353
    const/16 v0, 0x167

    const-string/jumbo v1, "orientation"

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1}, Landroidx/core/util/Preconditions;->checkArgumentInRange(IIILjava/lang/String;)I

    .line 354
    const/16 v0, 0x13b

    if-ge p0, v0, :cond_3

    const/16 v0, 0x2d

    if-ge p0, v0, :cond_0

    goto :goto_0

    .line 356
    :cond_0
    const/16 v0, 0xe1

    if-lt p0, v0, :cond_1

    .line 357
    const/4 v0, 0x1

    return v0

    .line 358
    :cond_1
    const/16 v0, 0x87

    if-lt p0, v0, :cond_2

    .line 359
    const/4 v0, 0x2

    return v0

    .line 361
    :cond_2
    const/4 v0, 0x3

    return v0

    .line 355
    :cond_3
    :goto_0
    return v2
.end method


# virtual methods
.method public final bindToCamera(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)V
    .locals 3
    .param p1, "camera"    # Landroidx/camera/core/impl/CameraInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)V"
        }
    .end annotation

    .line 782
    .local p2, "extendedConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .local p3, "cameraConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCameraLock:Ljava/lang/Object;

    monitor-enter v0

    .line 783
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    .line 784
    invoke-direct {p0, p1}, Landroidx/camera/core/UseCase;->addStateChangeCallback(Landroidx/camera/core/UseCase$StateChangeCallback;)V

    .line 785
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 787
    iput-object p2, p0, Landroidx/camera/core/UseCase;->mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 788
    iput-object p3, p0, Landroidx/camera/core/UseCase;->mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 789
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/UseCase;->mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;

    iget-object v2, p0, Landroidx/camera/core/UseCase;->mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-virtual {p0, v0, v1, v2}, Landroidx/camera/core/UseCase;->mergeConfigs(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 792
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->getUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Landroidx/camera/core/UseCase$EventCallback;

    move-result-object v0

    .line 793
    .local v0, "eventCallback":Landroidx/camera/core/UseCase$EventCallback;
    if-eqz v0, :cond_0

    .line 794
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/core/UseCase$EventCallback;->onBind(Landroidx/camera/core/CameraInfo;)V

    .line 796
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->onBind()V

    .line 797
    return-void

    .line 785
    .end local v0    # "eventCallback":Landroidx/camera/core/UseCase$EventCallback;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected getAppConfig()Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 642
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    return-object v0
.end method

.method protected getAppTargetRotation()I
    .locals 2

    .line 461
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 462
    const/4 v1, -0x1

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getAppTargetRotation(I)I

    move-result v0

    .line 461
    return v0
.end method

.method public getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;
    .locals 1

    .line 687
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    return-object v0
.end method

.method public getAttachedSurfaceResolution()Landroid/util/Size;
    .locals 1

    .line 676
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getCamera()Landroidx/camera/core/impl/CameraInternal;
    .locals 2

    .line 663
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCameraLock:Ljava/lang/Object;

    monitor-enter v0

    .line 664
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    monitor-exit v0

    return-object v1

    .line 665
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected getCameraControl()Landroidx/camera/core/impl/CameraControlInternal;
    .locals 2

    .line 902
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCameraLock:Ljava/lang/Object;

    monitor-enter v0

    .line 903
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    if-nez v1, :cond_0

    .line 904
    sget-object v1, Landroidx/camera/core/impl/CameraControlInternal;->DEFAULT_EMPTY_INSTANCE:Landroidx/camera/core/impl/CameraControlInternal;

    monitor-exit v0

    return-object v1

    .line 906
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 907
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected getCameraId()Ljava/lang/String;
    .locals 3

    .line 613
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No camera attached to use case: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraInternal;

    .line 614
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v0

    .line 613
    return-object v0
.end method

.method public getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 653
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    return-object v0
.end method

.method public abstract getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            ")",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation
.end method

.method public getEffect()Landroidx/camera/core/CameraEffect;
    .locals 1

    .line 938
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mEffect:Landroidx/camera/core/CameraEffect;

    return-object v0
.end method

.method public getImageFormat()I
    .locals 1

    .line 978
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-interface {v0}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v0

    return v0
.end method

.method protected getMirrorModeInternal()I
    .locals 2

    .line 431
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getMirrorMode(I)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 3

    .line 632
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<UnknownUseCase-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 633
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 632
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method protected getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I
    .locals 1
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;

    .line 472
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/camera/core/UseCase;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;Z)I

    move-result v0

    return v0
.end method

.method protected getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;Z)I
    .locals 3
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "requireMirroring"    # Z

    .line 483
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    .line 484
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getTargetRotationInternal()I

    move-result v1

    .line 483
    invoke-interface {v0, v1}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees(I)I

    move-result v0

    .line 488
    .local v0, "rotation":I
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz p2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 489
    .local v1, "inputStreamMirrored":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 491
    neg-int v2, v0

    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v0

    .line 493
    :cond_1
    return v0
.end method

.method protected getResolutionInfoInternal()Landroidx/camera/core/ResolutionInfo;
    .locals 7

    .line 992
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 993
    .local v0, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getAttachedSurfaceResolution()Landroid/util/Size;

    move-result-object v1

    .line 995
    .local v1, "resolution":Landroid/util/Size;
    if-eqz v0, :cond_2

    if-nez v1, :cond_0

    goto :goto_0

    .line 999
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getViewPortCropRect()Landroid/graphics/Rect;

    move-result-object v2

    .line 1001
    .local v2, "cropRect":Landroid/graphics/Rect;
    if-nez v2, :cond_1

    .line 1002
    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v5

    const/4 v6, 0x0

    invoke-direct {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v2, v3

    .line 1005
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/camera/core/UseCase;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v3

    .line 1007
    .local v3, "rotationDegrees":I
    new-instance v4, Landroidx/camera/core/ResolutionInfo;

    invoke-direct {v4, v1, v2, v3}, Landroidx/camera/core/ResolutionInfo;-><init>(Landroid/util/Size;Landroid/graphics/Rect;I)V

    return-object v4

    .line 996
    .end local v2    # "cropRect":Landroid/graphics/Rect;
    .end local v3    # "rotationDegrees":I
    :cond_2
    :goto_0
    const/4 v2, 0x0

    return-object v2
.end method

.method public getSensorToBufferTransformMatrix()Landroid/graphics/Matrix;
    .locals 1

    .line 968
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 1

    .line 535
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    return-object v0
.end method

.method protected getSupportedEffectTargets()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1033
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected getTargetFrameRateInternal()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 419
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetFrameRate(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v0

    return-object v0
.end method

.method protected getTargetRotationInternal()I
    .locals 2

    .line 408
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetRotation(I)I

    move-result v0

    return v0
.end method

.method public abstract getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/Config;",
            ")",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;"
        }
    .end annotation
.end method

.method public getViewPortCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 948
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mViewPortCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method protected isCurrentCamera(Ljava/lang/String;)Z
    .locals 1
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 623
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    if-nez v0, :cond_0

    .line 624
    const/4 v0, 0x0

    return v0

    .line 626
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCameraId()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEffectTargetsSupported(I)Z
    .locals 3
    .param p1, "effectTargets"    # I

    .line 1043
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getSupportedEffectTargets()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 1044
    .local v1, "useCaseTargets":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {p1, v2}, Landroidx/camera/core/processing/TargetUtils;->isSuperset(II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1045
    const/4 v0, 0x1

    return v0

    .line 1047
    .end local v1    # "useCaseTargets":Ljava/lang/Integer;
    :cond_0
    goto :goto_0

    .line 1048
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isMirroringRequired(Landroidx/camera/core/impl/CameraInternal;)Z
    .locals 4
    .param p1, "camera"    # Landroidx/camera/core/impl/CameraInternal;

    .line 440
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getMirrorModeInternal()I

    move-result v0

    .line 441
    .local v0, "mirrorMode":I
    packed-switch v0, :pswitch_data_0

    .line 449
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unknown mirrorMode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 447
    :pswitch_0
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->isFrontFacing()Z

    move-result v1

    return v1

    .line 445
    :pswitch_1
    const/4 v1, 0x1

    return v1

    .line 443
    :pswitch_2
    const/4 v1, 0x0

    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public mergeConfigs(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 6
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 213
    .local p2, "extendedConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .local p3, "cameraDefaultConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    if-eqz p3, :cond_0

    .line 214
    invoke-static {p3}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    .line 215
    .local v0, "mergedConfig":Landroidx/camera/core/impl/MutableOptionsBundle;
    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->removeOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    goto :goto_0

    .line 217
    .end local v0    # "mergedConfig":Landroidx/camera/core/impl/MutableOptionsBundle;
    :cond_0
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    .line 223
    .restart local v0    # "mergedConfig":Landroidx/camera/core/impl/MutableOptionsBundle;
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    sget-object v2, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ASPECT_RATIO:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    sget-object v2, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    .line 224
    invoke-interface {v1, v2}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 225
    :cond_1
    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 226
    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->removeOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    .line 232
    :cond_2
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    sget-object v2, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_MAX_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    .line 233
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 234
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    sget-object v2, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    .line 235
    invoke-interface {v1, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 236
    .local v1, "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    invoke-virtual {v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionStrategy()Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 237
    sget-object v2, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_MAX_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->removeOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    .line 243
    .end local v1    # "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    :cond_3
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->listOptions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/Config$Option;

    .line 244
    .local v2, "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    iget-object v3, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-static {v0, v0, v3, v2}, Landroidx/camera/core/impl/Config;->mergeOptionValue(Landroidx/camera/core/impl/MutableOptionsBundle;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config$Option;)V

    .line 245
    .end local v2    # "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    goto :goto_1

    .line 247
    :cond_4
    if-eqz p2, :cond_6

    .line 250
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig;->listOptions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/Config$Option;

    .line 252
    .restart local v2    # "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    move-object v3, v2

    .line 253
    .local v3, "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    invoke-virtual {v3}, Landroidx/camera/core/impl/Config$Option;->getId()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v5}, Landroidx/camera/core/impl/Config$Option;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 254
    goto :goto_2

    .line 256
    :cond_5
    invoke-static {v0, v0, p2, v2}, Landroidx/camera/core/impl/Config;->mergeOptionValue(Landroidx/camera/core/impl/MutableOptionsBundle;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config$Option;)V

    .line 257
    .end local v2    # "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v3    # "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    goto :goto_2

    .line 263
    :cond_6
    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_7

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ASPECT_RATIO:Landroidx/camera/core/impl/Config$Option;

    .line 264
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 266
    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ASPECT_RATIO:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->removeOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    .line 270
    :cond_7
    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_8

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    .line 271
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 272
    invoke-virtual {v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAllowedResolutionMode()I

    move-result v1

    if-eqz v1, :cond_8

    .line 274
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 277
    :cond_8
    invoke-virtual {p0, v0}, Landroidx/camera/core/UseCase;->getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Landroidx/camera/core/UseCase;->onMergeConfig(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    return-object v1
.end method

.method protected final notifyActive()V
    .locals 1

    .line 545
    sget-object v0, Landroidx/camera/core/UseCase$State;->ACTIVE:Landroidx/camera/core/UseCase$State;

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mState:Landroidx/camera/core/UseCase$State;

    .line 546
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->notifyState()V

    .line 547
    return-void
.end method

.method protected final notifyInactive()V
    .locals 1

    .line 556
    sget-object v0, Landroidx/camera/core/UseCase$State;->INACTIVE:Landroidx/camera/core/UseCase$State;

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mState:Landroidx/camera/core/UseCase$State;

    .line 557
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->notifyState()V

    .line 558
    return-void
.end method

.method protected final notifyReset()V
    .locals 2

    .line 579
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase$StateChangeCallback;

    .line 580
    .local v1, "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    invoke-interface {v1, p0}, Landroidx/camera/core/UseCase$StateChangeCallback;->onUseCaseReset(Landroidx/camera/core/UseCase;)V

    .line 581
    .end local v1    # "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    goto :goto_0

    .line 582
    :cond_0
    return-void
.end method

.method public final notifyState()V
    .locals 2

    .line 591
    sget-object v0, Landroidx/camera/core/UseCase$1;->$SwitchMap$androidx$camera$core$UseCase$State:[I

    iget-object v1, p0, Landroidx/camera/core/UseCase;->mState:Landroidx/camera/core/UseCase$State;

    invoke-virtual {v1}, Landroidx/camera/core/UseCase$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    .line 598
    :pswitch_0
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase$StateChangeCallback;

    .line 599
    .local v1, "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    invoke-interface {v1, p0}, Landroidx/camera/core/UseCase$StateChangeCallback;->onUseCaseActive(Landroidx/camera/core/UseCase;)V

    .line 600
    .end local v1    # "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    goto :goto_0

    .line 593
    :pswitch_1
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase$StateChangeCallback;

    .line 594
    .restart local v1    # "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    invoke-interface {v1, p0}, Landroidx/camera/core/UseCase$StateChangeCallback;->onUseCaseInactive(Landroidx/camera/core/UseCase;)V

    .line 595
    .end local v1    # "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    goto :goto_1

    .line 596
    :cond_0
    nop

    .line 603
    :cond_1
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected final notifyUpdated()V
    .locals 2

    .line 567
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mStateChangeCallbacks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase$StateChangeCallback;

    .line 568
    .local v1, "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    invoke-interface {v1, p0}, Landroidx/camera/core/UseCase$StateChangeCallback;->onUseCaseUpdated(Landroidx/camera/core/UseCase;)V

    .line 569
    .end local v1    # "stateChangeCallback":Landroidx/camera/core/UseCase$StateChangeCallback;
    goto :goto_0

    .line 570
    :cond_0
    return-void
.end method

.method public onBind()V
    .locals 0

    .line 813
    return-void
.end method

.method public onCameraControlReady()V
    .locals 0

    .line 751
    return-void
.end method

.method protected onMergeConfig(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;)",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 297
    .local p2, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    return-object v0
.end method

.method public onStateAttached()V
    .locals 0

    .line 881
    return-void
.end method

.method public onStateDetached()V
    .locals 0

    .line 893
    return-void
.end method

.method protected onSuggestedStreamSpecImplementationOptionsUpdated(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;
    .locals 2
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 735
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    if-eqz v0, :cond_0

    .line 739
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    return-object v0

    .line 736
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Attempt to update the implementation options for a use case without attached stream specifications."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected onSuggestedStreamSpecUpdated(Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/StreamSpec;
    .locals 0
    .param p1, "suggestedStreamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 714
    return-object p1
.end method

.method public onUnbind()V
    .locals 0

    .line 867
    return-void
.end method

.method public setEffect(Landroidx/camera/core/CameraEffect;)V
    .locals 1
    .param p1, "effect"    # Landroidx/camera/core/CameraEffect;

    .line 927
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroidx/camera/core/CameraEffect;->getTargets()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/UseCase;->isEffectTargetsSupported(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 928
    iput-object p1, p0, Landroidx/camera/core/UseCase;->mEffect:Landroidx/camera/core/CameraEffect;

    .line 929
    return-void
.end method

.method public setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V
    .locals 1
    .param p1, "sensorToBufferTransformMatrix"    # Landroid/graphics/Matrix;

    .line 958
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 959
    return-void
.end method

.method protected setTargetRotationInternal(I)Z
    .locals 7
    .param p1, "targetRotation"    # I

    .line 376
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 377
    .local v0, "oldConfig":Landroidx/camera/core/impl/ImageOutputConfig;
    const/4 v1, -0x1

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetRotation(I)I

    move-result v2

    .line 378
    .local v2, "oldRotation":I
    if-eq v2, v1, :cond_1

    if-eq v2, p1, :cond_0

    goto :goto_0

    .line 396
    :cond_0
    const/4 v1, 0x0

    return v1

    .line 379
    :cond_1
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-virtual {p0, v1}, Landroidx/camera/core/UseCase;->getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;

    move-result-object v1

    .line 380
    .local v1, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-static {v1, p1}, Landroidx/camera/core/internal/utils/UseCaseConfigUtil;->updateTargetRotationAndRelatedConfigs(Landroidx/camera/core/impl/UseCaseConfig$Builder;I)V

    .line 381
    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v3

    iput-object v3, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 386
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v3

    .line 387
    .local v3, "camera":Landroidx/camera/core/impl/CameraInternal;
    if-nez v3, :cond_2

    .line 388
    iget-object v4, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    iput-object v4, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    goto :goto_1

    .line 390
    :cond_2
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/core/UseCase;->mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;

    iget-object v6, p0, Landroidx/camera/core/UseCase;->mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-virtual {p0, v4, v5, v6}, Landroidx/camera/core/UseCase;->mergeConfigs(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    iput-object v4, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 394
    :goto_1
    const/4 v4, 0x1

    return v4
.end method

.method public setViewPortCropRect(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "viewPortCropRect"    # Landroid/graphics/Rect;

    .line 917
    iput-object p1, p0, Landroidx/camera/core/UseCase;->mViewPortCropRect:Landroid/graphics/Rect;

    .line 918
    return-void
.end method

.method public final unbindFromCamera(Landroidx/camera/core/impl/CameraInternal;)V
    .locals 4
    .param p1, "camera"    # Landroidx/camera/core/impl/CameraInternal;

    .line 834
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->onUnbind()V

    .line 837
    iget-object v0, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->getUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Landroidx/camera/core/UseCase$EventCallback;

    move-result-object v0

    .line 838
    .local v0, "eventCallback":Landroidx/camera/core/UseCase$EventCallback;
    if-eqz v0, :cond_0

    .line 839
    invoke-interface {v0}, Landroidx/camera/core/UseCase$EventCallback;->onUnbind()V

    .line 842
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/UseCase;->mCameraLock:Ljava/lang/Object;

    monitor-enter v2

    .line 843
    :try_start_0
    iget-object v3, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    if-ne p1, v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    invoke-static {v3}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 844
    iget-object v3, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-direct {p0, v3}, Landroidx/camera/core/UseCase;->removeStateChangeCallback(Landroidx/camera/core/UseCase$StateChangeCallback;)V

    .line 845
    iput-object v1, p0, Landroidx/camera/core/UseCase;->mCamera:Landroidx/camera/core/impl/CameraInternal;

    .line 846
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 848
    iput-object v1, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 849
    iput-object v1, p0, Landroidx/camera/core/UseCase;->mViewPortCropRect:Landroid/graphics/Rect;

    .line 853
    iget-object v2, p0, Landroidx/camera/core/UseCase;->mUseCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    iput-object v2, p0, Landroidx/camera/core/UseCase;->mCurrentConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 854
    iput-object v1, p0, Landroidx/camera/core/UseCase;->mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 855
    iput-object v1, p0, Landroidx/camera/core/UseCase;->mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 856
    return-void

    .line 846
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V
    .locals 3
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 502
    iput-object p1, p0, Landroidx/camera/core/UseCase;->mAttachedSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 503
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    .line 504
    .local v1, "surface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v2

    if-nez v2, :cond_0

    .line 505
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/DeferrableSurface;->setContainerClass(Ljava/lang/Class;)V

    .line 507
    .end local v1    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_0
    goto :goto_0

    .line 508
    :cond_1
    return-void
.end method

.method public updateSuggestedStreamSpec(Landroidx/camera/core/impl/StreamSpec;)V
    .locals 1
    .param p1, "suggestedStreamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 696
    invoke-virtual {p0, p1}, Landroidx/camera/core/UseCase;->onSuggestedStreamSpecUpdated(Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 697
    return-void
.end method

.method public updateSuggestedStreamSpecImplementationOptions(Landroidx/camera/core/impl/Config;)V
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 723
    invoke-virtual {p0, p1}, Landroidx/camera/core/UseCase;->onSuggestedStreamSpecImplementationOptionsUpdated(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/UseCase;->mAttachedStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 724
    return-void
.end method
