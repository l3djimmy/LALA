.class public Lcom/itextpdf/kernel/colors/Separation;
.super Lcom/itextpdf/kernel/colors/Color;
.source "Separation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;

    .line 41
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/Separation;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;F)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;F)V
    .locals 2
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;
    .param p2, "value"    # F

    .line 51
    const/4 v0, 0x1

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p2, v0, v1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;F)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "alternateCs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p3, "tintTransform"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .param p4, "value"    # F

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;

    invoke-direct {v0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    invoke-direct {p0, v0, p4}, Lcom/itextpdf/kernel/colors/Separation;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;F)V

    .line 64
    return-void
.end method
