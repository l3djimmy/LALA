.class public abstract Lcom/itextpdf/layout/borders/Border3D;
.super Lcom/itextpdf/layout/borders/Border;
.source "Border3D.java"


# static fields
.field private static final GRAY:Lcom/itextpdf/kernel/colors/DeviceRgb;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v1, 0xd0

    const/16 v2, 0xc8

    const/16 v3, 0xd4

    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/layout/borders/Border3D;->GRAY:Lcom/itextpdf/kernel/colors/DeviceRgb;

    return-void
.end method

.method protected constructor <init>(F)V
    .locals 1
    .param p1, "width"    # F

    .line 47
    sget-object v0, Lcom/itextpdf/layout/borders/Border3D;->GRAY:Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/layout/borders/Border3D;-><init>(Lcom/itextpdf/kernel/colors/DeviceRgb;F)V

    .line 48
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/DeviceCmyk;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .param p2, "width"    # F

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 68
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/DeviceCmyk;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 99
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 100
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/DeviceGray;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceGray;
    .param p2, "width"    # F

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 78
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/DeviceGray;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceGray;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 110
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 111
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/DeviceRgb;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceRgb;
    .param p2, "width"    # F

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 58
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/DeviceRgb;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/DeviceRgb;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 89
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

    .line 118
    move-object/from16 v0, p0

    move-object/from16 v6, p1

    const/4 v7, 0x0

    .local v7, "x3":F
    const/4 v8, 0x0

    .line 119
    .local v8, "y3":F
    const/4 v9, 0x0

    .local v9, "x4":F
    const/4 v10, 0x0

    .line 120
    .local v10, "y4":F
    iget v1, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float v11, v1, v2

    .line 121
    .local v11, "widthHalf":F
    div-float v12, p7, v2

    .line 122
    .local v12, "halfOfWidthBefore":F
    div-float v13, p8, v2

    .line 124
    .local v13, "halfOfWidthAfter":F
    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/Border3D;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v14

    .line 125
    .local v14, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object v5, Lcom/itextpdf/layout/borders/Border3D$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {v14}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v15

    aget v5, v5, v15

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 145
    :pswitch_0
    sub-float v7, v3, v11

    .line 146
    add-float v8, v4, v13

    .line 147
    sub-float v9, v1, v11

    .line 148
    sub-float v10, v2, v12

    goto :goto_0

    .line 139
    :pswitch_1
    sub-float v7, v3, v13

    .line 140
    sub-float v8, v4, v11

    .line 141
    add-float v9, v1, v12

    .line 142
    sub-float v10, v2, v11

    .line 143
    goto :goto_0

    .line 133
    :pswitch_2
    add-float v7, v3, v11

    .line 134
    sub-float v8, v4, v13

    .line 135
    add-float v9, v1, v11

    .line 136
    add-float v10, v2, v12

    .line 137
    goto :goto_0

    .line 127
    :pswitch_3
    add-float v7, v3, v13

    .line 128
    add-float v8, v4, v11

    .line 129
    sub-float v9, v1, v12

    .line 130
    add-float v10, v2, v11

    .line 131
    nop

    .line 152
    :goto_0
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 153
    iget-object v5, v0, Lcom/itextpdf/layout/borders/Border3D;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/TransparentColor;->applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 154
    invoke-virtual {v0, v6, v14}, Lcom/itextpdf/layout/borders/Border3D;->setInnerHalfColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/borders/Border$Side;)V

    .line 155
    move v5, v11

    move v15, v12

    .end local v11    # "widthHalf":F
    .end local v12    # "halfOfWidthBefore":F
    .local v5, "widthHalf":F
    .local v15, "halfOfWidthBefore":F
    float-to-double v11, v1

    move/from16 v16, v13

    move-object/from16 v17, v14

    .end local v13    # "halfOfWidthAfter":F
    .end local v14    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v16, "halfOfWidthAfter":F
    .local v17, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    float-to-double v13, v2

    invoke-virtual {v6, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    float-to-double v12, v3

    move/from16 v18, v15

    .end local v15    # "halfOfWidthBefore":F
    .local v18, "halfOfWidthBefore":F
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

    .line 157
    sget-object v11, Lcom/itextpdf/layout/borders/Border3D$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v12

    aget v11, v11, v12

    packed-switch v11, :pswitch_data_1

    goto :goto_1

    .line 177
    :pswitch_4
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    sub-float/2addr v3, v11

    .line 178
    .end local p4    # "x2":F
    .local v3, "x2":F
    add-float v4, v4, p8

    .line 179
    .end local p5    # "y2":F
    .local v4, "y2":F
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    sub-float/2addr v1, v11

    .line 180
    .end local p2    # "x1":F
    .local v1, "x1":F
    sub-float v2, v2, p7

    .end local p3    # "y1":F
    .local v2, "y1":F
    goto :goto_1

    .line 171
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_5
    sub-float v3, v3, p8

    .line 172
    .end local p4    # "x2":F
    .restart local v3    # "x2":F
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    sub-float/2addr v4, v11

    .line 173
    .end local p5    # "y2":F
    .restart local v4    # "y2":F
    add-float v1, v1, p7

    .line 174
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    sub-float/2addr v2, v11

    .line 175
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    goto :goto_1

    .line 165
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_6
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    add-float/2addr v3, v11

    .line 166
    .end local p4    # "x2":F
    .restart local v3    # "x2":F
    sub-float v4, v4, p8

    .line 167
    .end local p5    # "y2":F
    .restart local v4    # "y2":F
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    add-float/2addr v1, v11

    .line 168
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    add-float v2, v2, p7

    .line 169
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    goto :goto_1

    .line 159
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_7
    add-float v3, v3, p8

    .line 160
    .end local p4    # "x2":F
    .restart local v3    # "x2":F
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    add-float/2addr v4, v11

    .line 161
    .end local p5    # "y2":F
    .restart local v4    # "y2":F
    sub-float v1, v1, p7

    .line 162
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    iget v11, v0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    add-float/2addr v2, v11

    .line 163
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    nop

    .line 184
    :goto_1
    move-object/from16 v11, v17

    .end local v17    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v11, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    invoke-virtual {v0, v6, v11}, Lcom/itextpdf/layout/borders/Border3D;->setOuterHalfColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/borders/Border$Side;)V

    .line 185
    float-to-double v12, v1

    float-to-double v14, v2

    invoke-virtual {v6, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v12

    float-to-double v13, v3

    move v15, v5

    .end local v5    # "widthHalf":F
    .local v15, "widthHalf":F
    float-to-double v5, v4

    invoke-virtual {v12, v13, v14, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    float-to-double v12, v7

    move v6, v3

    move v14, v4

    .end local v3    # "x2":F
    .end local v4    # "y2":F
    .local v6, "x2":F
    .local v14, "y2":F
    float-to-double v3, v8

    invoke-virtual {v5, v12, v13, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    float-to-double v4, v9

    float-to-double v12, v10

    invoke-virtual {v3, v4, v5, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    float-to-double v4, v1

    float-to-double v12, v2

    invoke-virtual {v3, v4, v5, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 186
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 187
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
    .locals 5
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 194
    nop

    .line 195
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/borders/Border3D;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 196
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 197
    iget-object v0, p0, Lcom/itextpdf/layout/borders/Border3D;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 198
    iget v0, p0, Lcom/itextpdf/layout/borders/Border3D;->width:F

    .line 199
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p2

    float-to-double v3, p3

    .line 200
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p4

    float-to-double v3, p5

    .line 201
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 202
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 203
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 204
    return-void
.end method

.method protected getDarkerColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/itextpdf/layout/borders/Border3D;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    .line 212
    .local v0, "color":Lcom/itextpdf/kernel/colors/Color;
    instance-of v1, v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    if-eqz v1, :cond_0

    .line 213
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-static {v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;->makeDarker(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceRgb;

    move-result-object v1

    return-object v1

    .line 214
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    if-eqz v1, :cond_1

    .line 215
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    invoke-static {v1}, Lcom/itextpdf/kernel/colors/DeviceCmyk;->makeDarker(Lcom/itextpdf/kernel/colors/DeviceCmyk;)Lcom/itextpdf/kernel/colors/DeviceCmyk;

    move-result-object v1

    return-object v1

    .line 216
    :cond_1
    instance-of v1, v0, Lcom/itextpdf/kernel/colors/DeviceGray;

    if-eqz v1, :cond_2

    .line 217
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/colors/DeviceGray;

    invoke-static {v1}, Lcom/itextpdf/kernel/colors/DeviceGray;->makeDarker(Lcom/itextpdf/kernel/colors/DeviceGray;)Lcom/itextpdf/kernel/colors/DeviceGray;

    move-result-object v1

    return-object v1

    .line 219
    :cond_2
    return-object v0
.end method

.method protected abstract setInnerHalfColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/borders/Border$Side;)V
.end method

.method protected abstract setOuterHalfColor(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/borders/Border$Side;)V
.end method
