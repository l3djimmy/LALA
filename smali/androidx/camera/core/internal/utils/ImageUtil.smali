.class public final Landroidx/camera/core/internal/utils/ImageUtil;
.super Ljava/lang/Object;
.source "ImageUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
    }
.end annotation


# static fields
.field public static final DEFAULT_RGBA_PIXEL_STRIDE:I = 0x4

.field private static final TAG:Ljava/lang/String; = "ImageUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method public static computeCropRectFromAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Landroid/graphics/Rect;
    .locals 12
    .param p0, "sourceSize"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 344
    invoke-static {p1}, Landroidx/camera/core/internal/utils/ImageUtil;->isAspectRatioValid(Landroid/util/Rational;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 345
    const-string v0, "ImageUtil"

    const-string v1, "Invalid view ratio."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    const/4 v0, 0x0

    return-object v0

    .line 349
    :cond_0
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    .line 350
    .local v0, "sourceWidth":I
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v1

    .line 351
    .local v1, "sourceHeight":I
    int-to-float v2, v0

    int-to-float v3, v1

    div-float/2addr v2, v3

    .line 352
    .local v2, "srcRatio":F
    const/4 v3, 0x0

    .line 353
    .local v3, "cropLeft":I
    const/4 v4, 0x0

    .line 354
    .local v4, "cropTop":I
    move v5, v0

    .line 355
    .local v5, "outputWidth":I
    move v6, v1

    .line 356
    .local v6, "outputHeight":I
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v7

    .line 357
    .local v7, "numerator":I
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v8

    .line 359
    .local v8, "denominator":I
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v9

    cmpl-float v9, v9, v2

    if-lez v9, :cond_1

    .line 360
    int-to-float v9, v0

    int-to-float v10, v7

    div-float/2addr v9, v10

    int-to-float v10, v8

    mul-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 361
    sub-int v9, v1, v6

    div-int/lit8 v4, v9, 0x2

    goto :goto_0

    .line 363
    :cond_1
    int-to-float v9, v1

    int-to-float v10, v8

    div-float/2addr v9, v10

    int-to-float v10, v7

    mul-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 364
    sub-int v9, v0, v5

    div-int/lit8 v3, v9, 0x2

    .line 367
    :goto_0
    new-instance v9, Landroid/graphics/Rect;

    add-int v10, v3, v5

    add-int v11, v4, v6

    invoke-direct {v9, v3, v4, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v9
.end method

.method public static computeCropRectFromDispatchInfo(Landroid/graphics/Rect;ILandroid/util/Size;I)Landroid/graphics/Rect;
    .locals 7
    .param p0, "surfaceCropRect"    # Landroid/graphics/Rect;
    .param p1, "surfaceToOutputDegrees"    # I
    .param p2, "dispatchResolution"    # Landroid/util/Size;
    .param p3, "dispatchToOutputDegrees"    # I

    .line 393
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 395
    .local v0, "matrix":Landroid/graphics/Matrix;
    sub-int v1, p3, p1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 398
    invoke-static {p2}, Landroidx/camera/core/internal/utils/ImageUtil;->sizeToVertexes(Landroid/util/Size;)[F

    move-result-object v1

    .line 399
    .local v1, "vertexes":[F
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 400
    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x2

    aget v3, v1, v3

    const/4 v4, 0x4

    aget v4, v1, v4

    const/4 v5, 0x6

    aget v5, v1, v5

    invoke-static {v2, v3, v4, v5}, Landroidx/camera/core/internal/utils/ImageUtil;->min(FFFF)F

    move-result v2

    .line 401
    .local v2, "left":F
    const/4 v3, 0x1

    aget v3, v1, v3

    const/4 v4, 0x3

    aget v4, v1, v4

    const/4 v5, 0x5

    aget v5, v1, v5

    const/4 v6, 0x7

    aget v6, v1, v6

    invoke-static {v3, v4, v5, v6}, Landroidx/camera/core/internal/utils/ImageUtil;->min(FFFF)F

    move-result v3

    .line 402
    .local v3, "top":F
    neg-float v4, v2

    neg-float v5, v3

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 404
    invoke-virtual {v0, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 407
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 408
    .local v4, "dispatchCropRectF":Landroid/graphics/RectF;
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 409
    invoke-virtual {v4}, Landroid/graphics/RectF;->sort()V

    .line 410
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 411
    .local v5, "dispatchCropRect":Landroid/graphics/Rect;
    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 412
    return-object v5
.end method

.method public static createBitmapFromImageProxy(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 78
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Incorrect image format of the input image proxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 88
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", only ImageFormat.YUV_420_888 and PixelFormat.RGBA_8888 are supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :sswitch_0
    invoke-static {p0}, Landroidx/camera/core/internal/utils/ImageUtil;->createBitmapFromJpegImage(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    .line 80
    :sswitch_1
    invoke-static {p0}, Landroidx/camera/core/ImageProcessingUtil;->convertYUVToBitmap(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    .line 84
    :sswitch_2
    invoke-static {p0}, Landroidx/camera/core/internal/utils/ImageUtil;->createBitmapFromRgbaImage(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x23 -> :sswitch_1
        0x100 -> :sswitch_0
    .end sparse-switch
.end method

.method private static createBitmapFromJpegImage(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 450
    invoke-static {p0}, Landroidx/camera/core/internal/utils/ImageUtil;->jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B

    move-result-object v0

    .line 451
    .local v0, "bytes":[B
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 452
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 455
    return-object v1

    .line 453
    :cond_0
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v3, "Decode jpeg byte array failed"

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static createBitmapFromPlane([Landroidx/camera/core/ImageProxy$PlaneProxy;II)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "planes"    # [Landroidx/camera/core/ImageProxy$PlaneProxy;
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 102
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v3, "Expect a single plane"

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 103
    aget-object v0, p0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v0

    const/4 v3, 0x4

    if-ne v0, v3, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    const-string v3, "Expect pixelStride=4"

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 105
    aget-object v0, p0, v1

    .line 106
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v0

    mul-int/lit8 v3, p1, 0x4

    if-ne v0, v3, :cond_2

    goto :goto_2

    :cond_2
    move v2, v1

    .line 105
    :goto_2
    const-string v0, "Expect rowStride=width*4"

    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 108
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 110
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    aget-object v2, p0, v1

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 111
    aget-object v2, p0, v1

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    aget-object v1, p0, v1

    .line 112
    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v1

    .line 111
    invoke-static {v0, v2, v1}, Landroidx/camera/core/ImageProcessingUtil;->copyByteBufferToBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;I)V

    .line 113
    return-object v0
.end method

.method private static createBitmapFromRgbaImage(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 437
    nop

    .line 438
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    .line 439
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 438
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 442
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 443
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 444
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v3

    aget-object v2, v3, v2

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v2

    .line 443
    invoke-static {v0, v1, v2}, Landroidx/camera/core/ImageProcessingUtil;->copyByteBufferToBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;I)V

    .line 445
    return-object v0
.end method

.method public static createDirectByteBuffer(Landroid/graphics/Bitmap;)Ljava/nio/ByteBuffer;
    .locals 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .line 121
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Only accept Bitmap with ARGB_8888 format for now."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 123
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 124
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    invoke-static {p0, v0, v1}, Landroidx/camera/core/ImageProcessingUtil;->copyBitmapToByteBuffer(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;I)V

    .line 125
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 126
    return-object v0
.end method

.method private static cropJpegByteArray([BLandroid/graphics/Rect;I)[B
    .locals 6
    .param p0, "data"    # [B
    .param p1, "cropRect"    # Landroid/graphics/Rect;
    .param p2, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
        }
    .end annotation

    .line 295
    const-string v0, "Decode byte array failed."

    :try_start_0
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v1, v2}, Landroid/graphics/BitmapRegionDecoder;->newInstance([BIIZ)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v1

    .line 297
    .local v1, "decoder":Landroid/graphics/BitmapRegionDecoder;
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    invoke-virtual {v1, p1, v2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 298
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    .end local v1    # "decoder":Landroid/graphics/BitmapRegionDecoder;
    nop

    .line 307
    if-eqz v2, :cond_1

    .line 312
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 313
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v2, v1, p2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v1

    .line 314
    .local v1, "success":Z
    if-eqz v1, :cond_0

    .line 318
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 320
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 315
    :cond_0
    new-instance v3, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;

    const-string v4, "Encode bitmap failed."

    sget-object v5, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;->ENCODE_FAILED:Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;

    invoke-direct {v3, v4, v5}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;-><init>(Ljava/lang/String;Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;)V

    throw v3

    .line 308
    .end local v0    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "success":Z
    :cond_1
    new-instance v1, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;

    sget-object v3, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;->DECODE_FAILED:Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;

    invoke-direct {v1, v0, v3}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;-><init>(Ljava/lang/String;Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;)V

    throw v1

    .line 302
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    :catch_0
    move-exception v1

    .line 303
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;

    sget-object v3, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;->DECODE_FAILED:Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;

    invoke-direct {v2, v0, v3}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;-><init>(Ljava/lang/String;Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;)V

    throw v2

    .line 299
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 300
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Decode byte array failed with illegal argument."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;->DECODE_FAILED:Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;

    invoke-direct {v1, v2, v3}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;-><init>(Ljava/lang/String;Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;)V

    throw v1
.end method

.method public static getRotatedAspectRatio(ILandroid/util/Rational;)Landroid/util/Rational;
    .locals 3
    .param p0, "rotationDegrees"    # I
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 152
    const/16 v0, 0x5a

    if-eq p0, v0, :cond_1

    const/16 v0, 0x10e

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 156
    :cond_0
    new-instance v0, Landroid/util/Rational;

    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    return-object v0

    .line 153
    :cond_1
    :goto_0
    invoke-static {p1}, Landroidx/camera/core/internal/utils/ImageUtil;->inverseRational(Landroid/util/Rational;)Landroid/util/Rational;

    move-result-object v0

    return-object v0
.end method

.method private static inverseRational(Landroid/util/Rational;)Landroid/util/Rational;
    .locals 3
    .param p0, "rational"    # Landroid/util/Rational;

    .line 427
    if-nez p0, :cond_0

    .line 428
    return-object p0

    .line 430
    :cond_0
    new-instance v0, Landroid/util/Rational;

    .line 431
    invoke-virtual {p0}, Landroid/util/Rational;->getDenominator()I

    move-result v1

    .line 432
    invoke-virtual {p0}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    .line 430
    return-object v0
.end method

.method public static isAspectRatioValid(Landroid/util/Rational;)Z
    .locals 2
    .param p0, "aspectRatio"    # Landroid/util/Rational;

    .line 325
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/util/Rational;->isNaN()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isAspectRatioValid(Landroid/util/Size;Landroid/util/Rational;)Z
    .locals 2
    .param p0, "sourceSize"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 331
    if-eqz p1, :cond_0

    .line 332
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 333
    invoke-static {p0, p1}, Landroidx/camera/core/internal/utils/ImageUtil;->isCropAspectRatioHasEffect(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    invoke-virtual {p1}, Landroid/util/Rational;->isNaN()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 331
    :goto_0
    return v0
.end method

.method private static isCropAspectRatioHasEffect(Landroid/util/Size;Landroid/util/Rational;)Z
    .locals 6
    .param p0, "sourceSize"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 417
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    .line 418
    .local v0, "sourceWidth":I
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v1

    .line 419
    .local v1, "sourceHeight":I
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    .line 420
    .local v2, "numerator":I
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    .line 422
    .local v3, "denominator":I
    int-to-float v4, v0

    int-to-float v5, v2

    div-float/2addr v4, v5

    int-to-float v5, v3

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    if-ne v1, v4, :cond_1

    int-to-float v4, v1

    int-to-float v5, v3

    div-float/2addr v4, v5

    int-to-float v5, v2

    mul-float/2addr v4, v5

    .line 423
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    if-eq v0, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v4, 0x1

    .line 422
    :goto_1
    return v4
.end method

.method public static jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B
    .locals 3
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;

    .line 164
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    .line 169
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    .line 170
    .local v0, "planes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 171
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    new-array v2, v2, [B

    .line 172
    .local v2, "data":[B
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 173
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 175
    return-object v2

    .line 165
    .end local v0    # "planes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    .end local v1    # "buffer":Ljava/nio/ByteBuffer;
    .end local v2    # "data":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Incorrect image format of the input image proxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 166
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;I)[B
    .locals 3
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;
    .param p1, "cropRect"    # Landroid/graphics/Rect;
    .param p2, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
        }
    .end annotation

    .line 186
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    .line 191
    invoke-static {p0}, Landroidx/camera/core/internal/utils/ImageUtil;->jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B

    move-result-object v0

    .line 192
    .local v0, "data":[B
    invoke-static {v0, p1, p2}, Landroidx/camera/core/internal/utils/ImageUtil;->cropJpegByteArray([BLandroid/graphics/Rect;I)[B

    move-result-object v0

    .line 194
    return-object v0

    .line 187
    .end local v0    # "data":[B
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Incorrect image format of the input image proxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 188
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static min(FFFF)F
    .locals 2
    .param p0, "value1"    # F
    .param p1, "value2"    # F
    .param p2, "value3"    # F
    .param p3, "value4"    # F

    .line 142
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p2, p3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static shouldCropImage(IIII)Z
    .locals 1
    .param p0, "sourceWidth"    # I
    .param p1, "sourceHeight"    # I
    .param p2, "cropRectWidth"    # I
    .param p3, "cropRectHeight"    # I

    .line 471
    if-ne p0, p2, :cond_1

    if-eq p1, p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static shouldCropImage(Landroidx/camera/core/ImageProxy;)Z
    .locals 4
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;

    .line 462
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v1

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    .line 463
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    .line 462
    invoke-static {v0, v1, v2, v3}, Landroidx/camera/core/internal/utils/ImageUtil;->shouldCropImage(IIII)Z

    move-result v0

    return v0
.end method

.method public static sizeToVertexes(Landroid/util/Size;)[F
    .locals 7
    .param p0, "size"    # Landroid/util/Size;

    .line 134
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    .line 135
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/16 v4, 0x8

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    const/4 v5, 0x1

    aput v6, v4, v5

    const/4 v5, 0x2

    aput v0, v4, v5

    const/4 v0, 0x3

    aput v6, v4, v0

    const/4 v0, 0x4

    aput v1, v4, v0

    const/4 v0, 0x5

    aput v2, v4, v0

    const/4 v0, 0x6

    aput v6, v4, v0

    const/4 v0, 0x7

    aput v3, v4, v0

    .line 134
    return-object v4
.end method

.method public static yuvImageToJpegByteArray(Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;II)[B
    .locals 8
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;
    .param p1, "cropRect"    # Landroid/graphics/Rect;
    .param p2, "jpegQuality"    # I
    .param p3, "rotationDegrees"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
        }
    .end annotation

    .line 209
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    const/16 v1, 0x23

    if-ne v0, v1, :cond_2

    .line 214
    invoke-static {p0}, Landroidx/camera/core/internal/utils/ImageUtil;->yuv_420_888toNv21(Landroidx/camera/core/ImageProxy;)[B

    move-result-object v3

    .line 215
    .local v3, "yuvBytes":[B
    new-instance v2, Landroid/graphics/YuvImage;

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v5

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v6

    const/4 v7, 0x0

    const/16 v4, 0x11

    invoke-direct/range {v2 .. v7}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 218
    .local v2, "yuv":Landroid/graphics/YuvImage;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 219
    .local v0, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Landroidx/camera/core/impl/utils/ExifOutputStream;

    .line 220
    invoke-static {p0, p3}, Landroidx/camera/core/impl/utils/ExifData;->create(Landroidx/camera/core/ImageProxy;I)Landroidx/camera/core/impl/utils/ExifData;

    move-result-object v4

    invoke-direct {v1, v0, v4}, Landroidx/camera/core/impl/utils/ExifOutputStream;-><init>(Ljava/io/OutputStream;Landroidx/camera/core/impl/utils/ExifData;)V

    .line 221
    .local v1, "out":Ljava/io/OutputStream;
    if-nez p1, :cond_0

    .line 222
    new-instance v4, Landroid/graphics/Rect;

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v5

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v6

    const/4 v7, 0x0

    invoke-direct {v4, v7, v7, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object p1, v4

    .line 224
    :cond_0
    nop

    .line 225
    invoke-virtual {v2, p1, p2, v1}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    move-result v4

    .line 226
    .local v4, "success":Z
    if-eqz v4, :cond_1

    .line 230
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    return-object v5

    .line 227
    :cond_1
    new-instance v5, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;

    const-string/jumbo v6, "YuvImage failed to encode jpeg."

    sget-object v7, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;->ENCODE_FAILED:Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;

    invoke-direct {v5, v6, v7}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;-><init>(Ljava/lang/String;Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;)V

    throw v5

    .line 210
    .end local v0    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "out":Ljava/io/OutputStream;
    .end local v2    # "yuv":Landroid/graphics/YuvImage;
    .end local v3    # "yuvBytes":[B
    .end local v4    # "success":Z
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Incorrect image format of the input image proxy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 211
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static yuv_420_888toNv21(Landroidx/camera/core/ImageProxy;)[B
    .locals 25
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;

    .line 236
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 237
    .local v0, "yPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v2, v2, v3

    .line 238
    .local v2, "uPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v3

    const/4 v4, 0x2

    aget-object v3, v3, v4

    .line 240
    .local v3, "vPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 241
    .local v5, "yBuffer":Ljava/nio/ByteBuffer;
    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 242
    .local v6, "uBuffer":Ljava/nio/ByteBuffer;
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 243
    .local v7, "vBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 244
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 245
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 247
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    .line 249
    .local v8, "ySize":I
    const/4 v9, 0x0

    .line 251
    .local v9, "position":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v10

    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v11

    mul-int/2addr v10, v11

    div-int/2addr v10, v4

    add-int/2addr v10, v8

    new-array v10, v10, [B

    .line 254
    .local v10, "nv21":[B
    const/4 v11, 0x0

    .local v11, "row":I
    :goto_0
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v12

    if-ge v11, v12, :cond_0

    .line 255
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v12

    invoke-virtual {v5, v10, v9, v12}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 256
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v12

    add-int/2addr v9, v12

    .line 257
    nop

    .line 258
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->position()I

    move-result v12

    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v13

    sub-int/2addr v12, v13

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v13

    add-int/2addr v12, v13

    invoke-static {v8, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 257
    invoke-virtual {v5, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 254
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 261
    .end local v11    # "row":I
    :cond_0
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v11

    div-int/2addr v11, v4

    .line 262
    .local v11, "chromaHeight":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v12

    div-int/2addr v12, v4

    .line 263
    .local v12, "chromaWidth":I
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v4

    .line 264
    .local v4, "vRowStride":I
    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v13

    .line 265
    .local v13, "uRowStride":I
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v14

    .line 266
    .local v14, "vPixelStride":I
    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v15

    .line 270
    .local v15, "uPixelStride":I
    new-array v1, v4, [B

    .line 271
    .local v1, "vLineBuffer":[B
    move-object/from16 v17, v0

    .end local v0    # "yPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    .local v17, "yPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    new-array v0, v13, [B

    .line 272
    .local v0, "uLineBuffer":[B
    const/16 v18, 0x0

    move/from16 v24, v18

    move-object/from16 v18, v2

    move/from16 v2, v24

    .local v2, "row":I
    .local v18, "uPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    :goto_1
    if-ge v2, v11, :cond_2

    .line 273
    move/from16 v19, v2

    .end local v2    # "row":I
    .local v19, "row":I
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    move-object/from16 v20, v3

    const/4 v3, 0x0

    .end local v3    # "vPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    .local v20, "vPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    invoke-virtual {v7, v1, v3, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 274
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v13, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {v6, v0, v3, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 275
    const/4 v2, 0x0

    .line 276
    .local v2, "vLineBufferPosition":I
    const/16 v16, 0x0

    .line 277
    .local v16, "uLineBufferPosition":I
    const/16 v21, 0x0

    move/from16 v3, v21

    .local v3, "col":I
    :goto_2
    if-ge v3, v12, :cond_1

    .line 278
    add-int/lit8 v22, v9, 0x1

    .end local v9    # "position":I
    .local v22, "position":I
    aget-byte v23, v1, v2

    aput-byte v23, v10, v9

    .line 279
    add-int/lit8 v9, v22, 0x1

    .end local v22    # "position":I
    .restart local v9    # "position":I
    aget-byte v23, v0, v16

    aput-byte v23, v10, v22

    .line 280
    add-int/2addr v2, v14

    .line 281
    add-int v16, v16, v15

    .line 277
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 272
    .end local v2    # "vLineBufferPosition":I
    .end local v3    # "col":I
    .end local v16    # "uLineBufferPosition":I
    :cond_1
    add-int/lit8 v2, v19, 0x1

    move-object/from16 v3, v20

    .end local v19    # "row":I
    .local v2, "row":I
    goto :goto_1

    .line 285
    .end local v2    # "row":I
    .end local v20    # "vPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    .local v3, "vPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    :cond_2
    return-object v10
.end method
