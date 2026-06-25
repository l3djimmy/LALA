.class public Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;
.super Lcom/itextpdf/layout/renderer/BlockRenderer;
.source "LineSeparatorRenderer.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/LineSeparator;)V
    .locals 0
    .param p1, "lineSeparator"    # Lcom/itextpdf/layout/element/LineSeparator;

    .line 42
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 43
    return-void
.end method


# virtual methods
.method public drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 5
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 98
    const/16 v0, 0x23

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 99
    .local v0, "lineDrawer":Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;
    if-eqz v0, :cond_1

    .line 100
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 101
    .local v1, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v2

    .line 102
    .local v2, "isTagged":Z
    if-eqz v2, :cond_0

    .line 103
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 106
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 107
    .local v3, "area":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 108
    invoke-interface {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 110
    if-eqz v2, :cond_1

    .line 111
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 114
    .end local v1    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v2    # "isTagged":Z
    .end local v3    # "area":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_1
    return-void
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 90
    new-instance v0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/LineSeparator;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;-><init>(Lcom/itextpdf/layout/element/LineSeparator;)V

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 10
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 50
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 51
    .local v6, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/16 v0, 0x37

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 52
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    const v2, 0x49742400    # 1000000.0f

    sub-float v1, v2, v1

    invoke-virtual {v6, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 55
    :cond_0
    const/16 v1, 0x23

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 56
    .local v7, "lineDrawer":Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;
    if-eqz v7, :cond_1

    invoke-interface {v7}, Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;->getLineWidth()F

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    move v8, v1

    .line 58
    .local v8, "height":F
    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 59
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 61
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v1

    .line 62
    .local v1, "calculatedWidth":Ljava/lang/Float;
    if-nez v1, :cond_2

    .line 63
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    move-object v9, v1

    goto :goto_1

    .line 62
    :cond_2
    move-object v9, v1

    .line 65
    .end local v1    # "calculatedWidth":Ljava/lang/Float;
    .local v9, "calculatedWidth":Ljava/lang/Float;
    :goto_1
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    cmpg-float v1, v1, v8

    const/16 v2, 0x1a

    if-ltz v1, :cond_3

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpg-float v1, v1, v3

    if-gez v1, :cond_4

    :cond_3
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->hasOwnProperty(I)Z

    move-result v1

    if-nez v1, :cond_4

    .line 66
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object v5, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0

    .line 69
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    sub-float/2addr v3, v8

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 71
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 73
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 74
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->applyRotationLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 75
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->isNotFittingLayoutArea(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 76
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 77
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object v5, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0

    .line 82
    :cond_5
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LineSeparatorRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v2, 0x0

    invoke-direct {v0, v3, v1, p0, v2}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0
.end method
