.class public Landroidx/camera/core/imagecapture/ImagePipeline;
.super Ljava/lang/Object;
.source "ImagePipeline.java"


# static fields
.field static final EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

.field static final JPEG_QUALITY_MAX_QUALITY:B = 0x64t

.field static final JPEG_QUALITY_MIN_LATENCY:B = 0x5ft


# instance fields
.field private final mBundlingNode:Landroidx/camera/core/imagecapture/SingleBundlingNode;

.field private final mCaptureConfig:Landroidx/camera/core/impl/CaptureConfig;

.field private final mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

.field private final mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

.field private final mProcessingNode:Landroidx/camera/core/imagecapture/ProcessingNode;

.field private final mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    new-instance v0, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    invoke-direct {v0}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;-><init>()V

    sput-object v0, Landroidx/camera/core/imagecapture/ImagePipeline;->EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/ImageCaptureConfig;Landroid/util/Size;)V
    .locals 2
    .param p1, "useCaseConfig"    # Landroidx/camera/core/impl/ImageCaptureConfig;
    .param p2, "cameraSurfaceSize"    # Landroid/util/Size;

    .line 93
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Landroidx/camera/core/imagecapture/ImagePipeline;-><init>(Landroidx/camera/core/impl/ImageCaptureConfig;Landroid/util/Size;Landroidx/camera/core/CameraEffect;Z)V

    .line 95
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/ImageCaptureConfig;Landroid/util/Size;Landroidx/camera/core/CameraEffect;Z)V
    .locals 3
    .param p1, "useCaseConfig"    # Landroidx/camera/core/impl/ImageCaptureConfig;
    .param p2, "cameraSurfaceSize"    # Landroid/util/Size;
    .param p3, "cameraEffect"    # Landroidx/camera/core/CameraEffect;
    .param p4, "isVirtualCamera"    # Z

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 104
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 105
    invoke-static {p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->createFrom(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/CaptureConfig$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureConfig:Landroidx/camera/core/impl/CaptureConfig;

    .line 108
    new-instance v0, Landroidx/camera/core/imagecapture/CaptureNode;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/CaptureNode;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    .line 109
    new-instance v0, Landroidx/camera/core/imagecapture/SingleBundlingNode;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/SingleBundlingNode;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mBundlingNode:Landroidx/camera/core/imagecapture/SingleBundlingNode;

    .line 110
    new-instance v0, Landroidx/camera/core/imagecapture/ProcessingNode;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 111
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->ioExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/ImageCaptureConfig;->getIoExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Executor;

    .line 112
    if-eqz p3, :cond_0

    new-instance v2, Landroidx/camera/core/processing/InternalImageProcessor;

    invoke-direct {v2, p3}, Landroidx/camera/core/processing/InternalImageProcessor;-><init>(Landroidx/camera/core/CameraEffect;)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-direct {v0, v1, v2}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/processing/InternalImageProcessor;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mProcessingNode:Landroidx/camera/core/imagecapture/ProcessingNode;

    .line 115
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 117
    invoke-virtual {v0}, Landroidx/camera/core/impl/ImageCaptureConfig;->getInputFormat()I

    move-result v0

    .line 118
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/ImagePipeline;->getOutputFormat()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 120
    invoke-virtual {v2}, Landroidx/camera/core/impl/ImageCaptureConfig;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v2

    .line 115
    invoke-static {p2, v0, v1, p4, v2}, Landroidx/camera/core/imagecapture/CaptureNode$In;->of(Landroid/util/Size;IIZLandroidx/camera/core/ImageReaderProxyProvider;)Landroidx/camera/core/imagecapture/CaptureNode$In;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    .line 121
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v0, v1}, Landroidx/camera/core/imagecapture/CaptureNode;->transform(Landroidx/camera/core/imagecapture/CaptureNode$In;)Landroidx/camera/core/imagecapture/CaptureNode$Out;

    move-result-object v0

    .line 122
    .local v0, "captureOut":Landroidx/camera/core/imagecapture/CaptureNode$Out;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mBundlingNode:Landroidx/camera/core/imagecapture/SingleBundlingNode;

    invoke-virtual {v1, v0}, Landroidx/camera/core/imagecapture/SingleBundlingNode;->transform(Landroidx/camera/core/imagecapture/CaptureNode$Out;)Landroidx/camera/core/imagecapture/ProcessingNode$In;

    move-result-object v1

    .line 123
    .local v1, "processingIn":Landroidx/camera/core/imagecapture/ProcessingNode$In;
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mProcessingNode:Landroidx/camera/core/imagecapture/ProcessingNode;

    invoke-virtual {v2, v1}, Landroidx/camera/core/imagecapture/ProcessingNode;->transform(Landroidx/camera/core/imagecapture/ProcessingNode$In;)Ljava/lang/Void;

    .line 124
    return-void
.end method

.method private createCameraRequest(Landroidx/camera/core/impl/CaptureBundle;Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureCallback;)Landroidx/camera/core/imagecapture/CameraRequest;
    .locals 7
    .param p1, "captureBundle"    # Landroidx/camera/core/impl/CaptureBundle;
    .param p2, "takePictureRequest"    # Landroidx/camera/core/imagecapture/TakePictureRequest;
    .param p3, "takePictureCallback"    # Landroidx/camera/core/imagecapture/TakePictureCallback;

    .line 255
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 256
    .local v0, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 257
    .local v1, "tagBundleKey":Ljava/lang/String;
    invoke-interface {p1}, Landroidx/camera/core/impl/CaptureBundle;->getCaptureStages()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CaptureStage;

    .line 258
    .local v3, "captureStage":Landroidx/camera/core/impl/CaptureStage;
    new-instance v4, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v4}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 259
    .local v4, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    iget-object v5, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureConfig:Landroidx/camera/core/impl/CaptureConfig;

    invoke-virtual {v5}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 262
    iget-object v5, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureConfig:Landroidx/camera/core/impl/CaptureConfig;

    invoke-virtual {v5}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 263
    nop

    .line 264
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getSessionConfigCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v5

    .line 263
    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addAllCameraCaptureCallbacks(Ljava/util/Collection;)V

    .line 265
    iget-object v5, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v5}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 269
    iget-object v5, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v5}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getInputFormat()I

    move-result v5

    const/16 v6, 0x100

    if-ne v5, v6, :cond_1

    .line 270
    sget-object v5, Landroidx/camera/core/imagecapture/ImagePipeline;->EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    invoke-virtual {v5}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;->isRotationOptionSupported()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 271
    sget-object v5, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    .line 272
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getRotationDegrees()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 271
    invoke-virtual {v4, v5, v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 274
    :cond_0
    sget-object v5, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    .line 275
    invoke-virtual {p0, p2}, Landroidx/camera/core/imagecapture/ImagePipeline;->getCameraRequestJpegQuality(Landroidx/camera/core/imagecapture/TakePictureRequest;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 274
    invoke-virtual {v4, v5, v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 279
    :cond_1
    nop

    .line 280
    invoke-interface {v3}, Landroidx/camera/core/impl/CaptureStage;->getCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    .line 279
    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 283
    invoke-interface {v3}, Landroidx/camera/core/impl/CaptureStage;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)V

    .line 284
    iget-object v5, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v5}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 285
    invoke-virtual {v4}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    .end local v3    # "captureStage":Landroidx/camera/core/impl/CaptureStage;
    .end local v4    # "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    goto/16 :goto_0

    .line 288
    :cond_2
    new-instance v2, Landroidx/camera/core/imagecapture/CameraRequest;

    invoke-direct {v2, v0, p3}, Landroidx/camera/core/imagecapture/CameraRequest;-><init>(Ljava/util/List;Landroidx/camera/core/imagecapture/TakePictureCallback;)V

    return-object v2
.end method

.method private createCaptureBundle()Landroidx/camera/core/impl/CaptureBundle;
    .locals 2

    .line 231
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    invoke-static {}, Landroidx/camera/core/CaptureBundles;->singleDefaultCaptureBundle()Landroidx/camera/core/impl/CaptureBundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageCaptureConfig;->getCaptureBundle(Landroidx/camera/core/impl/CaptureBundle;)Landroidx/camera/core/impl/CaptureBundle;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CaptureBundle;

    return-object v0
.end method

.method private createProcessingRequest(Landroidx/camera/core/impl/CaptureBundle;Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureCallback;Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/imagecapture/ProcessingRequest;
    .locals 9
    .param p1, "captureBundle"    # Landroidx/camera/core/impl/CaptureBundle;
    .param p2, "takePictureRequest"    # Landroidx/camera/core/imagecapture/TakePictureRequest;
    .param p3, "takePictureCallback"    # Landroidx/camera/core/imagecapture/TakePictureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CaptureBundle;",
            "Landroidx/camera/core/imagecapture/TakePictureRequest;",
            "Landroidx/camera/core/imagecapture/TakePictureCallback;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;)",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;"
        }
    .end annotation

    .line 240
    .local p4, "captureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v0, Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 242
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v2

    .line 243
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    .line 244
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getRotationDegrees()I

    move-result v4

    .line 245
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getJpegQuality()I

    move-result v5

    .line 246
    invoke-virtual {p2}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v6

    move-object v1, p1

    move-object v7, p3

    move-object v8, p4

    .end local p1    # "captureBundle":Landroidx/camera/core/impl/CaptureBundle;
    .end local p3    # "takePictureCallback":Landroidx/camera/core/imagecapture/TakePictureCallback;
    .end local p4    # "captureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    .local v1, "captureBundle":Landroidx/camera/core/impl/CaptureBundle;
    .local v7, "takePictureCallback":Landroidx/camera/core/imagecapture/TakePictureCallback;
    .local v8, "captureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    invoke-direct/range {v0 .. v8}, Landroidx/camera/core/imagecapture/ProcessingRequest;-><init>(Landroidx/camera/core/impl/CaptureBundle;Landroidx/camera/core/ImageCapture$OutputFileOptions;Landroid/graphics/Rect;IILandroid/graphics/Matrix;Landroidx/camera/core/imagecapture/TakePictureCallback;Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 240
    return-object v0
.end method

.method private getOutputFormat()I
    .locals 3

    .line 220
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_BUFFER_FORMAT:Landroidx/camera/core/impl/Config$Option;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/ImageCaptureConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 222
    .local v0, "bufferFormat":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 226
    :cond_0
    const/16 v1, 0x100

    return v1
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 145
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 146
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/CaptureNode;->release()V

    .line 147
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mBundlingNode:Landroidx/camera/core/imagecapture/SingleBundlingNode;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/SingleBundlingNode;->release()V

    .line 148
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mProcessingNode:Landroidx/camera/core/imagecapture/ProcessingNode;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingNode;->release()V

    .line 149
    return-void
.end method

.method createRequests(Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureCallback;Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/core/util/Pair;
    .locals 4
    .param p1, "takePictureRequest"    # Landroidx/camera/core/imagecapture/TakePictureRequest;
    .param p2, "takePictureCallback"    # Landroidx/camera/core/imagecapture/TakePictureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/TakePictureRequest;",
            "Landroidx/camera/core/imagecapture/TakePictureCallback;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;)",
            "Landroidx/core/util/Pair<",
            "Landroidx/camera/core/imagecapture/CameraRequest;",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            ">;"
        }
    .end annotation

    .line 191
    .local p3, "captureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 192
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/ImagePipeline;->createCaptureBundle()Landroidx/camera/core/impl/CaptureBundle;

    move-result-object v0

    .line 193
    .local v0, "captureBundle":Landroidx/camera/core/impl/CaptureBundle;
    new-instance v1, Landroidx/core/util/Pair;

    .line 194
    invoke-direct {p0, v0, p1, p2}, Landroidx/camera/core/imagecapture/ImagePipeline;->createCameraRequest(Landroidx/camera/core/impl/CaptureBundle;Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureCallback;)Landroidx/camera/core/imagecapture/CameraRequest;

    move-result-object v2

    .line 198
    invoke-direct {p0, v0, p1, p2, p3}, Landroidx/camera/core/imagecapture/ImagePipeline;->createProcessingRequest(Landroidx/camera/core/impl/CaptureBundle;Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureCallback;Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroidx/core/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 193
    return-object v1
.end method

.method public createSessionConfigBuilder(Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 2
    .param p1, "resolution"    # Landroid/util/Size;

    .line 131
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mUseCaseConfig:Landroidx/camera/core/impl/ImageCaptureConfig;

    invoke-static {v0, p1}, Landroidx/camera/core/impl/SessionConfig$Builder;->createFrom(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    .line 133
    .local v0, "builder":Landroidx/camera/core/impl/SessionConfig$Builder;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addNonRepeatingSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 134
    return-object v0
.end method

.method public expectsMetadata()Z
    .locals 1

    .line 335
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/CaptureNode;->getSafeCloseImageReaderProxy()Landroidx/camera/core/SafeCloseImageReaderProxy;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getImageReaderProxy()Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v0

    instance-of v0, v0, Landroidx/camera/core/MetadataImageReader;

    return v0
.end method

.method getCameraRequestJpegQuality(Landroidx/camera/core/imagecapture/TakePictureRequest;)I
    .locals 3
    .param p1, "request"    # Landroidx/camera/core/imagecapture/TakePictureRequest;

    .line 300
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getOnDiskCallback()Landroidx/camera/core/ImageCapture$OnImageSavedCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 301
    .local v0, "isOnDisk":Z
    :goto_0
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getCropRect()Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSize()Landroid/util/Size;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/impl/utils/TransformUtils;->hasCropping(Landroid/graphics/Rect;Landroid/util/Size;)Z

    move-result v1

    .line 302
    .local v1, "hasCropping":Z
    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 306
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getCaptureMode()I

    move-result v2

    if-nez v2, :cond_1

    .line 309
    const/16 v2, 0x64

    return v2

    .line 311
    :cond_1
    const/16 v2, 0x5f

    return v2

    .line 314
    :cond_2
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->getJpegQuality()I

    move-result v2

    return v2
.end method

.method public getCapacity()I
    .locals 1

    .line 156
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 157
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/CaptureNode;->getCapacity()I

    move-result v0

    return v0
.end method

.method getCaptureNode()Landroidx/camera/core/imagecapture/CaptureNode;
    .locals 1

    .line 320
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    return-object v0
.end method

.method getProcessingNode()Landroidx/camera/core/imagecapture/ProcessingNode;
    .locals 1

    .line 326
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mProcessingNode:Landroidx/camera/core/imagecapture/ProcessingNode;

    return-object v0
.end method

.method notifyCaptureError(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1
    .param p1, "e"    # Landroidx/camera/core/ImageCaptureException;

    .line 213
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 214
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getErrorEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    .line 215
    return-void
.end method

.method public setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;

    .line 168
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 169
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mCaptureNode:Landroidx/camera/core/imagecapture/CaptureNode;

    invoke-virtual {v0, p1}, Landroidx/camera/core/imagecapture/CaptureNode;->setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 170
    return-void
.end method

.method submitProcessingRequest(Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 1
    .param p1, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 207
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 208
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ImagePipeline;->mPipelineIn:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getRequestEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    .line 209
    return-void
.end method
