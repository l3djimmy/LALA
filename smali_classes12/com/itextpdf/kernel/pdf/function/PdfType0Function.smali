.class public Lcom/itextpdf/kernel/pdf/function/PdfType0Function;
.super Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;
.source "PdfType0Function.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
        "Lcom/itextpdf/kernel/pdf/PdfStream;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private bitsPerSample:I

.field private decode:[D

.field private decodeLimit:J

.field private derivatives:[[D

.field private encode:[I

.field private errorMessage:Ljava/lang/String;

.field private isValidated:Z

.field private order:I

.field private outputDimension:I

.field private sampleExtractor:Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;

.field private samples:[B

.field private size:[I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 11
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 57
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->sampleExtractor:Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;

    .line 51
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 52
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->errorMessage:Ljava/lang/String;

    .line 54
    move-object v2, v0

    check-cast v2, [[D

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 60
    .local v0, "sizeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getDomain()[D

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v2

    if-eqz v2, :cond_4

    if-nez v0, :cond_0

    goto :goto_4

    .line 65
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toIntArray()[I

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    .line 67
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    .line 68
    .local v2, "orderObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v3, 0x1

    if-nez v2, :cond_1

    move v4, v3

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    :goto_0
    iput v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    .line 70
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    .line 71
    .local v4, "encodeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->initializeEncoding(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 73
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    .line 74
    .local v5, "decodeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v5, :cond_2

    .line 75
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v6

    iput-object v6, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    goto :goto_1

    .line 77
    :cond_2
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v6

    iput-object v6, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    .line 79
    :goto_1
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v6

    array-length v6, v6

    shr-int/2addr v6, v3

    iput v6, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    .line 81
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerSample:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    .line 82
    .local v6, "bitsPerSampleObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v6, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    :goto_2
    iput v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->bitsPerSample:I

    .line 84
    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->bitsPerSample:I

    const-wide/16 v7, 0x1

    shl-long v9, v7, v1

    sub-long/2addr v9, v7

    iput-wide v9, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decodeLimit:J

    .line 85
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->samples:[B

    .line 87
    :try_start_0
    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->bitsPerSample:I

    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;->createExtractor(I)Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->sampleExtractor:Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    goto :goto_3

    .line 88
    :catch_0
    move-exception v1

    .line 89
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 93
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_3
    return-void

    .line 61
    .end local v2    # "orderObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v4    # "encodeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "decodeObj":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v6    # "bitsPerSampleObj":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_4
    :goto_4
    const-string v1, "Domain, range and size must be not null"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public constructor <init>([D[I[DII[B)V
    .locals 9
    .param p1, "domain"    # [D
    .param p2, "size"    # [I
    .param p3, "range"    # [D
    .param p4, "order"    # I
    .param p5, "bitsPerSample"    # I
    .param p6, "samples"    # [B

    .line 96
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v7, p5

    move-object v8, p6

    .end local p1    # "domain":[D
    .end local p2    # "size":[I
    .end local p3    # "range":[D
    .end local p4    # "order":I
    .end local p5    # "bitsPerSample":I
    .end local p6    # "samples":[B
    .local v1, "domain":[D
    .local v2, "size":[I
    .local v3, "range":[D
    .local v4, "order":I
    .local v7, "bitsPerSample":I
    .local v8, "samples":[B
    invoke-direct/range {v0 .. v8}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;-><init>([D[I[DI[I[DI[B)V

    .line 97
    return-void
.end method

.method public constructor <init>([D[I[DI[I[DI[B)V
    .locals 4
    .param p1, "domain"    # [D
    .param p2, "size"    # [I
    .param p3, "range"    # [D
    .param p4, "order"    # I
    .param p5, "encode"    # [I
    .param p6, "decode"    # [D
    .param p7, "bitsPerSample"    # I
    .param p8, "samples"    # [B

    .line 106
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0, p8}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p3}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;I[D[D)V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->sampleExtractor:Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;

    .line 51
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 52
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->errorMessage:Ljava/lang/String;

    .line 54
    move-object v1, v0

    check-cast v1, [[D

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    .line 107
    if-eqz p2, :cond_0

    .line 108
    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    .line 111
    :cond_0
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getDomain()[D

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v0

    if-eqz v0, :cond_4

    if-nez p2, :cond_1

    goto/16 :goto_2

    .line 116
    :cond_1
    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    .line 117
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 119
    iput p4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    .line 120
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 122
    invoke-direct {p0, p5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->initializeEncoding([I)V

    .line 123
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 125
    if-nez p6, :cond_2

    .line 126
    array-length v0, p3

    invoke-static {p3, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    goto :goto_0

    .line 128
    :cond_2
    array-length v0, p6

    invoke-static {p6, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    .line 130
    :goto_0
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 132
    iput p7, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->bitsPerSample:I

    .line 133
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerSample:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 135
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v0

    array-length v0, v0

    shr-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    .line 136
    const-wide/16 v0, 0x1

    shl-long v2, v0, p7

    sub-long/2addr v2, v0

    iput-wide v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decodeLimit:J

    .line 137
    array-length v0, p8

    invoke-static {p8, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->samples:[B

    .line 139
    :try_start_0
    invoke-static {p7}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;->createExtractor(I)Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->sampleExtractor:Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    goto :goto_1

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 143
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isInvalid()Z

    move-result v0

    if-nez v0, :cond_3

    .line 146
    return-void

    .line 144
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->errorMessage:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_4
    :goto_2
    const-string v0, "Domain, range and size must be not null"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method public constructor <init>([F[I[FII[B)V
    .locals 7
    .param p1, "domain"    # [F
    .param p2, "size"    # [I
    .param p3, "range"    # [F
    .param p4, "order"    # I
    .param p5, "bitsPerSample"    # I
    .param p6, "samples"    # [B

    .line 100
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v1

    invoke-static {p3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v3

    move-object v0, p0

    move-object v2, p2

    move v4, p4

    move v5, p5

    move-object v6, p6

    .end local p2    # "size":[I
    .end local p4    # "order":I
    .end local p5    # "bitsPerSample":I
    .end local p6    # "samples":[B
    .local v2, "size":[I
    .local v4, "order":I
    .local v5, "bitsPerSample":I
    .local v6, "samples":[B
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;-><init>([D[I[DII[B)V

    .line 102
    return-void
.end method

.method private static calculateCubicInterpolationFormula(DDDDD)D
    .locals 10
    .param p0, "x"    # D
    .param p2, "f0"    # D
    .param p4, "f1"    # D
    .param p6, "f2"    # D
    .param p8, "f3"    # D

    .line 621
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v0, p0

    sub-double v2, p6, p2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    mul-double/2addr v4, p2

    const-wide/high16 v6, 0x4014000000000000L    # 5.0

    mul-double/2addr v6, p4

    sub-double/2addr v4, v6

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    mul-double v6, v6, p6

    add-double/2addr v4, v6

    sub-double v4, v4, p8

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    sub-double v8, p4, p6

    mul-double/2addr v8, v6

    add-double v8, v8, p8

    sub-double/2addr v8, p2

    mul-double/2addr v8, p0

    add-double/2addr v4, v8

    mul-double/2addr v4, p0

    add-double/2addr v2, v4

    mul-double/2addr v0, v2

    add-double/2addr v0, p4

    return-wide v0
.end method

.method private static calculateCubicSplineFormula(DDDDD)D
    .locals 10
    .param p0, "x"    # D
    .param p2, "f0"    # D
    .param p4, "f1"    # D
    .param p6, "d0"    # D
    .param p8, "d1"    # D

    .line 637
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double v2, v0, p0

    .line 638
    .local v2, "y":D
    mul-double v4, p4, p0

    mul-double v6, p2, v2

    add-double/2addr v4, v6

    mul-double v6, p0, v2

    add-double v8, v2, v0

    mul-double v8, v8, p6

    add-double/2addr v0, p0

    mul-double v0, v0, p8

    add-double/2addr v8, v0

    mul-double/2addr v6, v8

    const-wide/high16 v0, 0x4018000000000000L    # 6.0

    div-double/2addr v6, v0

    sub-double/2addr v4, v6

    return-wide v4
.end method

.method private calculateCubicSplineFormula(DI)[D
    .locals 14
    .param p1, "x"    # D
    .param p3, "position"    # I

    .line 462
    move/from16 v0, p3

    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    new-array v1, v1, [D

    .line 463
    .local v1, "result":[D
    const/4 v2, 0x0

    .local v2, "dim":I
    :goto_0
    iget v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    if-ge v2, v3, :cond_0

    .line 464
    nop

    .line 465
    invoke-direct {p0, v2, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v6

    add-int/lit8 v3, v0, 0x1

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v8

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    aget-object v3, v3, v2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    sub-int v4, v0, v4

    aget-wide v10, v3, v4

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    aget-object v3, v3, v2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v4, v4, v5

    sub-int v4, v0, v4

    add-int/lit8 v4, v4, 0x1

    aget-wide v12, v3, v4

    .line 464
    move-wide v4, p1

    invoke-static/range {v4 .. v13}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->calculateCubicSplineFormula(DDDDD)D

    move-result-wide v6

    aput-wide v6, v1, v2

    .line 463
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 468
    .end local v2    # "dim":I
    :cond_0
    return-object v1
.end method

.method private static calculateLinearInterpolationFormula(DDD)D
    .locals 4
    .param p0, "x"    # D
    .param p2, "f0"    # D
    .param p4, "f1"    # D

    .line 606
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p0

    mul-double/2addr v0, p2

    mul-double v2, p0, p4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method private calculateSecondDerivatives()V
    .locals 12

    .line 475
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    new-array v0, v0, [[D

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    .line 476
    const/4 v0, 0x0

    .local v0, "dim":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    if-ge v0, v1, :cond_1

    .line 477
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    sub-int/2addr v1, v3

    sub-int/2addr v1, v2

    new-array v1, v1, [D

    .line 478
    .local v1, "f":[D
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v3, v3, v4

    .local v3, "pos":I
    :goto_1
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v5, v5, v2

    sub-int/2addr v5, v2

    if-ge v3, v5, :cond_0

    .line 479
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v5, v5, v4

    sub-int v5, v3, v5

    invoke-direct {p0, v0, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v6

    add-int/lit8 v8, v3, 0x1

    invoke-direct {p0, v0, v8}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v8

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    mul-double/2addr v8, v10

    sub-double/2addr v6, v8

    add-int/lit8 v8, v3, 0x2

    invoke-direct {p0, v0, v8}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v8

    add-double/2addr v6, v8

    const-wide/high16 v8, 0x4018000000000000L    # 6.0

    mul-double/2addr v6, v8

    aput-wide v6, v1, v5

    .line 478
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 481
    .end local v3    # "pos":I
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->specialSweepMethod([D)[D

    move-result-object v3

    aput-object v3, v2, v0

    .line 476
    .end local v1    # "f":[D
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 483
    .end local v0    # "dim":I
    :cond_1
    return-void
.end method

.method private decode(JI)D
    .locals 8
    .param p1, "x"    # J
    .param p3, "dim"    # I

    .line 529
    shl-int/lit8 v0, p3, 0x1

    .line 530
    .local v0, "index":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    aget-wide v2, v1, v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    add-int/lit8 v4, v0, 0x1

    aget-wide v4, v1, v4

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    aget-wide v6, v1, v0

    sub-double/2addr v4, v6

    long-to-double v6, p1

    mul-double/2addr v4, v6

    iget-wide v6, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decodeLimit:J

    long-to-double v6, v6

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    return-wide v2
.end method

.method static encode(DII)D
    .locals 4
    .param p0, "normal"    # D
    .param p2, "encodeMin"    # I
    .param p3, "encodeMax"    # I

    .line 235
    int-to-double v0, p2

    sub-int v2, p3, p2

    int-to-double v2, v2

    mul-double/2addr v2, p0

    add-double/2addr v0, v2

    return-wide v0
.end method

.method private getDefaultEncoding()[I
    .locals 9

    .line 368
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    new-array v0, v0, [I

    .line 369
    .local v0, "result":[I
    const/4 v1, 0x0

    .line 370
    .local v1, "i":I
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_0

    aget v6, v2, v5

    .line 371
    .local v6, "sizeItem":I
    add-int/lit8 v7, v1, 0x1

    .end local v1    # "i":I
    .local v7, "i":I
    aput v4, v0, v1

    .line 372
    add-int/lit8 v1, v7, 0x1

    .end local v7    # "i":I
    .restart local v1    # "i":I
    add-int/lit8 v8, v6, -0x1

    aput v8, v0, v7

    .line 370
    .end local v6    # "sizeItem":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 374
    :cond_0
    return-object v0
.end method

.method static getFloor([D[I)[I
    .locals 7
    .param p0, "normal"    # [D
    .param p1, "encode"    # [I

    .line 247
    array-length v0, p0

    new-array v0, v0, [I

    .line 248
    .local v0, "result":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 249
    shl-int/lit8 v2, v1, 0x1

    .line 250
    .local v2, "j":I
    aget-wide v3, p0, v1

    aget v5, p1, v2

    add-int/lit8 v6, v2, 0x1

    aget v6, p1, v6

    invoke-static {v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode(DII)D

    move-result-wide v3

    double-to-int v3, v3

    .line 252
    .local v3, "floor":I
    add-int/lit8 v4, v2, 0x1

    aget v4, p1, v4

    add-int/lit8 v4, v4, -0x1

    const/4 v5, 0x0

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    aput v4, v0, v1

    .line 248
    .end local v2    # "j":I
    .end local v3    # "floor":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 254
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method static getFloorWeight(DII)D
    .locals 4
    .param p0, "normal"    # D
    .param p2, "encodeMin"    # I
    .param p3, "encodeMax"    # I

    .line 301
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode(DII)D

    move-result-wide v0

    .line 302
    .local v0, "value":D
    add-int/lit8 v2, p3, -0x1

    double-to-int v3, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-double v2, v2

    sub-double v2, v0, v2

    return-wide v2
.end method

.method static getFloorWeights([D[I)[D
    .locals 6
    .param p0, "normal"    # [D
    .param p1, "encode"    # [I

    .line 283
    array-length v0, p0

    new-array v0, v0, [D

    .line 284
    .local v0, "result":[D
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 285
    aget-wide v2, p0, v1

    mul-int/lit8 v4, v1, 0x2

    aget v4, p1, v4

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x1

    aget v5, p1, v5

    invoke-static {v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getFloorWeight(DII)D

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 284
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 287
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method private getInputDimensionSteps()[I
    .locals 5

    .line 512
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v0, v0

    new-array v0, v0, [I

    .line 513
    .local v0, "steps":[I
    const/4 v1, 0x0

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 514
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 515
    add-int/lit8 v2, v1, -0x1

    aget v2, v0, v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    add-int/lit8 v4, v1, -0x1

    aget v3, v3, v4

    mul-int/2addr v2, v3

    aput v2, v0, v1

    .line 514
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 517
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method static getSamplePosition([I[I)I
    .locals 4
    .param p0, "sample"    # [I
    .param p1, "size"    # [I

    .line 266
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    aget v0, p0, v0

    .line 267
    .local v0, "position":I
    array-length v1, p1

    add-int/lit8 v1, v1, -0x2

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 268
    aget v2, p0, v1

    aget v3, p1, v1

    mul-int/2addr v3, v0

    add-int v0, v2, v3

    .line 267
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 270
    .end local v1    # "i":I
    :cond_0
    return v0
.end method

.method private getValue(II)D
    .locals 3
    .param p1, "dim"    # I
    .param p2, "pos"    # I

    .line 503
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->sampleExtractor:Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->samples:[B

    iget v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    mul-int/2addr v2, p2

    add-int/2addr v2, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;->extract([BI)J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode(JI)D

    move-result-wide v0

    return-wide v0
.end method

.method private initializeEncoding(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 7
    .param p1, "encodeObj"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 342
    if-nez p1, :cond_0

    .line 343
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDefaultEncoding()[I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    goto :goto_1

    .line 345
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->toIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    .line 346
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 347
    shl-int/lit8 v1, v0, 0x1

    .line 348
    .local v1, "j":I
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v3, v3, v1

    const/4 v4, 0x0

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v2, v1

    .line 349
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    aget v4, v4, v0

    add-int/lit8 v4, v4, -0x1

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v6, v1, 0x1

    aget v5, v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    aput v4, v2, v3

    .line 346
    .end local v1    # "j":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 352
    .end local v0    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method private initializeEncoding([I)V
    .locals 6
    .param p1, "encode"    # [I

    .line 355
    if-nez p1, :cond_0

    .line 356
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDefaultEncoding()[I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    goto :goto_1

    .line 358
    :cond_0
    array-length v0, p1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    .line 359
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 360
    shl-int/lit8 v1, v0, 0x1

    .line 361
    .local v1, "j":I
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v3, 0x0

    aget v4, p1, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v2, v1

    .line 362
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    aget v4, v4, v0

    add-int/lit8 v4, v4, -0x1

    add-int/lit8 v5, v1, 0x1

    aget v5, p1, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    aput v4, v2, v3

    .line 359
    .end local v1    # "j":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 365
    .end local v0    # "i":I
    :cond_1
    :goto_1
    return-void
.end method

.method private interpolate([D[I)[D
    .locals 10
    .param p1, "normal"    # [D
    .param p2, "floor"    # [I

    .line 378
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    invoke-static {p2, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getSamplePosition([I[I)I

    move-result v3

    .line 379
    .local v3, "floorPosition":I
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getFloorWeights([D[I)[D

    move-result-object v2

    .line 380
    .local v2, "x":[D
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getInputDimensionSteps()[I

    move-result-object v4

    .line 381
    .local v4, "steps":[I
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    new-array v0, v0, [D

    .line 382
    .local v0, "result":[D
    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    packed-switch v1, :pswitch_data_0

    .line 394
    :pswitch_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Order must be equal to 1 or 3"

    invoke-direct {v1, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 389
    :pswitch_1
    const/4 v1, 0x0

    move v7, v1

    .local v7, "dim":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    if-ge v7, v1, :cond_0

    .line 390
    array-length v6, v4

    move-object v1, p0

    move-object v5, v4

    move v4, v3

    move-object v3, p2

    .end local p2    # "floor":[I
    .local v3, "floor":[I
    .local v4, "floorPosition":I
    .local v5, "steps":[I
    invoke-direct/range {v1 .. v7}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder3([D[II[III)D

    move-result-wide v8

    move v3, v4

    move-object v4, v5

    .end local v5    # "steps":[I
    .local v3, "floorPosition":I
    .local v4, "steps":[I
    .restart local p2    # "floor":[I
    aput-wide v8, v0, v7

    .line 389
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 392
    .end local v7    # "dim":I
    :cond_0
    return-object v0

    .line 384
    :pswitch_2
    const/4 v1, 0x0

    move v6, v1

    .local v6, "dim":I
    :goto_1
    iget v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    if-ge v6, v1, :cond_1

    .line 385
    array-length v5, v4

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder1([DI[III)D

    move-result-wide v7

    aput-wide v7, v0, v6

    .line 384
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 387
    .end local v6    # "dim":I
    :cond_1
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private interpolateByCubicSpline(DI)[D
    .locals 3
    .param p1, "normal"    # D
    .param p3, "position"    # I

    .line 453
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->derivatives:[[D

    if-nez v0, :cond_0

    .line 454
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->calculateSecondDerivatives()V

    .line 457
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-static {p1, p2, v0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getFloorWeight(DII)D

    move-result-wide v0

    .line 458
    .local v0, "x":D
    invoke-direct {p0, v0, v1, p3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->calculateCubicSplineFormula(DI)[D

    move-result-object v2

    return-object v2
.end method

.method private interpolateOrder1([DI[III)D
    .locals 14
    .param p1, "x"    # [D
    .param p2, "floorPosition"    # I
    .param p3, "steps"    # [I
    .param p4, "inDim"    # I
    .param p5, "outDim"    # I

    .line 399
    move/from16 v2, p2

    if-nez p4, :cond_0

    .line 400
    move/from16 v5, p5

    invoke-direct {p0, v5, v2}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v0

    return-wide v0

    .line 402
    :cond_0
    move/from16 v5, p5

    add-int/lit8 v4, p4, -0x1

    .end local p4    # "inDim":I
    .local v4, "inDim":I
    aget v6, p3, v4

    .line 403
    .local v6, "step":I
    shl-int/lit8 v7, v4, 0x1

    .line 405
    .local v7, "encodeIndex":I
    move-object v0, p0

    move-object v1, p1

    move-object/from16 v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder1([DI[III)D

    move-result-wide v10

    .line 406
    .local v10, "value0":D
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v1, v1, v7

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v3, v7, 0x1

    aget v2, v2, v3

    if-ne v1, v2, :cond_1

    .line 407
    return-wide v10

    .line 410
    :cond_1
    add-int v2, p2, v6

    .line 411
    .local v2, "ceilPosition":I
    move-object v0, p0

    move-object v1, p1

    move-object/from16 v3, p3

    move/from16 v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder1([DI[III)D

    move-result-wide v12

    .line 413
    .local v12, "value1":D
    aget-wide v8, p1, v4

    invoke-static/range {v8 .. v13}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->calculateLinearInterpolationFormula(DDD)D

    move-result-wide v0

    return-wide v0
.end method

.method private interpolateOrder3([D[II[III)D
    .locals 20
    .param p1, "x"    # [D
    .param p2, "floor"    # [I
    .param p3, "floorPosition"    # I
    .param p4, "steps"    # [I
    .param p5, "inDim"    # I
    .param p6, "outDim"    # I

    .line 417
    move-object/from16 v0, p0

    move/from16 v3, p3

    if-nez p5, :cond_0

    .line 418
    move/from16 v6, p6

    invoke-direct {v0, v6, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getValue(II)D

    move-result-wide v1

    return-wide v1

    .line 420
    :cond_0
    move/from16 v6, p6

    add-int/lit8 v5, p5, -0x1

    .end local p5    # "inDim":I
    .local v5, "inDim":I
    aget v7, p4, v5

    .line 421
    .local v7, "step":I
    shl-int/lit8 v8, v5, 0x1

    .line 423
    .local v8, "encodeIndex":I
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder3([D[II[III)D

    move-result-wide v11

    .line 424
    .local v11, "value1":D
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v1, v1, v8

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v3, v8, 0x1

    aget v2, v2, v3

    if-ne v1, v2, :cond_1

    .line 425
    return-wide v11

    .line 428
    :cond_1
    add-int v3, p3, v7

    .line 429
    .local v3, "ceilPosition":I
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p4

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder3([D[II[III)D

    move-result-wide v13

    .line 431
    move/from16 v19, v3

    .end local v3    # "ceilPosition":I
    .local v13, "value2":D
    .local v19, "ceilPosition":I
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v2, v8, 0x1

    aget v1, v1, v2

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v2, v2, v8

    sub-int/2addr v1, v2

    const/4 v9, 0x1

    if-ne v1, v9, :cond_2

    .line 432
    aget-wide v9, p1, v5

    invoke-static/range {v9 .. v14}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->calculateLinearInterpolationFormula(DDD)D

    move-result-wide v1

    return-wide v1

    .line 436
    :cond_2
    aget v1, p2, v5

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v2, v2, v8

    const-wide/high16 v15, 0x4000000000000000L    # 2.0

    if-le v1, v2, :cond_3

    .line 437
    sub-int v3, p3, v7

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p4

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder3([D[II[III)D

    move-result-wide v17

    .local v17, "value0":D
    goto :goto_0

    .line 439
    .end local v17    # "value0":D
    :cond_3
    mul-double v1, v11, v15

    sub-double v17, v1, v13

    .line 443
    .restart local v17    # "value0":D
    :goto_0
    aget v1, p2, v5

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v3, v8, 0x1

    aget v2, v2, v3

    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v3, v3, v8

    sub-int/2addr v2, v3

    sub-int/2addr v2, v9

    if-ge v1, v2, :cond_4

    .line 444
    add-int v3, v19, v7

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p4

    move/from16 v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateOrder3([D[II[III)D

    move-result-wide v9

    .local v9, "value3":D
    goto :goto_1

    .line 446
    .end local v9    # "value3":D
    :cond_4
    mul-double v0, v13, v15

    sub-double v9, v0, v11

    .line 449
    .restart local v9    # "value3":D
    :goto_1
    aget-wide v0, p1, v5

    move-wide v15, v13

    move-wide v13, v11

    move-wide/from16 v11, v17

    move-wide/from16 v17, v9

    move-wide v9, v0

    .end local v9    # "value3":D
    .local v11, "value0":D
    .local v13, "value1":D
    .local v15, "value2":D
    .local v17, "value3":D
    invoke-static/range {v9 .. v18}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->calculateCubicInterpolationFormula(DDDDD)D

    move-result-wide v0

    move-wide/from16 v9, v17

    move-wide/from16 v17, v11

    move-wide v11, v13

    move-wide v13, v15

    .end local v15    # "value2":D
    .restart local v9    # "value3":D
    .local v11, "value1":D
    .local v13, "value2":D
    .local v17, "value0":D
    return-wide v0
.end method

.method private isInvalid()Z
    .locals 9

    .line 539
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 540
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->errorMessage:Ljava/lang/String;

    if-eqz v0, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 542
    :cond_1
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getDomain()[D

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getRange()[D

    move-result-object v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    if-nez v0, :cond_2

    goto/16 :goto_6

    .line 546
    :cond_2
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    if-eq v0, v2, :cond_3

    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    const/4 v3, 0x3

    if-eq v0, v3, :cond_3

    .line 547
    const-string v0, "Order must be equal to 1 or 3"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 548
    return v2

    .line 550
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDomain()[D

    move-result-object v0

    array-length v0, v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDomain()[D

    move-result-object v0

    array-length v0, v0

    rem-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_4

    goto/16 :goto_5

    .line 554
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getRange()[D

    move-result-object v0

    array-length v0, v0

    const-string v3, "Invalid encode array for PDF function of type 0"

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getRange()[D

    move-result-object v0

    array-length v0, v0

    rem-int/lit8 v0, v0, 0x2

    if-ne v0, v2, :cond_5

    goto/16 :goto_4

    .line 559
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDomain()[D

    move-result-object v0

    array-length v0, v0

    shr-int/2addr v0, v2

    .line 560
    .local v0, "inputDimension":I
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    const-string v5, "Invalid size array for PDF function of type 0"

    if-eqz v4, :cond_f

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v4, v4

    if-eq v4, v0, :cond_6

    goto/16 :goto_3

    .line 564
    :cond_6
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v6, v4

    move v7, v1

    :goto_0
    if-ge v7, v6, :cond_8

    aget v8, v4, v7

    .line 565
    .local v8, "s":I
    if-gtz v8, :cond_7

    .line 566
    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 567
    return v2

    .line 564
    .end local v8    # "s":I
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 570
    :cond_8
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    array-length v4, v4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDomain()[D

    move-result-object v5

    array-length v5, v5

    if-eq v4, v5, :cond_9

    .line 571
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 572
    return v2

    .line 574
    :cond_9
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    array-length v5, v5

    if-ge v4, v5, :cond_b

    .line 575
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    add-int/lit8 v6, v4, 0x1

    aget v5, v5, v6

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v6, v6, v4

    if-ge v5, v6, :cond_a

    .line 576
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 577
    return v2

    .line 574
    :cond_a
    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    .line 580
    .end local v4    # "i":I
    :cond_b
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    array-length v3, v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getRange()[D

    move-result-object v4

    array-length v4, v4

    if-eq v3, v4, :cond_c

    .line 581
    const-string v1, "Invalid decode array for PDF function of type 0"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 582
    return v2

    .line 584
    :cond_c
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    invoke-static {v3}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    move-result-object v3

    iget v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->outputDimension:I

    iget v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->bitsPerSample:I

    mul-int/2addr v4, v5

    new-instance v5, Lcom/itextpdf/kernel/pdf/function/PdfType0Function$$ExternalSyntheticLambda0;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v3, v4, v5}, Ljava/util/stream/IntStream;->reduce(ILjava/util/function/IntBinaryOperator;)I

    move-result v3

    add-int/lit8 v3, v3, 0x7

    div-int/lit8 v3, v3, 0x8

    .line 586
    .local v3, "samplesMinLength":I
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->samples:[B

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->samples:[B

    array-length v4, v4

    if-ge v4, v3, :cond_d

    goto :goto_2

    .line 592
    :cond_d
    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 593
    return v1

    .line 587
    :cond_e
    :goto_2
    const-string v1, "Invalid samples array for PDF function of type 0"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 589
    return v2

    .line 561
    .end local v3    # "samplesMinLength":I
    :cond_f
    :goto_3
    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 562
    return v2

    .line 555
    .end local v0    # "inputDimension":I
    :cond_10
    :goto_4
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 556
    return v2

    .line 551
    :cond_11
    :goto_5
    const-string v0, "Invalid domain for PDF function of type 0"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 552
    return v2

    .line 543
    :cond_12
    :goto_6
    const-string v0, "Domain, range and size must be not null"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->setErrorMessage(Ljava/lang/String;)V

    .line 544
    return v2
.end method

.method static synthetic lambda$isInvalid$0(II)I
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I

    .line 585
    mul-int v0, p0, p1

    return v0
.end method

.method private setErrorMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .line 534
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->errorMessage:Ljava/lang/String;

    .line 535
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 536
    return-void
.end method

.method static specialSweepMethod([D)[D
    .locals 11
    .param p0, "f"    # [D

    .line 322
    array-length v0, p0

    if-lez v0, :cond_2

    .line 324
    array-length v0, p0

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [D

    .line 325
    .local v0, "x":[D
    const/4 v1, 0x1

    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    aput-wide v2, v0, v1

    .line 326
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    array-length v5, p0

    const/4 v6, 0x0

    if-ge v4, v5, :cond_0

    .line 327
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    aget-wide v9, v0, v4

    div-double/2addr v7, v9

    aput-wide v7, v0, v6

    .line 328
    add-int/lit8 v5, v4, 0x1

    aget-wide v7, v0, v6

    sub-double v7, v2, v7

    aput-wide v7, v0, v5

    .line 329
    aget-wide v7, p0, v4

    aget-wide v5, v0, v6

    add-int/lit8 v9, v4, -0x1

    aget-wide v9, p0, v9

    mul-double/2addr v5, v9

    sub-double/2addr v7, v5

    aput-wide v7, p0, v4

    .line 326
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 332
    .end local v4    # "i":I
    :cond_0
    array-length v2, p0

    array-length v3, p0

    sub-int/2addr v3, v1

    aget-wide v3, p0, v3

    array-length v5, p0

    aget-wide v7, v0, v5

    div-double/2addr v3, v7

    aput-wide v3, v0, v2

    .line 333
    array-length v2, p0

    sub-int/2addr v2, v1

    .local v2, "i":I
    :goto_1
    if-lez v2, :cond_1

    .line 334
    add-int/lit8 v3, v2, -0x1

    aget-wide v3, p0, v3

    add-int/lit8 v5, v2, 0x1

    aget-wide v7, v0, v5

    sub-double/2addr v3, v7

    aget-wide v7, v0, v2

    div-double/2addr v3, v7

    aput-wide v3, v0, v2

    .line 333
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 337
    .end local v2    # "i":I
    :cond_1
    array-length v2, v0

    sub-int/2addr v2, v1

    const-wide/16 v3, 0x0

    aput-wide v3, v0, v2

    aput-wide v3, v0, v6

    .line 338
    return-object v0

    .line 322
    .end local v0    # "x":[D
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public calculate([D)[D
    .locals 6
    .param p1, "input"    # [D

    .line 207
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isInvalid()Z

    move-result v0

    if-nez v0, :cond_1

    .line 211
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getDomain()[D

    move-result-object v0

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->normalize([D[D)[D

    move-result-object v0

    .line 212
    .local v0, "normal":[D
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getFloor([D[I)[I

    move-result-object v1

    .line 216
    .local v1, "floor":[I
    iget v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    array-length v2, v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    aget v2, v2, v3

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    const/4 v5, 0x0

    aget v4, v4, v5

    sub-int/2addr v2, v4

    if-le v2, v3, :cond_0

    .line 217
    aget-wide v2, v0, v5

    aget v4, v1, v5

    invoke-direct {p0, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolateByCubicSpline(DI)[D

    move-result-object v2

    .local v2, "result":[D
    goto :goto_0

    .line 219
    .end local v2    # "result":[D
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->interpolate([D[I)[D

    move-result-object v2

    .line 222
    .restart local v2    # "result":[D
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getRange()[D

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->clip([D[D)[D

    move-result-object v3

    return-object v3

    .line 208
    .end local v0    # "normal":[D
    .end local v1    # "floor":[I
    .end local v2    # "result":[D
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->errorMessage:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public checkCompatibilityWithColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Z
    .locals 3
    .param p1, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 190
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getInputSize()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getOutputSize()I

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getNumberOfComponents()I

    move-result v2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getDecode()[D
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    return-object v0
.end method

.method public getEncode()[I
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->encode:[I

    return-object v0
.end method

.method public getOrder()I
    .locals 1

    .line 149
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    return v0
.end method

.method public getSize()[I
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    return-object v0
.end method

.method public setDecode([D)V
    .locals 3
    .param p1, "decode"    # [D

    .line 183
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->decode:[D

    .line 184
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 185
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 186
    return-void
.end method

.method public setDomain([D)V
    .locals 1
    .param p1, "domain"    # [D

    .line 195
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->setDomain([D)V

    .line 196
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 197
    return-void
.end method

.method public setEncode([I)V
    .locals 3
    .param p1, "encode"    # [I

    .line 173
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->initializeEncoding([I)V

    .line 174
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 175
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 176
    return-void
.end method

.method public setOrder(I)V
    .locals 3
    .param p1, "order"    # I

    .line 153
    iput p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->order:I

    .line 154
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 155
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 156
    return-void
.end method

.method public setRange([D)V
    .locals 1
    .param p1, "range"    # [D

    .line 201
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->setRange([D)V

    .line 202
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 203
    return-void
.end method

.method public setSize([I)V
    .locals 3
    .param p1, "size"    # [I

    .line 163
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->size:[I

    .line 164
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 165
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType0Function;->isValidated:Z

    .line 166
    return-void
.end method
