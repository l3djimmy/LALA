.class public Lcom/itextpdf/layout/renderer/TargetCounterHandler;
.super Ljava/lang/Object;
.source "TargetCounterHandler.java"


# instance fields
.field private previousRenderersPages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private renderersPages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    .line 55
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/renderer/TargetCounterHandler;)V
    .locals 1
    .param p1, "targetCounterHandler"    # Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    .line 48
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    .line 49
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    .line 50
    return-void
.end method

.method public static addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 63
    const/16 v0, 0x7e

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    .local v0, "id":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 65
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->getTargetCounterHandler(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    move-result-object v1

    .line 66
    .local v1, "targetCounterHandler":Lcom/itextpdf/layout/renderer/TargetCounterHandler;
    if-eqz v1, :cond_0

    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 67
    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v2

    .line 68
    .local v2, "currentPageNumber":I
    iget-object v3, v1, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .end local v1    # "targetCounterHandler":Lcom/itextpdf/layout/renderer/TargetCounterHandler;
    .end local v2    # "currentPageNumber":I
    :cond_0
    return-void
.end method

.method public static getPageByID(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "id"    # Ljava/lang/String;

    .line 81
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->getTargetCounterHandler(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    move-result-object v0

    .line 82
    .local v0, "targetCounterHandler":Lcom/itextpdf/layout/renderer/TargetCounterHandler;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    :goto_0
    return-object v1
.end method

.method private static getTargetCounterHandler(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/TargetCounterHandler;
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 119
    move-object v0, p0

    .line 120
    .local v0, "rootRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_0
    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 121
    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    goto :goto_0

    .line 123
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    if-eqz v1, :cond_1

    .line 124
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getTargetCounterHandler()Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    move-result-object v1

    return-object v1

    .line 126
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public static isValueDefinedForThisId(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/lang/String;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "id"    # Ljava/lang/String;

    .line 93
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->getTargetCounterHandler(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    move-result-object v0

    .line 94
    .local v0, "targetCounterHandler":Lcom/itextpdf/layout/renderer/TargetCounterHandler;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public isRelayoutRequired()Z
    .locals 5

    .line 103
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 104
    .local v1, "rendererPage":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 105
    const/4 v0, 0x1

    return v0

    .line 107
    .end local v1    # "rendererPage":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_0
    goto :goto_0

    .line 108
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public prepareHandlerToRelayout()V
    .locals 2

    .line 115
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->renderersPages:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->previousRenderersPages:Ljava/util/Map;

    .line 116
    return-void
.end method
