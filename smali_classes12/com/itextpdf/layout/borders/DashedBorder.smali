.class public Lcom/itextpdf/layout/borders/DashedBorder;
.super Lcom/itextpdf/layout/borders/Border;
.source "DashedBorder.java"


# static fields
.field private static final DASH_MODIFIER:F = 5.0f

.field private static final GAP_MODIFIER:F = 3.5f


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .param p1, "width"    # F

    .line 48
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/borders/Border;-><init>(F)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F

    .line 58
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 69
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 70
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 26
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

    .line 105
    move-object/from16 v0, p0

    iget v1, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    const/high16 v2, 0x40600000    # 3.5f

    mul-float/2addr v1, v2

    .line 106
    .local v1, "initialGap":F
    iget v2, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    const/high16 v3, 0x40a00000    # 5.0f

    mul-float v8, v2, v3

    .line 107
    .local v8, "dash":F
    sub-float v2, p4, p2

    .line 108
    .local v2, "dx":F
    sub-float v3, p5, p3

    .line 109
    .local v3, "dy":F
    mul-float v4, v2, v2

    mul-float v5, v3, v3

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    .line 110
    .local v11, "borderLength":D
    add-float v4, v1, v8

    invoke-super {v0, v11, v12, v4}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v4

    .line 111
    .local v4, "adjustedGap":F
    cmpl-float v5, v4, v8

    if-lez v5, :cond_0

    .line 112
    sub-float/2addr v4, v8

    move v9, v4

    goto :goto_0

    .line 111
    :cond_0
    move v9, v4

    .line 114
    .end local v4    # "adjustedGap":F
    .local v9, "adjustedGap":F
    :goto_0
    new-instance v4, Lcom/itextpdf/layout/borders/FixedDashedBorder;

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/DashedBorder;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    iget v6, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/DashedBorder;->getOpacity()F

    move-result v7

    const/high16 v10, 0x40000000    # 2.0f

    div-float v10, v9, v10

    add-float/2addr v10, v8

    invoke-direct/range {v4 .. v10}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 115
    move-object/from16 v14, p1

    move/from16 v15, p2

    move/from16 v16, p3

    move/from16 v17, p4

    move/from16 v18, p5

    move/from16 v19, p6

    move/from16 v20, p7

    move/from16 v21, p8

    move/from16 v22, p9

    move-object/from16 v23, p10

    move/from16 v24, p11

    move/from16 v25, p12

    move-object v13, v4

    invoke-virtual/range {v13 .. v25}, Lcom/itextpdf/layout/borders/FixedDashedBorder;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 117
    return-void
.end method

.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 22
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p7, "borderWidthBefore"    # F
    .param p8, "borderWidthAfter"    # F

    .line 86
    move-object/from16 v0, p0

    iget v1, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    const/high16 v2, 0x40600000    # 3.5f

    mul-float/2addr v1, v2

    .line 87
    .local v1, "initialGap":F
    iget v2, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    const/high16 v3, 0x40a00000    # 5.0f

    mul-float v8, v2, v3

    .line 88
    .local v8, "dash":F
    sub-float v2, p4, p2

    .line 89
    .local v2, "dx":F
    sub-float v3, p5, p3

    .line 90
    .local v3, "dy":F
    mul-float v4, v2, v2

    mul-float v5, v3, v3

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    .line 92
    .local v11, "borderLength":D
    add-float v4, v1, v8

    invoke-super {v0, v11, v12, v4}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v4

    .line 93
    .local v4, "adjustedGap":F
    cmpl-float v5, v4, v8

    if-lez v5, :cond_0

    .line 94
    sub-float/2addr v4, v8

    move v9, v4

    goto :goto_0

    .line 93
    :cond_0
    move v9, v4

    .line 97
    .end local v4    # "adjustedGap":F
    .local v9, "adjustedGap":F
    :goto_0
    new-instance v13, Lcom/itextpdf/layout/borders/FixedDashedBorder;

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/DashedBorder;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    iget v6, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/DashedBorder;->getOpacity()F

    move-result v7

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v9, v4

    add-float v10, v8, v4

    move-object v4, v13

    invoke-direct/range {v4 .. v10}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 98
    move-object/from16 v14, p1

    move/from16 v15, p2

    move/from16 v16, p3

    move/from16 v17, p4

    move/from16 v18, p5

    move-object/from16 v19, p6

    move/from16 v20, p7

    move/from16 v21, p8

    invoke-virtual/range {v13 .. v21}, Lcom/itextpdf/layout/borders/FixedDashedBorder;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 99
    return-void
.end method

.method public drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V
    .locals 20
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 124
    move-object/from16 v0, p0

    iget v1, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    const/high16 v2, 0x40600000    # 3.5f

    mul-float/2addr v1, v2

    .line 125
    .local v1, "initialGap":F
    iget v2, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    const/high16 v3, 0x40a00000    # 5.0f

    mul-float v8, v2, v3

    .line 126
    .local v8, "dash":F
    sub-float v2, p4, p2

    .line 127
    .local v2, "dx":F
    sub-float v3, p5, p3

    .line 128
    .local v3, "dy":F
    mul-float v4, v2, v2

    mul-float v5, v3, v3

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    .line 130
    .local v11, "borderLength":D
    add-float v4, v1, v8

    invoke-super {v0, v11, v12, v4}, Lcom/itextpdf/layout/borders/Border;->getDotsGap(DF)F

    move-result v4

    .line 131
    .local v4, "adjustedGap":F
    cmpl-float v5, v4, v8

    if-lez v5, :cond_0

    .line 132
    sub-float/2addr v4, v8

    move v9, v4

    goto :goto_0

    .line 131
    :cond_0
    move v9, v4

    .line 135
    .end local v4    # "adjustedGap":F
    .local v9, "adjustedGap":F
    :goto_0
    new-instance v13, Lcom/itextpdf/layout/borders/FixedDashedBorder;

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/DashedBorder;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    iget v6, v0, Lcom/itextpdf/layout/borders/DashedBorder;->width:F

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/DashedBorder;->getOpacity()F

    move-result v7

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v9, v4

    add-float v10, v8, v4

    move-object v4, v13

    invoke-direct/range {v4 .. v10}, Lcom/itextpdf/layout/borders/FixedDashedBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 136
    move-object/from16 v14, p1

    move/from16 v15, p2

    move/from16 v16, p3

    move/from16 v17, p4

    move/from16 v18, p5

    move-object/from16 v19, p6

    invoke-virtual/range {v13 .. v19}, Lcom/itextpdf/layout/borders/FixedDashedBorder;->drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V

    .line 137
    return-void
.end method

.method public getType()I
    .locals 1

    .line 77
    const/4 v0, 0x1

    return v0
.end method
