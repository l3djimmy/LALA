.class public Lcom/itextpdf/kernel/pdf/navigation/PdfNamedDestination;
.super Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
.source "PdfNamedDestination.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 38
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 34
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfNamedDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 35
    return-void
.end method


# virtual methods
.method public getDestinationPage(Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p1, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 43
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfNamedDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 44
    .local v0, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;->getEntry(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 45
    .local v1, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return-object v2
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 50
    const/4 v0, 0x0

    return v0
.end method
