.class public final Landroidx/camera/camera2/internal/Camera2CameraFactory;
.super Ljava/lang/Object;
.source "Camera2CameraFactory.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraFactory;


# static fields
.field private static final DEFAULT_ALLOWED_CONCURRENT_OPEN_CAMERAS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Camera2CameraFactory"


# instance fields
.field private final mAvailableCameraIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

.field private final mCameraInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private final mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

.field private final mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

.field private final mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "threadConfig"    # Landroidx/camera/core/impl/CameraThreadConfig;
    .param p3, "availableCamerasSelector"    # Landroidx/camera/core/CameraSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraInfos:Ljava/util/Map;

    .line 67
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 68
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraThreadConfig;->getSchedulerHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->from(Landroid/content/Context;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 69
    invoke-static {p1}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getInstance(Landroid/content/Context;)Landroidx/camera/camera2/internal/DisplayInfoManager;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 71
    invoke-static {p0, p3}, Landroidx/camera/camera2/internal/CameraSelectionOptimizer;->getSelectedAvailableCameraIds(Landroidx/camera/camera2/internal/Camera2CameraFactory;Landroidx/camera/core/CameraSelector;)Ljava/util/List;

    move-result-object v0

    .line 73
    .local v0, "optimizedCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->getBackwardCompatibleCameraIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    .line 74
    new-instance v1, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-direct {v1, v2}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;-><init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 75
    new-instance v1, Landroidx/camera/core/impl/CameraStateRegistry;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroidx/camera/core/impl/CameraStateRegistry;-><init>(Landroidx/camera/core/concurrent/CameraCoordinator;I)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    .line 77
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    invoke-interface {v1, v2}, Landroidx/camera/core/concurrent/CameraCoordinator;->addListener(Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;)V

    .line 78
    return-void
.end method

.method private getBackwardCompatibleCameraIds(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 132
    .local p1, "availableCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .local v0, "backwardCompatibleCameraIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 137
    .local v2, "cameraId":Ljava/lang/String;
    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    .line 140
    :cond_0
    invoke-direct {p0, v2}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->isBackwardCompatible(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 141
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 143
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Camera "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is filtered out because its capabilities do not contain REQUEST_AVAILABLE_CAPABILITIES_BACKWARD_COMPATIBLE."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Camera2CameraFactory"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .end local v2    # "cameraId":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .line 138
    .restart local v2    # "cameraId":Ljava/lang/String;
    :cond_2
    :goto_2
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    goto :goto_0

    .line 148
    .end local v2    # "cameraId":Ljava/lang/String;
    :cond_3
    return-object v0
.end method

.method private isBackwardCompatible(Ljava/lang/String;)Z
    .locals 6
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/InitializationException;
        }
    .end annotation

    .line 155
    const-string/jumbo v0, "robolectric"

    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 156
    return v1

    .line 162
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .local v0, "availableCapabilities":[I
    nop

    .line 168
    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 169
    array-length v3, v0

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_2

    aget v5, v0, v4

    .line 170
    .local v5, "capability":I
    if-nez v5, :cond_1

    .line 171
    return v1

    .line 169
    .end local v5    # "capability":I
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 176
    :cond_2
    return v2

    .line 164
    .end local v0    # "availableCapabilities":[I
    :catch_0
    move-exception v0

    .line 165
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v1, Landroidx/camera/core/InitializationException;

    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/InitializationException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public getAvailableCameraIds()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 115
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getCamera(Ljava/lang/String;)Landroidx/camera/core/impl/CameraInternal;
    .locals 10
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 83
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mAvailableCameraIds:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 89
    invoke-virtual {p0, p1}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->getCameraInfo(Ljava/lang/String;)Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 92
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraThreadConfig;->getCameraExecutor()Ljava/util/concurrent/Executor;

    move-result-object v7

    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mThreadConfig:Landroidx/camera/core/impl/CameraThreadConfig;

    .line 93
    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraThreadConfig;->getSchedulerHandler()Landroid/os/Handler;

    move-result-object v8

    iget-object v9, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    move-object v3, p1

    .end local p1    # "cameraId":Ljava/lang/String;
    .local v3, "cameraId":Ljava/lang/String;
    invoke-direct/range {v1 .. v9}, Landroidx/camera/camera2/internal/Camera2CameraImpl;-><init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;Landroidx/camera/core/concurrent/CameraCoordinator;Landroidx/camera/core/impl/CameraStateRegistry;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroidx/camera/camera2/internal/DisplayInfoManager;)V

    .line 87
    return-object v1

    .line 84
    .end local v3    # "cameraId":Ljava/lang/String;
    .restart local p1    # "cameraId":Ljava/lang/String;
    :cond_0
    move-object v3, p1

    .end local p1    # "cameraId":Ljava/lang/String;
    .restart local v3    # "cameraId":Ljava/lang/String;
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v0, "The given camera id is not on the available camera id list."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getCameraCoordinator()Landroidx/camera/core/concurrent/CameraCoordinator;
    .locals 1

    .line 121
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    return-object v0
.end method

.method getCameraInfo(Ljava/lang/String;)Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    .locals 3
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 100
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraInfos:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 101
    .local v0, "camera2CameraInfoImpl":Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    if-nez v0, :cond_0

    .line 102
    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-direct {v1, p1, v2}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;-><init>(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V

    move-object v0, v1

    .line 104
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraInfos:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :cond_0
    return-object v0

    .line 107
    .end local v0    # "camera2CameraInfoImpl":Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v1

    throw v1
.end method

.method public getCameraManager()Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .locals 1

    .line 127
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraFactory;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    return-object v0
.end method

.method public bridge synthetic getCameraManager()Ljava/lang/Object;
    .locals 1

    .line 51
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraFactory;->getCameraManager()Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    move-result-object v0

    return-object v0
.end method
