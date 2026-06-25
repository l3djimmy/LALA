.class Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper;
.super Ljava/lang/Object;
.source "OrphansWidowsLayoutHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attemptLayout(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .param p1, "originalContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p2, "attemptArea"    # Lcom/itextpdf/layout/layout/LayoutArea;

    .line 124
    new-instance v0, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;-><init>(Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$1;)V

    .line 126
    .local v0, "attemptResult":Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;
    const/4 v1, 0x0

    .line 127
    .local v1, "copiedMarginsCollapseInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 128
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->createDeepCopy(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v1

    .line 130
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 131
    .local v2, "attemptFloatRectsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v4

    invoke-direct {v3, p2, v1, v2, v4}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    .line 133
    .local v3, "attemptContext":Lcom/itextpdf/layout/layout/LayoutContext;
    iput-object v3, v0, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptContext:Lcom/itextpdf/layout/layout/LayoutContext;

    .line 134
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->directLayout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 135
    return-object v0
.end method

.method private static handleAttemptAsSuccessful(Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 2
    .param p0, "attemptResult"    # Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;
    .param p1, "originalContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 139
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 140
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptContext:Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 141
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptContext:Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->updateFromCopy(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    return-object v0
.end method

.method static orphansWidowsAwareLayout(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/layout/properties/ParagraphOrphansControl;Lcom/itextpdf/layout/properties/ParagraphWidowsControl;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 21
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .param p1, "context"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p2, "orphansControl"    # Lcom/itextpdf/layout/properties/ParagraphOrphansControl;
    .param p3, "widowsControl"    # Lcom/itextpdf/layout/properties/ParagraphWidowsControl;

    .line 41
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper;->attemptLayout(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;

    move-result-object v4

    .line 43
    .local v4, "layoutAttempt":Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v5

    if-nez v5, :cond_d

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isPositioned()Z

    move-result v5

    if-nez v5, :cond_d

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 44
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_d

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    if-nez v5, :cond_0

    goto/16 :goto_4

    .line 48
    :cond_0
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    .line 49
    .local v5, "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    const/4 v6, 0x1

    if-eqz v2, :cond_1

    if-eqz v5, :cond_1

    .line 50
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->getMinOrphans()I

    move-result v8

    if-ge v7, v8, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isFirstOnRootArea()Z

    move-result v7

    if-nez v7, :cond_1

    move v7, v6

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    .line 51
    .local v7, "orphansViolation":Z
    :goto_0
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v9, 0x1a

    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 52
    .local v8, "forcedPlacement":Z
    if-eqz v7, :cond_2

    if-eqz v8, :cond_2

    .line 53
    const-string v9, "Ignored orphans constraint due to forced placement."

    invoke-virtual {v2, v5, v9}, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->handleViolatedOrphans(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Ljava/lang/String;)V

    .line 56
    :cond_2
    if-eqz v7, :cond_3

    if-nez v8, :cond_3

    .line 57
    const/4 v4, 0x0

    move-object/from16 v19, v5

    goto/16 :goto_3

    .line 58
    :cond_3
    if-eqz v3, :cond_b

    if-eqz v5, :cond_b

    iget-object v9, v4, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    if-eqz v9, :cond_b

    .line 59
    iget-object v9, v4, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;->attemptResult:Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    .line 64
    .local v9, "overflowRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    const/16 v10, 0xdac

    .line 66
    .local v10, "simulationHeight":I
    new-instance v11, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v12

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    int-to-float v14, v10

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 74
    .local v11, "simulationArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v12, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-direct {v12, v11}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    .line 76
    .local v12, "simulationContext":Lcom/itextpdf/layout/layout/LayoutContext;
    invoke-virtual {v9, v12}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->directLayout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v13

    .line 78
    .local v13, "simulationResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v14

    if-ne v14, v6, :cond_a

    .line 86
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->getMinWidows()I

    move-result v14

    invoke-virtual {v9}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v15

    sub-int/2addr v14, v15

    .line 87
    .local v14, "extraWidows":I
    if-lez v14, :cond_9

    .line 88
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->getMinOrphans()I

    move-result v15

    invoke-static {v15, v6}, Ljava/lang/Math;->max(II)I

    move-result v15

    goto :goto_1

    :cond_4
    move v15, v6

    .line 89
    .local v15, "extraLinesToMove":I
    :goto_1
    move/from16 v16, v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->getMaxLinesToMove()I

    move-result v6

    if-gt v14, v6, :cond_5

    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v14

    if-lt v6, v15, :cond_5

    .line 90
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    add-int/lit8 v2, v17, -0x1

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 91
    .local v2, "lastLine":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v17

    sub-int v17, v17, v14

    move-object/from16 v18, v2

    .end local v2    # "lastLine":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v18, "lastLine":Lcom/itextpdf/layout/renderer/LineRenderer;
    add-int/lit8 v2, v17, -0x1

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 92
    .local v2, "lastLineToLeave":Lcom/itextpdf/layout/renderer/LineRenderer;
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v6

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/renderer/LineRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v16

    sub-float v6, v6, v16

    const v16, 0x38d1b717    # 1.0E-4f

    sub-float v6, v6, v16

    .line 94
    .local v6, "d":F
    move-object/from16 v16, v2

    .end local v2    # "lastLineToLeave":Lcom/itextpdf/layout/renderer/LineRenderer;
    .local v16, "lastLineToLeave":Lcom/itextpdf/layout/renderer/LineRenderer;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v17

    move-object/from16 v19, v5

    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .local v19, "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 95
    .local v2, "smallerBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 96
    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 98
    new-instance v5, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v17

    move/from16 v20, v6

    .end local v6    # "d":F
    .local v20, "d":F
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v6

    invoke-direct {v5, v6, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 100
    .local v5, "smallerAvailableArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-static {v0, v1, v5}, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper;->attemptLayout(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;

    move-result-object v4

    .line 101
    .end local v2    # "smallerBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "smallerAvailableArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v16    # "lastLineToLeave":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v18    # "lastLine":Lcom/itextpdf/layout/renderer/LineRenderer;
    .end local v20    # "d":F
    goto :goto_3

    .line 89
    .end local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .local v5, "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    :cond_5
    move-object/from16 v19, v5

    .line 102
    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    if-nez v8, :cond_7

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->isFirstOnRootArea()Z

    move-result v2

    if-nez v2, :cond_7

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->isOverflowOnWidowsViolation()Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_2

    .line 109
    :cond_6
    const/4 v4, 0x0

    goto :goto_3

    .line 103
    :cond_7
    :goto_2
    if-eqz v8, :cond_8

    .line 104
    const-string v2, "forced placement"

    invoke-virtual {v3, v9, v2}, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->handleViolatedWidows(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Ljava/lang/String;)V

    goto :goto_3

    .line 106
    :cond_8
    const-string v2, "inability to fix it"

    invoke-virtual {v3, v9, v2}, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->handleViolatedWidows(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Ljava/lang/String;)V

    goto :goto_3

    .line 87
    .end local v15    # "extraLinesToMove":I
    .end local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    :cond_9
    move-object/from16 v19, v5

    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    goto :goto_3

    .line 78
    .end local v14    # "extraWidows":I
    .end local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    :cond_a
    move-object/from16 v19, v5

    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    goto :goto_3

    .line 58
    .end local v9    # "overflowRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .end local v10    # "simulationHeight":I
    .end local v11    # "simulationArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v12    # "simulationContext":Lcom/itextpdf/layout/layout/LayoutContext;
    .end local v13    # "simulationResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    :cond_b
    move-object/from16 v19, v5

    .line 116
    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .restart local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    :goto_3
    if-eqz v4, :cond_c

    .line 117
    invoke-static {v4, v1}, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper;->handleAttemptAsSuccessful(Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v2

    return-object v2

    .line 119
    :cond_c
    new-instance v2, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-direct {v2, v5, v6, v6, v0}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v2

    .line 45
    .end local v7    # "orphansViolation":Z
    .end local v8    # "forcedPlacement":Z
    .end local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    :cond_d
    :goto_4
    invoke-static {v4, v1}, Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper;->handleAttemptAsSuccessful(Lcom/itextpdf/layout/renderer/OrphansWidowsLayoutHelper$OrphansWidowsLayoutAttempt;Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v2

    return-object v2
.end method
