.class public Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfFixedPrint.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 39
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 40
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FixedPrint:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 41
    return-void
.end method


# virtual methods
.method public getHorizontalTranslation()Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 2

    .line 68
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    return-object v0
.end method

.method public getMatrix()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getVerticalTranslation()Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 2

    .line 72
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 77
    const/4 v0, 0x1

    return v0
.end method

.method public setHorizontalTranslation(F)Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;
    .locals 5
    .param p1, "horizontal"    # F

    .line 54
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 55
    return-object p0
.end method

.method public setMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;
    .locals 2
    .param p1, "matrix"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 45
    return-object p0
.end method

.method public setMatrix([F)Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;
    .locals 3
    .param p1, "matrix"    # [F

    .line 49
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 50
    return-object p0
.end method

.method public setVerticalTranslation(F)Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;
    .locals 5
    .param p1, "vertical"    # F

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFixedPrint;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 60
    return-object p0
.end method
