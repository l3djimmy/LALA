.class public Landroidx/camera/core/imagecapture/BitmapEffect;
.super Ljava/lang/Object;
.source "BitmapEffect.java"

# interfaces
.implements Landroidx/camera/core/processing/Operation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Operation<",
        "Landroidx/camera/core/processing/Packet<",
        "Landroid/graphics/Bitmap;",
        ">;",
        "Landroidx/camera/core/processing/Packet<",
        "Landroid/graphics/Bitmap;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final mProcessor:Landroidx/camera/core/processing/InternalImageProcessor;


# direct methods
.method constructor <init>(Landroidx/camera/core/processing/InternalImageProcessor;)V
    .locals 0
    .param p1, "imageProcessor"    # Landroidx/camera/core/processing/InternalImageProcessor;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroidx/camera/core/imagecapture/BitmapEffect;->mProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    .line 50
    return-void
.end method


# virtual methods
.method public apply(Landroidx/camera/core/processing/Packet;)Landroidx/camera/core/processing/Packet;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 56
    .local p1, "packet":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroid/graphics/Bitmap;>;"
    iget-object v0, p0, Landroidx/camera/core/imagecapture/BitmapEffect;->mProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    new-instance v1, Landroidx/camera/core/processing/ImageProcessorRequest;

    new-instance v2, Landroidx/camera/core/imagecapture/RgbaImageProxy;

    invoke-direct {v2, p1}, Landroidx/camera/core/imagecapture/RgbaImageProxy;-><init>(Landroidx/camera/core/processing/Packet;)V

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroidx/camera/core/processing/ImageProcessorRequest;-><init>(Landroidx/camera/core/ImageProxy;I)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/InternalImageProcessor;->safeProcess(Landroidx/camera/core/ImageProcessor$Request;)Landroidx/camera/core/ImageProcessor$Response;

    move-result-object v0

    .line 61
    .local v0, "response":Landroidx/camera/core/ImageProcessor$Response;
    invoke-interface {v0}, Landroidx/camera/core/ImageProcessor$Response;->getOutputImage()Landroidx/camera/core/ImageProxy;

    move-result-object v1

    .line 62
    .local v1, "imageOut":Landroidx/camera/core/ImageProxy;
    nop

    .line 63
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/ImageProxy;

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v2

    .line 64
    invoke-interface {v1}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v3

    .line 65
    invoke-interface {v1}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v4

    .line 62
    invoke-static {v2, v3, v4}, Landroidx/camera/core/internal/utils/ImageUtil;->createBitmapFromPlane([Landroidx/camera/core/ImageProxy$PlaneProxy;II)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 66
    .local v5, "bitmapOut":Landroid/graphics/Bitmap;
    nop

    .line 68
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getExif()Landroidx/camera/core/impl/utils/Exif;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroidx/camera/core/impl/utils/Exif;

    .line 69
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getCropRect()Landroid/graphics/Rect;

    move-result-object v7

    .line 70
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v8

    .line 71
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v9

    .line 72
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v10

    .line 66
    invoke-static/range {v5 .. v10}, Landroidx/camera/core/processing/Packet;->of(Landroid/graphics/Bitmap;Landroidx/camera/core/impl/utils/Exif;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)Landroidx/camera/core/processing/Packet;

    move-result-object v2

    return-object v2
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 43
    check-cast p1, Landroidx/camera/core/processing/Packet;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/BitmapEffect;->apply(Landroidx/camera/core/processing/Packet;)Landroidx/camera/core/processing/Packet;

    move-result-object p1

    return-object p1
.end method
