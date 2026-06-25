.class public abstract Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfMcr.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;",
        "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;"
    }
.end annotation


# instance fields
.field protected parent:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 42
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 43
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->parent:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 44
    return-void
.end method


# virtual methods
.method public getKids()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;"
        }
    .end annotation

    .line 84
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getMcid()I
.end method

.method public getPageIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 4

    .line 57
    const/4 v0, 0x0

    .line 58
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 61
    :cond_0
    if-nez v0, :cond_1

    .line 62
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->parent:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 64
    :cond_1
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v1, :cond_2

    .line 65
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v1

    .line 66
    :cond_2
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_3

    .line 67
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    return-object v1

    .line 69
    :cond_3
    const/4 v1, 0x0

    return-object v1
.end method

.method public getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 49
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 50
    .local v0, "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_0

    .line 51
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v1

    .line 53
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->parent:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    return-object v0
.end method

.method public getRole()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->parent:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 89
    const/4 v0, 0x0

    return v0
.end method
