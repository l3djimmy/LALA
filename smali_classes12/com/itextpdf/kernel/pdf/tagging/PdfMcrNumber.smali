.class public Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;
.super Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
.source "PdfMcrNumber.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .param p2, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getNextMcid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getMcid()I
    .locals 1

    .line 42
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    return v0
.end method

.method public getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 47
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method
