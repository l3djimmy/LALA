.class public Lcom/itextpdf/layout/renderer/LineRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "LineRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;,
        Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;,
        Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;
    }
.end annotation


# static fields
.field private static final MIN_MAX_WIDTH_CORRECTION_EPS:F = 0.001f

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field protected levels:[B

.field protected maxAscent:F

.field private maxBlockAscent:F

.field private maxBlockDescent:F

.field protected maxDescent:F

.field maxTextAscent:F

.field maxTextDescent:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 73
    const-class v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>()V

    return-void
.end method

.method static adjustChildPositionsAfterReordering(Ljava/util/List;F)V
    .locals 11
    .param p1, "initialXPos"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;F)V"
        }
    .end annotation

    .line 1115
    .local p0, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move v0, p1

    .line 1116
    .local v0, "currentXPos":F
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1117
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 1119
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_4

    .line 1120
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->calculateLineWidth()F

    move-result v3

    .line 1121
    .local v3, "currentWidth":F
    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 1122
    .local v4, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v5, 0x1

    aget-object v6, v4, v5

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    const-string v7, "Property {0} in percents is not supported"

    if-nez v6, :cond_0

    sget-object v6, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v6}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1123
    sget-object v6, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v8, "right margin"

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1126
    :cond_0
    const/4 v6, 0x3

    aget-object v8, v4, v6

    invoke-virtual {v8}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v8

    if-nez v8, :cond_1

    sget-object v8, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v8}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1127
    sget-object v8, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    const-string v9, "left margin"

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1130
    :cond_1
    move-object v8, v2

    check-cast v8, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v8

    .line 1131
    .local v8, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    aget-object v9, v8, v5

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v9

    if-nez v9, :cond_2

    sget-object v9, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v9}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1132
    sget-object v9, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v10, "right padding"

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1135
    :cond_2
    aget-object v9, v8, v6

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v9

    if-nez v9, :cond_3

    sget-object v9, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v9}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1136
    sget-object v9, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    const-string v10, "left padding"

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v9, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1139
    :cond_3
    aget-object v7, v4, v5

    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    aget-object v9, v4, v6

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    add-float/2addr v7, v9

    aget-object v5, v8, v5

    .line 1140
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    add-float/2addr v7, v5

    aget-object v5, v8, v6

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    add-float/2addr v7, v5

    add-float/2addr v3, v7

    .line 1141
    move-object v5, v2

    check-cast v5, Lcom/itextpdf/layout/renderer/TextRenderer;

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1142
    .end local v4    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v8    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_1

    .line 1143
    .end local v3    # "currentWidth":F
    :cond_4
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    .line 1144
    .restart local v3    # "currentWidth":F
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v4

    sub-float v4, v0, v4

    const/4 v5, 0x0

    invoke-interface {v2, v4, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 1146
    :goto_1
    add-float/2addr v0, v3

    .line 1148
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "currentWidth":F
    :cond_5
    goto/16 :goto_0

    .line 1149
    :cond_6
    return-void
.end method

.method private adjustChildrenYLineDefaultMode()V
    .locals 6

    .line 1594
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    sub-float/2addr v0, v1

    .line 1596
    .local v0, "actualYLine":F
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1597
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1598
    goto :goto_0

    .line 1600
    :cond_0
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    .line 1601
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;->getDescent()F

    move-result v3

    .line 1602
    .local v3, "descent":F
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    sub-float v5, v0, v5

    add-float/2addr v5, v3

    invoke-interface {v2, v4, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 1603
    .end local v3    # "descent":F
    goto :goto_3

    .line 1604
    :cond_1
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->isInlineBlockChild(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-eqz v3, :cond_2

    instance-of v3, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v3, :cond_2

    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1605
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getLastYLineRecursively()Ljava/lang/Float;

    move-result-object v3

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    .line 1606
    .local v3, "yLine":Ljava/lang/Float;
    :goto_1
    if-nez v3, :cond_3

    .line 1607
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    goto :goto_2

    :cond_3
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    :goto_2
    sub-float v5, v0, v5

    .line 1606
    invoke-interface {v2, v4, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 1609
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "yLine":Ljava/lang/Float;
    :goto_3
    goto :goto_0

    .line 1610
    :cond_4
    return-void
.end method

.method private adjustLineOnFloatPlaced(Lcom/itextpdf/kernel/geom/Rectangle;ILcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 4
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "childPos"    # I
    .param p3, "kidFloatPropertyVal"    # Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .param p4, "justPlacedFloatBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1163
    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v1

    cmpl-float v0, v0, v1

    if-gez v0, :cond_4

    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    goto :goto_2

    .line 1167
    :cond_0
    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    .line 1168
    .local v0, "floatWidth":F
    sget-object v1, Lcom/itextpdf/layout/properties/FloatPropertyValue;->LEFT:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-virtual {p3, v1}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1169
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    sub-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1170
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1171
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_2

    .line 1172
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1173
    .local v2, "prevChild":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1174
    const/4 v3, 0x0

    invoke-interface {v2, v0, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 1171
    .end local v2    # "prevChild":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_2
    goto :goto_1

    .line 1179
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    sub-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1181
    :goto_1
    return-void

    .line 1164
    .end local v0    # "floatWidth":F
    :cond_4
    :goto_2
    return-void
.end method

.method private applyOtf()Lcom/itextpdf/layout/properties/BaseDirection;
    .locals 5

    .line 1354
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/BaseDirection;

    .line 1355
    .local v1, "baseDirection":Lcom/itextpdf/layout/properties/BaseDirection;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1356
    .local v3, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v4, :cond_1

    .line 1357
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyOtf()V

    .line 1358
    if-eqz v1, :cond_0

    sget-object v4, Lcom/itextpdf/layout/properties/BaseDirection;->NO_BIDI:Lcom/itextpdf/layout/properties/BaseDirection;

    if-ne v1, v4, :cond_1

    .line 1359
    :cond_0
    invoke-interface {v3, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v4

    move-object v1, v4

    check-cast v1, Lcom/itextpdf/layout/properties/BaseDirection;

    .line 1362
    .end local v3    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_1
    goto :goto_0

    .line 1363
    :cond_2
    return-object v1
.end method

.method private calculateTab(Lcom/itextpdf/kernel/geom/Rectangle;FLcom/itextpdf/layout/element/TabStop;Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)F
    .locals 8
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "curWidth"    # F
    .param p3, "tabStop"    # Lcom/itextpdf/layout/element/TabStop;
    .param p5, "tabRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "F",
            "Lcom/itextpdf/layout/element/TabStop;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ")F"
        }
    .end annotation

    .line 1258
    .local p4, "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v0, 0x0

    .line 1259
    .local v0, "sumOfAffectedRendererWidths":F
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1260
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    add-float/2addr v0, v3

    .line 1261
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 1262
    :cond_0
    const/4 v1, 0x0

    .line 1263
    .local v1, "tabWidth":F
    sget-object v2, Lcom/itextpdf/layout/renderer/LineRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$TabAlignment:[I

    invoke-virtual {p3}, Lcom/itextpdf/layout/element/TabStop;->getTabAlignment()Lcom/itextpdf/layout/properties/TabAlignment;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TabAlignment;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_3

    .line 1271
    :pswitch_0
    const/high16 v2, -0x40800000    # -1.0f

    .line 1272
    .local v2, "anchorPosition":F
    const/4 v3, 0x0

    .line 1273
    .local v3, "processedRenderersWidth":F
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/high16 v6, -0x40800000    # -1.0f

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1274
    .local v5, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    move-object v7, v5

    check-cast v7, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/TextRenderer;->getTabAnchorCharacterPosition()F

    move-result v2

    .line 1275
    cmpl-float v7, v6, v2

    if-eqz v7, :cond_1

    .line 1276
    goto :goto_2

    .line 1278
    :cond_1
    invoke-interface {v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    add-float/2addr v3, v6

    .line 1280
    .end local v5    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    .line 1281
    :cond_2
    :goto_2
    cmpl-float v4, v2, v6

    if-nez v4, :cond_3

    .line 1282
    const/4 v2, 0x0

    .line 1284
    :cond_3
    invoke-virtual {p3}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v4

    sub-float/2addr v4, p2

    sub-float/2addr v4, v2

    sub-float v1, v4, v3

    goto :goto_3

    .line 1268
    .end local v2    # "anchorPosition":F
    .end local v3    # "processedRenderersWidth":F
    :pswitch_1
    invoke-virtual {p3}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v2

    sub-float/2addr v2, p2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v0, v3

    sub-float v1, v2, v3

    .line 1269
    goto :goto_3

    .line 1265
    :pswitch_2
    invoke-virtual {p3}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v2

    sub-float/2addr v2, p2

    sub-float v1, v2, v0

    .line 1266
    nop

    .line 1287
    :goto_3
    const/4 v2, 0x0

    cmpg-float v2, v1, v2

    if-gez v2, :cond_4

    .line 1288
    const/4 v1, 0x0

    .line 1290
    :cond_4
    add-float v2, p2, v1

    add-float/2addr v2, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    .line 1291
    add-float v2, p2, v0

    add-float/2addr v2, v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    sub-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 1294
    :cond_5
    const/16 v2, 0x4d

    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    invoke-interface {p5, v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1295
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x55

    invoke-interface {p5, v3, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1297
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private calculateTab(Lcom/itextpdf/layout/renderer/IRenderer;FF)Lcom/itextpdf/layout/element/TabStop;
    .locals 4
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "curWidth"    # F
    .param p3, "lineWidth"    # F

    .line 1234
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getNextTabStop(F)Lcom/itextpdf/layout/element/TabStop;

    move-result-object v0

    .line 1236
    .local v0, "nextTabStop":Lcom/itextpdf/layout/element/TabStop;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1237
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/LineRenderer;->processDefaultTab(Lcom/itextpdf/layout/renderer/IRenderer;FF)V

    .line 1238
    return-object v1

    .line 1241
    :cond_0
    const/16 v2, 0x44

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/TabStop;->getTabLeader()Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1242
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v2

    sub-float/2addr v2, p2

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x4d

    invoke-interface {p1, v3, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1243
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x55

    invoke-interface {p1, v3, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1245
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/TabStop;->getTabAlignment()Lcom/itextpdf/layout/properties/TabAlignment;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/layout/properties/TabAlignment;->LEFT:Lcom/itextpdf/layout/properties/TabAlignment;

    if-ne v2, v3, :cond_1

    .line 1246
    return-object v1

    .line 1249
    :cond_1
    return-object v0
.end method

.method private decreaseRelativeWidthByChildAdditionalWidth(Lcom/itextpdf/layout/renderer/IRenderer;F)F
    .locals 3
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "normalizedChildWidth"    # F

    .line 1581
    instance-of v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v0, :cond_1

    .line 1582
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1583
    .local v0, "dummyRect":Lcom/itextpdf/kernel/geom/Rectangle;
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1584
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1585
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1586
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1588
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result p2

    .line 1590
    .end local v0    # "dummyRect":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_1
    return p2
.end method

.method private getLastNonFloatChildRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 4

    .line 1200
    const/4 v0, 0x0

    .line 1201
    .local v0, "result":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 1202
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1203
    .local v2, "current":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1204
    move-object v0, v2

    .line 1205
    goto :goto_1

    .line 1201
    .end local v2    # "current":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1208
    .end local v1    # "i":I
    :cond_1
    :goto_1
    return-object v0
.end method

.method private getNextTabStop(F)Lcom/itextpdf/layout/element/TabStop;
    .locals 4
    .param p1, "curWidth"    # F

    .line 1212
    const/16 v0, 0x45

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/NavigableMap;

    .line 1214
    .local v0, "tabStops":Ljava/util/NavigableMap;, "Ljava/util/NavigableMap<Ljava/lang/Float;Lcom/itextpdf/layout/element/TabStop;>;"
    const/4 v1, 0x0

    .line 1215
    .local v1, "nextTabStopEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Float;Lcom/itextpdf/layout/element/TabStop;>;"
    const/4 v2, 0x0

    .line 1217
    .local v2, "nextTabStop":Lcom/itextpdf/layout/element/TabStop;
    if-eqz v0, :cond_0

    .line 1218
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/NavigableMap;->higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 1220
    :cond_0
    if-eqz v1, :cond_1

    .line 1221
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object v2, v3

    check-cast v2, Lcom/itextpdf/layout/element/TabStop;

    .line 1224
    :cond_1
    return-object v2
.end method

.method private hasInlineBlocksWithVerticalAlignment()Z
    .locals 4

    .line 1613
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1614
    .local v1, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    const/16 v2, 0x88

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BASELINE:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    .line 1616
    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getType()Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v2

    if-eq v3, v2, :cond_0

    .line 1617
    const/4 v0, 0x1

    return v0

    .line 1619
    .end local v1    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 1620
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method static isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1367
    const/16 v0, 0x63

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 1368
    .local v0, "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    instance-of v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_0

    .line 1369
    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1368
    :goto_0
    return v1
.end method

.method static isInlineBlockChild(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "child"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1373
    instance-of v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-nez v0, :cond_1

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private processDefaultTab(Lcom/itextpdf/layout/renderer/IRenderer;FF)V
    .locals 4
    .param p1, "tabRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "curWidth"    # F
    .param p3, "lineWidth"    # F

    .line 1301
    const/16 v0, 0x43

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 1302
    .local v0, "tabDefault":Ljava/lang/Float;
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    rem-float v2, p2, v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 1303
    .local v1, "tabWidth":Ljava/lang/Float;
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v2, p2

    cmpl-float v2, v2, p3

    if-lez v2, :cond_0

    .line 1304
    sub-float v2, p3, p2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 1306
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x4d

    invoke-interface {p1, v3, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1307
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x55

    invoke-interface {p1, v3, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1308
    return-void
.end method

.method static reorder(Lcom/itextpdf/layout/renderer/LineRenderer;Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;[I)V
    .locals 11
    .param p0, "toProcess"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "splitLineIntoGlyphsResult"    # Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .param p2, "newOrder"    # [I

    .line 1078
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->getStarterNonTextRenderers()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->setChildRenderers(Ljava/util/List;)V

    .line 1080
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->getLineGlyphs()Ljava/util/List;

    move-result-object v0

    .line 1081
    .local v0, "lineGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;>;"
    const/4 v1, 0x0

    .line 1082
    .local v1, "initialPos":I
    move v2, v1

    .local v2, "offset":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 1083
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->renderer:Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 1084
    .local v3, "renderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    new-instance v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-direct {v4, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/renderer/TextRenderer;)V

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->removeReversedRanges()Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v4

    .line 1085
    .local v4, "newRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1088
    invoke-virtual {p1, v3}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->getInsertAfterAndRemove(Lcom/itextpdf/layout/renderer/TextRenderer;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 1090
    new-instance v5, Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v6, v4, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v5, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    iput-object v5, v4, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 1091
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1092
    .local v5, "replacementGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v6, 0x0

    .line 1093
    .local v6, "reversed":Z
    move v7, v2

    .local v7, "pos":I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_2

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    iget-object v8, v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->renderer:Lcom/itextpdf/layout/renderer/TextRenderer;

    if-ne v8, v3, :cond_2

    .line 1094
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    iget-object v8, v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1095
    add-int/lit8 v8, v7, 0x1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_0

    add-int/lit8 v8, v7, 0x1

    .line 1096
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    iget-object v8, v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->renderer:Lcom/itextpdf/layout/renderer/TextRenderer;

    if-ne v8, v3, :cond_0

    aget v8, p2, v7

    add-int/lit8 v9, v7, 0x1

    aget v9, p2, v9

    add-int/lit8 v9, v9, 0x1

    if-ne v8, v9, :cond_0

    add-int/lit8 v8, v7, 0x1

    .line 1098
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    iget-object v8, v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-static {v8}, Lcom/itextpdf/io/util/TextUtil;->isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1099
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    iget-object v8, v8, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-static {v8}, Lcom/itextpdf/io/util/TextUtil;->isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1100
    const/4 v6, 0x1

    .line 1101
    goto :goto_2

    .line 1103
    :cond_0
    if-eqz v6, :cond_1

    .line 1104
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->initReversedRanges()Ljava/util/List;

    move-result-object v8

    sub-int v9, v1, v2

    sub-int v10, v7, v2

    filled-new-array {v9, v10}, [I

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1105
    const/4 v6, 0x0

    .line 1107
    :cond_1
    add-int/lit8 v1, v7, 0x1

    .line 1093
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1110
    .end local v7    # "pos":I
    :cond_2
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v7, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;->setGlyphs(Ljava/util/List;)V

    .line 1082
    .end local v3    # "renderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    .end local v4    # "newRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    .end local v5    # "replacementGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    .end local v6    # "reversed":Z
    move v2, v1

    goto/16 :goto_0

    .line 1112
    .end local v2    # "offset":I
    :cond_3
    return-void
.end method

.method private replaceSplitRendererKidFloats(Ljava/util/Map;Lcom/itextpdf/layout/renderer/LineRenderer;)V
    .locals 4
    .param p2, "splitRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            ")V"
        }
    .end annotation

    .line 1185
    .local p1, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1186
    .local v1, "splitFloat":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1187
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {p2, v2, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->setChildRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    goto :goto_1

    .line 1189
    :cond_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->setChildRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1191
    .end local v1    # "splitFloat":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_1
    goto :goto_0

    .line 1192
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_2
    if-ltz v0, :cond_3

    .line 1193
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    .line 1194
    invoke-virtual {p2, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->removeChildRenderer(I)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1192
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 1197
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method private resolveChildrenFonts()V
    .locals 5

    .line 1560
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1561
    .local v0, "newChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v1, 0x0

    .line 1562
    .local v1, "updateChildRenderers":Z
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1563
    .local v3, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v4, :cond_0

    .line 1564
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->resolveFonts(Ljava/util/List;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1565
    const/4 v1, 0x1

    goto :goto_1

    .line 1568
    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1570
    .end local v3    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_1
    :goto_1
    goto :goto_0

    .line 1573
    :cond_2
    if-eqz v1, :cond_3

    .line 1574
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->setChildRenderers(Ljava/util/List;)V

    .line 1576
    :cond_3
    return-void
.end method

.method static splitLineIntoGlyphs(Lcom/itextpdf/layout/renderer/LineRenderer;)Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .locals 10
    .param p0, "toSplit"    # Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 1051
    new-instance v0, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;-><init>()V

    .line 1053
    .local v0, "result":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    const/4 v1, 0x0

    .line 1054
    .local v1, "newLineFound":Z
    const/4 v2, 0x0

    .line 1055
    .local v2, "lastTextRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1056
    .local v4, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v1, :cond_0

    .line 1057
    goto :goto_4

    .line 1059
    :cond_0
    instance-of v5, v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v5, :cond_3

    .line 1060
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/layout/renderer/TextRenderer;

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 1061
    .local v5, "childLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget v6, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v6, "i":I
    :goto_1
    iget v7, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v6, v7, :cond_2

    .line 1062
    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v7

    invoke-static {v7}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1063
    const/4 v1, 0x1

    .line 1064
    goto :goto_2

    .line 1066
    :cond_1
    new-instance v7, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v8

    move-object v9, v4

    check-cast v9, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-direct {v7, v8, v9}, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/layout/renderer/TextRenderer;)V

    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->addLineGlyph(Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;)V

    .line 1061
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1068
    .end local v6    # "i":I
    :cond_2
    :goto_2
    move-object v2, v4

    check-cast v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 1069
    .end local v5    # "childLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    goto :goto_3

    .line 1070
    :cond_3
    invoke-virtual {v0, v2, v4}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->addInsertAfter(Lcom/itextpdf/layout/renderer/TextRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1072
    .end local v4    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_3
    goto :goto_0

    .line 1073
    :cond_4
    :goto_4
    return-object v0
.end method

.method private splitNotFittingFloat(ILcom/itextpdf/layout/layout/LayoutResult;)[Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 5
    .param p1, "childPos"    # I
    .param p2, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;

    .line 1152
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->split()[Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v0

    .line 1153
    .local v0, "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 1154
    aget-object v1, v0, v1

    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1155
    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1156
    aget-object v1, v0, v1

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v2, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 1158
    return-object v0
.end method

.method private updateBidiLevels(ILcom/itextpdf/layout/properties/BaseDirection;)V
    .locals 9
    .param p1, "totalNumberOfTrimmedGlyphs"    # I
    .param p2, "baseDirection"    # Lcom/itextpdf/layout/properties/BaseDirection;

    .line 1516
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    if-eqz v0, :cond_0

    .line 1517
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    array-length v1, v1

    invoke-static {v0, p1, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    .line 1520
    :cond_0
    const/4 v0, 0x0

    .line 1521
    .local v0, "unicodeIdsReorderingList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    if-nez v1, :cond_9

    if-eqz p2, :cond_9

    sget-object v1, Lcom/itextpdf/layout/properties/BaseDirection;->NO_BIDI:Lcom/itextpdf/layout/properties/BaseDirection;

    if-eq p2, v1, :cond_9

    .line 1522
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v1

    .line 1523
    const/4 v1, 0x0

    .line 1524
    .local v1, "newLineFound":Z
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1525
    .local v3, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v1, :cond_1

    .line 1526
    goto :goto_4

    .line 1528
    :cond_1
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v4, :cond_4

    .line 1529
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->getText()Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v4

    .line 1530
    .local v4, "text":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget v5, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v5, "i":I
    :goto_1
    iget v6, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v5, v6, :cond_4

    .line 1531
    invoke-virtual {v4, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    .line 1532
    .local v6, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-static {v6}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1533
    const/4 v1, 0x1

    .line 1534
    goto :goto_3

    .line 1538
    :cond_2
    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v7

    goto :goto_2

    :cond_3
    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicodeChars()[C

    move-result-object v7

    const/4 v8, 0x0

    aget-char v7, v7, v8

    .line 1539
    .local v7, "unicode":I
    :goto_2
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1530
    .end local v6    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v7    # "unicode":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1542
    .end local v3    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v4    # "text":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v5    # "i":I
    :cond_4
    :goto_3
    goto :goto_0

    .line 1543
    :cond_5
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_8

    .line 1544
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    .line 1545
    .local v2, "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-nez v2, :cond_6

    move-object v4, v3

    goto :goto_5

    :cond_6
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentIdWrapper()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v4

    .line 1546
    .local v4, "sequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    :goto_5
    const/16 v5, 0x87

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/MetaInfoContainer;

    .line 1547
    .local v5, "metaInfoContainer":Lcom/itextpdf/layout/renderer/MetaInfoContainer;
    if-nez v5, :cond_7

    goto :goto_6

    :cond_7
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/MetaInfoContainer;->getMetaInfo()Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    move-result-object v3

    .line 1548
    .local v3, "metaInfo":Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    :goto_6
    invoke-static {v0}, Lcom/itextpdf/io/util/ArrayUtil;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v6

    invoke-static {p2, v6, v4, v3}, Lcom/itextpdf/layout/renderer/TypographyUtils;->getBidiLevels(Lcom/itextpdf/layout/properties/BaseDirection;[ILcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)[B

    move-result-object v6

    iput-object v6, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    .line 1550
    .end local v2    # "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "metaInfo":Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    .end local v4    # "sequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .end local v5    # "metaInfoContainer":Lcom/itextpdf/layout/renderer/MetaInfoContainer;
    goto :goto_7

    .line 1551
    :cond_8
    iput-object v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    .line 1554
    .end local v1    # "newLineFound":Z
    :cond_9
    :goto_7
    return-void
.end method

.method private updateChildrenParent()V
    .locals 2

    .line 1311
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1312
    .local v1, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v1, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1313
    .end local v1    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 1314
    :cond_0
    return-void
.end method


# virtual methods
.method protected adjustChildrenYLine()Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 2

    .line 935
    sget-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    const/16 v1, 0x7b

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 936
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->hasInlineBlocksWithVerticalAlignment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 937
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->adjustChildrenYLineHtmlMode(Lcom/itextpdf/layout/renderer/LineRenderer;)V

    goto :goto_0

    .line 939
    :cond_0
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->adjustChildrenYLineDefaultMode()V

    .line 942
    :goto_0
    return-object p0
.end method

.method protected applyLeading(F)V
    .locals 3
    .param p1, "deltaY"    # F

    .line 946
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 947
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 948
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 949
    .local v1, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 950
    const/4 v2, 0x0

    invoke-interface {v1, v2, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 952
    .end local v1    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 953
    :cond_1
    return-void
.end method

.method protected baseCharactersCount()I
    .locals 4

    .line 888
    const/4 v0, 0x0

    .line 889
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 890
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_0

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 891
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->baseCharactersCount()I

    move-result v3

    add-int/2addr v0, v3

    .line 893
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 894
    :cond_1
    return v0
.end method

.method public containsImage()Z
    .locals 3

    .line 972
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 973
    .local v1, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v2, v1, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-eqz v2, :cond_0

    .line 974
    const/4 v0, 0x1

    return v0

    .line 976
    .end local v1    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 977
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method protected createOverflowRenderer()Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 1

    .line 911
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    return-object v0
.end method

.method protected createSplitRenderer()Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 1

    .line 907
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    return-object v0
.end method

.method getAscentDescentOfLayoutedChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/properties/RenderingMode;Z)[F
    .locals 5
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p3, "childRenderingMode"    # Lcom/itextpdf/layout/properties/RenderingMode;
    .param p4, "isInlineBlockChild"    # Z

    .line 1417
    const/4 v0, 0x0

    .line 1418
    .local v0, "childAscent":F
    const/4 v1, 0x0

    .line 1419
    .local v1, "childDescent":F
    instance-of v2, p1, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    const/4 v3, 0x3

    if-eqz v2, :cond_1

    .line 1420
    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    if-eq v2, v3, :cond_1

    .line 1421
    sget-object v2, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    if-ne v2, p3, :cond_0

    instance-of v2, p1, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v2, :cond_0

    .line 1422
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->getActualAscenderDescender(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F

    move-result-object v2

    return-object v2

    .line 1424
    :cond_0
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;->getAscent()F

    move-result v0

    .line 1425
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;->getDescent()F

    move-result v1

    goto :goto_1

    .line 1427
    :cond_1
    if-eqz p4, :cond_4

    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    if-eq v2, v3, :cond_4

    .line 1428
    instance-of v2, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v2, :cond_3

    .line 1429
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getLastYLineRecursively()Ljava/lang/Float;

    move-result-object v2

    .line 1430
    .local v2, "yLine":Ljava/lang/Float;
    if-nez v2, :cond_2

    .line 1431
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    goto :goto_0

    .line 1433
    :cond_2
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    .line 1434
    .end local v0    # "childAscent":F
    .local v3, "childAscent":F
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v4

    sub-float/2addr v0, v4

    neg-float v1, v0

    move v0, v3

    .line 1436
    .end local v2    # "yLine":Ljava/lang/Float;
    .end local v3    # "childAscent":F
    .restart local v0    # "childAscent":F
    :goto_0
    goto :goto_1

    .line 1437
    :cond_3
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 1441
    :cond_4
    :goto_1
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v3, 0x1

    aput v1, v2, v3

    return-object v2
.end method

.method getBottomLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F
    .locals 8
    .param p1, "leading"    # Lcom/itextpdf/layout/properties/Leading;

    .line 1024
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getType()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    packed-switch v0, :pswitch_data_0

    .line 1046
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1029
    :pswitch_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x18

    invoke-virtual {p0, v3, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 1030
    .local v2, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1031
    sget-object v4, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    .line 1032
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 1031
    const-string v5, "Property {0} in percents is not supported"

    invoke-static {v5, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1039
    :cond_0
    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    cmpl-float v3, v3, v0

    if-nez v3, :cond_1

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    cmpl-float v3, v3, v0

    if-nez v3, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->containsImage()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1040
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    const v4, 0x3f4ccccd    # 0.8f

    mul-float/2addr v3, v4

    goto :goto_0

    :cond_1
    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    .line 1041
    .local v3, "textAscent":F
    :goto_0
    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    cmpl-float v4, v4, v0

    if-nez v4, :cond_2

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    cmpl-float v0, v4, v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->containsImage()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1042
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    neg-float v0, v0

    const v4, 0x3e4ccccd    # 0.2f

    mul-float/2addr v0, v4

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    .line 1043
    .local v0, "textDescent":F
    :goto_1
    neg-float v4, v0

    sub-float v5, v3, v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getValue()F

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float/2addr v6, v7

    mul-float/2addr v5, v6

    div-float/2addr v5, v1

    add-float/2addr v4, v5

    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    neg-float v1, v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    add-float/2addr v1, v4

    return v1

    .line 1026
    .end local v0    # "textDescent":F
    .end local v2    # "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "textAscent":F
    :pswitch_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getValue()F

    move-result v0

    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    sub-float/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1027
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v0, v2

    div-float/2addr v0, v1

    .line 1026
    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getFirstYLineRecursively()Ljava/lang/Float;
    .locals 1

    .line 799
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getYLine()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method protected getLastYLineRecursively()Ljava/lang/Float;
    .locals 1

    .line 804
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getYLine()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getLeadingValue(Lcom/itextpdf/layout/properties/Leading;)F
    .locals 3
    .param p1, "leading"    # Lcom/itextpdf/layout/properties/Leading;

    .line 782
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 788
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 786
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getTopLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F

    move-result v0

    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getBottomLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F

    move-result v1

    add-float/2addr v0, v1

    return v0

    .line 784
    :pswitch_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getValue()F

    move-result v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    sub-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getMaxAscent()F
    .locals 1

    .line 770
    iget v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    return v0
.end method

.method public getMaxDescent()F
    .locals 1

    .line 774
    iget v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    return v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 5

    .line 982
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 983
    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v3

    const v4, 0x49742400    # 1000000.0f

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    .line 982
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/layout/LineLayoutResult;

    .line 984
    .local v0, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    return-object v1
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 794
    new-instance v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;-><init>()V

    return-object v0
.end method

.method protected getNumberOfSpaces()I
    .locals 4

    .line 857
    const/4 v0, 0x0

    .line 858
    .local v0, "spaces":I
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 859
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_0

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 860
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getNumberOfSpaces()I

    move-result v3

    add-int/2addr v0, v3

    .line 862
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 863
    :cond_1
    return v0
.end method

.method getTopLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F
    .locals 7
    .param p1, "leading"    # Lcom/itextpdf/layout/properties/Leading;

    .line 997
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getType()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    packed-switch v0, :pswitch_data_0

    .line 1019
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1002
    :pswitch_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    const/16 v3, 0x18

    invoke-virtual {p0, v3, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 1003
    .local v2, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1004
    sget-object v4, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    .line 1005
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 1004
    const-string v5, "Property {0} in percents is not supported"

    invoke-static {v5, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1012
    :cond_0
    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    cmpl-float v3, v3, v0

    if-nez v3, :cond_1

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    cmpl-float v3, v3, v0

    if-nez v3, :cond_1

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 1013
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    add-float/2addr v3, v4

    cmpl-float v3, v3, v0

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->containsImage()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    const v4, 0x3f4ccccd    # 0.8f

    mul-float/2addr v3, v4

    goto :goto_0

    :cond_1
    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    .line 1014
    .local v3, "textAscent":F
    :goto_0
    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    cmpl-float v4, v4, v0

    if-nez v4, :cond_2

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    cmpl-float v4, v4, v0

    if-nez v4, :cond_2

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 1015
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    add-float/2addr v4, v5

    cmpl-float v0, v4, v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->containsImage()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    neg-float v0, v0

    const v4, 0x3e4ccccd    # 0.2f

    mul-float/2addr v0, v4

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    .line 1016
    .local v0, "textDescent":F
    :goto_1
    sub-float v4, v3, v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getValue()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v5, v6

    mul-float/2addr v4, v5

    div-float/2addr v4, v1

    add-float/2addr v4, v3

    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    invoke-static {v4, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    sub-float/2addr v1, v4

    return v1

    .line 999
    .end local v0    # "textDescent":F
    .end local v2    # "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "textAscent":F
    :pswitch_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Leading;->getValue()F

    move-result v0

    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    sub-float/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1000
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v0, v2

    div-float/2addr v0, v1

    .line 999
    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getYLine()F
    .locals 2

    .line 778
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    sub-float/2addr v0, v1

    return v0
.end method

.method hasChildRendererInHtmlMode()Z
    .locals 4

    .line 988
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 989
    .local v1, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    sget-object v2, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    const/16 v3, 0x7b

    invoke-interface {v1, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 990
    const/4 v0, 0x1

    return v0

    .line 992
    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 993
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method isForceOverflowForTextRendererPartialResult(Lcom/itextpdf/layout/renderer/IRenderer;ZLcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;Z)Z
    .locals 4
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "wasXOverflowChanged"    # Z
    .param p3, "oldXOverflow"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p4, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p5, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p6, "wasParentsHeightClipped"    # Z

    .line 1393
    const/16 v0, 0x67

    if-eqz p2, :cond_0

    .line 1394
    invoke-virtual {p0, v0, p3}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1396
    :cond_0
    new-instance v1, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v2, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1397
    invoke-virtual {p4}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v3

    invoke-direct {v2, v3, p5}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v1, v2, p6}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    .line 1396
    invoke-interface {p1, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    .line 1399
    .local v1, "newLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    if-eqz p2, :cond_1

    .line 1400
    sget-object v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1402
    :cond_1
    instance-of v0, v1, Lcom/itextpdf/layout/layout/TextLayoutResult;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 1403
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isWordHasBeenSplit()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 1402
    :goto_0
    return v0
.end method

.method public justify(F)V
    .locals 22
    .param p1, "width"    # F

    .line 808
    move-object/from16 v0, p0

    move/from16 v1, p1

    const/16 v2, 0x3d

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 809
    .local v2, "ratio":F
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getLastNonFloatChildRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    .line 810
    .local v3, "lastChildRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    if-nez v3, :cond_0

    .line 811
    return-void

    .line 813
    :cond_0
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v4

    add-float/2addr v4, v1

    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v5

    sub-float/2addr v4, v5

    .line 814
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    sub-float/2addr v4, v5

    .line 815
    .local v4, "freeWidth":F
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getNumberOfSpaces()I

    move-result v5

    .line 816
    .local v5, "numberOfSpaces":I
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->baseCharactersCount()I

    move-result v6

    .line 817
    .local v6, "baseCharsCount":I
    int-to-float v7, v5

    mul-float/2addr v7, v2

    const/high16 v8, 0x3f800000    # 1.0f

    sub-float v9, v8, v2

    add-int/lit8 v10, v6, -0x1

    int-to-float v10, v10

    mul-float/2addr v9, v10

    add-float/2addr v7, v9

    div-float v7, v4, v7

    .line 820
    .local v7, "baseFactor":F
    invoke-static {v7}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 821
    const/4 v7, 0x0

    .line 823
    :cond_1
    mul-float v9, v2, v7

    .line 824
    .local v9, "wordSpacing":F
    sub-float v10, v8, v2

    mul-float/2addr v10, v7

    .line 826
    .local v10, "characterSpacing":F
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v11

    .line 827
    .local v11, "lastRightPos":F
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_8

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 828
    .local v13, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v13}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 829
    goto :goto_0

    .line 831
    :cond_2
    invoke-interface {v13}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v14

    .line 832
    .local v14, "childX":F
    sub-float v15, v11, v14

    move/from16 v16, v8

    const/4 v8, 0x0

    invoke-interface {v13, v15, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 833
    move v14, v11

    .line 834
    instance-of v15, v13, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v15, :cond_7

    .line 835
    move-object v15, v13

    check-cast v15, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/16 v8, 0x1d

    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v15, v8, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 836
    .local v0, "childHSCale":F
    move-object v8, v13

    check-cast v8, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/16 v15, 0xf

    invoke-virtual {v8, v15}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v8

    .line 837
    .local v8, "oldCharacterSpacing":Ljava/lang/Float;
    move-object v15, v13

    check-cast v15, Lcom/itextpdf/layout/renderer/TextRenderer;

    move/from16 v19, v0

    .end local v0    # "childHSCale":F
    .local v19, "childHSCale":F
    const/16 v0, 0x4e

    invoke-virtual {v15, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v15

    .line 838
    .local v15, "oldWordSpacing":Ljava/lang/Float;
    if-nez v8, :cond_3

    const/16 v20, 0x0

    goto :goto_1

    .line 839
    :cond_3
    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v20

    :goto_1
    div-float v21, v10, v19

    add-float v20, v20, v21

    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 838
    move/from16 v20, v2

    const/16 v2, 0xf

    .end local v2    # "ratio":F
    .local v20, "ratio":F
    invoke-interface {v13, v2, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 841
    if-nez v15, :cond_4

    const/4 v0, 0x0

    goto :goto_2

    .line 842
    :cond_4
    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v0

    :goto_2
    div-float v2, v9, v19

    add-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 841
    const/16 v2, 0x4e

    invoke-interface {v13, v2, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 843
    const/4 v0, 0x1

    if-ne v13, v3, :cond_5

    move v2, v0

    goto :goto_3

    :cond_5
    const/4 v2, 0x0

    .line 844
    .local v2, "isLastTextRenderer":Z
    :goto_3
    if-eqz v2, :cond_6

    move-object/from16 v17, v13

    check-cast v17, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/renderer/TextRenderer;->lineLength()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    goto :goto_4

    :cond_6
    move-object v0, v13

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 845
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->lineLength()I

    move-result v17

    move/from16 v0, v17

    :goto_4
    int-to-float v0, v0

    mul-float/2addr v0, v10

    move-object/from16 v17, v13

    check-cast v17, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 846
    move/from16 v18, v0

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/renderer/TextRenderer;->getNumberOfSpaces()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v9

    add-float v0, v18, v0

    .line 847
    .local v0, "widthAddition":F
    invoke-interface {v13}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v17

    move/from16 v18, v0

    .end local v0    # "widthAddition":F
    .local v18, "widthAddition":F
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 848
    invoke-interface {v13}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v17

    move/from16 v21, v2

    .end local v2    # "isLastTextRenderer":Z
    .local v21, "isLastTextRenderer":Z
    add-float v2, v17, v18

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_5

    .line 834
    .end local v8    # "oldCharacterSpacing":Ljava/lang/Float;
    .end local v15    # "oldWordSpacing":Ljava/lang/Float;
    .end local v18    # "widthAddition":F
    .end local v19    # "childHSCale":F
    .end local v20    # "ratio":F
    .end local v21    # "isLastTextRenderer":Z
    .local v2, "ratio":F
    :cond_7
    move/from16 v20, v2

    .line 850
    .end local v2    # "ratio":F
    .restart local v20    # "ratio":F
    :goto_5
    invoke-interface {v13}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    add-float v11, v14, v0

    .line 851
    .end local v13    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v14    # "childX":F
    move-object/from16 v0, p0

    move/from16 v8, v16

    move/from16 v2, v20

    goto/16 :goto_0

    .line 853
    .end local v20    # "ratio":F
    .restart local v2    # "ratio":F
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 854
    return-void
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 79
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 88
    move-object/from16 v0, p0

    move-object/from16 v8, p1

    const/4 v1, 0x0

    .line 89
    .local v1, "textSequenceOverflowXProcessing":Z
    const/4 v2, -0x1

    .line 91
    .local v2, "firstChildToRelayout":I
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    .line 92
    .local v9, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v10

    .line 93
    .local v10, "wasParentsHeightClipped":Z
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v11

    .line 95
    .local v11, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/4 v3, 0x0

    .line 96
    .local v3, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/4 v4, 0x0

    .line 97
    .local v4, "wasXOverflowChanged":Z
    const/4 v5, 0x0

    .line 99
    .local v5, "floatsPlacedBeforeLine":Z
    const/16 v12, 0x67

    if-eqz v11, :cond_1

    .line 100
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    .line 101
    .local v6, "layoutWidth":F
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    .line 104
    .local v7, "layoutHeight":F
    invoke-static {v11, v9}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustLineAreaAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 105
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v13

    cmpl-float v13, v6, v13

    if-gtz v13, :cond_0

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    cmpl-float v13, v7, v13

    if-lez v13, :cond_1

    .line 106
    :cond_0
    const/4 v5, 0x1

    .line 107
    invoke-virtual {v0, v12}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v13

    move-object v3, v13

    check-cast v3, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 108
    const/4 v4, 0x1

    .line 109
    sget-object v13, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {v0, v12, v13}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    move v13, v5

    goto :goto_0

    .line 113
    .end local v6    # "layoutWidth":F
    .end local v7    # "layoutHeight":F
    :cond_1
    move v13, v5

    .end local v5    # "floatsPlacedBeforeLine":Z
    .local v13, "floatsPlacedBeforeLine":Z
    :goto_0
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v6, 0x76

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v19

    .line 115
    .local v19, "noSoftWrap":Z
    instance-of v5, v8, Lcom/itextpdf/layout/layout/LineLayoutContext;

    if-eqz v5, :cond_2

    move-object v5, v8

    check-cast v5, Lcom/itextpdf/layout/layout/LineLayoutContext;

    goto :goto_1

    :cond_2
    new-instance v5, Lcom/itextpdf/layout/layout/LineLayoutContext;

    invoke-direct {v5, v8}, Lcom/itextpdf/layout/layout/LineLayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutContext;)V

    :goto_1
    move-object v6, v5

    .line 118
    .local v6, "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->getTextIndent()F

    move-result v5

    const/4 v7, 0x0

    cmpl-float v5, v5, v7

    if-eqz v5, :cond_3

    .line 119
    nop

    .line 120
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->getTextIndent()F

    move-result v5

    invoke-virtual {v9, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    .line 121
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v14

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->getTextIndent()F

    move-result v15

    sub-float/2addr v14, v15

    invoke-virtual {v5, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 124
    :cond_3
    new-instance v5, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v14

    .line 125
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v15

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v12

    invoke-virtual {v15, v12}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-direct {v5, v14, v12}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v5, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 127
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->updateChildrenParent()V

    .line 129
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 131
    const/4 v5, 0x0

    .line 132
    .local v5, "curWidth":F
    sget-object v12, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    const/16 v14, 0x7b

    invoke-virtual {v0, v14}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v12, v15}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v12

    const/16 v16, 0x0

    if-eqz v12, :cond_5

    .line 133
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->hasChildRendererInHtmlMode()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 134
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->getActualAscenderDescender(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F

    move-result-object v12

    .line 135
    .local v12, "ascenderDescender":[F
    const/16 v17, 0x1

    aget v15, v12, v16

    iput v15, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    .line 136
    aget v15, v12, v17

    iput v15, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 137
    .end local v12    # "ascenderDescender":[F
    goto :goto_3

    .line 133
    :cond_4
    const/16 v17, 0x1

    goto :goto_2

    .line 132
    :cond_5
    const/16 v17, 0x1

    .line 138
    :goto_2
    iput v7, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    .line 139
    iput v7, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 141
    :goto_3
    iput v7, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    .line 142
    iput v7, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    .line 143
    const v12, -0x1f528714    # -1.0E20f

    iput v12, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    .line 144
    const v12, 0x60ad78ec    # 1.0E20f

    iput v12, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    .line 146
    const/4 v12, 0x0

    .line 148
    .local v12, "childPos":I
    new-instance v15, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v15}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>()V

    .line 150
    .local v15, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    if-eqz v19, :cond_6

    .line 151
    move/from16 v22, v7

    new-instance v7, Lcom/itextpdf/layout/renderer/SumSumWidthHandler;

    invoke-direct {v7, v15}, Lcom/itextpdf/layout/renderer/SumSumWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    move-object/from16 v20, v7

    .local v7, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    goto :goto_4

    .line 153
    .end local v7    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_6
    move/from16 v22, v7

    new-instance v7, Lcom/itextpdf/layout/renderer/MaxSumWidthHandler;

    invoke-direct {v7, v15}, Lcom/itextpdf/layout/renderer/MaxSumWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    move-object/from16 v20, v7

    .line 156
    .local v20, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :goto_4
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->resolveChildrenFonts()V

    .line 158
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->trimFirst()I

    move-result v7

    .line 160
    .local v7, "totalNumberOfTrimmedGlyphs":I
    move-object/from16 v18, v15

    .end local v15    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v18, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->applyOtf()Lcom/itextpdf/layout/properties/BaseDirection;

    move-result-object v15

    .line 162
    .local v15, "baseDirection":Lcom/itextpdf/layout/properties/BaseDirection;
    invoke-direct {v0, v7, v15}, Lcom/itextpdf/layout/renderer/LineRenderer;->updateBidiLevels(ILcom/itextpdf/layout/properties/BaseDirection;)V

    .line 164
    const/16 v23, 0x0

    .line 165
    .local v23, "anythingPlaced":Z
    const/16 v24, 0x0

    .line 166
    .local v24, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    const/16 v25, 0x0

    .line 168
    .local v25, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    const/16 v26, 0x0

    .line 169
    .local v26, "floatsPlacedInLine":Z
    new-instance v27, Ljava/util/LinkedHashMap;

    invoke-direct/range {v27 .. v27}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v28, v27

    .line 170
    .local v28, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v29, v27

    .line 171
    .local v29, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v30, v27

    .line 172
    .local v30, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/16 v27, 0x0

    .line 174
    .local v27, "lastTabIndex":I
    new-instance v31, Ljava/util/HashMap;

    invoke-direct/range {v31 .. v31}, Ljava/util/HashMap;-><init>()V

    .line 175
    .local v31, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    new-instance v32, Ljava/util/HashMap;

    invoke-direct/range {v32 .. v32}, Ljava/util/HashMap;-><init>()V

    .line 177
    .local v32, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    new-instance v33, Ljava/util/HashMap;

    invoke-direct/range {v33 .. v33}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v34, v33

    .line 178
    .local v34, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    const/16 v33, 0x0

    .line 180
    .local v33, "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    const/16 v35, 0x0

    move/from16 v36, v12

    move v12, v2

    move/from16 v2, v36

    move/from16 v36, v27

    move-object/from16 v37, v33

    .line 182
    .end local v27    # "lastTabIndex":I
    .end local v33    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v2, "childPos":I
    .local v12, "firstChildToRelayout":I
    .local v35, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v36, "lastTabIndex":I
    .local v37, "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    :goto_5
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v14

    move-object/from16 v27, v15

    .end local v15    # "baseDirection":Lcom/itextpdf/layout/properties/BaseDirection;
    .local v27, "baseDirection":Lcom/itextpdf/layout/properties/BaseDirection;
    if-ge v2, v14, :cond_6b

    .line 183
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 184
    .local v14, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    const/16 v45, 0x0

    .line 185
    .local v45, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    new-instance v15, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v40

    move-object/from16 v46, v3

    .end local v3    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v46, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    add-float v3, v40, v5

    move/from16 v47, v4

    .end local v4    # "wasXOverflowChanged":Z
    .local v47, "wasXOverflowChanged":Z
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    .line 186
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v40

    move/from16 v41, v5

    .end local v5    # "curWidth":F
    .local v41, "curWidth":F
    sub-float v5, v40, v41

    move/from16 v48, v7

    .end local v7    # "totalNumberOfTrimmedGlyphs":I
    .local v48, "totalNumberOfTrimmedGlyphs":I
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    invoke-direct {v15, v3, v4, v5, v7}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    move-object v7, v15

    .line 188
    .local v7, "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/16 v3, 0x7b

    invoke-interface {v14, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/properties/RenderingMode;

    .line 190
    .local v4, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    invoke-static {v14}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->isTextRendererAndRequiresSpecialScriptPreLayoutProcessing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 191
    invoke-static {}, Lcom/itextpdf/layout/renderer/TypographyUtils;->isPdfCalligraphAvailable()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 192
    invoke-static {v0, v2}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->processSpecialScriptPreLayout(Lcom/itextpdf/layout/renderer/LineRenderer;I)V

    .line 194
    :cond_7
    const/4 v15, 0x1

    move/from16 v33, v3

    move/from16 v5, v17

    move-object/from16 v3, v18

    move-object/from16 v18, v35

    move/from16 v17, v2

    move/from16 v2, v16

    move-object/from16 v16, v14

    move-object/from16 v14, v31

    .end local v2    # "childPos":I
    .end local v31    # "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v35    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v3, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v14, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v16, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v17, "childPos":I
    .local v18, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    invoke-static/range {v14 .. v20}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->resetTextSequenceIfItEnded(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLcom/itextpdf/layout/renderer/AbstractWidthHandler;)V

    .line 197
    const/4 v15, 0x0

    move-object/from16 v49, v14

    move-object/from16 v14, v32

    .end local v32    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v14, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v49, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    invoke-static/range {v14 .. v20}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->resetTextSequenceIfItEnded(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLcom/itextpdf/layout/renderer/AbstractWidthHandler;)V

    .line 201
    move-object/from16 v15, v16

    move/from16 v16, v2

    move-object v2, v15

    move-object v15, v14

    move/from16 v14, v17

    move/from16 v17, v5

    move-object/from16 v5, v20

    .end local v16    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v17    # "childPos":I
    .end local v20    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v2, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v14, "childPos":I
    .local v15, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    move-object/from16 v20, v3

    .end local v3    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v20, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_8

    .line 203
    const/16 v3, 0xf

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->deleteOwnProperty(I)V

    .line 204
    const/16 v3, 0x4e

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->deleteOwnProperty(I)V

    move/from16 v32, v12

    move/from16 v50, v13

    goto/16 :goto_8

    .line 205
    :cond_8
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TabRenderer;

    if-eqz v3, :cond_b

    .line 206
    if-eqz v24, :cond_9

    .line 207
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    add-int/lit8 v8, v14, -0x1

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 208
    .local v3, "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    new-instance v8, Lcom/itextpdf/layout/layout/LayoutContext;

    move/from16 v32, v12

    .end local v12    # "firstChildToRelayout":I
    .local v32, "firstChildToRelayout":I
    new-instance v12, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v35

    move/from16 v50, v13

    .end local v13    # "floatsPlacedBeforeLine":Z
    .local v50, "floatsPlacedBeforeLine":Z
    invoke-virtual/range {v35 .. v35}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v13

    invoke-direct {v12, v13, v7}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v8, v12, v10}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-interface {v3, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    .line 210
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v8

    add-float v8, v41, v8

    .line 211
    .end local v41    # "curWidth":F
    .local v8, "curWidth":F
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v12

    invoke-virtual {v5, v12}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    goto :goto_6

    .line 206
    .end local v3    # "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v8    # "curWidth":F
    .end local v32    # "firstChildToRelayout":I
    .end local v50    # "floatsPlacedBeforeLine":Z
    .restart local v12    # "firstChildToRelayout":I
    .restart local v13    # "floatsPlacedBeforeLine":Z
    .restart local v41    # "curWidth":F
    :cond_9
    move/from16 v32, v12

    move/from16 v50, v13

    .end local v12    # "firstChildToRelayout":I
    .end local v13    # "floatsPlacedBeforeLine":Z
    .restart local v32    # "firstChildToRelayout":I
    .restart local v50    # "floatsPlacedBeforeLine":Z
    move/from16 v8, v41

    .line 213
    .end local v41    # "curWidth":F
    .restart local v8    # "curWidth":F
    :goto_6
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    invoke-direct {v0, v2, v8, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->calculateTab(Lcom/itextpdf/layout/renderer/IRenderer;FF)Lcom/itextpdf/layout/element/TabStop;

    move-result-object v3

    .line 214
    .end local v24    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v3, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-ne v14, v12, :cond_a

    .line 215
    const/4 v3, 0x0

    move-object/from16 v24, v3

    goto :goto_7

    .line 214
    :cond_a
    move-object/from16 v24, v3

    .line 217
    .end local v3    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .restart local v24    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    :goto_7
    if-eqz v24, :cond_c

    .line 218
    move/from16 v36, v14

    .line 219
    add-int/lit8 v3, v14, 0x1

    .line 220
    .end local v14    # "childPos":I
    .local v3, "childPos":I
    move v2, v3

    move-object/from16 v35, v18

    move-object/from16 v18, v20

    move/from16 v12, v32

    move/from16 v14, v33

    move-object/from16 v3, v46

    move/from16 v4, v47

    move/from16 v7, v48

    move-object/from16 v31, v49

    move/from16 v13, v50

    move-object/from16 v20, v5

    move v5, v8

    move-object/from16 v32, v15

    move-object/from16 v15, v27

    move-object/from16 v8, p1

    goto/16 :goto_5

    .line 205
    .end local v3    # "childPos":I
    .end local v8    # "curWidth":F
    .end local v32    # "firstChildToRelayout":I
    .end local v50    # "floatsPlacedBeforeLine":Z
    .restart local v12    # "firstChildToRelayout":I
    .restart local v13    # "floatsPlacedBeforeLine":Z
    .restart local v14    # "childPos":I
    .restart local v41    # "curWidth":F
    :cond_b
    move/from16 v32, v12

    move/from16 v50, v13

    .line 224
    .end local v12    # "firstChildToRelayout":I
    .end local v13    # "floatsPlacedBeforeLine":Z
    .restart local v32    # "firstChildToRelayout":I
    .restart local v50    # "floatsPlacedBeforeLine":Z
    :goto_8
    move/from16 v8, v41

    .end local v41    # "curWidth":F
    .restart local v8    # "curWidth":F
    :cond_c
    if-eqz v24, :cond_d

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/layout/element/TabStop;->getTabAlignment()Lcom/itextpdf/layout/properties/TabAlignment;

    move-result-object v3

    sget-object v12, Lcom/itextpdf/layout/properties/TabAlignment;->ANCHOR:Lcom/itextpdf/layout/properties/TabAlignment;

    if-ne v3, v12, :cond_d

    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_d

    .line 226
    const/16 v3, 0x42

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/layout/element/TabStop;->getTabAnchor()Ljava/lang/Character;

    move-result-object v12

    invoke-interface {v2, v3, v12}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 230
    :cond_d
    const/16 v12, 0x4d

    invoke-interface {v2, v12}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v13

    .line 231
    .local v13, "childWidth":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 232
    .local v3, "childWidthWasReplaced":Z
    invoke-interface {v2, v12}, Lcom/itextpdf/layout/renderer/IRenderer;->hasOwnProperty(I)Z

    move-result v35

    .line 233
    .local v35, "childRendererHasOwnWidthProperty":Z
    instance-of v12, v13, Lcom/itextpdf/layout/properties/UnitValue;

    if-eqz v12, :cond_f

    move-object v12, v13

    check-cast v12, Lcom/itextpdf/layout/properties/UnitValue;

    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v12

    if-eqz v12, :cond_f

    .line 234
    move-object v12, v13

    check-cast v12, Lcom/itextpdf/layout/properties/UnitValue;

    .line 235
    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v12

    const/high16 v39, 0x42c80000    # 100.0f

    div-float v12, v12, v39

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v39

    mul-float v12, v12, v39

    .line 236
    .local v12, "normalizedChildWidth":F
    invoke-direct {v0, v2, v12}, Lcom/itextpdf/layout/renderer/LineRenderer;->decreaseRelativeWidthByChildAdditionalWidth(Lcom/itextpdf/layout/renderer/IRenderer;F)F

    move-result v12

    .line 238
    cmpl-float v39, v12, v22

    if-lez v39, :cond_e

    .line 239
    move/from16 v39, v3

    .end local v3    # "childWidthWasReplaced":Z
    .local v39, "childWidthWasReplaced":Z
    invoke-static {v12}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    move/from16 v52, v8

    const/16 v8, 0x4d

    .end local v8    # "curWidth":F
    .local v52, "curWidth":F
    invoke-interface {v2, v8, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 240
    const/4 v3, 0x1

    move v8, v3

    .end local v39    # "childWidthWasReplaced":Z
    .restart local v3    # "childWidthWasReplaced":Z
    goto :goto_a

    .line 238
    .end local v52    # "curWidth":F
    .restart local v8    # "curWidth":F
    :cond_e
    move/from16 v39, v3

    move/from16 v52, v8

    .end local v3    # "childWidthWasReplaced":Z
    .end local v8    # "curWidth":F
    .restart local v39    # "childWidthWasReplaced":Z
    .restart local v52    # "curWidth":F
    goto :goto_9

    .line 233
    .end local v12    # "normalizedChildWidth":F
    .end local v39    # "childWidthWasReplaced":Z
    .end local v52    # "curWidth":F
    .restart local v3    # "childWidthWasReplaced":Z
    .restart local v8    # "curWidth":F
    :cond_f
    move/from16 v39, v3

    move/from16 v52, v8

    .line 244
    .end local v3    # "childWidthWasReplaced":Z
    .end local v8    # "curWidth":F
    .restart local v39    # "childWidthWasReplaced":Z
    .restart local v52    # "curWidth":F
    :goto_9
    move/from16 v8, v39

    .end local v39    # "childWidthWasReplaced":Z
    .local v8, "childWidthWasReplaced":Z
    :goto_a
    const/16 v3, 0x63

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 245
    .local v12, "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v3, :cond_10

    .line 246
    invoke-static {v2, v12}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v3

    if-eqz v3, :cond_10

    move/from16 v3, v17

    goto :goto_b

    :cond_10
    move/from16 v3, v16

    .line 248
    .local v3, "isChildFloating":Z
    :goto_b
    move/from16 v53, v8

    .end local v8    # "childWidthWasReplaced":Z
    .local v53, "childWidthWasReplaced":Z
    if-eqz v3, :cond_21

    .line 249
    const/16 v39, 0x0

    .line 250
    .end local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v39, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    move-object v8, v2

    check-cast v8, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v8, v12}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateMinMaxWidthForFloat(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v8

    .line 252
    .local v8, "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {v8}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v40

    .line 258
    .local v40, "floatingBoxFullWidth":F
    if-nez v47, :cond_11

    if-lez v14, :cond_11

    .line 259
    move/from16 v54, v3

    const/16 v3, 0x67

    .end local v3    # "isChildFloating":Z
    .local v54, "isChildFloating":Z
    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v41, v21

    check-cast v41, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 260
    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v41, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/16 v42, 0x1

    .line 261
    .end local v47    # "wasXOverflowChanged":Z
    .local v42, "wasXOverflowChanged":Z
    move-object/from16 v43, v8

    .end local v8    # "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v43, "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    sget-object v8, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {v0, v3, v8}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    move-object/from16 v3, v41

    move/from16 v47, v42

    goto :goto_c

    .line 258
    .end local v41    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v42    # "wasXOverflowChanged":Z
    .end local v43    # "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v54    # "isChildFloating":Z
    .restart local v3    # "isChildFloating":Z
    .restart local v8    # "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v47    # "wasXOverflowChanged":Z
    :cond_11
    move/from16 v54, v3

    move-object/from16 v43, v8

    .line 263
    .end local v3    # "isChildFloating":Z
    .end local v8    # "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v43    # "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v54    # "isChildFloating":Z
    move-object/from16 v3, v46

    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v3, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :goto_c
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->isFloatOverflowedToNextPageWithNothing()Z

    move-result v8

    if-nez v8, :cond_14

    invoke-interface/range {v30 .. v30}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_14

    if-eqz v23, :cond_13

    .line 264
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v8

    cmpg-float v8, v40, v8

    if-gtz v8, :cond_12

    goto :goto_d

    :cond_12
    move/from16 v56, v1

    move-object/from16 v41, v3

    move-object/from16 v55, v15

    goto :goto_e

    .line 265
    :cond_13
    :goto_d
    new-instance v8, Lcom/itextpdf/layout/layout/LayoutContext;

    move-object/from16 v41, v3

    .end local v3    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v41    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 266
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v42

    move-object/from16 v55, v15

    .end local v15    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v55, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    invoke-virtual/range {v42 .. v42}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v15

    .line 267
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v42

    move/from16 v56, v1

    .end local v1    # "textSequenceOverflowXProcessing":Z
    .local v56, "textSequenceOverflowXProcessing":Z
    invoke-virtual/range {v42 .. v42}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-direct {v3, v15, v1}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    const/4 v1, 0x0

    invoke-direct {v8, v3, v1, v11, v10}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    .line 265
    invoke-interface {v2, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v39

    move-object/from16 v1, v39

    goto :goto_f

    .line 263
    .end local v41    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .restart local v1    # "textSequenceOverflowXProcessing":Z
    .restart local v3    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v15    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    :cond_14
    move/from16 v56, v1

    move-object/from16 v41, v3

    move-object/from16 v55, v15

    .line 271
    .end local v1    # "textSequenceOverflowXProcessing":Z
    .end local v3    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v15    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v41    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    :goto_e
    move-object/from16 v1, v39

    .end local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v1, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_f
    if-eqz v53, :cond_16

    .line 272
    if-eqz v35, :cond_15

    .line 273
    const/16 v8, 0x4d

    invoke-interface {v2, v8, v13}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_10

    .line 275
    :cond_15
    const/16 v8, 0x4d

    invoke-interface {v2, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->deleteOwnProperty(I)V

    .line 279
    :cond_16
    :goto_10
    const/4 v3, 0x0

    .line 280
    .local v3, "minChildWidth":F
    const/4 v8, 0x0

    .line 281
    .local v8, "maxChildWidth":F
    instance-of v15, v1, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    const v39, 0x38d1b717    # 1.0E-4f

    if-eqz v15, :cond_18

    .line 282
    if-nez v53, :cond_17

    .line 283
    move-object v15, v1

    check-cast v15, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v15

    invoke-virtual {v15}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v3

    .line 285
    :cond_17
    move-object v15, v1

    check-cast v15, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v15

    invoke-virtual {v15}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v8

    .line 286
    add-float v15, v3, v39

    invoke-virtual {v5, v15}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 287
    add-float v15, v8, v39

    invoke-virtual {v5, v15}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    goto :goto_11

    .line 289
    :cond_18
    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v15

    add-float v15, v15, v39

    invoke-virtual {v5, v15}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 290
    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v15

    add-float v15, v15, v39

    invoke-virtual {v5, v15}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 293
    :goto_11
    if-nez v1, :cond_19

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->isFloatOverflowedToNextPageWithNothing()Z

    move-result v15

    if-nez v15, :cond_19

    .line 294
    move-object/from16 v15, v30

    .end local v30    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v15, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v39, v1

    move/from16 v30, v3

    move-object/from16 v57, v5

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    move/from16 v28, v8

    const/4 v8, 0x0

    goto/16 :goto_13

    .line 293
    .end local v15    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v30    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_19
    move-object/from16 v15, v30

    .line 295
    .end local v30    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v15    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->isFloatOverflowedToNextPageWithNothing()Z

    move-result v30

    if-nez v30, :cond_1f

    .line 296
    move/from16 v30, v3

    .end local v3    # "minChildWidth":F
    .local v30, "minChildWidth":F
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    move-object/from16 v57, v5

    const/4 v5, 0x3

    .end local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v57, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    if-ne v3, v5, :cond_1a

    move-object/from16 v39, v1

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    goto/16 :goto_12

    .line 300
    :cond_1a
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    const/4 v5, 0x2

    if-ne v3, v5, :cond_1d

    .line 301
    const/16 v26, 0x1

    .line 303
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_1c

    .line 310
    invoke-direct {v0, v14, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->splitNotFittingFloat(ILcom/itextpdf/layout/layout/LayoutResult;)[Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v3

    .line 311
    .local v3, "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    .line 312
    .local v5, "splitRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    move-object/from16 v39, v1

    .end local v1    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    instance-of v1, v5, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v1, :cond_1b

    .line 313
    move-object v1, v5

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->trimFirst()V

    .line 314
    move-object v1, v5

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->trimLast()F

    .line 317
    :cond_1b
    invoke-interface {v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 318
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v22

    move-object/from16 v33, v3

    .end local v3    # "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v33, "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 319
    new-instance v58, Lcom/itextpdf/layout/layout/LineLayoutResult;

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    aget-object v61, v33, v16

    aget-object v62, v33, v17

    const/16 v63, 0x0

    const/16 v59, 0x2

    move-object/from16 v60, v1

    invoke-direct/range {v58 .. v63}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v25, v58

    .line 320
    move-object/from16 v42, v6

    move-object/from16 v59, v9

    move-object v4, v15

    move-object/from16 v2, v29

    move-object/from16 v60, v34

    move-object/from16 v6, v41

    move-object/from16 v43, v49

    move-object/from16 v12, v57

    const/4 v9, 0x0

    move v15, v10

    move-object/from16 v29, v11

    move/from16 v11, v17

    move-object/from16 v57, v55

    move/from16 v17, v14

    move-object/from16 v14, v28

    goto/16 :goto_3f

    .line 322
    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v33    # "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v1    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_1c
    move-object/from16 v39, v1

    .end local v1    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    move-object/from16 v5, v28

    .end local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v5, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    move-object/from16 v3, v29

    .end local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v3, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 324
    nop

    .line 325
    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 324
    invoke-direct {v0, v9, v14, v12, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->adjustLineOnFloatPlaced(Lcom/itextpdf/kernel/geom/Rectangle;ILcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    move/from16 v28, v8

    const/4 v8, 0x0

    goto :goto_13

    .line 328
    .end local v3    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v5    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v1    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_1d
    move-object/from16 v39, v1

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    .end local v1    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v3    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v5    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    const/4 v1, 0x1

    .line 330
    .end local v26    # "floatsPlacedInLine":Z
    .local v1, "floatsPlacedInLine":Z
    move/from16 v26, v1

    .end local v1    # "floatsPlacedInLine":Z
    .restart local v26    # "floatsPlacedInLine":Z
    instance-of v1, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v1, :cond_1e

    .line 331
    move-object v1, v2

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->trimFirst()V

    .line 332
    move-object v1, v2

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->trimLast()F

    .line 335
    :cond_1e
    nop

    .line 336
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 335
    invoke-direct {v0, v9, v14, v12, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->adjustLineOnFloatPlaced(Lcom/itextpdf/kernel/geom/Rectangle;ILcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    move/from16 v28, v8

    const/4 v8, 0x0

    goto :goto_13

    .line 295
    .end local v30    # "minChildWidth":F
    .end local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v1, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v3, "minChildWidth":F
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_1f
    move-object/from16 v39, v1

    move/from16 v30, v3

    move-object/from16 v57, v5

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    .line 297
    .end local v1    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v3, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v30    # "minChildWidth":F
    .restart local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :goto_12
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move/from16 v28, v8

    const/4 v8, 0x0

    .end local v8    # "maxChildWidth":F
    .local v28, "maxChildWidth":F
    invoke-interface {v5, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    move/from16 v1, v17

    invoke-virtual {v6, v1}, Lcom/itextpdf/layout/layout/LineLayoutContext;->setFloatOverflowedToNextPageWithNothing(Z)Lcom/itextpdf/layout/layout/LineLayoutContext;

    .line 339
    :goto_13
    add-int/lit8 v1, v14, 0x1

    .line 340
    .end local v14    # "childPos":I
    .local v1, "childPos":I
    if-nez v23, :cond_20

    if-eqz v39, :cond_20

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v14

    const/4 v8, 0x3

    if-ne v14, v8, :cond_20

    .line 341
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_20

    .line 342
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->isFirstOnRootArea()Z

    move-result v8

    if-eqz v8, :cond_20

    .line 346
    move/from16 v17, v1

    move-object v2, v3

    move-object v14, v5

    move-object/from16 v42, v6

    move-object/from16 v59, v9

    move-object/from16 v29, v11

    move-object v4, v15

    move-object/from16 v60, v34

    move-object/from16 v6, v41

    move-object/from16 v43, v49

    move-object/from16 v12, v57

    const/4 v9, 0x0

    const/4 v11, 0x1

    move v15, v10

    move-object/from16 v57, v55

    goto/16 :goto_3f

    .line 182
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v4    # "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .end local v7    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v12    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v13    # "childWidth":Ljava/lang/Object;
    .end local v28    # "maxChildWidth":F
    .end local v30    # "minChildWidth":F
    .end local v35    # "childRendererHasOwnWidthProperty":Z
    .end local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v40    # "floatingBoxFullWidth":F
    .end local v43    # "kidMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v53    # "childWidthWasReplaced":Z
    .end local v54    # "isChildFloating":Z
    :cond_20
    move-object/from16 v8, p1

    move v2, v1

    move-object/from16 v29, v3

    move-object/from16 v28, v5

    move-object/from16 v30, v15

    move-object/from16 v35, v18

    move-object/from16 v18, v20

    move-object/from16 v15, v27

    move/from16 v12, v32

    move/from16 v14, v33

    move-object/from16 v3, v41

    move/from16 v4, v47

    move/from16 v7, v48

    move-object/from16 v31, v49

    move/from16 v13, v50

    move/from16 v5, v52

    move-object/from16 v32, v55

    move/from16 v1, v56

    move-object/from16 v20, v57

    const/16 v17, 0x1

    goto/16 :goto_5

    .line 352
    .end local v41    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .end local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v1, "textSequenceOverflowXProcessing":Z
    .restart local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v3, "isChildFloating":Z
    .restart local v4    # "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v7    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v12    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v13    # "childWidth":Ljava/lang/Object;
    .restart local v14    # "childPos":I
    .local v15, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v28, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v30, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v35    # "childRendererHasOwnWidthProperty":Z
    .restart local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v53    # "childWidthWasReplaced":Z
    :cond_21
    move/from16 v56, v1

    move/from16 v54, v3

    move-object/from16 v57, v5

    move-object/from16 v55, v15

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    move-object/from16 v15, v30

    .end local v1    # "textSequenceOverflowXProcessing":Z
    .end local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v29    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v30    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v3, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v15, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v54    # "isChildFloating":Z
    .restart local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    .restart local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    const/4 v1, 0x0

    .line 353
    .local v1, "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->isInlineBlockChild(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v8

    .line 354
    .local v8, "isInlineBlockChild":Z
    move-object/from16 v28, v9

    .end local v9    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v28, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const-string v9, "Inline block element does not fit into parent element and will be clipped"

    move-object/from16 v29, v11

    .end local v11    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v29, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const v30, 0x3a83126f    # 0.001f

    if-eqz v8, :cond_28

    instance-of v11, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v11, :cond_28

    .line 355
    move-object v11, v2

    check-cast v11, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v11

    .line 358
    .local v11, "childBlockMinMaxWidthLocal":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    if-nez v53, :cond_22

    .line 359
    move-object v1, v11

    .line 362
    :cond_22
    invoke-virtual {v11}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v59

    .line 363
    .local v59, "childMaxWidth":F
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v39

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutContext;->getTextIndent()F

    move-result v40

    move-object/from16 v43, v2

    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v43, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    sub-float v2, v39, v40

    .line 364
    .local v2, "lineFullAvailableWidth":F
    if-nez v19, :cond_23

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v39

    add-float v39, v39, v30

    cmpl-float v39, v59, v39

    if-lez v39, :cond_23

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v39

    cmpl-float v39, v39, v2

    if-eqz v39, :cond_23

    .line 365
    new-instance v39, Lcom/itextpdf/layout/layout/LineLayoutResult;

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v40, 0x3

    move-object/from16 v44, v43

    invoke-direct/range {v39 .. v44}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v40, v3

    move-object/from16 v3, v43

    .end local v43    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v40, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move/from16 v41, v2

    move-object/from16 v42, v6

    move-object/from16 v45, v39

    move-object/from16 v39, v5

    .end local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    goto :goto_15

    .line 364
    .end local v39    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v3, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v43    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_23
    move-object/from16 v40, v3

    move-object/from16 v3, v43

    .line 367
    .end local v43    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    if-eqz v1, :cond_27

    .line 368
    move-object/from16 v39, v5

    .end local v5    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v39, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    add-float v5, v59, v30

    .line 369
    .end local v59    # "childMaxWidth":F
    .local v5, "childMaxWidth":F
    move-object/from16 v42, v6

    .end local v6    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .local v42, "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    invoke-static {v5, v2}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 371
    .local v6, "inlineBlockWidth":F
    move/from16 v41, v2

    const/16 v2, 0x67

    .end local v2    # "lineFullAvailableWidth":F
    .local v41, "lineFullAvailableWidth":F
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v43

    check-cast v43, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-static/range {v43 .. v43}, Lcom/itextpdf/layout/renderer/LineRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    if-nez v2, :cond_24

    .line 372
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v2

    add-float v2, v2, v30

    .line 373
    .local v2, "childMinWidth":F
    invoke-static {v2, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 375
    .end local v2    # "childMinWidth":F
    :cond_24
    invoke-virtual {v7, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 377
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v2

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v43

    cmpl-float v2, v2, v43

    if-lez v2, :cond_26

    .line 378
    sget-object v2, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v2}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 379
    sget-object v2, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v2, v9}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 381
    :cond_25
    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    move/from16 v43, v5

    const/16 v5, 0x1a

    .end local v5    # "childMaxWidth":F
    .local v43, "childMaxWidth":F
    invoke-interface {v3, v5, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_14

    .line 377
    .end local v43    # "childMaxWidth":F
    .restart local v5    # "childMaxWidth":F
    :cond_26
    move/from16 v43, v5

    .line 386
    .end local v5    # "childMaxWidth":F
    .end local v6    # "inlineBlockWidth":F
    .restart local v43    # "childMaxWidth":F
    :goto_14
    move/from16 v59, v43

    goto :goto_15

    .line 367
    .end local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v41    # "lineFullAvailableWidth":F
    .end local v42    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .end local v43    # "childMaxWidth":F
    .local v2, "lineFullAvailableWidth":F
    .local v5, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v6, "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .restart local v59    # "childMaxWidth":F
    :cond_27
    move/from16 v41, v2

    move-object/from16 v39, v5

    move-object/from16 v42, v6

    .line 386
    .end local v2    # "lineFullAvailableWidth":F
    .end local v5    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v6    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .restart local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v41    # "lineFullAvailableWidth":F
    .restart local v42    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    :goto_15
    if-eqz v1, :cond_29

    .line 387
    nop

    .line 388
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v2

    add-float v2, v2, v30

    .line 387
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 389
    nop

    .line 390
    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v2

    add-float v2, v2, v30

    .line 389
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    goto :goto_16

    .line 354
    .end local v11    # "childBlockMinMaxWidthLocal":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v41    # "lineFullAvailableWidth":F
    .end local v42    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .end local v59    # "childMaxWidth":F
    .local v2, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v3, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v5    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v6    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    :cond_28
    move-object/from16 v40, v3

    move-object/from16 v39, v5

    move-object/from16 v42, v6

    move-object v3, v2

    .line 394
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v5    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v6    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v42    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    :cond_29
    :goto_16
    move-object v11, v1

    .end local v1    # "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v11, "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    const/4 v6, 0x0

    .line 396
    .local v6, "shouldBreakLayouting":Z
    if-nez v45, :cond_30

    .line 397
    instance-of v1, v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v1, :cond_2a

    move-object v1, v3

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 398
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v1

    if-eqz v1, :cond_2a

    const/4 v1, 0x1

    goto :goto_17

    :cond_2a
    move/from16 v1, v16

    :goto_17
    move/from16 v41, v1

    .line 400
    .local v41, "setOverflowFitCausedBySpecialScripts":Z
    sget-object v1, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    if-ne v1, v4, :cond_2b

    instance-of v1, v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v1, :cond_2b

    move-object v1, v3

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 402
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v1

    if-nez v1, :cond_2c

    move v1, v5

    goto :goto_18

    .line 400
    :cond_2b
    const/4 v5, 0x1

    .line 402
    :cond_2c
    move/from16 v1, v16

    :goto_18
    move/from16 v17, v1

    .line 404
    .local v17, "setOverflowFitCausedByTextRendererInHtmlMode":Z
    if-nez v47, :cond_2e

    if-gtz v14, :cond_2d

    if-nez v41, :cond_2d

    if-eqz v17, :cond_2e

    :cond_2d
    if-nez v56, :cond_2e

    .line 408
    const/16 v2, 0x67

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 409
    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v1, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/16 v43, 0x1

    .line 410
    .end local v47    # "wasXOverflowChanged":Z
    .local v43, "wasXOverflowChanged":Z
    sget-object v5, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {v0, v2, v5}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    move/from16 v5, v43

    goto :goto_19

    .line 413
    .end local v1    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v43    # "wasXOverflowChanged":Z
    .restart local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v47    # "wasXOverflowChanged":Z
    :cond_2e
    move-object/from16 v1, v46

    move/from16 v5, v47

    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v47    # "wasXOverflowChanged":Z
    .restart local v1    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v5, "wasXOverflowChanged":Z
    :goto_19
    move/from16 v2, v56

    .end local v56    # "textSequenceOverflowXProcessing":Z
    .local v2, "textSequenceOverflowXProcessing":Z
    invoke-static {v0, v2, v3, v5, v1}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->preprocessTextSequenceOverflowX(Lcom/itextpdf/layout/renderer/LineRenderer;ZLcom/itextpdf/layout/renderer/IRenderer;ZLcom/itextpdf/layout/properties/OverflowPropertyValue;)V

    .line 416
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    move-object/from16 v43, v1

    .end local v1    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v43, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 417
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v46

    .end local v2    # "textSequenceOverflowXProcessing":Z
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    invoke-virtual/range {v46 .. v46}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v2

    invoke-direct {v1, v2, v7}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1, v10}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    .line 416
    invoke-interface {v3, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 420
    .end local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v0, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    move-object/from16 v31, v11

    move-object/from16 v38, v12

    move v2, v14

    move/from16 v12, v16

    move-object/from16 v14, v39

    move/from16 v11, v54

    move/from16 v1, v56

    move/from16 v16, v10

    move-object v10, v4

    move-object v4, v0

    move-object/from16 v0, p0

    .end local v0    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v12    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v54    # "isChildFloating":Z
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .local v1, "textSequenceOverflowXProcessing":Z
    .local v2, "childPos":I
    .local v4, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v10, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v11, "isChildFloating":Z
    .local v14, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v16, "wasParentsHeightClipped":Z
    .local v31, "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v38, "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->postprocessTextSequenceOverflowX(Lcom/itextpdf/layout/renderer/LineRenderer;ZILcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutResult;Z)Z

    move-result v6

    .line 424
    move-object v1, v3

    .end local v3    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v1, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    move-object/from16 v3, v55

    .end local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v3, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    invoke-static {v3, v12, v1, v2, v4}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->updateTextSequenceLayoutResults(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/layout/LayoutResult;)V

    .line 426
    move/from16 v44, v12

    move-object/from16 v12, v49

    move-object/from16 v49, v15

    const/4 v15, 0x1

    .end local v15    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v12, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v49, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-static {v12, v15, v1, v2, v4}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->updateTextSequenceLayoutResults(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/layout/LayoutResult;)V

    .line 430
    instance-of v15, v4, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    if-eqz v15, :cond_2f

    if-eqz v31, :cond_2f

    .line 431
    move-object v15, v4

    check-cast v15, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v15

    .line 432
    .local v15, "childResultMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    nop

    .line 433
    invoke-virtual {v15}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v45

    move-object/from16 v55, v3

    .end local v3    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    add-float v3, v45, v30

    .line 432
    invoke-virtual {v15, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 434
    nop

    .line 435
    invoke-virtual {v15}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v3

    add-float v3, v3, v30

    .line 434
    invoke-virtual {v15, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    goto :goto_1a

    .line 430
    .end local v15    # "childResultMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v3    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    :cond_2f
    move-object/from16 v55, v3

    .line 440
    .end local v3    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v17    # "setOverflowFitCausedByTextRendererInHtmlMode":Z
    .end local v41    # "setOverflowFitCausedBySpecialScripts":Z
    .restart local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    :goto_1a
    move-object v3, v4

    move/from16 v47, v5

    move-object/from16 v46, v43

    move v15, v6

    goto :goto_1b

    .line 396
    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v2    # "childPos":I
    .end local v5    # "wasXOverflowChanged":Z
    .end local v16    # "wasParentsHeightClipped":Z
    .end local v31    # "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v38    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v43    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v4, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v10, "wasParentsHeightClipped":Z
    .local v11, "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v12, "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v14, "childPos":I
    .local v15, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v47    # "wasXOverflowChanged":Z
    .local v49, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v54    # "isChildFloating":Z
    :cond_30
    move-object v1, v3

    move-object/from16 v31, v11

    move-object/from16 v38, v12

    move v2, v14

    move/from16 v44, v16

    move-object/from16 v14, v39

    move-object/from16 v12, v49

    move/from16 v11, v54

    move/from16 v16, v10

    move-object/from16 v49, v15

    move-object v10, v4

    .end local v3    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v4    # "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .end local v15    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v39    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v54    # "isChildFloating":Z
    .restart local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v2    # "childPos":I
    .local v10, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v11, "isChildFloating":Z
    .local v12, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v14, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v16    # "wasParentsHeightClipped":Z
    .restart local v31    # "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v38    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v49, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move-object/from16 v3, v45

    move v15, v6

    .line 440
    .end local v6    # "shouldBreakLayouting":Z
    .end local v45    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v3, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v15, "shouldBreakLayouting":Z
    :goto_1b
    if-eqz v53, :cond_32

    .line 441
    if-eqz v35, :cond_31

    .line 442
    const/16 v4, 0x4d

    invoke-interface {v1, v4, v13}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_1c

    .line 444
    :cond_31
    const/16 v4, 0x4d

    invoke-interface {v1, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->deleteOwnProperty(I)V

    .line 448
    :cond_32
    :goto_1c
    const/4 v4, 0x0

    .line 449
    .local v4, "minChildWidth":F
    const/4 v5, 0x0

    .line 450
    .local v5, "maxChildWidth":F
    instance-of v6, v3, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    if-eqz v6, :cond_34

    .line 451
    if-nez v53, :cond_33

    .line 452
    move-object v6, v3

    check-cast v6, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v4

    .line 454
    :cond_33
    move-object v6, v3

    check-cast v6, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v5

    move/from16 v17, v4

    move/from16 v30, v5

    goto :goto_1d

    .line 455
    :cond_34
    if-eqz v31, :cond_35

    .line 456
    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v4

    .line 457
    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v5

    move/from16 v17, v4

    move/from16 v30, v5

    goto :goto_1d

    .line 455
    :cond_35
    move/from16 v17, v4

    move/from16 v30, v5

    .line 460
    .end local v4    # "minChildWidth":F
    .end local v5    # "maxChildWidth":F
    .local v17, "minChildWidth":F
    .local v30, "maxChildWidth":F
    :goto_1d
    invoke-virtual {v0, v1, v3, v10, v8}, Lcom/itextpdf/layout/renderer/LineRenderer;->getAscentDescentOfLayoutedChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/properties/RenderingMode;Z)[F

    move-result-object v4

    .line 463
    .local v4, "childAscentDescent":[F
    nop

    .line 464
    move-object/from16 v6, v34

    move-object/from16 v5, v37

    .end local v34    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .end local v37    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v5, "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v6, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    invoke-static {v0, v6, v2, v4, v5}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->updateTextRendererSequenceAscentDescent(Lcom/itextpdf/layout/renderer/LineRenderer;Ljava/util/Map;I[FLcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;)Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;

    move-result-object v37

    .line 468
    .end local v5    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .restart local v37    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    nop

    .line 472
    move-object v5, v7

    .end local v7    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual/range {v42 .. v42}, Lcom/itextpdf/layout/layout/LineLayoutContext;->getTextIndent()F

    move-result v7

    .line 469
    move-object/from16 v22, v12

    move-object v12, v3

    move-object/from16 v3, v18

    move-object/from16 v18, v4

    move/from16 v4, v23

    move/from16 v23, v15

    move-object v15, v6

    move-object/from16 v6, v22

    move-object/from16 v22, v37

    move-object/from16 v37, v13

    move-object/from16 v13, v22

    move-object/from16 v43, v1

    move/from16 v22, v8

    move-object/from16 v1, v57

    move-object v8, v5

    move-object/from16 v5, v55

    .end local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v1, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v3, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v4, "anythingPlaced":Z
    .local v5, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v6, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v8, "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v12, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v13, "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v15, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .local v18, "childAscentDescent":[F
    .local v22, "isInlineBlockChild":Z
    .local v23, "shouldBreakLayouting":Z
    .local v37, "childWidth":Ljava/lang/Object;
    .local v43, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static/range {v0 .. v7}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->updateTextRendererSequenceMinMaxWidth(Lcom/itextpdf/layout/renderer/LineRenderer;Lcom/itextpdf/layout/renderer/AbstractWidthHandler;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLjava/util/Map;Ljava/util/Map;F)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;

    move-result-object v7

    .line 474
    move v0, v2

    move/from16 v45, v4

    .end local v1    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v2    # "childPos":I
    .end local v3    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .end local v4    # "anythingPlaced":Z
    .end local v5    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v0, "childPos":I
    .local v7, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v45, "anythingPlaced":Z
    .restart local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    instance-of v1, v12, Lcom/itextpdf/layout/layout/TextLayoutResult;

    if-eqz v1, :cond_36

    move-object v1, v12

    check-cast v1, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 475
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isSplitForcedByNewline()Z

    move-result v1

    if-eqz v1, :cond_36

    const/4 v1, 0x1

    goto :goto_1e

    :cond_36
    move/from16 v1, v44

    :goto_1e
    move/from16 v41, v1

    .line 476
    .local v41, "newLineOccurred":Z
    if-nez v23, :cond_39

    .line 477
    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v5, 0x1

    if-ne v1, v5, :cond_38

    if-eqz v41, :cond_37

    goto :goto_1f

    :cond_37
    move/from16 v1, v44

    goto :goto_20

    :cond_38
    :goto_1f
    const/4 v1, 0x1

    :goto_20
    move/from16 v23, v1

    .line 480
    :cond_39
    if-eqz v23, :cond_3a

    instance-of v1, v12, Lcom/itextpdf/layout/layout/TextLayoutResult;

    if-eqz v1, :cond_3a

    const/4 v1, 0x1

    goto :goto_21

    :cond_3a
    move/from16 v1, v44

    :goto_21
    move/from16 v51, v1

    .line 482
    .local v51, "shouldBreakLayoutingOnTextRenderer":Z
    const/16 v54, 0x0

    .line 484
    .local v54, "forceOverflowForTextRendererPartialResult":Z
    if-eqz v51, :cond_4c

    .line 485
    move-object v1, v12

    check-cast v1, Lcom/itextpdf/layout/layout/TextLayoutResult;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isWordHasBeenSplit()Z

    move-result v1

    if-eqz v1, :cond_3b

    sget-object v1, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    if-eq v1, v10, :cond_3b

    move-object/from16 v1, v43

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 487
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v1

    if-nez v1, :cond_3b

    const/4 v1, 0x1

    goto :goto_22

    :cond_3b
    move/from16 v1, v44

    :goto_22
    move/from16 v59, v1

    .line 488
    .local v59, "isWordHasBeenSplitLayoutRenderingMode":Z
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 489
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v1

    if-eqz v1, :cond_3c

    if-nez v56, :cond_3c

    if-nez v41, :cond_3c

    const/4 v1, 0x1

    goto :goto_23

    :cond_3c
    move/from16 v1, v44

    :goto_23
    move/from16 v60, v1

    .line 491
    .local v60, "enableSpecialScriptsWrapping":Z
    sget-object v1, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    if-ne v1, v10, :cond_3d

    if-nez v41, :cond_3d

    if-nez v56, :cond_3d

    const/4 v1, 0x1

    goto :goto_24

    :cond_3d
    move/from16 v1, v44

    :goto_24
    move/from16 v61, v1

    .line 494
    .local v61, "enableTextSequenceWrapping":Z
    if-eqz v59, :cond_3e

    .line 495
    move-object/from16 v4, p1

    move-object/from16 v62, v7

    move-object/from16 v5, v28

    move-object/from16 v1, v43

    move-object/from16 v3, v46

    move/from16 v2, v47

    move-object v7, v6

    move-object/from16 v28, v12

    move/from16 v6, v16

    move-object/from16 v12, v57

    move-object/from16 v16, v10

    move v10, v0

    move-object/from16 v0, p0

    .end local v0    # "childPos":I
    .end local v43    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v47    # "wasXOverflowChanged":Z
    .end local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v1, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v2, "wasXOverflowChanged":Z
    .local v3, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v5, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v6, "wasParentsHeightClipped":Z
    .local v7, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v10, "childPos":I
    .local v12, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v16, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v28, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v62, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/LineRenderer;->isForceOverflowForTextRendererPartialResult(Lcom/itextpdf/layout/renderer/IRenderer;ZLcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;Z)Z

    move-result v54

    move/from16 v43, v6

    move-object v6, v3

    move/from16 v3, v43

    move-object/from16 v43, v5

    move/from16 v46, v3

    move v2, v10

    move-object/from16 v3, v18

    move/from16 v18, v23

    move/from16 v4, v32

    move/from16 v23, v45

    move-object v10, v1

    move-object/from16 v1, v55

    .end local v2    # "wasXOverflowChanged":Z
    .end local v5    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v3, "wasParentsHeightClipped":Z
    .local v6, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v43, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v47    # "wasXOverflowChanged":Z
    goto/16 :goto_2d

    .line 498
    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "wasParentsHeightClipped":Z
    .end local v62    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .restart local v0    # "childPos":I
    .local v6, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v7, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v10, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v12, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v16, "wasParentsHeightClipped":Z
    .local v28, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v43, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3e
    move-object/from16 v62, v7

    move/from16 v3, v16

    move-object/from16 v1, v43

    move-object v7, v6

    move-object/from16 v16, v10

    move-object/from16 v43, v28

    move-object/from16 v6, v46

    move v10, v0

    move-object/from16 v28, v12

    move-object/from16 v12, v57

    move-object/from16 v0, p0

    .end local v0    # "childPos":I
    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v3    # "wasParentsHeightClipped":Z
    .local v6, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v7, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v10, "childPos":I
    .local v12, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v16, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v28, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v43, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v62    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    if-eqz v60, :cond_42

    .line 499
    if-eqz v47, :cond_40

    sget-object v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    if-ne v6, v2, :cond_3f

    const/4 v2, 0x1

    goto :goto_25

    :cond_3f
    move/from16 v2, v44

    goto :goto_25

    .line 501
    :cond_40
    const/16 v2, 0x67

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-static {v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    :goto_25
    nop

    .line 502
    .local v2, "isOverflowFit":Z
    nop

    .line 503
    invoke-static {v0, v10, v7, v3, v2}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->getIndexAndLayoutResultOfTheLastTextRendererContainingSpecialScripts(Lcom/itextpdf/layout/renderer/LineRenderer;ILjava/util/Map;ZZ)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;

    move-result-object v4

    .line 508
    .local v4, "lastFittingChildRendererData":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
    if-nez v4, :cond_41

    .line 509
    const/4 v5, 0x1

    .line 510
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .local v5, "textSequenceOverflowXProcessing":Z
    const/16 v23, 0x0

    .line 511
    move/from16 v32, v10

    move-object/from16 v46, v1

    move v1, v5

    move v2, v10

    goto :goto_26

    .line 513
    .end local v5    # "textSequenceOverflowXProcessing":Z
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    :cond_41
    iget v5, v4, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    invoke-static {v10, v5, v7}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->getCurWidthRelayoutedTextSequenceDecrement(IILjava/util/Map;)F

    move-result v5

    sub-float v5, v52, v5

    .line 515
    .end local v52    # "curWidth":F
    .local v5, "curWidth":F
    iget v10, v4, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    .line 516
    move-object/from16 v46, v1

    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v46, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 517
    .end local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v1, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    move/from16 v57, v2

    .end local v2    # "isOverflowFit":Z
    .local v57, "isOverflowFit":Z
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v2

    .line 520
    .local v2, "textSequenceElemminMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {v2}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v17

    .line 521
    invoke-virtual {v2}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v30

    move-object/from16 v28, v1

    move/from16 v52, v5

    move/from16 v1, v56

    move v2, v10

    .line 523
    .end local v4    # "lastFittingChildRendererData":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
    .end local v5    # "curWidth":F
    .end local v10    # "childPos":I
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .end local v57    # "isOverflowFit":Z
    .local v1, "textSequenceOverflowXProcessing":Z
    .local v2, "childPos":I
    .restart local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v52    # "curWidth":F
    :goto_26
    move/from16 v56, v1

    move/from16 v4, v32

    move-object/from16 v10, v46

    move-object/from16 v1, v55

    move/from16 v46, v3

    move-object/from16 v3, v18

    move/from16 v18, v23

    move/from16 v23, v45

    goto/16 :goto_2d

    .end local v2    # "childPos":I
    .end local v46    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v1, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v10    # "childPos":I
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    :cond_42
    move-object/from16 v46, v1

    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v46    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v61, :cond_4b

    .line 524
    if-eqz v47, :cond_44

    sget-object v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    if-ne v6, v1, :cond_43

    const/4 v4, 0x1

    goto :goto_27

    :cond_43
    move/from16 v4, v44

    goto :goto_27

    .line 526
    :cond_44
    const/16 v2, 0x67

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-static {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v1

    move v4, v1

    :goto_27
    nop

    .line 527
    .local v4, "isOverflowFit":Z
    if-nez v26, :cond_46

    if-eqz v50, :cond_45

    goto :goto_28

    :cond_45
    move/from16 v5, v44

    goto :goto_29

    :cond_46
    :goto_28
    const/4 v5, 0x1

    .line 528
    :goto_29
    move v1, v10

    move-object/from16 v10, v46

    move-object/from16 v2, v55

    .end local v46    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v55    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v1, "childPos":I
    .local v2, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v10, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->getIndexAndLayoutResultOfTheLastTextRendererWithNoSpecialScripts(Lcom/itextpdf/layout/renderer/LineRenderer;ILjava/util/Map;ZZZ)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;

    move-result-object v5

    .line 532
    move-object/from16 v78, v2

    move v2, v1

    move-object/from16 v1, v78

    .local v1, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v2, "childPos":I
    .local v5, "lastFittingChildRendererData":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
    if-nez v5, :cond_47

    .line 533
    const/16 v46, 0x1

    .line 534
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .local v46, "textSequenceOverflowXProcessing":Z
    const/16 v23, 0x0

    .line 535
    move/from16 v32, v2

    move/from16 v4, v32

    move/from16 v56, v46

    move/from16 v46, v3

    move-object/from16 v3, v18

    move/from16 v18, v23

    move/from16 v23, v45

    goto/16 :goto_2d

    .line 537
    .end local v46    # "textSequenceOverflowXProcessing":Z
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    :cond_47
    move/from16 v46, v3

    .end local v3    # "wasParentsHeightClipped":Z
    .local v46, "wasParentsHeightClipped":Z
    iget v3, v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    invoke-static {v2, v3, v1}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->getCurWidthRelayoutedTextSequenceDecrement(IILjava/util/Map;)F

    move-result v3

    sub-float v3, v52, v3

    .line 539
    .end local v52    # "curWidth":F
    .local v3, "curWidth":F
    move/from16 v55, v2

    .end local v2    # "childPos":I
    .local v55, "childPos":I
    iget-object v2, v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 541
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    move/from16 v52, v3

    const/4 v3, 0x3

    .end local v3    # "curWidth":F
    .restart local v52    # "curWidth":F
    if-ne v2, v3, :cond_48

    iget v2, v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    const/16 v65, 0x1

    add-int/lit8 v2, v2, -0x1

    goto :goto_2a

    :cond_48
    iget v2, v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    .line 540
    :goto_2a
    invoke-virtual {v0, v2, v13, v15}, Lcom/itextpdf/layout/renderer/LineRenderer;->updateAscentDescentAfterTextRendererSequenceProcessing(ILcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;Ljava/util/Map;)[F

    move-result-object v2

    .line 548
    .end local v18    # "childAscentDescent":[F
    .local v2, "childAscentDescent":[F
    iget v3, v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    .line 549
    .end local v55    # "childPos":I
    .local v3, "childPos":I
    move-object/from16 v18, v2

    .end local v2    # "childAscentDescent":[F
    .restart local v18    # "childAscentDescent":[F
    iget-object v2, v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 550
    .end local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v2, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    if-nez v3, :cond_49

    move/from16 v55, v3

    .end local v3    # "childPos":I
    .restart local v55    # "childPos":I
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    move/from16 v57, v4

    const/4 v4, 0x3

    .end local v4    # "isOverflowFit":Z
    .restart local v57    # "isOverflowFit":Z
    if-ne v4, v3, :cond_4a

    .line 551
    const/4 v3, 0x0

    .end local v45    # "anythingPlaced":Z
    .local v3, "anythingPlaced":Z
    goto :goto_2b

    .line 550
    .end local v55    # "childPos":I
    .end local v57    # "isOverflowFit":Z
    .local v3, "childPos":I
    .restart local v4    # "isOverflowFit":Z
    .restart local v45    # "anythingPlaced":Z
    :cond_49
    move/from16 v55, v3

    move/from16 v57, v4

    .line 553
    .end local v3    # "childPos":I
    .end local v4    # "isOverflowFit":Z
    .restart local v55    # "childPos":I
    .restart local v57    # "isOverflowFit":Z
    :cond_4a
    move/from16 v3, v45

    .end local v45    # "anythingPlaced":Z
    .local v3, "anythingPlaced":Z
    :goto_2b
    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 555
    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v4

    .line 556
    .local v4, "textSequenceElemminMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v17

    .line 557
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v30

    move/from16 v4, v23

    move/from16 v23, v3

    move-object/from16 v3, v18

    move/from16 v18, v4

    move-object/from16 v28, v2

    move/from16 v4, v32

    move/from16 v2, v55

    goto :goto_2d

    .line 523
    .end local v1    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v2    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v4    # "textSequenceElemminMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v5    # "lastFittingChildRendererData":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
    .end local v57    # "isOverflowFit":Z
    .local v3, "wasParentsHeightClipped":Z
    .local v10, "childPos":I
    .restart local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v45    # "anythingPlaced":Z
    .local v46, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v55, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    :cond_4b
    move-object/from16 v1, v55

    move/from16 v55, v10

    move-object/from16 v10, v46

    move/from16 v46, v3

    .end local v3    # "wasParentsHeightClipped":Z
    .restart local v1    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v10, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v46, "wasParentsHeightClipped":Z
    .local v55, "childPos":I
    goto :goto_2c

    .line 484
    .end local v1    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v59    # "isWordHasBeenSplitLayoutRenderingMode":Z
    .end local v60    # "enableSpecialScriptsWrapping":Z
    .end local v61    # "enableTextSequenceWrapping":Z
    .end local v62    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .restart local v0    # "childPos":I
    .local v6, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v7, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v10, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v12, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v16, "wasParentsHeightClipped":Z
    .local v28, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v43, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v46, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v55, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v57, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_4c
    move-object/from16 v62, v7

    move-object/from16 v1, v55

    move/from16 v55, v0

    move-object v7, v6

    move-object/from16 v6, v46

    move-object/from16 v0, p0

    move/from16 v46, v16

    move-object/from16 v16, v10

    move-object/from16 v10, v43

    move-object/from16 v43, v28

    move-object/from16 v28, v12

    move-object/from16 v12, v57

    .line 562
    .end local v0    # "childPos":I
    .end local v57    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v1    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v6, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v7, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v10, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v12, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v16, "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .local v28, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v43, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v46, "wasParentsHeightClipped":Z
    .local v55, "childPos":I
    .restart local v62    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    :goto_2c
    move-object/from16 v3, v18

    move/from16 v18, v23

    move/from16 v4, v32

    move/from16 v23, v45

    move/from16 v2, v55

    .end local v32    # "firstChildToRelayout":I
    .end local v45    # "anythingPlaced":Z
    .end local v55    # "childPos":I
    .local v2, "childPos":I
    .local v3, "childAscentDescent":[F
    .local v4, "firstChildToRelayout":I
    .local v18, "shouldBreakLayouting":Z
    .local v23, "anythingPlaced":Z
    :goto_2d
    if-eq v2, v4, :cond_58

    .line 563
    if-nez v54, :cond_4d

    .line 564
    invoke-virtual {v0, v3, v10, v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->updateAscentDescentAfterChildLayout([FLcom/itextpdf/layout/renderer/IRenderer;Z)V

    .line 566
    :cond_4d
    iget v5, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    move-object/from16 v57, v1

    .end local v1    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v57, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    iget v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    sub-float/2addr v5, v1

    .line 568
    .local v5, "maxHeight":F
    if-eqz v23, :cond_4e

    const/4 v1, 0x0

    goto :goto_2e

    :cond_4e
    invoke-virtual/range {v42 .. v42}, Lcom/itextpdf/layout/layout/LineLayoutContext;->getTextIndent()F

    move-result v1

    :goto_2e
    move/from16 v32, v1

    .line 569
    .local v32, "currChildTextIndent":F
    if-eqz v24, :cond_54

    sget-object v1, Lcom/itextpdf/layout/properties/TabAlignment;->LEFT:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 570
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/layout/element/TabStop;->getTabAlignment()Lcom/itextpdf/layout/properties/TabAlignment;

    move-result-object v0

    if-eq v1, v0, :cond_50

    if-nez v18, :cond_50

    .line 572
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v65, 0x1

    add-int/lit8 v0, v0, -0x1

    if-eq v0, v2, :cond_50

    .line 573
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    add-int/lit8 v1, v2, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/TabRenderer;

    if-eqz v0, :cond_4f

    goto :goto_2f

    :cond_4f
    move-object/from16 v0, p0

    move-object/from16 v45, v3

    move-object/from16 v60, v15

    move-object/from16 v3, v24

    move-object/from16 v59, v43

    move/from16 v15, v46

    move/from16 v63, v52

    move-object/from16 v24, v6

    move-object/from16 v43, v7

    move/from16 v52, v11

    move v6, v2

    move v7, v4

    move v11, v5

    goto/16 :goto_33

    .line 574
    :cond_50
    :goto_2f
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    move/from16 v1, v36

    .end local v36    # "lastTabIndex":I
    .local v1, "lastTabIndex":I
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 575
    .local v0, "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    new-instance v36, Ljava/util/ArrayList;

    invoke-direct/range {v36 .. v36}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v45, v36

    .line 576
    .local v45, "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move-object/from16 v36, v0

    .end local v0    # "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v36, "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    move/from16 v55, v1

    .end local v1    # "lastTabIndex":I
    .local v55, "lastTabIndex":I
    add-int/lit8 v1, v55, 0x1

    move/from16 v59, v2

    .end local v2    # "childPos":I
    .local v59, "childPos":I
    add-int/lit8 v2, v59, 0x1

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    move-object/from16 v1, v45

    .end local v45    # "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v1, "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 577
    move v0, v4

    move-object v4, v1

    move-object/from16 v1, v43

    move-object/from16 v43, v7

    move v7, v0

    move-object/from16 v0, p0

    move-object/from16 v45, v3

    move-object/from16 v60, v15

    move-object/from16 v3, v24

    move/from16 v15, v46

    move/from16 v2, v52

    move-object/from16 v24, v6

    move/from16 v52, v11

    move/from16 v6, v59

    move v11, v5

    move-object/from16 v5, v36

    move/from16 v36, v55

    .end local v46    # "wasParentsHeightClipped":Z
    .end local v55    # "lastTabIndex":I
    .end local v59    # "childPos":I
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v2, "curWidth":F
    .local v3, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v4, "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v6, "childPos":I
    .local v7, "firstChildToRelayout":I
    .local v11, "maxHeight":F
    .local v15, "wasParentsHeightClipped":Z
    .local v24, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v36, "lastTabIndex":I
    .local v43, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v45, "childAscentDescent":[F
    .local v52, "isChildFloating":Z
    .local v60, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/LineRenderer;->calculateTab(Lcom/itextpdf/kernel/geom/Rectangle;FLcom/itextpdf/layout/element/TabStop;Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)F

    move-result v46

    .line 579
    move-object/from16 v59, v1

    move-object v1, v4

    .end local v4    # "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v1, "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v46, "tabWidth":F
    .local v59, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v4, Lcom/itextpdf/layout/layout/LayoutContext;

    move-object/from16 v55, v1

    .end local v1    # "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v55, "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v61

    move/from16 v63, v2

    .end local v2    # "curWidth":F
    .local v63, "curWidth":F
    invoke-virtual/range {v61 .. v61}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v2

    invoke-direct {v1, v2, v8}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v4, v1, v15}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-interface {v5, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    .line 581
    const/4 v1, 0x0

    .line 582
    .local v1, "sumOfAffectedRendererWidths":F
    invoke-interface/range {v55 .. v55}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_30
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_51

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 583
    .local v4, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    move/from16 v61, v1

    .end local v1    # "sumOfAffectedRendererWidths":F
    .local v61, "sumOfAffectedRendererWidths":F
    add-float v1, v46, v61

    move-object/from16 v66, v2

    const/4 v2, 0x0

    invoke-interface {v4, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 584
    invoke-interface {v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    add-float v1, v61, v1

    .line 585
    .end local v4    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v61    # "sumOfAffectedRendererWidths":F
    .restart local v1    # "sumOfAffectedRendererWidths":F
    move-object/from16 v2, v66

    goto :goto_30

    .line 586
    :cond_51
    move/from16 v61, v1

    .end local v1    # "sumOfAffectedRendererWidths":F
    .restart local v61    # "sumOfAffectedRendererWidths":F
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_52

    .line 587
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    add-float v2, v46, v61

    .line 588
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    .line 589
    invoke-interface {v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    sub-float/2addr v2, v4

    .line 588
    const/4 v4, 0x0

    invoke-interface {v1, v2, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_31

    .line 586
    :cond_52
    const/4 v4, 0x0

    .line 591
    :goto_31
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    add-float v1, v46, v1

    .line 592
    .local v1, "tabAndNextElemWidth":F
    invoke-virtual {v3}, Lcom/itextpdf/layout/element/TabStop;->getTabAlignment()Lcom/itextpdf/layout/properties/TabAlignment;

    move-result-object v2

    sget-object v4, Lcom/itextpdf/layout/properties/TabAlignment;->RIGHT:Lcom/itextpdf/layout/properties/TabAlignment;

    if-ne v2, v4, :cond_53

    add-float v2, v63, v1

    .line 593
    invoke-virtual {v3}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v4

    cmpg-float v2, v2, v4

    if-gez v2, :cond_53

    .line 594
    invoke-virtual {v3}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v2

    .end local v63    # "curWidth":F
    .restart local v2    # "curWidth":F
    goto :goto_32

    .line 596
    .end local v2    # "curWidth":F
    .restart local v63    # "curWidth":F
    :cond_53
    add-float v2, v63, v1

    .line 598
    .end local v63    # "curWidth":F
    .restart local v2    # "curWidth":F
    :goto_32
    add-float v4, v17, v32

    invoke-virtual {v12, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 599
    add-float v4, v46, v30

    add-float v4, v4, v32

    invoke-virtual {v12, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 600
    const/4 v1, 0x0

    .line 601
    .end local v3    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .end local v5    # "tabRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v46    # "tabWidth":F
    .end local v55    # "affectedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v61    # "sumOfAffectedRendererWidths":F
    .local v1, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    move-object v3, v1

    goto :goto_34

    .line 569
    .end local v1    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .end local v45    # "childAscentDescent":[F
    .end local v59    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v60    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .local v2, "childPos":I
    .local v3, "childAscentDescent":[F
    .local v4, "firstChildToRelayout":I
    .local v5, "maxHeight":F
    .local v6, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v7, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v11, "isChildFloating":Z
    .local v15, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .local v24, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v43, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v46, "wasParentsHeightClipped":Z
    .local v52, "curWidth":F
    :cond_54
    move-object/from16 v45, v3

    move-object/from16 v60, v15

    move-object/from16 v3, v24

    move-object/from16 v59, v43

    move/from16 v15, v46

    move/from16 v63, v52

    move-object/from16 v24, v6

    move-object/from16 v43, v7

    move/from16 v52, v11

    move v6, v2

    move v7, v4

    move v11, v5

    .line 601
    .end local v2    # "childPos":I
    .end local v4    # "firstChildToRelayout":I
    .end local v5    # "maxHeight":F
    .end local v46    # "wasParentsHeightClipped":Z
    .local v3, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v6, "childPos":I
    .local v7, "firstChildToRelayout":I
    .local v11, "maxHeight":F
    .local v15, "wasParentsHeightClipped":Z
    .local v24, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v43, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v45    # "childAscentDescent":[F
    .local v52, "isChildFloating":Z
    .restart local v59    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v60    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .restart local v63    # "curWidth":F
    :goto_33
    if-nez v3, :cond_56

    .line 602
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    if-eqz v1, :cond_55

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    if-eqz v1, :cond_55

    .line 603
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    add-float v1, v63, v1

    move/from16 v63, v1

    .line 605
    :cond_55
    add-float v1, v17, v32

    invoke-virtual {v12, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 606
    add-float v1, v30, v32

    invoke-virtual {v12, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    move/from16 v2, v63

    goto :goto_34

    .line 601
    :cond_56
    move/from16 v2, v63

    .line 608
    .end local v63    # "curWidth":F
    .local v2, "curWidth":F
    :goto_34
    if-nez v54, :cond_57

    .line 609
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 610
    invoke-virtual/range {v59 .. v59}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v5

    invoke-virtual/range {v59 .. v59}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v46

    invoke-virtual/range {v59 .. v59}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v55

    add-float v46, v46, v55

    move-object/from16 v55, v3

    .end local v3    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v55, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    sub-float v3, v46, v11

    invoke-direct {v4, v5, v3, v2, v11}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 609
    invoke-virtual {v1, v4}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_35

    .line 608
    .end local v55    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .restart local v3    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    :cond_57
    move-object/from16 v55, v3

    .line 615
    .end local v3    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .end local v11    # "maxHeight":F
    .end local v32    # "currChildTextIndent":F
    .restart local v55    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    :goto_35
    move v5, v2

    move-object/from16 v3, v55

    goto :goto_36

    .line 562
    .end local v45    # "childAscentDescent":[F
    .end local v55    # "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .end local v57    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v59    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v60    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .local v1, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v2, "childPos":I
    .local v3, "childAscentDescent":[F
    .restart local v4    # "firstChildToRelayout":I
    .local v6, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v7, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v11, "isChildFloating":Z
    .local v15, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .local v24, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v43, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v46    # "wasParentsHeightClipped":Z
    .local v52, "curWidth":F
    :cond_58
    move-object/from16 v57, v1

    move-object/from16 v45, v3

    move-object/from16 v60, v15

    move-object/from16 v3, v24

    move-object/from16 v59, v43

    move/from16 v15, v46

    move/from16 v63, v52

    move-object/from16 v24, v6

    move-object/from16 v43, v7

    move/from16 v52, v11

    move v6, v2

    move v7, v4

    .end local v1    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v2    # "childPos":I
    .end local v4    # "firstChildToRelayout":I
    .end local v11    # "isChildFloating":Z
    .end local v46    # "wasParentsHeightClipped":Z
    .local v3, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v6, "childPos":I
    .local v7, "firstChildToRelayout":I
    .local v15, "wasParentsHeightClipped":Z
    .local v24, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v43, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v45    # "childAscentDescent":[F
    .local v52, "isChildFloating":Z
    .restart local v57    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v59    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v60    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .restart local v63    # "curWidth":F
    move/from16 v5, v63

    .line 615
    .end local v63    # "curWidth":F
    .local v5, "curWidth":F
    :goto_36
    if-eqz v18, :cond_69

    .line 616
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->split()[Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v1

    .line 617
    .local v1, "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    aget-object v2, v1, v44

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v4

    move/from16 v11, v44

    invoke-interface {v4, v11, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->setChildRenderers(Ljava/util/List;)V

    .line 619
    if-eqz v54, :cond_59

    .line 620
    const/16 v65, 0x1

    aget-object v2, v1, v65

    invoke-virtual {v2, v10}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v32, v1

    const/16 v65, 0x1

    goto/16 :goto_39

    .line 622
    :cond_59
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v4, 0x1a

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 623
    .local v2, "forcePlacement":Z
    if-eqz v22, :cond_5a

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->isFirstOnRootArea()Z

    move-result v4

    if-eqz v4, :cond_5a

    const/4 v4, 0x1

    goto :goto_37

    :cond_5a
    const/4 v4, 0x0

    .line 624
    .local v4, "isInlineBlockAndFirstOnRootArea":Z
    :goto_37
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v11

    move-object/from16 v32, v1

    const/4 v1, 0x2

    .end local v1    # "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v32, "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    if-ne v11, v1, :cond_5b

    if-eqz v22, :cond_5c

    if-nez v2, :cond_5c

    if-nez v4, :cond_5c

    .line 626
    :cond_5b
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v11, 0x1

    if-ne v1, v11, :cond_5e

    .line 627
    :cond_5c
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    .line 628
    .local v1, "splitRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    const/16 v44, 0x0

    aget-object v11, v32, v44

    invoke-virtual {v11, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 631
    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v11

    move/from16 v33, v2

    .end local v2    # "forcePlacement":Z
    .local v33, "forcePlacement":Z
    aget-object v2, v32, v44

    if-eq v11, v2, :cond_5d

    aget-object v2, v32, v44

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 632
    aget-object v2, v32, v44

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 634
    :cond_5d
    const/16 v23, 0x1

    goto :goto_38

    .line 626
    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v33    # "forcePlacement":Z
    .restart local v2    # "forcePlacement":Z
    :cond_5e
    move/from16 v33, v2

    .line 637
    .end local v2    # "forcePlacement":Z
    .restart local v33    # "forcePlacement":Z
    :goto_38
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_62

    .line 638
    if-eqz v22, :cond_5f

    if-nez v33, :cond_5f

    if-nez v4, :cond_5f

    .line 639
    const/16 v65, 0x1

    aget-object v1, v32, v65

    invoke-virtual {v1, v10}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    const/16 v65, 0x1

    goto :goto_39

    .line 640
    :cond_5f
    if-eqz v22, :cond_61

    .line 641
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 642
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_61

    .line 643
    sget-object v1, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v1}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_60

    .line 644
    sget-object v1, Lcom/itextpdf/layout/renderer/LineRenderer;->logger:Lorg/slf4j/Logger;

    invoke-interface {v1, v9}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    const/16 v65, 0x1

    goto :goto_39

    .line 643
    :cond_60
    const/16 v65, 0x1

    goto :goto_39

    .line 647
    :cond_61
    const/16 v65, 0x1

    aget-object v1, v32, v65

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_39

    .line 637
    :cond_62
    const/16 v65, 0x1

    .line 651
    .end local v4    # "isInlineBlockAndFirstOnRootArea":Z
    .end local v33    # "forcePlacement":Z
    :goto_39
    aget-object v1, v32, v65

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    add-int/lit8 v4, v6, 0x1

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-interface {v2, v4, v9}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 653
    const/4 v2, 0x0

    aget-object v1, v32, v2

    invoke-direct {v0, v14, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->replaceSplitRendererKidFloats(Ljava/util/Map;Lcom/itextpdf/layout/renderer/LineRenderer;)V

    .line 654
    aget-object v1, v32, v2

    move-object/from16 v4, v49

    .end local v49    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v4, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {v1, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->removeAllChildRenderers(Ljava/util/Collection;)Z

    .line 655
    const/16 v65, 0x1

    aget-object v1, v32, v65

    invoke-virtual {v1, v2, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(ILjava/util/List;)V

    .line 658
    aget-object v1, v32, v65

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_63

    invoke-interface/range {v40 .. v40}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_63

    .line 659
    const/4 v9, 0x0

    aput-object v9, v32, v65

    goto :goto_3a

    .line 658
    :cond_63
    const/4 v9, 0x0

    .line 662
    :goto_3a
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_64

    .line 663
    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    goto :goto_3b

    :cond_64
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    :goto_3b
    move-object/from16 v71, v1

    .line 664
    .local v71, "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    const/16 v65, 0x1

    aget-object v1, v32, v65

    if-nez v1, :cond_65

    .line 665
    new-instance v66, Lcom/itextpdf/layout/layout/LineLayoutResult;

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/16 v44, 0x0

    aget-object v69, v32, v44

    aget-object v70, v32, v65

    const/16 v67, 0x1

    move-object/from16 v68, v1

    invoke-direct/range {v66 .. v71}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v1, v66

    const/4 v11, 0x1

    .end local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v66, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    goto :goto_3d

    .line 666
    .end local v66    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .restart local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :cond_65
    if-nez v23, :cond_67

    if-eqz v26, :cond_66

    goto :goto_3c

    .line 670
    :cond_66
    new-instance v72, Lcom/itextpdf/layout/layout/LineLayoutResult;

    const/16 v65, 0x1

    aget-object v76, v32, v65

    const/16 v77, 0x0

    const/16 v73, 0x3

    const/16 v74, 0x0

    const/16 v75, 0x0

    invoke-direct/range {v72 .. v77}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v1, v72

    const/4 v11, 0x1

    .end local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v72, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    goto :goto_3d

    .line 667
    .end local v72    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .restart local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :cond_67
    :goto_3c
    new-instance v66, Lcom/itextpdf/layout/layout/LineLayoutResult;

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/16 v44, 0x0

    aget-object v69, v32, v44

    const/4 v11, 0x1

    aget-object v70, v32, v11

    const/16 v67, 0x2

    move-object/from16 v68, v1

    invoke-direct/range {v66 .. v71}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v1, v66

    .line 672
    .end local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v1, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :goto_3d
    move-object/from16 v2, v40

    .end local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v2, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->setFloatsOverflowedToNextPage(Ljava/util/List;)V

    .line 673
    if-eqz v41, :cond_68

    .line 674
    invoke-virtual {v1, v11}, Lcom/itextpdf/layout/layout/LineLayoutResult;->setSplitForcedByNewline(Z)Lcom/itextpdf/layout/layout/LineLayoutResult;

    .line 688
    .end local v8    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v10    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v16    # "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .end local v17    # "minChildWidth":F
    .end local v18    # "shouldBreakLayouting":Z
    .end local v22    # "isInlineBlockChild":Z
    .end local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v30    # "maxChildWidth":F
    .end local v31    # "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v32    # "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v35    # "childRendererHasOwnWidthProperty":Z
    .end local v37    # "childWidth":Ljava/lang/Object;
    .end local v38    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v41    # "newLineOccurred":Z
    .end local v45    # "childAscentDescent":[F
    .end local v51    # "shouldBreakLayoutingOnTextRenderer":Z
    .end local v52    # "isChildFloating":Z
    .end local v53    # "childWidthWasReplaced":Z
    .end local v54    # "forceOverflowForTextRendererPartialResult":Z
    .end local v71    # "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_68
    move-object/from16 v25, v1

    move/from16 v52, v5

    move/from16 v17, v6

    move/from16 v32, v7

    move-object/from16 v37, v13

    move-object/from16 v6, v24

    move-object/from16 v18, v62

    move-object/from16 v24, v3

    goto/16 :goto_3f

    .line 679
    .end local v1    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .end local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v4    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v8    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v10    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v16    # "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .restart local v17    # "minChildWidth":F
    .restart local v18    # "shouldBreakLayouting":Z
    .restart local v22    # "isInlineBlockChild":Z
    .restart local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .restart local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v30    # "maxChildWidth":F
    .restart local v31    # "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v35    # "childRendererHasOwnWidthProperty":Z
    .restart local v37    # "childWidth":Ljava/lang/Object;
    .restart local v38    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v41    # "newLineOccurred":Z
    .restart local v45    # "childAscentDescent":[F
    .restart local v49    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v51    # "shouldBreakLayoutingOnTextRenderer":Z
    .restart local v52    # "isChildFloating":Z
    .restart local v53    # "childWidthWasReplaced":Z
    .restart local v54    # "forceOverflowForTextRendererPartialResult":Z
    :cond_69
    move-object/from16 v2, v40

    move-object/from16 v4, v49

    const/4 v11, 0x1

    .end local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v49    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v4    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    if-ne v6, v7, :cond_6a

    .line 680
    const/4 v1, -0x1

    .end local v7    # "firstChildToRelayout":I
    .local v1, "firstChildToRelayout":I
    goto :goto_3e

    .line 682
    .end local v1    # "firstChildToRelayout":I
    .restart local v7    # "firstChildToRelayout":I
    :cond_6a
    const/4 v1, 0x1

    .line 683
    .end local v23    # "anythingPlaced":Z
    .local v1, "anythingPlaced":Z
    add-int/lit8 v6, v6, 0x1

    move/from16 v23, v1

    move v1, v7

    .line 686
    .end local v7    # "firstChildToRelayout":I
    .end local v8    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v10    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v16    # "childRenderingMode":Lcom/itextpdf/layout/properties/RenderingMode;
    .end local v17    # "minChildWidth":F
    .end local v18    # "shouldBreakLayouting":Z
    .end local v22    # "isInlineBlockChild":Z
    .end local v28    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v30    # "maxChildWidth":F
    .end local v31    # "childBlockMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v35    # "childRendererHasOwnWidthProperty":Z
    .end local v37    # "childWidth":Ljava/lang/Object;
    .end local v38    # "kidFloatPropertyVal":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v41    # "newLineOccurred":Z
    .end local v45    # "childAscentDescent":[F
    .end local v51    # "shouldBreakLayoutingOnTextRenderer":Z
    .end local v52    # "isChildFloating":Z
    .end local v53    # "childWidthWasReplaced":Z
    .end local v54    # "forceOverflowForTextRendererPartialResult":Z
    .local v1, "firstChildToRelayout":I
    .restart local v23    # "anythingPlaced":Z
    :goto_3e
    move-object/from16 v7, v24

    move-object/from16 v24, v3

    move-object v3, v7

    move-object/from16 v8, p1

    move-object/from16 v30, v4

    move/from16 v17, v11

    move-object/from16 v37, v13

    move-object/from16 v28, v14

    move v10, v15

    move-object/from16 v18, v20

    move-object/from16 v15, v27

    move-object/from16 v11, v29

    move/from16 v14, v33

    move-object/from16 v31, v43

    move/from16 v4, v47

    move/from16 v7, v48

    move/from16 v13, v50

    move-object/from16 v32, v57

    move-object/from16 v9, v59

    move-object/from16 v34, v60

    move-object/from16 v35, v62

    const/16 v16, 0x0

    const/16 v22, 0x0

    move-object/from16 v29, v2

    move v2, v6

    move-object/from16 v20, v12

    move-object/from16 v6, v42

    move v12, v1

    move/from16 v1, v56

    goto/16 :goto_5

    .line 182
    .end local v14    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v15    # "wasParentsHeightClipped":Z
    .end local v42    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .end local v43    # "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v47    # "wasXOverflowChanged":Z
    .end local v48    # "totalNumberOfTrimmedGlyphs":I
    .end local v50    # "floatsPlacedBeforeLine":Z
    .end local v56    # "textSequenceOverflowXProcessing":Z
    .end local v57    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v59    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v60    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .end local v62    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v1, "textSequenceOverflowXProcessing":Z
    .local v2, "childPos":I
    .local v3, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v4, "wasXOverflowChanged":Z
    .local v6, "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .local v7, "totalNumberOfTrimmedGlyphs":I
    .restart local v9    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v10, "wasParentsHeightClipped":Z
    .local v11, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "firstChildToRelayout":I
    .local v13, "floatsPlacedBeforeLine":Z
    .local v18, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v20, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v24, "hangingTabStop":Lcom/itextpdf/layout/element/TabStop;
    .local v28, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v29, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v30, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v31, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v32, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v34    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .local v35, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v37, "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    :cond_6b
    move/from16 v56, v1

    move/from16 v55, v2

    move-object/from16 v46, v3

    move/from16 v47, v4

    move/from16 v41, v5

    move-object/from16 v42, v6

    move/from16 v48, v7

    move-object/from16 v59, v9

    move v15, v10

    move/from16 v50, v13

    move/from16 v45, v23

    move-object/from16 v14, v28

    move-object/from16 v2, v29

    move-object/from16 v4, v30

    move-object/from16 v43, v31

    move-object/from16 v57, v32

    move-object/from16 v60, v34

    move-object/from16 v5, v37

    const/4 v9, 0x0

    move-object/from16 v29, v11

    move/from16 v32, v12

    move/from16 v11, v17

    move-object/from16 v12, v20

    move-object/from16 v20, v18

    move-object/from16 v18, v35

    .end local v1    # "textSequenceOverflowXProcessing":Z
    .end local v3    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v6    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .end local v7    # "totalNumberOfTrimmedGlyphs":I
    .end local v9    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v10    # "wasParentsHeightClipped":Z
    .end local v11    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v13    # "floatsPlacedBeforeLine":Z
    .end local v23    # "anythingPlaced":Z
    .end local v28    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v30    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v31    # "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local v34    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    .end local v35    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .end local v37    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v2, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v4, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v12, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v14    # "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v15    # "wasParentsHeightClipped":Z
    .local v18, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v20, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v29, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v32, "firstChildToRelayout":I
    .local v41, "curWidth":F
    .restart local v42    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .restart local v43    # "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v45, "anythingPlaced":Z
    .local v46, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v47    # "wasXOverflowChanged":Z
    .restart local v48    # "totalNumberOfTrimmedGlyphs":I
    .restart local v50    # "floatsPlacedBeforeLine":Z
    .local v55, "childPos":I
    .restart local v56    # "textSequenceOverflowXProcessing":Z
    .restart local v57    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local v59    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v60    # "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    move/from16 v52, v41

    move-object/from16 v6, v46

    move/from16 v17, v55

    .line 688
    .end local v5    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .end local v41    # "curWidth":F
    .end local v45    # "anythingPlaced":Z
    .end local v46    # "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v55    # "childPos":I
    .local v6, "oldXOverflow":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v17, "childPos":I
    .restart local v23    # "anythingPlaced":Z
    .restart local v37    # "lineAscentDescentStateBeforeTextRendererSequence":Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .local v52, "curWidth":F
    :goto_3f
    move v3, v15

    .end local v15    # "wasParentsHeightClipped":Z
    .local v3, "wasParentsHeightClipped":Z
    const/4 v15, 0x1

    const/16 v16, 0x0

    move/from16 v46, v3

    move-object v10, v14

    move-object/from16 v7, v20

    move-object/from16 v8, v27

    move-object/from16 v14, v43

    move-object/from16 v20, v12

    move v12, v11

    move-object v11, v4

    .end local v3    # "wasParentsHeightClipped":Z
    .end local v4    # "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v12    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v27    # "baseDirection":Lcom/itextpdf/layout/properties/BaseDirection;
    .end local v43    # "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v7, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v8, "baseDirection":Lcom/itextpdf/layout/properties/BaseDirection;
    .local v10, "floatsToNextPageSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v11, "floatsOverflowedToNextLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v14, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v20, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v46, "wasParentsHeightClipped":Z
    invoke-static/range {v14 .. v20}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->resetTextSequenceIfItEnded(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLcom/itextpdf/layout/renderer/AbstractWidthHandler;)V

    .line 690
    move-object/from16 v49, v14

    .end local v14    # "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v49, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    const/4 v15, 0x0

    move-object/from16 v14, v57

    .end local v57    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local v14, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    invoke-static/range {v14 .. v20}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->resetTextSequenceIfItEnded(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLcom/itextpdf/layout/renderer/AbstractWidthHandler;)V

    .line 693
    move-object/from16 v55, v14

    move/from16 v14, v17

    .end local v17    # "childPos":I
    .local v14, "childPos":I
    .local v55, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    if-nez v25, :cond_75

    .line 694
    nop

    .line 695
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6c

    move v15, v12

    goto :goto_40

    :cond_6c
    const/4 v15, 0x0

    .line 696
    .local v15, "noOverflowedFloats":Z
    :goto_40
    if-nez v23, :cond_6d

    if-eqz v26, :cond_6e

    :cond_6d
    if-nez v15, :cond_74

    :cond_6e
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6f

    move-object v13, v2

    goto/16 :goto_43

    .line 699
    :cond_6f
    if-eqz v15, :cond_70

    .line 702
    new-instance v1, Lcom/itextpdf/layout/layout/LineLayoutResult;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-direct {v1, v12, v3, v9, v9}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v25, v1

    move-object v13, v2

    move-object/from16 v2, v25

    goto/16 :goto_44

    .line 703
    :cond_70
    if-nez v23, :cond_73

    if-eqz v26, :cond_71

    move-object v13, v2

    goto :goto_42

    .line 717
    :cond_71
    nop

    .line 718
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_72

    const/4 v1, 0x0

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    move-object v5, v3

    goto :goto_41

    :cond_72
    const/4 v1, 0x0

    .line 719
    invoke-interface {v11, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    move-object v5, v3

    :goto_41
    nop

    .line 720
    .local v5, "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    new-instance v0, Lcom/itextpdf/layout/layout/LineLayoutResult;

    move-object/from16 v40, v2

    .end local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object/from16 v4, p0

    move-object/from16 v13, v40

    .end local v40    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v13, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    move-object/from16 v25, v1

    move-object/from16 v2, v25

    goto :goto_44

    .line 703
    .end local v5    # "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v13    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_73
    move-object v13, v2

    .line 704
    .end local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v13    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_42
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->split()[Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v1

    .line 705
    .local v1, "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    const/4 v2, 0x0

    aget-object v3, v1, v2

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v2, v14}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 706
    aget-object v3, v1, v2

    invoke-direct {v0, v10, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->replaceSplitRendererKidFloats(Ljava/util/Map;Lcom/itextpdf/layout/renderer/LineRenderer;)V

    .line 707
    aget-object v3, v1, v2

    invoke-virtual {v3, v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->removeAllChildRenderers(Ljava/util/Collection;)Z

    .line 713
    aget-object v3, v1, v12

    invoke-virtual {v3, v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 714
    new-instance v61, Lcom/itextpdf/layout/layout/LineLayoutResult;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    aget-object v64, v1, v2

    aget-object v65, v1, v12

    const/16 v66, 0x0

    const/16 v62, 0x2

    move-object/from16 v63, v3

    invoke-direct/range {v61 .. v66}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v2, v61

    .line 715
    .end local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v2, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    invoke-virtual {v2, v13}, Lcom/itextpdf/layout/layout/LineLayoutResult;->setFloatsOverflowedToNextPage(Ljava/util/List;)V

    .line 716
    .end local v1    # "split":[Lcom/itextpdf/layout/renderer/LineRenderer;
    goto :goto_44

    .line 696
    .end local v13    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v2, "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :cond_74
    move-object v13, v2

    .line 697
    .end local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v13    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_43
    new-instance v1, Lcom/itextpdf/layout/layout/LineLayoutResult;

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-direct {v1, v12, v2, v9, v9}, Lcom/itextpdf/layout/layout/LineLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v25, v1

    move-object/from16 v2, v25

    goto :goto_44

    .line 693
    .end local v13    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v15    # "noOverflowedFloats":Z
    .restart local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_75
    move-object v13, v2

    .end local v2    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v13    # "floatsToNextPageOverflowRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move-object/from16 v2, v25

    .line 725
    .end local v25    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v2, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :goto_44
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 726
    .local v1, "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    if-nez v1, :cond_76

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getStatus()I

    move-result v3

    if-ne v3, v12, :cond_76

    .line 727
    move-object/from16 v1, p0

    .line 729
    :cond_76
    if-eqz v8, :cond_7a

    sget-object v3, Lcom/itextpdf/layout/properties/BaseDirection;->NO_BIDI:Lcom/itextpdf/layout/properties/BaseDirection;

    if-eq v8, v3, :cond_7a

    if-eqz v1, :cond_7a

    .line 730
    invoke-static {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->splitLineIntoGlyphs(Lcom/itextpdf/layout/renderer/LineRenderer;)Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;

    move-result-object v3

    .line 731
    .local v3, "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->getLineGlyphs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [B

    .line 732
    .local v4, "lineLevels":[B
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    if-eqz v5, :cond_77

    .line 733
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->getLineGlyphs()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    const/4 v15, 0x0

    invoke-static {v5, v15, v4, v15, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 736
    :cond_77
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;->getLineGlyphs()Ljava/util/List;

    move-result-object v5

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    invoke-static {v5, v4, v12}, Lcom/itextpdf/layout/renderer/TypographyUtils;->reorderLine(Ljava/util/List;[B[B)[I

    move-result-object v5

    .line 737
    .local v5, "newOrder":[I
    if-eqz v5, :cond_78

    .line 738
    invoke-static {v1, v3, v5}, Lcom/itextpdf/layout/renderer/LineRenderer;->reorder(Lcom/itextpdf/layout/renderer/LineRenderer;Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;[I)V

    .line 739
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v12

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v15

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v15

    invoke-static {v12, v15}, Lcom/itextpdf/layout/renderer/LineRenderer;->adjustChildPositionsAfterReordering(Ljava/util/List;F)V

    .line 742
    :cond_78
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getStatus()I

    move-result v12

    const/4 v15, 0x2

    if-ne v12, v15, :cond_79

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    if-eqz v12, :cond_79

    .line 743
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 744
    .local v12, "overflow":Lcom/itextpdf/layout/renderer/LineRenderer;
    iget-object v15, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    array-length v15, v15

    array-length v9, v4

    sub-int/2addr v15, v9

    new-array v9, v15, [B

    iput-object v9, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    .line 745
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    array-length v15, v4

    move-object/from16 v16, v1

    .end local v1    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v16, "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    iget-object v1, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    move-object/from16 v17, v3

    .end local v3    # "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .local v17, "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    iget-object v3, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    array-length v3, v3

    move-object/from16 v22, v4

    const/4 v4, 0x0

    .end local v4    # "lineLevels":[B
    .local v22, "lineLevels":[B
    invoke-static {v9, v15, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 746
    iget-object v1, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    array-length v1, v1

    if-nez v1, :cond_7b

    .line 747
    const/4 v1, 0x0

    iput-object v1, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    goto :goto_45

    .line 742
    .end local v12    # "overflow":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v16    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v17    # "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .end local v22    # "lineLevels":[B
    .restart local v1    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v3    # "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .restart local v4    # "lineLevels":[B
    :cond_79
    move-object/from16 v16, v1

    move-object/from16 v17, v3

    move-object/from16 v22, v4

    .end local v1    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v3    # "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .end local v4    # "lineLevels":[B
    .restart local v16    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v17    # "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .restart local v22    # "lineLevels":[B
    goto :goto_45

    .line 729
    .end local v5    # "newOrder":[I
    .end local v16    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v17    # "splitIntoGlyphsData":Lcom/itextpdf/layout/renderer/LineRenderer$LineSplitIntoGlyphsData;
    .end local v22    # "lineLevels":[B
    .restart local v1    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    :cond_7a
    move-object/from16 v16, v1

    .line 752
    .end local v1    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v16    # "toProcess":Lcom/itextpdf/layout/renderer/LineRenderer;
    :cond_7b
    :goto_45
    if-nez v23, :cond_7c

    if-eqz v26, :cond_7d

    .line 753
    :cond_7c
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/layout/renderer/LineRenderer;->adjustChildrenYLine()Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->trimLast()Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 754
    invoke-virtual {v2, v7}, Lcom/itextpdf/layout/layout/LineLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    .line 757
    :cond_7d
    if-eqz v47, :cond_7f

    .line 758
    const/16 v3, 0x67

    invoke-virtual {v0, v3, v6}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 759
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_7e

    .line 760
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v1, v3, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 762
    :cond_7e
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_7f

    .line 763
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v1, v3, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 766
    :cond_7f
    return-object v2
.end method

.method protected length()I
    .locals 4

    .line 873
    const/4 v0, 0x0

    .line 874
    .local v0, "length":I
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 875
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_0

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 876
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->lineLength()I

    move-result v3

    add-int/2addr v0, v3

    .line 878
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 879
    :cond_1
    return v0
.end method

.method protected split()[Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 3

    .line 915
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->createSplitRenderer()Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v0

    .line 916
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 917
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 918
    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    .line 919
    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 920
    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    .line 921
    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    .line 922
    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    .line 923
    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    .line 924
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->levels:[B

    .line 925
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 927
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->createOverflowRenderer()Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v1

    .line 928
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v2, v1, Lcom/itextpdf/layout/renderer/LineRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 929
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 931
    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 899
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 900
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 901
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 902
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 903
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method trimFirst()I
    .locals 7

    .line 1322
    const/4 v0, 0x0

    .line 1323
    .local v0, "totalNumberOfTrimmedGlyphs":I
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1324
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1325
    goto :goto_0

    .line 1328
    :cond_0
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v3, :cond_3

    .line 1329
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 1330
    .local v3, "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getText()Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v4

    .line 1331
    .local v4, "currentText":Lcom/itextpdf/io/font/otf/GlyphLine;
    if-eqz v4, :cond_1

    .line 1332
    iget v5, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 1333
    .local v5, "prevTextStart":I
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->trimFirst()V

    .line 1334
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getText()Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v6

    iget v6, v6, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v6, v5

    .line 1335
    .local v6, "numOfTrimmedGlyphs":I
    add-int/2addr v0, v6

    .line 1337
    .end local v5    # "prevTextStart":I
    .end local v6    # "numOfTrimmedGlyphs":I
    :cond_1
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->length()I

    move-result v5

    if-lez v5, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    .line 1338
    .end local v3    # "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    .end local v4    # "currentText":Lcom/itextpdf/io/font/otf/GlyphLine;
    .local v5, "trimFinished":Z
    :goto_1
    goto :goto_2

    .line 1339
    .end local v5    # "trimFinished":Z
    :cond_3
    const/4 v5, 0x1

    .line 1341
    .restart local v5    # "trimFinished":Z
    :goto_2
    if-eqz v5, :cond_4

    .line 1342
    goto :goto_3

    .line 1344
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v5    # "trimFinished":Z
    :cond_4
    goto :goto_0

    .line 1345
    :cond_5
    :goto_3
    return v0
.end method

.method protected trimLast()Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 5

    .line 956
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 957
    .local v0, "lastIndex":I
    const/4 v1, 0x0

    .line 958
    .local v1, "lastRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_1

    .line 959
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 960
    invoke-static {v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 961
    nop

    .line 964
    :cond_1
    instance-of v2, v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v2, :cond_2

    if-ltz v0, :cond_2

    .line 965
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->trimLast()F

    move-result v2

    .line 966
    .local v2, "trimmedSpace":F
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    sub-float/2addr v4, v2

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 968
    .end local v2    # "trimmedSpace":F
    :cond_2
    return-object p0
.end method

.method updateAscentDescentAfterChildLayout([FLcom/itextpdf/layout/renderer/IRenderer;Z)V
    .locals 3
    .param p1, "childAscentDescent"    # [F
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "isChildFloating"    # Z

    .line 1499
    const/4 v0, 0x0

    aget v0, p1, v0

    .line 1500
    .local v0, "childAscent":F
    const/4 v1, 0x1

    aget v1, p1, v1

    .line 1501
    .local v1, "childDescent":F
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    .line 1502
    instance-of v2, p2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v2, :cond_0

    .line 1503
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    goto :goto_0

    .line 1504
    :cond_0
    if-nez p3, :cond_1

    .line 1505
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockAscent:F

    .line 1507
    :cond_1
    :goto_0
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 1508
    instance-of v2, p2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v2, :cond_2

    .line 1509
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    goto :goto_1

    .line 1510
    :cond_2
    if-nez p3, :cond_3

    .line 1511
    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxBlockDescent:F

    .line 1513
    :cond_3
    :goto_1
    return-void
.end method

.method updateAscentDescentAfterTextRendererSequenceProcessing(ILcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;Ljava/util/Map;)[F
    .locals 9
    .param p1, "newChildPos"    # I
    .param p2, "lineAscentDescentStateBeforeTextRendererSequence"    # Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[F>;)[F"
        }
    .end annotation

    .line 1466
    .local p3, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    iget v0, p2, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxAscent:F

    .line 1467
    .local v0, "maxAscentUpdated":F
    iget v1, p2, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxDescent:F

    .line 1468
    .local v1, "maxDescentUpdated":F
    iget v2, p2, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxTextAscent:F

    .line 1469
    .local v2, "maxTextAscentUpdated":F
    iget v3, p2, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxTextDescent:F

    .line 1470
    .local v3, "maxTextDescentUpdated":F
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 1471
    .local v5, "childAscentDescent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[F>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-gt v8, p1, :cond_0

    .line 1472
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [F

    aget v8, v8, v7

    invoke-static {v0, v8}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 1473
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [F

    aget v8, v8, v6

    invoke-static {v1, v8}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 1474
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [F

    aget v7, v8, v7

    invoke-static {v2, v7}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 1475
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [F

    aget v6, v7, v6

    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 1477
    .end local v5    # "childAscentDescent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[F>;"
    :cond_0
    goto :goto_0

    .line 1479
    :cond_1
    iput v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    .line 1480
    iput v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    .line 1481
    iput v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    .line 1482
    iput v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    .line 1484
    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    iget v5, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    const/4 v8, 0x2

    new-array v8, v8, [F

    aput v4, v8, v7

    aput v5, v8, v6

    return-object v8
.end method
