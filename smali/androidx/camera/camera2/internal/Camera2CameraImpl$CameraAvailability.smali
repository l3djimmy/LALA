.class final Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;
.super Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
.source "Camera2CameraImpl.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraStateRegistry$OnOpenAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CameraImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CameraAvailability"
.end annotation


# instance fields
.field private mCameraAvailable:Z

.field private final mCameraId:Ljava/lang/String;

.field final synthetic this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraImpl;Ljava/lang/String;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/Camera2CameraImpl;
    .param p2, "cameraId"    # Ljava/lang/String;

    .line 2036
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;-><init>()V

    .line 2034
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraAvailable:Z

    .line 2037
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraId:Ljava/lang/String;

    .line 2038
    return-void
.end method


# virtual methods
.method isCameraAvailable()Z
    .locals 1

    .line 2079
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraAvailable:Z

    return v0
.end method

.method public onCameraAvailable(Ljava/lang/String;)V
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 2043
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2045
    return-void

    .line 2048
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraAvailable:Z

    .line 2050
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mState:Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;

    sget-object v1, Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;->PENDING_OPEN:Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;

    if-ne v0, v1, :cond_1

    .line 2051
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl;->tryOpenCameraDevice(Z)V

    .line 2053
    :cond_1
    return-void
.end method

.method public onCameraUnavailable(Ljava/lang/String;)V
    .locals 1
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 2058
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2060
    return-void

    .line 2063
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->mCameraAvailable:Z

    .line 2064
    return-void
.end method

.method public onOpenAvailable()V
    .locals 2

    .line 2069
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mState:Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;

    sget-object v1, Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;->PENDING_OPEN:Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;

    if-ne v0, v1, :cond_0

    .line 2070
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$CameraAvailability;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl;->tryOpenCameraDevice(Z)V

    .line 2072
    :cond_0
    return-void
.end method
