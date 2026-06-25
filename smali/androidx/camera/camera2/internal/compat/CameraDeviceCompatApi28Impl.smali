.class Landroidx/camera/camera2/internal/compat/CameraDeviceCompatApi28Impl;
.super Landroidx/camera/camera2/internal/compat/CameraDeviceCompatApi24Impl;
.source "CameraDeviceCompatApi28Impl.java"


# direct methods
.method constructor <init>(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;

    .line 32
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroidx/camera/camera2/internal/compat/CameraDeviceCompatApi24Impl;-><init>(Landroid/hardware/camera2/CameraDevice;Ljava/lang/Object;)V

    .line 33
    return-void
.end method


# virtual methods
.method public createCaptureSession(Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;)V
    .locals 3
    .param p1, "config"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
        }
    .end annotation

    .line 38
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;->unwrap()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/SessionConfiguration;

    .line 39
    .local v0, "sessionConfig":Landroid/hardware/camera2/params/SessionConfiguration;
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompatApi28Impl;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Landroid/hardware/camera2/params/SessionConfiguration;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    nop

    .line 46
    return-void

    .line 43
    :catch_0
    move-exception v1

    .line 44
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-static {v1}, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;->toCameraAccessExceptionCompat(Landroid/hardware/camera2/CameraAccessException;)Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;

    move-result-object v2

    throw v2
.end method
