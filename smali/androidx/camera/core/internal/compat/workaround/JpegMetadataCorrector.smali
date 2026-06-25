.class public Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;
.super Ljava/lang/Object;
.source "JpegMetadataCorrector.java"


# instance fields
.field private final mQuirk:Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-class v0, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    iput-object v0, p0, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;->mQuirk:Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    .line 41
    return-void
.end method


# virtual methods
.method public jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B
    .locals 3
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;

    .line 55
    iget-object v0, p0, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;->mQuirk:Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    if-nez v0, :cond_0

    .line 56
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    .line 57
    .local v0, "planes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 58
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    new-array v2, v2, [B

    .line 59
    .local v2, "data":[B
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 60
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 61
    return-object v2

    .line 63
    .end local v0    # "planes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    .end local v1    # "buffer":Ljava/nio/ByteBuffer;
    .end local v2    # "data":[B
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;->mQuirk:Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    invoke-virtual {v0, p1}, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;->jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B

    move-result-object v0

    return-object v0
.end method

.method public needCorrectJpegMetadata()Z
    .locals 1

    .line 47
    iget-object v0, p0, Landroidx/camera/core/internal/compat/workaround/JpegMetadataCorrector;->mQuirk:Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
