.class public Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
.source "PdfWatermarkAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 34
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 35
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 45
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 46
    return-void
.end method


# virtual methods
.method public getFixedPrint()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 58
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FixedPrint:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Watermark:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setFixedPrint(Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;)Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;
    .locals 2
    .param p1, "fixedPrint"    # Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FixedPrint:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;

    return-object v0
.end method
