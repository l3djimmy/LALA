.class Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;
.super Ljava/lang/Object;
.source "CameraManagerCompatBaseImpl.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;
    }
.end annotation


# instance fields
.field final mCameraManager:Landroid/hardware/camera2/CameraManager;

.field final mObject:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraManagerParams"    # Ljava/lang/Object;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string/jumbo v0, "camera"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    .line 47
    iput-object p2, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mObject:Ljava/lang/Object;

    .line 48
    return-void
.end method

.method static create(Landroid/content/Context;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "compatHandler"    # Landroid/os/Handler;

    .line 52
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;

    new-instance v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;

    invoke-direct {v1, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;-><init>(Landroid/os/Handler;)V

    invoke-direct {v0, p0, v1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;-><init>(Landroid/content/Context;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 117
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v0
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;->toCameraAccessExceptionCompat(Landroid/hardware/camera2/CameraAccessException;)Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;

    move-result-object v1

    throw v1
.end method

.method public getCameraIdList()[Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 60
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;->toCameraAccessExceptionCompat(Landroid/hardware/camera2/CameraAccessException;)Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;

    move-result-object v1

    throw v1
.end method

.method public getCameraManager()Landroid/hardware/camera2/CameraManager;
    .locals 1

    .line 145
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    return-object v0
.end method

.method public getConcurrentCameraIds()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 69
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public openCamera(Ljava/lang/String;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraDevice$StateCallback;)V
    .locals 4
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "callback"    # Landroid/hardware/camera2/CameraDevice$StateCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 127
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    invoke-static {p3}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;

    invoke-direct {v0, p2, p3}, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraDevice$StateCallback;)V

    .line 134
    .local v0, "cb":Landroid/hardware/camera2/CameraDevice$StateCallback;
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;

    .line 136
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mCompatHandler:Landroid/os/Handler;

    invoke-virtual {v2, p1, v0, v3}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    nop

    .line 140
    return-void

    .line 137
    :catch_0
    move-exception v2

    .line 138
    .local v2, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-static {v2}, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;->toCameraAccessExceptionCompat(Landroid/hardware/camera2/CameraAccessException;)Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;

    move-result-object v3

    throw v3
.end method

.method public registerAvailabilityCallback(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V
    .locals 4
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 75
    if-eqz p1, :cond_2

    .line 79
    const/4 v0, 0x0

    .line 80
    .local v0, "wrapper":Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;

    .line 81
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;
    if-eqz p2, :cond_1

    .line 82
    iget-object v2, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mWrapperMap:Ljava/util/Map;

    monitor-enter v2

    .line 83
    :try_start_0
    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mWrapperMap:Ljava/util/Map;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;

    move-object v0, v3

    .line 84
    if-nez v0, :cond_0

    .line 85
    new-instance v3, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;

    invoke-direct {v3, p1, p2}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;-><init>(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    move-object v0, v3

    .line 87
    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mWrapperMap:Ljava/util/Map;

    invoke-interface {v3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    :cond_0
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 92
    :cond_1
    :goto_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mCompatHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0, v3}, Landroid/hardware/camera2/CameraManager;->registerAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;Landroid/os/Handler;)V

    .line 93
    return-void

    .line 76
    .end local v0    # "wrapper":Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;
    .end local v1    # "params":Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "executor was null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V
    .locals 4
    .param p1, "callback"    # Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 98
    const/4 v0, 0x0

    .line 99
    .local v0, "wrapper":Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;
    if-eqz p1, :cond_0

    .line 100
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mObject:Ljava/lang/Object;

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;

    .line 101
    .local v1, "params":Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;
    iget-object v2, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mWrapperMap:Ljava/util/Map;

    monitor-enter v2

    .line 102
    :try_start_0
    iget-object v3, v1, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;->mWrapperMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;

    move-object v0, v3

    .line 103
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 106
    .end local v1    # "params":Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl$CameraManagerCompatParamsApi21;
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 107
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;->setDisabled()V

    .line 109
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompatBaseImpl;->mCameraManager:Landroid/hardware/camera2/CameraManager;

    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CameraManager;->unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    .line 110
    return-void
.end method
