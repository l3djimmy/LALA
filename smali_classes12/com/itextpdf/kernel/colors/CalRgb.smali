.class public Lcom/itextpdf/kernel/colors/CalRgb;
.super Lcom/itextpdf/kernel/colors/Color;
.source "CalRgb.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;

    .line 39
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;->getNumberOfComponents()I

    move-result v0

    new-array v0, v0, [F

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/CalRgb;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;[F)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;[F)V
    .locals 0
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;
    .param p2, "value"    # [F

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 50
    return-void
.end method

.method public constructor <init>([F[F)V
    .locals 1
    .param p1, "whitePoint"    # [F
    .param p2, "value"    # [F

    .line 59
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;-><init>([F)V

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 60
    return-void
.end method

.method public constructor <init>([F[F[F[F[F)V
    .locals 1
    .param p1, "whitePoint"    # [F
    .param p2, "blackPoint"    # [F
    .param p3, "gamma"    # [F
    .param p4, "matrix"    # [F
    .param p5, "value"    # [F

    .line 72
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;-><init>([F[F[F[F)V

    invoke-direct {p0, v0, p5}, Lcom/itextpdf/kernel/colors/CalRgb;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;[F)V

    .line 73
    return-void
.end method
