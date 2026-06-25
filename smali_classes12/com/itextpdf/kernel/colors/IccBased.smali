.class public Lcom/itextpdf/kernel/colors/IccBased;
.super Lcom/itextpdf/kernel/colors/Color;
.source "IccBased.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;

    .line 43
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getNumberOfComponents()I

    move-result v0

    new-array v0, v0, [F

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/IccBased;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;[F)V

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;[F)V
    .locals 0
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;
    .param p2, "value"    # [F

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "iccStream"    # Ljava/io/InputStream;

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;-><init>(Ljava/io/InputStream;)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/colors/IccBased;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;[F)V

    .line 63
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/IccBased;->getNumberOfComponents()I

    move-result v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/IccBased;->colorValue:[F

    .line 64
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/IccBased;->getNumberOfComponents()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/itextpdf/kernel/colors/IccBased;->colorValue:[F

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 66
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[F)V
    .locals 1
    .param p1, "iccStream"    # Ljava/io/InputStream;
    .param p2, "value"    # [F

    .line 75
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/colors/IccBased;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;[F)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;[F[F)V
    .locals 2
    .param p1, "iccStream"    # Ljava/io/InputStream;
    .param p2, "range"    # [F
    .param p3, "value"    # [F

    .line 86
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;-><init>(Ljava/io/InputStream;[F)V

    invoke-direct {p0, v0, p3}, Lcom/itextpdf/kernel/colors/IccBased;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;[F)V

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/IccBased;->getNumberOfComponents()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    array-length v1, p2

    if-ne v0, v1, :cond_0

    .line 89
    return-void

    .line 88
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Invalid range array."

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method
