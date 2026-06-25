.class public Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;
.super Ljava/lang/Object;
.source "BlockFormattingContextUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isAbsolutePosition(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 66
    const/16 v0, 0x34

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/NumberUtil;->asInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    .line 67
    .local v0, "positioning":Ljava/lang/Integer;
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private static isCaption(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 76
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/DivRenderer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isFixedPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 71
    const/16 v0, 0x34

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/NumberUtil;->asInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    .line 72
    .local v0, "positioning":Ljava/lang/Integer;
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private static isInlineBlock(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 61
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-eqz v0, :cond_1

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isRendererCreateBfc(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 48
    instance-of v0, p0, Lcom/itextpdf/layout/renderer/RootRenderer;

    if-nez v0, :cond_1

    instance-of v0, p0, Lcom/itextpdf/layout/renderer/CellRenderer;

    if-nez v0, :cond_1

    .line 50
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isInlineBlock(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 51
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    if-nez v0, :cond_1

    .line 52
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 53
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isAbsolutePosition(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 54
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isFixedPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 55
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isCaption(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 56
    const/16 v1, 0x67

    invoke-static {v0, p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 57
    const/16 v1, 0x68

    invoke-static {v0, p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 48
    :goto_1
    return v0
.end method
