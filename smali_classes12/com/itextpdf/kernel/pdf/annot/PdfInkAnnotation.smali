.class public Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfInkAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 35
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "inkList"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 39
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 40
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->InkList:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 41
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 51
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 52
    return-void
.end method


# virtual methods
.method public getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 68
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 56
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Ink:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;
    .locals 1
    .param p1, "borderStyle"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 79
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;
    .locals 1
    .param p1, "style"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 97
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;
    .locals 1
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 109
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;

    move-result-object v0

    return-object v0
.end method
