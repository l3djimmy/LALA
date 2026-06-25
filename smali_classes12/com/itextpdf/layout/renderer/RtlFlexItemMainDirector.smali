.class Lcom/itextpdf/layout/renderer/RtlFlexItemMainDirector;
.super Ljava/lang/Object;
.source "RtlFlexItemMainDirector.java"

# interfaces
.implements Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
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

    .line 45
    .local p1, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
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

    .line 47
    .local v2, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/RtlFlexItemMainDirector;->applyDirectionForLine(Ljava/util/List;)V

    .line 48
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 49
    .local v4, "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .end local v4    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_1

    .line 51
    .end local v2    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_0
    goto :goto_0

    .line 53
    :cond_1
    return-object v0
.end method

.method public applyDirectionForLine(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 61
    .local p1, "renderers":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 62
    return-void
.end method

.method public applyJustifyContent(Ljava/util/List;Lcom/itextpdf/layout/properties/JustifyContent;F)V
    .locals 2
    .param p2, "justifyContent"    # Lcom/itextpdf/layout/properties/JustifyContent;
    .param p3, "freeSpace"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;",
            "Lcom/itextpdf/layout/properties/JustifyContent;",
            "F)V"
        }
    .end annotation

    .line 70
    .local p1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    sget-object v0, Lcom/itextpdf/layout/renderer/RtlFlexItemMainDirector$1;->$SwitchMap$com$itextpdf$layout$properties$JustifyContent:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/JustifyContent;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 78
    :pswitch_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, p3, v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    .line 79
    goto :goto_0

    .line 75
    :pswitch_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    iput p3, v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    .line 76
    nop

    .line 89
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
