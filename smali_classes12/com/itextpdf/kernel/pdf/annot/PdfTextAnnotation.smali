.class public Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfTextAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 36
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 37
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 47
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 48
    return-void
.end method


# virtual methods
.method public getIconName()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 97
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getOpen()Z
    .locals 3

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfBoolean;->TRUE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Open:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getState()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 56
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->State:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getStateModel()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StateModel:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Text:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setIconName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 115
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;

    return-object v0
.end method

.method public setOpen(Z)Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;
    .locals 2
    .param p1, "open"    # Z

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Open:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;

    return-object v0
.end method

.method public setState(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;
    .locals 1
    .param p1, "state"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 60
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->State:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;

    return-object v0
.end method

.method public setStateModel(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;
    .locals 1
    .param p1, "stateModel"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 68
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->StateModel:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;

    return-object v0
.end method
