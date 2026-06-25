.class Lcom/itextpdf/kernel/pdf/annot/InteriorColorUtil;
.super Ljava/lang/Object;
.source "InteriorColorUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static parseInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/colors/Color;
    .locals 5
    .param p0, "color"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 45
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 46
    return-object v0

    .line 48
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v1, :pswitch_data_0

    .line 56
    :pswitch_0
    return-object v0

    .line 54
    :pswitch_1
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v3

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v2

    const/4 v4, 0x3

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v4

    invoke-direct {v0, v1, v3, v2, v4}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(FFFF)V

    return-object v0

    .line 52
    :pswitch_2
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v3

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v2

    invoke-direct {v0, v1, v3, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(FFF)V

    return-object v0

    .line 50
    :pswitch_3
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceGray;

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
