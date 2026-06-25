.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.source "PdfSpecialCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Separation"
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 99
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "tintTransform"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 103
    invoke-static {p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->getSeparationCsArray(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p3, "tintTransform"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    .line 115
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 116
    invoke-interface {p3}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getAsPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 115
    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 117
    invoke-interface {p3, p2}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->checkCompatibilityWithColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    return-void

    .line 118
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Function is not compatible with ColorSpace."

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method private static getSeparationCsArray(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p0, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "tintTransform"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 146
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 147
    .local v0, "separation":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Separation:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 148
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 149
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 150
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 151
    return-object v0
.end method


# virtual methods
.method public getBaseCs()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 2

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    return-object v0
.end method

.method public getName()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 133
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfComponents()I
    .locals 1

    .line 125
    const/4 v0, 0x1

    return v0
.end method

.method public getTintTransformation()Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .locals 2

    .line 142
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/function/PdfFunctionFactory;->create(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object v0

    return-object v0
.end method
