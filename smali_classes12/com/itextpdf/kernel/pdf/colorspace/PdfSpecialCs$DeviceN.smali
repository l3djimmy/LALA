.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.source "PdfSpecialCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeviceN"
.end annotation


# instance fields
.field protected numOfComponents:I


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 162
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 159
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->numOfComponents:I

    .line 163
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsArray(I)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->numOfComponents:I

    .line 164
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "names"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "tintTransform"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 167
    invoke-static {p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->getDeviceNCsArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 168
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V
    .locals 3
    .param p2, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p3, "tintTransform"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;",
            "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;",
            ")V"
        }
    .end annotation

    .line 178
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;Z)V

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 179
    invoke-interface {p3}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getAsPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 178
    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 180
    invoke-interface {p3}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getInputSize()I

    move-result v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->numOfComponents:I

    if-ne v0, v1, :cond_0

    .line 181
    invoke-interface {p3}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getOutputSize()I

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getNumberOfComponents()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 185
    return-void

    .line 182
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Function is not compatible with ColorSpace."

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected static getDeviceNCsArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p0, "names"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p1, "alternateSpace"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "tintTransform"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 201
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 202
    .local v0, "deviceN":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceN:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 203
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 204
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 205
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 206
    return-object v0
.end method


# virtual methods
.method public getBaseCs()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 2

    .line 193
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    return-object v0
.end method

.method public getNames()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 197
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsArray(I)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfComponents()I
    .locals 1

    .line 189
    iget v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->numOfComponents:I

    return v0
.end method
