.class Landroidx/camera/camera2/internal/FocusMeteringControl;
.super Ljava/lang/Object;
.source "FocusMeteringControl.java"


# static fields
.field static final AUTO_FOCUS_TIMEOUT_DURATION:J = 0x1388L

.field private static final EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;


# instance fields
.field private mAeRects:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAutoCancelHandle:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private mAutoFocusTimeoutHandle:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private mAwbRects:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private final mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field mCurrentAfState:Ljava/lang/Integer;

.field final mExecutor:Ljava/util/concurrent/Executor;

.field mFocusTimeoutCounter:J

.field private volatile mIsActive:Z

.field mIsAutoFocusCompleted:Z

.field mIsFocusSuccessful:Z

.field private mIsInAfAutoMode:Z

.field private final mMeteringRegionCorrection:Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;

.field private volatile mPreviewAspectRatio:Landroid/util/Rational;

.field mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/core/FocusMeteringResult;",
            ">;"
        }
    .end annotation
.end field

.field mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mScheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field private mSessionListenerForCancel:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

.field private mSessionListenerForFocus:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

.field private mTemplate:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 92
    const/4 v0, 0x0

    new-array v0, v0, [Landroid/hardware/camera2/params/MeteringRectangle;

    sput-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Quirks;)V
    .locals 4
    .param p1, "cameraControl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p2, "scheduler"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    .line 91
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mPreviewAspectRatio:Landroid/util/Rational;

    .line 97
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsInAfAutoMode:Z

    .line 98
    nop

    .line 100
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCurrentAfState:Ljava/lang/Integer;

    .line 103
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mFocusTimeoutCounter:J

    .line 105
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    .line 107
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 109
    const/4 v0, 0x1

    iput v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mTemplate:I

    .line 111
    iput-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForFocus:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 112
    iput-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForCancel:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 113
    sget-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 114
    sget-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAeRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 115
    sget-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAwbRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 116
    iput-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 117
    iput-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 134
    iput-object p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 135
    iput-object p3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 136
    iput-object p2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 137
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;

    invoke-direct {v0, p4}, Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mMeteringRegionCorrection:Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;

    .line 138
    return-void
.end method

.method private clearAutoFocusTimeoutHandle()V
    .locals 2

    .line 512
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoFocusTimeoutHandle:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 513
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoFocusTimeoutHandle:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 514
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoFocusTimeoutHandle:Ljava/util/concurrent/ScheduledFuture;

    .line 516
    :cond_0
    return-void
.end method

.method private completeCancelFuture()V
    .locals 2

    .line 566
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_0

    .line 567
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 568
    iput-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 570
    :cond_0
    return-void
.end method

.method private disableAutoCancel()V
    .locals 2

    .line 504
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoCancelHandle:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 505
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoCancelHandle:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 506
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoCancelHandle:Ljava/util/concurrent/ScheduledFuture;

    .line 508
    :cond_0
    return-void
.end method

.method private executeMeteringAction([Landroid/hardware/camera2/params/MeteringRectangle;[Landroid/hardware/camera2/params/MeteringRectangle;[Landroid/hardware/camera2/params/MeteringRectangle;Landroidx/camera/core/FocusMeteringAction;J)V
    .locals 16
    .param p1, "afRects"    # [Landroid/hardware/camera2/params/MeteringRectangle;
    .param p2, "aeRects"    # [Landroid/hardware/camera2/params/MeteringRectangle;
    .param p3, "awbRects"    # [Landroid/hardware/camera2/params/MeteringRectangle;
    .param p4, "focusMeteringAction"    # Landroidx/camera/core/FocusMeteringAction;
    .param p5, "timeoutDurationMs"    # J

    .line 579
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v2, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForFocus:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->removeCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 581
    invoke-direct {v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->disableAutoCancel()V

    .line 582
    invoke-direct {v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->clearAutoFocusTimeoutHandle()V

    .line 584
    move-object/from16 v1, p1

    iput-object v1, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 585
    move-object/from16 v2, p2

    iput-object v2, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAeRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 586
    move-object/from16 v3, p3

    iput-object v3, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAwbRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 590
    invoke-direct {v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->shouldTriggerAF()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_0

    .line 591
    iput-boolean v5, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsInAfAutoMode:Z

    .line 592
    iput-boolean v6, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    .line 593
    iput-boolean v6, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 594
    iget-object v4, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v4}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfigSynchronous()J

    move-result-wide v7

    .line 595
    .local v7, "sessionUpdateId":J
    const/4 v4, 0x0

    invoke-virtual {v0, v4, v5}, Landroidx/camera/camera2/internal/FocusMeteringControl;->triggerAf(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Z)V

    goto :goto_0

    .line 597
    .end local v7    # "sessionUpdateId":J
    :cond_0
    iput-boolean v6, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsInAfAutoMode:Z

    .line 598
    iput-boolean v5, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    .line 599
    iput-boolean v6, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 600
    iget-object v4, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v4}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfigSynchronous()J

    move-result-wide v7

    .line 603
    .restart local v7    # "sessionUpdateId":J
    :goto_0
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCurrentAfState:Ljava/lang/Integer;

    .line 604
    invoke-direct {v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->isAfModeSupported()Z

    move-result v4

    .line 607
    .local v4, "isAfModeSupported":Z
    new-instance v5, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda4;

    invoke-direct {v5, v0, v4, v7, v8}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;ZJ)V

    iput-object v5, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForFocus:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 641
    iget-object v5, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v6, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForFocus:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    invoke-virtual {v5, v6}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 643
    iget-wide v5, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mFocusTimeoutCounter:J

    const-wide/16 v9, 0x1

    add-long/2addr v5, v9

    iput-wide v5, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mFocusTimeoutCounter:J

    .line 648
    .local v5, "timeoutId":J
    new-instance v9, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda5;

    invoke-direct {v9, v0, v5, v6}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;J)V

    .line 655
    .local v9, "autoFocusTimeoutRunnable":Ljava/lang/Runnable;
    iget-object v10, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v11, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v12, p5

    invoke-interface {v10, v9, v12, v13, v11}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v10

    iput-object v10, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoFocusTimeoutHandle:Ljava/util/concurrent/ScheduledFuture;

    .line 659
    invoke-virtual/range {p4 .. p4}, Landroidx/camera/core/FocusMeteringAction;->isAutoCancelEnabled()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 660
    new-instance v10, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda6;

    invoke-direct {v10, v0, v5, v6}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;J)V

    .line 666
    .local v10, "autoCancelRunnable":Ljava/lang/Runnable;
    iget-object v11, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mScheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 667
    invoke-virtual/range {p4 .. p4}, Landroidx/camera/core/FocusMeteringAction;->getAutoCancelDurationInMillis()J

    move-result-wide v14

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 666
    invoke-interface {v11, v10, v14, v15, v1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAutoCancelHandle:Ljava/util/concurrent/ScheduledFuture;

    .line 670
    .end local v10    # "autoCancelRunnable":Ljava/lang/Runnable;
    :cond_1
    return-void
.end method

.method private failActionFuture(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 546
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForFocus:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->removeCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 547
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_0

    .line 548
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    invoke-direct {v1, p1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 550
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 552
    :cond_0
    return-void
.end method

.method private failCancelFuture(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 556
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForCancel:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->removeCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 557
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_0

    .line 558
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    invoke-direct {v1, p1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 560
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 562
    :cond_0
    return-void
.end method

.method private getDefaultAspectRatio()Landroid/util/Rational;
    .locals 4

    .line 166
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mPreviewAspectRatio:Landroid/util/Rational;

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mPreviewAspectRatio:Landroid/util/Rational;

    return-object v0

    .line 170
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getCropSensorRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 171
    .local v0, "cropSensorRegion":Landroid/graphics/Rect;
    new-instance v1, Landroid/util/Rational;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    return-object v1
.end method

.method private static getFovAdjustedPoint(Landroidx/camera/core/MeteringPoint;Landroid/util/Rational;Landroid/util/Rational;ILandroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;)Landroid/graphics/PointF;
    .locals 16
    .param p0, "meteringPoint"    # Landroidx/camera/core/MeteringPoint;
    .param p1, "cropRegionAspectRatio"    # Landroid/util/Rational;
    .param p2, "defaultAspectRatio"    # Landroid/util/Rational;
    .param p3, "meteringMode"    # I
    .param p4, "correction"    # Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;

    .line 217
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 218
    .local v1, "fovAspectRatio":Landroid/util/Rational;
    invoke-virtual/range {p0 .. p0}, Landroidx/camera/core/MeteringPoint;->getSurfaceAspectRatio()Landroid/util/Rational;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 219
    invoke-virtual/range {p0 .. p0}, Landroidx/camera/core/MeteringPoint;->getSurfaceAspectRatio()Landroid/util/Rational;

    move-result-object v1

    .line 222
    :cond_0
    move-object/from16 v2, p0

    move/from16 v3, p3

    move-object/from16 v4, p4

    invoke-virtual {v4, v2, v3}, Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;->getCorrectedPoint(Landroidx/camera/core/MeteringPoint;I)Landroid/graphics/PointF;

    move-result-object v5

    .line 223
    .local v5, "adjustedPoint":Landroid/graphics/PointF;
    invoke-virtual {v1, v0}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 224
    invoke-virtual {v1, v0}, Landroid/util/Rational;->compareTo(Landroid/util/Rational;)I

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    if-lez v6, :cond_1

    .line 226
    nop

    .line 227
    invoke-virtual {v1}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v12

    .line 228
    invoke-virtual {v0}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v14

    div-double/2addr v12, v14

    double-to-float v6, v12

    .line 229
    .local v6, "heightOfCropRegion":F
    float-to-double v12, v6

    sub-double/2addr v12, v10

    div-double/2addr v12, v8

    double-to-float v8, v12

    .line 230
    .local v8, "top_padding":F
    iget v9, v5, Landroid/graphics/PointF;->y:F

    add-float/2addr v9, v8

    div-float/2addr v7, v6

    mul-float/2addr v9, v7

    iput v9, v5, Landroid/graphics/PointF;->y:F

    .line 232
    .end local v6    # "heightOfCropRegion":F
    .end local v8    # "top_padding":F
    goto :goto_0

    .line 234
    :cond_1
    nop

    .line 235
    invoke-virtual {v0}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v12

    .line 236
    invoke-virtual {v1}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v14

    div-double/2addr v12, v14

    double-to-float v6, v12

    .line 237
    .local v6, "widthOfCropRegion":F
    float-to-double v12, v6

    sub-double/2addr v12, v10

    div-double/2addr v12, v8

    double-to-float v8, v12

    .line 238
    .local v8, "left_padding":F
    iget v9, v5, Landroid/graphics/PointF;->x:F

    add-float/2addr v9, v8

    div-float/2addr v7, v6

    mul-float/2addr v9, v7

    iput v9, v5, Landroid/graphics/PointF;->x:F

    .line 242
    .end local v6    # "widthOfCropRegion":F
    .end local v8    # "left_padding":F
    :cond_2
    :goto_0
    return-object v5
.end method

.method private static getMeteringRect(Landroidx/camera/core/MeteringPoint;Landroid/graphics/PointF;Landroid/graphics/Rect;)Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 9
    .param p0, "meteringPoint"    # Landroidx/camera/core/MeteringPoint;
    .param p1, "adjustedPoint"    # Landroid/graphics/PointF;
    .param p2, "cropRegion"    # Landroid/graphics/Rect;

    .line 247
    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v1, p1, Landroid/graphics/PointF;->x:F

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    .line 248
    .local v0, "centerX":I
    iget v1, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    iget v2, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    .line 250
    .local v1, "centerY":I
    invoke-virtual {p0}, Landroidx/camera/core/MeteringPoint;->getSize()F

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    .line 251
    .local v2, "width":I
    invoke-virtual {p0}, Landroidx/camera/core/MeteringPoint;->getSize()F

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    float-to-int v3, v3

    .line 253
    .local v3, "height":I
    new-instance v4, Landroid/graphics/Rect;

    div-int/lit8 v5, v2, 0x2

    sub-int v5, v0, v5

    div-int/lit8 v6, v3, 0x2

    sub-int v6, v1, v6

    div-int/lit8 v7, v2, 0x2

    add-int/2addr v7, v0

    div-int/lit8 v8, v3, 0x2

    add-int/2addr v8, v1

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 256
    .local v4, "focusRect":Landroid/graphics/Rect;
    iget v5, v4, Landroid/graphics/Rect;->left:I

    iget v6, p2, Landroid/graphics/Rect;->right:I

    iget v7, p2, Landroid/graphics/Rect;->left:I

    invoke-static {v5, v6, v7}, Landroidx/camera/camera2/internal/FocusMeteringControl;->rangeLimit(III)I

    move-result v5

    iput v5, v4, Landroid/graphics/Rect;->left:I

    .line 257
    iget v5, v4, Landroid/graphics/Rect;->right:I

    iget v6, p2, Landroid/graphics/Rect;->right:I

    iget v7, p2, Landroid/graphics/Rect;->left:I

    invoke-static {v5, v6, v7}, Landroidx/camera/camera2/internal/FocusMeteringControl;->rangeLimit(III)I

    move-result v5

    iput v5, v4, Landroid/graphics/Rect;->right:I

    .line 258
    iget v5, v4, Landroid/graphics/Rect;->top:I

    iget v6, p2, Landroid/graphics/Rect;->bottom:I

    iget v7, p2, Landroid/graphics/Rect;->top:I

    invoke-static {v5, v6, v7}, Landroidx/camera/camera2/internal/FocusMeteringControl;->rangeLimit(III)I

    move-result v5

    iput v5, v4, Landroid/graphics/Rect;->top:I

    .line 259
    iget v5, v4, Landroid/graphics/Rect;->bottom:I

    iget v6, p2, Landroid/graphics/Rect;->bottom:I

    iget v7, p2, Landroid/graphics/Rect;->top:I

    invoke-static {v5, v6, v7}, Landroidx/camera/camera2/internal/FocusMeteringControl;->rangeLimit(III)I

    move-result v5

    iput v5, v4, Landroid/graphics/Rect;->bottom:I

    .line 261
    new-instance v5, Landroid/hardware/camera2/params/MeteringRectangle;

    const/16 v6, 0x3e8

    invoke-direct {v5, v4, v6}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(Landroid/graphics/Rect;I)V

    return-object v5
.end method

.method private getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;
    .locals 7
    .param p2, "maxRegionCount"    # I
    .param p3, "defaultAspectRatio"    # Landroid/util/Rational;
    .param p4, "cropSensorRegion"    # Landroid/graphics/Rect;
    .param p5, "meteringMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/MeteringPoint;",
            ">;I",
            "Landroid/util/Rational;",
            "Landroid/graphics/Rect;",
            "I)",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/MeteringRectangle;",
            ">;"
        }
    .end annotation

    .line 292
    .local p1, "meteringPoints":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/MeteringPoint;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    if-nez p2, :cond_0

    goto :goto_2

    .line 296
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .local v0, "meteringRectanglesList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    new-instance v1, Landroid/util/Rational;

    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    move-result v2

    .line 298
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    .line 299
    .local v1, "cropRegionAspectRatio":Landroid/util/Rational;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/MeteringPoint;

    .line 301
    .local v3, "meteringPoint":Landroidx/camera/core/MeteringPoint;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ne v4, p2, :cond_2

    .line 302
    goto :goto_1

    .line 304
    :cond_2
    invoke-static {v3}, Landroidx/camera/camera2/internal/FocusMeteringControl;->isValid(Landroidx/camera/core/MeteringPoint;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 305
    goto :goto_0

    .line 308
    :cond_3
    iget-object v4, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mMeteringRegionCorrection:Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;

    invoke-static {v3, v1, p3, p5, v4}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getFovAdjustedPoint(Landroidx/camera/core/MeteringPoint;Landroid/util/Rational;Landroid/util/Rational;ILandroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;)Landroid/graphics/PointF;

    move-result-object v4

    .line 310
    .local v4, "adjustedPoint":Landroid/graphics/PointF;
    invoke-static {v3, v4, p4}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRect(Landroidx/camera/core/MeteringPoint;Landroid/graphics/PointF;Landroid/graphics/Rect;)Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v5

    .line 312
    .local v5, "meteringRectangle":Landroid/hardware/camera2/params/MeteringRectangle;
    invoke-virtual {v5}, Landroid/hardware/camera2/params/MeteringRectangle;->getWidth()I

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v5}, Landroid/hardware/camera2/params/MeteringRectangle;->getHeight()I

    move-result v6

    if-nez v6, :cond_4

    .line 313
    goto :goto_0

    .line 315
    :cond_4
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    .end local v3    # "meteringPoint":Landroidx/camera/core/MeteringPoint;
    .end local v4    # "adjustedPoint":Landroid/graphics/PointF;
    .end local v5    # "meteringRectangle":Landroid/hardware/camera2/params/MeteringRectangle;
    goto :goto_0

    .line 318
    :cond_5
    :goto_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 293
    .end local v0    # "meteringRectanglesList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    .end local v1    # "cropRegionAspectRatio":Landroid/util/Rational;
    :cond_6
    :goto_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private isAfModeSupported()Z
    .locals 2

    .line 531
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAfMode(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static isValid(Landroidx/camera/core/MeteringPoint;)Z
    .locals 3
    .param p0, "pt"    # Landroidx/camera/core/MeteringPoint;

    .line 208
    invoke-virtual {p0}, Landroidx/camera/core/MeteringPoint;->getX()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/MeteringPoint;->getX()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/MeteringPoint;->getY()F

    move-result v0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/MeteringPoint;->getY()F

    move-result v0

    cmpg-float v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static rangeLimit(III)I
    .locals 1
    .param p0, "val"    # I
    .param p1, "max"    # I
    .param p2, "min"    # I

    .line 265
    invoke-static {p0, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private shouldTriggerAF()Z
    .locals 1

    .line 674
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method addFocusMeteringOptions(Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;)V
    .locals 3
    .param p1, "configBuilder"    # Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 186
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsInAfAutoMode:Z

    if-eqz v0, :cond_0

    .line 187
    const/4 v0, 0x1

    goto :goto_0

    .line 188
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getDefaultAfMode()I

    move-result v0

    :goto_0
    nop

    .line 190
    .local v0, "afMode":I
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 191
    invoke-virtual {v2, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAfMode(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 190
    invoke-virtual {p1, v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 193
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    array-length v1, v1

    if-eqz v1, :cond_1

    .line 194
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 197
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAeRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    array-length v1, v1

    if-eqz v1, :cond_2

    .line 198
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAeRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 201
    :cond_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAwbRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    array-length v1, v1

    if-eqz v1, :cond_3

    .line 202
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAwbRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 205
    :cond_3
    return-void
.end method

.method cancelAfAeTrigger(ZZ)V
    .locals 5
    .param p1, "cancelAfTrigger"    # Z
    .param p2, "cancelAePrecaptureTrigger"    # Z

    .line 481
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    if-nez v0, :cond_0

    .line 482
    return-void

    .line 485
    :cond_0
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 486
    .local v0, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setUseRepeatingSurface(Z)V

    .line 487
    iget v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 489
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 490
    .local v1, "configBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    const/4 v2, 0x2

    if-eqz p1, :cond_1

    .line 491
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 492
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 491
    invoke-virtual {v1, v3, v4}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 494
    :cond_1
    if-eqz p2, :cond_2

    .line 495
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 496
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 495
    invoke-virtual {v1, v3, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 498
    :cond_2
    invoke-virtual {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 499
    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->submitCaptureRequestsInternal(Ljava/util/List;)V

    .line 500
    return-void
.end method

.method cancelFocusAndMetering()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 678
    new-instance v0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method cancelFocusAndMeteringInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 693
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    const-string v0, "Cancelled by another cancelFocusAndMetering()"

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->failCancelFuture(Ljava/lang/String;)V

    .line 694
    const-string v0, "Cancelled by cancelFocusAndMetering()"

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->failActionFuture(Ljava/lang/String;)V

    .line 695
    iput-object p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 696
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->disableAutoCancel()V

    .line 697
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->clearAutoFocusTimeoutHandle()V

    .line 699
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->shouldTriggerAF()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 700
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelAfAeTrigger(ZZ)V

    .line 702
    :cond_0
    sget-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAfRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 703
    sget-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAeRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 704
    sget-object v0, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mAwbRects:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 706
    iput-boolean v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsInAfAutoMode:Z

    .line 707
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfigSynchronous()J

    move-result-wide v0

    .line 709
    .local v0, "sessionUpdateId":J
    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningCancelCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v2, :cond_1

    .line 710
    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getDefaultAfMode()I

    move-result v3

    invoke-virtual {v2, v3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAfMode(I)I

    move-result v2

    .line 711
    .local v2, "targetAfMode":I
    new-instance v3, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0, v2, v0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;IJ)V

    iput-object v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForCancel:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 723
    iget-object v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v4, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mSessionListenerForCancel:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    invoke-virtual {v3, v4}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 725
    .end local v2    # "targetAfMode":I
    :cond_1
    return-void
.end method

.method cancelFocusAndMeteringWithoutAsyncResult()V
    .locals 1

    .line 687
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelFocusAndMeteringInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 688
    return-void
.end method

.method completeActionFuture(Z)V
    .locals 2
    .param p1, "isFocusSuccessful"    # Z

    .line 537
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->clearAutoFocusTimeoutHandle()V

    .line 538
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_0

    .line 539
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {p1}, Landroidx/camera/core/FocusMeteringResult;->create(Z)Landroidx/camera/core/FocusMeteringResult;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 540
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 542
    :cond_0
    return-void
.end method

.method getDefaultAfMode()I
    .locals 1

    .line 521
    iget v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mTemplate:I

    packed-switch v0, :pswitch_data_0

    .line 526
    const/4 v0, 0x4

    return v0

    .line 523
    :pswitch_0
    const/4 v0, 0x3

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method isFocusMeteringSupported(Landroidx/camera/core/FocusMeteringAction;)Z
    .locals 8
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;

    .line 728
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getCropSensorRegion()Landroid/graphics/Rect;

    move-result-object v5

    .line 729
    .local v5, "cropSensorRegion":Landroid/graphics/Rect;
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getDefaultAspectRatio()Landroid/util/Rational;

    move-result-object v4

    .line 730
    .local v4, "defaultAspectRatio":Landroid/util/Rational;
    nop

    .line 731
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v2

    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 732
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getMaxAfRegionCount()I

    move-result v3

    .line 731
    const/4 v6, 0x1

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v0

    .line 734
    .local v0, "rectanglesAf":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    nop

    .line 735
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v2

    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 736
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getMaxAeRegionCount()I

    move-result v3

    .line 735
    const/4 v6, 0x2

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v7

    .line 738
    .local v7, "rectanglesAe":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    nop

    .line 739
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v2

    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 740
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getMaxAwbRegionCount()I

    move-result v3

    .line 739
    const/4 v6, 0x4

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v2

    .line 742
    .local v2, "rectanglesAwb":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method synthetic lambda$cancelFocusAndMetering$7$androidx-camera-camera2-internal-FocusMeteringControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 680
    invoke-virtual {p0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelFocusAndMeteringInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    return-void
.end method

.method synthetic lambda$cancelFocusAndMetering$8$androidx-camera-camera2-internal-FocusMeteringControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 680
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 681
    const-string/jumbo v0, "cancelFocusAndMetering"

    return-object v0
.end method

.method synthetic lambda$cancelFocusAndMeteringInternal$9$androidx-camera-camera2-internal-FocusMeteringControl(IJLandroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 2
    .param p1, "targetAfMode"    # I
    .param p2, "sessionUpdateId"    # J
    .param p4, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 713
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p4, v0}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 714
    .local v0, "afMode":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_0

    .line 715
    invoke-static {p4, p2, p3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isSessionUpdated(Landroid/hardware/camera2/TotalCaptureResult;J)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 717
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->completeCancelFuture()V

    .line 718
    const/4 v1, 0x1

    return v1

    .line 720
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method synthetic lambda$executeMeteringAction$2$androidx-camera-camera2-internal-FocusMeteringControl(ZJLandroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 5
    .param p1, "isAfModeSupported"    # Z
    .param p2, "sessionUpdateId"    # J
    .param p4, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 609
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p4, v0}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 610
    .local v0, "afState":Ljava/lang/Integer;
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->shouldTriggerAF()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_3

    .line 611
    if-eqz p1, :cond_2

    if-nez v0, :cond_0

    goto :goto_0

    .line 615
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCurrentAfState:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v4, 0x3

    if-ne v1, v4, :cond_3

    .line 616
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v4, 0x4

    if-ne v1, v4, :cond_1

    .line 617
    iput-boolean v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 618
    iput-boolean v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    goto :goto_1

    .line 619
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v4, 0x5

    if-ne v1, v4, :cond_3

    .line 621
    iput-boolean v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 622
    iput-boolean v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    goto :goto_1

    .line 613
    :cond_2
    :goto_0
    iput-boolean v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 614
    iput-boolean v3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    .line 628
    :cond_3
    :goto_1
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsAutoFocusCompleted:Z

    if-eqz v1, :cond_4

    .line 629
    invoke-static {p4, p2, p3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isSessionUpdated(Landroid/hardware/camera2/TotalCaptureResult;J)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 630
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->completeActionFuture(Z)V

    .line 631
    return v3

    .line 635
    :cond_4
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCurrentAfState:Ljava/lang/Integer;

    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz v0, :cond_5

    .line 636
    iput-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCurrentAfState:Ljava/lang/Integer;

    .line 638
    :cond_5
    return v2
.end method

.method synthetic lambda$executeMeteringAction$3$androidx-camera-camera2-internal-FocusMeteringControl(J)V
    .locals 2
    .param p1, "timeoutId"    # J

    .line 649
    iget-wide v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mFocusTimeoutCounter:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 650
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    .line 651
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsFocusSuccessful:Z

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->completeActionFuture(Z)V

    .line 653
    :cond_0
    return-void
.end method

.method synthetic lambda$executeMeteringAction$4$androidx-camera-camera2-internal-FocusMeteringControl(J)V
    .locals 2
    .param p1, "timeoutId"    # J

    .line 648
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;J)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$executeMeteringAction$5$androidx-camera-camera2-internal-FocusMeteringControl(J)V
    .locals 2
    .param p1, "timeoutId"    # J

    .line 661
    iget-wide v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mFocusTimeoutCounter:J

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 662
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelFocusAndMeteringWithoutAsyncResult()V

    .line 664
    :cond_0
    return-void
.end method

.method synthetic lambda$executeMeteringAction$6$androidx-camera-camera2-internal-FocusMeteringControl(J)V
    .locals 2
    .param p1, "timeoutId"    # J

    .line 660
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;J)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$startFocusAndMetering$0$androidx-camera-camera2-internal-FocusMeteringControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/FocusMeteringAction;J)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .param p3, "timeoutDurationMs"    # J

    .line 280
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/camera/camera2/internal/FocusMeteringControl;->startFocusAndMeteringInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/FocusMeteringAction;J)V

    return-void
.end method

.method synthetic lambda$startFocusAndMetering$1$androidx-camera-camera2-internal-FocusMeteringControl(Landroidx/camera/core/FocusMeteringAction;JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 7
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .param p2, "timeoutDurationMs"    # J
    .param p4, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 279
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda0;

    move-object v2, p0

    move-object v4, p1

    move-wide v5, p2

    move-object v3, p4

    .end local p1    # "action":Landroidx/camera/core/FocusMeteringAction;
    .end local p2    # "timeoutDurationMs":J
    .end local p4    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v3, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v4, "action":Landroidx/camera/core/FocusMeteringAction;
    .local v5, "timeoutDurationMs":J
    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/FocusMeteringAction;J)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 281
    const-string/jumbo p1, "startFocusAndMetering"

    return-object p1
.end method

.method setActive(Z)V
    .locals 1
    .param p1, "isActive"    # Z

    .line 149
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    if-ne p1, v0, :cond_0

    .line 150
    return-void

    .line 153
    :cond_0
    iput-boolean p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    .line 155
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    if-nez v0, :cond_1

    .line 156
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelFocusAndMeteringWithoutAsyncResult()V

    .line 158
    :cond_1
    return-void
.end method

.method public setPreviewAspectRatio(Landroid/util/Rational;)V
    .locals 0
    .param p1, "previewAspectRatio"    # Landroid/util/Rational;

    .line 161
    iput-object p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mPreviewAspectRatio:Landroid/util/Rational;

    .line 162
    return-void
.end method

.method setTemplate(I)V
    .locals 0
    .param p1, "template"    # I

    .line 176
    iput p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mTemplate:I

    .line 177
    return-void
.end method

.method startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/FocusMeteringAction;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/FocusMeteringResult;",
            ">;"
        }
    .end annotation

    .line 271
    const-wide/16 v0, 0x1388

    invoke-virtual {p0, p1, v0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;J)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;J)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .param p2, "timeoutDurationMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/FocusMeteringAction;",
            "J)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/FocusMeteringResult;",
            ">;"
        }
    .end annotation

    .line 278
    new-instance v0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;Landroidx/camera/core/FocusMeteringAction;J)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method startFocusAndMeteringInternal(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/FocusMeteringAction;J)V
    .locals 12
    .param p2, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .param p3, "timeoutDurationMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/core/FocusMeteringResult;",
            ">;",
            "Landroidx/camera/core/FocusMeteringAction;",
            "J)V"
        }
    .end annotation

    .line 324
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/core/FocusMeteringResult;>;"
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    if-nez v1, :cond_0

    .line 325
    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v2, "Camera is not active."

    invoke-direct {v1, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 327
    return-void

    .line 330
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getCropSensorRegion()Landroid/graphics/Rect;

    move-result-object v4

    .line 331
    .local v4, "cropSensorRegion":Landroid/graphics/Rect;
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getDefaultAspectRatio()Landroid/util/Rational;

    move-result-object v3

    .line 332
    .local v3, "defaultAspectRatio":Landroid/util/Rational;
    nop

    .line 333
    invoke-virtual {p2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 334
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getMaxAfRegionCount()I

    move-result v2

    .line 333
    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v7

    .line 336
    .local v7, "rectanglesAf":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    nop

    .line 337
    invoke-virtual {p2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 338
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getMaxAeRegionCount()I

    move-result v2

    .line 337
    const/4 v5, 0x2

    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v8

    .line 340
    .local v8, "rectanglesAe":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    nop

    .line 341
    invoke-virtual {p2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 342
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getMaxAwbRegionCount()I

    move-result v2

    .line 341
    const/4 v5, 0x4

    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/FocusMeteringControl;->getMeteringRectangles(Ljava/util/List;ILandroid/util/Rational;Landroid/graphics/Rect;I)Ljava/util/List;

    move-result-object v9

    .line 345
    move-object v11, v3

    move-object v10, v4

    .end local v3    # "defaultAspectRatio":Landroid/util/Rational;
    .end local v4    # "cropSensorRegion":Landroid/graphics/Rect;
    .local v9, "rectanglesAwb":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MeteringRectangle;>;"
    .local v10, "cropSensorRegion":Landroid/graphics/Rect;
    .local v11, "defaultAspectRatio":Landroid/util/Rational;
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 346
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "None of the specified AF/AE/AWB MeteringPoints is supported on this camera."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 349
    return-void

    .line 352
    :cond_1
    const-string v1, "Cancelled by another startFocusAndMetering()"

    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->failActionFuture(Ljava/lang/String;)V

    .line 353
    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->failCancelFuture(Ljava/lang/String;)V

    .line 354
    invoke-direct {p0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->disableAutoCancel()V

    .line 355
    iput-object p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mRunningActionCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 357
    sget-object v1, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 358
    invoke-interface {v7, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/MeteringRectangle;

    sget-object v2, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 359
    invoke-interface {v8, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/hardware/camera2/params/MeteringRectangle;

    sget-object v3, Landroidx/camera/camera2/internal/FocusMeteringControl;->EMPTY_RECTANGLES:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 360
    invoke-interface {v9, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/hardware/camera2/params/MeteringRectangle;

    .line 357
    move-object v0, p0

    move-object v4, p2

    move-wide v5, p3

    invoke-direct/range {v0 .. v6}, Landroidx/camera/camera2/internal/FocusMeteringControl;->executeMeteringAction([Landroid/hardware/camera2/params/MeteringRectangle;[Landroid/hardware/camera2/params/MeteringRectangle;[Landroid/hardware/camera2/params/MeteringRectangle;Landroidx/camera/core/FocusMeteringAction;J)V

    .line 364
    return-void
.end method

.method triggerAePrecapture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 436
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    if-nez v0, :cond_1

    .line 437
    if-eqz p1, :cond_0

    .line 438
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 441
    :cond_0
    return-void

    .line 444
    :cond_1
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 445
    .local v0, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    iget v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 446
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setUseRepeatingSurface(Z)V

    .line 447
    new-instance v2, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 448
    .local v2, "configBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 449
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 448
    invoke-virtual {v2, v3, v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 450
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 451
    new-instance v1, Landroidx/camera/camera2/internal/FocusMeteringControl$2;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl$2;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 475
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->submitCaptureRequestsInternal(Ljava/util/List;)V

    .line 476
    return-void
.end method

.method triggerAf(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Z)V
    .locals 5
    .param p2, "overrideAeMode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/core/impl/CameraCaptureResult;",
            ">;Z)V"
        }
    .end annotation

    .line 376
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/core/impl/CameraCaptureResult;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mIsActive:Z

    if-nez v0, :cond_1

    .line 377
    if-eqz p1, :cond_0

    .line 378
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 381
    :cond_0
    return-void

    .line 384
    :cond_1
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 385
    .local v0, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    iget v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 386
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setUseRepeatingSurface(Z)V

    .line 387
    new-instance v2, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 388
    .local v2, "configBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 389
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 388
    invoke-virtual {v2, v3, v4}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 391
    if-eqz p2, :cond_2

    .line 396
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v4, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 397
    invoke-virtual {v4, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAeMode(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 396
    invoke-virtual {v2, v3, v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 399
    :cond_2
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 400
    new-instance v1, Landroidx/camera/camera2/internal/FocusMeteringControl$1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl$1;-><init>(Landroidx/camera/camera2/internal/FocusMeteringControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 425
    iget-object v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->submitCaptureRequestsInternal(Ljava/util/List;)V

    .line 426
    return-void
.end method
