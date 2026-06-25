.class public Lcom/itextpdf/kernel/pdf/function/PdfType4Function;
.super Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;
.source "PdfType4Function.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
        "Lcom/itextpdf/kernel/pdf/PdfStream;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 0
    .param p1, "dict"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 31
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 32
    return-void
.end method

.method public constructor <init>([D[D[B)V
    .locals 2
    .param p1, "domain"    # [D
    .param p2, "range"    # [D
    .param p3, "code"    # [B

    .line 35
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0, p3}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;I[D[D)V

    .line 36
    return-void
.end method

.method public constructor <init>([F[F[B)V
    .locals 2
    .param p1, "domain"    # [F
    .param p2, "range"    # [F
    .param p3, "code"    # [B

    .line 39
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v0

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;->convertFloatArrayToDoubleArray([F)[D

    move-result-object v1

    invoke-direct {p0, v0, v1, p3}, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;-><init>([D[D[B)V

    .line 40
    return-void
.end method


# virtual methods
.method public calculate([D)[D
    .locals 2
    .param p1, "input"    # [D

    .line 49
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Type 4 functions are not yet supported for separation color image extraction."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public checkCompatibilityWithColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Z
    .locals 3
    .param p1, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;->getInputSize()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/function/PdfType4Function;->getOutputSize()I

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
