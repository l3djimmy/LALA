.class public Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
.super Ljava/lang/Object;
.source "Camera2CameraControlImpl.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraControlInternal;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;,
        Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;,
        Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_TEMPLATE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Camera2CameraControlImp"

.field static final TAG_SESSION_UPDATE_ID:Ljava/lang/String; = "CameraControlSessionUpdateId"


# instance fields
.field private final mAeFpsRange:Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;

.field private final mAutoFlashAEModeDisabler:Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;

.field private final mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

.field private final mCamera2CapturePipeline:Landroidx/camera/camera2/internal/Camera2CapturePipeline;

.field private final mCameraCaptureCallbackSet:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;

.field private final mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mControlUpdateCallback:Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;

.field private mCurrentSessionUpdateId:J

.field final mExecutor:Ljava/util/concurrent/Executor;

.field private final mExposureControl:Landroidx/camera/camera2/internal/ExposureControl;

.field private volatile mFlashMode:I

.field private volatile mFlashModeChangeSessionUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

.field private volatile mIsTorchOn:Z

.field private final mLock:Ljava/lang/Object;

.field private final mNextSessionUpdateId:Ljava/util/concurrent/atomic/AtomicLong;

.field final mSessionCallback:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;

.field private final mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

.field private mTemplate:I

.field private final mTorchControl:Landroidx/camera/camera2/internal/TorchControl;

.field private mUseCount:I

.field private final mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

.field mZslControl:Landroidx/camera/camera2/internal/ZslControl;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;)V
    .locals 6
    .param p1, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "scheduler"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "controlUpdateCallback"    # Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;

    .line 161
    new-instance v5, Landroidx/camera/core/impl/Quirks;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v5, v0}, Landroidx/camera/core/impl/Quirks;-><init>(Ljava/util/List;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p1    # "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .end local p2    # "scheduler":Ljava/util/concurrent/ScheduledExecutorService;
    .end local p3    # "executor":Ljava/util/concurrent/Executor;
    .end local p4    # "controlUpdateCallback":Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;
    .local v1, "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .local v2, "scheduler":Ljava/util/concurrent/ScheduledExecutorService;
    .local v3, "executor":Ljava/util/concurrent/Executor;
    .local v4, "controlUpdateCallback":Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;
    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;Landroidx/camera/core/impl/Quirks;)V

    .line 163
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;Landroidx/camera/core/impl/Quirks;)V
    .locals 3
    .param p1, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "scheduler"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "controlUpdateCallback"    # Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;
    .param p5, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mLock:Ljava/lang/Object;

    .line 123
    new-instance v0, Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 132
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    .line 135
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mIsTorchOn:Z

    .line 136
    const/4 v0, 0x2

    iput v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashMode:I

    .line 144
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mNextSessionUpdateId:Ljava/util/concurrent/atomic/AtomicLong;

    .line 145
    nop

    .line 147
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashModeChangeSessionUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 149
    const/4 v0, 0x1

    iput v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    .line 151
    iput-wide v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCurrentSessionUpdateId:J

    .line 152
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCaptureCallbackSet:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;

    .line 183
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 184
    iput-object p4, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mControlUpdateCallback:Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;

    .line 185
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 186
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionCallback:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;

    .line 187
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 188
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionCallback:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;

    .line 189
    invoke-static {v1}, Landroidx/camera/camera2/internal/CaptureCallbackContainer;->create(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/internal/CaptureCallbackContainer;

    move-result-object v1

    .line 188
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addRepeatingCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 193
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCaptureCallbackSet:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addRepeatingCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 195
    new-instance v0, Landroidx/camera/camera2/internal/ExposureControl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, p0, v1, v2}, Landroidx/camera/camera2/internal/ExposureControl;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExposureControl:Landroidx/camera/camera2/internal/ExposureControl;

    .line 196
    new-instance v0, Landroidx/camera/camera2/internal/FocusMeteringControl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, p0, p2, v1, p5}, Landroidx/camera/camera2/internal/FocusMeteringControl;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    .line 198
    new-instance v0, Landroidx/camera/camera2/internal/ZoomControl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, p0, v1, v2}, Landroidx/camera/camera2/internal/ZoomControl;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    .line 199
    new-instance v0, Landroidx/camera/camera2/internal/TorchControl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, p0, v1, v2}, Landroidx/camera/camera2/internal/TorchControl;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTorchControl:Landroidx/camera/camera2/internal/TorchControl;

    .line 200
    nop

    .line 201
    new-instance v0, Landroidx/camera/camera2/internal/ZslControlImpl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/ZslControlImpl;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZslControl:Landroidx/camera/camera2/internal/ZslControl;

    .line 207
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;

    invoke-direct {v0, p5}, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mAeFpsRange:Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;

    .line 208
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;

    invoke-direct {v0, p5}, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mAutoFlashAEModeDisabler:Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;

    .line 209
    new-instance v0, Landroidx/camera/camera2/interop/Camera2CameraControl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, p0, v1}, Landroidx/camera/camera2/interop/Camera2CameraControl;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    .line 210
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, p0, v1, p5, v2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/core/impl/Quirks;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CapturePipeline:Landroidx/camera/camera2/internal/Camera2CapturePipeline;

    .line 212
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda10;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 214
    return-void
.end method

.method private getSupportedAwbMode(I)I
    .locals 4
    .param p1, "preferredMode"    # I

    .line 762
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 764
    .local v0, "modes":[I
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 765
    return v1

    .line 769
    :cond_0
    invoke-direct {p0, p1, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 770
    return p1

    .line 774
    :cond_1
    const/4 v2, 0x1

    invoke-direct {p0, v2, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 775
    return v2

    .line 778
    :cond_2
    return v1
.end method

.method private isControlInUse()Z
    .locals 1

    .line 519
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getUseCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isModeInList(I[I)Z
    .locals 4
    .param p1, "mode"    # I
    .param p2, "modeList"    # [I

    .line 783
    array-length v0, p2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget v3, p2, v2

    .line 784
    .local v3, "m":I
    if-ne p1, v3, :cond_0

    .line 785
    const/4 v0, 0x1

    return v0

    .line 783
    .end local v3    # "m":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 788
    :cond_1
    return v1
.end method

.method static isSessionUpdated(Landroid/hardware/camera2/TotalCaptureResult;J)Z
    .locals 6
    .param p0, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;
    .param p1, "sessionUpdateId"    # J

    .line 438
    invoke-virtual {p0}, Landroid/hardware/camera2/TotalCaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 439
    return v1

    .line 441
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/camera2/TotalCaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 442
    .local v0, "tag":Ljava/lang/Object;
    instance-of v2, v0, Landroidx/camera/core/impl/TagBundle;

    if-eqz v2, :cond_2

    .line 443
    move-object v2, v0

    check-cast v2, Landroidx/camera/core/impl/TagBundle;

    .line 444
    const-string v3, "CameraControlSessionUpdateId"

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 445
    .local v2, "tagLong":Ljava/lang/Long;
    if-nez v2, :cond_1

    .line 446
    return v1

    .line 448
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 450
    .local v3, "sessionUpdateIdInCaptureResult":J
    cmp-long v5, v3, p1

    if-ltz v5, :cond_2

    .line 451
    const/4 v1, 0x1

    return v1

    .line 454
    .end local v2    # "tagLong":Ljava/lang/Long;
    .end local v3    # "sessionUpdateIdInCaptureResult":J
    :cond_2
    return v1
.end method

.method static synthetic lambda$addInteropConfig$1()V
    .locals 0

    .line 287
    return-void
.end method

.method static synthetic lambda$clearInteropConfig$2()V
    .locals 0

    .line 294
    return-void
.end method

.method static synthetic lambda$waitForSessionUpdateId$3(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 2
    .param p0, "sessionUpdateIdToWait"    # J
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p3, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 422
    invoke-static {p3, p0, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isSessionUpdated(Landroid/hardware/camera2/TotalCaptureResult;J)Z

    move-result v0

    .line 423
    .local v0, "updated":Z
    if-eqz v0, :cond_0

    .line 424
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 425
    const/4 v1, 0x1

    return v1

    .line 427
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private waitForSessionUpdateId(J)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "sessionUpdateIdToWait"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 420
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;J)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 582
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionCallback:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;->addListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 583
    return-void
.end method

.method public addInteropConfig(Landroidx/camera/core/impl/Config;)V
    .locals 3
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 284
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    .line 285
    invoke-static {p1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v1

    .line 284
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->addCaptureRequestOptions(Landroidx/camera/camera2/interop/CaptureRequestOptions;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 286
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda3;-><init>()V

    .line 287
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 286
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 288
    return-void
.end method

.method addSessionCameraCaptureCallback(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 588
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 591
    return-void
.end method

.method public addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 1
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 393
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZslControl:Landroidx/camera/camera2/internal/ZslControl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/ZslControl;->addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V

    .line 394
    return-void
.end method

.method public cancelFocusAndMetering()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 338
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 339
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 342
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->cancelFocusAndMetering()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public clearInteropConfig()V
    .locals 3

    .line 292
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->clearCaptureRequestOptions()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 293
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda9;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda9;-><init>()V

    .line 294
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 293
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 295
    return-void
.end method

.method decrementUseCount()V
    .locals 3

    .line 229
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 230
    :try_start_0
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    if-eqz v1, :cond_0

    .line 234
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    .line 235
    monitor-exit v0

    .line 236
    return-void

    .line 231
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Decrementing use count occurs more times than incrementing"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 235
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "torch"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 410
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 411
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 414
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTorchControl:Landroidx/camera/camera2/internal/TorchControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/TorchControl;->enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method enableTorchInternal(Z)V
    .locals 4
    .param p1, "torch"    # Z

    .line 603
    iput-boolean p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mIsTorchOn:Z

    .line 604
    if-nez p1, :cond_0

    .line 606
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 607
    .local v0, "singleRequestBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 608
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setUseRepeatingSurface(Z)V

    .line 609
    new-instance v2, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 610
    .local v2, "configBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 611
    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAeMode(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 610
    invoke-virtual {v2, v3, v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 612
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 613
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 612
    invoke-virtual {v2, v1, v3}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 614
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 615
    nop

    .line 616
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 615
    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->submitCaptureRequestsInternal(Ljava/util/List;)V

    .line 618
    .end local v0    # "singleRequestBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    .end local v2    # "configBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfigSynchronous()J

    .line 619
    return-void
.end method

.method public getCamera2CameraControl()Landroidx/camera/camera2/interop/Camera2CameraControl;
    .locals 1

    .line 279
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    return-object v0
.end method

.method getCropSensorRegion()Landroid/graphics/Rect;
    .locals 1

    .line 564
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/ZoomControl;->getCropSensorRegion()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method getCurrentSessionUpdateId()J
    .locals 2

    .line 808
    iget-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCurrentSessionUpdateId:J

    return-wide v0
.end method

.method public getExposureControl()Landroidx/camera/camera2/internal/ExposureControl;
    .locals 1

    .line 269
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExposureControl:Landroidx/camera/camera2/internal/ExposureControl;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .line 368
    iget v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashMode:I

    return v0
.end method

.method public getFocusMeteringControl()Landroidx/camera/camera2/internal/FocusMeteringControl;
    .locals 1

    .line 259
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    return-object v0
.end method

.method public getInteropConfig()Landroidx/camera/core/impl/Config;
    .locals 1

    .line 300
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->getCamera2ImplConfig()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v0

    return-object v0
.end method

.method getMaxAeRegionCount()I
    .locals 2

    .line 797
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 798
    .local v0, "count":Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_0
    return v1
.end method

.method getMaxAfRegionCount()I
    .locals 2

    .line 792
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AF:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 793
    .local v0, "count":Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_0
    return v1
.end method

.method getMaxAwbRegionCount()I
    .locals 2

    .line 802
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AWB:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 803
    .local v0, "count":Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_0
    return v1
.end method

.method public getSensorRect()Landroid/graphics/Rect;
    .locals 2

    .line 571
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 572
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    .line 571
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0
.end method

.method public getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 4

    .line 495
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 496
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSessionOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 497
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->getCamera2ImplConfig()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getCaptureRequestTag(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 498
    .local v0, "tag":Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_0

    .line 499
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    const-string v2, "Camera2CameraControl"

    invoke-virtual {v1, v2, v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 501
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget-wide v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCurrentSessionUpdateId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "CameraControlSessionUpdateId"

    invoke-virtual {v1, v3, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 502
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    return-object v1
.end method

.method getSessionOptions()Landroidx/camera/core/impl/Config;
    .locals 9

    .line 640
    new-instance v0, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 641
    .local v0, "builder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 642
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 641
    invoke-virtual {v0, v1, v3}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 645
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    invoke-virtual {v1, v0}, Landroidx/camera/camera2/internal/FocusMeteringControl;->addFocusMeteringOptions(Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;)V

    .line 647
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mAeFpsRange:Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;

    invoke-virtual {v1, v0}, Landroidx/camera/camera2/internal/compat/workaround/AeFpsRange;->addAeFpsRangeOptions(Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;)V

    .line 649
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    invoke-virtual {v1, v0}, Landroidx/camera/camera2/internal/ZoomControl;->addZoomOption(Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;)V

    .line 651
    const/4 v1, 0x1

    .line 652
    .local v1, "aeMode":I
    iget-boolean v3, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mIsTorchOn:Z

    const/4 v4, 0x2

    if-eqz v3, :cond_0

    .line 653
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 654
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 653
    invoke-virtual {v0, v3, v4}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    goto :goto_0

    .line 656
    :cond_0
    iget v3, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashMode:I

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 658
    :pswitch_0
    const/4 v1, 0x1

    .line 659
    goto :goto_0

    .line 661
    :pswitch_1
    const/4 v1, 0x3

    .line 662
    goto :goto_0

    .line 664
    :pswitch_2
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mAutoFlashAEModeDisabler:Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;

    invoke-virtual {v3, v4}, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;->getCorrectedAeMode(I)I

    move-result v1

    .line 669
    :goto_0
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAeMode(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 671
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 673
    invoke-direct {p0, v2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getSupportedAwbMode(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 671
    invoke-virtual {v0, v3, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 675
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExposureControl:Landroidx/camera/camera2/internal/ExposureControl;

    invoke-virtual {v2, v0}, Landroidx/camera/camera2/internal/ExposureControl;->setCaptureRequestOption(Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;)V

    .line 677
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    invoke-virtual {v2}, Landroidx/camera/camera2/interop/Camera2CameraControl;->getCamera2ImplConfig()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v2

    .line 678
    .local v2, "currentConfig":Landroidx/camera/core/impl/Config;
    invoke-interface {v2}, Landroidx/camera/core/impl/Config;->listOptions()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/Config$Option;

    .line 680
    .local v4, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    move-object v5, v4

    .line 681
    .local v5, "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    invoke-virtual {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v6

    sget-object v7, Landroidx/camera/core/impl/Config$OptionPriority;->ALWAYS_OVERRIDE:Landroidx/camera/core/impl/Config$OptionPriority;

    .line 683
    invoke-interface {v2, v5}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v8

    .line 681
    invoke-interface {v6, v5, v7, v8}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Landroidx/camera/core/impl/Config$OptionPriority;Ljava/lang/Object;)V

    .line 684
    .end local v4    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v5    # "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    goto :goto_1

    .line 686
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v3

    return-object v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method getSupportedAeMode(I)I
    .locals 4
    .param p1, "preferredMode"    # I

    .line 732
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 734
    .local v0, "modes":[I
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 735
    return v1

    .line 739
    :cond_0
    invoke-direct {p0, p1, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 740
    return p1

    .line 744
    :cond_1
    const/4 v2, 0x1

    invoke-direct {p0, v2, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 745
    return v2

    .line 748
    :cond_2
    return v1
.end method

.method getSupportedAfMode(I)I
    .locals 4
    .param p1, "preferredMode"    # I

    .line 701
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AF_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 702
    .local v0, "modes":[I
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 703
    return v1

    .line 707
    :cond_0
    invoke-direct {p0, p1, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 708
    return p1

    .line 712
    :cond_1
    const/4 v2, 0x4

    invoke-direct {p0, v2, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 713
    return v2

    .line 714
    :cond_2
    const/4 v2, 0x1

    invoke-direct {p0, v2, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isModeInList(I[I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 715
    return v2

    .line 718
    :cond_3
    return v1
.end method

.method public getTorchControl()Landroidx/camera/camera2/internal/TorchControl;
    .locals 1

    .line 264
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTorchControl:Landroidx/camera/camera2/internal/TorchControl;

    return-object v0
.end method

.method getUseCount()I
    .locals 2

    .line 247
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 248
    :try_start_0
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    monitor-exit v0

    return v1

    .line 249
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getZoomControl()Landroidx/camera/camera2/internal/ZoomControl;
    .locals 1

    .line 254
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    return-object v0
.end method

.method public getZslControl()Landroidx/camera/camera2/internal/ZslControl;
    .locals 1

    .line 274
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZslControl:Landroidx/camera/camera2/internal/ZslControl;

    return-object v0
.end method

.method incrementUseCount()V
    .locals 2

    .line 218
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 219
    :try_start_0
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mUseCount:I

    .line 220
    monitor-exit v0

    .line 221
    return-void

    .line 220
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method isTorchOn()Z
    .locals 1

    .line 623
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mIsTorchOn:Z

    return v0
.end method

.method public isZslDisabledByByUserCaseConfig()Z
    .locals 1

    .line 403
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZslControl:Landroidx/camera/camera2/internal/ZslControl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/ZslControl;->isZslDisabledByUserCaseConfig()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$addSessionCameraCaptureCallback$8$androidx-camera-camera2-internal-Camera2CameraControlImpl(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 589
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCaptureCallbackSet:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->addCaptureCallback(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 590
    return-void
.end method

.method synthetic lambda$new$0$androidx-camera-camera2-internal-Camera2CameraControlImpl()V
    .locals 1

    .line 213
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->getCaptureRequestListener()Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    return-void
.end method

.method synthetic lambda$removeSessionCameraCaptureCallback$9$androidx-camera-camera2-internal-Camera2CameraControlImpl(Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 1
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 596
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCameraCaptureCallbackSet:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraCaptureCallbackSet;->removeCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 597
    return-void
.end method

.method synthetic lambda$submitStillCaptureRequests$5$androidx-camera-camera2-internal-Camera2CameraControlImpl(Ljava/util/List;IIILjava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "captureConfigs"    # Ljava/util/List;
    .param p2, "captureMode"    # I
    .param p3, "flashMode"    # I
    .param p4, "flashType"    # I
    .param p5, "v"    # Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 486
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CapturePipeline:Landroidx/camera/camera2/internal/Camera2CapturePipeline;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->submitStillCaptures(Ljava/util/List;III)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$updateSessionConfigAsync$6$androidx-camera-camera2-internal-Camera2CameraControlImpl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 3
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 537
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfigSynchronous()J

    move-result-wide v0

    .line 538
    .local v0, "sessionUpdateId":J
    invoke-direct {p0, v0, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->waitForSessionUpdateId(J)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    invoke-static {v2, p1}, Landroidx/camera/core/impl/utils/futures/Futures;->propagate(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 539
    return-void
.end method

.method synthetic lambda$updateSessionConfigAsync$7$androidx-camera-camera2-internal-Camera2CameraControlImpl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 536
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 540
    const-string/jumbo v0, "updateSessionConfigAsync"

    return-object v0
.end method

.method synthetic lambda$waitForSessionUpdateId$4$androidx-camera-camera2-internal-Camera2CameraControlImpl(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "sessionUpdateIdToWait"    # J
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 421
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;

    invoke-direct {v0, p1, p2, p3}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;-><init>(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 429
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "waitForSessionUpdateId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method removeCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 577
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mSessionCallback:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CameraControlSessionCallback;->removeListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 578
    return-void
.end method

.method removeSessionCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 2
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 595
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 598
    return-void
.end method

.method resetTemplate()V
    .locals 1

    .line 515
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->setTemplate(I)V

    .line 516
    return-void
.end method

.method setActive(Z)V
    .locals 1
    .param p1, "isActive"    # Z

    .line 311
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->setActive(Z)V

    .line 312
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/ZoomControl;->setActive(Z)V

    .line 313
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTorchControl:Landroidx/camera/camera2/internal/TorchControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/TorchControl;->setActive(Z)V

    .line 314
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExposureControl:Landroidx/camera/camera2/internal/ExposureControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/ExposureControl;->setActive(Z)V

    .line 315
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CameraControl:Landroidx/camera/camera2/interop/Camera2CameraControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->setActive(Z)V

    .line 316
    return-void
.end method

.method public setExposureCompensationIndex(I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "exposure"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 460
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 461
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 464
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExposureControl:Landroidx/camera/camera2/internal/ExposureControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/ExposureControl;->setExposureCompensationIndex(I)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setFlashMode(I)V
    .locals 3
    .param p1, "flashMode"    # I

    .line 374
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 375
    const-string v0, "Camera2CameraControlImp"

    const-string v1, "Camera is not active."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    return-void

    .line 379
    :cond_0
    iput p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashMode:I

    .line 382
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZslControl:Landroidx/camera/camera2/internal/ZslControl;

    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashMode:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashMode:I

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :cond_2
    :goto_0
    invoke-interface {v0, v2}, Landroidx/camera/camera2/internal/ZslControl;->setZslDisabledByFlashMode(Z)V

    .line 388
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfigAsync()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashModeChangeSessionUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 389
    return-void
.end method

.method public setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "linearZoom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 358
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 359
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 362
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/ZoomControl;->setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setPreviewAspectRatio(Landroid/util/Rational;)V
    .locals 1
    .param p1, "previewAspectRatio"    # Landroid/util/Rational;

    .line 320
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->setPreviewAspectRatio(Landroid/util/Rational;)V

    .line 321
    return-void
.end method

.method setTemplate(I)V
    .locals 2
    .param p1, "template"    # I

    .line 507
    iput p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    .line 509
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->setTemplate(I)V

    .line 510
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCamera2CapturePipeline:Landroidx/camera/camera2/internal/Camera2CapturePipeline;

    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mTemplate:I

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->setTemplate(I)V

    .line 511
    return-void
.end method

.method public setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "ratio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 348
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 349
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 352
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZoomControl:Landroidx/camera/camera2/internal/ZoomControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/ZoomControl;->setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setZslDisabledByUserCaseConfig(Z)V
    .locals 1
    .param p1, "disabled"    # Z

    .line 398
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mZslControl:Landroidx/camera/camera2/internal/ZslControl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/ZslControl;->setZslDisabledByUserCaseConfig(Z)V

    .line 399
    return-void
.end method

.method public startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;
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

    .line 327
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 328
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "Camera is not active."

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 331
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFocusMeteringControl:Landroidx/camera/camera2/internal/FocusMeteringControl;

    .line 332
    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 331
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method submitCaptureRequestsInternal(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)V"
        }
    .end annotation

    .line 628
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mControlUpdateCallback:Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;->onCameraControlCaptureRequests(Ljava/util/List;)V

    .line 629
    return-void
.end method

.method public submitStillCaptureRequests(Ljava/util/List;II)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 7
    .param p2, "captureMode"    # I
    .param p3, "flashType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;II)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 474
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->isControlInUse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 475
    const-string v0, "Camera2CameraControlImp"

    const-string v1, "Camera is not active."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    new-instance v0, Landroidx/camera/core/CameraControl$OperationCanceledException;

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 483
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getFlashMode()I

    move-result v5

    .line 484
    .local v5, "flashMode":I
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mFlashModeChangeSessionUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v0

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda1;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v6, p3

    .end local p1    # "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    .end local p2    # "captureMode":I
    .end local p3    # "flashType":I
    .local v3, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    .local v4, "captureMode":I
    .local v6, "flashType":I
    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Ljava/util/List;III)V

    iget-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 485
    invoke-virtual {v0, v1, p1}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object p1

    .line 484
    return-object p1
.end method

.method public updateSessionConfig()V
    .locals 2

    .line 526
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 527
    return-void
.end method

.method updateSessionConfigAsync()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 535
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 543
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method

.method updateSessionConfigSynchronous()J
    .locals 2

    .line 556
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mNextSessionUpdateId:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCurrentSessionUpdateId:J

    .line 557
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mControlUpdateCallback:Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal$ControlUpdateCallback;->onCameraControlUpdateSessionConfig()V

    .line 558
    iget-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->mCurrentSessionUpdateId:J

    return-wide v0
.end method
