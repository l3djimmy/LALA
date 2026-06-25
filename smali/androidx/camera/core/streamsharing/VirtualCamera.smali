.class Landroidx/camera/core/streamsharing/VirtualCamera;
.super Ljava/lang/Object;
.source "VirtualCamera.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraInternal;


# static fields
.field private static final UNSUPPORTED_MESSAGE:Ljava/lang/String; = "Operation not supported by VirtualCamera."


# instance fields
.field final mChildren:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation
.end field

.field final mChildrenActiveState:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final mChildrenEdges:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;"
        }
    .end annotation
.end field

.field private final mParentCamera:Landroidx/camera/core/impl/CameraInternal;

.field private final mParentMetadataCallback:Landroidx/camera/core/impl/CameraCaptureCallback;

.field private final mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

.field private final mVirtualCameraControl:Landroidx/camera/core/streamsharing/VirtualCameraControl;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraInternal;Ljava/util/Set;Landroidx/camera/core/impl/UseCaseConfigFactory;Landroidx/camera/core/streamsharing/StreamSharing$Control;)V
    .locals 4
    .param p1, "parentCamera"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "useCaseConfigFactory"    # Landroidx/camera/core/impl/UseCaseConfigFactory;
    .param p4, "streamSharingControl"    # Landroidx/camera/core/streamsharing/StreamSharing$Control;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            "Landroidx/camera/core/streamsharing/StreamSharing$Control;",
            ")V"
        }
    .end annotation

    .line 109
    .local p2, "children":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenEdges:Ljava/util/Map;

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenActiveState:Ljava/util/Map;

    .line 95
    nop

    .line 96
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/VirtualCamera;->createCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentMetadataCallback:Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 110
    iput-object p1, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    .line 111
    iput-object p3, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 112
    iput-object p2, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    .line 113
    new-instance v0, Landroidx/camera/core/streamsharing/VirtualCameraControl;

    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v1

    invoke-direct {v0, v1, p4}, Landroidx/camera/core/streamsharing/VirtualCameraControl;-><init>(Landroidx/camera/core/impl/CameraControlInternal;Landroidx/camera/core/streamsharing/StreamSharing$Control;)V

    iput-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mVirtualCameraControl:Landroidx/camera/core/streamsharing/VirtualCameraControl;

    .line 116
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 117
    .local v1, "child":Landroidx/camera/core/UseCase;
    iget-object v2, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenActiveState:Ljava/util/Map;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .end local v1    # "child":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 119
    :cond_0
    return-void
.end method

.method private forceSetProvider(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/impl/SessionConfig;)V
    .locals 4
    .param p1, "edge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "childSurface"    # Landroidx/camera/core/impl/DeferrableSurface;
    .param p3, "childSessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 370
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->invalidate()V

    .line 372
    :try_start_0
    invoke-virtual {p1, p2}, Landroidx/camera/core/processing/SurfaceEdge;->setProvider(Landroidx/camera/core/impl/DeferrableSurface;)V
    :try_end_0
    .catch Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    goto :goto_1

    .line 373
    :catch_0
    move-exception v0

    .line 377
    .local v0, "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    invoke-virtual {p3}, Landroidx/camera/core/impl/SessionConfig;->getErrorListeners()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SessionConfig$ErrorListener;

    .line 378
    .local v2, "listener":Landroidx/camera/core/impl/SessionConfig$ErrorListener;
    sget-object v3, Landroidx/camera/core/impl/SessionConfig$SessionError;->SESSION_ERROR_SURFACE_NEEDS_RESET:Landroidx/camera/core/impl/SessionConfig$SessionError;

    invoke-interface {v2, p3, v3}, Landroidx/camera/core/impl/SessionConfig$ErrorListener;->onError(Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V

    .line 380
    .end local v2    # "listener":Landroidx/camera/core/impl/SessionConfig$ErrorListener;
    goto :goto_0

    .line 382
    .end local v0    # "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    :cond_0
    :goto_1
    return-void
.end method

.method private static getChildFormat(Landroidx/camera/core/UseCase;)I
    .locals 1
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;

    .line 334
    instance-of v0, p0, Landroidx/camera/core/ImageCapture;

    if-eqz v0, :cond_0

    const/16 v0, 0x100

    goto :goto_0

    .line 335
    :cond_0
    const/16 v0, 0x22

    .line 334
    :goto_0
    return v0
.end method

.method private getChildRotationDegrees(Landroidx/camera/core/UseCase;)I
    .locals 2
    .param p1, "child"    # Landroidx/camera/core/UseCase;

    .line 324
    instance-of v0, p1, Landroidx/camera/core/Preview;

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Landroidx/camera/core/Preview;

    .line 327
    invoke-virtual {v1}, Landroidx/camera/core/Preview;->getTargetRotation()I

    move-result v1

    .line 326
    invoke-interface {v0, v1}, Landroidx/camera/core/CameraInfo;->getSensorRotationDegrees(I)I

    move-result v0

    return v0

    .line 330
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method static getChildSurface(Landroidx/camera/core/UseCase;)Landroidx/camera/core/impl/DeferrableSurface;
    .locals 4
    .param p0, "child"    # Landroidx/camera/core/UseCase;

    .line 391
    instance-of v0, p0, Landroidx/camera/core/ImageCapture;

    if-eqz v0, :cond_0

    .line 392
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 393
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v0

    :goto_0
    nop

    .line 394
    .local v0, "surfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-gt v1, v3, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 395
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_2

    .line 396
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    return-object v1

    .line 398
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method private static getChildTargetType(Landroidx/camera/core/UseCase;)I
    .locals 1
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;

    .line 340
    instance-of v0, p0, Landroidx/camera/core/Preview;

    if-eqz v0, :cond_0

    .line 341
    const/4 v0, 0x1

    return v0

    .line 342
    :cond_0
    instance-of v0, p0, Landroidx/camera/core/ImageCapture;

    if-eqz v0, :cond_1

    .line 343
    const/4 v0, 0x4

    return v0

    .line 345
    :cond_1
    const/4 v0, 0x2

    return v0
.end method

.method private static getHighestSurfacePriority(Ljava/util/Set;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)I"
        }
    .end annotation

    .line 350
    .local p0, "childrenConfigs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    const/4 v0, 0x0

    .line 351
    .local v0, "highestPriority":I
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 352
    .local v2, "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 353
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getSurfaceOccupancyPriority()I

    move-result v3

    .line 352
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 354
    .end local v2    # "childConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    goto :goto_0

    .line 355
    :cond_0
    return v0
.end method

.method private getUseCaseEdge(Landroidx/camera/core/UseCase;)Landroidx/camera/core/processing/SurfaceEdge;
    .locals 1
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 360
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenEdges:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceEdge;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceEdge;

    return-object v0
.end method

.method private isUseCaseActive(Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 364
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenActiveState:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method static sendCameraCaptureResultToChild(Landroidx/camera/core/impl/CameraCaptureResult;Landroidx/camera/core/impl/SessionConfig;)V
    .locals 4
    .param p0, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 418
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 419
    .local v1, "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    new-instance v2, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;

    .line 420
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;-><init>(Landroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 419
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 422
    .end local v1    # "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 423
    :cond_0
    return-void
.end method


# virtual methods
.method public attachUseCases(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .line 444
    .local p1, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by VirtualCamera."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method bindChildren()V
    .locals 4

    .line 145
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 146
    .local v1, "useCase":Landroidx/camera/core/UseCase;
    iget-object v2, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 147
    const/4 v3, 0x1

    invoke-virtual {v1, v3, v2}, Landroidx/camera/core/UseCase;->getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v2

    .line 146
    const/4 v3, 0x0

    invoke-virtual {v1, p0, v3, v2}, Landroidx/camera/core/UseCase;->bindToCamera(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 148
    .end local v1    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 149
    :cond_0
    return-void
.end method

.method public close()V
    .locals 2

    .line 433
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by VirtualCamera."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method createCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;
    .locals 1

    .line 402
    new-instance v0, Landroidx/camera/core/streamsharing/VirtualCamera$1;

    invoke-direct {v0, p0}, Landroidx/camera/core/streamsharing/VirtualCamera$1;-><init>(Landroidx/camera/core/streamsharing/VirtualCamera;)V

    return-object v0
.end method

.method public detachUseCases(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .line 449
    .local p1, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by VirtualCamera."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;
    .locals 1

    .line 303
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mVirtualCameraControl:Landroidx/camera/core/streamsharing/VirtualCameraControl;

    return-object v0
.end method

.method public getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;
    .locals 1

    .line 311
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    return-object v0
.end method

.method public getCameraState()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/core/impl/CameraInternal$State;",
            ">;"
        }
    .end annotation

    .line 317
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraState()Landroidx/camera/core/impl/Observable;

    move-result-object v0

    return-object v0
.end method

.method getChildren()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation

    .line 171
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    return-object v0
.end method

.method getChildrenOutConfigs(Landroidx/camera/core/processing/SurfaceEdge;)Ljava/util/Map;
    .locals 9
    .param p1, "cameraEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ")",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            ">;"
        }
    .end annotation

    .line 179
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 180
    .local v0, "outConfigs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;>;"
    iget-object v1, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 184
    .local v2, "useCase":Landroidx/camera/core/UseCase;
    invoke-direct {p0, v2}, Landroidx/camera/core/streamsharing/VirtualCamera;->getChildRotationDegrees(Landroidx/camera/core/UseCase;)I

    move-result v7

    .line 185
    .local v7, "rotationDegrees":I
    nop

    .line 186
    invoke-static {v2}, Landroidx/camera/core/streamsharing/VirtualCamera;->getChildTargetType(Landroidx/camera/core/UseCase;)I

    move-result v3

    .line 187
    invoke-static {v2}, Landroidx/camera/core/streamsharing/VirtualCamera;->getChildFormat(Landroidx/camera/core/UseCase;)I

    move-result v4

    .line 188
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v5

    .line 189
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v6

    invoke-static {v6, v7}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object v6

    .line 191
    invoke-virtual {v2, p0}, Landroidx/camera/core/UseCase;->isMirroringRequired(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v8

    .line 185
    invoke-static/range {v3 .. v8}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->of(IILandroid/graphics/Rect;Landroid/util/Size;IZ)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    .end local v2    # "useCase":Landroidx/camera/core/UseCase;
    .end local v7    # "rotationDegrees":I
    goto :goto_0

    .line 193
    :cond_0
    return-object v0
.end method

.method public getHasTransform()Z
    .locals 1

    .line 297
    const/4 v0, 0x0

    return v0
.end method

.method getParentMetadataCallback()Landroidx/camera/core/impl/CameraCaptureCallback;
    .locals 1

    .line 227
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentMetadataCallback:Landroidx/camera/core/impl/CameraCaptureCallback;

    return-object v0
.end method

.method mergeChildrenConfigs(Landroidx/camera/core/impl/MutableConfig;)V
    .locals 6
    .param p1, "mutableConfig"    # Landroidx/camera/core/impl/MutableConfig;

    .line 123
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 124
    .local v0, "childrenConfigs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    iget-object v1, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 125
    .local v2, "useCase":Landroidx/camera/core/UseCase;
    iget-object v3, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 127
    const/4 v5, 0x1

    invoke-virtual {v2, v5, v4}, Landroidx/camera/core/UseCase;->getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    .line 125
    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Landroidx/camera/core/UseCase;->mergeConfigs(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    .end local v2    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 131
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    .line 132
    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v2

    const/16 v3, 0x22

    invoke-interface {v2, v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 134
    .local v1, "supportedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v2, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mParentCamera:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v2

    invoke-interface {v2}, Landroidx/camera/core/impl/CameraControlInternal;->getSensorRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v2

    .line 135
    .local v2, "sensorSize":Landroid/util/Size;
    sget-object v3, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_CUSTOM_ORDERED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    .line 136
    invoke-static {v1, v2, v0}, Landroidx/camera/core/streamsharing/ResolutionUtils;->getMergedResolutions(Ljava/util/List;Landroid/util/Size;Ljava/util/Set;)Ljava/util/List;

    move-result-object v4

    .line 135
    invoke-interface {p1, v3, v4}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 140
    sget-object v3, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SURFACE_OCCUPANCY_PRIORITY:Landroidx/camera/core/impl/Config$Option;

    .line 141
    invoke-static {v0}, Landroidx/camera/core/streamsharing/VirtualCamera;->getHighestSurfacePriority(Ljava/util/Set;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 140
    invoke-interface {p1, v3, v4}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 142
    return-void
.end method

.method notifyStateAttached()V
    .locals 2

    .line 158
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 159
    .local v1, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v1}, Landroidx/camera/core/UseCase;->onStateAttached()V

    .line 160
    .end local v1    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 161
    :cond_0
    return-void
.end method

.method notifyStateDetached()V
    .locals 2

    .line 164
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 165
    .local v1, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v1}, Landroidx/camera/core/UseCase;->onStateDetached()V

    .line 166
    .end local v1    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 167
    :cond_0
    return-void
.end method

.method public onUseCaseActive(Landroidx/camera/core/UseCase;)V
    .locals 3
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 234
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 235
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->isUseCaseActive(Landroidx/camera/core/UseCase;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 236
    return-void

    .line 238
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenActiveState:Ljava/util/Map;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    invoke-static {p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getChildSurface(Landroidx/camera/core/UseCase;)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    .line 240
    .local v0, "childSurface":Landroidx/camera/core/impl/DeferrableSurface;
    if-eqz v0, :cond_1

    .line 241
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getUseCaseEdge(Landroidx/camera/core/UseCase;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/camera/core/UseCase;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v2

    invoke-direct {p0, v1, v0, v2}, Landroidx/camera/core/streamsharing/VirtualCamera;->forceSetProvider(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/impl/SessionConfig;)V

    .line 243
    :cond_1
    return-void
.end method

.method public onUseCaseInactive(Landroidx/camera/core/UseCase;)V
    .locals 2
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 248
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 249
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->isUseCaseActive(Landroidx/camera/core/UseCase;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    return-void

    .line 252
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenActiveState:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getUseCaseEdge(Landroidx/camera/core/UseCase;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge;->disconnect()V

    .line 254
    return-void
.end method

.method public onUseCaseReset(Landroidx/camera/core/UseCase;)V
    .locals 3
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 280
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 281
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getUseCaseEdge(Landroidx/camera/core/UseCase;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v0

    .line 282
    .local v0, "edge":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge;->invalidate()V

    .line 283
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->isUseCaseActive(Landroidx/camera/core/UseCase;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 285
    return-void

    .line 287
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getChildSurface(Landroidx/camera/core/UseCase;)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v1

    .line 288
    .local v1, "childSurface":Landroidx/camera/core/impl/DeferrableSurface;
    if-eqz v1, :cond_1

    .line 289
    invoke-virtual {p1}, Landroidx/camera/core/UseCase;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/core/streamsharing/VirtualCamera;->forceSetProvider(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/impl/SessionConfig;)V

    .line 291
    :cond_1
    return-void
.end method

.method public onUseCaseUpdated(Landroidx/camera/core/UseCase;)V
    .locals 3
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 259
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 260
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->isUseCaseActive(Landroidx/camera/core/UseCase;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 262
    return-void

    .line 264
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getUseCaseEdge(Landroidx/camera/core/UseCase;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v0

    .line 265
    .local v0, "edge":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-static {p1}, Landroidx/camera/core/streamsharing/VirtualCamera;->getChildSurface(Landroidx/camera/core/UseCase;)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v1

    .line 266
    .local v1, "childSurface":Landroidx/camera/core/impl/DeferrableSurface;
    if-eqz v1, :cond_1

    .line 269
    invoke-virtual {p1}, Landroidx/camera/core/UseCase;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/core/streamsharing/VirtualCamera;->forceSetProvider(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/impl/SessionConfig;)V

    goto :goto_0

    .line 273
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge;->disconnect()V

    .line 275
    :goto_0
    return-void
.end method

.method public open()V
    .locals 2

    .line 428
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by VirtualCamera."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public release()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 439
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by VirtualCamera."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method resetChildren()V
    .locals 2

    .line 216
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 217
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 218
    .local v1, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {p0, v1}, Landroidx/camera/core/streamsharing/VirtualCamera;->onUseCaseReset(Landroidx/camera/core/UseCase;)V

    .line 219
    .end local v1    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 220
    :cond_0
    return-void
.end method

.method setChildrenEdges(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 200
    .local p1, "childrenEdges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/processing/SurfaceEdge;>;"
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenEdges:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 201
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenEdges:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 202
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildrenEdges:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 203
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/UseCase;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 204
    .local v2, "useCase":Landroidx/camera/core/UseCase;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/SurfaceEdge;

    .line 205
    .local v3, "surfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {v3}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroidx/camera/core/UseCase;->setViewPortCropRect(Landroid/graphics/Rect;)V

    .line 206
    invoke-virtual {v3}, Landroidx/camera/core/processing/SurfaceEdge;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroidx/camera/core/UseCase;->setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V

    .line 207
    invoke-virtual {v3}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroidx/camera/core/UseCase;->updateSuggestedStreamSpec(Landroidx/camera/core/impl/StreamSpec;)V

    .line 208
    invoke-virtual {v2}, Landroidx/camera/core/UseCase;->notifyState()V

    .line 209
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/UseCase;Landroidx/camera/core/processing/SurfaceEdge;>;"
    .end local v2    # "useCase":Landroidx/camera/core/UseCase;
    .end local v3    # "surfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    goto :goto_0

    .line 210
    :cond_0
    return-void
.end method

.method unbindChildren()V
    .locals 2

    .line 152
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCamera;->mChildren:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/UseCase;

    .line 153
    .local v1, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v1, p0}, Landroidx/camera/core/UseCase;->unbindFromCamera(Landroidx/camera/core/impl/CameraInternal;)V

    .line 154
    .end local v1    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 155
    :cond_0
    return-void
.end method
