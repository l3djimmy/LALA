.class Landroidx/camera/camera2/internal/Camera2CapturePipeline;
.super Ljava/lang/Object;
.source "Camera2CapturePipeline.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;,
        Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;,
        Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;,
        Landroidx/camera/camera2/internal/Camera2CapturePipeline$TorchTask;,
        Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;,
        Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener;
    }
.end annotation


# static fields
.field private static final AE_CONVERGED_STATE_SET:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;",
            ">;"
        }
    .end annotation
.end field

.field private static final AE_TORCH_AS_FLASH_CONVERGED_STATE_SET:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;",
            ">;"
        }
    .end annotation
.end field

.field private static final AF_CONVERGED_STATE_SET:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;",
            ">;"
        }
    .end annotation
.end field

.field private static final AWB_CONVERGED_STATE_SET:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "Camera2CapturePipeline"


# instance fields
.field private final mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private final mCameraQuirk:Landroidx/camera/core/impl/Quirks;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mHasFlashUnit:Z

.field private final mIsLegacyDevice:Z

.field private mTemplate:I

.field private final mUseTorchAsFlash:Landroidx/camera/camera2/internal/compat/workaround/UseTorchAsFlash;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 85
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->PASSIVE_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->PASSIVE_NOT_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    sget-object v2, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->LOCKED_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    sget-object v3, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->LOCKED_NOT_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    .line 86
    invoke-static {v0, v1, v2, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AF_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 93
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->CONVERGED:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    .line 94
    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AWB_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 100
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->CONVERGED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->FLASH_REQUIRED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    sget-object v2, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    .line 101
    invoke-static {v0, v1, v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AE_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 111
    sget-object v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AE_CONVERGED_STATE_SET:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v0

    .line 115
    .local v0, "aeStateSet":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;>;"
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->FLASH_REQUIRED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    .line 120
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    .line 122
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    sput-object v1, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AE_TORCH_AS_FLASH_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 123
    .end local v0    # "aeStateSet":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;>;"
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/core/impl/Quirks;Ljava/util/concurrent/Executor;)V
    .locals 4
    .param p1, "cameraControl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p2, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p3, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p4, "executor"    # Ljava/util/concurrent/Executor;

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    const/4 v0, 0x1

    iput v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mTemplate:I

    .line 151
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 152
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 153
    invoke-virtual {p2, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 154
    .local v1, "level":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 155
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mIsLegacyDevice:Z

    .line 156
    iput-object p4, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mExecutor:Ljava/util/concurrent/Executor;

    .line 157
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraQuirk:Landroidx/camera/core/impl/Quirks;

    .line 158
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/UseTorchAsFlash;

    invoke-direct {v0, p3}, Landroidx/camera/camera2/internal/compat/workaround/UseTorchAsFlash;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mUseTorchAsFlash:Landroidx/camera/camera2/internal/compat/workaround/UseTorchAsFlash;

    .line 159
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->isFlashAvailable(Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mHasFlashUnit:Z

    .line 160
    return-void
.end method

.method static is3AConverged(Landroid/hardware/camera2/TotalCaptureResult;Z)Z
    .locals 10
    .param p0, "totalCaptureResult"    # Landroid/hardware/camera2/TotalCaptureResult;
    .param p1, "isTorchAsFlash"    # Z

    .line 426
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 427
    return v0

    .line 430
    :cond_0
    new-instance v1, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;-><init>(Landroid/hardware/camera2/CaptureResult;)V

    .line 435
    .local v1, "captureResult":Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAfMode()Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    move-result-object v2

    sget-object v3, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->OFF:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    const/4 v4, 0x1

    if-eq v2, v3, :cond_2

    .line 436
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAfMode()Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    move-result-object v2

    sget-object v3, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    if-eq v2, v3, :cond_2

    sget-object v2, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AF_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 437
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    move v2, v0

    goto :goto_1

    :cond_2
    :goto_0
    move v2, v4

    .line 440
    .local v2, "isAfReady":Z
    :goto_1
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v3}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_3

    move v3, v4

    goto :goto_2

    :cond_3
    move v3, v0

    .line 442
    .local v3, "isAeModeOff":Z
    :goto_2
    if-eqz p1, :cond_6

    .line 443
    if-nez v3, :cond_5

    sget-object v5, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AE_TORCH_AS_FLASH_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 444
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_3

    :cond_4
    move v5, v0

    goto :goto_4

    :cond_5
    :goto_3
    move v5, v4

    .local v5, "isAeReady":Z
    :goto_4
    goto :goto_6

    .line 446
    .end local v5    # "isAeReady":Z
    :cond_6
    if-nez v3, :cond_8

    sget-object v5, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AE_CONVERGED_STATE_SET:Ljava/util/Set;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_5

    :cond_7
    move v5, v0

    goto :goto_6

    :cond_8
    :goto_5
    move v5, v4

    .line 449
    .restart local v5    # "isAeReady":Z
    :goto_6
    sget-object v6, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, v6}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_9

    move v6, v4

    goto :goto_7

    :cond_9
    move v6, v0

    .line 451
    .local v6, "isAwbModeOff":Z
    :goto_7
    if-nez v6, :cond_b

    sget-object v7, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->AWB_CONVERGED_STATE_SET:Ljava/util/Set;

    .line 452
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAwbState()Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    goto :goto_8

    :cond_a
    move v7, v0

    goto :goto_9

    :cond_b
    :goto_8
    move v7, v4

    .line 454
    .local v7, "isAwbReady":Z
    :goto_9
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "checkCaptureResult, AE="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " AF ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 455
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " AWB="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 456
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->getAwbState()Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 454
    const-string v9, "Camera2CapturePipeline"

    invoke-static {v9, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    if-eqz v2, :cond_c

    if-eqz v5, :cond_c

    if-eqz v7, :cond_c

    move v0, v4

    :cond_c
    return v0
.end method

.method static isFlashRequired(ILandroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 5
    .param p0, "flashMode"    # I
    .param p1, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 661
    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_0

    .line 671
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 669
    :pswitch_0
    return v0

    .line 663
    :pswitch_1
    return v1

    .line 665
    :pswitch_2
    if-eqz p1, :cond_0

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/TotalCaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    goto :goto_0

    .line 666
    :cond_0
    const/4 v2, 0x0

    :goto_0
    nop

    .line 667
    .local v2, "aeState":Ljava/lang/Integer;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_1

    move v0, v1

    :cond_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isTorchAsFlash(I)Z
    .locals 3
    .param p1, "flashType"    # I

    .line 742
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mUseTorchAsFlash:Landroidx/camera/camera2/internal/compat/workaround/UseTorchAsFlash;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/UseTorchAsFlash;->shouldUseTorchAsFlash()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    iget v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mTemplate:I

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method static waitForResult(JLandroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p0, "waitTimeout"    # J
    .param p2, "cameraControl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p3, "checker"    # Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroidx/camera/camera2/internal/Camera2CameraControlImpl;",
            "Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroid/hardware/camera2/TotalCaptureResult;",
            ">;"
        }
    .end annotation

    .line 419
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener;

    invoke-direct {v0, p0, p1, p3}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener;-><init>(JLandroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;)V

    .line 420
    .local v0, "resultListener":Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener;
    invoke-virtual {p2, v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->addCaptureResultListener(Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;)V

    .line 421
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener;->getFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public setTemplate(I)V
    .locals 0
    .param p1, "template"    # I

    .line 164
    iput p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mTemplate:I

    .line 165
    return-void
.end method

.method public submitStillCaptures(Ljava/util/List;III)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 8
    .param p2, "captureMode"    # I
    .param p3, "flashMode"    # I
    .param p4, "flashType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;III)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 182
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraQuirk:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;-><init>(Landroidx/camera/core/impl/Quirks;)V

    move-object v7, v0

    .line 183
    .local v7, "aeQuirk":Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;
    new-instance v2, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    iget v3, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mTemplate:I

    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v5, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-boolean v6, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mIsLegacyDevice:Z

    invoke-direct/range {v2 .. v7}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;-><init>(ILjava/util/concurrent/Executor;Landroidx/camera/camera2/internal/Camera2CameraControlImpl;ZLandroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;)V

    .line 186
    .local v2, "pipeline":Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;
    if-nez p2, :cond_0

    .line 187
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AfTask;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;)V

    invoke-virtual {v2, v0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->addTask(Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;)V

    .line 190
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mHasFlashUnit:Z

    if-eqz v0, :cond_2

    .line 191
    invoke-direct {p0, p4}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->isTorchAsFlash(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 192
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$TorchTask;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, p3, v3}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$TorchTask;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;ILjava/util/concurrent/Executor;)V

    invoke-virtual {v2, v0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->addTask(Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;)V

    goto :goto_0

    .line 194
    :cond_1
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-direct {v0, v1, p3, v7}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$AePreCaptureTask;-><init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;ILandroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;)V

    invoke-virtual {v2, v0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->addTask(Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;)V

    .line 198
    :cond_2
    :goto_0
    nop

    .line 199
    invoke-virtual {v2, p1, p3}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->executeCapture(Ljava/util/List;I)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 198
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
