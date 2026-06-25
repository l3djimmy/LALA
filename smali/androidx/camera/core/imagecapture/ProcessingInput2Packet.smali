.class final Landroidx/camera/core/imagecapture/ProcessingInput2Packet;
.super Ljava/lang/Object;
.source "ProcessingInput2Packet.java"

# interfaces
.implements Landroidx/camera/core/processing/Operation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Operation<",
        "Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;",
        "Landroidx/camera/core/processing/Packet<",
        "Landroidx/camera/core/ImageProxy;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createPacket(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/processing/Packet;
    .locals 6
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "image"    # Landroidx/camera/core/ImageProxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            "Landroidx/camera/core/impl/utils/Exif;",
            "Landroidx/camera/core/ImageProxy;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 86
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getRotationDegrees()I

    move-result v3

    .line 87
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-static {p2}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->getCameraCaptureResult(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v5

    .line 86
    move-object v1, p1

    move-object v0, p2

    .end local p1    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local p2    # "image":Landroidx/camera/core/ImageProxy;
    .local v0, "image":Landroidx/camera/core/ImageProxy;
    .local v1, "exif":Landroidx/camera/core/impl/utils/Exif;
    invoke-static/range {v0 .. v5}, Landroidx/camera/core/processing/Packet;->of(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/utils/Exif;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;

    move-result-object p1

    return-object p1
.end method

.method private static createPacketWithHalRotation(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/processing/Packet;
    .locals 10
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "image"    # Landroidx/camera/core/ImageProxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            "Landroidx/camera/core/impl/utils/Exif;",
            "Landroidx/camera/core/ImageProxy;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 105
    new-instance v0, Landroid/util/Size;

    invoke-interface {p2}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v1

    invoke-interface {p2}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    .line 108
    .local v0, "surfaceSize":Landroid/util/Size;
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getRotationDegrees()I

    move-result v1

    invoke-virtual {p1}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result v2

    sub-int/2addr v1, v2

    .line 110
    .local v1, "halRotationDegrees":I
    invoke-static {v1, v0}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->getRotatedSize(ILandroid/util/Size;)Landroid/util/Size;

    move-result-object v4

    .line 113
    .local v4, "imageSize":Landroid/util/Size;
    new-instance v2, Landroid/graphics/RectF;

    .line 114
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v5

    int-to-float v5, v5

    const/4 v6, 0x0

    invoke-direct {v2, v6, v6, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v3, Landroid/graphics/RectF;

    .line 115
    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-direct {v3, v6, v6, v5, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 113
    invoke-static {v2, v3, v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;I)Landroid/graphics/Matrix;

    move-result-object v9

    .line 118
    .local v9, "halTransform":Landroid/graphics/Matrix;
    nop

    .line 119
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-static {v2, v9}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->getUpdatedCropRect(Landroid/graphics/Rect;Landroid/graphics/Matrix;)Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {p1}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result v6

    .line 120
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-static {v2, v9}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->getUpdatedTransform(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v7

    .line 121
    invoke-static {p2}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->getCameraCaptureResult(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v8

    .line 118
    move-object v3, p1

    move-object v2, p2

    .end local p1    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local p2    # "image":Landroidx/camera/core/ImageProxy;
    .local v2, "image":Landroidx/camera/core/ImageProxy;
    .local v3, "exif":Landroidx/camera/core/impl/utils/Exif;
    invoke-static/range {v2 .. v8}, Landroidx/camera/core/processing/Packet;->of(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/utils/Exif;Landroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;

    move-result-object p1

    return-object p1
.end method

.method private static getCameraCaptureResult(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/impl/CameraCaptureResult;
    .locals 1
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;

    .line 125
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/internal/CameraCaptureResultImageInfo;

    invoke-virtual {v0}, Landroidx/camera/core/internal/CameraCaptureResultImageInfo;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v0

    return-object v0
.end method

.method private static getRotatedSize(ILandroid/util/Size;)Landroid/util/Size;
    .locals 3
    .param p0, "rotationDegrees"    # I
    .param p1, "size"    # Landroid/util/Size;

    .line 153
    invoke-static {p0}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    new-instance v0, Landroid/util/Size;

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    goto :goto_0

    .line 155
    :cond_0
    move-object v0, p1

    .line 153
    :goto_0
    return-object v0
.end method

.method private static getUpdatedCropRect(Landroid/graphics/Rect;Landroid/graphics/Matrix;)Landroid/graphics/Rect;
    .locals 2
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "halTransform"    # Landroid/graphics/Matrix;

    .line 144
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 145
    .local v0, "rectF":Landroid/graphics/RectF;
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 146
    invoke-virtual {v0}, Landroid/graphics/RectF;->sort()V

    .line 147
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 148
    .local v1, "rect":Landroid/graphics/Rect;
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 149
    return-object v1
.end method

.method private static getUpdatedTransform(Landroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "sensorToSurface"    # Landroid/graphics/Matrix;
    .param p1, "halTransform"    # Landroid/graphics/Matrix;

    .line 134
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 135
    .local v0, "sensorToBuffer":Landroid/graphics/Matrix;
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 136
    return-object v0
.end method


# virtual methods
.method public apply(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/processing/Packet;
    .locals 7
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 63
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getImageProxy()Landroidx/camera/core/ImageProxy;

    move-result-object v0

    .line 64
    .local v0, "image":Landroidx/camera/core/ImageProxy;
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v1

    .line 67
    .local v1, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    const/4 v2, 0x0

    .line 68
    .local v2, "exif":Landroidx/camera/core/impl/utils/Exif;
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v3

    const/16 v4, 0x100

    if-ne v3, v4, :cond_0

    .line 70
    :try_start_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/Exif;->createFromImageProxy(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v3

    move-object v2, v3

    .line 72
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-interface {v3}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    goto :goto_0

    .line 73
    :catch_0
    move-exception v3

    .line 74
    .local v3, "e":Ljava/io/IOException;
    new-instance v4, Landroidx/camera/core/ImageCaptureException;

    const/4 v5, 0x1

    const-string v6, "Failed to extract EXIF data."

    invoke-direct {v4, v5, v6, v3}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 77
    .end local v3    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    sget-object v3, Landroidx/camera/core/imagecapture/ImagePipeline;->EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    invoke-virtual {v3, v0}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;->shouldUseExifOrientation(Landroidx/camera/core/ImageProxy;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 78
    const-string v3, "JPEG image must have exif."

    invoke-static {v2, v3}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-static {v1, v2, v0}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->createPacketWithHalRotation(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/processing/Packet;

    move-result-object v3

    return-object v3

    .line 81
    :cond_1
    invoke-static {v1, v2, v0}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->createPacket(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/processing/Packet;

    move-result-object v3

    return-object v3
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 55
    check-cast p1, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;->apply(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/processing/Packet;

    move-result-object p1

    return-object p1
.end method
