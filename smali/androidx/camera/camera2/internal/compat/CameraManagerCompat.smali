.class public final Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
.super Ljava/lang/Object;
.source "CameraManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;,
        Landroidx/camera/camera2/internal/compat/CameraManagerCompat$AvailabilityCallbackExecutorWrapper;
    }
.end annotation


# instance fields
.field private final mCameraCharacteristicsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            ">;"
        }
    .end annotation
.end field

.field private final mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;


# direct methods
.method private constructor <init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;)V
    .locals 2
    .param p1, "impl"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Landroid/util/ArrayMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/ArrayMap;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mCameraCharacteristicsMap:Ljava/util/Map;

    .line 51
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    .line 52
    return-void
.end method

.method public static from(Landroid/content/Context;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 57
    invoke-static {}, Landroidx/camera/core/impl/utils/MainThreadAsyncHandler;->getInstance()Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->from(Landroid/content/Context;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    move-result-object v0

    return-object v0
.end method

.method public static from(Landroid/content/Context;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "compatHandler"    # Landroid/os/Handler;

    .line 73
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->from(Landroid/content/Context;Landroid/os/Handler;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;-><init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;)V

    return-object v0
.end method

.method public static from(Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;)Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .locals 1
    .param p0, "impl"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    .line 83
    new-instance v0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;-><init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;)V

    return-object v0
.end method


# virtual methods
.method public getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .locals 6
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 184
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mCameraCharacteristicsMap:Ljava/util/Map;

    monitor-enter v0

    .line 185
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mCameraCharacteristicsMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    .local v1, "characteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    if-nez v1, :cond_0

    .line 188
    :try_start_1
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    .line 189
    invoke-interface {v2, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v2

    .line 188
    invoke-static {v2, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristicsCompat(Landroid/hardware/camera2/CameraCharacteristics;Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v2

    move-object v1, v2

    .line 190
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mCameraCharacteristicsMap:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 199
    goto :goto_0

    .line 191
    :catch_0
    move-exception v2

    .line 196
    .local v2, "e":Ljava/lang/AssertionError;
    :try_start_2
    new-instance v3, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;

    .line 198
    invoke-virtual {v2}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x2712

    invoke-direct {v3, v5, v4, v2}, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local p1    # "cameraId":Ljava/lang/String;
    throw v3

    .line 201
    .end local v2    # "e":Ljava/lang/AssertionError;
    .restart local p1    # "cameraId":Ljava/lang/String;
    :cond_0
    :goto_0
    monitor-exit v0

    .line 202
    return-object v1

    .line 201
    .end local v1    # "characteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public getCameraIdList()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 98
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0

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

    .line 116
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->getConcurrentCameraIds()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public openCamera(Ljava/lang/String;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraDevice$StateCallback;)V
    .locals 1
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "callback"    # Landroid/hardware/camera2/CameraDevice$StateCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 232
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    invoke-interface {v0, p1, p2, p3}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->openCamera(Ljava/lang/String;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraDevice$StateCallback;)V

    .line 233
    return-void
.end method

.method public registerAvailabilityCallback(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 141
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    invoke-interface {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->registerAvailabilityCallback(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    .line 142
    return-void
.end method

.method public unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V
    .locals 1
    .param p1, "callback"    # Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 158
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    .line 159
    return-void
.end method

.method public unwrap()Landroid/hardware/camera2/CameraManager;
    .locals 1

    .line 243
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->mImpl:Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat$CameraManagerCompatImpl;->getCameraManager()Landroid/hardware/camera2/CameraManager;

    move-result-object v0

    return-object v0
.end method
