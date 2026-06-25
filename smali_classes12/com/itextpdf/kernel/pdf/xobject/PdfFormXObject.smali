.class public Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
.super Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
.source "PdfFormXObject.java"


# instance fields
.field protected resources:Lcom/itextpdf/kernel/pdf/PdfResources;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 3
    .param p1, "bBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 56
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->XObject:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 57
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Form:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 58
    if-eqz p1, :cond_0

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 61
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 3
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 84
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getCropBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 85
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 86
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->clone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfResources;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 3
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 71
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 72
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Form:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 75
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageData;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageData;
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;->createFormXObject(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 100
    return-void
.end method

.method public static calculateBBoxMultipliedByMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 15
    .param p0, "form"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    .line 112
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 113
    .local v0, "pdfArrayBBox":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_1

    .line 116
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v1

    .line 117
    .local v1, "bBoxArray":[F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 119
    .local v2, "pdfArrayMatrix":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v2, :cond_0

    .line 120
    const/4 v3, 0x6

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    .local v3, "matrixArray":[F
    goto :goto_0

    .line 122
    .end local v3    # "matrixArray":[F
    :cond_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v3

    .line 124
    .restart local v3    # "matrixArray":[F
    :goto_0
    new-instance v4, Lcom/itextpdf/kernel/geom/Matrix;

    const/4 v11, 0x0

    aget v5, v3, v11

    const/4 v12, 0x1

    aget v6, v3, v12

    const/4 v13, 0x2

    aget v7, v3, v13

    const/4 v14, 0x3

    aget v8, v3, v14

    const/4 v9, 0x4

    aget v9, v3, v9

    const/4 v10, 0x5

    aget v10, v3, v10

    invoke-direct/range {v4 .. v10}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FFFFFF)V

    .line 125
    .local v4, "matrix":Lcom/itextpdf/kernel/geom/Matrix;
    new-instance v5, Lcom/itextpdf/kernel/geom/Vector;

    aget v6, v1, v11

    aget v7, v1, v12

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 126
    .local v5, "bBoxMin":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v6, Lcom/itextpdf/kernel/geom/Vector;

    aget v7, v1, v13

    aget v9, v1, v14

    invoke-direct {v6, v7, v9, v8}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 128
    .local v6, "bBoxMax":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v5, v4}, Lcom/itextpdf/kernel/geom/Vector;->cross(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v7

    .line 129
    .local v7, "bBoxMinByMatrix":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v6, v4}, Lcom/itextpdf/kernel/geom/Vector;->cross(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v8

    .line 130
    .local v8, "bBoxMaxByMatrix":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v8, v11}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    invoke-virtual {v7, v11}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v10

    sub-float/2addr v9, v10

    .line 131
    .local v9, "width":F
    invoke-virtual {v8, v12}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v10

    invoke-virtual {v7, v12}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v13

    sub-float/2addr v10, v13

    .line 133
    .local v10, "height":F
    new-instance v13, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v7, v11}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v11

    invoke-virtual {v7, v12}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v12

    invoke-direct {v13, v11, v12, v9, v10}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v13

    .line 114
    .end local v1    # "bBoxArray":[F
    .end local v2    # "pdfArrayMatrix":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v3    # "matrixArray":[F
    .end local v4    # "matrix":Lcom/itextpdf/kernel/geom/Matrix;
    .end local v5    # "bBoxMin":Lcom/itextpdf/kernel/geom/Vector;
    .end local v6    # "bBoxMax":Lcom/itextpdf/kernel/geom/Vector;
    .end local v7    # "bBoxMinByMatrix":Lcom/itextpdf/kernel/geom/Vector;
    .end local v8    # "bBoxMaxByMatrix":Lcom/itextpdf/kernel/geom/Vector;
    .end local v9    # "width":F
    .end local v10    # "height":F
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfFormXObject has invalid BBox."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

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


# virtual methods
.method public flush()V
    .locals 2

    .line 215
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 216
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 219
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->flush()V

    .line 220
    return-void

    .line 217
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Form XObject must have BBox."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 160
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()F
    .locals 3

    .line 203
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    :goto_0
    return v0
.end method

.method public getMarkStyle()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 329
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MarkStyle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getProcessColorModel()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 244
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PCM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Lcom/itextpdf/kernel/pdf/PdfResources;
    .locals 3

    .line 143
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    if-nez v0, :cond_1

    .line 144
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 145
    .local v0, "resourcesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 146
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 147
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 149
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfResources;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 151
    .end local v0    # "resourcesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    return-object v0
.end method

.method public getSeparationColorNames()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 264
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SeparationColorNames:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getTrapRegions()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 287
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TrapRegions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getTrapStyles()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 308
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TrapStyles:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()F
    .locals 3

    .line 193
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getBBox()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    :goto_0
    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 341
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 342
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 343
    return-object p0
.end method

.method public setBBox(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "bBox"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 170
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method

.method public setGroup(Lcom/itextpdf/kernel/pdf/xobject/PdfTransparencyGroup;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 2
    .param p1, "transparency"    # Lcom/itextpdf/kernel/pdf/xobject/PdfTransparencyGroup;

    .line 183
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Group:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfTransparencyGroup;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method

.method public setMarkStyle(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "markStyle"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 320
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->MarkStyle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method

.method public setProcessColorModel(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "model"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 233
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PCM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method

.method public setSeparationColorNames(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "colorNames"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 255
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->SeparationColorNames:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method

.method public setTrapRegions(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "regions"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 276
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TrapRegions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method

.method public setTrapStyles(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1
    .param p1, "trapStyles"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 298
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TrapStyles:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    return-object v0
.end method
