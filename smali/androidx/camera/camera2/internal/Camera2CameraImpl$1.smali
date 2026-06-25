.class Landroidx/camera/camera2/internal/Camera2CameraImpl$1;
.super Ljava/lang/Object;
.source "Camera2CameraImpl.java"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/camera2/internal/Camera2CameraImpl;->releaseSession(Landroidx/camera/camera2/internal/CaptureSessionInterface;Z)Lcom/google/common/util/concurrent/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

.field final synthetic val$captureSession:Landroidx/camera/camera2/internal/CaptureSessionInterface;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraImpl;Landroidx/camera/camera2/internal/CaptureSessionInterface;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/Camera2CameraImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 563
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->val$captureSession:Landroidx/camera/camera2/internal/CaptureSessionInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 592
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 563
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->onSuccess(Ljava/lang/Void;)V

    return-void
.end method

.method public onSuccess(Ljava/lang/Void;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Void;

    .line 567
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mReleasedCaptureSessions:Ljava/util/Map;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->val$captureSession:Landroidx/camera/camera2/internal/CaptureSessionInterface;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    sget-object v0, Landroidx/camera/camera2/internal/Camera2CameraImpl$3;->$SwitchMap$androidx$camera$camera2$internal$Camera2CameraImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v1, v1, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mState:Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 570
    :sswitch_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget v0, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mCameraDeviceError:I

    if-nez v0, :cond_0

    .line 572
    goto :goto_0

    .line 577
    :cond_0
    :sswitch_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraImpl;->isSessionCloseComplete()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_1

    .line 578
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/ApiCompat$Api21Impl;->close(Landroid/hardware/camera2/CameraDevice;)V

    .line 579
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraImpl$1;->this$0:Landroidx/camera/camera2/internal/Camera2CameraImpl;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/camera/camera2/internal/Camera2CameraImpl;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 585
    :cond_1
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_1
        0x7 -> :sswitch_0
        0x8 -> :sswitch_1
    .end sparse-switch
.end method
