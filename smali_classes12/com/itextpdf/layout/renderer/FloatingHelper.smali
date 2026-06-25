.class Lcom/itextpdf/layout/renderer/FloatingHelper;
.super Ljava/lang/Object;
.source "FloatingHelper.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static adjustBlockAreaAccordingToFloatRenderers(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)V
    .locals 8
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "blockWidth"    # F
    .param p3, "isFloatLeft"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "FZ)V"
        }
    .end annotation

    .line 169
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 170
    if-nez p3, :cond_0

    .line 171
    invoke-static {p1, p2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustBoxForFloatRight(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 173
    :cond_0
    return-void

    .line 177
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_2

    .line 178
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    .local v0, "currY":F
    goto :goto_0

    .line 181
    .end local v0    # "currY":F
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    .line 183
    .restart local v0    # "currY":F
    :goto_0
    const/4 v2, 0x0

    .line 184
    .local v2, "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v3, 0x0

    .line 185
    .local v3, "left":F
    const/4 v4, 0x0

    .line 186
    .local v4, "right":F
    :goto_1
    if-eqz v2, :cond_5

    sub-float v5, v4, v3

    cmpg-float v5, v5, p2

    if-gez v5, :cond_3

    goto :goto_2

    .line 207
    :cond_3
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 208
    sub-float v1, v4, v3

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 210
    if-nez p3, :cond_4

    .line 211
    invoke-static {p1, p2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustBoxForFloatRight(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 213
    :cond_4
    return-void

    .line 187
    :cond_5
    :goto_2
    const/4 v5, 0x0

    if-eqz v2, :cond_9

    .line 188
    if-eqz p3, :cond_7

    .line 189
    aget-object v6, v2, v5

    if-eqz v6, :cond_6

    aget-object v6, v2, v5

    goto :goto_3

    :cond_6
    aget-object v6, v2, v1

    :goto_3
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v6

    move v0, v6

    .end local v0    # "currY":F
    .local v6, "currY":F
    goto :goto_5

    .line 191
    .end local v6    # "currY":F
    .restart local v0    # "currY":F
    :cond_7
    aget-object v6, v2, v1

    if-eqz v6, :cond_8

    aget-object v6, v2, v1

    goto :goto_4

    :cond_8
    aget-object v6, v2, v5

    :goto_4
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v6

    move v0, v6

    .line 194
    :cond_9
    :goto_5
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v6

    sub-float v6, v0, v6

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 195
    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->getBoxesAtYLevel(Ljava/util/List;F)Ljava/util/List;

    move-result-object v6

    .line 196
    .local v6, "yLevelBoxes":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_b

    .line 197
    if-nez p3, :cond_a

    .line 198
    invoke-static {p1, p2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustBoxForFloatRight(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 200
    :cond_a
    return-void

    .line 202
    :cond_b
    invoke-static {p1, v6}, Lcom/itextpdf/layout/renderer/FloatingHelper;->findLastLeftAndRightBoxes(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)[Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 203
    aget-object v7, v2, v5

    if-eqz v7, :cond_c

    aget-object v5, v2, v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    goto :goto_6

    :cond_c
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    :goto_6
    move v3, v5

    .line 204
    aget-object v5, v2, v1

    if-eqz v5, :cond_d

    aget-object v5, v2, v1

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    goto :goto_7

    :cond_d
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    :goto_7
    move v4, v5

    .line 205
    .end local v6    # "yLevelBoxes":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    goto :goto_1
.end method

.method static adjustBlockFormattingContextLayoutBox(Lcom/itextpdf/layout/renderer/BlockRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FF)F
    .locals 9
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/BlockRenderer;
    .param p2, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "blockWidth"    # F
    .param p4, "clearHeightCorrection"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/BlockRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "FF)F"
        }
    .end annotation

    .line 310
    .local p1, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_6

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isRendererCreateBfc(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 314
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    .line 315
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    sub-float/2addr v3, p4

    .line 314
    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 316
    .local v0, "currY":F
    invoke-static {p1, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->getBoxesAtYLevel(Ljava/util/List;F)Ljava/util/List;

    move-result-object v3

    .line 317
    .local v3, "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-static {p2, v3}, Lcom/itextpdf/layout/renderer/FloatingHelper;->findLastLeftAndRightBoxes(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)[Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 318
    .local v4, "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v5, 0x0

    aget-object v6, v4, v5

    if-nez v6, :cond_1

    aget-object v6, v4, v2

    if-nez v6, :cond_1

    .line 319
    return v1

    .line 322
    :cond_1
    aget-object v6, v4, v5

    if-nez v6, :cond_2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    goto :goto_0

    :cond_2
    aget-object v5, v4, v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    .line 323
    .local v5, "leftX":F
    :goto_0
    aget-object v6, v4, v2

    if-nez v6, :cond_3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    goto :goto_1

    :cond_3
    aget-object v6, v4, v2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    .line 324
    .local v6, "rightX":F
    :goto_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v7

    invoke-static {p3, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    sub-float v8, v6, v5

    cmpg-float v7, v7, v8

    if-gtz v7, :cond_4

    .line 325
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    sub-float v2, v5, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v7

    sub-float/2addr v7, v6

    invoke-static {v1, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    add-float/2addr v2, v7

    .line 326
    .local v2, "width":F
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v7

    invoke-static {v7, v5}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-virtual {p2, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 327
    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 328
    return v1

    .line 331
    .end local v2    # "width":F
    :cond_4
    const v7, 0x7f7fffff    # Float.MAX_VALUE

    invoke-static {v2, v2, v7, v4, p1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateLowestFloatBottom(ZZF[Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)F

    move-result v2

    .line 333
    .local v2, "lowestFloatBottom":F
    cmpg-float v7, v2, v7

    if-gez v7, :cond_5

    .line 334
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v1

    sub-float/2addr v1, v2

    const v7, 0x38d1b717    # 1.0E-4f

    add-float/2addr v1, v7

    .line 335
    .local v1, "adjustedHeightDelta":F
    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 336
    return v1

    .line 338
    .end local v1    # "adjustedHeightDelta":F
    :cond_5
    return v1

    .line 312
    .end local v0    # "currY":F
    .end local v2    # "lowestFloatBottom":F
    .end local v3    # "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v4    # "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "leftX":F
    .end local v6    # "rightX":F
    :cond_6
    :goto_2
    return v1
.end method

.method private static adjustBoxForFloatRight(Lcom/itextpdf/kernel/geom/Rectangle;F)V
    .locals 1
    .param p0, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "blockWidth"    # F

    .line 402
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v0

    sub-float/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 403
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 404
    return-void
.end method

.method static adjustFloatedBlockLayoutBox(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Ljava/lang/Float;
    .locals 6
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "blockWidth"    # Ljava/lang/Float;
    .param p4, "floatPropertyValue"    # Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .param p5, "overflowX"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/AbstractRenderer;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/lang/Float;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/layout/properties/FloatPropertyValue;",
            "Lcom/itextpdf/layout/properties/OverflowPropertyValue;",
            ")",
            "Ljava/lang/Float;"
        }
    .end annotation

    .line 140
    .local p3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v0, 0x1c

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 143
    invoke-static {p5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v0

    .line 144
    .local v0, "overflowFit":Z
    if-eqz p2, :cond_0

    .line 145
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateAdditionalWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v2

    add-float/2addr v1, v2

    .line 146
    .local v1, "floatElemWidth":F
    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    cmpl-float v2, v1, v2

    if-lez v2, :cond_3

    .line 147
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    goto :goto_0

    .line 150
    .end local v1    # "floatElemWidth":F
    :cond_0
    invoke-static {p0, p4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateMinMaxWidthForFloat(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    .line 152
    .local v1, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v2

    .line 153
    .local v2, "maxWidth":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    cmpl-float v3, v2, v3

    if-lez v3, :cond_1

    .line 154
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    .line 156
    :cond_1
    if-nez v0, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    .line 157
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v2

    .line 159
    :cond_2
    const v3, 0x38d1b717    # 1.0E-4f

    add-float v4, v2, v3

    .line 160
    .local v4, "floatElemWidth":F
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getAdditionalWidth()F

    move-result v5

    sub-float v5, v2, v5

    add-float/2addr v5, v3

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    move v1, v4

    .line 163
    .end local v2    # "maxWidth":F
    .end local v4    # "floatElemWidth":F
    .local v1, "floatElemWidth":F
    :cond_3
    :goto_0
    sget-object v2, Lcom/itextpdf/layout/properties/FloatPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-virtual {v2, p4}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {p3, p1, v1, v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustBlockAreaAccordingToFloatRenderers(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)V

    .line 164
    return-object p2
.end method

.method static adjustFloatedTableLayoutBox(Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/kernel/geom/Rectangle;FLjava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;)V
    .locals 6
    .param p0, "tableRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "tableWidth"    # F
    .param p4, "floatPropertyValue"    # Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/TableRenderer;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "F",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/layout/properties/FloatPropertyValue;",
            ")V"
        }
    .end annotation

    .line 124
    .local p3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v0, 0x1c

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 125
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 126
    .local v0, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    const-string v3, "Property {0} in percents is not supported"

    const-class v4, Lcom/itextpdf/layout/renderer/FloatingHelper;

    if-nez v2, :cond_0

    .line 127
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 128
    .local v2, "logger":Lorg/slf4j/Logger;
    nop

    .line 129
    const/16 v5, 0x2d

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 128
    invoke-static {v3, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 131
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/4 v2, 0x3

    aget-object v5, v0, v2

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_1

    .line 132
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 133
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 134
    const/16 v5, 0x2c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 133
    invoke-static {v3, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 136
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_1
    aget-object v1, v0, v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    add-float/2addr v1, p2

    aget-object v2, v0, v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    add-float/2addr v1, v2

    sget-object v2, Lcom/itextpdf/layout/properties/FloatPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-virtual {v2, p4}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {p3, p1, v1, v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustBlockAreaAccordingToFloatRenderers(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)V

    .line 137
    return-void
.end method

.method static adjustLayoutBoxAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;FLcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)F
    .locals 9
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "boxWidth"    # Ljava/lang/Float;
    .param p3, "clearHeightCorrection"    # F
    .param p4, "marginsCollapseHandler"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/lang/Float;",
            "F",
            "Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;",
            ")F"
        }
    .end annotation

    .line 57
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    move v0, p3

    .line 60
    .local v0, "topShift":F
    const/4 v1, 0x0

    .line 62
    .local v1, "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_3

    .line 63
    aget-object v5, v1, v4

    if-eqz v5, :cond_1

    aget-object v5, v1, v4

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    goto :goto_0

    :cond_1
    move v5, v2

    .line 64
    .local v5, "bottomLeft":F
    :goto_0
    aget-object v6, v1, v3

    if-eqz v6, :cond_2

    aget-object v6, v1, v3

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v6

    goto :goto_1

    :cond_2
    move v6, v2

    .line 65
    .local v6, "bottomRight":F
    :goto_1
    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v7

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    sub-float/2addr v7, v8

    .line 66
    .local v7, "updatedHeight":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    sub-float/2addr v8, v7

    move v0, v8

    .line 68
    .end local v5    # "bottomLeft":F
    .end local v6    # "bottomRight":F
    .end local v7    # "updatedHeight":F
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    sub-float/2addr v5, v0

    invoke-static {p0, v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->getBoxesAtYLevel(Ljava/util/List;F)Ljava/util/List;

    move-result-object v5

    .line 69
    .local v5, "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 70
    invoke-static {p1, p4, v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->applyClearance(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;FZ)V

    .line 71
    return v0

    .line 74
    :cond_4
    invoke-static {p1, v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->findLastLeftAndRightBoxes(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)[Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 75
    aget-object v6, v1, v4

    if-eqz v6, :cond_5

    aget-object v6, v1, v4

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    goto :goto_2

    :cond_5
    const/4 v6, 0x1

    .line 76
    .local v6, "left":F
    :goto_2
    aget-object v7, v1, v3

    if-eqz v7, :cond_6

    aget-object v2, v1, v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    .line 78
    .local v2, "right":F
    :cond_6
    cmpl-float v3, v6, v2

    if-gtz v3, :cond_9

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    cmpl-float v3, v6, v3

    if-gtz v3, :cond_9

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v3

    cmpg-float v3, v2, v3

    if-gez v3, :cond_7

    goto :goto_3

    .line 82
    :cond_7
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    cmpl-float v3, v2, v3

    if-lez v3, :cond_8

    .line 83
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    .line 85
    :cond_8
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v3

    cmpg-float v3, v6, v3

    if-gez v3, :cond_a

    .line 86
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    goto :goto_4

    .line 79
    :cond_9
    :goto_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    .line 80
    move v2, v6

    .line 89
    .end local v5    # "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_a
    :goto_4
    if-eqz p2, :cond_b

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sub-float v5, v2, v6

    cmpl-float v3, v3, v5

    if-gtz v3, :cond_0

    .line 91
    :cond_b
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    sub-float v5, v2, v6

    cmpl-float v3, v3, v5

    if-lez v3, :cond_c

    .line 92
    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    sub-float v5, v2, v6

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 95
    :cond_c
    invoke-static {p1, p4, v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->applyClearance(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;FZ)V

    .line 96
    return v0
.end method

.method static adjustLineAreaAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")V"
        }
    .end annotation

    .line 51
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustLayoutBoxAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;FLcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)F

    .line 52
    return-void
.end method

.method static adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "clearHeightCorrection"    # F
    .param p4, "bfcHeightCorrection"    # F
    .param p5, "marginsCollapsingEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "FFZ)",
            "Lcom/itextpdf/layout/layout/LayoutArea;"
        }
    .end annotation

    .line 236
    .local p1, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    .line 237
    .local v0, "occupiedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    move-object v1, v0

    .line 238
    .local v1, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 239
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    .line 240
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 241
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 244
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 245
    :cond_1
    const v2, 0x38d1b717    # 1.0E-4f

    cmpl-float v3, p3, v2

    if-lez v3, :cond_2

    if-nez p5, :cond_2

    .line 246
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    .line 247
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 248
    :cond_2
    cmpl-float v2, p4, v2

    if-lez v2, :cond_3

    .line 249
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    .line 250
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, p4}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 253
    :cond_3
    :goto_0
    return-object v1
.end method

.method static adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 6
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "clearHeightCorrection"    # F
    .param p4, "marginsCollapsingEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "FZ)",
            "Lcom/itextpdf/layout/layout/LayoutArea;"
        }
    .end annotation

    .line 229
    .local p1, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v5, p4

    .end local p0    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local p1    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local p2    # "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "clearHeightCorrection":F
    .end local p4    # "marginsCollapsingEnabled":Z
    .local v0, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v1, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v2, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v3, "clearHeightCorrection":F
    .local v5, "marginsCollapsingEnabled":Z
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object p0

    return-object p0
.end method

.method static applyClearance(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;FZ)V
    .locals 1
    .param p0, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "marginsCollapseHandler"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .param p2, "clearHeightAdjustment"    # F
    .param p3, "isFloat"    # Z

    .line 342
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_0

    .line 343
    return-void

    .line 346
    :cond_0
    if-eqz p1, :cond_2

    if-eqz p3, :cond_1

    goto :goto_0

    .line 349
    :cond_1
    invoke-virtual {p1, p2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyClearance(F)V

    goto :goto_1

    .line 347
    :cond_2
    :goto_0
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 351
    :goto_1
    return-void
.end method

.method static calculateClearHeightCorrection(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)F
    .locals 10
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")F"
        }
    .end annotation

    .line 286
    .local p1, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v0, 0x64

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 287
    .local v0, "clearPropertyValue":Lcom/itextpdf/layout/properties/ClearPropertyValue;
    const/4 v1, 0x0

    .line 288
    .local v1, "clearHeightCorrection":F
    if-eqz v0, :cond_6

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_3

    .line 292
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 294
    .local v2, "currY":F
    invoke-static {p1, v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->getBoxesAtYLevel(Ljava/util/List;F)Ljava/util/List;

    move-result-object v4

    .line 295
    .local v4, "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-static {p2, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->findLastLeftAndRightBoxes(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)[Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    .line 296
    .local v5, "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    sget-object v6, Lcom/itextpdf/layout/properties/ClearPropertyValue;->BOTH:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 297
    .local v6, "isBoth":Z
    sget-object v7, Lcom/itextpdf/layout/properties/ClearPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 298
    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/4 v8, 0x0

    if-nez v7, :cond_2

    if-eqz v6, :cond_1

    goto :goto_0

    :cond_1
    move v7, v8

    goto :goto_1

    :cond_2
    :goto_0
    move v7, v3

    :goto_1
    sget-object v9, Lcom/itextpdf/layout/properties/ClearPropertyValue;->RIGHT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    .line 299
    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    if-eqz v6, :cond_3

    goto :goto_2

    :cond_3
    move v3, v8

    .line 297
    :cond_4
    :goto_2
    const v8, 0x7f7fffff    # Float.MAX_VALUE

    invoke-static {v7, v3, v8, v5, p1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateLowestFloatBottom(ZZF[Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)F

    move-result v3

    .line 301
    .local v3, "lowestFloatBottom":F
    cmpg-float v7, v3, v8

    if-gez v7, :cond_5

    .line 302
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v7

    sub-float/2addr v7, v3

    const v8, 0x38d1b717    # 1.0E-4f

    add-float v1, v7, v8

    .line 305
    :cond_5
    return v1

    .line 289
    .end local v2    # "currY":F
    .end local v3    # "lowestFloatBottom":F
    .end local v4    # "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v5    # "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v6    # "isBoth":Z
    :cond_6
    :goto_3
    return v1
.end method

.method static calculateLineShiftUnderFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/lang/Float;
    .locals 8
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")",
            "Ljava/lang/Float;"
        }
    .end annotation

    .line 100
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->getBoxesAtYLevel(Ljava/util/List;F)Ljava/util/List;

    move-result-object v0

    .line 101
    .local v0, "boxesAtYLevel":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 102
    return-object v2

    .line 105
    :cond_0
    invoke-static {p1, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->findLastLeftAndRightBoxes(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)[Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 106
    .local v1, "lastLeftAndRightBoxes":[Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v3, 0x0

    aget-object v4, v1, v3

    if-eqz v4, :cond_1

    aget-object v4, v1, v3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v4

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v4

    .line 107
    .local v4, "left":F
    :goto_0
    const/4 v5, 0x1

    aget-object v6, v1, v5

    if-eqz v6, :cond_2

    aget-object v6, v1, v5

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    .line 108
    .local v6, "right":F
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v7

    cmpg-float v7, v7, v4

    if-ltz v7, :cond_4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v7

    cmpl-float v7, v7, v6

    if-lez v7, :cond_3

    goto :goto_2

    .line 120
    :cond_3
    return-object v2

    .line 110
    :cond_4
    :goto_2
    aget-object v2, v1, v3

    if-eqz v2, :cond_5

    aget-object v2, v1, v5

    if-eqz v2, :cond_5

    .line 111
    aget-object v2, v1, v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    aget-object v3, v1, v5

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .local v2, "maxLastFloatBottom":F
    goto :goto_3

    .line 112
    .end local v2    # "maxLastFloatBottom":F
    :cond_5
    aget-object v2, v1, v3

    if-eqz v2, :cond_6

    .line 113
    aget-object v2, v1, v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    .restart local v2    # "maxLastFloatBottom":F
    goto :goto_3

    .line 115
    .end local v2    # "maxLastFloatBottom":F
    :cond_6
    aget-object v2, v1, v5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    .line 118
    .restart local v2    # "maxLastFloatBottom":F
    :goto_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    sub-float/2addr v3, v2

    const v5, 0x38d1b717    # 1.0E-4f

    add-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    return-object v3
.end method

.method private static calculateLowestFloatBottom(ZZF[Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)F
    .locals 5
    .param p0, "isLeftOrBoth"    # Z
    .param p1, "isRightOrBoth"    # Z
    .param p2, "lowestFloatBottom"    # F
    .param p3, "lastLeftAndRightBoxes"    # [Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZF[",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;)F"
        }
    .end annotation

    .line 440
    .local p4, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    if-eqz p0, :cond_1

    const/4 v0, 0x0

    aget-object v1, p3, v0

    if-eqz v1, :cond_1

    .line 441
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 442
    .local v2, "floatBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    cmpg-float v3, v3, p2

    if-gez v3, :cond_0

    .line 443
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v3

    aget-object v4, p3, v0

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_0

    .line 444
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result p2

    .line 446
    .end local v2    # "floatBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    goto :goto_0

    .line 448
    :cond_1
    if-eqz p1, :cond_3

    const/4 v0, 0x1

    aget-object v1, p3, v0

    if-eqz v1, :cond_3

    .line 449
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 450
    .restart local v2    # "floatBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    cmpg-float v3, v3, p2

    if-gez v3, :cond_2

    .line 451
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    aget-object v4, p3, v0

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_2

    .line 452
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result p2

    .line 454
    .end local v2    # "floatBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_2
    goto :goto_1

    .line 456
    :cond_3
    return p2
.end method

.method static calculateMinMaxWidthForFloat(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "floatPropertyVal"    # Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 274
    const/16 v0, 0x63

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnProperty(I)Z

    move-result v1

    .line 275
    .local v1, "floatPropIsRendererOwn":Z
    sget-object v2, Lcom/itextpdf/layout/properties/FloatPropertyValue;->NONE:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 276
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v2

    .line 277
    .local v2, "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    if-eqz v1, :cond_0

    .line 278
    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_0

    .line 280
    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    .line 282
    :goto_0
    return-object v2
.end method

.method private static findLastLeftAndRightBoxes(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;)[Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 6
    .param p0, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;)[",
            "Lcom/itextpdf/kernel/geom/Rectangle;"
        }
    .end annotation

    .line 407
    .local p1, "yLevelBoxes":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/4 v0, 0x0

    .line 408
    .local v0, "lastLeftFloatAtY":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x0

    .line 409
    .local v1, "lastRightFloatAtY":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    .line 410
    .local v2, "left":F
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 411
    .local v4, "box":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    cmpg-float v5, v5, v2

    if-gez v5, :cond_0

    .line 412
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    .line 414
    .end local v4    # "box":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    goto :goto_0

    .line 415
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 416
    .restart local v4    # "box":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    cmpl-float v5, v2, v5

    if-ltz v5, :cond_2

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    cmpg-float v5, v2, v5

    if-gez v5, :cond_2

    .line 417
    move-object v0, v4

    .line 418
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    goto :goto_2

    .line 420
    :cond_2
    move-object v1, v4

    .line 422
    .end local v4    # "box":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_2
    goto :goto_1

    .line 424
    :cond_3
    const/4 v3, 0x2

    new-array v3, v3, [Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    return-object v3
.end method

.method private static getBoxesAtYLevel(Ljava/util/List;F)Ljava/util/List;
    .locals 5
    .param p1, "currY"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;F)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;"
        }
    .end annotation

    .line 428
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 429
    .local v0, "yLevelBoxes":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 430
    .local v2, "box":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    const v4, 0x38d1b717    # 1.0E-4f

    add-float/2addr v3, v4

    cmpg-float v3, v3, p1

    if-gez v3, :cond_0

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    add-float/2addr v3, v4

    cmpl-float v3, v3, p1

    if-ltz v3, :cond_0

    .line 431
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 433
    .end local v2    # "box":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    goto :goto_0

    .line 434
    :cond_1
    return-object v0
.end method

.method static includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/Set;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 4
    .param p1, "occupiedAreaBbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;)",
            "Lcom/itextpdf/kernel/geom/Rectangle;"
        }
    .end annotation

    .line 262
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local p2, "nonChildFloatingRendererAreas":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 263
    .local v1, "floatBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-interface {p2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    goto :goto_0

    .line 268
    :cond_0
    const/4 v2, 0x2

    new-array v2, v2, [Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-static {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    .line 269
    .end local v1    # "floatBox":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_0

    .line 270
    :cond_1
    return-object p1
.end method

.method static includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/Set;)V
    .locals 2
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;)V"
        }
    .end annotation

    .line 257
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local p2, "nonChildFloatingRendererAreas":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/Set;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 258
    .local v0, "commonRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 259
    return-void
.end method

.method static isClearanceApplied(Ljava/util/List;Lcom/itextpdf/layout/properties/ClearPropertyValue;)Z
    .locals 5
    .param p1, "clearPropertyValue"    # Lcom/itextpdf/layout/properties/ClearPropertyValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Lcom/itextpdf/layout/properties/ClearPropertyValue;",
            ")Z"
        }
    .end annotation

    .line 364
    .local p0, "floatingRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    sget-object v1, Lcom/itextpdf/layout/properties/ClearPropertyValue;->NONE:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 367
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 368
    .local v2, "floatingRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    const/16 v3, 0x63

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 370
    .local v3, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    sget-object v4, Lcom/itextpdf/layout/properties/ClearPropertyValue;->BOTH:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-virtual {p1, v4}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 371
    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    sget-object v4, Lcom/itextpdf/layout/properties/ClearPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-virtual {p1, v4}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    :cond_1
    sget-object v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;->RIGHT:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 372
    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v4, Lcom/itextpdf/layout/properties/ClearPropertyValue;->RIGHT:Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-virtual {p1, v4}, Lcom/itextpdf/layout/properties/ClearPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_1

    .line 375
    .end local v2    # "floatingRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    :cond_2
    goto :goto_0

    .line 373
    .restart local v2    # "floatingRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v3    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    :cond_3
    :goto_1
    const/4 v0, 0x1

    return v0

    .line 376
    .end local v2    # "floatingRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    :cond_4
    return v0

    .line 365
    :cond_5
    :goto_2
    return v0
.end method

.method static isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 354
    const/16 v0, 0x63

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v0

    return v0
.end method

.method static isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "kidFloatPropertyVal"    # Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 358
    const/16 v0, 0x34

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 359
    .local v0, "position":Ljava/lang/Integer;
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_0

    goto :goto_0

    :cond_0
    move v3, v1

    goto :goto_1

    :cond_1
    :goto_0
    move v3, v2

    .line 360
    .local v3, "notAbsolutePos":Z
    :goto_1
    if-eqz v3, :cond_2

    if-eqz p1, :cond_2

    sget-object v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;->NONE:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-virtual {p1, v4}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    move v1, v2

    :cond_2
    return v1
.end method

.method static removeFloatsAboveRendererBottom(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 3
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ")V"
        }
    .end annotation

    .line 216
    .local p0, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 217
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    .line 218
    .local v0, "bottom":F
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 219
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    cmpl-float v2, v2, v0

    if-ltz v2, :cond_0

    .line 220
    invoke-interface {p0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 218
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 224
    .end local v0    # "bottom":F
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method static removeParentArtifactsOnPageSplitIfOnlyFloatsOverflow(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 5
    .param p0, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 380
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 381
    const/16 v0, 0x5a

    invoke-interface {p0, v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 382
    const/16 v0, 0x6a

    invoke-interface {p0, v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 384
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    .line 385
    .local v0, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/16 v2, 0xd

    invoke-interface {p0, v2, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 386
    const/16 v2, 0xa

    invoke-interface {p0, v2, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 387
    const/4 v1, 0x1

    aget-object v2, v0, v1

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 388
    new-instance v2, Lcom/itextpdf/layout/borders/SolidBorder;

    sget-object v4, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    aget-object v1, v0, v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    invoke-direct {v2, v4, v1, v3}, Lcom/itextpdf/layout/borders/SolidBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    const/16 v1, 0xc

    invoke-interface {p0, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 390
    :cond_0
    const/4 v1, 0x3

    aget-object v2, v0, v1

    if-eqz v2, :cond_1

    .line 391
    new-instance v2, Lcom/itextpdf/layout/borders/SolidBorder;

    sget-object v4, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    aget-object v1, v0, v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    invoke-direct {v2, v4, v1, v3}, Lcom/itextpdf/layout/borders/SolidBorder;-><init>(Lcom/itextpdf/kernel/colors/Color;FF)V

    const/16 v1, 0xb

    invoke-interface {p0, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 394
    :cond_1
    const/16 v1, 0x2e

    invoke-static {v3}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 395
    const/16 v1, 0x2b

    invoke-static {v3}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 396
    const/16 v1, 0x32

    invoke-static {v3}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 397
    const/16 v1, 0x2f

    invoke-static {v3}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 399
    return-void
.end method
