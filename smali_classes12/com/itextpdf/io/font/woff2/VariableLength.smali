.class Lcom/itextpdf/io/font/woff2/VariableLength;
.super Ljava/lang/Object;
.source "VariableLength.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read255UShort(Lcom/itextpdf/io/font/woff2/Buffer;)I
    .locals 8
    .param p0, "buf"    # Lcom/itextpdf/io/font/woff2/Buffer;

    .line 29
    const/16 v0, 0xfd

    .line 30
    .local v0, "kWordCode":I
    const/16 v1, 0xfe

    .line 31
    .local v1, "kOneMoreByteCode2":I
    const/16 v2, 0xff

    .line 32
    .local v2, "kOneMoreByteCode1":I
    const/16 v3, 0xfd

    .line 33
    .local v3, "kLowestUCode":I
    const/4 v4, 0x0

    .line 34
    .local v4, "code":B
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readByte()B

    move-result v4

    .line 35
    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v5

    const/16 v6, 0xfd

    if-ne v5, v6, :cond_0

    .line 36
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readShort()S

    move-result v5

    .line 37
    .local v5, "result":S
    invoke-static {v5}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU16(S)I

    move-result v6

    return v6

    .line 38
    .end local v5    # "result":S
    :cond_0
    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v5

    const/16 v7, 0xff

    if-ne v5, v7, :cond_1

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readByte()B

    move-result v5

    .line 40
    .local v5, "result":B
    invoke-static {v5}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v7

    add-int/2addr v7, v6

    return v7

    .line 41
    .end local v5    # "result":B
    :cond_1
    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v5

    const/16 v6, 0xfe

    if-ne v5, v6, :cond_2

    .line 42
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readByte()B

    move-result v5

    .line 43
    .restart local v5    # "result":B
    invoke-static {v5}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v6

    add-int/lit16 v6, v6, 0x1fa

    return v6

    .line 45
    .end local v5    # "result":B
    :cond_2
    invoke-static {v4}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v5

    return v5
.end method

.method public static readBase128(Lcom/itextpdf/io/font/woff2/Buffer;)I
    .locals 6
    .param p0, "buf"    # Lcom/itextpdf/io/font/woff2/Buffer;

    .line 50
    const/4 v0, 0x0

    .line 51
    .local v0, "result":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x5

    const-string v3, "Reading woff2 base 128 number exception"

    if-ge v1, v2, :cond_4

    .line 52
    const/4 v2, 0x0

    .line 53
    .local v2, "code":B
    invoke-virtual {p0}, Lcom/itextpdf/io/font/woff2/Buffer;->readByte()B

    move-result v2

    .line 55
    if-nez v1, :cond_1

    invoke-static {v2}, Lcom/itextpdf/io/font/woff2/JavaUnsignedUtil;->asU8(B)I

    move-result v4

    const/16 v5, 0x80

    if-eq v4, v5, :cond_0

    goto :goto_1

    .line 56
    :cond_0
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    :cond_1
    :goto_1
    const/high16 v4, -0x2000000

    and-int/2addr v4, v0

    if-nez v4, :cond_3

    .line 62
    shl-int/lit8 v3, v0, 0x7

    and-int/lit8 v4, v2, 0x7f

    or-int v0, v3, v4

    .line 63
    and-int/lit16 v3, v2, 0x80

    if-nez v3, :cond_2

    .line 64
    return v0

    .line 51
    .end local v2    # "code":B
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 60
    .restart local v2    # "code":B
    :cond_3
    new-instance v4, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v4, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 68
    .end local v1    # "i":I
    .end local v2    # "code":B
    :cond_4
    new-instance v1, Lcom/itextpdf/io/exceptions/FontCompressionException;

    invoke-direct {v1, v3}, Lcom/itextpdf/io/exceptions/FontCompressionException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
