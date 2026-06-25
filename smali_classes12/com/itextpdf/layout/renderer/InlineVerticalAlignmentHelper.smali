.class final Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;
.super Ljava/lang/Object;
.source "InlineVerticalAlignmentHelper.java"


# static fields
.field private static final ADJUSTMENT_THRESHOLD:F = 0.001f

.field private static final SUB_OFFSET:F = -0.2f

.field private static final SUPER_OFFSET:F = 0.3f


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method private static adjustBBox(Lcom/itextpdf/layout/renderer/LineRenderer;FFF)V
    .locals 8
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "maxHeight"    # F
    .param p2, "maxTop"    # F
    .param p3, "minBottom"    # F

    .line 137
    const/16 v0, 0x7c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/LineHeight;

    .line 138
    .local v0, "lineHeight":Lcom/itextpdf/layout/properties/LineHeight;
    move v1, p1

    .line 139
    .local v1, "actualHeight":F
    if-eqz v0, :cond_0

    .line 140
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->calculateLineHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 143
    :cond_0
    sub-float v2, v1, p1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    add-float/2addr p2, v2

    .line 144
    sub-float v2, v1, p1

    div-float/2addr v2, v3

    sub-float/2addr p3, v2

    .line 145
    move p1, v1

    .line 146
    sub-float v2, p2, p3

    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 148
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    .line 149
    .local v2, "originalTop":F
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 150
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    sub-float v3, v2, v3

    .line 151
    .local v3, "delta":F
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 153
    sub-float v4, v2, p2

    .line 154
    .local v4, "childDelta":F
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 155
    .local v6, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    const/4 v7, 0x0

    invoke-interface {v6, v7, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 156
    .end local v6    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 157
    :cond_1
    return-void
.end method

.method public static adjustChildrenYLineHtmlMode(Lcom/itextpdf/layout/renderer/LineRenderer;)V
    .locals 4
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 47
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 48
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    sub-float/2addr v0, v1

    .line 51
    .local v0, "actualYLine":F
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda0;-><init>()V

    new-instance v3, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda1;

    invoke-direct {v3}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {p0, v1, v0, v2, v3}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->processRenderers(Lcom/itextpdf/layout/renderer/LineRenderer;Ljava/util/List;FLjava/util/function/Predicate;Ljava/util/function/Predicate;)V

    .line 56
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda2;-><init>()V

    .line 57
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    move-result-object v1

    .line 58
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 59
    .local v1, "sortedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v2, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda3;-><init>()V

    new-instance v3, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda4;

    invoke-direct {v3}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$$ExternalSyntheticLambda4;-><init>()V

    invoke-static {p0, v1, v0, v2, v3}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->processRenderers(Lcom/itextpdf/layout/renderer/LineRenderer;Ljava/util/List;FLjava/util/function/Predicate;Ljava/util/function/Predicate;)V

    .line 62
    return-void
.end method

.method private static calculateOffset(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/InlineVerticalAlignment;FFFFFLcom/itextpdf/kernel/geom/Rectangle;)F
    .locals 4
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "cBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "alignment"    # Lcom/itextpdf/layout/properties/InlineVerticalAlignment;
    .param p3, "baseline"    # F
    .param p4, "textTop"    # F
    .param p5, "textBottom"    # F
    .param p6, "leading"    # F
    .param p7, "xHeight"    # F
    .param p8, "pBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 161
    sget-object v0, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper$1;->$SwitchMap$com$itextpdf$layout$properties$InlineVerticalAlignmentType:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getType()Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 193
    const/4 v0, 0x0

    return v0

    .line 191
    :pswitch_0
    invoke-virtual {p8}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v1

    sub-float/2addr v0, v1

    return v0

    .line 189
    :pswitch_1
    invoke-virtual {p8}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    sub-float/2addr v0, v1

    return v0

    .line 187
    :pswitch_2
    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p7, v0

    add-float/2addr v1, p3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    div-float/2addr v3, v0

    add-float/2addr v2, v3

    sub-float/2addr v1, v2

    return v1

    .line 175
    :pswitch_3
    const/4 v0, 0x0

    .line 176
    .local v0, "offsetFraction":F
    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getType()Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->SUPER:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    if-ne v1, v2, :cond_0

    .line 177
    const v0, 0x3e99999a    # 0.3f

    goto :goto_0

    .line 178
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getType()Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->SUB:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    if-ne v1, v2, :cond_1

    .line 179
    const v0, -0x41b33333    # -0.2f

    goto :goto_0

    .line 181
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getValue()F

    move-result v0

    .line 184
    :goto_0
    sub-float v1, p4, p5

    mul-float/2addr v1, v0

    add-float/2addr v1, p3

    .line 185
    .local v1, "target":F
    invoke-static {p0, p6}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->getChildBaseline(Lcom/itextpdf/layout/renderer/IRenderer;F)F

    move-result v2

    sub-float v2, v1, v2

    return v2

    .line 169
    .end local v0    # "offsetFraction":F
    .end local v1    # "target":F
    :pswitch_4
    const/4 v0, 0x0

    .line 170
    .local v0, "offsetFixed":F
    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getValue()F

    move-result v0

    .line 171
    add-float v1, p3, v0

    invoke-static {p0, p6}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->getChildBaseline(Lcom/itextpdf/layout/renderer/IRenderer;F)F

    move-result v2

    sub-float/2addr v1, v2

    return v1

    .line 167
    .end local v0    # "offsetFixed":F
    :pswitch_5
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    sub-float v0, p5, v0

    return v0

    .line 165
    :pswitch_6
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    sub-float v0, p4, v0

    return v0

    .line 163
    :pswitch_7
    invoke-static {p0, p6}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->getChildBaseline(Lcom/itextpdf/layout/renderer/IRenderer;F)F

    move-result v0

    sub-float v0, p3, v0

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getAdjustedArea(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 124
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 125
    .local v0, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    instance-of v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_0

    instance-of v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-nez v1, :cond_0

    .line 126
    const/16 v1, 0x88

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 127
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 128
    .local v1, "ar":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 129
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 132
    .end local v1    # "ar":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_0
    return-object v0
.end method

.method private static getChildBaseline(Lcom/itextpdf/layout/renderer/IRenderer;F)F
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "leading"    # F

    .line 198
    instance-of v0, p0, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    if-eqz v0, :cond_0

    .line 199
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;

    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/ILeafElementRenderer;->getDescent()F

    move-result v0

    .line 200
    .local v0, "descent":F
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    sub-float/2addr v1, v0

    return v1

    .line 202
    .end local v0    # "descent":F
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->isInlineBlockChild(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_1

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 203
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getLastYLineRecursively()Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 204
    .local v0, "yLine":Ljava/lang/Float;
    :goto_0
    if-nez v0, :cond_2

    .line 205
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, p1, v2

    sub-float/2addr v1, v2

    .line 204
    :goto_1
    return v1
.end method

.method private static isBoxOrientedVerticalAlignment(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z
    .locals 2
    .param p0, "alignment"    # Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getType()Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->TOP:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    if-eq v0, v1, :cond_1

    .line 66
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;->getType()Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 65
    :goto_1
    return v0
.end method

.method static synthetic lambda$adjustChildrenYLineHtmlMode$0(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z
    .locals 1
    .param p0, "alignment"    # Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    .line 52
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->isBoxOrientedVerticalAlignment(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method static synthetic lambda$adjustChildrenYLineHtmlMode$1(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z
    .locals 1
    .param p0, "alignment"    # Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    .line 53
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->isBoxOrientedVerticalAlignment(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method static synthetic lambda$adjustChildrenYLineHtmlMode$2(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)I
    .locals 2
    .param p0, "r1"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "r2"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 57
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 58
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float/2addr v0, v1

    .line 57
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method static synthetic lambda$adjustChildrenYLineHtmlMode$3(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z
    .locals 1
    .param p0, "alignment"    # Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    .line 60
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->isBoxOrientedVerticalAlignment(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$adjustChildrenYLineHtmlMode$4(Lcom/itextpdf/layout/properties/InlineVerticalAlignment;)Z
    .locals 1
    .param p0, "alignment"    # Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method private static processRenderers(Lcom/itextpdf/layout/renderer/LineRenderer;Ljava/util/List;FLjava/util/function/Predicate;Ljava/util/function/Predicate;)V
    .locals 19
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p2, "actualYLine"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;F",
            "Ljava/util/function/Predicate<",
            "Lcom/itextpdf/layout/properties/InlineVerticalAlignment;",
            ">;",
            "Ljava/util/function/Predicate<",
            "Lcom/itextpdf/layout/properties/InlineVerticalAlignment;",
            ">;)V"
        }
    .end annotation

    .line 72
    .local p1, "renderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p3, "needProcess":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/itextpdf/layout/properties/InlineVerticalAlignment;>;"
    .local p4, "needRecalculateSizes":Ljava/util/function/Predicate;, "Ljava/util/function/Predicate<Lcom/itextpdf/layout/properties/InlineVerticalAlignment;>;"
    move-object/from16 v0, p0

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->getActualFontInfo(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F

    move-result-object v1

    .line 73
    .local v1, "fontInfo":[F
    const/4 v2, 0x0

    aget v2, v1, v2

    add-float v2, p2, v2

    const/4 v3, 0x3

    aget v4, v1, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    sub-float v10, v2, v4

    .line 75
    .local v10, "textTop":F
    const/4 v2, 0x1

    aget v2, v1, v2

    add-float v2, p2, v2

    aget v4, v1, v3

    div-float/2addr v4, v5

    sub-float v11, v2, v4

    .line 77
    .local v11, "textBottom":F
    aget v12, v1, v3

    .line 78
    .local v12, "leading":F
    const/4 v2, 0x2

    aget v13, v1, v2

    .line 80
    .local v13, "xHeight":F
    const/4 v2, 0x1

    .line 81
    .local v2, "maxTop":F
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    .line 82
    .local v3, "minBottom":F
    const/4 v4, 0x1

    .line 83
    .local v4, "maxHeight":F
    const/4 v5, 0x0

    .line 84
    .local v5, "maxminValuesChanged":Z
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 85
    .local v6, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v6}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 86
    goto :goto_0

    .line 88
    :cond_0
    const/16 v7, 0x88

    invoke-interface {v6, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    .line 91
    .local v7, "alignment":Lcom/itextpdf/layout/properties/InlineVerticalAlignment;
    if-nez v7, :cond_1

    .line 92
    new-instance v8, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;

    invoke-direct {v8}, Lcom/itextpdf/layout/properties/InlineVerticalAlignment;-><init>()V

    move-object v7, v8

    goto :goto_1

    .line 91
    :cond_1
    move-object v8, v7

    .line 95
    .end local v7    # "alignment":Lcom/itextpdf/layout/properties/InlineVerticalAlignment;
    .local v8, "alignment":Lcom/itextpdf/layout/properties/InlineVerticalAlignment;
    :goto_1
    move-object/from16 v7, p3

    invoke-interface {v7, v8}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 96
    invoke-static {v6}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->getAdjustedArea(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    .line 98
    .local v7, "cBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v14, Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v9

    move-object/from16 v16, v1

    .end local v1    # "fontInfo":[F
    .local v16, "fontInfo":[F
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 99
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    move/from16 v17, v5

    .end local v5    # "maxminValuesChanged":Z
    .local v17, "maxminValuesChanged":Z
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 100
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    move-object/from16 v18, v6

    .end local v6    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v18, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 101
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-direct {v14, v9, v1, v5, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 102
    .local v14, "pBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    move/from16 v9, p2

    move-object/from16 v6, v18

    .end local v18    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v6    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static/range {v6 .. v14}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->calculateOffset(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/InlineVerticalAlignment;FFFFFLcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v1

    .line 104
    .local v1, "offset":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v9, 0x3a83126f    # 0.001f

    cmpl-float v5, v5, v9

    if-lez v5, :cond_3

    .line 105
    const/4 v5, 0x0

    invoke-interface {v6, v5, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_2

    .line 95
    .end local v7    # "cBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v14    # "pBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v16    # "fontInfo":[F
    .end local v17    # "maxminValuesChanged":Z
    .local v1, "fontInfo":[F
    .restart local v5    # "maxminValuesChanged":Z
    :cond_2
    move-object/from16 v16, v1

    move/from16 v17, v5

    .line 108
    .end local v1    # "fontInfo":[F
    .end local v5    # "maxminValuesChanged":Z
    .restart local v16    # "fontInfo":[F
    .restart local v17    # "maxminValuesChanged":Z
    :cond_3
    :goto_2
    move-object/from16 v1, p4

    invoke-interface {v1, v8}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 109
    invoke-static {v6}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->getAdjustedArea(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    .line 110
    .local v5, "cBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v7

    invoke-static {v2, v7}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 111
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 112
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    invoke-static {v4, v7}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 113
    const/4 v7, 0x1

    move v5, v7

    .end local v17    # "maxminValuesChanged":Z
    .local v7, "maxminValuesChanged":Z
    goto :goto_3

    .line 108
    .end local v5    # "cBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v7    # "maxminValuesChanged":Z
    .restart local v17    # "maxminValuesChanged":Z
    :cond_4
    move/from16 v5, v17

    .line 115
    .end local v6    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v8    # "alignment":Lcom/itextpdf/layout/properties/InlineVerticalAlignment;
    .end local v17    # "maxminValuesChanged":Z
    .local v5, "maxminValuesChanged":Z
    :goto_3
    move-object/from16 v1, v16

    goto/16 :goto_0

    .line 118
    .end local v16    # "fontInfo":[F
    .restart local v1    # "fontInfo":[F
    :cond_5
    move-object/from16 v16, v1

    move/from16 v17, v5

    move-object/from16 v1, p4

    .end local v1    # "fontInfo":[F
    .end local v5    # "maxminValuesChanged":Z
    .restart local v16    # "fontInfo":[F
    .restart local v17    # "maxminValuesChanged":Z
    if-eqz v17, :cond_6

    .line 119
    invoke-static {v0, v4, v2, v3}, Lcom/itextpdf/layout/renderer/InlineVerticalAlignmentHelper;->adjustBBox(Lcom/itextpdf/layout/renderer/LineRenderer;FFF)V

    .line 121
    :cond_6
    return-void
.end method
