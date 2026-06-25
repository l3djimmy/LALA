.class public abstract Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "AbstractPdfFunction.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/function/IPdfFunction;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">",
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "TT;>;",
        "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private domain:[D

.field private final functionType:I

.field private range:[D


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 46
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 83
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    .local p1, "pdfObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;, "TT;"
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 84
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FunctionType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 85
    .local v0, "functionTypeObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    :goto_0
    iput v1, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->functionType:I

    .line 86
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 87
    .local v1, "domainObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v2, 0x0

    if-nez v1, :cond_1

    move-object v3, v2

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v3

    :goto_1
    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    .line 88
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 89
    .local v3, "rangeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v2

    :goto_2
    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    .line 90
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;I[D[D)V
    .locals 2
    .param p2, "functionType"    # I
    .param p3, "domain"    # [D
    .param p4, "range"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I[D[D)V"
        }
    .end annotation

    .line 63
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    .local p1, "pdfObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;, "TT;"
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 64
    iput p2, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->functionType:I

    .line 65
    if-eqz p3, :cond_0

    .line 66
    array-length v0, p3

    invoke-static {p3, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 69
    :cond_0
    if-eqz p4, :cond_1

    .line 70
    array-length v0, p4

    invoke-static {p4, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    .line 71
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 73
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FunctionType:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 74
    return-void
.end method

.method protected static clip([D[D)[D
    .locals 10
    .param p0, "values"    # [D
    .param p1, "limits"    # [D

    .line 313
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x2

    array-length v1, p1

    if-ne v0, v1, :cond_1

    .line 315
    array-length v0, p0

    new-array v0, v0, [D

    .line 316
    .local v0, "result":[D
    const/4 v1, 0x0

    .line 317
    .local v1, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 318
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "j":I
    .local v3, "j":I
    aget-wide v4, p1, v1

    .line 319
    .local v4, "lowerBound":D
    add-int/lit8 v1, v3, 0x1

    .end local v3    # "j":I
    .restart local v1    # "j":I
    aget-wide v6, p1, v3

    .line 321
    .local v6, "upperBound":D
    aget-wide v8, p0, v2

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v8

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v8

    aput-wide v8, v0, v2

    .line 317
    .end local v4    # "lowerBound":D
    .end local v6    # "upperBound":D
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 323
    .end local v2    # "i":I
    :cond_0
    return-object v0

    .line 313
    .end local v0    # "result":[D
    .end local v1    # "j":I
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected static convertFloatArrayToDoubleArray([F)[D
    .locals 4
    .param p0, "array"    # [F

    .line 341
    if-nez p0, :cond_0

    .line 342
    const/4 v0, 0x0

    return-object v0

    .line 344
    :cond_0
    array-length v0, p0

    new-array v0, v0, [D

    .line 345
    .local v0, "arrayDouble":[D
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 346
    aget v2, p0, v1

    float-to-double v2, v2

    aput-wide v2, v0, v1

    .line 345
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 348
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method protected static normalize([D[D)[D
    .locals 12
    .param p0, "values"    # [D
    .param p1, "limits"    # [D

    .line 327
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x2

    array-length v1, p1

    if-ne v0, v1, :cond_1

    .line 329
    array-length v0, p0

    new-array v0, v0, [D

    .line 330
    .local v0, "normal":[D
    const/4 v1, 0x0

    .line 331
    .local v1, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 332
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "j":I
    .local v3, "j":I
    aget-wide v4, p1, v1

    .line 333
    .local v4, "lowerBound":D
    const-wide/16 v6, 0x1

    add-double/2addr v6, v4

    add-int/lit8 v1, v3, 0x1

    .end local v3    # "j":I
    .restart local v1    # "j":I
    aget-wide v8, p1, v3

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    .line 335
    .local v6, "upperBound":D
    aget-wide v8, p0, v2

    sub-double/2addr v8, v4

    sub-double v10, v6, v4

    div-double/2addr v8, v10

    const-wide/16 v10, 0x0

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v8

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(DD)D

    move-result-wide v8

    aput-wide v8, v0, v2

    .line 331
    .end local v4    # "lowerBound":D
    .end local v6    # "upperBound":D
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 337
    .end local v2    # "i":I
    :cond_0
    return-object v0

    .line 327
    .end local v0    # "normal":[D
    .end local v1    # "j":I
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public calculateFromByteArray([BIIII)[B
    .locals 8
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "wordSizeInputLength"    # I
    .param p5, "wordSizeOutputLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 214
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .end local p1    # "bytes":[B
    .end local p2    # "offset":I
    .end local p3    # "length":I
    .end local p4    # "wordSizeInputLength":I
    .end local p5    # "wordSizeOutputLength":I
    .local v1, "bytes":[B
    .local v2, "offset":I
    .local v3, "length":I
    .local v4, "wordSizeInputLength":I
    .local v5, "wordSizeOutputLength":I
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->calculateFromByteArray([BIIIILcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;)[B

    move-result-object p1

    return-object p1
.end method

.method public calculateFromByteArray([BIIIILcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;)[B
    .locals 17
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "wordSizeInputLength"    # I
    .param p5, "wordSizeOutputLength"    # I
    .param p6, "inputConvertor"    # Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;
    .param p7, "outputConvertor"    # Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 236
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    move/from16 v0, p4

    int-to-double v1, v0

    const-wide/high16 v3, 0x4020000000000000L    # 8.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    .line 237
    .local v1, "bytesPerInputWord":I
    move/from16 v2, p5

    int-to-double v5, v2

    div-double/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    .line 238
    .local v3, "bytesPerOutputWord":I
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getInputSize()I

    move-result v4

    .line 239
    .local v4, "inputSize":I
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getOutputSize()I

    move-result v5

    .line 241
    .local v5, "outputSize":I
    move-object/from16 v6, p6

    .line 242
    .local v6, "actualInputConvertor":Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    if-nez v6, :cond_0

    .line 243
    invoke-static {v1, v7, v8}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;->getInputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;

    move-result-object v6

    .line 246
    :cond_0
    move-object/from16 v9, p7

    .line 247
    .local v9, "actualOutputConvertor":Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;
    if-nez v9, :cond_1

    .line 248
    invoke-static {v3, v7, v8}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;->getOutputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;

    move-result-object v9

    .line 251
    :cond_1
    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v10, p3

    invoke-interface {v6, v7, v8, v10}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;->convert([BII)[D

    move-result-object v11

    .line 252
    .local v11, "inValues":[D
    array-length v12, v11

    div-int/2addr v12, v4

    mul-int/2addr v12, v5

    new-array v12, v12, [D

    .line 253
    .local v12, "outValues":[D
    const/4 v13, 0x0

    .line 254
    .local v13, "outIndex":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    array-length v15, v11

    if-ge v14, v15, :cond_2

    .line 255
    add-int v15, v14, v4

    invoke-static {v11, v14, v15}, Ljava/util/Arrays;->copyOfRange([DII)[D

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->calculate([D)[D

    move-result-object v15

    .line 256
    .local v15, "singleRes":[D
    const/4 v0, 0x0

    move/from16 v16, v1

    .end local v1    # "bytesPerInputWord":I
    .local v16, "bytesPerInputWord":I
    array-length v1, v15

    invoke-static {v15, v0, v12, v13, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 257
    array-length v0, v15

    add-int/2addr v13, v0

    .line 254
    .end local v15    # "singleRes":[D
    add-int/2addr v14, v4

    move/from16 v0, p4

    move/from16 v1, v16

    goto :goto_0

    .line 259
    .end local v14    # "i":I
    .end local v16    # "bytesPerInputWord":I
    .restart local v1    # "bytesPerInputWord":I
    :cond_2
    invoke-interface {v9, v12}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;->convert([D)[B

    move-result-object v0

    return-object v0
.end method

.method public checkCompatibilityWithColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Z
    .locals 2
    .param p1, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 111
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getOutputSize()I

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getNumberOfComponents()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public clipInput([D)[D
    .locals 2
    .param p1, "input"    # [D

    .line 274
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    array-length v0, p1

    mul-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 277
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->clip([D[D)[D

    move-result-object v0

    return-object v0

    .line 275
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The size of the input array must be a multiple of the domain size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clipOutput([D)[D
    .locals 2
    .param p1, "input"    # [D

    .line 292
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    if-nez v0, :cond_0

    .line 293
    return-object p1

    .line 295
    :cond_0
    array-length v0, p1

    mul-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    array-length v1, v1

    if-ne v0, v1, :cond_1

    .line 299
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->clip([D[D)[D

    move-result-object v0

    return-object v0

    .line 296
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The size of the input array must be a multiple of the range size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAsPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 304
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getDomain()[D
    .locals 2

    .line 144
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    if-nez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    return-object v0

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    return-object v0
.end method

.method public getFunctionType()I
    .locals 1

    .line 99
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->functionType:I

    return v0
.end method

.method public getInputSize()I
    .locals 2

    .line 121
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getOutputSize()I
    .locals 1

    .line 131
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    :goto_0
    return v0
.end method

.method public getRange()[D
    .locals 2

    .line 174
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    return-object v0

    .line 177
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 309
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public setDomain([D)V
    .locals 4
    .param p1, "value"    # [D

    .line 160
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    .line 161
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->domain:[D

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 162
    return-void
.end method

.method public setRange([D)V
    .locals 4
    .param p1, "value"    # [D

    .line 190
    .local p0, "this":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<TT;>;"
    if-nez p1, :cond_0

    .line 191
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 192
    return-void

    .line 194
    :cond_0
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    .line 195
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->range:[D

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 196
    return-void
.end method
