.class public Lcom/itextpdf/layout/borders/SolidBorder;
.super Lcom/itextpdf/layout/borders/Border;
.source "SolidBorder.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .param p1, "width"    # F

    .line 40
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/borders/Border;-><init>(F)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FF)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    .line 62
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 22
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

    .line 122
    const/4 v7, 0x0

    .local v7, "x3":F
    const/4 v8, 0x0

    .line 123
    .local v8, "y3":F
    const/4 v9, 0x0

    .local v9, "x4":F
    const/4 v10, 0x0

    .line 130
    .local v10, "y4":F
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p10

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/SolidBorder;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v11

    .line 131
    .local v11, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object v5, Lcom/itextpdf/layout/borders/SolidBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {v11}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v12

    aget v5, v5, v12

    const/4 v12, 0x0

    packed-switch v5, :pswitch_data_0

    move/from16 v4, p4

    move/from16 v12, p5

    move-object/from16 v21, v11

    .end local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v21, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    goto/16 :goto_4

    .line 215
    .end local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    :pswitch_0
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v7, p4, v5

    .line 216
    add-float v8, p5, p12

    .line 217
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v9, v1, v5

    .line 218
    sub-float v10, v2, p11

    .line 220
    sub-float v5, p7, p11

    invoke-static {v12, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 221
    .local v5, "innerRadiusBefore":F
    iget v13, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v13, p6, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 222
    .local v13, "innerRadiusFirst":F
    iget v14, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v14, p8, v14

    invoke-static {v12, v14}, Ljava/lang/Math;->max(FF)F

    move-result v14

    .line 223
    .local v14, "innerRadiusSecond":F
    sub-float v15, p9, p12

    invoke-static {v12, v15}, Ljava/lang/Math;->max(FF)F

    move-result v15

    .line 225
    .local v15, "innerRadiusAfter":F
    cmpl-float v16, v13, v5

    if-lez v16, :cond_0

    .line 226
    move/from16 v16, v12

    new-instance v12, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v17, v13

    move/from16 v18, v14

    .end local v13    # "innerRadiusFirst":F
    .end local v14    # "innerRadiusSecond":F
    .local v17, "innerRadiusFirst":F
    .local v18, "innerRadiusSecond":F
    float-to-double v13, v1

    move/from16 v19, v5

    .end local v5    # "innerRadiusBefore":F
    .local v19, "innerRadiusBefore":F
    float-to-double v5, v2

    invoke-direct {v12, v13, v14, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v13, v9

    move/from16 v20, v7

    .end local v7    # "x3":F
    .local v20, "x3":F
    float-to-double v6, v10

    invoke-direct {v5, v13, v14, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v13, v1

    add-float v7, v2, v19

    move/from16 v21, v8

    .end local v8    # "y3":F
    .local v21, "y3":F
    float-to-double v7, v7

    invoke-direct {v6, v13, v14, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    add-float v8, v1, v17

    float-to-double v13, v8

    add-float v8, v2, v19

    float-to-double v3, v8

    invoke-direct {v7, v13, v14, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v12, v5, v6, v7}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v3

    double-to-float v1, v3

    .line 227
    .end local p2    # "x1":F
    .local v1, "x1":F
    add-float v2, v2, v19

    .end local p3    # "y1":F
    .local v2, "y1":F
    goto :goto_0

    .line 228
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v17    # "innerRadiusFirst":F
    .end local v18    # "innerRadiusSecond":F
    .end local v19    # "innerRadiusBefore":F
    .end local v20    # "x3":F
    .end local v21    # "y3":F
    .restart local v5    # "innerRadiusBefore":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v13    # "innerRadiusFirst":F
    .restart local v14    # "innerRadiusSecond":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    :cond_0
    move/from16 v19, v5

    move/from16 v20, v7

    move/from16 v21, v8

    move/from16 v16, v12

    move/from16 v17, v13

    move/from16 v18, v14

    .end local v5    # "innerRadiusBefore":F
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v13    # "innerRadiusFirst":F
    .end local v14    # "innerRadiusSecond":F
    .restart local v17    # "innerRadiusFirst":F
    .restart local v18    # "innerRadiusSecond":F
    .restart local v19    # "innerRadiusBefore":F
    .restart local v20    # "x3":F
    .restart local v21    # "y3":F
    cmpl-float v3, v16, v19

    if-eqz v3, :cond_1

    cmpl-float v3, v16, v17

    if-eqz v3, :cond_1

    .line 229
    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v4, v1

    float-to-double v6, v2

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v4, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v5, v9

    float-to-double v7, v10

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    add-float v6, v1, v17

    float-to-double v6, v6

    float-to-double v12, v2

    invoke-direct {v5, v6, v7, v12, v13}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    add-float v7, v1, v17

    float-to-double v7, v7

    add-float v12, v2, v19

    float-to-double v12, v12

    invoke-direct {v6, v7, v8, v12, v13}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v3

    double-to-float v2, v3

    .line 230
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    add-float v1, v1, v17

    .line 233
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    :cond_1
    :goto_0
    cmpl-float v3, v15, v18

    if-lez v3, :cond_2

    .line 234
    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v4, p4

    float-to-double v5, v4

    move/from16 v12, p5

    float-to-double v7, v12

    invoke-direct {v3, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v6, v20

    .end local v20    # "x3":F
    .local v6, "x3":F
    float-to-double v7, v6

    move/from16 p2, v1

    move/from16 p3, v2

    move/from16 v13, v21

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v21    # "y3":F
    .local v13, "y3":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    float-to-double v1, v13

    invoke-direct {v5, v7, v8, v1, v2}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    add-float v2, v4, v18

    float-to-double v7, v2

    move v14, v9

    move/from16 v20, v10

    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .local v14, "x4":F
    .local v20, "y4":F
    float-to-double v9, v12

    invoke-direct {v1, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    add-float v7, v4, v18

    float-to-double v7, v7

    sub-float v9, v12, v15

    float-to-double v9, v9

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v3, v5, v1, v2}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    .line 235
    .end local p5    # "y2":F
    .local v1, "y2":F
    add-float v2, v4, v18

    move v12, v1

    move v4, v2

    move v7, v6

    move-object/from16 v21, v11

    move v8, v13

    move v9, v14

    move/from16 v10, v20

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p4    # "x2":F
    .local v2, "x2":F
    goto/16 :goto_4

    .line 236
    .end local v6    # "x3":F
    .end local v13    # "y3":F
    .end local v14    # "x4":F
    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .local v1, "x1":F
    .local v2, "y1":F
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v20, "x3":F
    .restart local v21    # "y3":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_2
    move/from16 v4, p4

    move/from16 v12, p5

    move/from16 p2, v1

    move/from16 p3, v2

    move v14, v9

    move/from16 v6, v20

    move/from16 v13, v21

    move/from16 v20, v10

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .end local v21    # "y3":F
    .restart local v6    # "x3":F
    .restart local v13    # "y3":F
    .restart local v14    # "x4":F
    .local v20, "y4":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    cmpl-float v1, v16, v15

    if-eqz v1, :cond_3

    cmpl-float v1, v16, v18

    if-eqz v1, :cond_3

    .line 237
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v2, v4

    float-to-double v7, v12

    invoke-direct {v1, v2, v3, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v7, v6

    float-to-double v9, v13

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v7, v4

    sub-float v5, v12, v15

    float-to-double v9, v5

    invoke-direct {v3, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    add-float v7, v4, v18

    float-to-double v7, v7

    sub-float v9, v12, v15

    float-to-double v9, v9

    invoke-direct {v5, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    double-to-float v1, v1

    .line 238
    .end local p4    # "x2":F
    .local v1, "x2":F
    sub-float v2, v12, v15

    move v4, v1

    move v12, v2

    move v7, v6

    move-object/from16 v21, v11

    move v8, v13

    move v9, v14

    move/from16 v10, v20

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p5    # "y2":F
    .local v2, "y2":F
    goto/16 :goto_4

    .line 243
    .end local v1    # "x2":F
    .end local v2    # "y2":F
    .end local v15    # "innerRadiusAfter":F
    .end local v17    # "innerRadiusFirst":F
    .end local v18    # "innerRadiusSecond":F
    .end local v19    # "innerRadiusBefore":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_3
    move/from16 v1, p2

    move/from16 v2, p3

    move v7, v6

    move-object/from16 v21, v11

    move v8, v13

    move v9, v14

    move/from16 v10, v20

    goto/16 :goto_4

    .line 188
    .end local v6    # "x3":F
    .end local v13    # "y3":F
    .end local v14    # "x4":F
    .end local v20    # "y4":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    :pswitch_1
    move/from16 v4, p4

    move/from16 v16, v12

    move/from16 v12, p5

    sub-float v7, v4, p12

    .line 189
    iget v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v8, v12, v3

    .line 190
    add-float v9, v1, p11

    .line 191
    iget v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v10, v2, v3

    .line 193
    sub-float v3, p6, p11

    move/from16 v5, v16

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 194
    .local v3, "innerRadiusBefore":F
    iget v6, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v6, p7, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 195
    .local v6, "innerRadiusFirst":F
    iget v13, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v13, p9, v13

    invoke-static {v5, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 196
    .local v13, "innerRadiusSecond":F
    sub-float v14, p8, p12

    invoke-static {v5, v14}, Ljava/lang/Math;->max(FF)F

    move-result v14

    .line 198
    .local v14, "innerRadiusAfter":F
    cmpl-float v5, v6, v3

    if-lez v5, :cond_4

    .line 199
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    move v15, v13

    move/from16 v17, v14

    .end local v13    # "innerRadiusSecond":F
    .end local v14    # "innerRadiusAfter":F
    .local v15, "innerRadiusSecond":F
    .local v17, "innerRadiusAfter":F
    float-to-double v13, v1

    move/from16 v19, v6

    move/from16 v18, v7

    .end local v6    # "innerRadiusFirst":F
    .end local v7    # "x3":F
    .local v18, "x3":F
    .local v19, "innerRadiusFirst":F
    float-to-double v6, v2

    invoke-direct {v5, v13, v14, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v13, v9

    move/from16 v20, v8

    .end local v8    # "y3":F
    .local v20, "y3":F
    float-to-double v7, v10

    invoke-direct {v6, v13, v14, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    sub-float v8, v1, v3

    float-to-double v13, v8

    move-object/from16 v21, v11

    .end local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .local v21, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    float-to-double v11, v2

    invoke-direct {v7, v13, v14, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    sub-float v11, v1, v3

    float-to-double v11, v11

    add-float v13, v2, v19

    float-to-double v13, v13

    invoke-direct {v8, v11, v12, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v5

    double-to-float v2, v5

    .line 200
    .end local p3    # "y1":F
    .local v2, "y1":F
    sub-float/2addr v1, v3

    .end local p2    # "x1":F
    .local v1, "x1":F
    goto :goto_1

    .line 201
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v15    # "innerRadiusSecond":F
    .end local v17    # "innerRadiusAfter":F
    .end local v18    # "x3":F
    .end local v19    # "innerRadiusFirst":F
    .end local v20    # "y3":F
    .end local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v6    # "innerRadiusFirst":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v13    # "innerRadiusSecond":F
    .restart local v14    # "innerRadiusAfter":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    :cond_4
    move/from16 v19, v6

    move/from16 v18, v7

    move/from16 v20, v8

    move-object/from16 v21, v11

    move v15, v13

    move/from16 v17, v14

    .end local v6    # "innerRadiusFirst":F
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .end local v13    # "innerRadiusSecond":F
    .end local v14    # "innerRadiusAfter":F
    .restart local v15    # "innerRadiusSecond":F
    .restart local v17    # "innerRadiusAfter":F
    .restart local v18    # "x3":F
    .restart local v19    # "innerRadiusFirst":F
    .restart local v20    # "y3":F
    .restart local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    const/16 v16, 0x0

    cmpl-float v5, v16, v3

    if-eqz v5, :cond_5

    cmpl-float v5, v16, v19

    if-eqz v5, :cond_5

    .line 202
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v1

    float-to-double v11, v2

    invoke-direct {v5, v6, v7, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v7, v9

    float-to-double v11, v10

    invoke-direct {v6, v7, v8, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v11, v1

    add-float v8, v2, v19

    float-to-double v13, v8

    invoke-direct {v7, v11, v12, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    sub-float v11, v1, v3

    float-to-double v11, v11

    add-float v13, v2, v19

    float-to-double v13, v13

    invoke-direct {v8, v11, v12, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v5

    double-to-float v1, v5

    .line 203
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    add-float v2, v2, v19

    .line 206
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    :cond_5
    :goto_1
    cmpl-float v5, v17, v15

    if-lez v5, :cond_6

    .line 207
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v4

    move/from16 v12, p5

    float-to-double v13, v12

    invoke-direct {v5, v6, v7, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v7, v18

    .end local v18    # "x3":F
    .restart local v7    # "x3":F
    float-to-double v13, v7

    move/from16 p2, v1

    move/from16 p3, v2

    move/from16 v8, v20

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v20    # "y3":F
    .restart local v8    # "y3":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    float-to-double v1, v8

    invoke-direct {v6, v13, v14, v1, v2}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v13, v4

    add-float v2, v12, v15

    move v11, v3

    .end local v3    # "innerRadiusBefore":F
    .local v11, "innerRadiusBefore":F
    float-to-double v2, v2

    invoke-direct {v1, v13, v14, v2, v3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    add-float v3, v4, v17

    float-to-double v13, v3

    add-float v3, v12, v15

    move/from16 v18, v9

    move/from16 v20, v10

    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .local v18, "x4":F
    .local v20, "y4":F
    float-to-double v9, v3

    invoke-direct {v2, v13, v14, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v1, v2}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    double-to-float v1, v1

    .line 208
    .end local p4    # "x2":F
    .local v1, "x2":F
    add-float v2, v12, v15

    move v4, v1

    move v12, v2

    move/from16 v9, v18

    move/from16 v10, v20

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p5    # "y2":F
    .local v2, "y2":F
    goto/16 :goto_4

    .line 209
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v11    # "innerRadiusBefore":F
    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .local v1, "x1":F
    .local v2, "y1":F
    .restart local v3    # "innerRadiusBefore":F
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v18, "x3":F
    .local v20, "y3":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_6
    move/from16 v12, p5

    move/from16 p2, v1

    move/from16 p3, v2

    move v11, v3

    move/from16 v7, v18

    move/from16 v8, v20

    move/from16 v18, v9

    move/from16 v20, v10

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "innerRadiusBefore":F
    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v11    # "innerRadiusBefore":F
    .local v18, "x4":F
    .local v20, "y4":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    const/16 v16, 0x0

    cmpl-float v1, v16, v17

    if-eqz v1, :cond_7

    cmpl-float v1, v16, v15

    if-eqz v1, :cond_7

    .line 210
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v2, v4

    float-to-double v5, v12

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v5, v7

    float-to-double v9, v8

    invoke-direct {v2, v5, v6, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    add-float v5, v4, v17

    float-to-double v5, v5

    float-to-double v9, v12

    invoke-direct {v3, v5, v6, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    add-float v6, v4, v17

    float-to-double v9, v6

    add-float v6, v12, v15

    float-to-double v13, v6

    invoke-direct {v5, v9, v10, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    .line 211
    .end local p5    # "y2":F
    .local v1, "y2":F
    add-float v2, v4, v17

    move v12, v1

    move v4, v2

    move/from16 v9, v18

    move/from16 v10, v20

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p4    # "x2":F
    .local v2, "x2":F
    goto/16 :goto_4

    .line 243
    .end local v1    # "y2":F
    .end local v2    # "x2":F
    .end local v11    # "innerRadiusBefore":F
    .end local v15    # "innerRadiusSecond":F
    .end local v17    # "innerRadiusAfter":F
    .end local v19    # "innerRadiusFirst":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_7
    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v9, v18

    move/from16 v10, v20

    goto/16 :goto_4

    .line 160
    .end local v18    # "x4":F
    .end local v20    # "y4":F
    .end local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v11, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    :pswitch_2
    move/from16 v4, p4

    move/from16 v12, p5

    move-object/from16 v21, v11

    .end local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    iget v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v7, v4, v3

    .line 161
    sub-float v8, v12, p12

    .line 162
    iget v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v9, v1, v3

    .line 163
    add-float v10, v2, p11

    .line 165
    sub-float v3, p7, p11

    const/4 v5, 0x0

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 166
    .restart local v3    # "innerRadiusBefore":F
    iget v6, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v6, p6, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 167
    .restart local v6    # "innerRadiusFirst":F
    iget v11, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v11, p8, v11

    invoke-static {v5, v11}, Ljava/lang/Math;->max(FF)F

    move-result v11

    .line 168
    .local v11, "innerRadiusSecond":F
    sub-float v13, p9, p12

    invoke-static {v5, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 170
    .local v13, "innerRadiusAfter":F
    cmpl-float v5, v6, v3

    if-lez v5, :cond_8

    .line 171
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v1

    move/from16 v18, v6

    move/from16 v17, v7

    .end local v6    # "innerRadiusFirst":F
    .end local v7    # "x3":F
    .local v17, "x3":F
    .local v18, "innerRadiusFirst":F
    float-to-double v6, v2

    invoke-direct {v5, v14, v15, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v9

    move/from16 v19, v8

    .end local v8    # "y3":F
    .local v19, "y3":F
    float-to-double v7, v10

    invoke-direct {v6, v14, v15, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v1

    sub-float v8, v2, v3

    move/from16 v20, v11

    .end local v11    # "innerRadiusSecond":F
    .local v20, "innerRadiusSecond":F
    float-to-double v11, v8

    invoke-direct {v7, v14, v15, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    sub-float v11, v1, v18

    float-to-double v11, v11

    sub-float v14, v2, v3

    float-to-double v14, v14

    invoke-direct {v8, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v5

    double-to-float v1, v5

    .line 172
    .end local p2    # "x1":F
    .local v1, "x1":F
    sub-float/2addr v2, v3

    .end local p3    # "y1":F
    .local v2, "y1":F
    goto :goto_2

    .line 173
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v17    # "x3":F
    .end local v18    # "innerRadiusFirst":F
    .end local v19    # "y3":F
    .end local v20    # "innerRadiusSecond":F
    .restart local v6    # "innerRadiusFirst":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v11    # "innerRadiusSecond":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    :cond_8
    move/from16 v18, v6

    move/from16 v17, v7

    move/from16 v19, v8

    move/from16 v20, v11

    .end local v6    # "innerRadiusFirst":F
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v11    # "innerRadiusSecond":F
    .restart local v17    # "x3":F
    .restart local v18    # "innerRadiusFirst":F
    .restart local v19    # "y3":F
    .restart local v20    # "innerRadiusSecond":F
    const/16 v16, 0x0

    cmpl-float v5, v16, v3

    if-eqz v5, :cond_9

    cmpl-float v5, v16, v18

    if-eqz v5, :cond_9

    .line 174
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v1

    float-to-double v11, v2

    invoke-direct {v5, v6, v7, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v7, v9

    float-to-double v11, v10

    invoke-direct {v6, v7, v8, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    sub-float v8, v1, v18

    float-to-double v11, v8

    float-to-double v14, v2

    invoke-direct {v7, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    sub-float v11, v1, v18

    float-to-double v11, v11

    sub-float v14, v2, v3

    float-to-double v14, v14

    invoke-direct {v8, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v5

    double-to-float v2, v5

    .line 175
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    sub-float v1, v1, v18

    .line 178
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    :cond_9
    :goto_2
    cmpl-float v5, v13, v20

    if-lez v5, :cond_a

    .line 179
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v4

    move/from16 v12, p5

    float-to-double v14, v12

    invoke-direct {v5, v6, v7, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v7, v17

    .end local v17    # "x3":F
    .restart local v7    # "x3":F
    float-to-double v14, v7

    move/from16 p2, v1

    move/from16 p3, v2

    move/from16 v8, v19

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v19    # "y3":F
    .restart local v8    # "y3":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    float-to-double v1, v8

    invoke-direct {v6, v14, v15, v1, v2}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    sub-float v2, v4, v20

    float-to-double v14, v2

    move v11, v3

    .end local v3    # "innerRadiusBefore":F
    .local v11, "innerRadiusBefore":F
    float-to-double v2, v12

    invoke-direct {v1, v14, v15, v2, v3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    sub-float v3, v4, v20

    float-to-double v14, v3

    add-float v3, v12, v13

    move/from16 v17, v9

    move/from16 v19, v10

    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .local v17, "x4":F
    .local v19, "y4":F
    float-to-double v9, v3

    invoke-direct {v2, v14, v15, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v1, v2}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    .line 180
    .end local p5    # "y2":F
    .local v1, "y2":F
    sub-float v2, v4, v20

    move v12, v1

    move v4, v2

    move/from16 v9, v17

    move/from16 v10, v19

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p4    # "x2":F
    .local v2, "x2":F
    goto/16 :goto_4

    .line 181
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v11    # "innerRadiusBefore":F
    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .local v1, "x1":F
    .local v2, "y1":F
    .restart local v3    # "innerRadiusBefore":F
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v17, "x3":F
    .local v19, "y3":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_a
    move/from16 v12, p5

    move/from16 p2, v1

    move/from16 p3, v2

    move v11, v3

    move/from16 v7, v17

    move/from16 v8, v19

    move/from16 v17, v9

    move/from16 v19, v10

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "innerRadiusBefore":F
    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v11    # "innerRadiusBefore":F
    .local v17, "x4":F
    .local v19, "y4":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    const/16 v16, 0x0

    cmpl-float v1, v16, v13

    if-eqz v1, :cond_e

    cmpl-float v1, v16, v20

    if-eqz v1, :cond_e

    .line 182
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v2, v4

    float-to-double v5, v12

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v5, v7

    float-to-double v9, v8

    invoke-direct {v2, v5, v6, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v5, v4

    add-float v9, v12, v13

    float-to-double v9, v9

    invoke-direct {v3, v5, v6, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    sub-float v6, v4, v20

    float-to-double v9, v6

    add-float v6, v12, v13

    float-to-double v14, v6

    invoke-direct {v5, v9, v10, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    double-to-float v1, v1

    .line 183
    .end local p4    # "x2":F
    .local v1, "x2":F
    add-float v2, v12, v13

    move v4, v1

    move v12, v2

    move/from16 v9, v17

    move/from16 v10, v19

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p5    # "y2":F
    .local v2, "y2":F
    goto/16 :goto_4

    .line 133
    .end local v1    # "x2":F
    .end local v2    # "y2":F
    .end local v13    # "innerRadiusAfter":F
    .end local v17    # "x4":F
    .end local v18    # "innerRadiusFirst":F
    .end local v19    # "y4":F
    .end local v20    # "innerRadiusSecond":F
    .end local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v11, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :pswitch_3
    move/from16 v4, p4

    move/from16 v12, p5

    move-object/from16 v21, v11

    .end local v11    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    .restart local v21    # "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    add-float v7, v4, p12

    .line 134
    iget v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v8, v12, v3

    .line 135
    sub-float v9, v1, p11

    .line 136
    iget v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v10, v2, v3

    .line 138
    sub-float v3, p6, p11

    const/4 v5, 0x0

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 139
    .restart local v3    # "innerRadiusBefore":F
    iget v6, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v6, p7, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 140
    .restart local v6    # "innerRadiusFirst":F
    iget v11, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v11, p9, v11

    invoke-static {v5, v11}, Ljava/lang/Math;->max(FF)F

    move-result v11

    .line 141
    .local v11, "innerRadiusSecond":F
    sub-float v13, p8, p12

    invoke-static {v5, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 143
    .restart local v13    # "innerRadiusAfter":F
    cmpl-float v5, v3, v6

    if-lez v5, :cond_b

    .line 144
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v1

    move/from16 v18, v6

    move/from16 v17, v7

    .end local v6    # "innerRadiusFirst":F
    .end local v7    # "x3":F
    .local v17, "x3":F
    .restart local v18    # "innerRadiusFirst":F
    float-to-double v6, v2

    invoke-direct {v5, v14, v15, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v9

    move/from16 v19, v8

    .end local v8    # "y3":F
    .local v19, "y3":F
    float-to-double v7, v10

    invoke-direct {v6, v14, v15, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v9

    sub-float v8, v2, v18

    move/from16 v20, v11

    .end local v11    # "innerRadiusSecond":F
    .restart local v20    # "innerRadiusSecond":F
    float-to-double v11, v8

    invoke-direct {v7, v14, v15, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    add-float v11, v1, v3

    float-to-double v11, v11

    sub-float v14, v2, v18

    float-to-double v14, v14

    invoke-direct {v8, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v5

    double-to-float v1, v5

    .line 145
    .end local p2    # "x1":F
    .local v1, "x1":F
    sub-float v2, v2, v18

    .end local p3    # "y1":F
    .local v2, "y1":F
    goto :goto_3

    .line 146
    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v17    # "x3":F
    .end local v18    # "innerRadiusFirst":F
    .end local v19    # "y3":F
    .end local v20    # "innerRadiusSecond":F
    .restart local v6    # "innerRadiusFirst":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v11    # "innerRadiusSecond":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    :cond_b
    move/from16 v18, v6

    move/from16 v17, v7

    move/from16 v19, v8

    move/from16 v20, v11

    .end local v6    # "innerRadiusFirst":F
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v11    # "innerRadiusSecond":F
    .restart local v17    # "x3":F
    .restart local v18    # "innerRadiusFirst":F
    .restart local v19    # "y3":F
    .restart local v20    # "innerRadiusSecond":F
    const/16 v16, 0x0

    cmpl-float v5, v16, v3

    if-eqz v5, :cond_c

    cmpl-float v5, v16, v18

    if-eqz v5, :cond_c

    .line 147
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v1

    float-to-double v11, v2

    invoke-direct {v5, v6, v7, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v7, v9

    float-to-double v11, v10

    invoke-direct {v6, v7, v8, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    add-float v8, v1, v3

    float-to-double v11, v8

    float-to-double v14, v2

    invoke-direct {v7, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    add-float v11, v1, v3

    float-to-double v11, v11

    sub-float v14, v2, v18

    float-to-double v14, v14

    invoke-direct {v8, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v5

    double-to-float v2, v5

    .line 148
    .end local p3    # "y1":F
    .restart local v2    # "y1":F
    add-float/2addr v1, v3

    .line 150
    .end local p2    # "x1":F
    .restart local v1    # "x1":F
    :cond_c
    :goto_3
    cmpl-float v5, v13, v20

    if-lez v5, :cond_d

    .line 151
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v4

    move/from16 v12, p5

    float-to-double v14, v12

    invoke-direct {v5, v6, v7, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v7, v17

    .end local v17    # "x3":F
    .restart local v7    # "x3":F
    float-to-double v14, v7

    move/from16 p2, v1

    move/from16 p3, v2

    move/from16 v8, v19

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v19    # "y3":F
    .restart local v8    # "y3":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    float-to-double v1, v8

    invoke-direct {v6, v14, v15, v1, v2}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v14, v4

    sub-float v2, v12, v20

    move v11, v3

    .end local v3    # "innerRadiusBefore":F
    .local v11, "innerRadiusBefore":F
    float-to-double v2, v2

    invoke-direct {v1, v14, v15, v2, v3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    sub-float v3, v4, v13

    float-to-double v14, v3

    sub-float v3, v12, v20

    move/from16 v17, v9

    move/from16 v19, v10

    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .local v17, "x4":F
    .local v19, "y4":F
    float-to-double v9, v3

    invoke-direct {v2, v14, v15, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v5, v6, v1, v2}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    double-to-float v1, v1

    .line 152
    .end local p4    # "x2":F
    .local v1, "x2":F
    sub-float v2, v12, v20

    move v4, v1

    move v12, v2

    move/from16 v9, v17

    move/from16 v10, v19

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p5    # "y2":F
    .local v2, "y2":F
    goto :goto_4

    .line 153
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .end local v11    # "innerRadiusBefore":F
    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .local v1, "x1":F
    .local v2, "y1":F
    .restart local v3    # "innerRadiusBefore":F
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v17, "x3":F
    .local v19, "y3":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_d
    move/from16 v12, p5

    move/from16 p2, v1

    move/from16 p3, v2

    move v11, v3

    move/from16 v7, v17

    move/from16 v8, v19

    move/from16 v17, v9

    move/from16 v19, v10

    .end local v1    # "x1":F
    .end local v2    # "y1":F
    .end local v3    # "innerRadiusBefore":F
    .end local v9    # "x4":F
    .end local v10    # "y4":F
    .restart local v7    # "x3":F
    .restart local v8    # "y3":F
    .restart local v11    # "innerRadiusBefore":F
    .local v17, "x4":F
    .local v19, "y4":F
    .restart local p2    # "x1":F
    .restart local p3    # "y1":F
    const/16 v16, 0x0

    cmpl-float v1, v16, v13

    if-eqz v1, :cond_e

    cmpl-float v1, v16, v20

    if-eqz v1, :cond_e

    .line 154
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v2, v4

    float-to-double v5, v12

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v5, v7

    float-to-double v9, v8

    invoke-direct {v2, v5, v6, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    sub-float v5, v4, v13

    float-to-double v5, v5

    float-to-double v9, v12

    invoke-direct {v3, v5, v6, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    sub-float v6, v4, v13

    float-to-double v9, v6

    sub-float v6, v12, v20

    float-to-double v14, v6

    invoke-direct {v5, v9, v10, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/itextpdf/layout/borders/SolidBorder;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    .line 155
    .end local p5    # "y2":F
    .local v1, "y2":F
    sub-float v2, v4, v13

    move v12, v1

    move v4, v2

    move/from16 v9, v17

    move/from16 v10, v19

    move/from16 v1, p2

    move/from16 v2, p3

    .end local p4    # "x2":F
    .local v2, "x2":F
    goto :goto_4

    .line 243
    .end local v1    # "y2":F
    .end local v2    # "x2":F
    .end local v11    # "innerRadiusBefore":F
    .end local v13    # "innerRadiusAfter":F
    .end local v18    # "innerRadiusFirst":F
    .end local v20    # "innerRadiusSecond":F
    .restart local p4    # "x2":F
    .restart local p5    # "y2":F
    :cond_e
    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v9, v17

    move/from16 v10, v19

    .end local v17    # "x4":F
    .end local v19    # "y4":F
    .end local p2    # "x1":F
    .end local p3    # "y1":F
    .end local p4    # "x2":F
    .end local p5    # "y2":F
    .local v1, "x1":F
    .local v2, "y1":F
    .local v4, "x2":F
    .restart local v9    # "x4":F
    .restart local v10    # "y4":F
    .local v12, "y2":F
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    iget-object v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 244
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 245
    iget-object v3, v0, Lcom/itextpdf/layout/borders/SolidBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    move-object/from16 v6, p1

    invoke-virtual {v3, v6}, Lcom/itextpdf/layout/properties/TransparentColor;->applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 246
    float-to-double v13, v1

    move v3, v1

    .end local v1    # "x1":F
    .local v3, "x1":F
    float-to-double v0, v2

    .line 247
    invoke-virtual {v6, v13, v14, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v13, v4

    move/from16 p2, v3

    move v1, v4

    .end local v3    # "x1":F
    .end local v4    # "x2":F
    .local v1, "x2":F
    .restart local p2    # "x1":F
    float-to-double v3, v12

    invoke-virtual {v0, v13, v14, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v3, v7

    float-to-double v13, v8

    invoke-virtual {v0, v3, v4, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v3, v9

    float-to-double v13, v10

    invoke-virtual {v0, v3, v4, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    move/from16 v3, p2

    .end local p2    # "x1":F
    .restart local v3    # "x1":F
    float-to-double v4, v3

    float-to-double v13, v2

    invoke-virtual {v0, v4, v5, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 248
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 249
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
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

    .line 78
    move-object/from16 v6, p1

    const/4 v7, 0x0

    .local v7, "x3":F
    const/4 v8, 0x0

    .line 79
    .local v8, "y3":F
    const/4 v9, 0x0

    .local v9, "x4":F
    const/4 v10, 0x0

    .line 81
    .local v10, "y4":F
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/SolidBorder;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v11

    .line 82
    .local v11, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object v5, Lcom/itextpdf/layout/borders/SolidBorder$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {v11}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v12

    aget v5, v5, v12

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 102
    :pswitch_0
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v7, v3, v5

    .line 103
    add-float v8, v4, p8

    .line 104
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v9, v1, v5

    .line 105
    sub-float v10, v2, p7

    goto :goto_0

    .line 96
    :pswitch_1
    sub-float v7, v3, p8

    .line 97
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v8, v4, v5

    .line 98
    add-float v9, v1, p7

    .line 99
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    sub-float v10, v2, v5

    .line 100
    goto :goto_0

    .line 90
    :pswitch_2
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v7, v3, v5

    .line 91
    sub-float v8, v4, p8

    .line 92
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v9, v1, v5

    .line 93
    add-float v10, v2, p7

    .line 94
    goto :goto_0

    .line 84
    :pswitch_3
    add-float v7, v3, p8

    .line 85
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v8, v4, v5

    .line 86
    sub-float v9, v1, p7

    .line 87
    iget v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    add-float v10, v2, v5

    .line 88
    nop

    .line 109
    :goto_0
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    iget-object v12, v0, Lcom/itextpdf/layout/borders/SolidBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 110
    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v12

    invoke-virtual {v5, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 111
    iget-object v5, v0, Lcom/itextpdf/layout/borders/SolidBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/TransparentColor;->applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 112
    float-to-double v12, v1

    float-to-double v14, v2

    .line 113
    invoke-virtual {v6, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    float-to-double v12, v3

    float-to-double v14, v4

    invoke-virtual {v5, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    float-to-double v12, v7

    float-to-double v14, v8

    invoke-virtual {v5, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    float-to-double v12, v9

    float-to-double v14, v10

    invoke-virtual {v5, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    float-to-double v12, v1

    float-to-double v14, v2

    invoke-virtual {v5, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    .line 114
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 115
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
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

    .line 256
    nop

    .line 257
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/borders/SolidBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 258
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 259
    iget-object v0, p0, Lcom/itextpdf/layout/borders/SolidBorder;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 260
    iget v0, p0, Lcom/itextpdf/layout/borders/SolidBorder;->width:F

    .line 261
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p2

    float-to-double v3, p3

    .line 262
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    float-to-double v1, p4

    float-to-double v3, p5

    .line 263
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 264
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 265
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 266
    return-void
.end method

.method public getType()I
    .locals 1

    .line 69
    const/4 v0, 0x0

    return v0
.end method
