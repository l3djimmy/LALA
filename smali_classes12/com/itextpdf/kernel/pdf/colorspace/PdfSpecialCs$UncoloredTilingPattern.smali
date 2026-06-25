.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;
.source "PdfSpecialCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UncoloredTilingPattern"
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 277
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 278
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V
    .locals 4
    .param p1, "underlyingColorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 281
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfObject;

    const/4 v2, 0x0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 282
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 293
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;->flush()V

    .line 294
    return-void
.end method

.method public getNumberOfComponents()I
    .locals 2

    .line 302
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getNumberOfComponents()I

    move-result v0

    return v0
.end method

.method public getUnderlyingColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 2

    .line 297
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 307
    const/4 v0, 0x1

    return v0
.end method
