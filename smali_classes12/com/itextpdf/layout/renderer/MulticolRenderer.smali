.class public Lcom/itextpdf/layout/renderer/MulticolRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "MulticolRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;,
        Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;,
        Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;
    }
.end annotation


# static fields
.field private static final ZERO_DELTA:F = 1.0E-4f


# instance fields
.field private approximateHeight:F

.field private columnCount:I

.field private columnGap:F

.field private columnWidth:F

.field private elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

.field private heightCalculator:Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;

.field private heightFromProperties:Ljava/lang/Float;

.field private isFirstLayout:Z


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/MulticolContainer;)V
    .locals 1
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/MulticolContainer;

    .line 66
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->isFirstLayout:Z

    .line 67
    new-instance v0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;-><init>()V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->setHeightCalculator(Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;)V

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/itextpdf/layout/renderer/MulticolRenderer;)F
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/layout/renderer/MulticolRenderer;

    .line 47
    iget v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnWidth:F

    return v0
.end method

.method static synthetic access$100(Lcom/itextpdf/layout/renderer/MulticolRenderer;)F
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/layout/renderer/MulticolRenderer;

    .line 47
    iget v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    return v0
.end method

.method private applyWidth(Lcom/itextpdf/kernel/geom/Rectangle;F)V
    .locals 4
    .param p1, "parentBbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "originalWidth"    # F

    .line 250
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v0

    .line 251
    .local v0, "blockWidth":Ljava/lang/Float;
    if-eqz v0, :cond_0

    .line 252
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 254
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v1

    .line 255
    .local v1, "minWidth":Ljava/lang/Float;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    .line 256
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 259
    .end local v1    # "minWidth":Ljava/lang/Float;
    :cond_1
    :goto_0
    return-void
.end method

.method private balanceContentAndLayoutColumns(Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    .locals 8
    .param p1, "prelayoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p2, "actualBbox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 303
    new-instance v0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;-><init>()V

    .line 304
    .local v0, "result":Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightCalculator:Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;->maxAmountOfRelayouts()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 305
    .local v1, "counter":I
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    .line 306
    .local v2, "maxHeight":F
    const/4 v3, 0x0

    .line 307
    .local v3, "isLastLayout":Z
    :goto_0
    add-int/lit8 v4, v1, -0x1

    .end local v1    # "counter":I
    .local v4, "counter":I
    if-lez v1, :cond_5

    .line 308
    iget v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 309
    const/4 v1, 0x1

    .line 310
    .end local v3    # "isLastLayout":Z
    .local v1, "isLastLayout":Z
    iput v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    move v3, v1

    .line 313
    .end local v1    # "isLastLayout":Z
    .restart local v3    # "isLastLayout":Z
    :cond_0
    iget v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    .line 314
    .local v1, "workingHeight":F
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightFromProperties:Ljava/lang/Float;

    if-eqz v5, :cond_1

    .line 315
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightFromProperties:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 317
    :cond_1
    invoke-direct {p0, p1, p2, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->layoutColumnsAndReturnOverflowRenderer(Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;F)Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    move-result-object v0

    .line 319
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    if-eqz v5, :cond_4

    if-eqz v3, :cond_2

    goto :goto_1

    .line 323
    :cond_2
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightCalculator:Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;

    invoke-interface {v5, p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;->getAdditionalHeightOfEachColumn(Lcom/itextpdf/layout/renderer/MulticolRenderer;Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    .line 324
    .local v5, "additionalHeightPerIteration":F
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v7, 0x38d1b717    # 1.0E-4f

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_3

    .line 325
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->clearOverFlowRendererIfNeeded(Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;)V

    .line 326
    return-object v0

    .line 328
    :cond_3
    iget v6, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    add-float/2addr v6, v5

    iput v6, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    .line 329
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->clearOverFlowRendererIfNeeded(Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;)V

    .line 330
    .end local v1    # "workingHeight":F
    move v1, v4

    goto :goto_0

    .line 320
    .end local v5    # "additionalHeightPerIteration":F
    .restart local v1    # "workingHeight":F
    :cond_4
    :goto_1
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->clearOverFlowRendererIfNeeded(Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;)V

    .line 321
    return-object v0

    .line 331
    .end local v1    # "workingHeight":F
    :cond_5
    return-object v0
.end method

.method private calculateColumnCountAndWidth(F)V
    .locals 9
    .param p1, "initialWidth"    # F

    .line 336
    const/16 v0, 0x8a

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 337
    .local v0, "columnCountTemp":Ljava/lang/Integer;
    const/16 v1, 0x8e

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 339
    .local v1, "columnWidthTemp":Ljava/lang/Float;
    const/16 v2, 0x8f

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    .line 340
    .local v2, "columnGapTemp":Ljava/lang/Float;
    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    :goto_0
    iput v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    .line 341
    if-nez v0, :cond_1

    if-eqz v1, :cond_8

    :cond_1
    if-eqz v0, :cond_2

    .line 342
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ltz v4, :cond_8

    :cond_2
    if-eqz v1, :cond_3

    .line 343
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v4, v4, v3

    if-ltz v4, :cond_8

    :cond_3
    iget v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    cmpg-float v4, v4, v3

    if-ltz v4, :cond_8

    .line 349
    if-nez v1, :cond_4

    .line 350
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    goto :goto_2

    .line 351
    :cond_4
    const v4, 0x38d1b717    # 1.0E-4f

    const/4 v5, 0x1

    if-nez v0, :cond_6

    .line 352
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget v7, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    add-float/2addr v6, v7

    .line 353
    .local v6, "columnWidthPlusGap":F
    cmpl-float v4, v6, v4

    if-lez v4, :cond_5

    .line 354
    iget v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    add-float/2addr v4, p1

    div-float/2addr v4, v6

    float-to-double v7, v4

    .line 355
    invoke-static {v7, v8}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    double-to-int v4, v7

    .line 354
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    goto :goto_1

    .line 357
    :cond_5
    iput v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    .line 359
    .end local v6    # "columnWidthPlusGap":F
    :goto_1
    goto :goto_2

    .line 360
    :cond_6
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget v7, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    add-float/2addr v6, v7

    .line 361
    .restart local v6    # "columnWidthPlusGap":F
    cmpl-float v4, v6, v4

    if-lez v4, :cond_7

    .line 362
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget v7, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    add-float/2addr v7, p1

    div-float/2addr v7, v6

    float-to-double v7, v7

    .line 363
    invoke-static {v7, v8}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    double-to-int v7, v7

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 362
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    goto :goto_2

    .line 365
    :cond_7
    iput v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    .line 368
    .end local v6    # "columnWidthPlusGap":F
    :goto_2
    iget v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    add-float/2addr v4, p1

    iget v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    iget v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnWidth:F

    .line 369
    return-void

    .line 346
    :cond_8
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Invalid column-count/column-width/column-gap properties, they\'re absent or have negative value"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private calculateContainerOccupiedArea(Lcom/itextpdf/layout/layout/LayoutContext;Z)Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 6
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p2, "isFull"    # Z

    .line 381
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    .line 383
    .local v0, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    iget v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    invoke-direct {p0, v1, p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->updateOccupiedHeight(FZ)F

    move-result v1

    .line 385
    .local v1, "totalHeight":F
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 386
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 387
    .local v2, "initialBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    add-float/2addr v4, v5

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 388
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-direct {p0, v3, p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->recalculateHeightWidthAfterLayouting(Lcom/itextpdf/kernel/geom/Rectangle;Z)V

    .line 389
    return-object v0
.end method

.method private clearOverFlowRendererIfNeeded(Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;)V
    .locals 2
    .param p1, "result"    # Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    .line 374
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightFromProperties:Ljava/lang/Float;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightFromProperties:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 375
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->setOverflowRenderer(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 377
    :cond_0
    return-void
.end method

.method private determineHeight(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/lang/Float;
    .locals 5
    .param p1, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 262
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v0

    .line 263
    .local v0, "height":Ljava/lang/Float;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v1

    .line 264
    .local v1, "minHeight":Ljava/lang/Float;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v2

    .line 265
    .local v2, "maxHeight":Ljava/lang/Float;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    .line 266
    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    .line 267
    move-object v0, v1

    .line 270
    :cond_1
    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    .line 271
    move-object v0, v2

    .line 273
    :cond_2
    return-object v0
.end method

.method private drawTaggedWhenNeeded(Lcom/itextpdf/layout/renderer/DrawContext;Ljava/util/function/Consumer;)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/DrawContext;",
            "Ljava/util/function/Consumer<",
            "Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;",
            ">;)V"
        }
    .end annotation

    .line 239
    .local p2, "action":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;>;"
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 240
    .local v0, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 241
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 243
    :cond_0
    invoke-interface {p2, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 244
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 245
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 247
    :cond_1
    return-void
.end method

.method private getElementsRenderer()Lcom/itextpdf/layout/renderer/BlockRenderer;
    .locals 2

    .line 420
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-eqz v0, :cond_0

    .line 423
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/BlockRenderer;

    return-object v0

    .line 421
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid child renderers, it should be one and be a block element"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private layoutColumnsAndReturnOverflowRenderer(Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;F)Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    .locals 8
    .param p1, "preLayoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p2, "actualBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "workingHeight"    # F

    .line 428
    new-instance v0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;-><init>()V

    .line 429
    .local v0, "result":Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    .line 431
    .local v1, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    if-ge v2, v3, :cond_2

    if-eqz v1, :cond_2

    .line 432
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    .line 433
    .local v3, "tempArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    iget v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnWidth:F

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 434
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4, p3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 435
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v5

    iget v6, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnWidth:F

    iget v7, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    add-float/2addr v6, v7

    int-to-float v7, v2

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 436
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    add-float/2addr v5, v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 438
    new-instance v4, Lcom/itextpdf/layout/layout/LayoutContext;

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v5

    .line 439
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v6

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v7

    invoke-direct {v4, v3, v5, v6, v7}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    .line 440
    .local v4, "columnContext":Lcom/itextpdf/layout/layout/LayoutContext;
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/16 v6, 0x59

    invoke-interface {v1, v6, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 441
    invoke-interface {v1, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v5

    .line 442
    .local v5, "tempResultColumn":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_0

    .line 443
    move-object v6, v1

    check-cast v6, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->setOverflowRenderer(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 444
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->setCauseOfNothing(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 445
    return-object v0

    .line 448
    :cond_0
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    if-nez v6, :cond_1

    .line 449
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getSplitRenderers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 451
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getSplitRenderers()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 453
    :goto_1
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    .line 431
    .end local v3    # "tempArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v4    # "columnContext":Lcom/itextpdf/layout/layout/LayoutContext;
    .end local v5    # "tempResultColumn":Lcom/itextpdf/layout/layout/LayoutResult;
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 455
    .end local v2    # "i":I
    :cond_2
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->setOverflowRenderer(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 456
    return-object v0
.end method

.method private recalculateHeightWidthAfterLayouting(Lcom/itextpdf/kernel/geom/Rectangle;Z)V
    .locals 3
    .param p1, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "isFull"    # Z

    .line 278
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->determineHeight(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/lang/Float;

    move-result-object v0

    .line 279
    .local v0, "height":Ljava/lang/Float;
    if-eqz v0, :cond_0

    .line 280
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-direct {p0, v1, p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->updateOccupiedHeight(FZ)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 281
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    sub-float/2addr v1, v2

    .line 282
    .local v1, "heightDelta":F
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 283
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 285
    .end local v1    # "heightDelta":F
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->applyWidth(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 286
    return-void
.end method

.method private safelyRetrieveFloatProperty(I)F
    .locals 2
    .param p1, "property"    # I

    .line 290
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 291
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Lcom/itextpdf/layout/properties/UnitValue;

    if-eqz v1, :cond_0

    .line 292
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    return v1

    .line 294
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/layout/borders/Border;

    if-eqz v1, :cond_1

    .line 295
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    return v1

    .line 297
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method private setOverflowForAllChildren(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 2
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 230
    if-eqz p1, :cond_2

    instance-of v0, p1, Lcom/itextpdf/layout/renderer/AreaBreakRenderer;

    if-eqz v0, :cond_0

    goto :goto_1

    .line 233
    :cond_0
    const/16 v0, 0x67

    sget-object v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->VISIBLE:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-interface {p1, v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 234
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

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

    .line 235
    .local v1, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->setOverflowForAllChildren(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 236
    .end local v1    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 237
    :cond_1
    return-void

    .line 231
    :cond_2
    :goto_1
    return-void
.end method

.method private updateOccupiedHeight(FZ)F
    .locals 3
    .param p1, "initialHeight"    # F
    .param p2, "isFull"    # Z

    .line 393
    const/16 v0, 0x9

    if-eqz p2, :cond_1

    .line 394
    const/16 v1, 0x2f

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v1

    add-float/2addr p1, v1

    .line 395
    const/16 v1, 0x2b

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v1

    add-float/2addr p1, v1

    .line 396
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->hasOwnProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 397
    :cond_0
    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v1

    add-float/2addr p1, v1

    .line 400
    :cond_1
    const/16 v1, 0x32

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v1

    add-float/2addr p1, v1

    .line 402
    const/16 v1, 0x2e

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v1

    add-float/2addr p1, v1

    .line 404
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->hasOwnProperty(I)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_3

    .line 405
    :cond_2
    const/16 v1, 0xd

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v1

    add-float/2addr p1, v1

    .line 410
    :cond_3
    if-eqz p2, :cond_4

    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->isFirstLayout:Z

    if-eqz v1, :cond_4

    const/high16 v1, 0x40000000    # 2.0f

    goto :goto_0

    :cond_4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 412
    .local v1, "TOP_AND_BOTTOM":F
    :goto_0
    if-nez p2, :cond_5

    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->isFirstLayout:Z

    if-nez v2, :cond_5

    .line 413
    const/4 v1, 0x0

    .line 415
    :cond_5
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->safelyRetrieveFloatProperty(I)F

    move-result v0

    mul-float/2addr v0, v1

    add-float/2addr p1, v0

    .line 416
    return p1
.end method


# virtual methods
.method protected createOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 3
    .param p1, "overflowedContentRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 217
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/MulticolRenderer;

    .line 218
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/MulticolRenderer;
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->isFirstLayout:Z

    .line 219
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 220
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 221
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 222
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 223
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->setChildRenderers(Ljava/util/List;)V

    .line 225
    invoke-static {v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->clearPropertiesFromOverFlowRenderer(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 226
    return-object v0
.end method

.method protected createSplitRenderer(Ljava/util/List;)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)",
            "Lcom/itextpdf/layout/renderer/AbstractRenderer;"
        }
    .end annotation

    .line 198
    .local p1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 199
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 200
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 201
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 202
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    .line 203
    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setChildRenderers(Ljava/util/List;)V

    .line 204
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 205
    invoke-static {v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->setupContinuousContainerIfNeeded(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 206
    return-object v0
.end method

.method public drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 5
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 150
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 152
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 153
    .local v0, "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->clipBorderArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result v1

    .line 154
    .local v1, "isAreaClipped":Z
    const/16 v2, 0x90

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/borders/Border;

    .line 155
    .local v2, "gap":Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    const v4, 0x38d1b717    # 1.0E-4f

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    new-instance v3, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v2, v1, p1}, Lcom/itextpdf/layout/renderer/MulticolRenderer$$ExternalSyntheticLambda0;-><init>(Lcom/itextpdf/layout/renderer/MulticolRenderer;Lcom/itextpdf/layout/borders/Border;ZLcom/itextpdf/layout/renderer/DrawContext;)V

    invoke-direct {p0, p1, v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->drawTaggedWhenNeeded(Lcom/itextpdf/layout/renderer/DrawContext;Ljava/util/function/Consumer;)V

    .line 175
    return-void

    .line 156
    :cond_1
    :goto_0
    return-void
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 136
    const-class v0, Lcom/itextpdf/layout/renderer/MulticolRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 137
    new-instance v0, Lcom/itextpdf/layout/renderer/MulticolRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/MulticolContainer;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;-><init>(Lcom/itextpdf/layout/element/MulticolContainer;)V

    return-object v0
.end method

.method synthetic lambda$drawBorder$0$com-itextpdf-layout-renderer-MulticolRenderer(Lcom/itextpdf/layout/borders/Border;ZLcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 14
    .param p1, "gap"    # Lcom/itextpdf/layout/borders/Border;
    .param p2, "isAreaClipped"    # Z
    .param p3, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p4, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 160
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 162
    .local v1, "columnBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    add-float/2addr v3, v4

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    iget v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnGap:F

    .line 163
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 164
    .local v2, "columnSpaceBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    add-float/2addr v3, v4

    invoke-virtual {p1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    div-float/2addr v4, v5

    add-float v7, v3, v4

    .line 165
    .local v7, "x1":F
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    .line 166
    .local v8, "y1":F
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    add-float v10, v3, v4

    .line 167
    .local v10, "y2":F
    sget-object v11, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    const/4 v12, 0x0

    const/4 v13, 0x0

    move v9, v7

    move-object v5, p1

    move-object/from16 v6, p4

    invoke-virtual/range {v5 .. v13}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 160
    .end local v1    # "columnBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v2    # "columnSpaceBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v7    # "x1":F
    .end local v8    # "y1":F
    .end local v10    # "y2":F
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 169
    .end local v0    # "i":I
    :cond_0
    if-eqz p2, :cond_1

    .line 170
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 172
    :cond_1
    return-void
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 12
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 84
    const/16 v0, 0x8c

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->setProperty(ILjava/lang/Object;)V

    .line 85
    invoke-direct {p0, p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->setOverflowForAllChildren(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 86
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 87
    .local v0, "actualBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    .line 88
    .local v1, "originalWidth":F
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->applyWidth(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 90
    invoke-static {p0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->setupContinuousContainerIfNeeded(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 91
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 92
    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 93
    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 94
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    invoke-direct {p0, v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->calculateColumnCountAndWidth(F)V

    .line 96
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->determineHeight(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightFromProperties:Ljava/lang/Float;

    .line 97
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-nez v3, :cond_0

    .line 100
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getElementsRenderer()Lcom/itextpdf/layout/renderer/BlockRenderer;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    .line 103
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-virtual {v3, p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 105
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->layoutInColumns(Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    move-result-object v3

    .line 107
    .local v3, "layoutResult":Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getSplitRenderers()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 108
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 109
    .local v4, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-interface {v4, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 110
    .end local v4    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 111
    :cond_1
    new-instance v6, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v9, 0x0

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v11

    const/4 v7, 0x3

    const/4 v8, 0x0

    move-object v10, p0

    invoke-direct/range {v6 .. v11}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v6

    .line 112
    :cond_2
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v4

    if-nez v4, :cond_4

    .line 113
    const/16 v2, 0x8d

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/ContinuousContainer;

    .line 115
    .local v2, "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    if-eqz v2, :cond_3

    .line 116
    invoke-virtual {v2, p0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->reApplyProperties(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 119
    :cond_3
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 120
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getSplitRenderers()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 121
    const/4 v4, 0x1

    invoke-direct {p0, p1, v4}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->calculateContainerOccupiedArea(Lcom/itextpdf/layout/layout/LayoutContext;Z)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 122
    new-instance v5, Lcom/itextpdf/layout/layout/LayoutResult;

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v7, 0x0

    invoke-direct {v5, v4, v6, p0, v7}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v5

    .line 124
    .end local v2    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    :cond_4
    invoke-direct {p0, p1, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->calculateContainerOccupiedArea(Lcom/itextpdf/layout/layout/LayoutContext;Z)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 125
    new-instance v2, Lcom/itextpdf/layout/layout/LayoutResult;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 126
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getSplitRenderers()Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->createSplitRenderer(Ljava/util/List;)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    .line 127
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->createOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v6

    const/4 v7, 0x2

    invoke-direct {v2, v7, v4, v5, v6}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 125
    return-object v2
.end method

.method protected layoutInColumns(Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    .locals 6
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p2, "actualBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 178
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->elementRenderer:Lcom/itextpdf/layout/renderer/BlockRenderer;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v2, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v3, Lcom/itextpdf/kernel/geom/Rectangle;

    iget v4, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnWidth:F

    const v5, 0x49742400    # 1000000.0f

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v1, v2}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 180
    .local v0, "inifiniteHeighOneColumnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    if-eq v1, v4, :cond_0

    .line 181
    new-instance v1, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    invoke-direct {v1}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;-><init>()V

    .line 182
    .local v1, "result":Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->setCauseOfNothing(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 183
    return-object v1

    .line 186
    .end local v1    # "result":Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    iget v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->columnCount:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->approximateHeight:F

    .line 187
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->balanceContentAndLayoutColumns(Lcom/itextpdf/layout/layout/LayoutContext;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    move-result-object v1

    return-object v1
.end method

.method public final setHeightCalculator(Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;)V
    .locals 0
    .param p1, "heightCalculator"    # Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;

    .line 76
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer;->heightCalculator:Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;

    .line 77
    return-void
.end method
