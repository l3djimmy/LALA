.class public Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;
.super Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;
.source "ASCII85DecodeFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;-><init>()V

    return-void
.end method

.method public static ASCII85Decode([B)[B
    .locals 1
    .param p0, "in"    # [B

    .line 48
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;->ASCII85DecodeInternal([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object v0

    return-object v0
.end method

.method private static ASCII85DecodeInternal([BLjava/io/ByteArrayOutputStream;)[B
    .locals 9
    .param p0, "in"    # [B
    .param p1, "out"    # Ljava/io/ByteArrayOutputStream;

    .line 70
    const/4 v0, 0x0

    .line 71
    .local v0, "state":I
    const/4 v1, 0x5

    new-array v2, v1, [I

    .line 72
    .local v2, "chn":[I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    array-length v4, p0

    const/4 v5, 0x0

    if-ge v3, v4, :cond_6

    .line 73
    aget-byte v4, p0, v3

    and-int/lit16 v4, v4, 0xff

    .line 74
    .local v4, "ch":I
    const/16 v6, 0x7e

    if-ne v4, v6, :cond_0

    .line 75
    goto :goto_3

    .line 77
    :cond_0
    invoke-static {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 78
    goto :goto_2

    .line 80
    :cond_1
    const/16 v6, 0x7a

    if-ne v4, v6, :cond_2

    if-nez v0, :cond_2

    .line 81
    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 82
    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 83
    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 84
    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 85
    goto :goto_2

    .line 87
    :cond_2
    const/16 v5, 0x21

    if-lt v4, v5, :cond_5

    const/16 v5, 0x75

    if-gt v4, v5, :cond_5

    .line 90
    add-int/lit8 v5, v4, -0x21

    aput v5, v2, v0

    .line 91
    add-int/lit8 v0, v0, 0x1

    .line 92
    if-ne v0, v1, :cond_4

    .line 93
    const/4 v0, 0x0

    .line 94
    const/4 v5, 0x0

    .line 95
    .local v5, "r":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_1
    if-ge v6, v1, :cond_3

    .line 96
    mul-int/lit8 v7, v5, 0x55

    aget v8, v2, v6

    add-int v5, v7, v8

    .line 95
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 98
    .end local v6    # "j":I
    :cond_3
    shr-int/lit8 v6, v5, 0x18

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 99
    shr-int/lit8 v6, v5, 0x10

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 100
    shr-int/lit8 v6, v5, 0x8

    int-to-byte v6, v6

    invoke-virtual {p1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 101
    int-to-byte v6, v5

    invoke-virtual {p1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 72
    .end local v4    # "ch":I
    .end local v5    # "r":I
    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 88
    .restart local v4    # "ch":I
    :cond_5
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Illegal character in ASCII85Decode."

    invoke-direct {v1, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 104
    .end local v3    # "k":I
    .end local v4    # "ch":I
    :cond_6
    :goto_3
    const/4 v1, 0x2

    const/4 v3, 0x1

    if-ne v0, v1, :cond_7

    .line 105
    aget v1, v2, v5

    mul-int/lit8 v1, v1, 0x55

    mul-int/lit8 v1, v1, 0x55

    mul-int/lit8 v1, v1, 0x55

    mul-int/lit8 v1, v1, 0x55

    aget v3, v2, v3

    mul-int/lit8 v3, v3, 0x55

    mul-int/lit8 v3, v3, 0x55

    mul-int/lit8 v3, v3, 0x55

    add-int/2addr v1, v3

    const v3, 0x95eed

    add-int/2addr v1, v3

    add-int/lit16 v1, v1, 0x1c39

    add-int/lit8 v1, v1, 0x55

    .line 106
    .local v1, "r":I
    shr-int/lit8 v3, v1, 0x18

    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 107
    .end local v1    # "r":I
    goto :goto_5

    :cond_7
    const/4 v4, 0x3

    if-ne v0, v4, :cond_8

    .line 108
    aget v4, v2, v5

    mul-int/lit8 v4, v4, 0x55

    mul-int/lit8 v4, v4, 0x55

    mul-int/lit8 v4, v4, 0x55

    mul-int/lit8 v4, v4, 0x55

    aget v3, v2, v3

    mul-int/lit8 v3, v3, 0x55

    mul-int/lit8 v3, v3, 0x55

    mul-int/lit8 v3, v3, 0x55

    add-int/2addr v4, v3

    aget v1, v2, v1

    mul-int/lit8 v1, v1, 0x55

    mul-int/lit8 v1, v1, 0x55

    add-int/2addr v4, v1

    add-int/lit16 v4, v4, 0x1c39

    add-int/lit8 v4, v4, 0x55

    .line 109
    .local v4, "r":I
    shr-int/lit8 v1, v4, 0x18

    int-to-byte v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 110
    shr-int/lit8 v1, v4, 0x10

    int-to-byte v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .end local v4    # "r":I
    goto :goto_4

    .line 111
    :cond_8
    const/4 v6, 0x4

    if-ne v0, v6, :cond_9

    .line 112
    aget v5, v2, v5

    mul-int/lit8 v5, v5, 0x55

    mul-int/lit8 v5, v5, 0x55

    mul-int/lit8 v5, v5, 0x55

    mul-int/lit8 v5, v5, 0x55

    aget v3, v2, v3

    mul-int/lit8 v3, v3, 0x55

    mul-int/lit8 v3, v3, 0x55

    mul-int/lit8 v3, v3, 0x55

    add-int/2addr v5, v3

    aget v1, v2, v1

    mul-int/lit8 v1, v1, 0x55

    mul-int/lit8 v1, v1, 0x55

    add-int/2addr v5, v1

    aget v1, v2, v4

    mul-int/lit8 v1, v1, 0x55

    add-int/2addr v5, v1

    add-int/lit8 v5, v5, 0x55

    .line 113
    .restart local v5    # "r":I
    shr-int/lit8 v1, v5, 0x18

    int-to-byte v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 114
    shr-int/lit8 v1, v5, 0x10

    int-to-byte v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 115
    shr-int/lit8 v1, v5, 0x8

    int-to-byte v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_5

    .line 111
    .end local v5    # "r":I
    :cond_9
    :goto_4
    nop

    .line 117
    :goto_5
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 1
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 56
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;->enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 57
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/filters/ASCII85DecodeFilter;->ASCII85DecodeInternal([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object p1

    .line 58
    return-object p1
.end method
