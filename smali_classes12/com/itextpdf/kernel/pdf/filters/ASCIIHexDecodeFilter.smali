.class public Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;
.super Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;
.source "ASCIIHexDecodeFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;-><init>()V

    return-void
.end method

.method public static ASCIIHexDecode([B)[B
    .locals 1
    .param p0, "in"    # [B

    .line 48
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;->ASCIIHexDecodeInternal([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object v0

    return-object v0
.end method

.method private static ASCIIHexDecodeInternal([BLjava/io/ByteArrayOutputStream;)[B
    .locals 7
    .param p0, "in"    # [B
    .param p1, "out"    # Ljava/io/ByteArrayOutputStream;

    .line 69
    const/4 v0, 0x1

    .line 70
    .local v0, "first":Z
    const/4 v1, 0x0

    .line 71
    .local v1, "n1":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_5

    .line 72
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    .line 73
    .local v3, "ch":I
    const/16 v4, 0x3e

    if-ne v3, v4, :cond_0

    .line 74
    goto :goto_4

    .line 76
    :cond_0
    invoke-static {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 77
    goto :goto_3

    .line 79
    :cond_1
    invoke-static {v3}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v4

    .line 80
    .local v4, "n":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_4

    .line 83
    if-eqz v0, :cond_2

    .line 84
    move v1, v4

    goto :goto_1

    .line 86
    :cond_2
    shl-int/lit8 v5, v1, 0x4

    add-int/2addr v5, v4

    int-to-byte v5, v5

    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 88
    :goto_1
    if-nez v0, :cond_3

    const/4 v5, 0x1

    goto :goto_2

    :cond_3
    const/4 v5, 0x0

    :goto_2
    move v0, v5

    .line 71
    .end local v3    # "ch":I
    .end local v4    # "n":I
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 81
    .restart local v3    # "ch":I
    .restart local v4    # "n":I
    :cond_4
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "illegal character in ASCIIHexDecode."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 90
    .end local v2    # "k":I
    .end local v3    # "ch":I
    .end local v4    # "n":I
    :cond_5
    :goto_4
    if-nez v0, :cond_6

    .line 91
    shl-int/lit8 v2, v1, 0x4

    int-to-byte v2, v2

    invoke-virtual {p1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 93
    :cond_6
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 1
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 56
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;->enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 57
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/filters/ASCIIHexDecodeFilter;->ASCIIHexDecodeInternal([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object p1

    .line 58
    return-object p1
.end method
