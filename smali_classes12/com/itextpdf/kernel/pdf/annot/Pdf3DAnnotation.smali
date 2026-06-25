.class public Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
.source "Pdf3DAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "artwork"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 47
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 48
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->_3DD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 59
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 60
    return-void
.end method


# virtual methods
.method public getActivationDictionary()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 111
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->_3DA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultInitialView()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->_3DV:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->_3D:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public getViewBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 165
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->_3DB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method public isInteractive()Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .locals 2

    .line 140
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->_3DI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    return-object v0
.end method

.method public setActivationDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;
    .locals 1
    .param p1, "activationDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 100
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->_3DA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;

    return-object v0
.end method

.method public setDefaultInitialView(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;
    .locals 1
    .param p1, "initialView"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 78
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->_3DV:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;

    return-object v0
.end method

.method public setInteractive(Z)Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;
    .locals 2
    .param p1, "interactive"    # Z

    .line 131
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->_3DI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;

    return-object v0
.end method

.method public setViewBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;
    .locals 2
    .param p1, "viewBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 156
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->_3DB:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;

    return-object v0
.end method
