.class public Lcom/itextpdf/layout/element/Div;
.super Lcom/itextpdf/layout/element/BlockElement;
.source "Div.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/BlockElement<",
        "Lcom/itextpdf/layout/element/Div;",
        ">;"
    }
.end annotation


# instance fields
.field protected tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/element/Div;
    .locals 1
    .param p1, "areaBreak"    # Lcom/itextpdf/layout/element/AreaBreak;

    .line 72
    iget-object v0, p0, Lcom/itextpdf/layout/element/Div;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    return-object p0
.end method

.method public add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/element/Div;
    .locals 1
    .param p1, "element"    # Lcom/itextpdf/layout/element/IBlockElement;

    .line 50
    iget-object v0, p0, Lcom/itextpdf/layout/element/Div;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    return-object p0
.end method

.method public add(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/Div;
    .locals 1
    .param p1, "element"    # Lcom/itextpdf/layout/element/Image;

    .line 61
    iget-object v0, p0, Lcom/itextpdf/layout/element/Div;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    return-object p0
.end method

.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/itextpdf/layout/element/Div;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    const-string v1, "Div"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Div;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Div;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 110
    new-instance v0, Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/DivRenderer;-><init>(Lcom/itextpdf/layout/element/Div;)V

    return-object v0
.end method

.method public setFillAvailableArea(Z)Lcom/itextpdf/layout/element/Div;
    .locals 2
    .param p1, "fillArea"    # Z

    .line 92
    const/16 v0, 0x56

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 93
    return-object p0
.end method

.method public setFillAvailableAreaOnSplit(Z)Lcom/itextpdf/layout/element/Div;
    .locals 2
    .param p1, "fillAreaOnSplit"    # Z

    .line 104
    const/16 v0, 0x57

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 105
    return-object p0
.end method
