.class public Lcom/itextpdf/layout/renderer/TabRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "TabRenderer.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Tab;)V
    .locals 0
    .param p1, "tab"    # Lcom/itextpdf/layout/element/Tab;

    .line 47
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 48
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 4
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 65
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TabRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-nez v0, :cond_0

    .line 66
    const-class v0, Lcom/itextpdf/layout/renderer/TabRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 67
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Drawing won\'t be performed."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Occupied area has not been initialized. {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 69
    return-void

    .line 71
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/16 v0, 0x44

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TabRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 72
    .local v0, "leader":Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;
    if-nez v0, :cond_1

    .line 73
    return-void

    .line 75
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v1

    .line 76
    .local v1, "isTagged":Z
    if-eqz v1, :cond_2

    .line 77
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 80
    :cond_2
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TabRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 81
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TabRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 82
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TabRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 84
    if-eqz v1, :cond_3

    .line 85
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 87
    :cond_3
    return-void
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 102
    const-class v0, Lcom/itextpdf/layout/renderer/TabRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TabRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 103
    new-instance v0, Lcom/itextpdf/layout/renderer/TabRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TabRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/Tab;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/TabRenderer;-><init>(Lcom/itextpdf/layout/element/Tab;)V

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 10
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 52
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    .line 53
    .local v0, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TabRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v1

    .line 54
    .local v1, "width":Ljava/lang/Float;
    const/16 v2, 0x55

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/TabRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 55
    .local v2, "height":Lcom/itextpdf/layout/properties/UnitValue;
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v4

    new-instance v5, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 56
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v7

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    add-float/2addr v7, v8

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v3, p0, Lcom/itextpdf/layout/renderer/TabRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 58
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 60
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutResult;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TabRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-direct {v3, v6, v4, v5, v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v3
.end method
