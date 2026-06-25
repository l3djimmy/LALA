.class public Lcom/itextpdf/layout/properties/TransparentColor;
.super Ljava/lang/Object;
.source "TransparentColor.java"


# instance fields
.field private color:Lcom/itextpdf/kernel/colors/Color;

.field private opacity:F


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/itextpdf/layout/properties/TransparentColor;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 45
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/layout/properties/TransparentColor;->opacity:F

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/itextpdf/layout/properties/TransparentColor;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 57
    iput p2, p0, Lcom/itextpdf/layout/properties/TransparentColor;->opacity:F

    .line 58
    return-void
.end method

.method private applyTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Z)V
    .locals 2
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "isStroke"    # Z

    .line 93
    invoke-direct {p0}, Lcom/itextpdf/layout/properties/TransparentColor;->isTransparent()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 94
    new-instance v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>()V

    .line 95
    .local v0, "extGState":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    nop

    .line 98
    iget v1, p0, Lcom/itextpdf/layout/properties/TransparentColor;->opacity:F

    .line 95
    if-eqz p2, :cond_0

    .line 96
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->setStrokeOpacity(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    goto :goto_0

    .line 98
    :cond_0
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->setFillOpacity(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    .line 100
    :goto_0
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 102
    .end local v0    # "extGState":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    :cond_1
    return-void
.end method

.method private isTransparent()Z
    .locals 2

    .line 105
    iget v0, p0, Lcom/itextpdf/layout/properties/TransparentColor;->opacity:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/properties/TransparentColor;->applyTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Z)V

    .line 82
    return-void
.end method

.method public applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 89
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/properties/TransparentColor;->applyTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Z)V

    .line 90
    return-void
.end method

.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/itextpdf/layout/properties/TransparentColor;->color:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getOpacity()F
    .locals 1

    .line 73
    iget v0, p0, Lcom/itextpdf/layout/properties/TransparentColor;->opacity:F

    return v0
.end method
