.class public Lcom/itextpdf/layout/borders/DoubleBorder;
.super Lcom/itextpdf/layout/borders/Border;
.source "DoubleBorder.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .param p1, "width"    # F

    .line 42
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/borders/Border;-><init>(F)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 55
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
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 19
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

    const/4 v7, 0x0

    .local v7, "x3":F
    const/4 v8, 0x0

    .line 84
    .local v8, "y3":F
    const/4 v9, 0x0

    .local v9, "x4":F
    const/4 v10, 0x0

    .line 85
    .local v10, "y4":F
    iget v1, v0, Lcom/itextpdf/layout/borders/DoubleBorder;->width:F

    const/high16 v2, 0x40400000    # 3.0f

    div-float v11, v1, v2

    .line 86
    .local v11, "thirdOfWidth":F
    div-float v12, p7, v2

    .line 87
    .local v12, "thirdOfWidthBefore":F
    div-float v13, p8, v2

    .line 89
    .local v13, "thirdOfWidthAfter":F
    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/DoubleBorder;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v14

    .line 91
    .local v14, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object v5, Lcom/itextpdf/layout/borders/DoubleBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {v14}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v15

    aget v5, v5, v15

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 111
    :pswitch_0
    sub-float v7, v3, v11

    .line 112
    add-float v8, v4, v13

    .line 113
    sub-float v9, v1, v11

    .line 114
    sub-float v10, v2, v12

    goto :goto_0

    .line 105
    :pswitch_1
    sub-float v7, v3, v13

    .line 106
    sub-float v8, v4, v11

    .line 107
    add-float v9, v1, v12

    .line 108
    sub-float v10, v2, v11

    .line 109
    goto :goto_0

    .line 99
    :pswitch_2
    add-float v7, v3, v11

    .line 100
    sub-float v8, v4, v13

    .line 101
    add-float v9, v1, v11

    .line 102
    add-float v10, v2, v12

    .line 103
    goto :goto_0

    .line 93
    :pswitch_3
    add-float v7, v3, v13

    .line 94
    add-float v8, v4, v11

    .line 95
    sub-float v9, v1, v12

    .line 96
    add-float v10, v2, v11

    .line 97
    nop

    .line 118
    :goto_0
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    iget-object v15, v0, Lcom/itextpdf/layout/borders/DoubleBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 119
    invoke-virtual {v15}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v15

    invoke-virtual {v5, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 120
    iget-object v5, v0, Lcom/itextpdf/layout/borders/DoubleBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/TransparentColor;->applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 121
    move v5, v11

    move v15, v12

    .end local v11    # "thirdOfWidth":F
    .end local v12    # "thirdOfWidthBefore":F
    .local v5, "thirdOfWidth":F
    .local v15, "thirdOfWidthBefore":F
    float-to-double v11, v1

    move/from16 v16, v13

    move-object/from16 v17, v14

    .end local v13    # "thirdOfWidthAfter":F
    .end local v14    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v16, "thirdOfWidthAfter":F
    .local v17, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    float-to-double v13, v2

    .line 122
    invoke-virtual {v6, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v3

    move/from16 v18, v15

    .end local v15    # "thirdOfWidthBefore":F
    .local v18, "thirdOfWidthBefore":F
    float-to-double v14, v4

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v7

    float-to-double v14, v8

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v9

    float-to-double v14, v10

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v1

    float-to-double v14, v2

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 124
    sget-object v11, Lcom/itextpdf/layout/borders/DoubleBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v12

    aget v11, v11, v12

    const/high16 v12, 0x40000000    # 2.0f

    packed-switch v11, :pswitch_data_1

    goto :goto_1

    .line 156
    :pswitch_4
    mul-float v11, v5, v12

    sub-float/2addr v3, v11

    .line 157
    .end local p4    # "x2":F
    .local v3, "x2":F
    mul-float v13, v16, v12

    add-float/2addr v4, v13

    .line 158
    .end local p5    # "y2":F
    .local v4, "y2":F
    mul-float v11, v5, v12

    sub-float/2addr v7, v11

    .line 159
    mul-float v13, v16, v12

    add-float/2addr v8, v13

    .line 160
    mul-float v11, v5, v12

    sub-float/2addr v9, v11

    .line 161
    mul-float v11, v18, v12

    sub-float/2addr v10, v11

    .line 162
    mul-float v11, v5, v12

    sub-float/2addr v1, v11

    .line 163
    .end local p2    # "x1":F
    .local v1, "x1":F
    mul-float v12, v12, v18

    sub-float/2addr v2, v12

    .end local p3    # "y1":F
    .local v2, "y1":F
    goto :goto_1

    .line 146
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_5
    mul-float v13, v16, v12

    sub-float/2addr v3, v13

    .line 147
    .end local p4    # "x2":F
    .restart local v3    # "x2":F
    mul-float v11, v5, v12

    sub-float/2addr v4, v11

    .line 148
    .end local p5    # "y2":F
    .restart local v4    # "y2":F
    mul-float v13, v16, v12

    sub-float/2addr v7, v13

    .line 149
    mul-float v11, v5, v12

    sub-float/2addr v8, v11

    .line 150
    mul-float v11, v18, v12

    add-float/2addr v9, v11

    .line 151
    mul-float v11, v5, v12

    sub-float/2addr v10, v11

    .line 152
    mul-float v11, v18, v12

    add-float/2addr v1, v11

    .line 153
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    mul-float v11, v5, v12

    sub-float/2addr v2, v11

    .line 154
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    goto :goto_1

    .line 136
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_6
    mul-float v11, v5, v12

    add-float/2addr v3, v11

    .line 137
    .end local p4    # "x2":F
    .restart local v3    # "x2":F
    mul-float v13, v16, v12

    sub-float/2addr v4, v13

    .line 138
    .end local p5    # "y2":F
    .restart local v4    # "y2":F
    mul-float v11, v5, v12

    add-float/2addr v7, v11

    .line 139
    mul-float v13, v16, v12

    sub-float/2addr v8, v13

    .line 140
    mul-float v11, v5, v12

    add-float/2addr v9, v11

    .line 141
    mul-float v11, v18, v12

    add-float/2addr v10, v11

    .line 142
    mul-float v11, v5, v12

    add-float/2addr v1, v11

    .line 143
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    mul-float v12, v12, v18

    add-float/2addr v2, v12

    .line 144
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    goto :goto_1

    .line 126
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_7
    mul-float v13, v16, v12

    add-float/2addr v3, v13

    .line 127
    .end local p4    # "x2":F
    .restart local v3    # "x2":F
    mul-float v11, v5, v12

    add-float/2addr v4, v11

    .line 128
    .end local p5    # "y2":F
    .restart local v4    # "y2":F
    mul-float v13, v16, v12

    add-float/2addr v7, v13

    .line 129
    mul-float v11, v5, v12

    add-float/2addr v8, v11

    .line 130
    mul-float v11, v18, v12

    sub-float/2addr v9, v11

    .line 131
    mul-float v11, v5, v12

    add-float/2addr v10, v11

    .line 132
    mul-float v11, v18, v12

    sub-float/2addr v1, v11

    .line 133
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    mul-float v11, v5, v12

    add-float/2addr v2, v11

    .line 134
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    nop

    .line 167
    :goto_1
    float-to-double v11, v1

    float-to-double v13, v2

    invoke-virtual {v6, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v3

    float-to-double v14, v4

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v7

    float-to-double v14, v8

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v9

    float-to-double v14, v10

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v1

    float-to-double v14, v2

    invoke-virtual {v11, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    .line 168
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 169
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V
    .locals 9
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 176
    iget v0, p0, Lcom/itextpdf/layout/borders/DoubleBorder;->width:F

    const/high16 v1, 0x40400000    # 3.0f

    div-float/2addr v0, v1

    .line 178
    .local v0, "thirdOfWidth":F
    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .end local p4    # "x2":F
    .end local p5    # "y2":F
    .end local p6    # "defaultSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v2, "x1":F
    .local v3, "y1":F
    .local v4, "x2":F
    .local v5, "y2":F
    .local v6, "defaultSide":Lcom/itextpdf/layout/borders/Border$Side;
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/layout/borders/DoubleBorder;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object p2

    .line 180
    .local p2, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object p3, Lcom/itextpdf/layout/borders/DoubleBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result p4

    aget p3, p3, p4

    packed-switch p3, :pswitch_data_0

    goto :goto_0

    .line 192
    :pswitch_0
    goto :goto_0

    .line 186
    :pswitch_1
    sub-float p3, v2, v0

    .line 187
    .end local v2    # "x1":F
    .local p3, "x1":F
    sub-float p4, v4, v0

    .line 188
    .end local v4    # "x2":F
    .restart local p4    # "x2":F
    add-float p5, v3, v0

    .line 189
    .end local v3    # "y1":F
    .local p5, "y1":F
    sub-float p6, v5, v0

    .line 190
    .end local v5    # "y2":F
    .local p6, "y2":F
    move v2, p3

    move p3, p5

    move p5, p6

    goto :goto_1

    .line 182
    .end local p3    # "x1":F
    .end local p4    # "x2":F
    .end local p5    # "y1":F
    .end local p6    # "y2":F
    .restart local v2    # "x1":F
    .restart local v3    # "y1":F
    .restart local v4    # "x2":F
    .restart local v5    # "y2":F
    :pswitch_2
    sub-float p3, v3, v0

    .line 183
    .end local v3    # "y1":F
    .local p3, "y1":F
    move p5, p3

    .line 184
    .end local v5    # "y2":F
    .local p5, "y2":F
    move p4, v4

    goto :goto_1

    .line 197
    .end local p3    # "y1":F
    .end local p5    # "y2":F
    .restart local v3    # "y1":F
    .restart local v5    # "y2":F
    :goto_0
    move p3, v3

    move p4, v4

    move p5, v5

    .end local v3    # "y1":F
    .end local v4    # "x2":F
    .end local v5    # "y2":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :goto_1
    nop

    .line 198
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    .line 199
    invoke-virtual {p6, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    iget-object v1, p0, Lcom/itextpdf/layout/borders/DoubleBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 200
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {p6, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 201
    iget-object p6, p0, Lcom/itextpdf/layout/borders/DoubleBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {p6, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 202
    float-to-double v3, v2

    float-to-double v7, p3

    .line 203
    invoke-virtual {p1, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    float-to-double v3, p4

    float-to-double v7, p5

    .line 204
    invoke-virtual {p6, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    .line 205
    invoke-virtual {p6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    .line 206
    invoke-virtual {p6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 208
    sget-object p6, Lcom/itextpdf/layout/borders/DoubleBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v1

    aget p6, p6, v1

    const/high16 v1, 0x40000000    # 2.0f

    packed-switch p6, :pswitch_data_1

    goto :goto_2

    .line 226
    :pswitch_3
    mul-float p6, v0, v1

    add-float/2addr p5, p6

    .line 227
    mul-float p6, v0, v1

    sub-float/2addr v2, p6

    .line 228
    mul-float/2addr v1, v0

    sub-float/2addr p3, v1

    goto :goto_2

    .line 220
    :pswitch_4
    mul-float p6, v0, v1

    sub-float/2addr p4, p6

    .line 221
    mul-float p6, v0, v1

    sub-float/2addr p5, p6

    .line 222
    mul-float p6, v0, v1

    add-float/2addr v2, p6

    .line 223
    mul-float/2addr v1, v0

    sub-float/2addr p3, v1

    .line 224
    goto :goto_2

    .line 215
    :pswitch_5
    mul-float p6, v0, v1

    add-float/2addr p4, p6

    .line 216
    mul-float/2addr v1, v0

    add-float/2addr v2, v1

    .line 218
    goto :goto_2

    .line 211
    :pswitch_6
    mul-float p6, v0, v1

    add-float/2addr p5, p6

    .line 212
    mul-float/2addr v1, v0

    add-float/2addr p3, v1

    .line 213
    nop

    .line 232
    :goto_2
    nop

    .line 233
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    .line 234
    invoke-virtual {p6, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    iget-object v1, p0, Lcom/itextpdf/layout/borders/DoubleBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 235
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {p6, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 236
    iget-object p6, p0, Lcom/itextpdf/layout/borders/DoubleBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {p6, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 237
    float-to-double v3, v2

    float-to-double v7, p3

    .line 238
    invoke-virtual {p1, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    float-to-double v3, p4

    float-to-double v7, p5

    .line 239
    invoke-virtual {p6, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    .line 240
    invoke-virtual {p6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object p6

    .line 241
    invoke-virtual {p6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 242
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public getType()I
    .locals 1

    .line 75
    const/4 v0, 0x3

    return v0
.end method
