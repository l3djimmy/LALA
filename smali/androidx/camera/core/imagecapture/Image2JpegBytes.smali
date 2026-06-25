.class final Landroidx/camera/core/imagecapture/Image2JpegBytes;
.super Ljava/lang/Object;
.source "Image2JpegBytes.java"

# interfaces
.implements Landroidx/camera/core/processing/Operation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/Image2JpegBytes$In;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Operation<",
        "Landroidx/camera/core/imagecapture/Image2JpegBytes$In;",
        "Landroidx/camera/core/processing/Packet<",
        "[B>;>;"
    }
.end annotation


# instance fields
.field private final mJpegMetadataCorrector:Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;

    invoke-direct {v0, p1}, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/Image2JpegBytes;->mJpegMetadataCorrector:Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;

    .line 58
    return-void
.end method

.method private static extractExif([B)Landroidx/camera/core/impl/utils/Exif;
    .locals 4
    .param p0, "jpegBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 123
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Exif;->createFromInputStream(Ljava/io/InputStream;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    const/4 v2, 0x0

    const-string v3, "Failed to extract Exif from YUV-generated JPEG"

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private processJpegImage(Landroidx/camera/core/imagecapture/Image2JpegBytes$In;)Landroidx/camera/core/processing/Packet;
    .locals 11
    .param p1, "input"    # Landroidx/camera/core/imagecapture/Image2JpegBytes$In;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/Image2JpegBytes$In;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;"
        }
    .end annotation

    .line 79
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v0

    .line 80
    .local v0, "packet":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    iget-object v1, p0, Landroidx/camera/core/imagecapture/Image2JpegBytes;->mJpegMetadataCorrector:Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;

    .line 81
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/ImageProxy;

    invoke-virtual {v1, v2}, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;->jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B

    move-result-object v3

    .line 82
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getExif()Landroidx/camera/core/impl/utils/Exif;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroidx/camera/core/impl/utils/Exif;

    .line 84
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getSize()Landroid/util/Size;

    move-result-object v6

    .line 85
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getCropRect()Landroid/graphics/Rect;

    move-result-object v7

    .line 86
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v8

    .line 87
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v9

    .line 88
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v10

    .line 80
    const/16 v5, 0x100

    invoke-static/range {v3 .. v10}, Landroidx/camera/core/processing/Packet;->of([BLandroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;

    move-result-object v1

    return-object v1
.end method

.method private processYuvImage(Landroidx/camera/core/imagecapture/Image2JpegBytes$In;)Landroidx/camera/core/processing/Packet;
    .locals 12
    .param p1, "input"    # Landroidx/camera/core/imagecapture/Image2JpegBytes$In;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/Image2JpegBytes$In;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 93
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v1

    .line 94
    .local v1, "packet":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroidx/camera/core/ImageProxy;

    .line 95
    .local v2, "image":Landroidx/camera/core/ImageProxy;
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    .line 99
    .local v3, "cropRect":Landroid/graphics/Rect;
    nop

    .line 102
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getJpegQuality()I

    move-result v0

    .line 103
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v4

    .line 99
    invoke-static {v2, v3, v0, v4}, Landroidx/camera/core/internal/utils/ImageUtil;->yuvImageToJpegByteArray(Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;II)[B

    move-result-object v0
    :try_end_0
    .catch Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v0

    .line 107
    .local v4, "jpegBytes":[B
    nop

    .line 110
    nop

    .line 112
    invoke-static {v4}, Landroidx/camera/core/imagecapture/Image2JpegBytes;->extractExif([B)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v5

    new-instance v7, Landroid/util/Size;

    .line 114
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v6

    invoke-direct {v7, v0, v6}, Landroid/util/Size;-><init>(II)V

    new-instance v8, Landroid/graphics/Rect;

    .line 115
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v6

    const/4 v9, 0x0

    invoke-direct {v8, v9, v9, v0, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 116
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v9

    .line 117
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-static {v0, v3}, Landroidx/camera/core/impl/utils/TransformUtils;->updateSensorToBufferTransform(Landroid/graphics/Matrix;Landroid/graphics/Rect;)Landroid/graphics/Matrix;

    move-result-object v10

    .line 118
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v11

    .line 110
    const/16 v6, 0x100

    invoke-static/range {v4 .. v11}, Landroidx/camera/core/processing/Packet;->of([BLandroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;

    move-result-object v0

    return-object v0

    .line 104
    .end local v4    # "jpegBytes":[B
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
    new-instance v4, Landroidx/camera/core/ImageCaptureException;

    const/4 v5, 0x1

    const-string v6, "Failed to encode the image to JPEG."

    invoke-direct {v4, v5, v6, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method


# virtual methods
.method public apply(Landroidx/camera/core/imagecapture/Image2JpegBytes$In;)Landroidx/camera/core/processing/Packet;
    .locals 4
    .param p1, "input"    # Landroidx/camera/core/imagecapture/Image2JpegBytes$In;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/Image2JpegBytes$In;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 64
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v0

    .line 65
    .local v0, "imageFormat":I
    sparse-switch v0, :sswitch_data_0

    .line 71
    new-instance v1, Ljava/lang/IllegalArgumentException;

    goto :goto_0

    .line 67
    :sswitch_0
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes;->processJpegImage(Landroidx/camera/core/imagecapture/Image2JpegBytes$In;)Landroidx/camera/core/processing/Packet;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/ImageProxy;

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy;->close()V

    .line 67
    return-object v1

    .line 69
    :sswitch_1
    :try_start_1
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes;->processYuvImage(Landroidx/camera/core/imagecapture/Image2JpegBytes$In;)Landroidx/camera/core/processing/Packet;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/ImageProxy;

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy;->close()V

    .line 69
    return-object v1

    .line 71
    :goto_0
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unexpected format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "input":Landroidx/camera/core/imagecapture/Image2JpegBytes$In;
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    .end local v0    # "imageFormat":I
    .restart local p1    # "input":Landroidx/camera/core/imagecapture/Image2JpegBytes$In;
    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/ImageProxy;

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 75
    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_1
        0x100 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 52
    check-cast p1, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/Image2JpegBytes;->apply(Landroidx/camera/core/imagecapture/Image2JpegBytes$In;)Landroidx/camera/core/processing/Packet;

    move-result-object p1

    return-object p1
.end method
