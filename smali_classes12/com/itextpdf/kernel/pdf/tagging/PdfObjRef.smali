.class public Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
.super Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
.source "PdfObjRef.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;I)V
    .locals 3
    .param p1, "annot"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p3, "nextStructParentIndex"    # I

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 39
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 40
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 42
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 43
    .local v0, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OBJR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 44
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Obj:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 45
    return-void
.end method


# virtual methods
.method public getMcid()I
    .locals 1

    .line 49
    const/4 v0, -0x1

    return v0
.end method

.method public getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 54
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getReferencedObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 58
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Obj:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method
