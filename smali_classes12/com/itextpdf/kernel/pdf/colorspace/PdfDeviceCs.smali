.class public abstract Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
.source "PdfDeviceCs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 36
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 32
    const/4 v0, 0x0

    return v0
.end method
