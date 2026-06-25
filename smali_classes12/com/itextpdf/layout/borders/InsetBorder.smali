.class public Lcom/itextpdf/layout/borders/InsetBorder;
.super Lcom/itextpdf/layout/borders/Border3D;
.source "InsetBorder.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .param p1, "width"    # F

    .line 41
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/borders/Border3D;-><init>(F)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/DeviceCmyk;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .param p2, "width"    # F

    .line 61
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceCmyk;F)V

    .line 62
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/DeviceCmyk;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 93
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceCmyk;FF)V

    .line 94
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/DeviceGray;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceGray;
    .param p2, "width"    # F

    .line 71
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceGray;F)V

    .line 72
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/DeviceGray;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceGray;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 104
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceGray;FF)V

    .line 105
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/DeviceRgb;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceRgb;
    .param p2, "width"    # F

    .line 51
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceRgb;F)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/DeviceRgb;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceRgb;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 82
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceRgb;FF)V

    .line 83
    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .line 112
    const/4 v0, 0x6

    return v0
.end method

.method protected setInnerHalfColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/borders/Border$Side;)V
    .locals 2
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "side"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 120
    sget-object v0, Lcom/itextpdf/layout/borders/InsetBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 127
    :pswitch_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/InsetBorder;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 123
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/InsetBorder;->getDarkerColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 124
    nop

    .line 130
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected setOuterHalfColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/borders/Border$Side;)V
    .locals 2
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "side"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 137
    sget-object v0, Lcom/itextpdf/layout/borders/InsetBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 144
    :pswitch_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/InsetBorder;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 140
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/InsetBorder;->getDarkerColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 141
    nop

    .line 147
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
