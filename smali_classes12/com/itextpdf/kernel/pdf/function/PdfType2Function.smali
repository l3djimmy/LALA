.class public Lcom/itextpdf/kernel/pdf/function/PdfType2Function;
.super Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;
.source "PdfType2Function.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# instance fields
.field private c0:[D

.field private c1:[D

.field private n:D


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 8
    .param p1, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 52
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 55
    .local v0, "nObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_7

    .line 58
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v1

    iput-wide v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    .line 60
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getDomain()[D

    move-result-object v1

    array-length v1, v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_6

    .line 64
    iget-wide v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    cmpl-double v1, v3, v5

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    if-eqz v1, :cond_1

    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getDomain()[D

    move-result-object v1

    aget-wide v6, v1, v3

    cmpg-double v1, v6, v4

    if-ltz v1, :cond_0

    goto :goto_0

    .line 65
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid PDF Type 2 Function object, when \"N\" is not an integer, values of \"Domain\" shall define the input value as non-negative."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 67
    :cond_1
    :goto_0
    iget-wide v6, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    cmpg-double v1, v6, v4

    if-gez v1, :cond_3

    const/4 v1, 0x1

    new-array v1, v1, [D

    aput-wide v4, v1, v3

    invoke-super {p0, v1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->clipInput([D)[D

    move-result-object v1

    aget-wide v6, v1, v3

    cmpl-double v1, v6, v4

    if-eqz v1, :cond_2

    goto :goto_1

    .line 68
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid PDF Type 2 Function object, when \"N\" is negative, values of \"Domain\" shall not allow zero as input value."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_3
    :goto_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C0:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 72
    .local v1, "c0Obj":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->C1:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 73
    .local v3, "c1Obj":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v6

    .line 74
    .local v6, "rangeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-static {v1, v3, v6, v4, v5}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->initializeCArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;D)[D

    move-result-object v4

    iput-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    .line 75
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    invoke-static {v3, v1, v6, v4, v5}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->initializeCArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;D)[D

    move-result-object v4

    iput-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c1:[D

    .line 77
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    array-length v4, v4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c1:[D

    array-length v5, v5

    if-ne v4, v5, :cond_5

    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    array-length v4, v4

    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v5

    array-length v5, v5

    div-int/2addr v5, v2

    if-ne v4, v5, :cond_5

    .line 80
    :cond_4
    return-void

    .line 78
    :cond_5
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Invalid PDF Type 2 Function object, if present the size of \"C0\", \"C1\" and half \"Range\" shall be equal."

    invoke-direct {v2, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 61
    .end local v1    # "c0Obj":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v3    # "c1Obj":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v6    # "rangeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_6
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid PDF Type 2 Function object, \"Domain\" array shall consist of 2 numbers."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 56
    :cond_7
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid PDF Type 2 Function object, \"N\" field should exist and must be a number."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>([D[D[D[DD)V
    .locals 2
    .param p1, "domain"    # [D
    .param p2, "range"    # [D
    .param p3, "c0"    # [D
    .param p4, "c1"    # [D
    .param p5, "n"    # D

    .line 83
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;I[D[D)V

    .line 84
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->setC0([D)V

    .line 85
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->setC1([D)V

    .line 86
    invoke-virtual {p0, p5, p6}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->setN(D)V

    .line 87
    return-void
.end method

.method public constructor <init>([F[F[F[FD)V
    .locals 7
    .param p1, "domain"    # [F
    .param p2, "range"    # [F
    .param p3, "c0"    # [F
    .param p4, "c1"    # [F
    .param p5, "n"    # D

    .line 90
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v1

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v2

    .line 91
    invoke-static {p3}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v3

    invoke-static {p4}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v4

    .line 90
    move-object v0, p0

    move-wide v5, p5

    .end local p5    # "n":D
    .local v5, "n":D
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;-><init>([D[D[D[DD)V

    .line 92
    return-void
.end method

.method private static initializeCArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;D)[D
    .locals 3
    .param p0, "c"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p1, "otherC"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "range"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p3, "defaultValue"    # D

    .line 181
    if-eqz p0, :cond_0

    .line 182
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v0

    return-object v0

    .line 186
    :cond_0
    if-nez p1, :cond_2

    .line 187
    if-nez p2, :cond_1

    .line 188
    const/4 v0, 0x1

    new-array v0, v0, [D

    .local v0, "result":[D
    goto :goto_0

    .line 190
    .end local v0    # "result":[D
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [D

    .restart local v0    # "result":[D
    goto :goto_0

    .line 193
    .end local v0    # "result":[D
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    new-array v0, v0, [D

    .line 196
    .restart local v0    # "result":[D
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 197
    aput-wide p3, v0, v1

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 199
    .end local v1    # "i":I
    :cond_3
    return-object v0
.end method


# virtual methods
.method public calculate([D)[D
    .locals 17
    .param p1, "input"    # [D

    .line 96
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_1

    array-length v2, v1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 99
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->clipInput([D)[D

    move-result-object v2

    .line 100
    .local v2, "clipped":[D
    const/4 v3, 0x0

    aget-wide v3, v2, v3

    .line 101
    .local v3, "x":D
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->getOutputSize()I

    move-result v5

    .line 102
    .local v5, "outputSize":I
    new-array v6, v5, [D

    .line 103
    .local v6, "output":[D
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v5, :cond_0

    .line 104
    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    aget-wide v9, v8, v7

    iget-wide v11, v0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c1:[D

    aget-wide v13, v8, v7

    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    aget-wide v15, v8, v7

    sub-double/2addr v13, v15

    mul-double/2addr v11, v13

    add-double/2addr v9, v11

    aput-wide v9, v6, v7

    .line 103
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 107
    .end local v7    # "i":I
    :cond_0
    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->clipOutput([D)[D

    move-result-object v7

    return-object v7

    .line 97
    .end local v2    # "clipped":[D
    .end local v3    # "x":D
    .end local v5    # "outputSize":I
    .end local v6    # "output":[D
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Invalid input value for PDF Type 2 Function, value should be a single number."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final getC0()[D
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    return-object v0
.end method

.method public final getC1()[D
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c1:[D

    return-object v0
.end method

.method public final getN()D
    .locals 2

    .line 167
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    return-wide v0
.end method

.method public final getOutputSize()I
    .locals 1

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->getRange()[D

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    array-length v0, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->getRange()[D

    move-result-object v0

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    :goto_0
    return v0
.end method

.method public final setC0([D)V
    .locals 3
    .param p1, "value"    # [D

    .line 138
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C0:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 139
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c0:[D

    .line 140
    return-void
.end method

.method public final setC1([D)V
    .locals 3
    .param p1, "value"    # [D

    .line 157
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C1:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 158
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->c1:[D

    .line 159
    return-void
.end method

.method public final setN(D)V
    .locals 3
    .param p1, "value"    # D

    .line 176
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 177
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;->n:D

    .line 178
    return-void
.end method
