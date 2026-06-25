.class public Lcom/itextpdf/kernel/colors/Indexed;
.super Lcom/itextpdf/kernel/colors/Color;
.source "Indexed.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V
    .locals 1
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/Indexed;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;I)V
    .locals 3
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "colorValue"    # I

    .line 48
    int-to-float v0, p2

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput v0, v1, v2

    invoke-direct {p0, p1, v1}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 49
    return-void
.end method
