.class public Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
.super Ljava/lang/Object;
.source "MarginsCollapseHandler.java"


# instance fields
.field private backupCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

.field private backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

.field private childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

.field private collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

.field private firstNotEmptyKidIndex:I

.field private lastKidCollapsedAfterHasClearanceApplied:Z

.field private prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

.field private processedChildrenNum:I

.field private renderer:Lcom/itextpdf/layout/renderer/IRenderer;

.field private rendererChildren:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V
    .locals 1
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "marginsCollapseInfo"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    .line 59
    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processedChildrenNum:I

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererChildren:Ljava/util/List;

    .line 70
    iput-object p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 71
    if-eqz p2, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-direct {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 72
    return-void
.end method

.method private addNotYetAppliedTopMargin(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 426
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    .line 427
    .local v0, "indentTop":F
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 431
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyTopMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 432
    return-void
.end method

.method private applyBottomMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V
    .locals 4
    .param p1, "box"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "bottomIndent"    # F

    .line 358
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v0

    sub-float v0, p2, v0

    .line 359
    .local v0, "bottomIndentLeftovers":F
    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    .line 363
    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 359
    if-gez v2, :cond_0

    .line 360
    invoke-virtual {v3, p2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnBottom(F)V

    .line 361
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    neg-float v2, v0

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    goto :goto_0

    .line 363
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnBottom(F)V

    .line 364
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 365
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    add-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 366
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    sub-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 368
    :goto_0
    return-void
.end method

.method private applySelfCollapsedKidMarginWithClearance(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 446
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    .line 447
    .local v0, "clearedKidMarginWithClearance":F
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 448
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 449
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 451
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 452
    return-void
.end method

.method private applyTopMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V
    .locals 5
    .param p1, "box"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "topIndent"    # F

    .line 338
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v0

    sub-float/2addr v0, p2

    .line 339
    .local v0, "bufferLeftoversOnTop":F
    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_0

    move v2, p2

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v2

    .line 340
    .local v2, "usedTopBuffer":F
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnTop(F)V

    .line 341
    invoke-direct {p0, v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->subtractUsedTopBufferFromBottomBuffer(F)V

    .line 343
    cmpl-float v3, v0, v1

    .line 347
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 343
    if-ltz v3, :cond_1

    .line 344
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 345
    invoke-virtual {p1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_1

    .line 347
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v3

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 348
    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 349
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 351
    :goto_1
    return-void
.end method

.method private createMarginsInfoForBlockChild(I)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .locals 7
    .param p1, "childIndex"    # I

    .line 116
    const/4 v0, 0x0

    .line 118
    .local v0, "ignoreChildTopMargin":Z
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    .line 119
    .local v1, "ignoreChildBottomMargin":Z
    iget v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    if-ne p1, v2, :cond_0

    .line 120
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    .line 124
    :cond_0
    if-nez p1, :cond_2

    .line 125
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v2

    .line 126
    .local v2, "parentCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    if-eqz v0, :cond_1

    move-object v3, v2

    goto :goto_0

    :cond_1
    new-instance v3, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    .line 127
    .end local v2    # "parentCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .local v3, "childCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :goto_0
    goto :goto_2

    .line 128
    .end local v3    # "childCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v2

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    .line 129
    .local v2, "prevChildCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :goto_1
    if-eqz v2, :cond_4

    move-object v3, v2

    goto :goto_2

    :cond_4
    new-instance v3, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    .line 132
    .end local v2    # "prevChildCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .restart local v3    # "childCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :goto_2
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->clone()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v2

    .line 133
    .local v2, "parentCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    if-eqz v1, :cond_5

    move-object v4, v2

    goto :goto_3

    :cond_5
    new-instance v4, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    .line 134
    .local v4, "childCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :goto_3
    new-instance v5, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-direct {v5, v0, v1, v3, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;-><init>(ZZLcom/itextpdf/layout/margincollapse/MarginsCollapse;Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 135
    .local v5, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    if-eqz v0, :cond_6

    iget v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    if-ne p1, v6, :cond_6

    .line 136
    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 138
    :cond_6
    if-eqz v1, :cond_7

    .line 139
    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 141
    :cond_7
    return-object v5
.end method

.method private static defineBottomMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;)F
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 563
    const/16 v0, 0x2b

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->defineMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;I)F

    move-result v0

    return v0
.end method

.method private static defineMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;I)F
    .locals 4
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I

    .line 575
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 576
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 577
    const-class v1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 578
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 579
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 578
    const-string v3, "Property {0} in percents is not supported"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 581
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    if-eqz v0, :cond_1

    instance-of v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static defineTopMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;)F
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 551
    const/16 v0, 0x2e

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->defineMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;I)F

    move-result v0

    return v0
.end method

.method private static firstChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "parent"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 477
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isRendererCreateBfc(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_0

    .line 479
    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasTopBorders(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasTopPadding(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 477
    :goto_0
    return v0
.end method

.method private fixPrevChildOccupiedArea(I)V
    .locals 7
    .param p1, "childIndex"    # I

    .line 399
    add-int/lit8 v0, p1, -0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->getRendererChild(I)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    .line 401
    .local v0, "prevRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 403
    .local v1, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginBottom()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 404
    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move v2, v4

    goto :goto_0

    :cond_1
    move v2, v3

    .line 406
    .local v2, "prevChildHasAppliedCollapseAfter":Z
    :goto_0
    if-eqz v2, :cond_2

    .line 407
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v5

    .line 408
    .local v5, "bottomMargin":F
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    sub-float/2addr v6, v5

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 409
    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 410
    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->ignoreModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 413
    .end local v5    # "bottomMargin":F
    :cond_2
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->getRendererChild(I)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    invoke-static {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->isBlockElement(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v5

    xor-int/2addr v5, v4

    .line 414
    .local v5, "isNotBlockChild":Z
    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v6

    if-nez v6, :cond_4

    :cond_3
    move v3, v4

    .line 415
    .local v3, "prevChildCanApplyCollapseAfter":Z
    :cond_4
    if-eqz v5, :cond_5

    if-eqz v3, :cond_5

    .line 416
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v4

    .line 417
    .local v4, "ownCollapsedMargins":F
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    add-float/2addr v6, v4

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 418
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 419
    invoke-static {v0, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 421
    .end local v4    # "ownCollapsedMargins":F
    :cond_5
    return-void
.end method

.method private getRendererChild(I)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1
    .param p1, "index"    # I

    .line 455
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererChildren:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    return-object v0
.end method

.method private getRidOfCollapseArtifactsAtopOccupiedArea()V
    .locals 2

    .line 463
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 464
    .local v0, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 465
    return-void
.end method

.method private static hasBorders(Lcom/itextpdf/layout/renderer/IRenderer;I)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I

    .line 599
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    .line 600
    .local v0, "modelElement":Lcom/itextpdf/layout/IPropertyContainer;
    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->hasProperty(I)Z

    move-result v1

    if-nez v1, :cond_1

    const/16 v1, 0x9

    invoke-interface {v0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method private static hasBottomBorders(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 539
    const/16 v0, 0xa

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasBorders(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    return v0
.end method

.method private static hasBottomPadding(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 531
    const/16 v0, 0x2f

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasPadding(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    return v0
.end method

.method private static hasHeightProp(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 494
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    const/16 v1, 0x1b

    invoke-interface {v0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->hasProperty(I)Z

    move-result v0

    return v0
.end method

.method private static hasPadding(Lcom/itextpdf/layout/renderer/IRenderer;I)Z
    .locals 4
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I

    .line 589
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 590
    .local v0, "padding":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 591
    const-class v1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 592
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 593
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 592
    const-string v3, "Property {0} in percents is not supported"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 595
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static hasPositiveHeight(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 514
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 516
    .local v0, "height":F
    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_2

    .line 517
    const/16 v2, 0x1b

    invoke-interface {p0, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 518
    .local v2, "heightPropVal":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v3, 0x55

    invoke-interface {p0, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/UnitValue;

    .line 519
    .local v3, "minHeightPropVal":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v3, :cond_0

    .line 520
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    .line 521
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    goto :goto_0

    :cond_1
    move v4, v1

    :goto_0
    move v0, v4

    .line 523
    .end local v2    # "heightPropVal":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "minHeightPropVal":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_2
    cmpl-float v1, v0, v1

    if-lez v1, :cond_3

    const/4 v1, 0x1

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method private static hasTopBorders(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 535
    const/16 v0, 0xd

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasBorders(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    return v0
.end method

.method private static hasTopPadding(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 527
    const/16 v0, 0x32

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasPadding(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    return v0
.end method

.method private static ignoreModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 567
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 568
    return-void
.end method

.method private static ignoreModelTopMargin(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 555
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelTopMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 556
    return-void
.end method

.method private static isBlockElement(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 489
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

.method private static lastChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "parent"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 483
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isRendererCreateBfc(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_0

    .line 485
    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasBottomBorders(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasBottomPadding(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasHeightProp(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 483
    :goto_0
    return v0
.end method

.method private static marginsCouldBeSelfCollapsing(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 468
    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_1

    .line 469
    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererIsFloated(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 470
    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasBottomBorders(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasTopBorders(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 471
    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasBottomPadding(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasTopPadding(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->hasPositiveHeight(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 473
    invoke-static {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->isBlockElement(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 468
    :goto_0
    return v0
.end method

.method private static overrideModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "collapsedMargins"    # F

    .line 571
    const/16 v0, 0x2b

    invoke-static {p0, v0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelMargin(Lcom/itextpdf/layout/renderer/IRenderer;IF)V

    .line 572
    return-void
.end method

.method private static overrideModelMargin(Lcom/itextpdf/layout/renderer/IRenderer;IF)V
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I
    .param p2, "collapsedMargins"    # F

    .line 585
    invoke-static {p2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-interface {p0, p1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 586
    return-void
.end method

.method private static overrideModelTopMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "collapsedMargins"    # F

    .line 559
    const/16 v0, 0x2e

    invoke-static {p0, v0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelMargin(Lcom/itextpdf/layout/renderer/IRenderer;IF)V

    .line 560
    return-void
.end method

.method private prepareBoxForLayoutAttempt(Lcom/itextpdf/kernel/geom/Rectangle;IZ)V
    .locals 6
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "childIndex"    # I
    .param p3, "childIsBlockElement"    # Z

    .line 288
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 289
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginBottom()Z

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 290
    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v3

    .line 291
    .local v0, "prevChildHasAppliedCollapseAfter":Z
    :goto_0
    if-eqz v0, :cond_2

    .line 292
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v5

    add-float/2addr v4, v5

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 295
    :cond_2
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    move v2, v3

    .line 296
    .local v2, "prevChildCanApplyCollapseAfter":Z
    :cond_4
    :goto_1
    if-nez p3, :cond_7

    if-eqz v2, :cond_7

    .line 297
    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v3

    .line 298
    .local v3, "ownCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    if-nez v3, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v1

    .line 299
    .local v1, "ownCollapsedMargins":F
    :goto_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    sub-float/2addr v4, v1

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_3

    .line 301
    .end local v0    # "prevChildHasAppliedCollapseAfter":Z
    .end local v1    # "ownCollapsedMargins":F
    .end local v2    # "prevChildCanApplyCollapseAfter":Z
    .end local v3    # "ownCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :cond_6
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    if-le p2, v0, :cond_7

    .line 302
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 305
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getUsedBufferSpaceOnBottom()F

    move-result v2

    sub-float/2addr v0, v2

    .line 306
    .local v0, "bottomIndent":F
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getUsedBufferSpaceOnBottom()F

    move-result v4

    add-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 307
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnBottom(F)V

    .line 308
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    sub-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 309
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_4

    .line 301
    .end local v0    # "bottomIndent":F
    :cond_7
    :goto_3
    nop

    .line 314
    :cond_8
    :goto_4
    if-nez p3, :cond_a

    .line 315
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    if-ne p2, v0, :cond_9

    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 316
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    .line 317
    .local v0, "topIndent":F
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyTopMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 321
    .end local v0    # "topIndent":F
    :cond_9
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 322
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    .line 323
    .local v0, "bottomIndent":F
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyBottomMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 326
    .end local v0    # "bottomIndent":F
    :cond_a
    return-void
.end method

.method private processUsedChildBufferSpaceOnTop(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 3
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 371
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getUsedBufferSpaceOnTop()F

    move-result v0

    .line 372
    .local v0, "childUsedBufferSpaceOnTop":F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 373
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    .line 374
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v0

    .line 377
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v2

    sub-float/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 378
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnTop(F)V

    .line 381
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 383
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->subtractUsedTopBufferFromBottomBuffer(F)V

    .line 385
    :cond_1
    return-void
.end method

.method private removeRendererChild(I)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1
    .param p1, "index"    # I

    .line 459
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererChildren:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    return-object v0
.end method

.method private static rendererIsFloated(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 543
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 544
    return v0

    .line 546
    :cond_0
    const/16 v1, 0x63

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 547
    .local v1, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    if-eqz v1, :cond_1

    sget-object v2, Lcom/itextpdf/layout/properties/FloatPropertyValue;->NONE:Lcom/itextpdf/layout/properties/FloatPropertyValue;

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/properties/FloatPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method private restoreLayoutBoxAfterFailedLayoutAttempt(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 329
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 330
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 331
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->copyTo(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    .line 333
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 334
    iput-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 335
    return-void
.end method

.method private subtractUsedTopBufferFromBottomBuffer(F)V
    .locals 2
    .param p1, "usedTopBuffer"    # F

    .line 388
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v1

    cmpl-float v0, v0, v1

    .line 394
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 388
    if-lez v0, :cond_1

    .line 389
    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v0

    sub-float/2addr v0, p1

    .line 390
    .local v0, "bufferLeftoversOnTop":F
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_0

    .line 391
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 393
    .end local v0    # "bufferLeftoversOnTop":F
    :cond_0
    goto :goto_0

    .line 394
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v0

    sub-float/2addr v0, p1

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 396
    :goto_0
    return-void
.end method

.method private updateCollapseBeforeIfPrevKidIsFirstAndSelfCollapsed(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V
    .locals 1
    .param p1, "collapseAfter"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 281
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 285
    :cond_0
    return-void
.end method


# virtual methods
.method public applyClearance(F)V
    .locals 2
    .param p1, "clearHeightCorrection"    # F

    .line 111
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setClearanceApplied(Z)V

    .line 112
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(F)V

    .line 113
    return-void
.end method

.method public endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 5
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 150
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processedChildrenNum:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 151
    .local v0, "childIndex":I
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->getRendererChild(I)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererIsFloated(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 152
    return-void

    .line 155
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 156
    iget v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    if-ne v2, v0, :cond_1

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 157
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    .line 159
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v4

    if-eqz v4, :cond_2

    move v4, v1

    goto :goto_0

    :cond_2
    move v4, v3

    :goto_0
    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setSelfCollapsing(Z)V

    .line 161
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isClearanceApplied()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    move v1, v3

    :goto_1
    iput-boolean v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastKidCollapsedAfterHasClearanceApplied:Z

    goto :goto_2

    .line 163
    :cond_4
    iput-boolean v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastKidCollapsedAfterHasClearanceApplied:Z

    .line 164
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setSelfCollapsing(Z)V

    .line 167
    :goto_2
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    if-eqz v1, :cond_5

    .line 168
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->fixPrevChildOccupiedArea(I)V

    .line 170
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->updateCollapseBeforeIfPrevKidIsFirstAndSelfCollapsed(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 173
    :cond_5
    iget v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstNotEmptyKidIndex:I

    if-ne v1, v0, :cond_6

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 174
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v1

    if-nez v1, :cond_6

    .line 175
    invoke-direct {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->getRidOfCollapseArtifactsAtopOccupiedArea()V

    .line 176
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    if-eqz v1, :cond_6

    .line 177
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processUsedChildBufferSpaceOnTop(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 182
    :cond_6
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iput-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 183
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 185
    iput-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 186
    iput-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 187
    return-void
.end method

.method public endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 7
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 208
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    if-eqz v0, :cond_0

    .line 209
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->restoreLayoutBoxAfterFailedLayoutAttempt(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    if-eqz v0, :cond_1

    .line 213
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->updateCollapseBeforeIfPrevKidIsFirstAndSelfCollapsed(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 216
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->marginsCouldBeSelfCollapsing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastKidCollapsedAfterHasClearanceApplied:Z

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    move v0, v2

    .line 217
    .local v0, "couldBeSelfCollapsing":Z
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v3

    .line 218
    .local v3, "blockHasNoKidsWithContent":Z
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 219
    if-eqz v3, :cond_3

    if-nez v0, :cond_3

    .line 220
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->addNotYetAppliedTopMargin(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 223
    :cond_3
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v5

    if-eqz v5, :cond_4

    if-eqz v0, :cond_4

    move v5, v1

    goto :goto_1

    :cond_4
    move v5, v2

    :goto_1
    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setSelfCollapsing(Z)V

    .line 225
    if-nez v3, :cond_5

    iget-boolean v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastKidCollapsedAfterHasClearanceApplied:Z

    if-eqz v4, :cond_5

    .line 226
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applySelfCollapsedKidMarginWithClearance(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 230
    :cond_5
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    if-eqz v4, :cond_6

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginBottom()Z

    move-result v4

    if-eqz v4, :cond_6

    iget-boolean v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastKidCollapsedAfterHasClearanceApplied:Z

    if-nez v4, :cond_6

    goto :goto_2

    :cond_6
    move v1, v2

    .line 231
    .local v1, "lastChildMarginJoinedToParent":Z
    :goto_2
    if-eqz v1, :cond_7

    .line 232
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v2

    .local v2, "ownCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    goto :goto_3

    .line 234
    .end local v2    # "ownCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :cond_7
    new-instance v2, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    .line 236
    .restart local v2    # "ownCollapseAfter":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    :goto_3
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->defineBottomMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;)F

    move-result v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(F)V

    .line 237
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setOwnCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 239
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 240
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 243
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 240
    if-eqz v4, :cond_8

    .line 241
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    goto :goto_4

    .line 243
    :cond_8
    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 244
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 246
    :goto_4
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginBottom()Z

    move-result v4

    if-nez v4, :cond_c

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v4

    if-nez v4, :cond_c

    .line 247
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v4

    .line 248
    .local v4, "collapsedMargins":F
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v5, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 249
    .end local v4    # "collapsedMargins":F
    goto :goto_5

    .line 251
    :cond_9
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    .line 252
    .local v4, "marginsCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginTop()Z

    move-result v5

    if-nez v5, :cond_a

    .line 253
    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v5

    .line 254
    .local v5, "collapsedMargins":F
    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v6, v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelTopMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 257
    .end local v5    # "collapsedMargins":F
    :cond_a
    if-eqz v1, :cond_b

    .line 258
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 260
    :cond_b
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isIgnoreOwnMarginBottom()Z

    move-result v5

    if-nez v5, :cond_c

    .line 261
    iget-object v5, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v5

    .line 262
    .restart local v5    # "collapsedMargins":F
    iget-object v6, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v6, v5}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->overrideModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 266
    .end local v4    # "marginsCollapseBefore":Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .end local v5    # "collapsedMargins":F
    :cond_c
    :goto_5
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prevChildMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    if-nez v4, :cond_d

    if-eqz v3, :cond_e

    .line 268
    :cond_d
    iget-object v4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v4

    .line 275
    .local v4, "collapsedMargins":F
    invoke-direct {p0, p1, v4}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyBottomMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 278
    .end local v4    # "collapsedMargins":F
    :cond_e
    return-void
.end method

.method public processFixedHeightAdjustment(F)V
    .locals 2
    .param p1, "heightDelta"    # F

    .line 75
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnTop()F

    move-result v1

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 76
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getBufferSpaceOnBottom()F

    move-result v1

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 77
    return-void
.end method

.method public startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .locals 4
    .param p1, "child"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 80
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 82
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->restoreLayoutBoxAfterFailedLayoutAttempt(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 83
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processedChildrenNum:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processedChildrenNum:I

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->removeRendererChild(I)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererChildren:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processedChildrenNum:I

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processedChildrenNum:I

    .line 93
    .local v0, "childIndex":I
    invoke-static {p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->rendererIsFloated(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->isBlockElement(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 95
    .local v1, "childIsBlockElement":Z
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupLayoutBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 96
    new-instance v2, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-direct {v2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;-><init>()V

    iput-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 97
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->backupCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->copyTo(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    .line 99
    invoke-direct {p0, p2, v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->prepareBoxForLayoutAttempt(Lcom/itextpdf/kernel/geom/Rectangle;IZ)V

    .line 101
    if-eqz v1, :cond_2

    .line 102
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->createMarginsInfoForBlockChild(I)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 104
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->childMarginInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    return-object v2
.end method

.method public startMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 190
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->defineTopMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(F)V

    .line 191
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->defineBottomMarginValueForCollapse(Lcom/itextpdf/layout/renderer/IRenderer;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(F)V

    .line 193
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->firstChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    .line 195
    .local v0, "topIndent":F
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyTopMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 197
    .end local v0    # "topIndent":F
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->lastChildMarginAdjoinedToParent(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 198
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->collapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->getCollapsedMarginsSize()F

    move-result v0

    .line 199
    .local v0, "bottomIndent":F
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->applyBottomMargin(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 203
    .end local v0    # "bottomIndent":F
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->ignoreModelTopMargin(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 204
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->renderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->ignoreModelBottomMargin(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 205
    return-void
.end method
