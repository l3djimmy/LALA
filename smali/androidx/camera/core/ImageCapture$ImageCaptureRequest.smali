.class Landroidx/camera/core/ImageCapture$ImageCaptureRequest;
.super Ljava/lang/Object;
.source "ImageCapture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/ImageCapture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImageCaptureRequest"
.end annotation


# instance fields
.field private final mCallback:Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

.field mDispatched:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final mJpegQuality:I

.field private final mListenerExecutor:Ljava/util/concurrent/Executor;

.field final mRotationDegrees:I

.field private final mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

.field private final mTargetRatio:Landroid/util/Rational;

.field private final mViewPortCropRect:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(IILandroid/util/Rational;Landroid/graphics/Rect;Landroid/graphics/Matrix;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V
    .locals 4
    .param p1, "rotationDegrees"    # I
    .param p2, "jpegQuality"    # I
    .param p3, "targetRatio"    # Landroid/util/Rational;
    .param p4, "viewPortCropRect"    # Landroid/graphics/Rect;
    .param p5, "sensorToBufferTransformMatrix"    # Landroid/graphics/Matrix;
    .param p6, "executor"    # Ljava/util/concurrent/Executor;
    .param p7, "callback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    .line 1719
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1689
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mDispatched:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 1720
    iput p1, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mRotationDegrees:I

    .line 1721
    iput p2, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mJpegQuality:I

    .line 1722
    if-eqz p3, :cond_1

    .line 1723
    invoke-virtual {p3}, Landroid/util/Rational;->isZero()Z

    move-result v0

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    const-string/jumbo v3, "Target ratio cannot be zero"

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1724
    invoke-virtual {p3}, Landroid/util/Rational;->floatValue()F

    move-result v0

    const/4 v3, 0x0

    cmpl-float v0, v0, v3

    if-lez v0, :cond_0

    move v1, v2

    :cond_0
    const-string/jumbo v0, "Target ratio must be positive"

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1727
    :cond_1
    iput-object p3, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mTargetRatio:Landroid/util/Rational;

    .line 1728
    iput-object p4, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mViewPortCropRect:Landroid/graphics/Rect;

    .line 1729
    iput-object p5, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 1730
    iput-object p6, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mListenerExecutor:Ljava/util/concurrent/Executor;

    .line 1731
    iput-object p7, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mCallback:Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    .line 1732
    return-void
.end method


# virtual methods
.method dispatchImage(Landroidx/camera/core/ImageProxy;)V
    .locals 8
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;

    .line 1736
    iget-object v0, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mDispatched:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1737
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 1738
    return-void

    .line 1746
    :cond_0
    sget-object v0, Landroidx/camera/core/ImageCapture;->EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    invoke-virtual {v0, p1}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;->shouldUseExifOrientation(Landroidx/camera/core/ImageProxy;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1749
    :try_start_0
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    .line 1750
    .local v0, "planes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    aget-object v1, v0, v1

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1753
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 1755
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    new-array v3, v3, [B

    .line 1756
    .local v3, "data":[B
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1757
    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v4}, Landroidx/camera/core/impl/utils/Exif;->createFromInputStream(Ljava/io/InputStream;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v4

    .line 1758
    .local v4, "exif":Landroidx/camera/core/impl/utils/Exif;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 1760
    new-instance v5, Landroid/util/Size;

    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/Exif;->getWidth()I

    move-result v6

    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/Exif;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Size;-><init>(II)V

    .line 1761
    .local v5, "dispatchResolution":Landroid/util/Size;
    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1766
    .end local v0    # "planes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    .end local v1    # "buffer":Ljava/nio/ByteBuffer;
    .end local v3    # "data":[B
    .end local v4    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .local v2, "dispatchRotationDegrees":I
    goto :goto_0

    .line 1762
    .end local v2    # "dispatchRotationDegrees":I
    .end local v5    # "dispatchResolution":Landroid/util/Size;
    :catch_0
    move-exception v0

    .line 1763
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "Unable to parse JPEG exif"

    invoke-virtual {p0, v2, v1, v0}, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->notifyCallbackError(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 1764
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 1765
    return-void

    .line 1769
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    new-instance v0, Landroid/util/Size;

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v1

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    move-object v5, v0

    .line 1770
    .restart local v5    # "dispatchResolution":Landroid/util/Size;
    iget v2, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mRotationDegrees:I

    .line 1774
    .restart local v2    # "dispatchRotationDegrees":I
    :goto_0
    nop

    .line 1775
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    .line 1776
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/ImageInfo;->getTimestamp()J

    move-result-wide v3

    iget-object v1, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mSensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 1774
    invoke-static {v0, v3, v4, v2, v1}, Landroidx/camera/core/ImmutableImageInfo;->create(Landroidx/camera/core/impl/TagBundle;JILandroid/graphics/Matrix;)Landroidx/camera/core/ImageInfo;

    move-result-object v0

    .line 1780
    .local v0, "imageInfo":Landroidx/camera/core/ImageInfo;
    new-instance v1, Landroidx/camera/core/SettableImageProxy;

    invoke-direct {v1, p1, v5, v0}, Landroidx/camera/core/SettableImageProxy;-><init>(Landroidx/camera/core/ImageProxy;Landroid/util/Size;Landroidx/camera/core/ImageInfo;)V

    .line 1785
    .local v1, "dispatchedImageProxy":Landroidx/camera/core/ImageProxy;
    iget-object v3, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mViewPortCropRect:Landroid/graphics/Rect;

    iget-object v4, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mTargetRatio:Landroid/util/Rational;

    iget v6, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mRotationDegrees:I

    invoke-static {v3, v4, v6, v5, v2}, Landroidx/camera/core/ImageCapture;->computeDispatchCropRect(Landroid/graphics/Rect;Landroid/util/Rational;ILandroid/util/Size;I)Landroid/graphics/Rect;

    move-result-object v3

    .line 1787
    .local v3, "cropRect":Landroid/graphics/Rect;
    invoke-interface {v1, v3}, Landroidx/camera/core/ImageProxy;->setCropRect(Landroid/graphics/Rect;)V

    .line 1790
    :try_start_1
    iget-object v4, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mListenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v6, Landroidx/camera/core/ImageCapture$ImageCaptureRequest$$ExternalSyntheticLambda1;

    invoke-direct {v6, p0, v1}, Landroidx/camera/core/ImageCapture$ImageCaptureRequest$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageCapture$ImageCaptureRequest;Landroidx/camera/core/ImageProxy;)V

    invoke-interface {v4, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1796
    goto :goto_1

    .line 1791
    :catch_1
    move-exception v4

    .line 1792
    .local v4, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v6, "ImageCapture"

    const-string/jumbo v7, "Unable to post to the supplied executor."

    invoke-static {v6, v7}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1795
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 1797
    .end local v4    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_1
    return-void
.end method

.method synthetic lambda$dispatchImage$0$androidx-camera-core-ImageCapture$ImageCaptureRequest(Landroidx/camera/core/ImageProxy;)V
    .locals 1
    .param p1, "dispatchedImageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 1790
    iget-object v0, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mCallback:Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;->onCaptureSuccess(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method synthetic lambda$notifyCallbackError$1$androidx-camera-core-ImageCapture$ImageCaptureRequest(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "imageCaptureError"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 1807
    iget-object v0, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mCallback:Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    invoke-direct {v1, p1, p2, p3}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;->onError(Landroidx/camera/core/ImageCaptureException;)V

    return-void
.end method

.method notifyCallbackError(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "imageCaptureError"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 1802
    iget-object v0, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mDispatched:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1803
    return-void

    .line 1807
    :cond_0
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/ImageCapture$ImageCaptureRequest;->mListenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/ImageCapture$ImageCaptureRequest$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/camera/core/ImageCapture$ImageCaptureRequest$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageCapture$ImageCaptureRequest;ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1811
    goto :goto_0

    .line 1809
    :catch_0
    move-exception v0

    .line 1810
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v1, "ImageCapture"

    const-string/jumbo v2, "Unable to post to the supplied executor."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1812
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method
