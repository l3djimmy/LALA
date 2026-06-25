.class public Lcom/itextpdf/layout/renderer/ParagraphRenderer;
.super Lcom/itextpdf/layout/renderer/BlockRenderer;
.source "ParagraphRenderer.java"


# instance fields
.field protected lines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Paragraph;)V
    .locals 1
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/Paragraph;

    .line 74
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    .line 75
    return-void
.end method

.method private alignStaticKids(Lcom/itextpdf/layout/renderer/LineRenderer;F)V
    .locals 3
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p2, "dxRight"    # F

    .line 725
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 726
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

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

    .line 727
    .local v1, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 728
    goto :goto_0

    .line 730
    :cond_0
    const/4 v2, 0x0

    invoke-interface {v1, p2, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 731
    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 732
    :cond_1
    return-void
.end method

.method private applyTextAlignment(Lcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/layout/LineLayoutResult;Lcom/itextpdf/layout/renderer/LineRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;ZF)V
    .locals 4
    .param p1, "textAlignment"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .param p2, "result"    # Lcom/itextpdf/layout/layout/LineLayoutResult;
    .param p3, "processedRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p4, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p6, "onlyOverflowedFloatsLeft"    # Z
    .param p7, "lineIndent"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            "Lcom/itextpdf/layout/layout/LineLayoutResult;",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;ZF)V"
        }
    .end annotation

    .line 736
    .local p5, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    sget-object v0, Lcom/itextpdf/layout/properties/TextAlignment;->JUSTIFIED:Lcom/itextpdf/layout/properties/TextAlignment;

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getStatus()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->isSplitForcedByNewline()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p6, :cond_1

    :cond_0
    sget-object v0, Lcom/itextpdf/layout/properties/TextAlignment;->JUSTIFIED_ALL:Lcom/itextpdf/layout/properties/TextAlignment;

    if-ne p1, v0, :cond_2

    .line 738
    :cond_1
    if-eqz p3, :cond_3

    .line 739
    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 740
    .local v0, "actualLineLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-static {p5, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustLineAreaAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 741
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    sub-float/2addr v1, p7

    invoke-virtual {p3, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->justify(F)V

    .line 742
    .end local v0    # "actualLineLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_0

    .line 743
    :cond_2
    sget-object v0, Lcom/itextpdf/layout/properties/TextAlignment;->LEFT:Lcom/itextpdf/layout/properties/TextAlignment;

    if-eq p1, v0, :cond_3

    if-eqz p3, :cond_3

    .line 744
    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 745
    .restart local v0    # "actualLineLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-static {p5, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustLineAreaAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 746
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    sub-float/2addr v1, p7

    invoke-virtual {p3}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 747
    .local v1, "deltaX":F
    sget-object v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 755
    :pswitch_0
    sget-object v2, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    const/4 v3, 0x7

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/properties/BaseDirection;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 756
    invoke-direct {p0, p3, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->alignStaticKids(Lcom/itextpdf/layout/renderer/LineRenderer;F)V

    goto :goto_0

    .line 752
    :pswitch_1
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v1, v2

    invoke-direct {p0, p3, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->alignStaticKids(Lcom/itextpdf/layout/renderer/LineRenderer;F)V

    .line 753
    goto :goto_0

    .line 749
    :pswitch_2
    invoke-direct {p0, p3, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->alignStaticKids(Lcom/itextpdf/layout/renderer/LineRenderer;F)V

    .line 750
    nop

    .line 761
    .end local v0    # "actualLineLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v1    # "deltaX":F
    :cond_3
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private createOverflowRenderer()Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .locals 1

    .line 643
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    return-object v0
.end method

.method private createSplitRenderer()Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .locals 1

    .line 647
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    return-object v0
.end method

.method private fixOverflowRenderer(Lcom/itextpdf/layout/renderer/ParagraphRenderer;)V
    .locals 4
    .param p1, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    .line 718
    const/16 v0, 0x12

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 719
    .local v1, "firstLineIndent":F
    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-eqz v3, :cond_0

    .line 720
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->setProperty(ILjava/lang/Object;)V

    .line 722
    :cond_0
    return-void
.end method

.method private static updateParentLines(Lcom/itextpdf/layout/renderer/ParagraphRenderer;)V
    .locals 5
    .param p0, "re"    # Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    .line 764
    if-nez p0, :cond_0

    .line 765
    return-void

    .line 767
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 768
    .local v1, "lineRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v1, p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 769
    .end local v1    # "lineRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    goto :goto_0

    .line 770
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 771
    .local v1, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 772
    .local v2, "line":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 773
    :cond_2
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 775
    .end local v1    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v2    # "line":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_3
    goto :goto_1

    .line 776
    :cond_4
    return-void
.end method


# virtual methods
.method protected createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 1
    .param p1, "layoutResult"    # I

    .line 668
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->createOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v0

    return-object v0
.end method

.method protected createOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .locals 2
    .param p1, "parent"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 651
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->createOverflowRenderer()Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v0

    .line 652
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    iput-object p1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 653
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->fixOverflowRenderer(Lcom/itextpdf/layout/renderer/ParagraphRenderer;)V

    .line 654
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 655
    invoke-static {v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->clearPropertiesFromOverFlowRenderer(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 656
    return-object v0
.end method

.method protected createSplitRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .locals 2
    .param p1, "parent"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 660
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->createSplitRenderer()Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v0

    .line 661
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    iput-object p1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 662
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 663
    return-object v0
.end method

.method protected directLayout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 66
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 94
    move-object/from16 v0, p0

    const/4 v7, 0x0

    .line 95
    .local v7, "wasHeightClipped":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v6

    .line 96
    .local v6, "wasParentsHeightClipped":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v8

    .line 97
    .local v8, "pageNumber":I
    const/4 v9, 0x0

    .line 98
    .local v9, "anythingPlaced":Z
    const/4 v10, 0x1

    .line 99
    .local v10, "firstLineInBox":Z
    new-instance v1, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-direct {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;-><init>()V

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 100
    .local v11, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 102
    .local v1, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v2, 0x0

    .line 103
    .local v2, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v4, 0x59

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v12

    .line 104
    .local v12, "marginsCollapsingEnabled":Z
    if-eqz v12, :cond_0

    .line 105
    new-instance v3, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    move-object v2, v3

    move-object v13, v2

    goto :goto_0

    .line 104
    :cond_0
    move-object v13, v2

    .line 108
    .end local v2    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v13, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :goto_0
    invoke-static {v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->setupContinuousContainerIfNeeded(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 110
    const/16 v14, 0x67

    invoke-virtual {v0, v14}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 112
    .local v5, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/16 v2, 0x76

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v15

    .line 113
    .local v15, "nowrapProp":Ljava/lang/Boolean;
    invoke-virtual {v11, v2, v15}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 115
    const/16 v16, 0x0

    .line 116
    .local v16, "notAllKidsAreFloats":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v3

    .line 117
    .local v3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v2, 0x63

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 118
    .local v4, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static {v0, v3, v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateClearHeightCorrection(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v2

    .line 120
    .local v2, "clearHeightCorrection":F
    nop

    .line 121
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v14

    .line 120
    invoke-static {v1, v13, v2, v14}, Lcom/itextpdf/layout/renderer/FloatingHelper;->applyClearance(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;FZ)V

    .line 122
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v14

    invoke-virtual {v0, v14}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v14

    .line 123
    .local v14, "blockWidth":Ljava/lang/Float;
    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 124
    move-object/from16 v65, v14

    move v14, v2

    move-object/from16 v2, v65

    .local v2, "blockWidth":Ljava/lang/Float;
    .local v14, "clearHeightCorrection":F
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustFloatedBlockLayoutBox(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Ljava/lang/Float;

    move-result-object v2

    .line 126
    move-object/from16 v18, v4

    move-object v4, v5

    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v4, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v18, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v5

    goto :goto_1

    .line 123
    .end local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v2, "clearHeightCorrection":F
    .local v4, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v14, "blockWidth":Ljava/lang/Float;
    :cond_1
    move-object/from16 v18, v14

    move v14, v2

    move-object/from16 v2, v18

    move-object/from16 v18, v4

    move-object v4, v5

    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v2, "blockWidth":Ljava/lang/Float;
    .local v4, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v14, "clearHeightCorrection":F
    .restart local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    move-object v5, v3

    .line 129
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v5, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :goto_1
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 130
    const/4 v9, 0x1

    .line 131
    const/4 v11, 0x0

    .line 134
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isPositioned()Z

    move-result v19

    .line 135
    .local v19, "isPositioned":Z
    const/16 v3, 0x37

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v20

    .line 137
    .local v20, "rotation":Ljava/lang/Float;
    move-object v3, v2

    .end local v2    # "blockWidth":Ljava/lang/Float;
    .local v3, "blockWidth":Ljava/lang/Float;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v2

    .line 139
    .local v2, "blockMaxHeight":Ljava/lang/Float;
    move/from16 v21, v9

    .end local v9    # "anythingPlaced":Z
    .local v21, "anythingPlaced":Z
    const/16 v9, 0x68

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v22

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v23

    cmpl-float v22, v22, v23

    if-lez v22, :cond_4

    :cond_3
    if-nez v6, :cond_4

    sget-object v22, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    goto :goto_2

    .line 142
    :cond_4
    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    :goto_2
    nop

    .line 144
    .local v22, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    if-nez v20, :cond_6

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isFixedLayout()Z

    move-result v23

    if-eqz v23, :cond_5

    goto :goto_3

    :cond_5
    move-object/from16 v25, v2

    goto :goto_4

    .line 145
    :cond_6
    :goto_3
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v23

    const v9, 0x49742400    # 1000000.0f

    move-object/from16 v25, v2

    .end local v2    # "blockMaxHeight":Ljava/lang/Float;
    .local v25, "blockMaxHeight":Ljava/lang/Float;
    sub-float v2, v9, v23

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 147
    :goto_4
    if-eqz v20, :cond_7

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 148
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-static {v2, v0}, Lcom/itextpdf/layout/renderer/RotationUtils;->retrieveRotatedLayoutWidth(FLcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v2

    move-object v9, v2

    .end local v3    # "blockWidth":Ljava/lang/Float;
    .local v2, "blockWidth":Ljava/lang/Float;
    goto :goto_5

    .line 151
    .end local v2    # "blockWidth":Ljava/lang/Float;
    .restart local v3    # "blockWidth":Ljava/lang/Float;
    :cond_7
    move-object v9, v3

    .end local v3    # "blockWidth":Ljava/lang/Float;
    .local v9, "blockWidth":Ljava/lang/Float;
    :goto_5
    if-eqz v12, :cond_8

    .line 152
    invoke-virtual {v13, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 154
    :cond_8
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v2

    .line 155
    .local v2, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 157
    .local v3, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v23

    .line 159
    .local v23, "parentWidth":F
    move/from16 v26, v10

    .end local v10    # "firstLineInBox":Z
    .local v26, "firstLineInBox":Z
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v10}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 160
    invoke-virtual {v0, v1, v2, v10}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 161
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isFixedLayout()Z

    move-result v27

    if-eqz v27, :cond_9

    .line 162
    const/16 v10, 0x22

    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-virtual {v1, v10}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 164
    :cond_9
    const/4 v10, 0x0

    invoke-virtual {v0, v1, v3, v10}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 165
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v10

    sub-float v10, v23, v10

    .line 166
    .local v10, "additionalWidth":F
    invoke-virtual {v0, v1, v9, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyWidth(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)V

    .line 167
    move-object/from16 v28, v4

    .end local v4    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v28, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/4 v4, 0x0

    move-object/from16 v65, v13

    move-object v13, v2

    move-object/from16 v2, v25

    move-object/from16 v25, v15

    move-object/from16 v15, v28

    move/from16 v28, v7

    move-object v7, v5

    move v5, v6

    move-object/from16 v6, v22

    move-object/from16 v22, v9

    move-object v9, v3

    move-object/from16 v3, v65

    .local v2, "blockMaxHeight":Ljava/lang/Float;
    .local v3, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v5, "wasParentsHeightClipped":Z
    .local v6, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v7, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v9, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v13, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v15, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v22, "blockWidth":Ljava/lang/Float;
    .local v25, "nowrapProp":Ljava/lang/Boolean;
    .local v28, "wasHeightClipped":Z
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyMaxHeight(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;ZZLcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v28

    .line 169
    move-object/from16 v30, v2

    move-object v2, v3

    move/from16 v29, v5

    move-object v3, v6

    .end local v5    # "wasParentsHeightClipped":Z
    .end local v6    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v2, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v3, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v29, "wasParentsHeightClipped":Z
    .local v30, "blockMaxHeight":Ljava/lang/Float;
    new-instance v4, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v4, v10}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(F)V

    .line 170
    .local v4, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    new-instance v5, Lcom/itextpdf/layout/renderer/MaxMaxWidthHandler;

    invoke-direct {v5, v4}, Lcom/itextpdf/layout/renderer/MaxMaxWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    .line 173
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    if-eqz v19, :cond_a

    .line 174
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .local v6, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    goto :goto_6

    .line 176
    .end local v6    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_a
    new-instance v6, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-direct {v6, v8, v1}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->initElementAreas(Lcom/itextpdf/layout/layout/LayoutArea;)Ljava/util/List;

    move-result-object v6

    .line 179
    .restart local v6    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :goto_6
    move-object/from16 v31, v1

    .end local v1    # "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v31, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    move-object/from16 v32, v4

    .end local v4    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v32, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    move/from16 v33, v10

    .end local v10    # "additionalWidth":F
    .local v33, "additionalWidth":F
    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v10

    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v34

    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v35

    move/from16 v36, v12

    .end local v12    # "marginsCollapsingEnabled":Z
    .local v36, "marginsCollapsingEnabled":Z
    add-float v12, v34, v35

    move/from16 v34, v14

    .end local v14    # "clearHeightCorrection":F
    .local v34, "clearHeightCorrection":F
    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v14

    move-object/from16 v35, v13

    .end local v13    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v35, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v13, 0x0

    invoke-direct {v4, v10, v12, v14, v13}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v1, v8, v4}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 180
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->shrinkOccupiedAreaForAbsolutePosition()V

    .line 182
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 184
    const/4 v1, 0x0

    .line 185
    .local v1, "currentAreaPos":I
    const/4 v10, 0x0

    invoke-interface {v6, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 186
    .local v4, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    .line 187
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 188
    .local v12, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    if-nez v16, :cond_c

    invoke-static {v12}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v37

    if-nez v37, :cond_b

    goto :goto_8

    :cond_b
    const/4 v14, 0x0

    goto :goto_9

    :cond_c
    :goto_8
    const/4 v14, 0x1

    :goto_9
    move/from16 v16, v14

    .line 189
    invoke-virtual {v11, v12}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 190
    .end local v12    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_7

    .line 192
    :cond_d
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v10

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v12

    add-float/2addr v10, v12

    .line 194
    .local v10, "lastYLine":F
    const/4 v12, 0x0

    .line 195
    .local v12, "previousDescent":F
    const/16 v37, 0x0

    .line 196
    .local v37, "lastLineBottomLeadingIndent":F
    const/16 v38, 0x0

    .line 197
    .local v38, "onlyOverflowedFloatsLeft":Z
    new-instance v39, Ljava/util/ArrayList;

    invoke-direct/range {v39 .. v39}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v40, v39

    .line 198
    .local v40, "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/16 v39, 0x0

    .line 201
    .local v39, "floatOverflowedToNextPageWithNothing":Z
    move/from16 v41, v13

    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 203
    .local v13, "nonChildFloatingRendererAreas":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    if-eqz v36, :cond_e

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-lez v14, :cond_e

    .line 205
    const/4 v14, 0x0

    invoke-virtual {v2, v14, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 207
    :cond_e
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isRendererCreateBfc(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v14

    move/from16 v65, v10

    move v10, v1

    move/from16 v1, v39

    move/from16 v39, v38

    move/from16 v38, v37

    move/from16 v37, v12

    move-object v12, v11

    move/from16 v11, v65

    .line 209
    .local v1, "floatOverflowedToNextPageWithNothing":Z
    .local v10, "currentAreaPos":I
    .local v11, "lastYLine":F
    .local v12, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v14, "includeFloatsInOccupiedArea":Z
    .local v37, "previousDescent":F
    .local v38, "lastLineBottomLeadingIndent":F
    .local v39, "onlyOverflowedFloatsLeft":Z
    :goto_a
    move/from16 v43, v10

    .end local v10    # "currentAreaPos":I
    .local v43, "currentAreaPos":I
    if-eqz v12, :cond_47

    .line 210
    const/16 v10, 0x43

    move-object/from16 v46, v2

    .end local v2    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v46, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v12, v10, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 211
    const/16 v2, 0x45

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v12, v2, v10}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 213
    if-eqz v21, :cond_f

    move/from16 v2, v41

    goto :goto_b

    :cond_f
    const/16 v2, 0x12

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 214
    .local v2, "lineIndent":F
    :goto_b
    new-instance v10, Lcom/itextpdf/kernel/geom/Rectangle;

    move-object/from16 v47, v6

    .end local v6    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v47, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    move/from16 v48, v11

    .end local v11    # "lastYLine":F
    .local v48, "lastYLine":F
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v11

    move/from16 v49, v14

    .end local v14    # "includeFloatsInOccupiedArea":Z
    .local v49, "includeFloatsInOccupiedArea":Z
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v14

    move-object/from16 v50, v9

    .end local v9    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v50, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    invoke-direct {v10, v6, v11, v14, v9}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 215
    .local v10, "childLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/16 v9, 0x67

    invoke-virtual {v12, v9, v15}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 216
    const/16 v6, 0x68

    invoke-virtual {v12, v6, v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 218
    new-instance v6, Lcom/itextpdf/layout/layout/LineLayoutContext;

    new-instance v11, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-direct {v11, v8, v10}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v28, :cond_11

    if-eqz v29, :cond_10

    goto :goto_c

    :cond_10
    const/4 v14, 0x0

    goto :goto_d

    :cond_11
    :goto_c
    const/4 v14, 0x1

    :goto_d
    const/4 v9, 0x0

    invoke-direct {v6, v11, v9, v7, v14}, Lcom/itextpdf/layout/layout/LineLayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    .line 220
    invoke-virtual {v6, v2}, Lcom/itextpdf/layout/layout/LineLayoutContext;->setTextIndent(F)Lcom/itextpdf/layout/layout/LineLayoutContext;

    move-result-object v6

    .line 221
    invoke-virtual {v6, v1}, Lcom/itextpdf/layout/layout/LineLayoutContext;->setFloatOverflowedToNextPageWithNothing(Z)Lcom/itextpdf/layout/layout/LineLayoutContext;

    move-result-object v9

    .line 222
    .local v9, "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    invoke-virtual {v12, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-virtual {v6, v9}, Lcom/itextpdf/layout/renderer/LineRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/layout/LineLayoutResult;

    .line 223
    .local v6, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    const/4 v11, 0x0

    .line 225
    .local v11, "isLastLineReLaidOut":Z
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getStatus()I

    move-result v14

    move/from16 v51, v1

    .end local v1    # "floatOverflowedToNextPageWithNothing":Z
    .local v51, "floatOverflowedToNextPageWithNothing":Z
    const/4 v1, 0x3

    if-ne v14, v1, :cond_17

    .line 228
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 229
    const/16 v14, 0x68

    invoke-virtual {v12, v14}, Lcom/itextpdf/layout/renderer/LineRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 231
    .local v1, "previousOverflowProperty":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    move/from16 v24, v2

    .end local v2    # "lineIndent":F
    .local v24, "lineIndent":F
    sget-object v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->VISIBLE:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {v12, v14, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 232
    const/4 v2, 0x1

    invoke-virtual {v9, v2}, Lcom/itextpdf/layout/layout/LineLayoutContext;->setClippedHeight(Z)V

    .line 233
    invoke-virtual {v12, v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-virtual {v2, v9}, Lcom/itextpdf/layout/renderer/LineRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/itextpdf/layout/layout/LineLayoutResult;

    .line 235
    invoke-virtual {v12, v14, v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 236
    const/4 v11, 0x1

    goto :goto_e

    .line 228
    .end local v1    # "previousOverflowProperty":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v24    # "lineIndent":F
    .restart local v2    # "lineIndent":F
    :cond_12
    move/from16 v24, v2

    const/16 v14, 0x68

    .line 239
    .end local v2    # "lineIndent":F
    .restart local v24    # "lineIndent":F
    :goto_e
    invoke-static {v7, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateLineShiftUnderFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/lang/Float;

    move-result-object v1

    .line 240
    .local v1, "lineShiftUnderFloats":Ljava/lang/Float;
    if-eqz v1, :cond_13

    .line 241
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 242
    const/16 v26, 0x1

    .line 243
    move/from16 v10, v43

    move-object/from16 v2, v46

    move-object/from16 v6, v47

    move/from16 v11, v48

    move/from16 v14, v49

    move-object/from16 v9, v50

    move/from16 v1, v51

    goto/16 :goto_a

    .line 246
    :cond_13
    iget-object v2, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/16 v42, 0x1

    xor-int/lit8 v2, v2, 0x1

    .line 247
    .local v2, "allRemainingKidsAreFloats":Z
    iget-object v14, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_f
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v53

    if-eqz v53, :cond_15

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 248
    .local v53, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v2, :cond_14

    invoke-static/range {v53 .. v53}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v54

    if-eqz v54, :cond_14

    const/16 v54, 0x1

    goto :goto_10

    :cond_14
    const/16 v54, 0x0

    :goto_10
    move/from16 v2, v54

    .line 249
    .end local v53    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_f

    .line 250
    :cond_15
    if-eqz v2, :cond_16

    .line 251
    const/16 v39, 0x1

    move-object v2, v6

    move/from16 v6, v39

    goto :goto_11

    .line 250
    :cond_16
    move-object v2, v6

    move/from16 v6, v39

    goto :goto_11

    .line 225
    .end local v1    # "lineShiftUnderFloats":Ljava/lang/Float;
    .end local v24    # "lineIndent":F
    .local v2, "lineIndent":F
    :cond_17
    move/from16 v24, v2

    .end local v2    # "lineIndent":F
    .restart local v24    # "lineIndent":F
    move-object v2, v6

    move/from16 v6, v39

    .line 255
    .end local v39    # "onlyOverflowedFloatsLeft":Z
    .local v2, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v6, "onlyOverflowedFloatsLeft":Z
    :goto_11
    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LineLayoutContext;->isFloatOverflowedToNextPageWithNothing()Z

    move-result v14

    .line 256
    .end local v51    # "floatOverflowedToNextPageWithNothing":Z
    .local v14, "floatOverflowedToNextPageWithNothing":Z
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getFloatsOverflowedToNextPage()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 257
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getFloatsOverflowedToNextPage()Ljava/util/List;

    move-result-object v1

    move/from16 v53, v8

    move-object/from16 v8, v40

    .end local v40    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v8, "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v53, "pageNumber":I
    invoke-interface {v8, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_12

    .line 256
    .end local v53    # "pageNumber":I
    .local v8, "pageNumber":I
    .restart local v40    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_18
    move/from16 v53, v8

    move-object/from16 v8, v40

    .line 260
    .end local v40    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v8, "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v53    # "pageNumber":I
    :goto_12
    const/4 v1, 0x0

    .line 261
    .local v1, "minChildWidth":F
    const/16 v39, 0x0

    .line 262
    .local v39, "maxChildWidth":F
    move/from16 v40, v1

    .end local v1    # "minChildWidth":F
    .local v40, "minChildWidth":F
    instance-of v1, v2, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    if-eqz v1, :cond_19

    .line 263
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v1

    .line 264
    .end local v40    # "minChildWidth":F
    .restart local v1    # "minChildWidth":F
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v40

    invoke-virtual/range {v40 .. v40}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v39

    move-object/from16 v40, v9

    move/from16 v9, v39

    goto :goto_13

    .line 262
    .end local v1    # "minChildWidth":F
    .restart local v40    # "minChildWidth":F
    :cond_19
    move/from16 v1, v40

    move-object/from16 v40, v9

    move/from16 v9, v39

    .line 267
    .end local v39    # "maxChildWidth":F
    .restart local v1    # "minChildWidth":F
    .local v9, "maxChildWidth":F
    .local v40, "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    :goto_13
    invoke-virtual {v5, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 268
    invoke-virtual {v5, v9}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 270
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v39

    check-cast v39, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 271
    .local v39, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    if-nez v39, :cond_1a

    move/from16 v51, v1

    .end local v1    # "minChildWidth":F
    .local v51, "minChildWidth":F
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getStatus()I

    move-result v1

    move-object/from16 v54, v2

    const/4 v2, 0x1

    .end local v2    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v54, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    if-ne v1, v2, :cond_1b

    .line 272
    move-object/from16 v39, v12

    goto :goto_14

    .line 271
    .end local v51    # "minChildWidth":F
    .end local v54    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .restart local v1    # "minChildWidth":F
    .restart local v2    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :cond_1a
    move/from16 v51, v1

    move-object/from16 v54, v2

    .line 275
    .end local v1    # "minChildWidth":F
    .end local v2    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .restart local v51    # "minChildWidth":F
    .restart local v54    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    :cond_1b
    :goto_14
    if-eqz v6, :cond_1c

    .line 279
    const/16 v39, 0x0

    .line 282
    :cond_1c
    const/16 v1, 0x46

    sget-object v2, Lcom/itextpdf/layout/properties/TextAlignment;->LEFT:Lcom/itextpdf/layout/properties/TextAlignment;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/TextAlignment;

    .line 283
    .local v1, "textAlignment":Lcom/itextpdf/layout/properties/TextAlignment;
    move-object/from16 v2, v54

    move-object/from16 v54, v47

    move-object/from16 v47, v5

    move-object v5, v7

    move/from16 v7, v24

    move/from16 v24, v9

    move-object/from16 v9, v46

    move-object/from16 v46, v10

    move-object/from16 v10, v32

    move-object/from16 v32, v3

    move-object/from16 v3, v39

    .end local v39    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v2    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v3, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v5, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v7, "lineIndent":F
    .local v9, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v10, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v24, "maxChildWidth":F
    .local v32, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v46, "childLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v47, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v54, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyTextAlignment(Lcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/layout/LineLayoutResult;Lcom/itextpdf/layout/renderer/LineRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;ZF)V

    .line 285
    move-object/from16 v56, v1

    move-object/from16 v55, v2

    move-object v1, v3

    move/from16 v57, v6

    move/from16 v39, v7

    move-object v6, v4

    move-object v7, v5

    .end local v2    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .end local v3    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v4    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v1, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v6, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v7, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v39, "lineIndent":F
    .local v55, "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .local v56, "textAlignment":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v57, "onlyOverflowedFloatsLeft":Z
    sget-object v2, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    .line 286
    const/16 v3, 0x7b

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v2, 0x0

    goto :goto_15

    .line 287
    :cond_1d
    const/16 v2, 0x21

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/Leading;

    :goto_15
    nop

    .line 289
    .local v2, "leading":Lcom/itextpdf/layout/properties/Leading;
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    cmpl-float v3, v3, v41

    if-lez v3, :cond_1e

    const/4 v3, 0x1

    goto :goto_16

    :cond_1e
    const/4 v3, 0x0

    :goto_16
    move/from16 v58, v3

    .line 290
    .local v58, "lineHasContent":Z
    if-eqz v1, :cond_1f

    const/4 v3, 0x1

    goto :goto_17

    :cond_1f
    const/4 v3, 0x0

    .line 291
    .local v3, "isFit":Z
    :goto_17
    const/4 v4, 0x0

    .line 292
    .local v4, "deltaY":F
    if-eqz v3, :cond_2b

    sget-object v5, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    move/from16 v59, v3

    const/16 v3, 0x7b

    .end local v3    # "isFit":Z
    .local v59, "isFit":Z
    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 293
    if-eqz v58, :cond_23

    .line 294
    sub-float v3, v37, v38

    if-eqz v2, :cond_20

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getTopLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F

    move-result v5

    goto :goto_18

    :cond_20
    move/from16 v5, v41

    :goto_18
    sub-float/2addr v3, v5

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getMaxAscent()F

    move-result v5

    sub-float/2addr v3, v5

    .line 295
    .local v3, "indentFromLastLine":F
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->containsImage()Z

    move-result v5

    if-eqz v5, :cond_21

    .line 296
    add-float v3, v3, v37

    .line 298
    :cond_21
    add-float v5, v48, v3

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getYLine()F

    move-result v45

    sub-float v4, v5, v45

    .line 299
    if-eqz v2, :cond_22

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getBottomLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F

    move-result v5

    goto :goto_19

    :cond_22
    move/from16 v5, v41

    :goto_19
    move/from16 v38, v5

    .line 300
    cmpg-float v5, v38, v41

    if-gez v5, :cond_23

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->containsImage()Z

    move-result v5

    if-eqz v5, :cond_23

    .line 301
    const/16 v38, 0x0

    .line 306
    .end local v3    # "indentFromLastLine":F
    :cond_23
    if-eqz v26, :cond_25

    .line 307
    if-eqz v1, :cond_24

    if-eqz v2, :cond_24

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getTopLeadingIndent(Lcom/itextpdf/layout/properties/Leading;)F

    move-result v3

    neg-float v3, v3

    goto :goto_1a

    :cond_24
    move/from16 v3, v41

    :goto_1a
    move v4, v3

    .line 310
    :cond_25
    if-eqz v11, :cond_28

    .line 311
    if-eqz v2, :cond_27

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    add-float/2addr v3, v4

    sub-float v3, v3, v38

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_26

    goto :goto_1b

    :cond_26
    const/4 v3, 0x0

    goto :goto_1c

    :cond_27
    :goto_1b
    const/4 v3, 0x1

    :goto_1c
    move/from16 v59, v3

    .end local v59    # "isFit":Z
    .local v3, "isFit":Z
    goto :goto_1f

    .line 313
    .end local v3    # "isFit":Z
    .restart local v59    # "isFit":Z
    :cond_28
    if-eqz v2, :cond_2a

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    add-float/2addr v3, v4

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    cmpl-float v3, v3, v5

    if-ltz v3, :cond_29

    goto :goto_1d

    :cond_29
    const/4 v3, 0x0

    goto :goto_1e

    :cond_2a
    :goto_1d
    const/4 v3, 0x1

    :goto_1e
    move/from16 v59, v3

    .end local v59    # "isFit":Z
    .restart local v3    # "isFit":Z
    goto :goto_1f

    .line 292
    :cond_2b
    move/from16 v59, v3

    .line 317
    .end local v3    # "isFit":Z
    .restart local v59    # "isFit":Z
    :cond_2c
    :goto_1f
    if-nez v59, :cond_43

    if-eqz v1, :cond_2e

    invoke-static/range {v32 .. v32}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v5

    if-eqz v5, :cond_2d

    goto :goto_20

    :cond_2d
    move-object/from16 v61, v2

    move-object/from16 v63, v8

    move/from16 v60, v11

    move/from16 v62, v14

    move-object/from16 v64, v32

    move/from16 v8, v36

    const/4 v3, 0x0

    const/4 v5, 0x2

    move-object v11, v1

    move v14, v4

    move-object/from16 v36, v12

    move/from16 v12, v34

    goto/16 :goto_29

    .line 318
    :cond_2e
    :goto_20
    add-int/lit8 v5, v43, 0x1

    invoke-interface/range {v54 .. v54}, Ljava/util/List;->size()I

    move-result v3

    if-ge v5, v3, :cond_2f

    .line 319
    add-int/lit8 v3, v43, 0x1

    move-object/from16 v5, v54

    .end local v43    # "currentAreaPos":I
    .end local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v3, "currentAreaPos":I
    .local v5, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v43

    check-cast v43, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 320
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v43

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v44

    add-float v43, v43, v44

    .line 321
    .end local v48    # "lastYLine":F
    .local v43, "lastYLine":F
    const/16 v26, 0x1

    move-object v4, v6

    move-object/from16 v63, v8

    move/from16 v62, v14

    move/from16 v1, v26

    move-object/from16 v64, v32

    move/from16 v8, v36

    move/from16 v11, v43

    move/from16 v39, v57

    const/16 v27, 0x0

    move/from16 v43, v3

    move-object/from16 v26, v12

    move/from16 v12, v34

    const/4 v3, 0x0

    goto/16 :goto_2b

    .line 323
    .end local v3    # "currentAreaPos":I
    .end local v5    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v43, "currentAreaPos":I
    .restart local v48    # "lastYLine":F
    .restart local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_2f
    move-object/from16 v5, v54

    .end local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v5    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v17

    .line 324
    .local v17, "keepTogether":Z
    if-eqz v17, :cond_30

    .line 325
    invoke-interface {v7, v13}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 328
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-object v3, v2

    .end local v2    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .local v3, "leading":Lcom/itextpdf/layout/properties/Leading;
    const/4 v2, 0x0

    move-object/from16 v27, v3

    .end local v3    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .local v27, "leading":Lcom/itextpdf/layout/properties/Leading;
    const/4 v3, 0x0

    move-object/from16 v41, v1

    .end local v1    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v41, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    const/4 v1, 0x3

    move-object/from16 v54, v5

    .end local v5    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    move-object/from16 v5, p0

    move/from16 v60, v11

    move/from16 v62, v14

    move-object/from16 v61, v27

    move-object/from16 v11, v41

    move v14, v4

    move-object/from16 v4, p0

    .end local v4    # "deltaY":F
    .end local v27    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .end local v41    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v11, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v14, "deltaY":F
    .local v60, "isLastLineReLaidOut":Z
    .local v61, "leading":Lcom/itextpdf/layout/properties/Leading;
    .local v62, "floatOverflowedToNextPageWithNothing":Z
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 330
    .end local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v60    # "isLastLineReLaidOut":Z
    .end local v61    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .end local v62    # "floatOverflowedToNextPageWithNothing":Z
    .restart local v1    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v2    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .restart local v4    # "deltaY":F
    .restart local v5    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v11, "isLastLineReLaidOut":Z
    .local v14, "floatOverflowedToNextPageWithNothing":Z
    :cond_30
    move-object/from16 v61, v2

    move-object/from16 v54, v5

    move/from16 v60, v11

    move/from16 v62, v14

    move-object v11, v1

    move v14, v4

    .end local v1    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v2    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .end local v4    # "deltaY":F
    .end local v5    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v11, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v14, "deltaY":F
    .restart local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v60    # "isLastLineReLaidOut":Z
    .restart local v61    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .restart local v62    # "floatOverflowedToNextPageWithNothing":Z
    if-eqz v36, :cond_31

    .line 331
    if-eqz v21, :cond_31

    if-eqz v16, :cond_31

    .line 332
    invoke-virtual {v9, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 337
    :cond_31
    if-eqz v57, :cond_33

    if-eqz v49, :cond_32

    goto :goto_21

    :cond_32
    const/4 v5, 0x0

    goto :goto_22

    :cond_33
    :goto_21
    const/4 v5, 0x1

    .line 338
    .local v5, "includeFloatsInOccupiedAreaOnSplit":Z
    :goto_22
    if-eqz v5, :cond_34

    .line 339
    invoke-static {v7, v0, v13}, Lcom/itextpdf/layout/renderer/FloatingHelper;->includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/Set;)V

    .line 340
    invoke-virtual {v0, v15, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 343
    :cond_34
    if-eqz v36, :cond_35

    .line 344
    invoke-virtual {v9, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 347
    :cond_35
    const/4 v1, 0x0

    .line 348
    .local v1, "minHeightOverflowed":Z
    if-nez v5, :cond_37

    .line 349
    move-object/from16 v2, v32

    .end local v32    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v2, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual {v0, v2, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyMinHeight(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v3

    .line 350
    .local v3, "minHeightOverflow":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    if-eqz v3, :cond_36

    const/4 v4, 0x1

    goto :goto_23

    :cond_36
    const/4 v4, 0x0

    :goto_23
    move v1, v4

    .line 351
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyVerticalAlignment()V

    move/from16 v32, v1

    goto :goto_24

    .line 348
    .end local v2    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v3    # "minHeightOverflow":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v32    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_37
    move-object/from16 v2, v32

    .end local v32    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v2    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    move/from16 v32, v1

    .line 354
    .end local v1    # "minHeightOverflowed":Z
    .local v32, "minHeightOverflowed":Z
    :goto_24
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->split()[Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v41

    .line 355
    .local v41, "split":[Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    const/16 v27, 0x0

    aget-object v1, v41, v27

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    iput-object v3, v1, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    .line 356
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 357
    .local v3, "line":Lcom/itextpdf/layout/renderer/LineRenderer;
    const/16 v27, 0x0

    aget-object v4, v41, v27

    iget-object v4, v4, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    move-object/from16 v52, v1

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 358
    .end local v3    # "line":Lcom/itextpdf/layout/renderer/LineRenderer;
    move-object/from16 v1, v52

    goto :goto_25

    .line 359
    :cond_38
    const/16 v42, 0x1

    aget-object v1, v41, v42

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 360
    if-eqz v11, :cond_39

    .line 361
    aget-object v1, v41, v42

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 363
    :cond_39
    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_3a

    .line 364
    aget-object v1, v41, v42

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 367
    :cond_3a
    if-eqz v57, :cond_3b

    if-nez v49, :cond_3b

    if-nez v32, :cond_3b

    .line 368
    const/16 v42, 0x1

    aget-object v1, v41, v42

    invoke-static {v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->removeParentArtifactsOnPageSplitIfOnlyFloatsOverflow(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 372
    :cond_3b
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 373
    .local v1, "usedHeight":F
    if-nez v5, :cond_3c

    .line 374
    const/4 v3, 0x2

    new-array v4, v3, [Lcom/itextpdf/kernel/geom/Rectangle;

    const/16 v27, 0x0

    aput-object v6, v4, v27

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    move-object/from16 v63, v8

    const/4 v8, 0x1

    .end local v8    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v63, "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    aput-object v3, v4, v8

    invoke-static {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 375
    .local v3, "commonRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    goto :goto_26

    .line 373
    .end local v3    # "commonRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v63    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v8    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_3c
    move-object/from16 v63, v8

    const/4 v8, 0x1

    .line 378
    .end local v8    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v63    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_26
    aget-object v4, v41, v8

    move-object/from16 v3, p0

    move-object/from16 v64, v2

    move/from16 v2, v28

    .end local v28    # "wasHeightClipped":Z
    .local v2, "wasHeightClipped":Z
    .local v64, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->updateHeightsOnSplit(FZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;Z)V

    .line 379
    move/from16 v52, v1

    move/from16 v45, v5

    .end local v1    # "usedHeight":F
    .end local v2    # "wasHeightClipped":Z
    .end local v5    # "includeFloatsInOccupiedAreaOnSplit":Z
    .restart local v28    # "wasHeightClipped":Z
    .local v45, "includeFloatsInOccupiedAreaOnSplit":Z
    .local v52, "usedHeight":F
    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 380
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v2, v50

    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v2, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0, v1, v2, v8}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 381
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v3, v35

    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v3, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0, v1, v3, v8}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 382
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v8}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 384
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V

    .line 386
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    move/from16 v5, v34

    move/from16 v8, v36

    .end local v34    # "clearHeightCorrection":F
    .end local v36    # "marginsCollapsingEnabled":Z
    .local v5, "clearHeightCorrection":F
    .local v8, "marginsCollapsingEnabled":Z
    invoke-static {v0, v1, v4, v5, v8}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    .line 387
    .local v1, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    if-eqz v28, :cond_3d

    .line 388
    new-instance v4, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-object/from16 v50, v2

    const/16 v27, 0x0

    .end local v2    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    aget-object v2, v41, v27

    move-object/from16 v35, v3

    move/from16 v34, v5

    const/4 v3, 0x0

    const/4 v5, 0x1

    .end local v3    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v5    # "clearHeightCorrection":F
    .restart local v34    # "clearHeightCorrection":F
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-direct {v4, v5, v1, v2, v3}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    invoke-virtual {v4, v10}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v2

    return-object v2

    .line 389
    .end local v34    # "clearHeightCorrection":F
    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v2    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v3    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v5    # "clearHeightCorrection":F
    :cond_3d
    move-object/from16 v50, v2

    move-object/from16 v35, v3

    move/from16 v34, v5

    const/4 v5, 0x1

    const/16 v27, 0x0

    .end local v2    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v5    # "clearHeightCorrection":F
    .restart local v34    # "clearHeightCorrection":F
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v21, :cond_3e

    .line 390
    new-instance v2, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    aget-object v3, v41, v27

    aget-object v4, v41, v5

    const/4 v5, 0x2

    invoke-direct {v2, v5, v1, v3, v4}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    invoke-virtual {v2, v10}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v2

    return-object v2

    .line 392
    :cond_3e
    const/4 v5, 0x2

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v3, 0x1a

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 393
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    new-array v3, v5, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    const/16 v27, 0x0

    aput-object v4, v3, v27

    invoke-virtual {v12}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    const/16 v42, 0x1

    aput-object v4, v3, v42

    invoke-static {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 394
    invoke-virtual {v0, v15, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 395
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v3, 0x19

    invoke-static/range {v42 .. v42}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 396
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 398
    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getStatus()I

    move-result v2

    if-ne v5, v2, :cond_40

    .line 399
    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 400
    .local v2, "childNotRendered":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v3, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 401
    .local v3, "firstNotRendered":I
    iget-object v4, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    iget-object v5, v12, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {v5, v0, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 403
    invoke-virtual {v12}, Lcom/itextpdf/layout/renderer/LineRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_27
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 404
    .local v4, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v4, v12}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 405
    .end local v4    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_27

    .line 406
    :cond_3f
    const/16 v42, 0x1

    aget-object v0, v41, v42

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    aget-object v4, v41, v42

    iget-object v4, v4, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 407
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    aget-object v4, v41, v42

    const/4 v5, 0x0

    move-object/from16 v27, v2

    move-object v2, v1

    .end local v1    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v2, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v27, "childNotRendered":Lcom/itextpdf/layout/renderer/IRenderer;
    const/4 v1, 0x2

    move-object/from16 v36, v12

    move/from16 v12, v34

    move/from16 v34, v3

    move-object/from16 v3, p0

    .end local v3    # "firstNotRendered":I
    .local v12, "clearHeightCorrection":F
    .local v34, "firstNotRendered":I
    .local v36, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v0

    return-object v0

    .line 409
    .end local v2    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v27    # "childNotRendered":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v36    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v1    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v12, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v34, "clearHeightCorrection":F
    :cond_40
    move-object v2, v1

    .end local v1    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v2    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v1, 0x1

    move-object/from16 v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v27, v2

    .end local v2    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v27, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v0

    return-object v0

    .line 412
    .end local v27    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v1    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_41
    move-object/from16 v27, v1

    move-object/from16 v36, v12

    move/from16 v12, v34

    .end local v1    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v34    # "clearHeightCorrection":F
    .local v12, "clearHeightCorrection":F
    .restart local v27    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v36    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-interface {v7, v13}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 413
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-nez v1, :cond_42

    move-object/from16 v5, p0

    goto :goto_28

    :cond_42
    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    move-object v5, v1

    :goto_28
    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 317
    .end local v17    # "keepTogether":Z
    .end local v27    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v41    # "split":[Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .end local v45    # "includeFloatsInOccupiedAreaOnSplit":Z
    .end local v52    # "usedHeight":F
    .end local v60    # "isLastLineReLaidOut":Z
    .end local v61    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .end local v62    # "floatOverflowedToNextPageWithNothing":Z
    .end local v63    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v1, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v2, "leading":Lcom/itextpdf/layout/properties/Leading;
    .local v4, "deltaY":F
    .local v8, "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v11, "isLastLineReLaidOut":Z
    .local v12, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v14, "floatOverflowedToNextPageWithNothing":Z
    .local v32, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v34    # "clearHeightCorrection":F
    .local v36, "marginsCollapsingEnabled":Z
    :cond_43
    move-object/from16 v61, v2

    move-object/from16 v63, v8

    move/from16 v60, v11

    move/from16 v62, v14

    move-object/from16 v64, v32

    move/from16 v8, v36

    const/4 v3, 0x0

    const/4 v5, 0x2

    move-object v11, v1

    move v14, v4

    move-object/from16 v36, v12

    move/from16 v12, v34

    .line 419
    .end local v1    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v2    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .end local v4    # "deltaY":F
    .end local v32    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v34    # "clearHeightCorrection":F
    .local v8, "marginsCollapsingEnabled":Z
    .local v11, "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v12, "clearHeightCorrection":F
    .local v14, "deltaY":F
    .local v36, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v60    # "isLastLineReLaidOut":Z
    .restart local v61    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .restart local v62    # "floatOverflowedToNextPageWithNothing":Z
    .restart local v63    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :goto_29
    if-eqz v61, :cond_44

    .line 420
    invoke-virtual {v11, v14}, Lcom/itextpdf/layout/renderer/LineRenderer;->applyLeading(F)V

    .line 421
    if-eqz v58, :cond_44

    .line 422
    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->getYLine()F

    move-result v1

    move/from16 v48, v1

    .line 425
    :cond_44
    if-eqz v58, :cond_45

    .line 426
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    new-array v2, v5, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    const/16 v27, 0x0

    aput-object v4, v2, v27

    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    const/16 v42, 0x1

    aput-object v4, v2, v42

    invoke-static {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 427
    invoke-virtual {v0, v15, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_2a

    .line 425
    :cond_45
    const/16 v27, 0x0

    .line 429
    :goto_2a
    const/4 v1, 0x0

    .line 431
    .end local v26    # "firstLineInBox":Z
    .local v1, "firstLineInBox":Z
    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    sub-float/2addr v2, v4

    invoke-virtual {v6, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 432
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v2, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 434
    const/4 v2, 0x1

    .line 436
    .end local v21    # "anythingPlaced":Z
    .local v2, "anythingPlaced":Z
    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 437
    .end local v36    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v4, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/LineRenderer;->getMaxDescent()F

    move-result v5

    .line 439
    .end local v37    # "previousDescent":F
    .local v5, "previousDescent":F
    invoke-interface/range {v63 .. v63}, Ljava/util/List;->isEmpty()Z

    move-result v21

    if-nez v21, :cond_46

    invoke-virtual/range {v55 .. v55}, Lcom/itextpdf/layout/layout/LineLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v21

    if-nez v21, :cond_46

    .line 440
    const/16 v21, 0x1

    .line 443
    .end local v57    # "onlyOverflowedFloatsLeft":Z
    .local v21, "onlyOverflowedFloatsLeft":Z
    new-instance v26, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-direct/range {v26 .. v26}, Lcom/itextpdf/layout/renderer/LineRenderer;-><init>()V

    move/from16 v37, v5

    move-object v4, v6

    move/from16 v39, v21

    move/from16 v11, v48

    move/from16 v21, v2

    .end local v4    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v26, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    goto :goto_2b

    .line 446
    .end local v11    # "processedRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v14    # "deltaY":F
    .end local v21    # "onlyOverflowedFloatsLeft":Z
    .end local v24    # "maxChildWidth":F
    .end local v26    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v39    # "lineIndent":F
    .end local v40    # "lineLayoutContext":Lcom/itextpdf/layout/layout/LineLayoutContext;
    .end local v46    # "childLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v51    # "minChildWidth":F
    .end local v55    # "result":Lcom/itextpdf/layout/layout/LineLayoutResult;
    .end local v56    # "textAlignment":Lcom/itextpdf/layout/properties/TextAlignment;
    .end local v58    # "lineHasContent":Z
    .end local v59    # "isFit":Z
    .end local v60    # "isLastLineReLaidOut":Z
    .end local v61    # "leading":Lcom/itextpdf/layout/properties/Leading;
    .restart local v4    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v57    # "onlyOverflowedFloatsLeft":Z
    :cond_46
    move/from16 v21, v2

    move-object/from16 v26, v4

    move/from16 v37, v5

    move-object v4, v6

    move/from16 v11, v48

    move/from16 v39, v57

    .end local v2    # "anythingPlaced":Z
    .end local v5    # "previousDescent":F
    .end local v6    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v48    # "lastYLine":F
    .end local v57    # "onlyOverflowedFloatsLeft":Z
    .local v4, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v11, "lastYLine":F
    .local v21, "anythingPlaced":Z
    .restart local v26    # "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v37    # "previousDescent":F
    .local v39, "onlyOverflowedFloatsLeft":Z
    :goto_2b
    move/from16 v36, v8

    move-object v2, v9

    move-object/from16 v32, v10

    move/from16 v34, v12

    move-object/from16 v12, v26

    move/from16 v10, v43

    move-object/from16 v5, v47

    move/from16 v14, v49

    move-object/from16 v9, v50

    move/from16 v8, v53

    move-object/from16 v6, v54

    move-object/from16 v40, v63

    move-object/from16 v3, v64

    move/from16 v26, v1

    move/from16 v1, v62

    goto/16 :goto_a

    .line 447
    .end local v10    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v47    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v49    # "includeFloatsInOccupiedArea":Z
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v53    # "pageNumber":I
    .end local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v62    # "floatOverflowedToNextPageWithNothing":Z
    .end local v63    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v1, "floatOverflowedToNextPageWithNothing":Z
    .local v2, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v3, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v6, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v8, "pageNumber":I
    .local v9, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v12, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v14, "includeFloatsInOccupiedArea":Z
    .local v26, "firstLineInBox":Z
    .local v32, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v34    # "clearHeightCorrection":F
    .local v36, "marginsCollapsingEnabled":Z
    .local v40, "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_47
    move/from16 v51, v1

    move-object/from16 v64, v3

    move-object/from16 v47, v5

    move-object/from16 v54, v6

    move/from16 v53, v8

    move-object/from16 v50, v9

    move/from16 v48, v11

    move/from16 v49, v14

    move-object/from16 v10, v32

    move/from16 v8, v36

    move-object/from16 v63, v40

    move-object v9, v2

    move-object v6, v4

    move-object/from16 v36, v12

    move/from16 v12, v34

    .end local v1    # "floatOverflowedToNextPageWithNothing":Z
    .end local v2    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v3    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v4    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v11    # "lastYLine":F
    .end local v14    # "includeFloatsInOccupiedArea":Z
    .end local v32    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v34    # "clearHeightCorrection":F
    .end local v40    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v6, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v8, "marginsCollapsingEnabled":Z
    .local v9, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v10    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v12, "clearHeightCorrection":F
    .local v36, "currentRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    .restart local v47    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v48    # "lastYLine":F
    .restart local v49    # "includeFloatsInOccupiedArea":Z
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v51, "floatOverflowedToNextPageWithNothing":Z
    .restart local v53    # "pageNumber":I
    .restart local v54    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v63    # "inlineFloatsOverflowedToNextPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    sget-object v1, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    const/16 v3, 0x7b

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_49

    .line 448
    move/from16 v1, v38

    .line 449
    .local v1, "moveDown":F
    invoke-static/range {v64 .. v64}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    if-eqz v2, :cond_48

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    sub-float/2addr v2, v3

    cmpl-float v2, v1, v2

    if-lez v2, :cond_48

    .line 450
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    sub-float v1, v2, v3

    .line 452
    :cond_48
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 453
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    add-float/2addr v3, v1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 456
    .end local v1    # "moveDown":F
    :cond_49
    if-eqz v8, :cond_4a

    .line 457
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_4a

    if-eqz v16, :cond_4a

    .line 458
    invoke-virtual {v9, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 462
    :cond_4a
    if-eqz v49, :cond_4b

    .line 463
    invoke-static {v7, v0, v13}, Lcom/itextpdf/layout/renderer/FloatingHelper;->includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/Set;)V

    .line 464
    invoke-virtual {v0, v15, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 467
    :cond_4b
    if-eqz v28, :cond_4c

    .line 468
    move-object/from16 v11, v64

    .end local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v11, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual {v0, v11, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->fixOccupiedAreaIfOverflowedY(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_2c

    .line 467
    .end local v11    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_4c
    move-object/from16 v11, v64

    .line 471
    .end local v64    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v11    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :goto_2c
    if-eqz v8, :cond_4d

    .line 472
    invoke-virtual {v9, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 475
    :cond_4d
    invoke-virtual {v0, v11, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyMinHeight(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    .line 477
    .local v14, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    if-eqz v14, :cond_4e

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isKeepTogether()Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 478
    invoke-interface {v7, v13}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 479
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object/from16 v5, p0

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 481
    :cond_4e
    const/16 v1, 0x8d

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/ContinuousContainer;

    .line 483
    .local v1, "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    if-eqz v1, :cond_4f

    if-nez v14, :cond_4f

    .line 484
    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->reApplyProperties(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 485
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 486
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v3, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v2

    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v2, "borders":[Lcom/itextpdf/layout/borders/Border;
    goto :goto_2d

    .line 489
    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_4f
    move-object/from16 v2, v35

    move-object/from16 v3, v50

    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :goto_2d
    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 491
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v0, v4, v3, v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 492
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v0, v4, v2, v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 493
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v0, v4, v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 495
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V

    .line 497
    if-eqz v20, :cond_53

    .line 498
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyRotationLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 499
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isNotFittingLayoutArea(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v4

    if-eqz v4, :cond_52

    .line 500
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isNotFittingWidth(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v4

    if-eqz v4, :cond_50

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isNotFittingHeight(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v4

    if-nez v4, :cond_50

    .line 501
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    const-string v5, "It fits by height so it will be forced placed"

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 502
    move-object/from16 v17, v1

    .end local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .local v17, "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    const-string v1, "Element does not fit current area. {0}"

    invoke-static {v1, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    move-object/from16 v35, v2

    move-object/from16 v50, v3

    goto :goto_2e

    .line 500
    .end local v17    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .restart local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    :cond_50
    move-object/from16 v17, v1

    .line 504
    .end local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .restart local v17    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v4, 0x1a

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_51

    .line 505
    invoke-interface {v7, v13}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 506
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-object/from16 v35, v2

    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v2, 0x0

    move-object/from16 v50, v3

    .end local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object/from16 v5, p0

    move-object/from16 v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 504
    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_51
    move-object/from16 v35, v2

    move-object/from16 v50, v3

    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_2e

    .line 499
    .end local v17    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .restart local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_52
    move-object/from16 v17, v1

    move-object/from16 v35, v2

    move-object/from16 v50, v3

    .end local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v17    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_2e

    .line 497
    .end local v17    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .end local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .restart local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_53
    move-object/from16 v17, v1

    move-object/from16 v35, v2

    move-object/from16 v50, v3

    .line 511
    .end local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v17    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    .restart local v35    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v50    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :goto_2e
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->applyVerticalAlignment()V

    .line 513
    invoke-static {v7, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->removeFloatsAboveRendererBottom(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 514
    nop

    .line 515
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 514
    invoke-static {v0, v1, v2, v12, v8}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    .line 518
    .local v2, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-static {v14}, Lcom/itextpdf/layout/properties/ContinuousContainer;->clearPropertiesFromOverFlowRenderer(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 519
    if-nez v14, :cond_54

    .line 520
    new-instance v55, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    const/16 v59, 0x0

    const/16 v60, 0x0

    const/16 v56, 0x1

    const/16 v58, 0x0

    move-object/from16 v57, v2

    .end local v2    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v57, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-direct/range {v55 .. v60}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v1, v55

    .end local v57    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v2    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v1, v10}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v1

    return-object v1

    .line 523
    :cond_54
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    const/4 v1, 0x2

    const/4 v5, 0x0

    move-object/from16 v3, p0

    move-object v4, v14

    .end local v14    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v4, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 524
    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v0

    .line 523
    return-object v0
.end method

.method public drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 582
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 583
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 584
    .local v1, "line":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 585
    .end local v1    # "line":Lcom/itextpdf/layout/renderer/LineRenderer;
    goto :goto_0

    .line 587
    :cond_0
    return-void
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 550
    const/16 v0, 0x2e

    if-eq p1, v0, :cond_0

    const/16 v0, 0x2b

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    if-eqz v0, :cond_1

    .line 551
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    return-object v0

    .line 553
    :cond_1
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getFirstYLineRecursively()Ljava/lang/Float;
    .locals 2

    .line 619
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 622
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;->getFirstYLineRecursively()Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 620
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getLastYLineRecursively()Ljava/lang/Float;
    .locals 3

    .line 627
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->allowLastYLineRecursiveExtraction()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 628
    return-object v1

    .line 630
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 633
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_3

    .line 634
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getLastYLineRecursively()Ljava/lang/Float;

    move-result-object v2

    .line 635
    .local v2, "yLine":Ljava/lang/Float;
    if-eqz v2, :cond_2

    .line 636
    return-object v2

    .line 633
    .end local v2    # "yLine":Ljava/lang/Float;
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 639
    .end local v0    # "i":I
    :cond_3
    return-object v1

    .line 631
    :cond_4
    :goto_1
    return-object v1
.end method

.method public getLines()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            ">;"
        }
    .end annotation

    .line 614
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    return-object v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 11

    .line 674
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>()V

    .line 675
    .local v0, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    const/16 v1, 0x37

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    .line 676
    .local v2, "rotation":Ljava/lang/Float;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->setMinMaxWidthBasedOnFixedWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 677
    const/16 v3, 0x50

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v5

    .line 678
    .local v3, "minWidth":Ljava/lang/Float;
    :goto_0
    const/16 v6, 0x4f

    invoke-virtual {p0, v6}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v4

    goto :goto_1

    :cond_1
    move-object v4, v5

    .line 679
    .local v4, "maxWidth":Ljava/lang/Float;
    :goto_1
    if-eqz v3, :cond_2

    if-nez v4, :cond_4

    .line 680
    :cond_2
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->hasOwnProperty(I)Z

    move-result v6

    .line 681
    .local v6, "restoreRotation":Z
    invoke-virtual {p0, v1, v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->setProperty(ILjava/lang/Object;)V

    .line 682
    new-instance v5, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v7, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v8, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v9

    const v10, 0x49742400    # 1000000.0f

    invoke-direct {v8, v9, v10}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v9, 0x1

    invoke-direct {v7, v9, v8}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v5, v7}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    .line 683
    .local v5, "result":Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;
    if-eqz v6, :cond_3

    .line 684
    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_2

    .line 686
    :cond_3
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->deleteOwnProperty(I)V

    .line 688
    :goto_2
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v0

    .line 690
    .end local v5    # "result":Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;
    .end local v6    # "restoreRotation":Z
    :cond_4
    if-eqz v3, :cond_5

    .line 691
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 693
    :cond_5
    if-eqz v4, :cond_6

    .line 694
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 696
    :cond_6
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v5

    cmpl-float v1, v1, v5

    if-lez v1, :cond_7

    .line 697
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 699
    .end local v3    # "minWidth":Ljava/lang/Float;
    .end local v4    # "maxWidth":Ljava/lang/Float;
    :cond_7
    goto :goto_3

    .line 700
    :cond_8
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->calculateAdditionalWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setAdditionalWidth(F)V

    .line 703
    :goto_3
    if-eqz v2, :cond_9

    invoke-static {v0, p0}, Lcom/itextpdf/layout/renderer/RotationUtils;->countRotationMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;Lcom/itextpdf/layout/renderer/AbstractRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    goto :goto_4

    :cond_9
    move-object v1, v0

    :goto_4
    return-object v1
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 541
    const-class v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 542
    new-instance v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/Paragraph;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;-><init>(Lcom/itextpdf/layout/element/Paragraph;)V

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 4
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 82
    const/16 v0, 0x79

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;

    .line 83
    .local v0, "orphansControl":Lcom/itextpdf/layout/properties/ParagraphOrphansControl;
    const/16 v1, 0x7a

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;

    .line 84
    .local v1, "widowsControl":Lcom/itextpdf/layout/properties/ParagraphWidowsControl;
    if-nez v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->directLayout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v2

    .line 88
    .local v2, "layoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->updateParentLines(Lcom/itextpdf/layout/renderer/ParagraphRenderer;)V

    .line 89
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    invoke-static {v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->updateParentLines(Lcom/itextpdf/layout/renderer/ParagraphRenderer;)V

    .line 90
    return-object v2

    .line 85
    .end local v2    # "layoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_1
    :goto_0
    invoke-static {p0, p1, v0, v1}, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper;->orphansWidowsAwareLayout(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/layout/properties/ParagraphOrphansControl;Lcom/itextpdf/layout/properties/ParagraphWidowsControl;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v2

    return-object v2
.end method

.method public move(FF)V
    .locals 3
    .param p1, "dxRight"    # F
    .param p2, "dyUp"    # F

    .line 594
    const-class v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 595
    .local v0, "logger":Lorg/slf4j/Logger;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-nez v1, :cond_0

    .line 596
    const-string v1, "Moving won\'t be performed."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Occupied area has not been initialized. {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 598
    return-void

    .line 600
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 601
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 602
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 603
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 604
    .local v2, "line":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v2, p1, p2}, Lcom/itextpdf/layout/renderer/LineRenderer;->move(FF)V

    .line 605
    .end local v2    # "line":Lcom/itextpdf/layout/renderer/LineRenderer;
    goto :goto_0

    .line 607
    :cond_1
    return-void
.end method

.method protected split()[Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .locals 3

    .line 707
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->createSplitRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v0

    .line 708
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 709
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isLastRendererForModelElement:Z

    .line 711
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->createOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v1

    .line 713
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 561
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 562
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 563
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 564
    if-lez v1, :cond_0

    .line 565
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->lines:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_1
    goto :goto_2

    .line 570
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 571
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 572
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    .line 574
    :cond_3
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
