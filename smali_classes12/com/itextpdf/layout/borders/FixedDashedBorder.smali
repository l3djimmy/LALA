.class public Lcom/itextpdf/layout/borders/FixedDashedBorder;
.super Lcom/itextpdf/layout/borders/Border;
.source "FixedDashedBorder.java"


# static fields
.field public static final DEFAULT_UNITS_VALUE:F = 3.0f


# instance fields
.field private final phase:F

.field private final unitsOff:F

.field private final unitsOn:F


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .param p1, "width"    # F

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F

    .line 60
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FF)V
    .locals 7
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 71
    const/high16 v5, 0x40400000    # 3.0f

    const/4 v6, 0x0

    const/high16 v4, 0x40400000    # 3.0f

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "width":F
    .end local p3    # "opacity":F
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v2, "width":F
    .local v3, "opacity":F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 72
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FFFF)V
    .locals 7
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "unitsOn"    # F
    .param p4, "unitsOff"    # F
    .param p5, "phase"    # F

    .line 84
    const/high16 v3, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "width":F
    .end local p3    # "unitsOn":F
    .end local p4    # "unitsOff":F
    .end local p5    # "phase":F
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v2, "width":F
    .local v4, "unitsOn":F
    .local v5, "unitsOff":F
    .local v6, "phase":F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "opacity"    # F
    .param p4, "unitsOn"    # F
    .param p5, "unitsOff"    # F
    .param p6, "phase"    # F

    .line 98
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 99
    iput p4, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOn:F

    .line 100
    iput p5, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOff:F

    .line 101
    iput p6, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->phase:F

    .line 102
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 8
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "horizontalRadius1"    # F
    .param p7, "verticalRadius1"    # F
    .param p8, "horizontalRadius2"    # F
    .param p9, "verticalRadius2"    # F
    .param p10, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p11, "borderWidthBefore"    # F
    .param p12, "borderWidthAfter"    # F

    .line 136
    nop

    .line 137
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget v3, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->width:F

    .line 138
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 139
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 140
    iget-object v2, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 141
    iget v2, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOn:F

    iget v3, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOff:F

    iget v4, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->phase:F

    invoke-virtual {p1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 143
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    sub-float v3, p4, p2

    sub-float v4, p5, p3

    invoke-direct {v2, p2, p3, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 144
    .local v2, "boundingRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v3, 0x2

    new-array v4, v3, [F

    const/4 v5, 0x0

    aput p6, v4, v5

    const/4 v6, 0x1

    aput p8, v4, v6

    .line 145
    .local v4, "horizontalRadii":[F
    new-array v3, v3, [F

    aput p7, v3, v5

    aput p9, v3, v6

    .line 147
    .local v3, "verticalRadii":[F
    move-object v0, v4

    move-object v4, v3

    move-object v3, v0

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v5, p10

    move/from16 v6, p11

    move/from16 v7, p12

    .local v3, "horizontalRadii":[F
    .local v4, "verticalRadii":[F
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/layout/borders/FixedDashedBorder;->drawDiscontinuousBorders(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;[F[FLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 149
    return-void
.end method

.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 6
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p7, "borderWidthBefore"    # F
    .param p8, "borderWidthAfter"    # F

    .line 110
    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move-object v5, p6

    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .end local p4    # "x2":F
    .end local p5    # "y2":F
    .end local p6    # "defaultSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v1, "x1":F
    .local v2, "y1":F
    .local v3, "x2":F
    .local v4, "y2":F
    .local v5, "defaultSide":Lcom/itextpdf/layout/borders/Border$Side;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/FixedDashedBorder;->getStartingPointsForBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)[F

    move-result-object p2

    .line 112
    .local p2, "startingPoints":[F
    const/4 p3, 0x0

    aget p3, p2, p3

    .line 113
    .end local v1    # "x1":F
    .local p3, "x1":F
    const/4 p4, 0x1

    aget p4, p2, p4

    .line 114
    .end local v2    # "y1":F
    .local p4, "y1":F
    const/4 p5, 0x2

    aget p5, p2, p5

    .line 115
    .end local v3    # "x2":F
    .local p5, "x2":F
    const/4 p6, 0x3

    aget p6, p2, p6

    .line 117
    .end local v4    # "y2":F
    .local p6, "y2":F
    nop

    .line 118
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->width:F

    .line 119
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 120
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 121
    iget-object v0, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 122
    iget v0, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOn:F

    iget v1, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOff:F

    iget v2, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->phase:F

    .line 123
    invoke-virtual {p1, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p3

    float-to-double v3, p4

    .line 124
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p5

    float-to-double v3, p6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 127
    return-void
.end method

.method public drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V
    .locals 5
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 156
    nop

    .line 157
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 158
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 159
    iget-object v0, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 160
    iget v0, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOn:F

    iget v1, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->unitsOff:F

    iget v2, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->phase:F

    .line 161
    invoke-virtual {p1, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/borders/FixedDashedBorder;->width:F

    .line 162
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p2

    float-to-double v3, p3

    .line 163
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p4

    float-to-double v3, p5

    .line 164
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 167
    return-void
.end method

.method public getType()I
    .locals 1

    .line 174
    const/16 v0, 0x9

    return v0
.end method
