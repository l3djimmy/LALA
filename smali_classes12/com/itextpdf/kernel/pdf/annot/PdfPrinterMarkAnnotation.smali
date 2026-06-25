.class public Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
.source "PdfPrinterMarkAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)V
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "appearanceStream"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    .line 35
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 36
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;->setNormalAppearance(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 37
    const/16 v0, 0x44

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;->setFlags(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 38
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 48
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 49
    return-void
.end method


# virtual methods
.method public getArbitraryTypeName()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 60
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MN:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PrinterMark:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setArbitraryTypeName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
    .locals 1
    .param p1, "arbitraryTypeName"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 56
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->MN:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;

    return-object v0
.end method
