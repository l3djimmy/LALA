.class Lcom/itextpdf/io/font/woff2/Woff2Common;
.super Ljava/lang/Object;
.source "Woff2Common.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/woff2/Woff2Common$Table;,
        Lcom/itextpdf/io/font/woff2/Woff2Common$Point;
    }
.end annotation


# static fields
.field public static final kSfntEntrySize:I = 0x10

.field public static final kSfntHeaderSize:I = 0xc

.field public static final kTtcFontFlavor:I = 0x74746366

.field public static final kWoff2FlagsTransform:I = 0x100

.field public static final kWoff2Signature:I = 0x774f4632


# direct methods
.method constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectionHeaderSize(II)I
    .locals 3
    .param p0, "header_version"    # I
    .param p1, "num_fonts"    # I

    .line 68
    const/4 v0, 0x0

    .line 69
    .local v0, "size":I
    const/high16 v1, 0x20000

    if-ne p0, v1, :cond_0

    .line 70
    add-int/lit8 v0, v0, 0xc

    .line 72
    :cond_0
    const/high16 v2, 0x10000

    if-eq p0, v2, :cond_1

    if-ne p0, v1, :cond_2

    .line 73
    :cond_1
    mul-int/lit8 v1, p1, 0x4

    add-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    .line 76
    :cond_2
    return v0
.end method

.method public static computeULongSum([BII)I
    .locals 6
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "size"    # I

    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "checksum":I
    and-int/lit8 v1, p2, -0x4

    .line 83
    .local v1, "aligned_size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 84
    add-int v3, p1, v2

    aget-byte v3, p0, v3

    invoke-static {v3}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    add-int v4, p1, v2

    add-int/lit8 v4, v4, 0x1

    aget-byte v4, p0, v4

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v4

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v3, v4

    add-int v4, p1, v2

    add-int/lit8 v4, v4, 0x2

    aget-byte v4, p0, v4

    .line 85
    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v4

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    add-int v4, p1, v2

    add-int/lit8 v4, v4, 0x3

    aget-byte v4, p0, v4

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v4

    or-int/2addr v3, v4

    add-int/2addr v0, v3

    .line 83
    add-int/lit8 v2, v2, 0x4

    goto :goto_0

    .line 89
    .end local v2    # "i":I
    :cond_0
    if-eq p2, v1, :cond_2

    .line 90
    const/4 v2, 0x0

    .line 91
    .local v2, "v":I
    move v3, v1

    .local v3, "i":I
    :goto_1
    if-ge v3, p2, :cond_1

    .line 92
    add-int v4, p1, v3

    aget-byte v4, p0, v4

    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v4

    and-int/lit8 v5, v3, 0x3

    mul-int/lit8 v5, v5, 0x8

    rsub-int/lit8 v5, v5, 0x18

    shl-int/2addr v4, v5

    or-int/2addr v2, v4

    .line 91
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 94
    .end local v3    # "i":I
    :cond_1
    add-int/2addr v0, v2

    .line 97
    .end local v2    # "v":I
    :cond_2
    return v0
.end method
