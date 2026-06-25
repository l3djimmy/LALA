.class public final Landroidx/camera/core/internal/compat/ImageWriterCompat;
.super Ljava/lang/Object;
.source "ImageWriterCompat.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    return-void
.end method

.method public static close(Landroid/media/ImageWriter;)V
    .locals 0
    .param p0, "imageWriter"    # Landroid/media/ImageWriter;

    .line 167
    nop

    .line 168
    invoke-static {p0}, Landroidx/camera/core/internal/compat/ImageWriterCompatApi23Impl;->close(Landroid/media/ImageWriter;)V

    .line 169
    return-void
.end method

.method public static dequeueInputImage(Landroid/media/ImageWriter;)Landroid/media/Image;
    .locals 1
    .param p0, "imageWriter"    # Landroid/media/ImageWriter;

    .line 133
    nop

    .line 134
    invoke-static {p0}, Landroidx/camera/core/internal/compat/ImageWriterCompatApi23Impl;->dequeueInputImage(Landroid/media/ImageWriter;)Landroid/media/Image;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;
    .locals 1
    .param p0, "surface"    # Landroid/view/Surface;
    .param p1, "maxImages"    # I

    .line 114
    nop

    .line 115
    invoke-static {p0, p1}, Landroidx/camera/core/internal/compat/ImageWriterCompatApi23Impl;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Landroid/view/Surface;II)Landroid/media/ImageWriter;
    .locals 2
    .param p0, "surface"    # Landroid/view/Surface;
    .param p1, "maxImages"    # I
    .param p2, "format"    # I

    .line 78
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 79
    invoke-static {p0, p1, p2}, Landroidx/camera/core/internal/compat/ImageWriterCompatApi29Impl;->newInstance(Landroid/view/Surface;II)Landroid/media/ImageWriter;

    move-result-object v0

    return-object v0

    .line 80
    :cond_0
    nop

    .line 81
    invoke-static {p0, p1, p2}, Landroidx/camera/core/internal/compat/ImageWriterCompatApi26Impl;->newInstance(Landroid/view/Surface;II)Landroid/media/ImageWriter;

    move-result-object v0

    return-object v0
.end method

.method public static queueInputImage(Landroid/media/ImageWriter;Landroid/media/Image;)V
    .locals 0
    .param p0, "imageWriter"    # Landroid/media/ImageWriter;
    .param p1, "image"    # Landroid/media/Image;

    .line 151
    nop

    .line 152
    invoke-static {p0, p1}, Landroidx/camera/core/internal/compat/ImageWriterCompatApi23Impl;->queueInputImage(Landroid/media/ImageWriter;Landroid/media/Image;)V

    .line 153
    return-void
.end method
