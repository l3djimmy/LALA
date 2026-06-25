.class public Lcom/itextpdf/layout/properties/Underline;
.super Ljava/lang/Object;
.source "Underline.java"


# instance fields
.field protected lineCapStyle:I

.field protected thickness:F

.field protected thicknessMul:F

.field protected transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

.field protected yPosition:F

.field protected yPositionMul:F


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FFFFFI)V
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .param p3, "thickness"    # F
    .param p4, "thicknessMul"    # F
    .param p5, "yPosition"    # F
    .param p6, "yPositionMul"    # F
    .param p7, "lineCapStyle"    # I

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/properties/Underline;->lineCapStyle:I

    .line 82
    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/Underline;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 83
    iput p3, p0, Lcom/itextpdf/layout/properties/Underline;->thickness:F

    .line 84
    iput p4, p0, Lcom/itextpdf/layout/properties/Underline;->thicknessMul:F

    .line 85
    iput p5, p0, Lcom/itextpdf/layout/properties/Underline;->yPosition:F

    .line 86
    iput p6, p0, Lcom/itextpdf/layout/properties/Underline;->yPositionMul:F

    .line 87
    iput p7, p0, Lcom/itextpdf/layout/properties/Underline;->lineCapStyle:I

    .line 88
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FFFFI)V
    .locals 8
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "thickness"    # F
    .param p3, "thicknessMul"    # F
    .param p4, "yPosition"    # F
    .param p5, "yPositionMul"    # F
    .param p6, "lineCapStyle"    # I

    .line 61
    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "thickness":F
    .end local p3    # "thicknessMul":F
    .end local p4    # "yPosition":F
    .end local p5    # "yPositionMul":F
    .end local p6    # "lineCapStyle":I
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v3, "thickness":F
    .local v4, "thicknessMul":F
    .local v5, "yPosition":F
    .local v6, "yPositionMul":F
    .local v7, "lineCapStyle":I
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/properties/Underline;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFFI)V

    .line 62
    return-void
.end method


# virtual methods
.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Underline;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getLineCapStyle()I
    .locals 1

    .line 138
    iget v0, p0, Lcom/itextpdf/layout/properties/Underline;->lineCapStyle:I

    return v0
.end method

.method public getOpacity()F
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Underline;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v0

    return v0
.end method

.method public getThickness(F)F
    .locals 2
    .param p1, "fontSize"    # F

    .line 112
    iget v0, p0, Lcom/itextpdf/layout/properties/Underline;->thickness:F

    iget v1, p0, Lcom/itextpdf/layout/properties/Underline;->thicknessMul:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method public getYPosition(F)F
    .locals 2
    .param p1, "fontSize"    # F

    .line 121
    iget v0, p0, Lcom/itextpdf/layout/properties/Underline;->yPosition:F

    iget v1, p0, Lcom/itextpdf/layout/properties/Underline;->yPositionMul:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method public getYPositionMul()F
    .locals 1

    .line 129
    iget v0, p0, Lcom/itextpdf/layout/properties/Underline;->yPositionMul:F

    return v0
.end method
