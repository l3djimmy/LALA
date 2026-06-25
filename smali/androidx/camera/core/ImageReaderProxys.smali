.class public final Landroidx/camera/core/ImageReaderProxys;
.super Ljava/lang/Object;
.source "ImageReaderProxys.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;
    .locals 2
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "format"    # I
    .param p3, "maxImages"    # I

    .line 49
    invoke-static {p0, p1, p2, p3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v0

    .line 50
    .local v0, "imageReader":Landroid/media/ImageReader;
    new-instance v1, Landroidx/camera/core/AndroidImageReaderProxy;

    invoke-direct {v1, v0}, Landroidx/camera/core/AndroidImageReaderProxy;-><init>(Landroid/media/ImageReader;)V

    return-object v1
.end method
