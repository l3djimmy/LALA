.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
.source "PdfSpecialCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Pattern"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 255
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 256
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0
    .param p1, "pdfObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 259
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 260
    return-void
.end method


# virtual methods
.method public getNumberOfComponents()I
    .locals 1

    .line 264
    const/4 v0, 0x0

    return v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 269
    const/4 v0, 0x0

    return v0
.end method
