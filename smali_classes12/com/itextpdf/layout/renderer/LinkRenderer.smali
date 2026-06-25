.class public Lcom/itextpdf/layout/renderer/LinkRenderer;
.super Lcom/itextpdf/layout/renderer/TextRenderer;
.source "LinkRenderer.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Link;)V
    .locals 1
    .param p1, "link"    # Lcom/itextpdf/layout/element/Link;

    .line 41
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Link;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/renderer/LinkRenderer;-><init>(Lcom/itextpdf/layout/element/Link;Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/element/Link;Ljava/lang/String;)V
    .locals 0
    .param p1, "linkElement"    # Lcom/itextpdf/layout/element/Link;
    .param p2, "text"    # Ljava/lang/String;

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;Ljava/lang/String;)V

    .line 53
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 3
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 57
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LinkRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-nez v0, :cond_0

    .line 58
    const-class v0, Lcom/itextpdf/layout/renderer/LinkRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 59
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Drawing won\'t be performed."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Occupied area has not been initialized. {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 61
    return-void

    .line 63
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/TextRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/LinkRenderer;->isRelativePosition()Z

    move-result v0

    .line 66
    .local v0, "isRelativePosition":Z
    if-eqz v0, :cond_1

    .line 67
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/LinkRenderer;->applyRelativePositioningTranslation(Z)V

    .line 71
    :cond_1
    return-void
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 86
    const-class v0, Lcom/itextpdf/layout/renderer/LinkRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/LinkRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 87
    new-instance v0, Lcom/itextpdf/layout/renderer/LinkRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/LinkRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/Link;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/LinkRenderer;-><init>(Lcom/itextpdf/layout/element/Link;)V

    return-object v0
.end method
