.class public abstract Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfPattern.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 50
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 51
    return-void
.end method

.method public static getPatternInstance(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
    .locals 3
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 60
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PatternType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 61
    .local v0, "type":Lcom/itextpdf/kernel/pdf/PdfNumber;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    instance-of v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v1, :cond_0

    .line 62
    new-instance v1, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;

    move-object v2, p0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    return-object v1

    .line 63
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 64
    new-instance v1, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 65
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "pdfObject"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 102
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 103
    return-void
.end method

.method public getMatrix()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 77
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 107
    const/4 v0, 0x1

    return v0
.end method

.method public setMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "matrix"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 89
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 90
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 91
    return-void
.end method
