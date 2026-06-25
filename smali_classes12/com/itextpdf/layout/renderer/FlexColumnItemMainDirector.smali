.class abstract Lcom/itextpdf/layout/renderer/FlexColumnItemMainDirector;
.super Ljava/lang/Object;
.source "FlexColumnItemMainDirector.java"

# interfaces
.implements Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method


# virtual methods
.method public applyDirection(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexItemInfo;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation

    .line 37
    .local p1, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .local v0, "renderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 39
    .local v2, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexColumnItemMainDirector;->applyDirectionForLine(Ljava/util/List;)V

    .line 40
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 41
    .local v4, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .end local v4    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_1

    .line 43
    .end local v2    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_0
    goto :goto_0

    .line 44
    :cond_1
    return-object v0
.end method

.method public abstract applyDirectionForLine(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation
.end method
