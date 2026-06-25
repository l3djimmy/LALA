.class public final Landroidx/camera/core/impl/CameraStateRegistry;
.super Ljava/lang/Object;
.source "CameraStateRegistry.java"

# interfaces
.implements Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;,
        Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;,
        Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;
    }
.end annotation


# static fields
.field private static final MAX_ALLOWED_CONCURRENT_CAMERAS_IN_CONCURRENT_MODE:I = 0x2

.field private static final MAX_ALLOWED_CONCURRENT_CAMERAS_IN_SINGLE_MODE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CameraStateRegistry"


# instance fields
.field private mAvailableCameras:I

.field private final mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

.field private final mCameraStates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/Camera;",
            "Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;",
            ">;"
        }
    .end annotation
.end field

.field private final mDebugString:Ljava/lang/StringBuilder;

.field private final mLock:Ljava/lang/Object;

.field private mMaxAllowedOpenedCameras:I


# direct methods
.method public constructor <init>(Landroidx/camera/core/concurrent/CameraCoordinator;I)V
    .locals 2
    .param p1, "cameraCoordinator"    # Landroidx/camera/core/concurrent/CameraCoordinator;
    .param p2, "maxAllowedOpenedCameras"    # I

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    .line 57
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    .line 78
    iput p2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    .line 79
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 80
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 81
    iget v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    iput v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 82
    monitor-exit v0

    .line 83
    return-void

    .line 82
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    .locals 4
    .param p1, "targetCameraId"    # Ljava/lang/String;

    .line 409
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/Camera;

    .line 410
    .local v1, "camera":Landroidx/camera/core/Camera;
    invoke-interface {v1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v2

    .line 411
    .local v2, "cameraId":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 412
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    return-object v0

    .line 414
    .end local v1    # "camera":Landroidx/camera/core/Camera;
    .end local v2    # "cameraId":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 415
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z
    .locals 1
    .param p0, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 350
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/impl/CameraInternal$State;->holdsCameraSlot()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private recalculateAvailableCameras()V
    .locals 11

    .line 356
    const-string v0, "CameraStateRegistry"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "-------------------------------------------------------------------\n"

    const-string v3, "%-45s%-22s\n"

    const/4 v4, 0x0

    if-eqz v1, :cond_0

    .line 357
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 358
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    const-string/jumbo v5, "Recalculating open cameras:\n"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Camera"

    const-string/jumbo v7, "State"

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v3, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    :cond_0
    const/4 v1, 0x0

    .line 368
    .local v1, "openCount":I
    iget-object v5, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 369
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 371
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v7}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v7}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/camera/core/impl/CameraInternal$State;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 372
    :cond_1
    const-string/jumbo v7, "UNKNOWN"

    :goto_1
    nop

    .line 373
    .local v7, "stateString":Ljava/lang/String;
    iget-object v8, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 374
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/Camera;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10, v7}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v9, v3, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 373
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .end local v7    # "stateString":Ljava/lang/String;
    :cond_2
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v7}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v7

    invoke-static {v7}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 378
    add-int/lit8 v1, v1, 0x1

    .line 380
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    :cond_3
    goto :goto_0

    .line 381
    :cond_4
    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 382
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    iget-object v2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 385
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget v6, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    .line 386
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 384
    const-string v6, "Open count: %d (Max allowed: %d)"

    invoke-static {v3, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    iget-object v2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    :cond_5
    iget v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    sub-int/2addr v0, v1

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 392
    return-void
.end method

.method private unregisterCamera(Landroidx/camera/core/Camera;)Landroidx/camera/core/impl/CameraInternal$State;
    .locals 2
    .param p1, "camera"    # Landroidx/camera/core/Camera;

    .line 315
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 316
    .local v0, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    if-eqz v0, :cond_0

    .line 317
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 318
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v1

    return-object v1

    .line 321
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private updateAndVerifyState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;
    .locals 3
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 329
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    const-string v1, "Cannot update state of camera which has not yet been registered. Register with CameraStateRegistry.registerCamera()"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 331
    invoke-virtual {v0, p2}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->setState(Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v0

    .line 333
    .local v0, "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    sget-object v1, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v1, :cond_2

    .line 336
    invoke-static {p2}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    const-string v2, "Cannot mark camera as opening until camera was successful at calling CameraStateRegistry.tryOpenCamera()"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 342
    :cond_2
    if-eq v0, p2, :cond_3

    .line 343
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 346
    :cond_3
    return-object v0
.end method


# virtual methods
.method public isCameraClosing()Z
    .locals 5

    .line 396
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 397
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 398
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/CameraInternal$State;->CLOSING:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne v3, v4, :cond_0

    .line 399
    monitor-exit v0

    const/4 v0, 0x1

    return v0

    .line 401
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    :cond_0
    goto :goto_0

    .line 402
    :cond_1
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    .line 403
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public markCameraState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)V
    .locals 1
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "state"    # Landroidx/camera/core/impl/CameraInternal$State;

    .line 207
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Landroidx/camera/core/impl/CameraStateRegistry;->markCameraState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;Z)V

    .line 208
    return-void
.end method

.method public markCameraState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;Z)V
    .locals 9
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "state"    # Landroidx/camera/core/impl/CameraInternal$State;
    .param p3, "notifyImmediately"    # Z

    .line 230
    const/4 v0, 0x0

    .line 231
    .local v0, "camerasToNotifyOpen":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    const/4 v1, 0x0

    .line 232
    .local v1, "cameraToNotifyConfigure":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    iget-object v2, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 233
    const/4 v3, 0x0

    .line 234
    .local v3, "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :try_start_0
    iget v4, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 235
    .local v4, "previousAvailableCameras":I
    sget-object v5, Landroidx/camera/core/impl/CameraInternal$State;->RELEASED:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v5, :cond_0

    .line 236
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraStateRegistry;->unregisterCamera(Landroidx/camera/core/Camera;)Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v5

    .end local v3    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    .local v5, "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    goto :goto_0

    .line 238
    .end local v5    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    .restart local v3    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :cond_0
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/impl/CameraStateRegistry;->updateAndVerifyState(Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v5

    .line 241
    .end local v3    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    .restart local v5    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :goto_0
    if-ne v5, p2, :cond_1

    .line 243
    monitor-exit v2

    return-void

    .line 248
    :cond_1
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v3}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v3

    const/4 v6, 0x2

    if-ne v3, v6, :cond_2

    sget-object v3, Landroidx/camera/core/impl/CameraInternal$State;->CONFIGURED:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v3, :cond_2

    .line 250
    invoke-interface {p1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v3

    .line 251
    .local v3, "cameraId":Ljava/lang/String;
    iget-object v6, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v6, v3}, Landroidx/camera/core/concurrent/CameraCoordinator;->getPairedConcurrentCameraId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 252
    .local v6, "pairedCameraId":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 253
    invoke-direct {p0, v6}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v7

    move-object v1, v7

    .line 257
    .end local v3    # "cameraId":Ljava/lang/String;
    .end local v6    # "pairedCameraId":Ljava/lang/String;
    :cond_2
    const/4 v3, 0x1

    if-ge v4, v3, :cond_5

    iget v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    if-lez v3, :cond_5

    .line 259
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    move-object v0, v3

    .line 260
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 261
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-virtual {v7}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v7

    sget-object v8, Landroidx/camera/core/impl/CameraInternal$State;->PENDING_OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne v7, v8, :cond_3

    .line 262
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/Camera;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/Camera;Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;>;"
    :cond_3
    goto :goto_1

    :cond_4
    goto :goto_2

    .line 265
    :cond_5
    sget-object v3, Landroidx/camera/core/impl/CameraInternal$State;->PENDING_OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    if-ne p2, v3, :cond_6

    iget v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    if-lez v3, :cond_6

    .line 268
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    move-object v0, v3

    .line 269
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    invoke-interface {v0, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    :cond_6
    :goto_2
    if-eqz v0, :cond_7

    if-nez p3, :cond_7

    .line 274
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    .end local v4    # "previousAvailableCameras":I
    .end local v5    # "previousState":Landroidx/camera/core/impl/CameraInternal$State;
    :cond_7
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 279
    if-eqz v0, :cond_8

    .line 280
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 281
    .local v3, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    invoke-virtual {v3}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->notifyOnOpenAvailableListener()V

    .line 282
    .end local v3    # "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    goto :goto_3

    .line 286
    :cond_8
    if-eqz v1, :cond_9

    .line 287
    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->notifyOnConfigureAvailableListener()V

    .line 289
    :cond_9
    return-void

    .line 276
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public onCameraOperatingModeUpdated(II)V
    .locals 5
    .param p1, "prevMode"    # I
    .param p2, "currMode"    # I

    .line 295
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 296
    const/4 v1, 0x1

    const/4 v2, 0x2

    if-ne p2, v2, :cond_0

    .line 297
    move v3, v2

    goto :goto_0

    .line 298
    :cond_0
    move v3, v1

    :goto_0
    :try_start_0
    iput v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mMaxAllowedOpenedCameras:I

    .line 299
    const/4 v3, 0x0

    if-eq p1, v2, :cond_1

    if-ne p2, v2, :cond_1

    move v4, v1

    goto :goto_1

    :cond_1
    move v4, v3

    .line 302
    .local v4, "isConcurrentCameraModeOn":Z
    :goto_1
    if-ne p1, v2, :cond_2

    if-eq p2, v2, :cond_2

    goto :goto_2

    :cond_2
    move v1, v3

    .line 305
    .local v1, "isConcurrentCameraModeOff":Z
    :goto_2
    if-nez v4, :cond_3

    if-eqz v1, :cond_4

    .line 306
    :cond_3
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 308
    .end local v1    # "isConcurrentCameraModeOff":Z
    .end local v4    # "isConcurrentCameraModeOn":Z
    :cond_4
    monitor-exit v0

    .line 309
    return-void

    .line 308
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerCamera(Landroidx/camera/core/Camera;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;)V
    .locals 4
    .param p1, "camera"    # Landroidx/camera/core/Camera;
    .param p2, "notifyExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "onConfigureAvailableListener"    # Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;
    .param p4, "onOpenAvailableListener"    # Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;

    .line 107
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 108
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Camera is already registered: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 110
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    new-instance v2, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p2, p3, p4}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;-><init>(Landroidx/camera/core/impl/CameraInternal$State;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraStateRegistry$OnConfigureAvailableListener;Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    monitor-exit v0

    .line 113
    return-void

    .line 112
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public tryOpenCamera(Landroidx/camera/core/Camera;)Z
    .locals 9
    .param p1, "camera"    # Landroidx/camera/core/Camera;

    .line 134
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 135
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraStates:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    const-string v2, "Camera must first be registered with registerCamera()"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    .line 137
    .local v1, "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    const/4 v2, 0x0

    .line 138
    .local v2, "success":Z
    const-string v3, "CameraStateRegistry"

    invoke-static {v3}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 139
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 140
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v5, "tryOpenCamera(%s) [Available Cameras: %d, Already Open: %b (Previous state: %s)]"

    iget v6, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    .line 142
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v7

    invoke-static {v7}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 143
    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v8

    filled-new-array {p1, v6, v7, v8}, [Ljava/lang/Object;

    move-result-object v6

    .line 140
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    :cond_0
    iget v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mAvailableCameras:I

    if-gtz v3, :cond_1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/impl/CameraStateRegistry;->isOpen(Landroidx/camera/core/impl/CameraInternal$State;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 147
    :cond_1
    sget-object v3, Landroidx/camera/core/impl/CameraInternal$State;->OPENING:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-virtual {v1, v3}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->setState(Landroidx/camera/core/impl/CameraInternal$State;)Landroidx/camera/core/impl/CameraInternal$State;

    .line 148
    const/4 v2, 0x1

    .line 151
    :cond_2
    const-string v3, "CameraStateRegistry"

    invoke-static {v3}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 152
    iget-object v3, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, " --> %s"

    .line 153
    if-eqz v2, :cond_3

    const-string/jumbo v6, "SUCCESS"

    goto :goto_0

    :cond_3
    const-string v6, "FAIL"

    :goto_0
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    const-string v3, "CameraStateRegistry"

    iget-object v4, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mDebugString:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    :cond_4
    if-eqz v2, :cond_5

    .line 160
    invoke-direct {p0}, Landroidx/camera/core/impl/CameraStateRegistry;->recalculateAvailableCameras()V

    .line 163
    :cond_5
    monitor-exit v0

    return v2

    .line 164
    .end local v1    # "registration":Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;
    .end local v2    # "success":Z
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public tryOpenCaptureSession(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "pairedCameraId"    # Ljava/lang/String;

    .line 178
    iget-object v0, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 179
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/CameraStateRegistry;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v1}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v2, :cond_0

    .line 180
    monitor-exit v0

    return v3

    .line 182
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 183
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    .line 185
    .local v1, "selfState":Landroidx/camera/core/impl/CameraInternal$State;
    :goto_0
    if-eqz p2, :cond_2

    invoke-direct {p0, p2}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 186
    invoke-direct {p0, p2}, Landroidx/camera/core/impl/CameraStateRegistry;->getCameraRegistration(Ljava/lang/String;)Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/CameraStateRegistry$CameraRegistration;->getState()Landroidx/camera/core/impl/CameraInternal$State;

    move-result-object v2

    goto :goto_1

    :cond_2
    nop

    .line 187
    .local v2, "pairedState":Landroidx/camera/core/impl/CameraInternal$State;
    :goto_1
    sget-object v4, Landroidx/camera/core/impl/CameraInternal$State;->OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-virtual {v4, v1}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_4

    sget-object v4, Landroidx/camera/core/impl/CameraInternal$State;->CONFIGURED:Landroidx/camera/core/impl/CameraInternal$State;

    .line 188
    invoke-virtual {v4, v1}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_2

    :cond_3
    move v4, v5

    goto :goto_3

    :cond_4
    :goto_2
    move v4, v3

    .line 189
    .local v4, "isSelfAvailable":Z
    :goto_3
    sget-object v6, Landroidx/camera/core/impl/CameraInternal$State;->OPEN:Landroidx/camera/core/impl/CameraInternal$State;

    invoke-virtual {v6, v2}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    sget-object v6, Landroidx/camera/core/impl/CameraInternal$State;->CONFIGURED:Landroidx/camera/core/impl/CameraInternal$State;

    .line 190
    invoke-virtual {v6, v2}, Landroidx/camera/core/impl/CameraInternal$State;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_4

    :cond_5
    move v6, v5

    goto :goto_5

    :cond_6
    :goto_4
    move v6, v3

    .line 191
    .local v6, "isPairAvailable":Z
    :goto_5
    if-eqz v4, :cond_7

    if-eqz v6, :cond_7

    goto :goto_6

    :cond_7
    move v3, v5

    :goto_6
    monitor-exit v0

    return v3

    .line 192
    .end local v1    # "selfState":Landroidx/camera/core/impl/CameraInternal$State;
    .end local v2    # "pairedState":Landroidx/camera/core/impl/CameraInternal$State;
    .end local v4    # "isSelfAvailable":Z
    .end local v6    # "isPairAvailable":Z
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
