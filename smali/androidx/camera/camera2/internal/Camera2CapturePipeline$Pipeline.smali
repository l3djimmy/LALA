.class Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;
.super Ljava/lang/Object;
.source "Camera2CapturePipeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CapturePipeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Pipeline"
.end annotation


# static fields
.field private static final CHECK_3A_TIMEOUT_IN_NS:J

.field private static final CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS:J


# instance fields
.field private final mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mIsLegacyDevice:Z

.field private final mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

.field private final mPipelineSubTask:Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

.field final mTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;",
            ">;"
        }
    .end annotation
.end field

.field private final mTemplate:I

.field private mTimeout3A:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 207
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->CHECK_3A_TIMEOUT_IN_NS:J

    .line 208
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS:J

    return-void
.end method

.method constructor <init>(ILjava/util/concurrent/Executor;Landroidx/camera/camera2/internal/Camera2CameraControlImpl;ZLandroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;)V
    .locals 2
    .param p1, "template"    # I
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "cameraControl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p4, "isLegacyDevice"    # Z
    .param p5, "overrideAeModeForStillCapture"    # Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    sget-wide v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->CHECK_3A_TIMEOUT_IN_NS:J

    iput-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTimeout3A:J

    .line 216
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTasks:Ljava/util/List;

    .line 219
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mPipelineSubTask:Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    .line 254
    iput p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTemplate:I

    .line 255
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mExecutor:Ljava/util/concurrent/Executor;

    .line 256
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 257
    iput-boolean p4, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mIsLegacyDevice:Z

    .line 258
    iput-object p5, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    .line 259
    return-void
.end method

.method private applyAeModeQuirk(Landroidx/camera/core/impl/CaptureConfig$Builder;)V
    .locals 3
    .param p1, "configBuilder"    # Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 407
    new-instance v0, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 408
    .local v0, "impBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 409
    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 408
    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 410
    invoke-virtual {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 411
    return-void
.end method

.method private applyStillCaptureTemplate(Landroidx/camera/core/impl/CaptureConfig$Builder;Landroidx/camera/core/impl/CaptureConfig;)V
    .locals 4
    .param p1, "configBuilder"    # Landroidx/camera/core/impl/CaptureConfig$Builder;
    .param p2, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 388
    const/4 v0, -0x1

    .line 389
    .local v0, "templateToModify":I
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTemplate:I

    const/4 v2, 0x3

    const/4 v3, -0x1

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mIsLegacyDevice:Z

    if-nez v1, :cond_0

    .line 393
    const/4 v0, 0x4

    goto :goto_0

    .line 394
    :cond_0
    invoke-virtual {p2}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v1

    if-eq v1, v3, :cond_1

    .line 395
    invoke-virtual {p2}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_2

    .line 396
    :cond_1
    const/4 v0, 0x2

    .line 399
    :cond_2
    :goto_0
    if-eq v0, v3, :cond_3

    .line 400
    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 402
    :cond_3
    return-void
.end method

.method static synthetic lambda$executeCapture$1(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 1
    .param p0, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 300
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->is3AConverged(Landroid/hardware/camera2/TotalCaptureResult;Z)Z

    move-result v0

    return v0
.end method

.method private setTimeout3A(J)V
    .locals 0
    .param p1, "timeout3A"    # J

    .line 277
    iput-wide p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTimeout3A:J

    .line 278
    return-void
.end method


# virtual methods
.method addTask(Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;)V
    .locals 1
    .param p1, "task"    # Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    .line 267
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTasks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    return-void
.end method

.method executeCapture(Ljava/util/List;I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 5
    .param p2, "flashMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 285
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 286
    .local v1, "preCapture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroid/hardware/camera2/TotalCaptureResult;>;"
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 288
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mPipelineSubTask:Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    invoke-interface {v2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;->isCaptureResultNeeded()Z

    move-result v2

    if-eqz v2, :cond_0

    const-wide/16 v2, 0x0

    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-static {v2, v3, v4, v0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->waitForResult(JLandroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    goto :goto_0

    .line 290
    :cond_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    :goto_0
    nop

    .line 292
    .local v0, "getResult":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroid/hardware/camera2/TotalCaptureResult;>;"
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v2

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;I)V

    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v2

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;)V

    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mExecutor:Ljava/util/concurrent/Executor;

    .line 297
    invoke-virtual {v2, v3, v4}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    .line 306
    .end local v0    # "getResult":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroid/hardware/camera2/TotalCaptureResult;>;"
    :cond_1
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v0

    new-instance v2, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p1, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;Ljava/util/List;I)V

    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v2, v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v0

    .line 311
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/util/List<Ljava/lang/Void;>;>;"
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mPipelineSubTask:Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda5;

    invoke-direct {v3, v2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;)V

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, v3, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 313
    return-object v0
.end method

.method synthetic lambda$executeCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline(ILandroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "flashMode"    # I
    .param p2, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 293
    invoke-static {p1, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->isFlashRequired(ILandroid/hardware/camera2/TotalCaptureResult;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    sget-wide v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS:J

    invoke-direct {p0, v0, v1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->setTimeout3A(J)V

    .line 296
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mPipelineSubTask:Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    invoke-interface {v0, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;->preCapture(Landroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$executeCapture$2$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline(Ljava/lang/Boolean;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
    .param p1, "is3aConvergeRequired"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 298
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    iget-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTimeout3A:J

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0, v1, v2, v3}, Landroidx/camera/camera2/internal/Camera2CapturePipeline;->waitForResult(JLandroidx/camera/camera2/internal/Camera2CameraControlImpl;Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 302
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$executeCapture$3$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline(Ljava/util/List;ILandroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "captureConfigs"    # Ljava/util/List;
    .param p2, "flashMode"    # I
    .param p3, "v"    # Landroid/hardware/camera2/TotalCaptureResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 307
    invoke-virtual {p0, p1, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->submitConfigsInternal(Ljava/util/List;I)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$submitConfigsInternal$4$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline(Landroidx/camera/core/impl/CaptureConfig$Builder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p1, "configBuilder"    # Landroidx/camera/core/impl/CaptureConfig$Builder;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 355
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;

    invoke-direct {v0, p0, p2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 376
    const-string/jumbo v0, "submitStillCapture"

    return-object v0
.end method

.method submitConfigsInternal(Ljava/util/List;I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 9
    .param p2, "flashMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 320
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 321
    .local v0, "futureList":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .local v1, "configsToSubmit":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CaptureConfig;

    .line 323
    .local v3, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-static {v3}, Landroidx/camera/core/impl/CaptureConfig$Builder;->from(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig$Builder;

    move-result-object v4

    .line 327
    .local v4, "configBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    const/4 v5, 0x0

    .line 328
    .local v5, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    invoke-virtual {v3}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v6

    const/4 v7, 0x5

    if-ne v6, v7, :cond_1

    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 329
    invoke-virtual {v6}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getZslControl()Landroidx/camera/camera2/internal/ZslControl;

    move-result-object v6

    invoke-interface {v6}, Landroidx/camera/camera2/internal/ZslControl;->isZslDisabledByFlashMode()Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 330
    invoke-virtual {v6}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getZslControl()Landroidx/camera/camera2/internal/ZslControl;

    move-result-object v6

    invoke-interface {v6}, Landroidx/camera/camera2/internal/ZslControl;->isZslDisabledByUserCaseConfig()Z

    move-result v6

    if-nez v6, :cond_1

    .line 331
    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 332
    invoke-virtual {v6}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getZslControl()Landroidx/camera/camera2/internal/ZslControl;

    move-result-object v6

    invoke-interface {v6}, Landroidx/camera/camera2/internal/ZslControl;->dequeueImageFromBuffer()Landroidx/camera/core/ImageProxy;

    move-result-object v6

    .line 333
    .local v6, "imageProxy":Landroidx/camera/core/ImageProxy;
    if-eqz v6, :cond_0

    iget-object v7, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 334
    invoke-virtual {v7}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getZslControl()Landroidx/camera/camera2/internal/ZslControl;

    move-result-object v7

    invoke-interface {v7, v6}, Landroidx/camera/camera2/internal/ZslControl;->enqueueImageToImageWriter(Landroidx/camera/core/ImageProxy;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    :cond_0
    const/4 v7, 0x0

    .line 336
    .local v7, "isSuccess":Z
    :goto_1
    if-eqz v7, :cond_1

    .line 337
    nop

    .line 339
    invoke-interface {v6}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v8

    .line 338
    invoke-static {v8}, Landroidx/camera/core/impl/CameraCaptureResults;->retrieveCameraCaptureResult(Landroidx/camera/core/ImageInfo;)Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v5

    .line 343
    .end local v6    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .end local v7    # "isSuccess":Z
    :cond_1
    if-eqz v5, :cond_2

    .line 344
    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setCameraCaptureResult(Landroidx/camera/core/impl/CameraCaptureResult;)V

    goto :goto_2

    .line 347
    :cond_2
    invoke-direct {p0, v4, v3}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->applyStillCaptureTemplate(Landroidx/camera/core/impl/CaptureConfig$Builder;Landroidx/camera/core/impl/CaptureConfig;)V

    .line 350
    :goto_2
    iget-object v6, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mOverrideAeModeForStillCapture:Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;

    invoke-virtual {v6, p2}, Landroidx/camera/camera2/internal/compat/workaround/OverrideAeModeForStillCapture;->shouldSetAeModeAlwaysFlash(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 351
    invoke-direct {p0, v4}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->applyAeModeQuirk(Landroidx/camera/core/impl/CaptureConfig$Builder;)V

    .line 354
    :cond_3
    new-instance v6, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda1;

    invoke-direct {v6, p0, v4}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;Landroidx/camera/core/impl/CaptureConfig$Builder;)V

    invoke-static {v6}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 378
    invoke-virtual {v4}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    .end local v3    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    .end local v4    # "configBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    .end local v5    # "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    goto :goto_0

    .line 380
    :cond_4
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mCameraControl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v2, v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->submitCaptureRequestsInternal(Ljava/util/List;)V

    .line 382
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->allAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    return-object v2
.end method
