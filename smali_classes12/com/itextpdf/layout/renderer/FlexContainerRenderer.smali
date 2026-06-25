.class public Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
.super Lcom/itextpdf/layout/renderer/DivRenderer;
.source "FlexContainerRenderer.java"


# instance fields
.field private flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

.field private final hypotheticalCrossSizes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private lines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexItemInfo;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Div;)V
    .locals 1
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/Div;

    .line 69
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/DivRenderer;-><init>(Lcom/itextpdf/layout/element/Div;)V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->hypotheticalCrossSizes:Ljava/util/Map;

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    .line 70
    return-void
.end method

.method private static addSimulateDiv(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)V
    .locals 2
    .param p0, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "width"    # F

    .line 506
    new-instance v0, Lcom/itextpdf/layout/renderer/DivRenderer;

    new-instance v1, Lcom/itextpdf/layout/element/Div;

    invoke-direct {v1}, Lcom/itextpdf/layout/element/Div;-><init>()V

    .line 507
    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/element/Div;->setMinWidth(F)Lcom/itextpdf/layout/element/IElement;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Div;

    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/element/Div;->setMaxWidth(F)Lcom/itextpdf/layout/element/IElement;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Div;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/DivRenderer;-><init>(Lcom/itextpdf/layout/element/Div;)V

    .line 508
    .local v0, "fakeOverflowRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 509
    return-void
.end method

.method private adjustLayoutResultToHandleOverflowRenderers(Lcom/itextpdf/layout/layout/LayoutResult;Ljava/util/List;)V
    .locals 5
    .param p1, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 698
    .local p2, "renderersToOverflow":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v0, 0x1

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x2

    if-ne v0, v1, :cond_2

    .line 699
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    .line 700
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v1

    .line 701
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 702
    .local v4, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v1, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 703
    .end local v4    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 704
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 705
    .restart local v4    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v0, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 706
    .end local v4    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    .line 708
    :cond_1
    invoke-virtual {p1, v2}, Lcom/itextpdf/layout/layout/LayoutResult;->setStatus(I)V

    .line 709
    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/layout/LayoutResult;->setSplitRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 710
    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/layout/LayoutResult;->setOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 712
    .end local v0    # "splitRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v1    # "overflowRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    if-ne v2, v0, :cond_4

    .line 713
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    .line 714
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 715
    .local v2, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 716
    invoke-interface {v0, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 718
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_3
    goto :goto_2

    .line 720
    .end local v0    # "overflowRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_4
    return-void
.end method

.method private applyWrapReverse()V
    .locals 6

    .line 449
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v0

    if-nez v0, :cond_0

    .line 450
    return-void

    .line 453
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 454
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 455
    .local v0, "reorderedRendererList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 456
    .local v2, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 457
    .local v4, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    .end local v4    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_1

    .line 459
    .end local v2    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_1
    goto :goto_0

    .line 461
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->removeAllChildRenderers(Ljava/util/Collection;)Z

    .line 462
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 463
    return-void
.end method

.method private createMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;
    .locals 3

    .line 650
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 651
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isColumnReverse()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/layout/renderer/BottomToTopFlexItemMainDirector;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/BottomToTopFlexItemMainDirector;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/layout/renderer/TopToBottomFlexItemMainDirector;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TopToBottomFlexItemMainDirector;-><init>()V

    :goto_0
    return-object v0

    .line 655
    :cond_1
    sget-object v0, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    .line 656
    const/4 v1, 0x7

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    .line 657
    .local v0, "isRtlDirection":Z
    :goto_1
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isRowReverse()Z

    move-result v1

    xor-int/2addr v1, v0

    if-eqz v1, :cond_3

    new-instance v1, Lcom/itextpdf/layout/renderer/RtlFlexItemMainDirector;

    invoke-direct {v1}, Lcom/itextpdf/layout/renderer/RtlFlexItemMainDirector;-><init>()V

    goto :goto_2

    :cond_3
    new-instance v1, Lcom/itextpdf/layout/renderer/LtrFlexItemMainDirector;

    invoke-direct {v1}, Lcom/itextpdf/layout/renderer/LtrFlexItemMainDirector;-><init>()V

    :goto_2
    iput-object v1, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    .line 659
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    return-object v1
.end method

.method private fillSplitOverflowRenderersForPartialResult(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutResult;)V
    .locals 12
    .param p1, "splitRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p2, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p4, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p5, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/AbstractRenderer;",
            "Lcom/itextpdf/layout/renderer/AbstractRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexItemInfo;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ")V"
        }
    .end annotation

    .line 514
    .local p3, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    const/4 v0, 0x0

    .line 515
    .local v0, "occupiedSpace":F
    const/4 v1, 0x0

    .line 516
    .local v1, "maxHeightInLine":F
    const/4 v2, 0x0

    .line 517
    .local v2, "metChildRendererInLine":Z
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 519
    .local v4, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    const/16 v6, 0x81

    move-object/from16 v7, p4

    if-ne v5, v7, :cond_3

    .line 520
    const/4 v2, 0x1

    .line 521
    invoke-virtual/range {p5 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 522
    invoke-virtual/range {p5 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 525
    :cond_0
    invoke-virtual/range {p5 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 528
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 529
    invoke-virtual/range {p5 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    sget-object v8, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    invoke-interface {v5, v6, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 531
    :cond_1
    invoke-virtual/range {p5 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 535
    :cond_2
    nop

    .line 536
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    add-float/2addr v5, v6

    .line 535
    invoke-static {v1, v5}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto/16 :goto_3

    .line 537
    :cond_3
    if-eqz v2, :cond_9

    .line 538
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 539
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 540
    goto :goto_0

    .line 548
    :cond_4
    new-instance v5, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    add-float/2addr v8, v0

    .line 549
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v9

    .line 550
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v10

    .line 551
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v11

    sub-float v11, v1, v11

    invoke-direct {v5, v8, v9, v10, v11}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 552
    .local v5, "neighbourBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v8

    new-instance v9, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v10, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 553
    invoke-virtual/range {p5 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v11

    invoke-direct {v10, v11, v5}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v9, v10}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    .line 552
    invoke-virtual {v8, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v8

    .line 555
    .local v8, "neighbourLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_5

    .line 556
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    if-eqz v9, :cond_5

    .line 557
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_1

    .line 558
    :cond_5
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v9

    const/4 v11, 0x1

    if-ne v9, v11, :cond_6

    .line 559
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 564
    :cond_6
    :goto_1
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    if-eqz v9, :cond_8

    .line 565
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v9

    if-ne v9, v10, :cond_7

    .line 567
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    sget-object v10, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->START:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 568
    invoke-interface {v9, v6, v10}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 570
    :cond_7
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    invoke-virtual {p2, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_2

    .line 573
    :cond_8
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    invoke-static {p2, v6}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->addSimulateDiv(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)V

    .line 575
    .end local v5    # "neighbourBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v8    # "neighbourLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_2
    goto :goto_3

    .line 578
    :cond_9
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 581
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    invoke-static {p2, v5}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->addSimulateDiv(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)V

    .line 584
    nop

    .line 585
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    add-float/2addr v5, v6

    .line 584
    invoke-static {v1, v5}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 589
    :goto_3
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v5

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    add-float/2addr v5, v6

    add-float/2addr v0, v5

    .line 590
    .end local v4    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto/16 :goto_0

    .line 591
    :cond_a
    move-object/from16 v7, p4

    return-void
.end method

.method private findFlexItemInfo(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Lcom/itextpdf/layout/renderer/FlexItemInfo;
    .locals 5
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 466
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 467
    .local v1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 468
    .local v3, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 469
    return-object v3

    .line 471
    .end local v3    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    :cond_0
    goto :goto_1

    .line 472
    .end local v1    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_1
    goto :goto_0

    .line 473
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private findLine(Lcom/itextpdf/layout/renderer/IRenderer;)Ljava/util/List;
    .locals 5
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexItemInfo;",
            ">;"
        }
    .end annotation

    .line 477
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 478
    .local v1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 479
    .local v3, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 480
    return-object v1

    .line 482
    .end local v3    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    :cond_0
    goto :goto_1

    .line 483
    .end local v1    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_1
    goto :goto_0

    .line 484
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private findMinMaxWidth(FFLcom/itextpdf/layout/renderer/AbstractWidthHandler;Ljava/util/List;)V
    .locals 6
    .param p1, "initialMinWidth"    # F
    .param p2, "initialMaxWidth"    # F
    .param p3, "minMaxWidthHandler"    # Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Lcom/itextpdf/layout/renderer/AbstractWidthHandler;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 612
    .local p4, "childRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move v0, p2

    .line 613
    .local v0, "maxWidth":F
    move v1, p1

    .line 614
    .local v1, "minWidth":F
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 616
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v3, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 617
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v4, :cond_0

    .line 618
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v4

    .local v4, "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    goto :goto_1

    .line 620
    .end local v4    # "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :cond_0
    invoke-static {v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->countDefaultMinMaxWidth(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v4

    .line 622
    .restart local v4    # "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :goto_1
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 623
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 624
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_2

    .line 626
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v5

    add-float/2addr v0, v5

    .line 627
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v5

    add-float/2addr v1, v5

    .line 629
    .end local v3    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v4    # "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :goto_2
    goto :goto_0

    .line 630
    :cond_2
    invoke-virtual {p3, v0}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 631
    invoke-virtual {p3, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 632
    return-void
.end method

.method private findMinMaxWidthIfCorrespondingPropertiesAreNotSet(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;Lcom/itextpdf/layout/renderer/AbstractWidthHandler;)V
    .locals 8
    .param p1, "minMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .param p2, "minMaxWidthHandler"    # Lcom/itextpdf/layout/renderer/AbstractWidthHandler;

    .line 595
    invoke-virtual {p1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v0

    .line 596
    .local v0, "initialMinWidth":F
    invoke-virtual {p1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v1

    .line 597
    .local v1, "initialMaxWidth":F
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    goto :goto_2

    .line 600
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 601
    .local v3, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 602
    .local v4, "childRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 603
    .local v6, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 604
    .end local v6    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_1

    .line 605
    :cond_1
    invoke-direct {p0, v0, v1, p2, v4}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findMinMaxWidth(FFLcom/itextpdf/layout/renderer/AbstractWidthHandler;Ljava/util/List;)V

    .line 606
    .end local v3    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .end local v4    # "childRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    goto :goto_0

    .line 598
    :cond_2
    :goto_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, v0, v1, p2, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findMinMaxWidth(FFLcom/itextpdf/layout/renderer/AbstractWidthHandler;Ljava/util/List;)V

    .line 608
    :cond_3
    return-void
.end method

.method private isColumnReverse()Z
    .locals 3

    .line 645
    sget-object v0, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;->COLUMN_REVERSE:Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    .line 646
    const/16 v1, 0x8b

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 645
    :goto_0
    return v0
.end method

.method private isRowReverse()Z
    .locals 3

    .line 640
    sget-object v0, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;->ROW_REVERSE:Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    .line 641
    const/16 v1, 0x8b

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 640
    :goto_0
    return v0
.end method

.method static synthetic lambda$createSplitAndOverflowRenderers$0(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/FlexItemInfo;)Z
    .locals 1
    .param p0, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "flexItem"    # Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 225
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private retrieveRenderersToOverflow(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;
    .locals 10
    .param p1, "flexContainerBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation

    .line 664
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 665
    .local v0, "renderersToOverflow":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 666
    .local v1, "layoutContextRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 667
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 668
    invoke-static {p0, v1}, Lcom/itextpdf/layout/renderer/FlexUtil;->getMainSize(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_3

    .line 669
    const/4 v3, 0x0

    .line 670
    .local v3, "commonLineCrossSize":F
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-static {v4}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateColumnDirectionCrossSizes(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 671
    .local v4, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 672
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v3, v6

    .line 673
    if-lez v5, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    cmpl-float v6, v3, v6

    if-lez v6, :cond_2

    .line 674
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 675
    .local v6, "lineRenderersToOverflow":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 676
    .local v8, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v8}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 677
    .end local v8    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_1

    .line 678
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getFlexItemMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    move-result-object v7

    invoke-interface {v7, v6}, Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;->applyDirectionForLine(Ljava/util/List;)V

    .line 679
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 680
    invoke-interface {v0, v2, v6}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    goto :goto_2

    .line 682
    :cond_1
    invoke-interface {v0, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 688
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 689
    .local v8, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v9, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 690
    .end local v8    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_3

    .line 671
    .end local v6    # "lineRenderersToOverflow":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 694
    .end local v3    # "commonLineCrossSize":F
    .end local v4    # "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v5    # "i":I
    :cond_3
    return-object v0
.end method


# virtual methods
.method public addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 2
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 501
    const/16 v0, 0x67

    sget-object v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->VISIBLE:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-interface {p1, v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 502
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/DivRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 503
    return-void
.end method

.method createSplitAndOverflowRenderers(IILcom/itextpdf/layout/layout/LayoutResult;Ljava/util/Map;Ljava/util/List;)[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 20
    .param p1, "childPos"    # I
    .param p2, "layoutStatus"    # I
    .param p3, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)[",
            "Lcom/itextpdf/layout/renderer/AbstractRenderer;"
        }
    .end annotation

    .line 217
    .local p4, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p5, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move-object/from16 v0, p0

    move/from16 v6, p2

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v1

    .line 218
    .local v1, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v2

    .line 220
    .local v2, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    move/from16 v7, p1

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 221
    .local v4, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v8, 0x1a

    invoke-virtual {v0, v8}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 222
    .local v9, "forcedPlacement":Z
    const/4 v3, 0x0

    .line 223
    .local v3, "metChildRenderer":Z
    const/4 v5, 0x0

    move v10, v5

    .local v10, "i":I
    :goto_0
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-ge v10, v5, :cond_e

    .line 224
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 225
    .local v5, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v14

    new-instance v15, Lcom/itextpdf/layout/renderer/FlexContainerRenderer$$ExternalSyntheticLambda0;

    invoke-direct {v15, v4}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer$$ExternalSyntheticLambda0;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;)V

    invoke-interface {v14, v15}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v14

    .line 226
    .local v14, "isSplitLine":Z
    if-nez v3, :cond_1

    if-eqz v14, :cond_0

    goto :goto_1

    :cond_0
    move v15, v13

    goto :goto_2

    :cond_1
    :goto_1
    move v15, v12

    .line 229
    .end local v3    # "metChildRenderer":Z
    .local v15, "metChildRenderer":Z
    :goto_2
    if-eqz v14, :cond_5

    if-nez v9, :cond_5

    if-ne v6, v11, :cond_5

    .line 230
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v3

    if-eqz v3, :cond_4

    if-nez v10, :cond_3

    .line 231
    invoke-interface {v5, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v3

    if-ne v3, v4, :cond_2

    goto :goto_3

    :cond_2
    move-object v3, v5

    goto :goto_4

    .line 230
    :cond_3
    move-object v3, v5

    goto :goto_4

    .line 237
    :cond_4
    :goto_3
    move-object v3, v5

    move-object/from16 v5, p3

    .end local v5    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .local v3, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->fillSplitOverflowRenderersForPartialResult(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 239
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getFlexItemMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    move-result-object v5

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v11

    invoke-interface {v5, v11}, Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;->applyDirectionForLine(Ljava/util/List;)V

    goto/16 :goto_a

    .line 229
    .end local v3    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .restart local v5    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_5
    move-object v3, v5

    .line 241
    .end local v5    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .restart local v3    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :goto_4
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 242
    .local v5, "overflowRendererChildren":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-ne v11, v12, :cond_6

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v11

    if-eqz v11, :cond_6

    move v11, v12

    goto :goto_5

    :cond_6
    move v11, v13

    .line 243
    .local v11, "isSingleColumn":Z
    :goto_5
    const/16 v16, 0x0

    .line 244
    .local v16, "metChildRendererInLine":Z
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_6
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_c

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 245
    .local v18, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    if-nez v16, :cond_8

    move/from16 v19, v12

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v12

    if-ne v12, v4, :cond_7

    goto :goto_7

    :cond_7
    move v12, v13

    goto :goto_8

    :cond_8
    move/from16 v19, v12

    :goto_7
    move/from16 v12, v19

    :goto_8
    move/from16 v16, v12

    .line 246
    if-nez v11, :cond_9

    if-nez v15, :cond_a

    :cond_9
    if-eqz v16, :cond_b

    :cond_a
    if-nez v9, :cond_b

    .line 247
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v12

    invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 249
    :cond_b
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v12

    invoke-virtual {v1, v12}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 251
    .end local v18    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    :goto_9
    move/from16 v12, v19

    goto :goto_6

    .line 252
    :cond_c
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getFlexItemMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    move-result-object v12

    invoke-interface {v12, v5}, Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;->applyDirectionForLine(Ljava/util/List;)V

    .line 256
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v12

    if-eqz v12, :cond_d

    .line 257
    invoke-virtual {v2, v13, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllChildRenderers(ILjava/util/List;)V

    goto :goto_a

    .line 259
    :cond_d
    invoke-virtual {v2, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 223
    .end local v3    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .end local v5    # "overflowRendererChildren":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v11    # "isSingleColumn":Z
    .end local v14    # "isSplitLine":Z
    .end local v16    # "metChildRendererInLine":Z
    :goto_a
    add-int/lit8 v10, v10, 0x1

    move v3, v15

    goto/16 :goto_0

    .end local v15    # "metChildRenderer":Z
    .local v3, "metChildRenderer":Z
    :cond_e
    move/from16 v19, v12

    .line 264
    .end local v10    # "i":I
    invoke-virtual {v2, v8}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    .line 266
    new-array v5, v11, [Lcom/itextpdf/layout/renderer/AbstractRenderer;

    aput-object v1, v5, v13

    aput-object v2, v5, v19

    return-object v5
.end method

.method decreaseLayoutBoxAfterChildPlacement(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p3, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 361
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    invoke-virtual {p0, p1, p3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->decreaseLayoutBoxAfterChildPlacementColumnLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_0

    .line 364
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->decreaseLayoutBoxAfterChildPlacementRowLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 366
    :goto_0
    return-void
.end method

.method decreaseLayoutBoxAfterChildPlacementColumnLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 9
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 394
    move-object v0, p2

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findFlexItemInfo(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Lcom/itextpdf/layout/renderer/FlexItemInfo;

    move-result-object v0

    .line 395
    .local v0, "childFlexItemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 396
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    add-float/2addr v1, v2

    .line 395
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 398
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findLine(Lcom/itextpdf/layout/renderer/IRenderer;)Ljava/util/List;

    move-result-object v1

    .line 399
    .local v1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 401
    .local v2, "isLastInLine":Z
    if-eqz v2, :cond_1

    .line 402
    const/4 v3, 0x0

    .line 403
    .local v3, "maxWidth":F
    const/4 v4, 0x0

    .line 404
    .local v4, "commonHeight":F
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 405
    .local v6, "item":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    .line 406
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    add-float/2addr v7, v8

    .line 405
    invoke-static {v3, v7}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 407
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    add-float/2addr v7, v8

    add-float/2addr v4, v7

    .line 408
    .end local v6    # "item":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_0

    .line 409
    :cond_0
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 410
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 411
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 413
    .end local v3    # "maxWidth":F
    .end local v4    # "commonHeight":F
    :cond_1
    return-void
.end method

.method decreaseLayoutBoxAfterChildPlacementRowLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 9
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p3, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 370
    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 371
    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 373
    invoke-direct {p0, p3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findLine(Lcom/itextpdf/layout/renderer/IRenderer;)Ljava/util/List;

    move-result-object v0

    .line 374
    .local v0, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 376
    .local v1, "isLastInLine":Z
    if-eqz v1, :cond_1

    .line 377
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    .line 378
    .local v2, "minBottom":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v3

    .line 379
    .local v3, "minLeft":F
    const/4 v4, 0x0

    .line 380
    .local v4, "commonWidth":F
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 381
    .local v6, "item":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    nop

    .line 382
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v8

    sub-float/2addr v7, v8

    .line 381
    invoke-static {v3, v7}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 383
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v7

    invoke-static {v2, v7}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 384
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v8

    add-float/2addr v7, v8

    add-float/2addr v4, v7

    .line 385
    .end local v6    # "item":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_0

    .line 387
    :cond_0
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 388
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 389
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    sub-float/2addr v5, v2

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 391
    .end local v2    # "minBottom":F
    .end local v3    # "minLeft":F
    .end local v4    # "commonWidth":F
    :cond_1
    return-void
.end method

.method fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "overflowX"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 490
    return-void
.end method

.method getFlexItemMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    if-nez v0, :cond_0

    .line 194
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    .line 197
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->flexItemMainDirector:Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    return-object v0
.end method

.method getHypotheticalCrossSize(Ljava/lang/Float;)Ljava/lang/Float;
    .locals 2
    .param p1, "mainSize"    # Ljava/lang/Float;

    .line 442
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->hypotheticalCrossSizes:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 6

    .line 164
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->calculateAdditionalWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(F)V

    .line 165
    .local v0, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    new-instance v1, Lcom/itextpdf/layout/renderer/MaxMaxWidthHandler;

    invoke-direct {v1, v0}, Lcom/itextpdf/layout/renderer/MaxMaxWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    .line 166
    .local v1, "minMaxWidthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->setMinMaxWidthBasedOnFixedWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 167
    const/16 v2, 0x50

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v4

    .line 168
    .local v2, "minWidth":Ljava/lang/Float;
    :goto_0
    const/16 v5, 0x4f

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v4

    .line 169
    .local v4, "maxWidth":Ljava/lang/Float;
    :cond_1
    if-eqz v2, :cond_2

    if-nez v4, :cond_3

    .line 170
    :cond_2
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findMinMaxWidthIfCorrespondingPropertiesAreNotSet(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;Lcom/itextpdf/layout/renderer/AbstractWidthHandler;)V

    .line 172
    :cond_3
    if-eqz v2, :cond_4

    .line 173
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 176
    :cond_4
    if-nez v4, :cond_5

    .line 177
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v5

    cmpl-float v3, v3, v5

    if-lez v3, :cond_6

    .line 178
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    goto :goto_1

    .line 181
    :cond_5
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 185
    .end local v2    # "minWidth":Ljava/lang/Float;
    .end local v4    # "maxWidth":Ljava/lang/Float;
    :cond_6
    :goto_1
    const/16 v2, 0x37

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 186
    invoke-static {v0, p0}, Lcom/itextpdf/layout/renderer/RotationUtils;->countRotationMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;Lcom/itextpdf/layout/renderer/AbstractRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v2

    return-object v2

    .line 189
    :cond_7
    return-object v0
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 86
    const-class v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 87
    new-instance v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/Div;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;-><init>(Lcom/itextpdf/layout/element/Div;)V

    return-object v0
.end method

.method getOccupiedAreaInCaseNothingWasWrappedWithFull(Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 1
    .param p1, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p2, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 324
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-interface {p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method handleForcedPlacement(Z)V
    .locals 0
    .param p1, "anythingPlaced"    # Z

    .line 435
    return-void
.end method

.method isWrapReverse()Z
    .locals 3

    .line 206
    sget-object v0, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->WRAP_REVERSE:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    .line 207
    const/16 v1, 0x80

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 206
    :goto_0
    return v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 17
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 95
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 96
    .local v1, "layoutContextRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->setThisAsParent(Ljava/util/Collection;)V

    .line 97
    invoke-static {v1, v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateChildrenRectangles(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Ljava/util/List;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    .line 98
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyWrapReverse()V

    .line 99
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getFlexItemMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    move-result-object v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;->applyDirection(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 100
    .local v2, "renderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->removeAllChildRenderers(Ljava/util/Collection;)Z

    .line 101
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 103
    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveRenderersToOverflow(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v3

    .line 105
    .local v3, "renderersToOverflow":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v4, "previousWidths":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/UnitValue;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v5, "previousHeights":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/UnitValue;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .local v6, "previousMinHeights":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/UnitValue;>;"
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/16 v10, 0x1b

    const/16 v11, 0x4d

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 109
    .local v8, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 111
    .local v13, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-static {v14}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v14

    const/4 v15, 0x0

    if-eqz v14, :cond_0

    .line 112
    nop

    .line 113
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v14, v9, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    .local v9, "rectangleWithoutBordersMarginsPaddings":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_2

    .line 115
    .end local v9    # "rectangleWithoutBordersMarginsPaddings":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    nop

    .line 116
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v9

    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    invoke-virtual {v9, v14, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    .line 119
    .restart local v9    # "rectangleWithoutBordersMarginsPaddings":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_2
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-virtual {v14, v11}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v4, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-virtual {v14, v10}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v5, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    const/16 v15, 0x55

    invoke-virtual {v14, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v6, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    .line 124
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v15

    invoke-static {v15}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v15

    .line 123
    invoke-virtual {v14, v11, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 125
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    .line 126
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v15

    invoke-static {v15}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v15

    .line 125
    invoke-virtual {v14, v10, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 130
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    .line 131
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v15

    invoke-static {v15}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v15

    .line 130
    const/16 v10, 0x55

    invoke-virtual {v14, v10, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 135
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v10

    const/16 v14, 0x1c

    const/4 v15, 0x0

    invoke-virtual {v10, v14, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 136
    .end local v9    # "rectangleWithoutBordersMarginsPaddings":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v13    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    const/16 v10, 0x1b

    goto/16 :goto_1

    .line 137
    .end local v8    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_1
    goto/16 :goto_0

    .line 139
    :cond_2
    invoke-super/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/DivRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v7

    .line 140
    .local v7, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 141
    invoke-direct {v0, v7, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->adjustLayoutResultToHandleOverflowRenderers(Lcom/itextpdf/layout/layout/LayoutResult;Ljava/util/List;)V

    .line 147
    :cond_3
    const/4 v8, 0x0

    .line 148
    .local v8, "counter":I
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->lines:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    .line 149
    .local v10, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 150
    .restart local v13    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v11, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 151
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    const/16 v11, 0x1b

    invoke-virtual {v14, v11, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 152
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v14

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    const/16 v11, 0x55

    invoke-virtual {v14, v11, v15}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 153
    nop

    .end local v13    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    add-int/lit8 v8, v8, 0x1

    .line 154
    const/16 v11, 0x4d

    goto :goto_4

    .line 149
    :cond_4
    const/16 v11, 0x55

    .line 155
    .end local v10    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    const/16 v11, 0x4d

    goto :goto_3

    .line 156
    :cond_5
    return-object v7
.end method

.method processNotFullChildResult(Lcom/itextpdf/layout/layout/LayoutContext;Ljava/util/Map;Ljava/util/List;ZLjava/util/List;ZF[Lcom/itextpdf/layout/borders/Border;[Lcom/itextpdf/layout/properties/UnitValue;Ljava/util/List;ILcom/itextpdf/kernel/geom/Rectangle;Ljava/util/Set;Lcom/itextpdf/layout/renderer/IRenderer;ZILcom/itextpdf/layout/layout/LayoutResult;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 16
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p4, "wasHeightClipped"    # Z
    .param p6, "marginsCollapsingEnabled"    # Z
    .param p7, "clearHeightCorrection"    # F
    .param p8, "borders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p9, "paddings"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p11, "currentAreaPos"    # I
    .param p12, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p14, "causeOfNothing"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p15, "anythingPlaced"    # Z
    .param p16, "childPos"    # I
    .param p17, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/layout/LayoutContext;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;Z",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;ZF[",
            "Lcom/itextpdf/layout/borders/Border;",
            "[",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;I",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "ZI",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ")",
            "Lcom/itextpdf/layout/layout/LayoutResult;"
        }
    .end annotation

    .line 278
    .local p2, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p3, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p5, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local p10, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local p13, "nonChildFloatingRendererAreas":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    move-object/from16 v0, p0

    move/from16 v6, p4

    move-object/from16 v7, p14

    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v8

    .line 279
    .local v8, "keepTogether":Z
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v9, 0x1a

    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz v6, :cond_0

    move-object/from16 v9, p8

    move-object/from16 v5, p9

    move-object/from16 v1, p12

    goto/16 :goto_2

    .line 289
    :cond_0
    nop

    .line 290
    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    .line 289
    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v1, p16

    move-object/from16 v3, p17

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createSplitAndOverflowRenderers(IILcom/itextpdf/layout/layout/LayoutResult;Ljava/util/Map;Ljava/util/List;)[Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v2

    .line 292
    .local v2, "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    const/4 v1, 0x0

    aget-object v1, v2, v1

    .line 293
    .local v1, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    const/4 v3, 0x1

    aget-object v14, v2, v3

    .line 294
    .local v14, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v14, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    .line 295
    invoke-virtual {v0, v6, v1, v14}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->updateHeightsOnSplit(ZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 297
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isRelativePosition()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 298
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->positionedRenderers:Ljava/util/List;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, v14, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 301
    :cond_1
    if-eqz v8, :cond_2

    .line 302
    const/4 v1, 0x0

    .line 303
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v14, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setChildRenderers(Ljava/util/List;)V

    move-object v13, v1

    goto :goto_0

    .line 301
    :cond_2
    move-object v13, v1

    .line 306
    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v13, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_0
    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 308
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V

    .line 310
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    move-object/from16 v5, p9

    invoke-virtual {v0, v4, v5, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 311
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    move-object/from16 v9, p8

    invoke-virtual {v0, v4, v9, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 312
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v0, v4, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 313
    if-eqz v13, :cond_4

    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    move-object v3, v13

    goto :goto_1

    .line 317
    :cond_3
    new-instance v10, Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    const/4 v15, 0x0

    const/4 v11, 0x2

    invoke-direct/range {v10 .. v15}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 318
    move-object v3, v13

    .end local v13    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v3, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v4

    invoke-virtual {v10, v4}, Lcom/itextpdf/layout/layout/LayoutResult;->setAreaBreak(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v4

    .line 317
    return-object v4

    .line 313
    .end local v3    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v13    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_4
    move-object v3, v13

    .line 314
    .end local v13    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v3    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_1
    new-instance v10, Lcom/itextpdf/layout/layout/LayoutResult;

    .line 315
    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v15

    const/4 v11, 0x3

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v10 .. v15}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v4

    invoke-virtual {v10, v4}, Lcom/itextpdf/layout/layout/LayoutResult;->setAreaBreak(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v4

    .line 314
    return-object v4

    .line 279
    .end local v2    # "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v3    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v14    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_5
    move-object/from16 v9, p8

    move-object/from16 v5, p9

    move-object/from16 v1, p12

    .line 280
    :goto_2
    if-eqz v8, :cond_6

    const/4 v2, 0x0

    goto :goto_3

    :cond_6
    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v2

    :goto_3
    move-object v13, v2

    .line 281
    .restart local v13    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    if-eqz v13, :cond_7

    .line 282
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v13, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setChildRenderers(Ljava/util/List;)V

    .line 285
    :cond_7
    new-instance v10, Lcom/itextpdf/layout/layout/LayoutResult;

    .line 286
    move-object/from16 v3, p17

    invoke-virtual {v0, v3, v13}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getOccupiedAreaInCaseNothingWasWrappedWithFull(Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v11, 0x1

    invoke-direct/range {v10 .. v15}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 285
    return-object v10
.end method

.method recalculateLayoutBoxBeforeChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 3
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "initialLayoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 418
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 419
    .local v0, "layoutBoxCopy":Lcom/itextpdf/kernel/geom/Rectangle;
    instance-of v1, p2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_0

    .line 420
    move-object v1, p2

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->findFlexItemInfo(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Lcom/itextpdf/layout/renderer/FlexItemInfo;

    move-result-object v1

    .line 421
    .local v1, "childFlexItemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    if-eqz v1, :cond_0

    .line 422
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 423
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 425
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 428
    .end local v1    # "childFlexItemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    :cond_0
    return-object v0
.end method

.method recalculateOccupiedAreaAfterChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;)V
    .locals 5
    .param p1, "resultBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "blockMaxHeight"    # Ljava/lang/Float;

    .line 337
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 338
    .local v0, "oldBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x2

    new-array v1, v1, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 340
    .local v1, "recalculatedRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 341
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 342
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    .line 343
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 345
    :cond_0
    if-eqz p2, :cond_1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 346
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    .line 347
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 348
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 349
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 351
    :cond_1
    return-void
.end method

.method setHypotheticalCrossSize(Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 2
    .param p1, "mainSize"    # Ljava/lang/Float;
    .param p2, "hypotheticalCrossSize"    # Ljava/lang/Float;

    .line 438
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->hypotheticalCrossSizes:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    return-void
.end method

.method startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .locals 1
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "marginsCollapseHandler"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    .line 356
    const/4 v0, 0x0

    invoke-virtual {p3, v0, p2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v0

    return-object v0
.end method

.method stopLayoutingChildrenIfChildResultNotFull(Lcom/itextpdf/layout/layout/LayoutResult;)Z
    .locals 2
    .param p1, "returnResult"    # Lcom/itextpdf/layout/layout/LayoutResult;

    .line 329
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
