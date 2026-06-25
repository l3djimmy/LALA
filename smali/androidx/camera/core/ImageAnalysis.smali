.class public final Landroidx/camera/core/ImageAnalysis;
.super Landroidx/camera/core/UseCase;
.source "ImageAnalysis.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/ImageAnalysis$Analyzer;,
        Landroidx/camera/core/ImageAnalysis$Defaults;,
        Landroidx/camera/core/ImageAnalysis$Builder;,
        Landroidx/camera/core/ImageAnalysis$OutputImageFormat;,
        Landroidx/camera/core/ImageAnalysis$BackpressureStrategy;
    }
.end annotation


# static fields
.field public static final COORDINATE_SYSTEM_ORIGINAL:I = 0x0

.field private static final DEFAULT_BACKPRESSURE_STRATEGY:I = 0x0

.field public static final DEFAULT_CONFIG:Landroidx/camera/core/ImageAnalysis$Defaults;

.field private static final DEFAULT_IMAGE_QUEUE_DEPTH:I = 0x6

.field private static final DEFAULT_ONE_PIXEL_SHIFT_ENABLED:Ljava/lang/Boolean;

.field private static final DEFAULT_OUTPUT_IMAGE_FORMAT:I = 0x1

.field private static final DEFAULT_OUTPUT_IMAGE_ROTATION_ENABLED:Z = false

.field private static final NON_BLOCKING_IMAGE_DEPTH:I = 0x4

.field public static final OUTPUT_IMAGE_FORMAT_RGBA_8888:I = 0x2

.field public static final OUTPUT_IMAGE_FORMAT_YUV_420_888:I = 0x1

.field public static final STRATEGY_BLOCK_PRODUCER:I = 0x1

.field public static final STRATEGY_KEEP_ONLY_LATEST:I = 0x0

.field private static final TAG:Ljava/lang/String; = "ImageAnalysis"


# instance fields
.field private final mAnalysisLock:Ljava/lang/Object;

.field private mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

.field final mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

.field mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

.field private mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 193
    new-instance v0, Landroidx/camera/core/ImageAnalysis$Defaults;

    invoke-direct {v0}, Landroidx/camera/core/ImageAnalysis$Defaults;-><init>()V

    sput-object v0, Landroidx/camera/core/ImageAnalysis;->DEFAULT_CONFIG:Landroidx/camera/core/ImageAnalysis$Defaults;

    .line 203
    const/4 v0, 0x0

    sput-object v0, Landroidx/camera/core/ImageAnalysis;->DEFAULT_ONE_PIXEL_SHIFT_ENABLED:Ljava/lang/Boolean;

    return-void
.end method

.method constructor <init>(Landroidx/camera/core/impl/ImageAnalysisConfig;)V
    .locals 3
    .param p1, "config"    # Landroidx/camera/core/impl/ImageAnalysisConfig;

    .line 236
    invoke-direct {p0, p1}, Landroidx/camera/core/UseCase;-><init>(Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 209
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mAnalysisLock:Ljava/lang/Object;

    .line 239
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    .line 241
    .local v0, "combinedConfig":Landroidx/camera/core/impl/ImageAnalysisConfig;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getBackpressureStrategy(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 243
    new-instance v1, Landroidx/camera/core/ImageAnalysisBlockingAnalyzer;

    invoke-direct {v1}, Landroidx/camera/core/ImageAnalysisBlockingAnalyzer;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    goto :goto_0

    .line 245
    :cond_0
    new-instance v1, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;

    .line 246
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->highPriorityExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getBackgroundExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    .line 248
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setOutputImageFormat(I)V

    .line 249
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    .line 250
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->isOutputImageRotationEnabled()Z

    move-result v2

    .line 249
    invoke-virtual {v1, v2}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setOutputImageRotationEnabled(Z)V

    .line 251
    return-void
.end method

.method private isFlipWH(Landroidx/camera/core/impl/CameraInternal;)Z
    .locals 2
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;

    .line 590
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->isOutputImageRotationEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 591
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 590
    :goto_0
    return v1
.end method

.method static synthetic lambda$createPipeline$1(Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 0
    .param p0, "imageReaderProxy"    # Landroidx/camera/core/SafeCloseImageReaderProxy;
    .param p1, "processedImageReaderProxy"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 420
    invoke-virtual {p0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 421
    if-eqz p1, :cond_0

    .line 422
    invoke-virtual {p1}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 424
    :cond_0
    return-void
.end method

.method static synthetic lambda$onMergeConfig$0(Landroid/util/Size;Ljava/util/List;I)Ljava/util/List;
    .locals 2
    .param p0, "analyzerResolutionFinal"    # Landroid/util/Size;
    .param p1, "supportedSizes"    # Ljava/util/List;
    .param p2, "rotationDegrees"    # I

    .line 332
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 333
    .local v0, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 334
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 335
    const/4 v1, 0x0

    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 337
    :cond_0
    return-object v0
.end method

.method static synthetic lambda$setAnalyzer$3(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageProxy;)V
    .locals 0
    .param p0, "analyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;

    .line 559
    invoke-interface {p0, p1}, Landroidx/camera/core/ImageAnalysis$Analyzer;->analyze(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method private tryUpdateRelativeRotation()V
    .locals 3

    .line 806
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 807
    .local v0, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    if-eqz v0, :cond_0

    .line 808
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageAnalysis;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setRelativeRotation(I)V

    .line 810
    :cond_0
    return-void
.end method


# virtual methods
.method public clearAnalyzer()V
    .locals 3

    .line 469
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mAnalysisLock:Ljava/lang/Object;

    monitor-enter v0

    .line 470
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 471
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-eqz v1, :cond_0

    .line 472
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->notifyInactive()V

    .line 474
    :cond_0
    iput-object v2, p0, Landroidx/camera/core/ImageAnalysis;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 475
    monitor-exit v0

    .line 476
    return-void

    .line 475
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method clearPipeline()V
    .locals 1

    .line 456
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 457
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    if-eqz v0, :cond_0

    .line 458
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 459
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 461
    :cond_0
    return-void
.end method

.method createPipeline(Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 17
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "config"    # Landroidx/camera/core/impl/ImageAnalysisConfig;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 351
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 352
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v2

    .line 354
    .local v2, "resolution":Landroid/util/Size;
    nop

    .line 355
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->highPriorityExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 354
    invoke-virtual {v1, v3}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getBackgroundExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v3

    invoke-static {v3}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/Executor;

    .line 358
    .local v3, "backgroundExecutor":Ljava/util/concurrent/Executor;
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v4

    goto :goto_0

    .line 359
    :cond_0
    const/4 v4, 0x4

    :goto_0
    move v10, v4

    .line 361
    .local v10, "imageQueueDepth":I
    invoke-virtual {v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 362
    new-instance v4, Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 363
    invoke-virtual {v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v6

    .line 364
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v8

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageFormat()I

    move-result v9

    .line 363
    const-wide/16 v11, 0x0

    invoke-interface/range {v6 .. v12}, Landroidx/camera/core/ImageReaderProxyProvider;->newInstance(IIIIJ)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v6

    invoke-direct {v4, v6}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .local v4, "imageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    goto :goto_1

    .line 367
    .end local v4    # "imageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    :cond_1
    new-instance v4, Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 369
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v6

    .line 370
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v7

    .line 371
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageFormat()I

    move-result v8

    .line 368
    invoke-static {v6, v7, v8, v10}, Landroidx/camera/core/ImageReaderProxys;->createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v6

    invoke-direct {v4, v6}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 375
    .restart local v4    # "imageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    :goto_1
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v6

    const/4 v7, 0x0

    if-eqz v6, :cond_2

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v6

    invoke-direct {v0, v6}, Landroidx/camera/core/ImageAnalysis;->isFlipWH(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v6

    goto :goto_2

    :cond_2
    move v6, v7

    .line 376
    .local v6, "flipWH":Z
    :goto_2
    if-eqz v6, :cond_3

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v8

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v8

    .line 377
    .local v8, "width":I
    :goto_3
    if-eqz v6, :cond_4

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v9

    goto :goto_4

    :cond_4
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v9

    .line 378
    .local v9, "height":I
    :goto_4
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v11

    const/4 v12, 0x2

    const/16 v13, 0x23

    if-ne v11, v12, :cond_5

    .line 379
    move v11, v5

    goto :goto_5

    :cond_5
    move v11, v13

    .line 381
    .local v11, "format":I
    :goto_5
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageFormat()I

    move-result v14

    if-ne v14, v13, :cond_6

    .line 382
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v14

    if-ne v14, v12, :cond_6

    move v12, v5

    goto :goto_6

    :cond_6
    move v12, v7

    .line 383
    .local v12, "isYuv2Rgb":Z
    :goto_6
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageFormat()I

    move-result v14

    if-ne v14, v13, :cond_9

    .line 384
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v13

    if-eqz v13, :cond_7

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v13

    invoke-virtual {v0, v13}, Landroidx/camera/core/ImageAnalysis;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v13

    if-nez v13, :cond_8

    :cond_7
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 385
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getOnePixelShiftEnabled()Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    :cond_8
    goto :goto_7

    :cond_9
    move v5, v7

    .line 391
    .local v5, "isYuvRotationOrPixelShift":Z
    :goto_7
    if-nez v12, :cond_b

    if-eqz v5, :cond_a

    goto :goto_8

    .line 397
    :cond_a
    const/4 v7, 0x0

    goto :goto_9

    .line 392
    :cond_b
    :goto_8
    new-instance v7, Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 397
    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getMaxImages()I

    move-result v13

    .line 393
    invoke-static {v8, v9, v11, v13}, Landroidx/camera/core/ImageReaderProxys;->createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v13

    invoke-direct {v7, v13}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 397
    :goto_9
    nop

    .line 398
    .local v7, "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    if-eqz v7, :cond_c

    .line 399
    iget-object v13, v0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v13, v7}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setProcessedImageReaderProxy(Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 402
    :cond_c
    invoke-direct {v0}, Landroidx/camera/core/ImageAnalysis;->tryUpdateRelativeRotation()V

    .line 404
    iget-object v13, v0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v4, v13, v3}, Landroidx/camera/core/SafeCloseImageReaderProxy;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Ljava/util/concurrent/Executor;)V

    .line 407
    nop

    .line 408
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v13

    .line 407
    invoke-static {v1, v13}, Landroidx/camera/core/impl/SessionConfig$Builder;->createFrom(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v13

    .line 409
    .local v13, "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v14

    if-eqz v14, :cond_d

    .line 410
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 413
    :cond_d
    iget-object v14, v0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    if-eqz v14, :cond_e

    .line 414
    iget-object v14, v0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v14}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 416
    :cond_e
    new-instance v14, Landroidx/camera/core/impl/ImmediateSurface;

    invoke-virtual {v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v15

    .line 417
    move-object/from16 v16, v3

    .end local v3    # "backgroundExecutor":Ljava/util/concurrent/Executor;
    .local v16, "backgroundExecutor":Ljava/util/concurrent/Executor;
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageFormat()I

    move-result v3

    invoke-direct {v14, v15, v2, v3}, Landroidx/camera/core/impl/ImmediateSurface;-><init>(Landroid/view/Surface;Landroid/util/Size;I)V

    iput-object v14, v0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 418
    iget-object v3, v0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v3}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    new-instance v14, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda0;

    invoke-direct {v14, v4, v7}, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/SafeCloseImageReaderProxy;Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 425
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v15

    .line 418
    invoke-interface {v3, v14, v15}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 427
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v3

    invoke-virtual {v13, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 429
    iget-object v3, v0, Landroidx/camera/core/ImageAnalysis;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v14

    invoke-virtual {v13, v3, v14}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 431
    new-instance v3, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;

    move-object/from16 v14, p1

    move-object/from16 v15, p3

    invoke-direct {v3, v0, v14, v1, v15}, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageAnalysis;Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;)V

    invoke-virtual {v13, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addErrorListener(Landroidx/camera/core/impl/SessionConfig$ErrorListener;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 448
    return-object v13
.end method

.method public getBackgroundExecutor()Ljava/util/concurrent/Executor;
    .locals 2

    .line 623
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    .line 624
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getBackgroundExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v0

    .line 623
    return-object v0
.end method

.method public getBackpressureStrategy()I
    .locals 2

    .line 609
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getBackpressureStrategy(I)I

    move-result v0

    return v0
.end method

.method public getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 2
    .param p1, "applyDefaultConfig"    # Z
    .param p2, "factory"    # Landroidx/camera/core/impl/UseCaseConfigFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            ")",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 740
    sget-object v0, Landroidx/camera/core/ImageAnalysis;->DEFAULT_CONFIG:Landroidx/camera/core/ImageAnalysis$Defaults;

    .line 741
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis$Defaults;->getConfig()Landroidx/camera/core/impl/ImageAnalysisConfig;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v0

    .line 740
    const/4 v1, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/camera/core/impl/UseCaseConfigFactory;->getConfig(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 744
    .local v0, "captureConfig":Landroidx/camera/core/impl/Config;
    if-eqz p1, :cond_0

    .line 745
    sget-object v1, Landroidx/camera/core/ImageAnalysis;->DEFAULT_CONFIG:Landroidx/camera/core/ImageAnalysis$Defaults;

    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis$Defaults;->getConfig()Landroidx/camera/core/impl/ImageAnalysisConfig;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/impl/Config;->mergeConfigs(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 748
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 749
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageAnalysis;->getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    .line 748
    :goto_0
    return-object v1
.end method

.method public getImageQueueDepth()I
    .locals 2

    .line 642
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getImageQueueDepth(I)I

    move-result v0

    return v0
.end method

.method public getOnePixelShiftEnabled()Ljava/lang/Boolean;
    .locals 2

    .line 678
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    sget-object v1, Landroidx/camera/core/ImageAnalysis;->DEFAULT_ONE_PIXEL_SHIFT_ENABLED:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getOnePixelShiftEnabled(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getOutputImageFormat()I
    .locals 2

    .line 658
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->getOutputImageFormat(I)I

    move-result v0

    return v0
.end method

.method public getResolutionInfo()Landroidx/camera/core/ResolutionInfo;
    .locals 1

    .line 700
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getResolutionInfoInternal()Landroidx/camera/core/ResolutionInfo;

    move-result-object v0

    return-object v0
.end method

.method public getResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 2

    .line 711
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v0

    return-object v0
.end method

.method public getTargetRotation()I
    .locals 1

    .line 494
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getTargetRotationInternal()I

    move-result v0

    return v0
.end method

.method public getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/Config;",
            ")",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;"
        }
    .end annotation

    .line 770
    invoke-static {p1}, Landroidx/camera/core/ImageAnalysis$Builder;->fromConfig(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object v0

    return-object v0
.end method

.method public isOutputImageRotationEnabled()Z
    .locals 2

    .line 669
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    .line 670
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 669
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;->isOutputImageRotationEnabled(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$createPipeline$2$androidx-camera-core-ImageAnalysis(Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "config"    # Landroidx/camera/core/impl/ImageAnalysisConfig;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .param p4, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p5, "error"    # Landroidx/camera/core/impl/SessionConfig$SessionError;

    .line 432
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->clearPipeline()V

    .line 434
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->clearCache()V

    .line 438
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis;->isCurrentCamera(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/core/ImageAnalysis;->createPipeline(Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    .line 442
    .local v0, "errorSessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/camera/core/ImageAnalysis;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 444
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->notifyReset()V

    .line 446
    .end local v0    # "errorSessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    :cond_0
    return-void
.end method

.method public onBind()V
    .locals 1

    .line 759
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->attach()V

    .line 760
    return-void
.end method

.method protected onMergeConfig(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 9
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;)",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 267
    .local p2, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getOnePixelShiftEnabled()Ljava/lang/Boolean;

    move-result-object v0

    .line 268
    .local v0, "isOnePixelShiftEnabled":Ljava/lang/Boolean;
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraQuirks()Landroidx/camera/core/impl/Quirks;

    move-result-object v1

    const-class v2, Landroidx/camera/core/internal/compat/quirk/OnePixelShiftQuirk;

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 269
    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    .line 270
    .local v1, "isOnePixelShiftIssueDevice":Z
    :goto_0
    iget-object v4, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    .line 271
    if-nez v0, :cond_1

    move v5, v1

    goto :goto_1

    .line 272
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    .line 270
    :goto_1
    invoke-virtual {v4, v5}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setOnePixelShiftEnabled(Z)V

    .line 276
    iget-object v4, p0, Landroidx/camera/core/ImageAnalysis;->mAnalysisLock:Ljava/lang/Object;

    monitor-enter v4

    .line 277
    :try_start_0
    iget-object v5, p0, Landroidx/camera/core/ImageAnalysis;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    const/4 v6, 0x0

    if-eqz v5, :cond_2

    .line 278
    iget-object v5, p0, Landroidx/camera/core/ImageAnalysis;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-interface {v5}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getDefaultTargetResolution()Landroid/util/Size;

    move-result-object v5

    goto :goto_2

    :cond_2
    move-object v5, v6

    .line 279
    .local v5, "analyzerResolution":Landroid/util/Size;
    :goto_2
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    if-nez v5, :cond_3

    .line 282
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v2

    return-object v2

    .line 285
    :cond_3
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v4

    sget-object v7, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ROTATION:Landroidx/camera/core/impl/Config$Option;

    .line 286
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 285
    invoke-interface {v4, v7, v3}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 290
    .local v3, "targetRotation":I
    invoke-interface {p1, v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees(I)I

    move-result v4

    rem-int/lit16 v4, v4, 0xb4

    const/16 v7, 0x5a

    if-ne v4, v7, :cond_4

    .line 291
    new-instance v4, Landroid/util/Size;

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v7

    .line 292
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v8

    invoke-direct {v4, v7, v8}, Landroid/util/Size;-><init>(II)V

    move-object v5, v4

    .line 297
    :cond_4
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    sget-object v7, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 298
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v4

    sget-object v7, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7, v5}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 308
    :cond_5
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    sget-object v7, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 309
    nop

    .line 310
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getAppConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    sget-object v7, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7, v6}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 313
    .local v4, "appResolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    if-nez v4, :cond_6

    new-instance v6, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    invoke-direct {v6}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;-><init>()V

    goto :goto_3

    .line 314
    :cond_6
    invoke-static {v4}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->fromResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    move-result-object v6

    :goto_3
    nop

    .line 318
    .local v6, "resolutionSelectorBuilder":Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;
    if-eqz v4, :cond_7

    .line 319
    invoke-virtual {v4}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionStrategy()Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    move-result-object v7

    if-nez v7, :cond_8

    .line 320
    :cond_7
    new-instance v7, Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    invoke-direct {v7, v5, v2}, Landroidx/camera/core/resolutionselector/ResolutionStrategy;-><init>(Landroid/util/Size;I)V

    invoke-virtual {v6, v7}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setResolutionStrategy(Landroidx/camera/core/resolutionselector/ResolutionStrategy;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    .line 328
    :cond_8
    if-nez v4, :cond_9

    .line 329
    move-object v2, v5

    .line 330
    .local v2, "analyzerResolutionFinal":Landroid/util/Size;
    new-instance v7, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda3;

    invoke-direct {v7, v2}, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda3;-><init>(Landroid/util/Size;)V

    invoke-virtual {v6, v7}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setResolutionFilter(Landroidx/camera/core/resolutionselector/ResolutionFilter;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    .line 341
    .end local v2    # "analyzerResolutionFinal":Landroid/util/Size;
    :cond_9
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v2

    sget-object v7, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    .line 342
    invoke-virtual {v6}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->build()Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v8

    .line 341
    invoke-interface {v2, v7, v8}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 345
    .end local v4    # "appResolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .end local v6    # "resolutionSelectorBuilder":Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;
    :cond_a
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v2

    return-object v2

    .line 279
    .end local v3    # "targetRotation":I
    .end local v5    # "analyzerResolution":Landroid/util/Size;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method protected onSuggestedStreamSpecImplementationOptionsUpdated(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 797
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 798
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageAnalysis;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 799
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    return-object v0
.end method

.method protected onSuggestedStreamSpecUpdated(Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/StreamSpec;
    .locals 2
    .param p1, "suggestedStreamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 781
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    .line 783
    .local v0, "config":Landroidx/camera/core/impl/ImageAnalysisConfig;
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getCameraId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0, p1}, Landroidx/camera/core/ImageAnalysis;->createPipeline(Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 785
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/camera/core/ImageAnalysis;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 787
    return-object p1
.end method

.method public onUnbind()V
    .locals 1

    .line 727
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->clearPipeline()V

    .line 728
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->detach()V

    .line 729
    return-void
.end method

.method public setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "analyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 558
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mAnalysisLock:Ljava/lang/Object;

    monitor-enter v0

    .line 559
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    new-instance v2, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda2;

    invoke-direct {v2, p2}, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    invoke-virtual {v1, p1, v2}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 560
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-nez v1, :cond_0

    .line 561
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->notifyActive()V

    .line 563
    :cond_0
    iput-object p2, p0, Landroidx/camera/core/ImageAnalysis;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 564
    monitor-exit v0

    .line 565
    return-void

    .line 564
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V
    .locals 1
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .line 585
    invoke-super {p0, p1}, Landroidx/camera/core/UseCase;->setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V

    .line 586
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V

    .line 587
    return-void
.end method

.method public setTargetRotation(I)V
    .locals 1
    .param p1, "rotation"    # I

    .line 535
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis;->setTargetRotationInternal(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 536
    invoke-direct {p0}, Landroidx/camera/core/ImageAnalysis;->tryUpdateRelativeRotation()V

    .line 538
    :cond_0
    return-void
.end method

.method public setViewPortCropRect(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "viewPortCropRect"    # Landroid/graphics/Rect;

    .line 574
    invoke-super {p0, p1}, Landroidx/camera/core/UseCase;->setViewPortCropRect(Landroid/graphics/Rect;)V

    .line 575
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis;->mImageAnalysisAbstractAnalyzer:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->setViewPortCropRect(Landroid/graphics/Rect;)V

    .line 576
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 717
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ImageAnalysis:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
