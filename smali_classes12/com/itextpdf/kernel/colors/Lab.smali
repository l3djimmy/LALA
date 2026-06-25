.class public Lcom/itextpdf/kernel/colors/Lab;
.super Lcom/itextpdf/kernel/colors/Color;
.source "Lab.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;

    .line 39
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;->getNumberOfComponents()I

    move-result v0

    new-array v0, v0, [F

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/Lab;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;[F)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;[F)V
    .locals 0
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;
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
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;-><init>([F)V

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 60
    return-void
.end method

.method public constructor <init>([F[F[F[F)V
    .locals 1
    .param p1, "whitePoint"    # [F
    .param p2, "blackPoint"    # [F
    .param p3, "range"    # [F
    .param p4, "value"    # [F

    .line 71
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;

    invoke-direct {v0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;-><init>([F[F[F)V

    invoke-direct {p0, v0, p4}, Lcom/itextpdf/kernel/colors/Lab;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;[F)V

    .line 72
    return-void
.end method
