.class public Lcom/itextpdf/layout/borders/RoundDotsBorder;
.super Lcom/itextpdf/layout/borders/Border;
.source "RoundDotsBorder.java"


# static fields
.field private static final GAP_MODIFIER:F = 2.5f


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

    .line 141
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v8, p2

    move/from16 v9, p3

    iget v2, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    const/high16 v3, 0x40200000    # 2.5f

    mul-float v10, v2, v3

    .line 142
    .local v10, "initialGap":F
    sub-float v11, p4, v8

    .line 143
    .local v11, "dx":F
    sub-float v12, p5, v9

    .line 144
    .local v12, "dy":F
    mul-float v2, v11, v11

    mul-float v3, v12, v12

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    .line 145
    .local v13, "borderLength":D
    invoke-super {v0, v13, v14, v10}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v15

    .line 147
    .local v15, "adjustedGap":F
    nop

    .line 148
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-object v3, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 149
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 150
    iget-object v2, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 151
    iget v2, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    .line 152
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 153
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v15, v4

    .line 154
    const/4 v5, 0x0

    invoke-virtual {v2, v5, v15, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 156
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    sub-float v4, p4, v8

    sub-float v5, p5, v9

    invoke-direct {v2, v8, v9, v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 157
    .local v2, "boundingRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v4, 0x2

    new-array v5, v4, [F

    const/4 v6, 0x0

    aput p6, v5, v6

    aput p8, v5, v3

    .line 158
    .local v5, "horizontalRadii":[F
    new-array v4, v4, [F

    aput p7, v4, v6

    aput p9, v4, v3

    .line 160
    .local v4, "verticalRadii":[F
    move/from16 v6, p11

    move/from16 v7, p12

    move-object v3, v5

    move-object/from16 v5, p10

    .end local v5    # "horizontalRadii":[F
    .local v3, "horizontalRadii":[F
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/layout/borders/RoundDotsBorder;->drawDiscontinuousBorders(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;[F[FLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 161
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

    iget v1, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    const/high16 v2, 0x40200000    # 2.5f

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

    .line 87
    .local v10, "borderLength":D
    invoke-super {v0, v10, v11, v7}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v12

    .line 89
    .local v12, "adjustedGap":F
    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/RoundDotsBorder;->getStartingPointsForBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)[F

    move-result-object v13

    .line 90
    .local v13, "startingPoints":[F
    const/4 v1, 0x0

    aget v1, v13, v1

    .line 91
    .end local p2    # "x1":F
    .local v1, "x1":F
    const/4 v2, 0x1

    aget v3, v13, v2

    .line 92
    .end local p3    # "y1":F
    .local v3, "y1":F
    const/4 v4, 0x2

    aget v4, v13, v4

    .line 93
    .end local p4    # "x2":F
    .local v4, "x2":F
    const/4 v5, 0x3

    aget v5, v13, v5

    .line 95
    .end local p5    # "y2":F
    .local v5, "y2":F
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v14

    iget-object v15, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 96
    invoke-virtual {v15}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v14

    iget v15, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    .line 97
    invoke-virtual {v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v14

    .line 98
    invoke-virtual {v14, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 99
    iget-object v2, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v2, v6}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 100
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v12, v2

    const/4 v14, 0x0

    invoke-virtual {v6, v14, v12, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    float-to-double v14, v1

    move/from16 p2, v1

    .end local v1    # "x1":F
    .restart local p2    # "x1":F
    float-to-double v0, v3

    .line 101
    invoke-virtual {v2, v14, v15, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, v4

    float-to-double v14, v5

    invoke-virtual {v0, v1, v2, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 104
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

    .line 111
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p5

    iget v5, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    const/high16 v6, 0x40200000    # 2.5f

    mul-float/2addr v5, v6

    .line 112
    .local v5, "initialGap":F
    sub-float v6, p4, v2

    .line 113
    .local v6, "dx":F
    sub-float v7, v4, v3

    .line 114
    .local v7, "dy":F
    mul-float v8, v6, v6

    mul-float v9, v7, v7

    add-float/2addr v8, v9

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    .line 115
    .local v8, "borderLength":D
    invoke-super {v0, v8, v9, v5}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v10

    .line 116
    .local v10, "adjustedGap":F
    const/4 v11, 0x0

    .line 117
    .local v11, "isHorizontal":Z
    sub-float v12, v4, v3

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    const v13, 0x3a03126f    # 5.0E-4f

    cmpg-float v12, v12, v13

    if-gez v12, :cond_0

    .line 118
    const/4 v11, 0x1

    .line 121
    :cond_0
    if-eqz v11, :cond_1

    .line 122
    iget v12, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    sub-float v12, p4, v12

    .end local p4    # "x2":F
    .local v12, "x2":F
    goto :goto_0

    .line 121
    .end local v12    # "x2":F
    .restart local p4    # "x2":F
    :cond_1
    move/from16 v12, p4

    .line 124
    .end local p4    # "x2":F
    .restart local v12    # "x2":F
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 125
    iget-object v13, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v13}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v13

    invoke-virtual {v1, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 126
    iget-object v13, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v13, v1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 127
    iget v13, v0, Lcom/itextpdf/layout/borders/RoundDotsBorder;->width:F

    invoke-virtual {v1, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 128
    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 130
    const/high16 v13, 0x40000000    # 2.0f

    div-float v13, v10, v13

    const/4 v14, 0x0

    invoke-virtual {v1, v14, v10, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    float-to-double v14, v2

    float-to-double v0, v3

    .line 131
    invoke-virtual {v13, v14, v15, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v13, v12

    float-to-double v1, v4

    invoke-virtual {v0, v13, v14, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 132
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 133
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 134
    return-void
.end method

.method public getType()I
    .locals 1

    .line 75
    const/4 v0, 0x4

    return v0
.end method
