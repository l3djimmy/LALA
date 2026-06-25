.class Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;
.super Ljava/lang/Object;
.source "Camera2CapturePipeline.java"

# interfaces
.implements Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CapturePipeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AfTask"
.end annotation


# instance fields
.field private final mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private mIsExecuted:Z


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;)V
    .locals 1
    .param p1, "cameraControl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 490
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 488
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;->mIsExecuted:Z

    .line 491
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 492
    return-void
.end method


# virtual methods
.method public isCaptureResultNeeded()Z
    .locals 1

    .line 533
    const/4 v0, 0x1

    return v0
.end method

.method public postCapture()V
    .locals 3

    .line 539
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;->mIsExecuted:Z

    if-eqz v0, :cond_0

    .line 540
    const-string v0, "Camera2CapturePipeline"

    const-string/jumbo v1, "cancel TriggerAF"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 541
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getFocusMeteringControl()Landroidx/camera/camera2/internal/FocusMeteringControl;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelAfAeTrigger(ZZ)V

    .line 543
    :cond_0
    return-void
.end method

.method public preCapture(Landroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 6
    .param p1, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/TotalCaptureResult;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 500
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 502
    .local v1, "ret":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Boolean;>;"
    if-nez p1, :cond_0

    .line 503
    return-object v1

    .line 506
    :cond_0
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 507
    .local v2, "afMode":Ljava/lang/Integer;
    if-nez v2, :cond_1

    .line 508
    return-object v1

    .line 510
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 513
    :pswitch_0
    const-string/jumbo v3, "TriggerAf? AF mode auto"

    const-string v4, "Camera2CapturePipeline"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v3}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 515
    .local v3, "afState":Ljava/lang/Integer;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-nez v5, :cond_2

    .line 516
    const-string/jumbo v5, "Trigger AF"

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;->mIsExecuted:Z

    .line 519
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getFocusMeteringControl()Landroidx/camera/camera2/internal/FocusMeteringControl;

    move-result-object v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroidx/camera/camera2/internal/FocusMeteringControl;->triggerAf(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Z)V

    .line 520
    return-object v1

    .line 527
    .end local v3    # "afState":Ljava/lang/Integer;
    :cond_2
    :goto_0
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
