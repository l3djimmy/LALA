.class public Lcom/itextpdf/layout/borders/DottedBorder;
.super Lcom/itextpdf/layout/borders/Border;
.source "DottedBorder.java"


# static fields
.field private static final GAP_MODIFIER:F = 1.5f


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .param p1, "width"    # F

    .line 46
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/borders/Border;-><init>(F)V

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F

    .line 56
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 67
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 68
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 16
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

    .line 117
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v8, p2

    move/from16 v9, p3

    iget v2, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    const/high16 v3, 0x3fc00000    # 1.5f

    mul-float v10, v2, v3

    .line 118
    .local v10, "initialGap":F
    sub-float v11, p4, v8

    .line 119
    .local v11, "dx":F
    sub-float v12, p5, v9

    .line 120
    .local v12, "dy":F
    mul-float v2, v11, v11

    mul-float v3, v12, v12

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    .line 121
    .local v13, "borderLength":D
    invoke-super {v0, v13, v14, v10}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v2

    .line 122
    .local v2, "adjustedGap":F
    iget v3, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    cmpl-float v3, v2, v3

    if-lez v3, :cond_0

    .line 123
    iget v3, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    sub-float/2addr v2, v3

    move v15, v2

    goto :goto_0

    .line 122
    :cond_0
    move v15, v2

    .line 126
    .end local v2    # "adjustedGap":F
    .local v15, "adjustedGap":F
    :goto_0
    nop

    .line 127
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget v3, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    .line 128
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-object v3, v0, Lcom/itextpdf/layout/borders/DottedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 129
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 130
    iget-object v2, v0, Lcom/itextpdf/layout/borders/DottedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 131
    iget v2, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    iget v3, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v15, v4

    add-float/2addr v3, v4

    invoke-virtual {v1, v2, v15, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 133
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    sub-float v3, p4, v8

    sub-float v4, p5, v9

    invoke-direct {v2, v8, v9, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 134
    .local v2, "boundingRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v3, 0x2

    new-array v4, v3, [F

    const/4 v5, 0x0

    aput p6, v4, v5

    const/4 v6, 0x1

    aput p8, v4, v6

    .line 135
    .local v4, "horizontalRadii":[F
    new-array v3, v3, [F

    aput p7, v3, v5

    aput p9, v3, v6

    .line 137
    .local v3, "verticalRadii":[F
    move-object v5, v4

    move-object v4, v3

    move-object v3, v5

    move-object/from16 v5, p10

    move/from16 v6, p11

    move/from16 v7, p12

    .local v3, "horizontalRadii":[F
    .local v4, "verticalRadii":[F
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/layout/borders/DottedBorder;->drawDiscontinuousBorders(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;[F[FLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 138
    return-void
.end method

.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 16
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p7, "borderWidthBefore"    # F
    .param p8, "borderWidthAfter"    # F

    .line 83
    move-object/from16 v0, p0

    move-object/from16 v6, p1

    iget v1, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    const/high16 v2, 0x3fc00000    # 1.5f

    mul-float v7, v1, v2

    .line 84
    .local v7, "initialGap":F
    sub-float v8, p4, p2

    .line 85
    .local v8, "dx":F
    sub-float v9, p5, p3

    .line 86
    .local v9, "dy":F
    mul-float v1, v8, v8

    mul-float v2, v9, v9

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    .line 88
    .local v10, "borderLength":D
    iget v1, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    add-float/2addr v1, v7

    invoke-super {v0, v10, v11, v1}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v1

    .line 89
    .local v1, "adjustedGap":F
    iget v2, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    .line 90
    iget v2, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    sub-float/2addr v1, v2

    move v12, v1

    goto :goto_0

    .line 89
    :cond_0
    move v12, v1

    .line 93
    .end local v1    # "adjustedGap":F
    .local v12, "adjustedGap":F
    :goto_0
    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/DottedBorder;->getStartingPointsForBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)[F

    move-result-object v13

    .line 94
    .local v13, "startingPoints":[F
    const/4 v1, 0x0

    aget v1, v13, v1

    .line 95
    .end local p2    # "x1":F
    .local v1, "x1":F
    const/4 v2, 0x1

    aget v2, v13, v2

    .line 96
    .end local p3    # "y1":F
    .local v2, "y1":F
    const/4 v3, 0x2

    aget v3, v13, v3

    .line 97
    .end local p4    # "x2":F
    .local v3, "x2":F
    const/4 v4, 0x3

    aget v4, v13, v4

    .line 99
    .end local p5    # "y2":F
    .local v4, "y2":F
    nop

    .line 100
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    iget v14, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    .line 101
    invoke-virtual {v5, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    iget-object v14, v0, Lcom/itextpdf/layout/borders/DottedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 102
    invoke-virtual {v14}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v14

    invoke-virtual {v5, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 103
    iget-object v5, v0, Lcom/itextpdf/layout/borders/DottedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 104
    iget v5, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    iget v14, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    const/high16 v15, 0x40000000    # 2.0f

    div-float v15, v12, v15

    add-float/2addr v14, v15

    .line 105
    invoke-virtual {v6, v5, v12, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    float-to-double v14, v1

    move/from16 p2, v1

    .end local v1    # "x1":F
    .restart local p2    # "x1":F
    float-to-double v0, v2

    .line 106
    invoke-virtual {v5, v14, v15, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v14, v3

    move/from16 p3, v2

    .end local v2    # "y1":F
    .restart local p3    # "y1":F
    float-to-double v1, v4

    invoke-virtual {v0, v14, v15, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 107
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 110
    return-void
.end method

.method public drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V
    .locals 16
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 145
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    iget v6, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    const/high16 v7, 0x3fc00000    # 1.5f

    mul-float/2addr v6, v7

    .line 146
    .local v6, "initialGap":F
    sub-float v7, v4, v2

    .line 147
    .local v7, "dx":F
    sub-float v8, v5, v3

    .line 148
    .local v8, "dy":F
    mul-float v9, v7, v7

    mul-float v10, v8, v8

    add-float/2addr v9, v10

    float-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v9

    .line 150
    .local v9, "borderLength":D
    iget v11, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    add-float/2addr v11, v6

    invoke-super {v0, v9, v10, v11}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v11

    .line 151
    .local v11, "adjustedGap":F
    iget v12, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    cmpl-float v12, v11, v12

    if-lez v12, :cond_0

    .line 152
    iget v12, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    sub-float/2addr v11, v12

    .line 155
    :cond_0
    nop

    .line 156
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v12

    iget v13, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    .line 157
    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v12

    iget-object v13, v0, Lcom/itextpdf/layout/borders/DottedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 158
    invoke-virtual {v13}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 159
    iget-object v12, v0, Lcom/itextpdf/layout/borders/DottedBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v12, v1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 160
    iget v12, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    iget v13, v0, Lcom/itextpdf/layout/borders/DottedBorder;->width:F

    const/high16 v14, 0x40000000    # 2.0f

    div-float v14, v11, v14

    add-float/2addr v13, v14

    .line 161
    invoke-virtual {v1, v12, v11, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v12

    float-to-double v13, v2

    float-to-double v0, v3

    .line 162
    invoke-virtual {v12, v13, v14, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v12, v4

    float-to-double v14, v5

    .line 163
    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 164
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 166
    return-void
.end method

.method public getType()I
    .locals 1

    .line 75
    const/4 v0, 0x2

    return v0
.end method
