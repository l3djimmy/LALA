.class public Lcom/itextpdf/kernel/colors/CalGray;
.super Lcom/itextpdf/kernel/colors/Color;
.source "CalGray.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;

    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/CalGray;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;F)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;F)V
    .locals 2
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;
    .param p2, "value"    # F

    .line 49
    const/4 v0, 0x1

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p2, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 50
    return-void
.end method

.method public constructor <init>([FF)V
    .locals 3
    .param p1, "whitePoint"    # [F
    .param p2, "value"    # F

    .line 59
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;-><init>([F)V

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p2, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 60
    return-void
.end method

.method public constructor <init>([F[FFF)V
    .locals 1
    .param p1, "whitePoint"    # [F
    .param p2, "blackPoint"    # [F
    .param p3, "gamma"    # F
    .param p4, "value"    # F

    .line 71
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;

    invoke-direct {v0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;-><init>([F[FF)V

    invoke-direct {p0, v0, p4}, Lcom/itextpdf/kernel/colors/CalGray;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;F)V

    .line 72
    return-void
.end method
