.class Lcom/itextpdf/layout/renderer/BottomToTopFlexItemMainDirector;
.super Lcom/itextpdf/layout/renderer/FlexColumnItemMainDirector;
.source "BottomToTopFlexItemMainDirector.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/FlexColumnItemMainDirector;-><init>()V

    .line 34
    return-void
.end method


# virtual methods
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

    .line 41
    .local p1, "renderers":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 42
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

    .line 47
    .local p1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    sget-object v0, Lcom/itextpdf/layout/renderer/BottomToTopFlexItemMainDirector$1;->$SwitchMap$com$itextpdf$layout$properties$JustifyContent:[I

    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/JustifyContent;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 58
    :pswitch_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, p3, v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 59
    goto :goto_0

    .line 55
    :pswitch_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    iput p3, v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 56
    nop

    .line 68
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
