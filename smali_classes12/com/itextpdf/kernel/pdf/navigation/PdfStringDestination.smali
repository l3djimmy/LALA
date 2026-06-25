.class public Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;
.super Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
.source "PdfStringDestination.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 38
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 34
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 35
    return-void
.end method


# virtual methods
.method public getDestinationPage(Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 43
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-interface {p1, v0}, Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;->getEntry(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 45
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 50
    const/4 v0, 0x0

    return v0
.end method
