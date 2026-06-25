.class public Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;
.super Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;
.source "FlateDecodeStrictFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;-><init>()V

    return-void
.end method

.method private static flateDecode([BLjava/io/ByteArrayOutputStream;)[B
    .locals 1
    .param p0, "in"    # [B
    .param p1, "out"    # Ljava/io/ByteArrayOutputStream;

    .line 55
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;->flateDecodeInternal([BZLjava/io/ByteArrayOutputStream;)[B

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 2
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 41
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;->enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 42
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;->flateDecode([BLjava/io/ByteArrayOutputStream;)[B

    move-result-object v1

    .line 43
    .local v1, "res":[B
    invoke-static {v1, p3}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeStrictFilter;->decodePredictor([BLcom/itextpdf/kernel/pdf/PdfObject;)[B

    move-result-object p1

    .line 44
    return-object p1
.end method
