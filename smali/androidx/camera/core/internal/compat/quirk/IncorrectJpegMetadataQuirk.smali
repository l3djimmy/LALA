.class public final Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;
.super Ljava/lang/Object;
.source "IncorrectJpegMetadataQuirk.java"

# interfaces
.implements Landroidx/camera/core/impl/Quirk;


# static fields
.field private static final SAMSUNG_DEVICES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 43
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "A24"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;->SAMSUNG_DEVICES:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private canParseSosMarker([B)Z
    .locals 3
    .param p1, "bytes"    # [B

    .line 90
    const/4 v0, 0x2

    .line 93
    .local v0, "markPosition":I
    :goto_0
    add-int/lit8 v1, v0, 0x4

    array-length v2, p1

    if-gt v1, v2, :cond_2

    aget-byte v1, p1, v0

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    goto :goto_1

    .line 97
    :cond_0
    aget-byte v1, p1, v0

    if-ne v1, v2, :cond_1

    add-int/lit8 v1, v0, 0x1

    aget-byte v1, p1, v1

    const/16 v2, -0x26

    if-ne v1, v2, :cond_1

    .line 98
    const/4 v1, 0x1

    return v1

    .line 100
    :cond_1
    add-int/lit8 v1, v0, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, v0, 0x3

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 102
    .local v1, "segmentLength":I
    add-int/lit8 v2, v1, 0x2

    add-int/2addr v0, v2

    .line 103
    .end local v1    # "segmentLength":I
    goto :goto_0

    .line 94
    :cond_2
    :goto_1
    const/4 v1, 0x0

    return v1
.end method

.method private findSecondFfd8Position([B)I
    .locals 4
    .param p1, "bytes"    # [B

    .line 114
    const/4 v0, 0x2

    .line 117
    .local v0, "position":I
    :goto_0
    add-int/lit8 v1, v0, 0x1

    array-length v2, p1

    const/4 v3, -0x1

    if-le v1, v2, :cond_0

    .line 118
    nop

    .line 128
    return v3

    .line 121
    :cond_0
    aget-byte v1, p1, v0

    if-ne v1, v3, :cond_1

    add-int/lit8 v1, v0, 0x1

    aget-byte v1, p1, v1

    const/16 v2, -0x28

    if-ne v1, v2, :cond_1

    .line 123
    return v0

    .line 125
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static isSamsungProblematicDevice()Z
    .locals 3

    .line 52
    const-string/jumbo v0, "Samsung"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;->SAMSUNG_DEVICES:Ljava/util/Set;

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 52
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static load()Z
    .locals 1

    .line 48
    invoke-static {}, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;->isSamsungProblematicDevice()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B
    .locals 5
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 64
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 65
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    new-array v1, v1, [B

    .line 66
    .local v1, "bytes":[B
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 67
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 69
    const/4 v2, 0x0

    .line 73
    .local v2, "copyStartPos":I
    invoke-direct {p0, v1}, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;->canParseSosMarker([B)Z

    move-result v3

    if-nez v3, :cond_1

    .line 74
    invoke-direct {p0, v1}, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;->findSecondFfd8Position([B)I

    move-result v3

    .line 75
    .local v3, "secondFfd8Position":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 76
    move v2, v3

    goto :goto_0

    .line 78
    :cond_0
    return-object v1

    .line 82
    .end local v3    # "secondFfd8Position":I
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    invoke-static {v1, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    return-object v3
.end method
