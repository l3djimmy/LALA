.class public Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
.source "PdfPopupAnnotation.java"


# instance fields
.field protected parent:Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 37
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

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
.method public getOpen()Z
    .locals 3

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfBoolean;->TRUE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Open:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->parent:Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    if-nez v0, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->getParentObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->parent:Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->parent:Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    return-object v0
.end method

.method public getParentObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 56
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Popup:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setOpen(Z)Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;
    .locals 2
    .param p1, "open"    # Z

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Open:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;

    return-object v0
.end method

.method public setParent(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;
    .locals 2
    .param p1, "parent"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 67
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->parent:Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 68
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;

    return-object v0
.end method
