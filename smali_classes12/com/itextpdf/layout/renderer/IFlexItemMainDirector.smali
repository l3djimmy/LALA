.class interface abstract Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;
.super Ljava/lang/Object;
.source "IFlexItemMainDirector.java"


# virtual methods
.method public abstract applyDirection(Ljava/util/List;)Ljava/util/List;
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

.method public abstract applyJustifyContent(Ljava/util/List;Lcom/itextpdf/layout/properties/JustifyContent;F)V
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
.end method
