.class public interface abstract Lcom/itextpdf/layout/renderer/IRenderer;
.super Ljava/lang/Object;
.source "IRenderer.java"

# interfaces
.implements Lcom/itextpdf/layout/IPropertyContainer;


# virtual methods
.method public abstract addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V
.end method

.method public abstract draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
.end method

.method public abstract getChildRenderers()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getModelElement()Lcom/itextpdf/layout/IPropertyContainer;
.end method

.method public abstract getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
.end method

.method public abstract getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;
.end method

.method public abstract getParent()Lcom/itextpdf/layout/renderer/IRenderer;
.end method

.method public abstract getProperty(ILjava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(ITT1;)TT1;"
        }
    .end annotation
.end method

.method public abstract isFlushed()Z
.end method

.method public abstract layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
.end method

.method public abstract move(FF)V
.end method

.method public abstract setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;
.end method
