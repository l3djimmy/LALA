.class Lcom/itextpdf/io/font/woff2/StoreBytes;
.super Ljava/lang/Object;
.source "StoreBytes.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static storeU16([BII)I
    .locals 2
    .param p0, "dst"    # [B
    .param p1, "offset"    # I
    .param p2, "x"    # I

    .line 33
    shr-int/lit8 v0, p2, 0x8

    invoke-static {v0}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->toU8(I)B

    move-result v0

    aput-byte v0, p0, p1

    .line 34
    add-int/lit8 v0, p1, 0x1

    invoke-static {p2}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->toU8(I)B

    move-result v1

    aput-byte v1, p0, v0

    .line 35
    add-int/lit8 v0, p1, 0x2

    return v0
.end method

.method public static storeU32([BII)I
    .locals 2
    .param p0, "dst"    # [B
    .param p1, "offset"    # I
    .param p2, "x"    # I

    .line 25
    shr-int/lit8 v0, p2, 0x18

    invoke-static {v0}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->toU8(I)B

    move-result v0

    aput-byte v0, p0, p1

    .line 26
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x10

    invoke-static {v1}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->toU8(I)B

    move-result v1

    aput-byte v1, p0, v0

    .line 27
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x8

    invoke-static {v1}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->toU8(I)B

    move-result v1

    aput-byte v1, p0, v0

    .line 28
    add-int/lit8 v0, p1, 0x3

    invoke-static {p2}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->toU8(I)B

    move-result v1

    aput-byte v1, p0, v0

    .line 29
    add-int/lit8 v0, p1, 0x4

    return v0
.end method
