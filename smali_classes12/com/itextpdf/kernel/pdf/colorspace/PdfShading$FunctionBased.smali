.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;
.source "PdfShading.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FunctionBased"
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 233
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 234
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V
    .locals 3
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "function"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    .line 253
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    const/4 v1, 0x1

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V

    .line 255
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->setFunction(Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    .line 256
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V
    .locals 1
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "function"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    .line 243
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    .line 244
    return-void
.end method


# virtual methods
.method public getDomain()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 265
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getMatrix()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 3

    .line 299
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 300
    .local v0, "matrix":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 301
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v2, 0x6

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    move-object v0, v1

    .line 302
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->setMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 304
    :cond_0
    return-object v0

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data
.end method

.method public setDomain(FFFF)V
    .locals 3
    .param p1, "xmin"    # F
    .param p2, "xmax"    # F
    .param p3, "ymin"    # F
    .param p4, "ymax"    # F

    .line 278
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x4

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    const/4 v2, 0x2

    aput p3, v1, v2

    const/4 v2, 0x3

    aput p4, v1, v2

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->setDomain(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 279
    return-void
.end method

.method public setDomain(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "domain"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 288
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 289
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 290
    return-void
.end method

.method public setMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "matrix"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 324
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 325
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 326
    return-void
.end method

.method public setMatrix([F)V
    .locals 1
    .param p1, "matrix"    # [F

    .line 314
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$FunctionBased;->setMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 315
    return-void
.end method
