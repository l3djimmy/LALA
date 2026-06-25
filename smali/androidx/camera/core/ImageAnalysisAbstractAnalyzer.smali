.class abstract Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;
.super Ljava/lang/Object;
.source "ImageAnalysisAbstractAnalyzer.java"

# interfaces
.implements Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageAnalysisAnalyzer"


# instance fields
.field private final mAnalyzerLock:Ljava/lang/Object;

.field protected mIsAttached:Z

.field private volatile mOnePixelShiftEnabled:Z

.field private mOriginalSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

.field private mOriginalViewPortCropRect:Landroid/graphics/Rect;

.field private volatile mOutputImageFormat:I

.field private volatile mOutputImageRotationEnabled:Z

.field private volatile mPrevBufferRotationDegrees:I

.field private mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

.field private mProcessedImageWriter:Landroid/media/ImageWriter;

.field mRGBConvertedBuffer:Ljava/nio/ByteBuffer;

.field private volatile mRelativeRotation:I

.field private mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

.field mURotatedBuffer:Ljava/nio/ByteBuffer;

.field private mUpdatedSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

.field private mUpdatedViewPortCropRect:Landroid/graphics/Rect;

.field private mUserExecutor:Ljava/util/concurrent/Executor;

.field mVRotatedBuffer:Ljava/nio/ByteBuffer;

.field mYRotatedBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, 0x1

    iput v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    .line 91
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalViewPortCropRect:Landroid/graphics/Rect;

    .line 94
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedViewPortCropRect:Landroid/graphics/Rect;

    .line 97
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 100
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 120
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    .line 123
    iput-boolean v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mIsAttached:Z

    return-void
.end method

.method private createHelperBuffer(Landroidx/camera/core/ImageProxy;)V
    .locals 3
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 390
    iget v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 391
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mYRotatedBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 392
    nop

    .line 393
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    .line 392
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mYRotatedBuffer:Ljava/nio/ByteBuffer;

    .line 395
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mYRotatedBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 397
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mURotatedBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_1

    .line 398
    nop

    .line 399
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v2

    mul-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x4

    .line 398
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mURotatedBuffer:Ljava/nio/ByteBuffer;

    .line 401
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mURotatedBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 403
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mVRotatedBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_2

    .line 404
    nop

    .line 405
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v2

    mul-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x4

    .line 404
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mVRotatedBuffer:Ljava/nio/ByteBuffer;

    .line 407
    :cond_2
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mVRotatedBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    .line 408
    :cond_3
    iget v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 409
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRGBConvertedBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_4

    .line 410
    nop

    .line 411
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    .line 410
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRGBConvertedBuffer:Ljava/nio/ByteBuffer;

    .line 414
    :cond_4
    :goto_0
    return-void
.end method

.method private static createImageReaderProxy(IIIII)Landroidx/camera/core/SafeCloseImageReaderProxy;
    .locals 5
    .param p0, "imageWidth"    # I
    .param p1, "imageHeight"    # I
    .param p2, "rotation"    # I
    .param p3, "format"    # I
    .param p4, "maxImages"    # I

    .line 310
    const/16 v0, 0x5a

    if-eq p2, v0, :cond_1

    const/16 v0, 0x10e

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 311
    .local v0, "flipWH":Z
    :goto_1
    if-eqz v0, :cond_2

    move v1, p1

    goto :goto_2

    :cond_2
    move v1, p0

    .line 312
    .local v1, "width":I
    :goto_2
    if-eqz v0, :cond_3

    move v2, p0

    goto :goto_3

    :cond_3
    move v2, p1

    .line 314
    .local v2, "height":I
    :goto_3
    new-instance v3, Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 315
    invoke-static {v1, v2, p3, p4}, Landroidx/camera/core/ImageReaderProxys;->createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v4

    invoke-direct {v3, v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 314
    return-object v3
.end method

.method static getAdditionalTransformMatrixAppliedByProcessor(IIIII)Landroid/graphics/Matrix;
    .locals 5
    .param p0, "originalWidth"    # I
    .param p1, "originalHeight"    # I
    .param p2, "rotatedWidth"    # I
    .param p3, "rotatedHeight"    # I
    .param p4, "relativeRotation"    # I

    .line 482
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 483
    .local v0, "matrix":Landroid/graphics/Matrix;
    if-lez p4, :cond_0

    .line 484
    new-instance v1, Landroid/graphics/RectF;

    int-to-float v2, p0

    int-to-float v3, p1

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v2, Landroidx/camera/core/impl/utils/TransformUtils;->NORMALIZED_RECT:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 488
    int-to-float v1, p4

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 489
    new-instance v1, Landroid/graphics/RectF;

    int-to-float v2, p2

    int-to-float v3, p3

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-static {v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getNormalizedToBuffer(Landroid/graphics/RectF;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 492
    :cond_0
    return-object v0
.end method

.method static getUpdatedCropRect(Landroid/graphics/Rect;Landroid/graphics/Matrix;)Landroid/graphics/Rect;
    .locals 2
    .param p0, "originalCropRect"    # Landroid/graphics/Rect;
    .param p1, "additionalTransformMatrix"    # Landroid/graphics/Matrix;

    .line 467
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 468
    .local v0, "rectF":Landroid/graphics/RectF;
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 469
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 470
    .local v1, "rect":Landroid/graphics/Rect;
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 471
    return-object v1
.end method

.method private recalculateTransformMatrixAndCropRect(IIII)V
    .locals 3
    .param p1, "originalWidth"    # I
    .param p2, "originalHeight"    # I
    .param p3, "rotatedWidth"    # I
    .param p4, "rotatedHeight"    # I

    .line 451
    iget v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRelativeRotation:I

    invoke-static {p1, p2, p3, p4, v0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->getAdditionalTransformMatrixAppliedByProcessor(IIIII)Landroid/graphics/Matrix;

    move-result-object v0

    .line 457
    .local v0, "additionalTransformMatrix":Landroid/graphics/Matrix;
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalViewPortCropRect:Landroid/graphics/Rect;

    invoke-static {v1, v0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->getUpdatedCropRect(Landroid/graphics/Rect;Landroid/graphics/Matrix;)Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedViewPortCropRect:Landroid/graphics/Rect;

    .line 459
    iget-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Matrix;->setConcat(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Z

    .line 461
    return-void
.end method

.method private recreateImageReaderProxy(Landroidx/camera/core/ImageProxy;I)V
    .locals 4
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p2, "relativeRotation"    # I

    .line 420
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-nez v0, :cond_0

    .line 421
    return-void

    .line 424
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->safeClose()V

    .line 425
    nop

    .line 426
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    .line 427
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 429
    invoke-virtual {v2}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getImageFormat()I

    move-result v2

    iget-object v3, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 430
    invoke-virtual {v3}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getMaxImages()I

    move-result v3

    .line 425
    invoke-static {v0, v1, p2, v2, v3}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->createImageReaderProxy(IIIII)Landroidx/camera/core/SafeCloseImageReaderProxy;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 432
    iget v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 435
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageWriter:Landroid/media/ImageWriter;

    if-eqz v0, :cond_1

    .line 436
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageWriter:Landroid/media/ImageWriter;

    invoke-static {v0}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->close(Landroid/media/ImageWriter;)V

    .line 439
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 440
    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 441
    invoke-virtual {v1}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getMaxImages()I

    move-result v1

    .line 439
    invoke-static {v0, v1}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageWriter:Landroid/media/ImageWriter;

    .line 443
    :cond_2
    return-void
.end method


# virtual methods
.method abstract acquireImage(Landroidx/camera/core/impl/ImageReaderProxy;)Landroidx/camera/core/ImageProxy;
.end method

.method analyzeImage(Landroidx/camera/core/ImageProxy;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 21
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/ImageProxy;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 179
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-boolean v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageRotationEnabled:Z

    if-eqz v0, :cond_0

    iget v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRelativeRotation:I

    move v8, v0

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    .line 182
    .local v8, "currentBufferRotationDegrees":I
    :goto_0
    iget-object v3, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    monitor-enter v3

    .line 183
    :try_start_0
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUserExecutor:Ljava/util/concurrent/Executor;

    move-object v10, v0

    .line 184
    .local v10, "executor":Ljava/util/concurrent/Executor;
    iget-object v7, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    move-object v11, v7

    .line 188
    .local v11, "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    iget-boolean v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageRotationEnabled:Z

    const/4 v12, 0x1

    if-eqz v0, :cond_1

    iget v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mPrevBufferRotationDegrees:I

    if-eq v8, v0, :cond_1

    move v0, v12

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    move v13, v0

    .line 193
    .local v13, "outputImageDirty":Z
    if-eqz v13, :cond_2

    .line 194
    invoke-direct {v1, v2, v8}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->recreateImageReaderProxy(Landroidx/camera/core/ImageProxy;I)V

    .line 198
    :cond_2
    iget-boolean v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageRotationEnabled:Z

    if-eqz v0, :cond_3

    .line 199
    invoke-direct/range {p0 .. p1}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->createHelperBuffer(Landroidx/camera/core/ImageProxy;)V

    .line 202
    :cond_3
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    move-object v4, v0

    .line 203
    .local v4, "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageWriter:Landroid/media/ImageWriter;

    move-object v5, v0

    .line 204
    .local v5, "processedImageWriter":Landroid/media/ImageWriter;
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRGBConvertedBuffer:Ljava/nio/ByteBuffer;

    move-object v14, v0

    .line 205
    .local v14, "rgbConvertedBuffer":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mYRotatedBuffer:Ljava/nio/ByteBuffer;

    move-object v6, v0

    .line 206
    .local v6, "yRotatedBuffer":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mURotatedBuffer:Ljava/nio/ByteBuffer;

    move-object v7, v0

    .line 207
    .local v7, "uRotatedBuffer":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mVRotatedBuffer:Ljava/nio/ByteBuffer;

    move-object v15, v0

    .line 208
    .local v15, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 212
    if-eqz v11, :cond_c

    if-eqz v10, :cond_c

    iget-boolean v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mIsAttached:Z

    if-eqz v0, :cond_c

    .line 213
    const/4 v0, 0x0

    .line 215
    .local v0, "processedImageProxy":Landroidx/camera/core/ImageProxy;
    if-eqz v4, :cond_8

    .line 216
    iget v3, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    const/4 v9, 0x2

    if-ne v3, v9, :cond_4

    .line 217
    iget-boolean v3, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOnePixelShiftEnabled:Z

    .line 218
    invoke-static {v2, v4, v14, v8, v3}, Landroidx/camera/core/ImageProcessingUtil;->convertYUVToRGB(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/ImageReaderProxy;Ljava/nio/ByteBuffer;IZ)Landroidx/camera/core/ImageProxy;

    move-result-object v0

    move-object/from16 v20, v0

    move-object v9, v4

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v15

    move-object v15, v5

    goto :goto_3

    .line 224
    :cond_4
    iget v3, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    if-ne v3, v12, :cond_7

    .line 226
    iget-boolean v3, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOnePixelShiftEnabled:Z

    if-eqz v3, :cond_5

    .line 227
    invoke-static {v2}, Landroidx/camera/core/ImageProcessingUtil;->applyPixelShiftForYUV(Landroidx/camera/core/ImageProxy;)Z

    .line 229
    :cond_5
    if-eqz v5, :cond_6

    if-eqz v6, :cond_6

    if-eqz v7, :cond_6

    if-eqz v15, :cond_6

    .line 233
    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v15

    .end local v15    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v3, "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v4, "processedImageWriter":Landroid/media/ImageWriter;
    .local v5, "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v6, "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v7, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    invoke-static/range {v2 .. v8}, Landroidx/camera/core/ImageProcessingUtil;->rotateYUV(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/ImageReaderProxy;Landroid/media/ImageWriter;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Landroidx/camera/core/ImageProxy;

    move-result-object v0

    move-object v9, v3

    move-object v15, v4

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v19, v7

    move-object/from16 v20, v0

    .end local v3    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v4    # "processedImageWriter":Landroid/media/ImageWriter;
    .end local v5    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v6    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v7    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v9, "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v15, "processedImageWriter":Landroid/media/ImageWriter;
    .local v17, "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v18, "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v19, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    goto :goto_3

    .line 229
    .end local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v4, "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v5, "processedImageWriter":Landroid/media/ImageWriter;
    .local v6, "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v7, "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v15, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    :cond_6
    move-object v9, v4

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v15

    move-object v15, v5

    .end local v4    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v5    # "processedImageWriter":Landroid/media/ImageWriter;
    .end local v6    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v7    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v15, "processedImageWriter":Landroid/media/ImageWriter;
    .restart local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    goto :goto_2

    .line 224
    .end local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v4    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .restart local v5    # "processedImageWriter":Landroid/media/ImageWriter;
    .restart local v6    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v7    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v15, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    :cond_7
    move-object v9, v4

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v15

    move-object v15, v5

    .end local v4    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v5    # "processedImageWriter":Landroid/media/ImageWriter;
    .end local v6    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v7    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v15, "processedImageWriter":Landroid/media/ImageWriter;
    .restart local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    goto :goto_2

    .line 215
    .end local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v4    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .restart local v5    # "processedImageWriter":Landroid/media/ImageWriter;
    .restart local v6    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v7    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v15, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    :cond_8
    move-object v9, v4

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v15

    move-object v15, v5

    .line 247
    .end local v4    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v5    # "processedImageWriter":Landroid/media/ImageWriter;
    .end local v6    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v7    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v15, "processedImageWriter":Landroid/media/ImageWriter;
    .restart local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    :goto_2
    move-object/from16 v20, v0

    .end local v0    # "processedImageProxy":Landroidx/camera/core/ImageProxy;
    .local v20, "processedImageProxy":Landroidx/camera/core/ImageProxy;
    :goto_3
    if-nez v20, :cond_9

    move/from16 v16, v12

    goto :goto_4

    :cond_9
    const/16 v16, 0x0

    .line 248
    .local v16, "outputProcessedImageFailed":Z
    :goto_4
    if-eqz v16, :cond_a

    move-object/from16 v5, p1

    goto :goto_5

    .line 249
    :cond_a
    move-object/from16 v5, v20

    :goto_5
    nop

    .line 253
    .local v5, "outputImageProxy":Landroidx/camera/core/ImageProxy;
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 254
    .local v6, "cropRect":Landroid/graphics/Rect;
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 255
    .local v4, "transformMatrix":Landroid/graphics/Matrix;
    iget-object v2, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    monitor-enter v2

    .line 256
    if-eqz v13, :cond_b

    if-nez v16, :cond_b

    .line 257
    nop

    .line 258
    :try_start_1
    invoke-interface/range {p1 .. p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    .line 259
    invoke-interface/range {p1 .. p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v3

    .line 260
    invoke-interface {v5}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v7

    .line 261
    invoke-interface {v5}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v12

    .line 257
    invoke-direct {v1, v0, v3, v7, v12}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->recalculateTransformMatrixAndCropRect(IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_6

    .line 267
    :catchall_0
    move-exception v0

    move-object v1, v10

    move-object v7, v11

    goto :goto_7

    .line 263
    :cond_b
    :goto_6
    :try_start_2
    iput v8, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mPrevBufferRotationDegrees:I

    .line 265
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedViewPortCropRect:Landroid/graphics/Rect;

    invoke-virtual {v6, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 266
    iget-object v0, v1, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 267
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 270
    new-instance v0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;

    move-object/from16 v3, p1

    move-object v2, v10

    move-object v7, v11

    .end local v10    # "executor":Ljava/util/concurrent/Executor;
    .end local v11    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .local v2, "executor":Ljava/util/concurrent/Executor;
    .local v7, "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    invoke-direct/range {v0 .. v7}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    move-object v1, v2

    .end local v2    # "executor":Ljava/util/concurrent/Executor;
    .local v1, "executor":Ljava/util/concurrent/Executor;
    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 295
    .end local v4    # "transformMatrix":Landroid/graphics/Matrix;
    .end local v5    # "outputImageProxy":Landroidx/camera/core/ImageProxy;
    .end local v6    # "cropRect":Landroid/graphics/Rect;
    .end local v16    # "outputProcessedImageFailed":Z
    .end local v20    # "processedImageProxy":Landroidx/camera/core/ImageProxy;
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    goto :goto_8

    .line 267
    .end local v0    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    .end local v1    # "executor":Ljava/util/concurrent/Executor;
    .end local v7    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .restart local v4    # "transformMatrix":Landroid/graphics/Matrix;
    .restart local v5    # "outputImageProxy":Landroidx/camera/core/ImageProxy;
    .restart local v6    # "cropRect":Landroid/graphics/Rect;
    .restart local v10    # "executor":Ljava/util/concurrent/Executor;
    .restart local v11    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .restart local v16    # "outputProcessedImageFailed":Z
    .restart local v20    # "processedImageProxy":Landroidx/camera/core/ImageProxy;
    :catchall_1
    move-exception v0

    move-object v1, v10

    move-object v7, v11

    .end local v10    # "executor":Ljava/util/concurrent/Executor;
    .end local v11    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .restart local v1    # "executor":Ljava/util/concurrent/Executor;
    .restart local v7    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    :goto_7
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_7

    .line 212
    .end local v1    # "executor":Ljava/util/concurrent/Executor;
    .end local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v16    # "outputProcessedImageFailed":Z
    .end local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v20    # "processedImageProxy":Landroidx/camera/core/ImageProxy;
    .local v4, "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v5, "processedImageWriter":Landroid/media/ImageWriter;
    .local v6, "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v7, "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v10    # "executor":Ljava/util/concurrent/Executor;
    .restart local v11    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .local v15, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    :cond_c
    move-object v9, v4

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object v1, v10

    move-object v7, v11

    move-object/from16 v19, v15

    move-object v15, v5

    .line 296
    .end local v4    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v5    # "processedImageWriter":Landroid/media/ImageWriter;
    .end local v6    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v10    # "executor":Ljava/util/concurrent/Executor;
    .end local v11    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .restart local v1    # "executor":Ljava/util/concurrent/Executor;
    .local v7, "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .restart local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .local v15, "processedImageWriter":Landroid/media/ImageWriter;
    .restart local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    new-instance v0, Landroidx/core/os/OperationCanceledException;

    const-string v2, "No analyzer or executor currently set."

    invoke-direct {v0, v2}, Landroidx/core/os/OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 300
    .restart local v0    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    :goto_8
    return-object v0

    .line 208
    .end local v0    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    .end local v1    # "executor":Ljava/util/concurrent/Executor;
    .end local v7    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .end local v9    # "processedImageReaderProxy":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local v13    # "outputImageDirty":Z
    .end local v14    # "rgbConvertedBuffer":Ljava/nio/ByteBuffer;
    .end local v15    # "processedImageWriter":Landroid/media/ImageWriter;
    .end local v17    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v18    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v19    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    :catchall_3
    move-exception v0

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    throw v0
.end method

.method attach()V
    .locals 1

    .line 377
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mIsAttached:Z

    .line 378
    return-void
.end method

.method abstract clearCache()V
.end method

.method detach()V
    .locals 1

    .line 384
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mIsAttached:Z

    .line 385
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->clearCache()V

    .line 386
    return-void
.end method

.method synthetic lambda$analyzeImage$0$androidx-camera-core-ImageAnalysisAbstractAnalyzer(Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 4
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p2, "transformMatrix"    # Landroid/graphics/Matrix;
    .param p3, "outputImageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p4, "cropRect"    # Landroid/graphics/Rect;
    .param p5, "analyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;
    .param p6, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 273
    iget-boolean v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mIsAttached:Z

    if-eqz v0, :cond_2

    .line 274
    nop

    .line 275
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    .line 276
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/ImageInfo;->getTimestamp()J

    move-result-wide v1

    .line 277
    iget-boolean v3, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageRotationEnabled:Z

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    .line 278
    :cond_0
    iget v3, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRelativeRotation:I

    .line 274
    :goto_0
    invoke-static {v0, v1, v2, v3, p2}, Landroidx/camera/core/ImmutableImageInfo;->create(Landroidx/camera/core/impl/TagBundle;JILandroid/graphics/Matrix;)Landroidx/camera/core/ImageInfo;

    move-result-object v0

    .line 281
    .local v0, "imageInfo":Landroidx/camera/core/ImageInfo;
    new-instance v1, Landroidx/camera/core/SettableImageProxy;

    invoke-direct {v1, p3, v0}, Landroidx/camera/core/SettableImageProxy;-><init>(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageInfo;)V

    .line 283
    .local v1, "outputSettableImageProxy":Landroidx/camera/core/ImageProxy;
    invoke-virtual {p4}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 284
    invoke-interface {v1, p4}, Landroidx/camera/core/ImageProxy;->setCropRect(Landroid/graphics/Rect;)V

    .line 286
    :cond_1
    invoke-interface {p5, v1}, Landroidx/camera/core/ImageAnalysis$Analyzer;->analyze(Landroidx/camera/core/ImageProxy;)V

    .line 287
    const/4 v2, 0x0

    invoke-virtual {p6, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 288
    .end local v0    # "imageInfo":Landroidx/camera/core/ImageInfo;
    .end local v1    # "outputSettableImageProxy":Landroidx/camera/core/ImageProxy;
    goto :goto_1

    .line 289
    :cond_2
    new-instance v0, Landroidx/core/os/OperationCanceledException;

    const-string v1, "ImageAnalysis is detached"

    invoke-direct {v0, v1}, Landroidx/core/os/OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p6, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 292
    :goto_1
    return-void
.end method

.method synthetic lambda$analyzeImage$1$androidx-camera-core-ImageAnalysisAbstractAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 8
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p3, "transformMatrix"    # Landroid/graphics/Matrix;
    .param p4, "outputImageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p5, "cropRect"    # Landroid/graphics/Rect;
    .param p6, "analyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;
    .param p7, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 272
    new-instance v0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda0;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object v7, p7

    .end local p2    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .end local p3    # "transformMatrix":Landroid/graphics/Matrix;
    .end local p4    # "outputImageProxy":Landroidx/camera/core/ImageProxy;
    .end local p5    # "cropRect":Landroid/graphics/Rect;
    .end local p6    # "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .end local p7    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v2, "imageProxy":Landroidx/camera/core/ImageProxy;
    .local v3, "transformMatrix":Landroid/graphics/Matrix;
    .local v4, "outputImageProxy":Landroidx/camera/core/ImageProxy;
    .local v5, "cropRect":Landroid/graphics/Rect;
    .local v6, "analyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    .local v7, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    invoke-direct/range {v0 .. v7}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 293
    const-string/jumbo p2, "analyzeImage"

    return-object p2
.end method

.method public onImageAvailable(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 3
    .param p1, "imageReaderProxy"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 128
    :try_start_0
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->acquireImage(Landroidx/camera/core/impl/ImageReaderProxy;)Landroidx/camera/core/ImageProxy;

    move-result-object v0

    .line 129
    .local v0, "imageProxy":Landroidx/camera/core/ImageProxy;
    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->onValidImageAvailable(Landroidx/camera/core/ImageProxy;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .end local v0    # "imageProxy":Landroidx/camera/core/ImageProxy;
    :cond_0
    goto :goto_0

    .line 132
    :catch_0
    move-exception v0

    .line 138
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v1, "ImageAnalysisAnalyzer"

    const-string v2, "Failed to acquire image."

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 140
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_0
    return-void
.end method

.method abstract onValidImageAvailable(Landroidx/camera/core/ImageProxy;)V
.end method

.method setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 2
    .param p1, "userExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "subscribedAnalyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 364
    if-nez p2, :cond_0

    .line 365
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->clearCache()V

    .line 367
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 368
    :try_start_0
    iput-object p2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mSubscribedAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 369
    iput-object p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUserExecutor:Ljava/util/concurrent/Executor;

    .line 370
    monitor-exit v0

    .line 371
    return-void

    .line 370
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setOnePixelShiftEnabled(Z)V
    .locals 0
    .param p1, "onePixelShiftEnabled"    # Z

    .line 335
    iput-boolean p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOnePixelShiftEnabled:Z

    .line 336
    return-void
.end method

.method setOutputImageFormat(I)V
    .locals 0
    .param p1, "outputImageFormat"    # I

    .line 331
    iput p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageFormat:I

    .line 332
    return-void
.end method

.method setOutputImageRotationEnabled(Z)V
    .locals 0
    .param p1, "outputImageRotationEnabled"    # Z

    .line 327
    iput-boolean p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOutputImageRotationEnabled:Z

    .line 328
    return-void
.end method

.method setProcessedImageReaderProxy(Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 2
    .param p1, "processedImageReaderProxy"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 355
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 356
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mProcessedImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 357
    monitor-exit v0

    .line 359
    return-void

    .line 357
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setRelativeRotation(I)V
    .locals 0
    .param p1, "relativeRotation"    # I

    .line 323
    iput p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mRelativeRotation:I

    .line 324
    return-void
.end method

.method setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V
    .locals 3
    .param p1, "sensorToBufferTransformMatrix"    # Landroid/graphics/Matrix;

    .line 346
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 347
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 348
    new-instance v1, Landroid/graphics/Matrix;

    iget-object v2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 350
    monitor-exit v0

    .line 351
    return-void

    .line 350
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setViewPortCropRect(Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "viewPortCropRect"    # Landroid/graphics/Rect;

    .line 339
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mAnalyzerLock:Ljava/lang/Object;

    monitor-enter v0

    .line 340
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalViewPortCropRect:Landroid/graphics/Rect;

    .line 341
    new-instance v1, Landroid/graphics/Rect;

    iget-object v2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mOriginalViewPortCropRect:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->mUpdatedViewPortCropRect:Landroid/graphics/Rect;

    .line 342
    monitor-exit v0

    .line 343
    return-void

    .line 342
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
