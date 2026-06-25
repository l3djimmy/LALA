.class public abstract Lcom/itextpdf/layout/element/AbstractElement;
.super Lcom/itextpdf/layout/ElementPropertyContainer;
.source "AbstractElement.java"

# interfaces
.implements Lcom/itextpdf/layout/element/IAbstractElement;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/itextpdf/layout/element/IElement;",
        ">",
        "Lcom/itextpdf/layout/ElementPropertyContainer<",
        "TT;>;",
        "Lcom/itextpdf/layout/element/IAbstractElement;"
    }
.end annotation


# instance fields
.field protected childElements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/IElement;",
            ">;"
        }
    .end annotation
.end field

.field protected nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

.field protected styles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/layout/Style;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/layout/ElementPropertyContainer;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->childElements:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addStyle(Lcom/itextpdf/layout/Style;)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "style"    # Lcom/itextpdf/layout/Style;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/Style;",
            ")TT;"
        }
    .end annotation

    .line 115
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    if-eqz p1, :cond_1

    .line 118
    iget-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 119
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 122
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0

    .line 116
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Style can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 4

    .line 65
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/AbstractElement;->getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    .line 66
    .local v0, "rendererRoot":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->childElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/IElement;

    .line 67
    .local v2, "child":Lcom/itextpdf/layout/element/IElement;
    invoke-interface {v2}, Lcom/itextpdf/layout/element/IElement;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 68
    .end local v2    # "child":Lcom/itextpdf/layout/element/IElement;
    goto :goto_0

    .line 69
    :cond_0
    return-object v0
.end method

.method public getChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/IElement;",
            ">;"
        }
    .end annotation

    .line 132
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->childElements:Ljava/util/List;

    return-object v0
.end method

.method public getProperty(I)Ljava/lang/Object;
    .locals 5
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 88
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    invoke-super {p0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 89
    .local v0, "result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-lez v1, :cond_2

    if-nez v0, :cond_2

    invoke-super {p0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->hasProperty(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 90
    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/Style;

    .line 91
    .local v2, "style":Lcom/itextpdf/layout/Style;
    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    .line 92
    .local v3, "foundInStyle":Ljava/lang/Object;, "TT1;"
    if-nez v3, :cond_0

    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/Style;->hasProperty(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 93
    :cond_0
    move-object v0, v3

    .line 95
    .end local v2    # "style":Lcom/itextpdf/layout/Style;
    .end local v3    # "foundInStyle":Ljava/lang/Object;, "TT1;"
    :cond_1
    goto :goto_0

    .line 97
    :cond_2
    return-object v0
.end method

.method public getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 50
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 52
    .local v0, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 53
    return-object v0

    .line 55
    .end local v0    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/AbstractElement;->makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    return-object v0
.end method

.method public hasProperty(I)Z
    .locals 4
    .param p1, "property"    # I

    .line 74
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    invoke-super {p0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->hasProperty(I)Z

    move-result v0

    .line 75
    .local v0, "hasProperty":Z
    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-lez v1, :cond_1

    if-nez v0, :cond_1

    .line 76
    iget-object v1, p0, Lcom/itextpdf/layout/element/AbstractElement;->styles:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/Style;

    .line 77
    .local v2, "style":Lcom/itextpdf/layout/Style;
    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/Style;->hasProperty(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 78
    const/4 v0, 0x1

    .line 79
    goto :goto_1

    .line 81
    .end local v2    # "style":Lcom/itextpdf/layout/Style;
    :cond_0
    goto :goto_0

    .line 83
    :cond_1
    :goto_1
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 141
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/element/AbstractElement;->childElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected abstract makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
.end method

.method public setAction(Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/action/PdfAction;",
            ")TT;"
        }
    .end annotation

    .line 153
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/AbstractElement;->setProperty(ILjava/lang/Object;)V

    .line 154
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setNextRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 0
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 60
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    iput-object p1, p0, Lcom/itextpdf/layout/element/AbstractElement;->nextRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 61
    return-void
.end method

.method public setPageNumber(I)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "pageNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 168
    .local p0, "this":Lcom/itextpdf/layout/element/AbstractElement;, "Lcom/itextpdf/layout/element/AbstractElement<TT;>;"
    const/16 v0, 0x33

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/AbstractElement;->setProperty(ILjava/lang/Object;)V

    .line 169
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method
