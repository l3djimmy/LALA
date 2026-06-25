.class public Lcom/itextpdf/kernel/pdf/function/PdfType3Function;
.super Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;
.source "PdfType3Function.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_FUNCTION_FACTORY:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;


# instance fields
.field private bounds:[D

.field private encode:[D

.field private final functionFactory:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

.field private functions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->DEFAULT_FUNCTION_FACTORY:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->DEFAULT_FUNCTION_FACTORY:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;)V

    .line 68
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;)V
    .locals 4
    .param p1, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "functionFactory"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    .line 121
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 122
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functionFactory:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    .line 124
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Functions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 125
    .local v0, "functionsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->checkAndGetFunctions(Lcom/itextpdf/kernel/pdf/PdfArray;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functions:Ljava/util/List;

    .line 127
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getDomain()[D

    move-result-object v1

    array-length v1, v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 131
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Bounds:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 132
    .local v1, "boundsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->checkAndGetBounds(Lcom/itextpdf/kernel/pdf/PdfArray;)[D

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    .line 134
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 135
    .local v2, "encodeArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->checkAndGetEncode(Lcom/itextpdf/kernel/pdf/PdfArray;)[D

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->encode:[D

    .line 136
    return-void

    .line 128
    .end local v1    # "boundsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v2    # "encodeArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid PDF Type 3 Function object, \"Domain\" array shall consist of 2 numbers."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>([D[DLjava/util/List;[D[D)V
    .locals 4
    .param p1, "domain"    # [D
    .param p2, "range"    # [D
    .param p4, "bounds"    # [D
    .param p5, "encode"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([D[D",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
            "+",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;>;[D[D)V"
        }
    .end annotation

    .line 87
    .local p3, "functions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;I[D[D)V

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->DEFAULT_FUNCTION_FACTORY:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functionFactory:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    .line 89
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 90
    .local v0, "funcs":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;

    .line 91
    .local v2, "func":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 92
    .end local v2    # "func":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    goto :goto_0

    .line 93
    :cond_0
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Functions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 94
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Bounds:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3, p4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 95
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3, p5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 96
    return-void
.end method

.method public constructor <init>([F[FLjava/util/List;[F[F)V
    .locals 6
    .param p1, "domain"    # [F
    .param p2, "range"    # [F
    .param p4, "bounds"    # [F
    .param p5, "encode"    # [F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F[F",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
            "+",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;>;[F[F)V"
        }
    .end annotation

    .line 115
    .local p3, "functions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;>;"
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v1

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v2

    .line 116
    invoke-static {p4}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v4

    invoke-static {p5}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v5

    .line 115
    move-object v0, p0

    move-object v3, p3

    .end local p3    # "functions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;>;"
    .local v3, "functions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;>;"
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;-><init>([D[DLjava/util/List;[D[D)V

    .line 117
    return-void
.end method

.method private static areThreeDoubleEqual(DDD)Z
    .locals 1
    .param p0, "first"    # D
    .param p2, "second"    # D
    .param p4, "third"    # D

    .line 379
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2, p3, p4, p5}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private calculateSubdomain(D)I
    .locals 8
    .param p1, "inputValue"    # D

    .line 262
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length v0, v0

    if-lez v0, :cond_1

    .line 263
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    const/4 v1, 0x0

    aget-wide v2, v0, v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v0

    aget-wide v4, v0, v1

    move-wide v6, p1

    .end local p1    # "inputValue":D
    .local v6, "inputValue":D
    invoke-static/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->areThreeDoubleEqual(DDD)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 264
    return v1

    .line 266
    :cond_0
    iget-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    iget-object p2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length p2, p2

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    aget-wide v2, p1, p2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object p1

    aget-wide v4, p1, v0

    invoke-static/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->areThreeDoubleEqual(DDD)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 267
    iget-object p1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length p1, p1

    return p1

    .line 262
    .end local v6    # "inputValue":D
    .restart local p1    # "inputValue":D
    :cond_1
    move-wide v6, p1

    .line 271
    .end local p1    # "inputValue":D
    .restart local v6    # "inputValue":D
    :cond_2
    const/4 p1, 0x0

    .local p1, "i":I
    :goto_0
    iget-object p2, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length p2, p2

    .line 276
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    .line 271
    if-ge p1, p2, :cond_4

    .line 272
    aget-wide v1, v0, p1

    cmpg-double p2, v6, v1

    if-gez p2, :cond_3

    .line 273
    return p1

    .line 271
    :cond_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 276
    .end local p1    # "i":I
    :cond_4
    array-length p1, v0

    return p1
.end method

.method private checkAndGetBounds(Lcom/itextpdf/kernel/pdf/PdfArray;)[D
    .locals 10
    .param p1, "boundsArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 325
    if-eqz p1, :cond_7

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ne v0, v1, :cond_7

    .line 328
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v0

    .line 330
    .local v0, "bounds":[D
    const/4 v1, 0x0

    .line 331
    .local v1, "areBoundsInvalid":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_5

    .line 332
    const/4 v4, 0x0

    if-nez v3, :cond_0

    aget-wide v5, v0, v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v7

    aget-wide v8, v7, v4

    cmpg-double v5, v5, v8

    if-gez v5, :cond_1

    goto :goto_1

    :cond_0
    aget-wide v5, v0, v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v7

    aget-wide v8, v7, v4

    cmpg-double v5, v5, v8

    if-gtz v5, :cond_1

    :goto_1
    move v5, v2

    goto :goto_2

    :cond_1
    move v5, v4

    :goto_2
    or-int/2addr v1, v5

    .line 333
    array-length v5, v0

    sub-int/2addr v5, v2

    if-ne v3, v5, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v5

    aget-wide v6, v5, v2

    aget-wide v8, v0, v3

    cmpg-double v5, v6, v8

    if-gez v5, :cond_3

    goto :goto_3

    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v5

    aget-wide v6, v5, v2

    aget-wide v8, v0, v3

    cmpg-double v5, v6, v8

    if-gtz v5, :cond_3

    :goto_3
    move v5, v2

    goto :goto_4

    :cond_3
    move v5, v4

    :goto_4
    or-int/2addr v1, v5

    .line 334
    if-eqz v3, :cond_4

    aget-wide v5, v0, v3

    add-int/lit8 v7, v3, -0x1

    aget-wide v7, v0, v7

    cmpg-double v5, v5, v7

    if-gtz v5, :cond_4

    move v4, v2

    :cond_4
    or-int/2addr v1, v4

    .line 331
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 336
    .end local v3    # "i":I
    :cond_5
    if-nez v1, :cond_6

    .line 339
    return-object v0

    .line 337
    :cond_6
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Invalid PDF Type 3 Function object, \"Bounds\" elements shall be in order of increasing value, and each value shall be within the domain defined by \"Domain\"."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 326
    .end local v0    # "bounds":[D
    .end local v1    # "areBoundsInvalid":Z
    :cond_7
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Invalid PDF Type 3 Function object, \"Bounds\" array should exist and its size should correspond to the size of the \"Functions\" array."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkAndGetEncode(Lcom/itextpdf/kernel/pdf/PdfArray;)[D
    .locals 2
    .param p1, "encodeArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 343
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    if-lt v0, v1, :cond_0

    .line 346
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v0

    return-object v0

    .line 344
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Invalid PDF Type 3 Function object, \"Encode\" array should exist and its size should be 2 times more than the size of the \"Functions\" array."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkAndGetFunctions(Lcom/itextpdf/kernel/pdf/PdfArray;)Ljava/util/List;
    .locals 8
    .param p1, "functionsArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;",
            ">;"
        }
    .end annotation

    .line 293
    if-eqz p1, :cond_6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    if-eqz v0, :cond_6

    .line 297
    const/4 v0, 0x0

    .line 298
    .local v0, "tempOutputSize":Ljava/lang/Integer;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getRange()[D

    move-result-object v1

    if-eqz v1, :cond_0

    .line 300
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getOutputSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 302
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 303
    .local v1, "tempFunctions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/IPdfFunction;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 304
    .local v3, "funcObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-nez v4, :cond_1

    .line 305
    goto :goto_0

    .line 307
    :cond_1
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 308
    .local v4, "funcDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functionFactory:Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;

    invoke-interface {v5, v4}, Lcom/itextpdf/kernel/pdf/function/IPdfFunctionFactory;->create(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object v5

    .line 309
    .local v5, "tempFunc":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    if-nez v0, :cond_2

    .line 310
    invoke-interface {v5}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getOutputSize()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 312
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v5}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getOutputSize()I

    move-result v7

    if-ne v6, v7, :cond_4

    .line 315
    invoke-interface {v5}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getInputSize()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_3

    .line 319
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 320
    .end local v3    # "funcObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "funcDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "tempFunc":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    goto :goto_0

    .line 316
    .restart local v3    # "funcObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v4    # "funcDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v5    # "tempFunc":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    :cond_3
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Invalid PDF Type 3 Function object, all functions shall have 1 input value."

    invoke-direct {v2, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 313
    :cond_4
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Invalid PDF Type 3 Function object, the output dimensionality of all functions shall be the same, and compatible with the value of \"Range\"."

    invoke-direct {v2, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 321
    .end local v3    # "funcObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "funcDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "tempFunc":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    :cond_5
    return-object v1

    .line 294
    .end local v0    # "tempOutputSize":Ljava/lang/Integer;
    .end local v1    # "tempFunctions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/IPdfFunction;>;"
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Invalid PDF Type 3 Function object, \"Functions\" array should exist and can\'t be empty."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getSubdomainBorders(I)[D
    .locals 8
    .param p1, "subdomain"    # I

    .line 280
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length v0, v0

    if-nez v0, :cond_0

    .line 281
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v0

    return-object v0

    .line 283
    :cond_0
    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_1

    .line 284
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v3

    aget-wide v4, v3, v1

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    aget-wide v6, v3, v1

    new-array v0, v0, [D

    aput-wide v4, v0, v1

    aput-wide v6, v0, v2

    return-object v0

    .line 285
    :cond_1
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length v3, v3

    .line 288
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    .line 285
    if-ne p1, v3, :cond_2

    .line 286
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    array-length v3, v3

    sub-int/2addr v3, v2

    aget-wide v3, v4, v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getDomain()[D

    move-result-object v5

    aget-wide v6, v5, v2

    new-array v0, v0, [D

    aput-wide v3, v0, v1

    aput-wide v6, v0, v2

    return-object v0

    .line 288
    :cond_2
    add-int/lit8 v3, p1, -0x1

    aget-wide v3, v4, v3

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    aget-wide v6, v5, p1

    new-array v0, v0, [D

    aput-wide v3, v0, v1

    aput-wide v6, v0, v2

    return-object v0
.end method

.method static synthetic lambda$static$0(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .locals 1
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 50
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/function/PdfFunctionFactory;->create(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object v0

    return-object v0
.end method

.method private static mapValueFromActualRangeToExpected(DDDDD)D
    .locals 10
    .param p0, "value"    # D
    .param p2, "aStart"    # D
    .param p4, "aEnd"    # D
    .param p6, "eStart"    # D
    .param p8, "eEnd"    # D

    .line 364
    sub-double v0, p4, p2

    .line 365
    .local v0, "actualRangeLength":D
    const-wide/16 v2, 0x0

    cmpl-double v2, v0, v2

    if-nez v2, :cond_0

    .line 366
    return-wide p6

    .line 368
    :cond_0
    sub-double v2, p8, p6

    .line 371
    .local v2, "expectedRangeLength":D
    sub-double v4, p0, p2

    .line 372
    .local v4, "x":D
    div-double v6, v2, v0

    mul-double/2addr v6, v4

    .line 375
    .local v6, "y":D
    add-double v8, p6, v6

    return-wide v8
.end method


# virtual methods
.method public calculate([D)[D
    .locals 19
    .param p1, "input"    # [D

    .line 247
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_0

    array-length v2, v1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 250
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->clipInput([D)[D

    move-result-object v2

    .line 251
    .local v2, "clipped":[D
    const/4 v4, 0x0

    aget-wide v5, v2, v4

    .line 252
    .local v5, "x":D
    invoke-direct {v0, v5, v6}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->calculateSubdomain(D)I

    move-result v15

    .line 253
    .local v15, "subdomain":I
    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getSubdomainBorders(I)[D

    move-result-object v16

    .line 254
    .local v16, "subdomainBorders":[D
    aget-wide v7, v16, v4

    aget-wide v9, v16, v3

    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->encode:[D

    mul-int/lit8 v12, v15, 0x2

    aget-wide v12, v11, v12

    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->encode:[D

    mul-int/lit8 v14, v15, 0x2

    add-int/2addr v14, v3

    aget-wide v17, v11, v14

    move-wide v11, v12

    move-wide/from16 v13, v17

    invoke-static/range {v5 .. v14}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->mapValueFromActualRangeToExpected(DDDDD)D

    move-result-wide v5

    .line 257
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functions:Ljava/util/List;

    invoke-interface {v7, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    new-array v3, v3, [D

    aput-wide v5, v3, v4

    invoke-interface {v7, v3}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->calculate([D)[D

    move-result-object v3

    .line 258
    .local v3, "output":[D
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->clipOutput([D)[D

    move-result-object v4

    return-object v4

    .line 248
    .end local v2    # "clipped":[D
    .end local v3    # "output":[D
    .end local v5    # "x":D
    .end local v15    # "subdomain":I
    .end local v16    # "subdomainBorders":[D
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Invalid input value for PDF Type 3 Function, value should be a single number."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public checkCompatibilityWithColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Z
    .locals 1
    .param p1, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 229
    const/4 v0, 0x0

    return v0
.end method

.method public getBounds()[D
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    return-object v0
.end method

.method public getEncode()[D
    .locals 2

    .line 211
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toDoubleArray()[D

    move-result-object v0

    return-object v0
.end method

.method public getFunctions()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;",
            ">;"
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functions:Ljava/util/List;

    return-object v0
.end method

.method public getOutputSize()I
    .locals 2

    .line 242
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getRange()[D

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->functions:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getOutputSize()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getRange()[D

    move-result-object v0

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    :goto_0
    return v0
.end method

.method public setBounds([D)V
    .locals 1
    .param p1, "value"    # [D

    .line 198
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->bounds:[D

    .line 199
    return-void
.end method

.method public setEncode([D)V
    .locals 3
    .param p1, "value"    # [D

    .line 224
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encode:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 225
    return-void
.end method

.method public setFunctions(Ljava/lang/Iterable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
            "+",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;>;)V"
        }
    .end annotation

    .line 163
    .local p1, "value":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 164
    .local v0, "pdfFunctions":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;

    .line 165
    .local v2, "f":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 166
    .end local v2    # "f":Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;, "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    goto :goto_0

    .line 167
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Functions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 168
    return-void
.end method
