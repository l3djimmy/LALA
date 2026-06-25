.class final Landroidx/camera/core/internal/compat/ImageWriterCompatApi23Impl;
.super Ljava/lang/Object;
.source "ImageWriterCompatApi23Impl.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method static close(Landroid/media/ImageWriter;)V
    .locals 0
    .param p0, "imageWriter"    # Landroid/media/ImageWriter;

    .line 45
    invoke-virtual {p0}, Landroid/media/ImageWriter;->close()V

    .line 46
    return-void
.end method

.method static dequeueInputImage(Landroid/media/ImageWriter;)Landroid/media/Image;
    .locals 1
    .param p0, "imageWriter"    # Landroid/media/ImageWriter;

    .line 37
    invoke-virtual {p0}, Landroid/media/ImageWriter;->dequeueInputImage()Landroid/media/Image;

    move-result-object v0

    return-object v0
.end method

.method static newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;
    .locals 1
    .param p0, "surface"    # Landroid/view/Surface;
    .param p1, "maxImages"    # I

    .line 32
    invoke-static {p0, p1}, Landroid/media/ImageWriter;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object v0

    return-object v0
.end method

.method static queueInputImage(Landroid/media/ImageWriter;Landroid/media/Image;)V
    .locals 0
    .param p0, "imageWriter"    # Landroid/media/ImageWriter;
    .param p1, "image"    # Landroid/media/Image;

    .line 41
    invoke-virtual {p0, p1}, Landroid/media/ImageWriter;->queueInputImage(Landroid/media/Image;)V

    .line 42
    return-void
.end method
