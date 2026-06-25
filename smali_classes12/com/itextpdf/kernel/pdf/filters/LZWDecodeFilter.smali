.class public Lcom/itextpdf/kernel/pdf/filters/LZWDecodeFilter;
.super Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;
.source "LZWDecodeFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;-><init>()V

    return-void
.end method

.method public static LZWDecode([B)[B
    .locals 1
    .param p0, "in"    # [B

    .line 44
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecodeFilter;->LZWDecodeInternal([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object v0

    return-object v0
.end method

.method private static LZWDecodeInternal([BLjava/io/ByteArrayOutputStream;)[B
    .locals 2
    .param p0, "in"    # [B
    .param p1, "out"    # Ljava/io/ByteArrayOutputStream;

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;-><init>()V

    .line 67
    .local v0, "lzw":Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;
    invoke-virtual {v0, p0, p1}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->decode([BLjava/io/OutputStream;)V

    .line 68
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

    .line 52
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/filters/LZWDecodeFilter;->enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 53
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecodeFilter;->LZWDecodeInternal([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object p1

    .line 54
    invoke-static {p1, p3}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->decodePredictor([BLcom/itextpdf/kernel/pdf/PdfObject;)[B

    move-result-object p1

    .line 55
    return-object p1
.end method
