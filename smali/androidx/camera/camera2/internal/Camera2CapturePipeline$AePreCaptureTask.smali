.class Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;
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
    name = "AePreCaptureTask"
.end annotation


# instance fields
.field private final mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private final mFlashMode:I

.field private mIsExecuted:Z

.field private final mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;ILandroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;)V
    .locals 1
    .param p1, "cameraControl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p2, "flashMode"    # I
    .param p3, "overrideAeModeForStillCapture"    # Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    .line 617
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 614
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mIsExecuted:Z

    .line 618
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 619
    iput p2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mFlashMode:I

    .line 620
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    .line 621
    return-void
.end method

.method static synthetic lambda$preCapture$1(Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "input"    # Ljava/lang/Void;

    .line 636
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public isCaptureResultNeeded()Z
    .locals 1

    .line 646
    iget v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mFlashMode:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method synthetic lambda$preCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$AePreCaptureTask(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 632
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getFocusMeteringControl()Landroidx/camera/camera2/internal/FocusMeteringControl;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->triggerAePrecapture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 633
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;->onAePrecaptureStarted()V

    .line 634
    const-string v0, "AePreCapture"

    return-object v0
.end method

.method public postCapture()V
    .locals 3

    .line 652
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mIsExecuted:Z

    if-eqz v0, :cond_0

    .line 653
    const-string v0, "Camera2CapturePipeline"

    const-string/jumbo v1, "cancel TriggerAePreCapture"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getFocusMeteringControl()Landroidx/camera/camera2/internal/FocusMeteringControl;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelAfAeTrigger(ZZ)V

    .line 655
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;->onAePrecaptureFinished()V

    .line 657
    :cond_0
    return-void
.end method

.method public preCapture(Landroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
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

    .line 627
    iget v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mFlashMode:I

    invoke-static {v0, p1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->isFlashRequired(ILandroid/hardware/camera2/TotalCaptureResult;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 628
    const-string v0, "Camera2CapturePipeline"

    const-string/jumbo v1, "Trigger AE"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;->mIsExecuted:Z

    .line 631
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 636
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    new-instance v2, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda1;-><init>()V

    .line 637
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 636
    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transform(Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    return-object v1

    .line 640
    .end local v0    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
