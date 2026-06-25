.class public Lcom/itextpdf/kernel/pdf/filters/RunLengthDecodeFilter;
.super Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;
.source "RunLengthDecodeFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 5
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 42
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/filters/RunLengthDecodeFilter;->enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 44
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_3

    .line 45
    aget-byte v2, p1, v1

    .line 46
    .local v2, "dupCount":B
    const/16 v3, -0x80

    if-ne v2, v3, :cond_0

    .line 49
    goto :goto_3

    .line 51
    :cond_0
    and-int/lit16 v3, v2, 0x80

    if-nez v3, :cond_1

    .line 52
    add-int/lit8 v3, v2, 0x1

    .line 53
    .local v3, "bytesToCopy":I
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v0, p1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 54
    add-int/2addr v1, v3

    .line 55
    .end local v3    # "bytesToCopy":I
    goto :goto_2

    .line 58
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 59
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    and-int/lit16 v4, v2, 0xff

    rsub-int v4, v4, 0x101

    if-ge v3, v4, :cond_2

    .line 60
    aget-byte v4, p1, v1

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 59
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 44
    .end local v3    # "j":I
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 64
    .end local v1    # "i":I
    .end local v2    # "dupCount":B
    :cond_3
    :goto_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
