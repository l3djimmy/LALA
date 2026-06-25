.class public abstract Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
.source "PdfSpecialCs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$NChannel;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 44
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 45
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 56
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->flush()V

    .line 57
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 61
    const/4 v0, 0x1

    return v0
.end method
