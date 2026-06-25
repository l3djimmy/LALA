.class public abstract Landroidx/camera/core/processing/Packet;
.super Ljava/lang/Object;
.source "Packet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 64
    .local p0, "this":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(Landroid/graphics/Bitmap;Landroidx/camera/core/impl/utils/Exif;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;
    .locals 9
    .param p0, "data"    # Landroid/graphics/Bitmap;
    .param p1, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "cropRect"    # Landroid/graphics/Rect;
    .param p3, "rotationDegrees"    # I
    .param p4, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p5, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Landroidx/camera/core/impl/utils/Exif;",
            "Landroid/graphics/Rect;",
            "I",
            "Landroid/graphics/Matrix;",
            "Landroidx/camera/core/impl/CameraCaptureResult;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 149
    new-instance v0, Landroidx/camera/core/processing/AutoValue_Packet;

    new-instance v4, Landroid/util/Size;

    .line 150
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-direct {v4, v1, v2}, Landroid/util/Size;-><init>(II)V

    const/16 v3, 0x2a

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    move v6, p3

    move-object v7, p4

    move-object v8, p5

    .end local p0    # "data":Landroid/graphics/Bitmap;
    .end local p1    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local p2    # "cropRect":Landroid/graphics/Rect;
    .end local p3    # "rotationDegrees":I
    .end local p4    # "sensorToBufferTransform":Landroid/graphics/Matrix;
    .end local p5    # "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    .local v1, "data":Landroid/graphics/Bitmap;
    .local v2, "exif":Landroidx/camera/core/impl/utils/Exif;
    .local v5, "cropRect":Landroid/graphics/Rect;
    .local v6, "rotationDegrees":I
    .local v7, "sensorToBufferTransform":Landroid/graphics/Matrix;
    .local v8, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    invoke-direct/range {v0 .. v8}, Landroidx/camera/core/processing/AutoValue_Packet;-><init>(Ljava/lang/Object;Landroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 149
    return-object v0
.end method

.method public static of(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/utils/Exif;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;
    .locals 7
    .param p0, "data"    # Landroidx/camera/core/ImageProxy;
    .param p1, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "cropRect"    # Landroid/graphics/Rect;
    .param p3, "rotationDegrees"    # I
    .param p4, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p5, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/ImageProxy;",
            "Landroidx/camera/core/impl/utils/Exif;",
            "Landroid/graphics/Rect;",
            "I",
            "Landroid/graphics/Matrix;",
            "Landroidx/camera/core/impl/CameraCaptureResult;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 161
    new-instance v2, Landroid/util/Size;

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v1

    invoke-direct {v2, v0, v1}, Landroid/util/Size;-><init>(II)V

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    .end local p0    # "data":Landroidx/camera/core/ImageProxy;
    .end local p1    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local p2    # "cropRect":Landroid/graphics/Rect;
    .end local p3    # "rotationDegrees":I
    .end local p4    # "sensorToBufferTransform":Landroid/graphics/Matrix;
    .end local p5    # "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    .local v0, "data":Landroidx/camera/core/ImageProxy;
    .local v1, "exif":Landroidx/camera/core/impl/utils/Exif;
    .local v3, "cropRect":Landroid/graphics/Rect;
    .local v4, "rotationDegrees":I
    .local v5, "sensorToBufferTransform":Landroid/graphics/Matrix;
    .local v6, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    invoke-static/range {v0 .. v6}, Landroidx/camera/core/processing/Packet;->of(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/utils/Exif;Landroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;

    move-result-object p0

    return-object p0
.end method

.method public static of(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/utils/Exif;Landroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;
    .locals 10
    .param p0, "data"    # Landroidx/camera/core/ImageProxy;
    .param p1, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "size"    # Landroid/util/Size;
    .param p3, "cropRect"    # Landroid/graphics/Rect;
    .param p4, "rotationDegrees"    # I
    .param p5, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p6, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/ImageProxy;",
            "Landroidx/camera/core/impl/utils/Exif;",
            "Landroid/util/Size;",
            "Landroid/graphics/Rect;",
            "I",
            "Landroid/graphics/Matrix;",
            "Landroidx/camera/core/impl/CameraCaptureResult;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 177
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    .line 178
    const-string v0, "JPEG image must have Exif."

    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    :cond_0
    new-instance v1, Landroidx/camera/core/processing/AutoValue_Packet;

    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v4

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    move v7, p4

    move-object v8, p5

    move-object/from16 v9, p6

    invoke-direct/range {v1 .. v9}, Landroidx/camera/core/processing/AutoValue_Packet;-><init>(Ljava/lang/Object;Landroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)V

    return-object v1
.end method

.method public static of([BLandroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;
    .locals 9
    .param p0, "data"    # [B
    .param p1, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "format"    # I
    .param p3, "size"    # Landroid/util/Size;
    .param p4, "cropRect"    # Landroid/graphics/Rect;
    .param p5, "rotationDegrees"    # I
    .param p6, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p7, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Landroidx/camera/core/impl/utils/Exif;",
            "I",
            "Landroid/util/Size;",
            "Landroid/graphics/Rect;",
            "I",
            "Landroid/graphics/Matrix;",
            "Landroidx/camera/core/impl/CameraCaptureResult;",
            ")",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;"
        }
    .end annotation

    .line 192
    new-instance v0, Landroidx/camera/core/processing/AutoValue_Packet;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Landroidx/camera/core/processing/AutoValue_Packet;-><init>(Ljava/lang/Object;Landroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)V

    return-object v0
.end method


# virtual methods
.method public abstract getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;
.end method

.method public abstract getCropRect()Landroid/graphics/Rect;
.end method

.method public abstract getData()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract getExif()Landroidx/camera/core/impl/utils/Exif;
.end method

.method public abstract getFormat()I
.end method

.method public abstract getRotationDegrees()I
.end method

.method public abstract getSensorToBufferTransform()Landroid/graphics/Matrix;
.end method

.method public abstract getSize()Landroid/util/Size;
.end method

.method public hasCropping()Z
    .locals 2

    .line 139
    .local p0, "this":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/core/processing/Packet;->getCropRect()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/core/processing/Packet;->getSize()Landroid/util/Size;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/TransformUtils;->hasCropping(Landroid/graphics/Rect;Landroid/util/Size;)Z

    move-result v0

    return v0
.end method
