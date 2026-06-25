.class final Landroidx/camera/camera2/internal/Camera2CameraImpl$ControlUpdateListenerInternal;
.super Ljava/lang/Object;
.source "Camera2CameraImpl.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CameraImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ControlUpdateListenerInternal"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraImpl;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/Camera2CameraImpl;

    .line 2094
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$ControlUpdateListenerInternal;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCameraControlCaptureRequests(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)V"
        }
    .end annotation

    .line 2106
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$ControlUpdateListenerInternal;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl;->submitCaptureRequests(Ljava/util/List;)V

    .line 2107
    return-void
.end method

.method public onCameraControlUpdateSessionConfig()V
    .locals 1

    .line 2100
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$ControlUpdateListenerInternal;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraImpl;->updateCaptureSessionConfig()V

    .line 2101
    return-void
.end method
