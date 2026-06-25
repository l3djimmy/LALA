.class public abstract Lcom/itextpdf/layout/renderer/RootRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "RootRenderer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

.field private floatOverflowedCompletely:Z

.field floatRendererAreas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;"
        }
    .end annotation
.end field

.field protected immediateFlush:Z

.field private initialCurrentArea:Lcom/itextpdf/layout/layout/LayoutArea;

.field private keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

.field private keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

.field private marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

.field protected waitingDrawingElements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end field

.field private waitingNextPageRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 53
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 53
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>()V

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->immediateFlush:Z

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingDrawingElements:Ljava/util/List;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatOverflowedCompletely:Z

    return-void
.end method

.method private addAllWaitingNextPageRenderers()V
    .locals 3

    .line 456
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x59

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/RootRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 457
    .local v0, "marginsCollapsingEnabled":Z
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 458
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 459
    new-instance v2, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-direct {v2, p0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    .line 461
    :cond_0
    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    goto :goto_0

    .line 463
    :cond_1
    return-void
.end method

.method private addWaitingNextPageRenderers()V
    .locals 3

    .line 466
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatOverflowedCompletely:Z

    .line 467
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 468
    .local v0, "waitingFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 469
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 470
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/RootRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 471
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 472
    :cond_0
    return-void
.end method

.method private processRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;)V
    .locals 1
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 368
    .local p2, "resultRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->alignChildHorizontally(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 369
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->immediateFlush:Z

    if-eqz v0, :cond_0

    .line 370
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_0

    .line 372
    :cond_0
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 374
    :goto_0
    return-void
.end method

.method private processWaitingKeepWithNextElement(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 18
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 377
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v2, :cond_a

    .line 378
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    .line 379
    .local v2, "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 380
    const/4 v3, 0x0

    .line 381
    .local v3, "ableToProcessKeepWithNext":Z
    invoke-interface {v1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    new-instance v5, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-direct {v5, v2}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v4, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v4

    const/4 v5, 0x3

    const/4 v6, 0x1

    if-eq v4, v5, :cond_0

    .line 383
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v0, v4, v7, v8}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 384
    const/4 v3, 0x1

    move-object/from16 v16, v2

    goto/16 :goto_4

    .line 386
    :cond_0
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    .line 387
    .local v4, "originalElementHeight":F
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 388
    .local v7, "trySplitHeightPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/high16 v8, 0x420c0000    # 35.0f

    .line 389
    .local v8, "delta":F
    const/4 v9, 0x1

    .local v9, "i":I
    :goto_0
    const/4 v10, 0x5

    if-gt v9, v10, :cond_1

    int-to-float v10, v9

    mul-float/2addr v10, v8

    sub-float v10, v4, v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float v11, v4, v11

    cmpl-float v10, v10, v11

    if-lez v10, :cond_1

    .line 390
    int-to-float v10, v9

    mul-float/2addr v10, v8

    sub-float v10, v4, v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 389
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 392
    .end local v9    # "i":I
    :cond_1
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_1
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_6

    if-nez v3, :cond_6

    .line 393
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    .line 394
    .local v10, "curElementSplitHeight":F
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 395
    .local v11, "firstElementSplitLayoutArea":Lcom/itextpdf/layout/layout/RootLayoutArea;
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    iget-object v13, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 396
    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    sub-float/2addr v13, v10

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 397
    iget-object v12, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v12, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v12

    new-instance v13, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v12, v13}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v12

    .line 398
    .local v12, "firstElementSplitLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v13

    const/4 v14, 0x2

    if-ne v13, v14, :cond_4

    .line 399
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 400
    .local v13, "storedArea":Lcom/itextpdf/layout/layout/RootLayoutArea;
    invoke-direct {v0, v12}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 401
    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v14

    new-instance v15, Lcom/itextpdf/layout/layout/LayoutContext;

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-direct {v15, v5}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v14, v15}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v5

    .line 402
    .local v5, "firstElementOverflowLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v14

    if-ne v14, v6, :cond_2

    .line 403
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v14

    .line 404
    .local v14, "secondElementLayoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v15

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v16

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v17

    sub-float v6, v16, v17

    invoke-virtual {v15, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 405
    invoke-interface {v1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    new-instance v15, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-direct {v15, v14}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v6, v15}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v6

    .line 406
    .local v6, "secondElementLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v15

    move-object/from16 v16, v2

    const/4 v2, 0x3

    .end local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v16, "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    if-eq v15, v2, :cond_3

    .line 407
    const/4 v3, 0x1

    .line 409
    iput-object v11, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 410
    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v15, v12}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 411
    invoke-direct {v0, v12}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 412
    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v15, v5}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    goto :goto_2

    .line 402
    .end local v6    # "secondElementLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v14    # "secondElementLayoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_2
    move-object/from16 v16, v2

    .line 415
    .end local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_3
    :goto_2
    if-nez v3, :cond_5

    .line 416
    iput-object v13, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    goto :goto_3

    .line 398
    .end local v5    # "firstElementOverflowLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v13    # "storedArea":Lcom/itextpdf/layout/layout/RootLayoutArea;
    .end local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_4
    move-object/from16 v16, v2

    .line 392
    .end local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v10    # "curElementSplitHeight":F
    .end local v11    # "firstElementSplitLayoutArea":Lcom/itextpdf/layout/layout/RootLayoutArea;
    .end local v12    # "firstElementSplitLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_5
    :goto_3
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v2, v16

    const/4 v5, 0x3

    const/4 v6, 0x1

    goto/16 :goto_1

    .end local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_6
    move-object/from16 v16, v2

    .line 421
    .end local v2    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v4    # "originalElementHeight":F
    .end local v7    # "trySplitHeightPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v8    # "delta":F
    .end local v9    # "i":I
    .restart local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :goto_4
    const/4 v2, 0x0

    if-nez v3, :cond_8

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/RootLayoutArea;->isEmptyArea()Z

    move-result v4

    if-nez v4, :cond_8

    .line 422
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 423
    .local v4, "storedArea":Lcom/itextpdf/layout/layout/RootLayoutArea;
    invoke-direct {v0, v2}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 424
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v5, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    new-instance v6, Lcom/itextpdf/layout/layout/LayoutContext;

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v5, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v5

    .line 425
    .local v5, "firstElementLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_7

    .line 426
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    .line 427
    .local v6, "secondElementLayoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    sub-float/2addr v8, v9

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 428
    invoke-interface {v1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v7

    new-instance v8, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-direct {v8, v6}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v7, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v7

    .line 429
    .local v7, "secondElementLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v8

    const/4 v9, 0x3

    if-eq v8, v9, :cond_7

    .line 430
    const/4 v3, 0x1

    .line 431
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v0, v8, v9, v10}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 434
    .end local v6    # "secondElementLayoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v7    # "secondElementLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_7
    if-nez v3, :cond_8

    .line 435
    iput-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 438
    .end local v4    # "storedArea":Lcom/itextpdf/layout/layout/RootLayoutArea;
    .end local v5    # "firstElementLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_8
    if-nez v3, :cond_9

    .line 439
    const-class v4, Lcom/itextpdf/layout/renderer/RootRenderer;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 440
    .local v4, "logger":Lorg/slf4j/Logger;
    const-string v5, "The renderer was not able to process keep with next property properly"

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 441
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v0, v5, v6, v7}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 443
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_9
    iput-object v2, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 444
    iput-object v2, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 446
    .end local v3    # "ableToProcessKeepWithNext":Z
    .end local v16    # "rest":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_a
    return-void
.end method

.method private tryDisableKeepTogether(Lcom/itextpdf/layout/layout/LayoutResult;ZLcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;)Z
    .locals 5
    .param p1, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p2, "rendererIsFloat"    # Z
    .param p3, "rootRendererStateHandler"    # Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;

    .line 489
    const/4 v0, 0x0

    .line 492
    .local v0, "toDisableKeepTogether":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    .line 493
    .local v1, "current":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_0
    const/16 v2, 0x20

    if-eqz v1, :cond_1

    .line 494
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 495
    move-object v0, v1

    .line 497
    :cond_0
    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    goto :goto_0

    .line 500
    :cond_1
    const/4 v3, 0x0

    if-nez v0, :cond_2

    .line 501
    return v3

    .line 504
    :cond_2
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 505
    const-class v2, Lcom/itextpdf/layout/renderer/RootRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 506
    .local v2, "logger":Lorg/slf4j/Logger;
    invoke-interface {v2}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 507
    const-string v3, "KeepTogether property will be ignored."

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Element does not fit current area. {0}"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 511
    :cond_3
    if-nez p2, :cond_4

    .line 512
    invoke-virtual {p3, p0}, Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;->attemptGoBackToStoredPreviousStateAndStoreNextState(Lcom/itextpdf/layout/renderer/RootRenderer;)Z

    .line 514
    :cond_4
    const/4 v3, 0x1

    return v3
.end method

.method private updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V
    .locals 1
    .param p1, "overflowResult"    # Lcom/itextpdf/layout/layout/LayoutResult;

    .line 449
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatRendererAreas:Ljava/util/List;

    .line 450
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentArea(Lcom/itextpdf/layout/layout/LayoutResult;)Lcom/itextpdf/layout/layout/LayoutArea;

    .line 451
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->initialCurrentArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 452
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/RootRenderer;->addWaitingNextPageRenderers()V

    .line 453
    return-void
.end method

.method private updateForcedPlacement(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 4
    .param p1, "currentRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 475
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x1a

    invoke-interface {p1, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 476
    const/4 v0, 0x0

    return v0

    .line 478
    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 479
    const-class v1, Lcom/itextpdf/layout/renderer/RootRenderer;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 480
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-interface {v1}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 481
    const-string v2, ""

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Element does not fit current area. {0}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 483
    :cond_1
    return v0
.end method


# virtual methods
.method public addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 23
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 67
    move-object/from16 v0, p0

    const/16 v1, 0x6c

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/RootRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 68
    .local v1, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v1, :cond_0

    .line 69
    move-object/from16 v2, p1

    invoke-static {v1, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_0

    .line 68
    :cond_0
    move-object/from16 v2, p1

    .line 74
    :goto_0
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    .line 75
    .local v3, "numberOfChildRenderers":I
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    .line 76
    .local v4, "numberOfPositionedChildRenderers":I
    invoke-super/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 77
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 78
    .local v5, "addedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 79
    .local v7, "addedPositionedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_1
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-le v8, v3, :cond_1

    .line 80
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v8, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_1

    .line 83
    :cond_1
    :goto_2
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-le v8, v4, :cond_2

    .line 84
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_2

    .line 88
    :cond_2
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v9, 0x59

    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/renderer/RootRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 89
    .local v8, "marginsCollapsingEnabled":Z
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    const/4 v10, 0x0

    if-nez v9, :cond_3

    .line 90
    invoke-direct {v0, v10}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 91
    if-eqz v8, :cond_3

    .line 92
    new-instance v9, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-direct {v9, v0, v10}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    iput-object v9, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    .line 97
    :cond_3
    const/4 v9, 0x0

    .end local p1    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v9, "i":I
    :goto_3
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-eqz v11, :cond_22

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v11

    if-ge v9, v11, :cond_22

    .line 98
    new-instance v11, Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;

    invoke-direct {v11}, Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;-><init>()V

    .line 100
    .local v11, "rootRendererStateHandler":Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    move-object v2, v13

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 101
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v13

    .line 102
    .local v13, "rendererIsFloat":Z
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    const/16 v15, 0x64

    invoke-interface {v2, v15}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v15, v16

    check-cast v15, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-static {v14, v15}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isClearanceApplied(Ljava/util/List;Lcom/itextpdf/layout/properties/ClearPropertyValue;)Z

    move-result v14

    .line 103
    .local v14, "clearanceOverflowsToNextPage":Z
    if-eqz v13, :cond_5

    iget-boolean v15, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatOverflowedCompletely:Z

    if-nez v15, :cond_4

    if-eqz v14, :cond_5

    .line 104
    :cond_4
    iget-object v12, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-interface {v12, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    iput-boolean v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatOverflowedCompletely:Z

    .line 106
    move-object/from16 v19, v1

    move/from16 v20, v3

    move/from16 v21, v4

    goto/16 :goto_a

    .line 109
    :cond_5
    invoke-direct {v0, v2}, Lcom/itextpdf/layout/renderer/RootRenderer;->processWaitingKeepWithNextElement(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 111
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v15, "resultRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/16 v16, 0x0

    .line 114
    .local v16, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    const/16 v17, 0x0

    .line 115
    .local v17, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    if-eqz v8, :cond_6

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-eqz v10, :cond_6

    if-eqz v2, :cond_6

    .line 116
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v10, v2, v12}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v17

    move-object/from16 v10, v17

    goto :goto_4

    .line 118
    :cond_6
    move-object/from16 v10, v17

    .end local v17    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .local v10, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    :goto_4
    const-class v12, Lcom/itextpdf/layout/renderer/RootRenderer;

    if-nez v14, :cond_9

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-eqz v6, :cond_8

    if-eqz v2, :cond_8

    .line 119
    invoke-interface {v2, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    move-object/from16 v19, v1

    .end local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .local v19, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    new-instance v1, Lcom/itextpdf/layout/layout/LayoutContext;

    move/from16 v20, v3

    .end local v3    # "numberOfChildRenderers":I
    .local v20, "numberOfChildRenderers":I
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 120
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    move/from16 v21, v4

    .end local v4    # "numberOfPositionedChildRenderers":I
    .local v21, "numberOfPositionedChildRenderers":I
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatRendererAreas:Ljava/util/List;

    invoke-direct {v1, v3, v10, v4}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;)V

    invoke-interface {v6, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    move-object/from16 v16, v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v3, 0x1

    if-eq v1, v3, :cond_7

    goto :goto_5

    :cond_7
    move-object/from16 v3, v16

    goto/16 :goto_9

    .line 118
    .end local v19    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v20    # "numberOfChildRenderers":I
    .end local v21    # "numberOfPositionedChildRenderers":I
    .restart local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .restart local v3    # "numberOfChildRenderers":I
    .restart local v4    # "numberOfPositionedChildRenderers":I
    :cond_8
    move-object/from16 v19, v1

    move/from16 v20, v3

    move/from16 v21, v4

    .line 203
    .end local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v3    # "numberOfChildRenderers":I
    .end local v4    # "numberOfPositionedChildRenderers":I
    .restart local v19    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .restart local v20    # "numberOfChildRenderers":I
    .restart local v21    # "numberOfPositionedChildRenderers":I
    move-object/from16 v3, v16

    goto/16 :goto_9

    .line 118
    .end local v19    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v20    # "numberOfChildRenderers":I
    .end local v21    # "numberOfPositionedChildRenderers":I
    .restart local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .restart local v3    # "numberOfChildRenderers":I
    .restart local v4    # "numberOfPositionedChildRenderers":I
    :cond_9
    move-object/from16 v19, v1

    move/from16 v20, v3

    move/from16 v21, v4

    .line 121
    .end local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v3    # "numberOfChildRenderers":I
    .end local v4    # "numberOfPositionedChildRenderers":I
    .restart local v19    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .restart local v20    # "numberOfChildRenderers":I
    .restart local v21    # "numberOfPositionedChildRenderers":I
    :goto_5
    const/4 v1, 0x0

    .line 122
    .local v1, "currentAreaNeedsToBeUpdated":Z
    if-eqz v14, :cond_a

    .line 123
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v4, 0x3

    const/4 v6, 0x0

    invoke-direct {v3, v4, v6, v6, v2}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 124
    .end local v16    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v3, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    const/4 v1, 0x1

    goto :goto_6

    .line 122
    .end local v3    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v16    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_a
    move-object/from16 v3, v16

    .line 126
    .end local v16    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v3    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_6
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v4

    const/4 v6, 0x2

    if-ne v4, v6, :cond_d

    .line 127
    if-eqz v13, :cond_b

    .line 128
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    goto/16 :goto_9

    .line 131
    :cond_b
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    invoke-direct {v0, v4, v15}, Lcom/itextpdf/layout/renderer/RootRenderer;->processRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;)V

    .line 132
    invoke-virtual {v11, v0}, Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;->attemptGoForwardToStoredNextState(Lcom/itextpdf/layout/renderer/RootRenderer;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 133
    const/4 v1, 0x1

    goto/16 :goto_c

    .line 132
    :cond_c
    move/from16 v16, v1

    goto/16 :goto_b

    .line 136
    :cond_d
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v4

    const/4 v6, 0x3

    if-ne v4, v6, :cond_1b

    if-nez v14, :cond_1b

    .line 137
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    instance-of v4, v4, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-eqz v4, :cond_11

    .line 138
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/ImageRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    .line 139
    .local v4, "imgHeight":F
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatRendererAreas:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_f

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 140
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    cmpg-float v6, v6, v4

    if-gez v6, :cond_e

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/RootLayoutArea;->isEmptyArea()Z

    move-result v6

    if-nez v6, :cond_e

    move/from16 v16, v1

    move/from16 v22, v4

    goto :goto_7

    .line 148
    :cond_e
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/ImageRenderer;

    move/from16 v16, v1

    .end local v1    # "currentAreaNeedsToBeUpdated":Z
    .local v16, "currentAreaNeedsToBeUpdated":Z
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v6, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->autoScale(Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/renderer/ImageRenderer;

    .line 149
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move/from16 v22, v4

    const/16 v4, 0x1a

    .end local v4    # "imgHeight":F
    .local v22, "imgHeight":F
    invoke-interface {v1, v4, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 150
    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 151
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v4, ""

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v6, "Element does not fit current area. {0}"

    invoke-static {v6, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    move/from16 v1, v16

    goto :goto_8

    .line 139
    .end local v16    # "currentAreaNeedsToBeUpdated":Z
    .end local v22    # "imgHeight":F
    .local v1, "currentAreaNeedsToBeUpdated":Z
    .restart local v4    # "imgHeight":F
    :cond_f
    move/from16 v16, v1

    move/from16 v22, v4

    .line 141
    .end local v1    # "currentAreaNeedsToBeUpdated":Z
    .end local v4    # "imgHeight":F
    .restart local v16    # "currentAreaNeedsToBeUpdated":Z
    .restart local v22    # "imgHeight":F
    :goto_7
    if-eqz v13, :cond_10

    .line 142
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatOverflowedCompletely:Z

    .line 144
    goto :goto_9

    .line 146
    :cond_10
    const/4 v1, 0x1

    .line 153
    .end local v16    # "currentAreaNeedsToBeUpdated":Z
    .end local v22    # "imgHeight":F
    .restart local v1    # "currentAreaNeedsToBeUpdated":Z
    :goto_8
    goto/16 :goto_c

    .line 154
    :cond_11
    move/from16 v16, v1

    .end local v1    # "currentAreaNeedsToBeUpdated":Z
    .restart local v16    # "currentAreaNeedsToBeUpdated":Z
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/RootLayoutArea;->isEmptyArea()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v1

    if-nez v1, :cond_14

    .line 155
    invoke-direct {v0, v3, v13, v11}, Lcom/itextpdf/layout/renderer/RootRenderer;->tryDisableKeepTogether(Lcom/itextpdf/layout/layout/LayoutResult;ZLcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;)Z

    move-result v1

    .line 158
    .local v1, "keepTogetherChanged":Z
    xor-int/lit8 v4, v1, 0x1

    .line 159
    .local v4, "areKeepTogetherAndForcedPlacementBothNotChanged":Z
    if-eqz v4, :cond_12

    .line 160
    nop

    .line 161
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    invoke-direct {v0, v2, v6}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateForcedPlacement(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v6

    const/16 v17, 0x1

    xor-int/lit8 v6, v6, 0x1

    move v4, v6

    .line 164
    :cond_12
    if-nez v4, :cond_13

    .line 173
    .end local v1    # "keepTogetherChanged":Z
    .end local v4    # "areKeepTogetherAndForcedPlacementBothNotChanged":Z
    goto/16 :goto_b

    .line 168
    .restart local v1    # "keepTogetherChanged":Z
    .restart local v4    # "areKeepTogetherAndForcedPlacementBothNotChanged":Z
    :cond_13
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 174
    .end local v1    # "keepTogetherChanged":Z
    .end local v4    # "areKeepTogetherAndForcedPlacementBothNotChanged":Z
    :cond_14
    invoke-virtual {v11, v0}, Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;->storePreviousState(Lcom/itextpdf/layout/renderer/RootRenderer;)Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;

    .line 175
    invoke-virtual {v11, v0}, Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;->attemptGoForwardToStoredNextState(Lcom/itextpdf/layout/renderer/RootRenderer;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 176
    if-eqz v13, :cond_1a

    .line 177
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->floatOverflowedCompletely:Z

    .line 179
    nop

    .line 203
    .end local v16    # "currentAreaNeedsToBeUpdated":Z
    :goto_9
    if-eqz v8, :cond_15

    .line 204
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 207
    :cond_15
    if-eqz v3, :cond_16

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_16

    .line 208
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 212
    :cond_16
    if-eqz v2, :cond_19

    if-eqz v3, :cond_19

    .line 213
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v4, 0x51

    invoke-interface {v2, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 214
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v4, 0x1a

    invoke-interface {v2, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 215
    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 216
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v4, "Element was placed in a forced way. Keep with next property will be ignored"

    invoke-interface {v1, v4}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 217
    invoke-virtual {v0, v2, v15, v3}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 218
    .end local v1    # "logger":Lorg/slf4j/Logger;
    goto :goto_a

    .line 219
    :cond_17
    iput-object v2, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 220
    iput-object v3, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRendererLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    goto :goto_a

    .line 222
    :cond_18
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v4, 0x3

    if-eq v1, v4, :cond_19

    .line 223
    invoke-virtual {v0, v2, v15, v3}, Lcom/itextpdf/layout/renderer/RootRenderer;->shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 97
    .end local v3    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v10    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .end local v11    # "rootRendererStateHandler":Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;
    .end local v13    # "rendererIsFloat":Z
    .end local v14    # "clearanceOverflowsToNextPage":Z
    .end local v15    # "resultRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_19
    :goto_a
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v1, v19

    move/from16 v3, v20

    move/from16 v4, v21

    const/4 v6, 0x1

    const/4 v10, 0x0

    goto/16 :goto_3

    .line 181
    .restart local v3    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v10    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .restart local v11    # "rootRendererStateHandler":Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;
    .restart local v13    # "rendererIsFloat":Z
    .restart local v14    # "clearanceOverflowsToNextPage":Z
    .restart local v15    # "resultRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v16    # "currentAreaNeedsToBeUpdated":Z
    :cond_1a
    const/4 v1, 0x1

    .end local v16    # "currentAreaNeedsToBeUpdated":Z
    .local v1, "currentAreaNeedsToBeUpdated":Z
    goto :goto_c

    .line 136
    :cond_1b
    move/from16 v16, v1

    .line 187
    .end local v1    # "currentAreaNeedsToBeUpdated":Z
    .restart local v16    # "currentAreaNeedsToBeUpdated":Z
    :cond_1c
    :goto_b
    move/from16 v1, v16

    .end local v16    # "currentAreaNeedsToBeUpdated":Z
    .restart local v1    # "currentAreaNeedsToBeUpdated":Z
    :goto_c
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 189
    if-eqz v8, :cond_1d

    .line 190
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 192
    :cond_1d
    if-eqz v1, :cond_1e

    .line 193
    invoke-direct {v0, v3}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 195
    :cond_1e
    if-eqz v8, :cond_1f

    .line 196
    new-instance v4, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    const/4 v6, 0x0

    invoke-direct {v4, v0, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    iput-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    .line 197
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->marginsCollapseHandler:Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v4, v2, v12}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v4

    move-object v10, v4

    .end local v10    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .local v4, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    goto :goto_d

    .line 195
    .end local v4    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .restart local v10    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    :cond_1f
    const/4 v6, 0x0

    .line 200
    :goto_d
    if-eqz v14, :cond_20

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingNextPageRenderers:Ljava/util/List;

    .line 201
    const/16 v12, 0x64

    invoke-interface {v2, v12}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v6, v16

    check-cast v6, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-static {v4, v6}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isClearanceApplied(Ljava/util/List;Lcom/itextpdf/layout/properties/ClearPropertyValue;)Z

    move-result v4

    if-eqz v4, :cond_21

    const/4 v4, 0x1

    goto :goto_e

    .line 200
    :cond_20
    const/16 v12, 0x64

    .line 201
    :cond_21
    const/4 v4, 0x0

    :goto_e
    move v14, v4

    .line 202
    .end local v1    # "currentAreaNeedsToBeUpdated":Z
    move-object/from16 v16, v3

    move-object/from16 v1, v19

    move/from16 v3, v20

    move/from16 v4, v21

    const/4 v6, 0x1

    goto/16 :goto_4

    .line 97
    .end local v10    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .end local v11    # "rootRendererStateHandler":Lcom/itextpdf/layout/renderer/RootRendererAreaStateHandler;
    .end local v13    # "rendererIsFloat":Z
    .end local v14    # "clearanceOverflowsToNextPage":Z
    .end local v15    # "resultRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v19    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v20    # "numberOfChildRenderers":I
    .end local v21    # "numberOfPositionedChildRenderers":I
    .local v1, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .local v3, "numberOfChildRenderers":I
    .local v4, "numberOfPositionedChildRenderers":I
    :cond_22
    move-object/from16 v19, v1

    move/from16 v20, v3

    move/from16 v21, v4

    .line 228
    .end local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v3    # "numberOfChildRenderers":I
    .end local v4    # "numberOfPositionedChildRenderers":I
    .end local v9    # "i":I
    .restart local v19    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .restart local v20    # "numberOfChildRenderers":I
    .restart local v21    # "numberOfPositionedChildRenderers":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_26

    .line 229
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/16 v17, 0x1

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v2, v3

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 231
    const/16 v3, 0x33

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 232
    .local v3, "positionedPageNumber":Ljava/lang/Integer;
    if-nez v3, :cond_23

    .line 233
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getPageNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 240
    :cond_23
    const/16 v18, 0x3

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v6, 0x34

    invoke-interface {v2, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->noAbsolutePositionInfo(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 241
    new-instance v4, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-direct {v4, v6, v9}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .local v4, "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    goto :goto_10

    .line 243
    .end local v4    # "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_24
    new-instance v4, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->initialCurrentArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-direct {v4, v6, v9}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 245
    .restart local v4    # "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    :goto_10
    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 246
    .local v6, "fullBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v0, v2, v6, v9}, Lcom/itextpdf/layout/renderer/RootRenderer;->preparePositionedRendererAndAreaForLayout(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 247
    new-instance v9, Lcom/itextpdf/layout/layout/PositionedLayoutContext;

    new-instance v10, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v11

    invoke-direct {v10, v11, v6}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v9, v10, v4}, Lcom/itextpdf/layout/layout/PositionedLayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {v2, v9}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    .line 249
    iget-boolean v9, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->immediateFlush:Z

    if-eqz v9, :cond_25

    .line 250
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 251
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    const/16 v17, 0x1

    add-int/lit8 v10, v10, -0x1

    invoke-interface {v9, v10}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_11

    .line 249
    :cond_25
    const/16 v17, 0x1

    .line 228
    .end local v3    # "positionedPageNumber":Ljava/lang/Integer;
    .end local v4    # "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v6    # "fullBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_11
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_f

    .line 254
    .end local v1    # "i":I
    :cond_26
    return-void
.end method

.method public close()V
    .locals 3

    .line 278
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/RootRenderer;->addAllWaitingNextPageRenderers()V

    .line 279
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_0

    .line 280
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/16 v2, 0x51

    invoke-interface {v0, v2, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 281
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 282
    .local v0, "rendererToBeAdded":Lcom/itextpdf/layout/renderer/IRenderer;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->keepWithNextHangingRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 283
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 285
    .end local v0    # "rendererToBeAdded":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->immediateFlush:Z

    if-nez v0, :cond_1

    .line 286
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/RootRenderer;->flush()V

    .line 288
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushWaitingDrawingElements(Z)V

    .line 289
    const/16 v0, 0x6c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 290
    .local v0, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v0, :cond_2

    .line 291
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->releaseAllHints()V

    .line 293
    :cond_2
    return-void
.end method

.method public flush()V
    .locals 2

    .line 262
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 263
    .local v1, "resultRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 264
    .end local v1    # "resultRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 266
    .restart local v1    # "resultRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 267
    .end local v1    # "resultRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    .line 268
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 269
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 270
    return-void
.end method

.method protected abstract flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V
.end method

.method protected flushWaitingDrawingElements()V
    .locals 1

    .line 330
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushWaitingDrawingElements(Z)V

    .line 331
    return-void
.end method

.method flushWaitingDrawingElements(Z)V
    .locals 5
    .param p1, "force"    # Z

    .line 334
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 335
    .local v0, "flushedElements":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingDrawingElements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .line 346
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingDrawingElements:Ljava/util/List;

    .line 335
    if-ge v1, v2, :cond_3

    .line 337
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 339
    .local v2, "waitingDrawingElement":Lcom/itextpdf/layout/renderer/IRenderer;
    if-nez p1, :cond_1

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getPageNumber()I

    move-result v4

    if-ge v3, v4, :cond_0

    goto :goto_1

    .line 342
    :cond_0
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    if-nez v3, :cond_2

    .line 343
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 340
    :cond_1
    :goto_1
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/RootRenderer;->flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 341
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 335
    .end local v2    # "waitingDrawingElement":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 346
    .end local v1    # "i":I
    :cond_3
    invoke-interface {v3, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 347
    return-void
.end method

.method public getCurrentArea()Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 1

    .line 304
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-nez v0, :cond_0

    .line 305
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->updateCurrentAndInitialArea(Lcom/itextpdf/layout/layout/LayoutResult;)V

    .line 307
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 2
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 300
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Layout is not supported for root renderers."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final linkRenderToDocument(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 4
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 350
    if-nez p1, :cond_0

    .line 351
    return-void

    .line 353
    :cond_0
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    .line 354
    .local v0, "container":Lcom/itextpdf/layout/IPropertyContainer;
    instance-of v1, v0, Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;

    if-eqz v1, :cond_1

    .line 355
    invoke-static {}, Lcom/itextpdf/commons/actions/EventManager;->getInstance()Lcom/itextpdf/commons/actions/EventManager;

    move-result-object v1

    new-instance v2, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;

    move-object v3, v0

    check-cast v3, Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;

    invoke-direct {v2, p2, v3}, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/commons/actions/EventManager;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V

    .line 359
    :cond_1
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    .line 360
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    if-eqz v1, :cond_2

    .line 361
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 362
    .local v3, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v3, p2}, Lcom/itextpdf/layout/renderer/RootRenderer;->linkRenderToDocument(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 363
    .end local v3    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 365
    :cond_2
    return-void
.end method

.method protected shrinkCurrentAreaAndProcessRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/layout/layout/LayoutResult;)V
    .locals 3
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ")V"
        }
    .end annotation

    .line 315
    .local p2, "resultRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-eqz v0, :cond_2

    .line 316
    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 317
    .local v0, "resultRendererHeight":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 318
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/RootLayoutArea;->isEmptyArea()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-gtz v1, :cond_0

    invoke-static {p1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 319
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/RootLayoutArea;->setEmptyArea(Z)V

    .line 321
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/renderer/RootRenderer;->processRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;)V

    .line 324
    .end local v0    # "resultRendererHeight":F
    :cond_2
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->immediateFlush:Z

    if-nez v0, :cond_3

    .line 325
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 327
    :cond_3
    return-void
.end method

.method protected abstract updateCurrentArea(Lcom/itextpdf/layout/layout/LayoutResult;)Lcom/itextpdf/layout/layout/LayoutArea;
.end method
