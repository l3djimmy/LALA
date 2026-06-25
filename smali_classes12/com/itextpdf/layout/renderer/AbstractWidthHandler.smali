.class public abstract Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
.super Ljava/lang/Object;
.source "AbstractWidthHandler.java"


# instance fields
.field minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V
    .locals 0
    .param p1, "minMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 32
    return-void
.end method


# virtual methods
.method public abstract updateMaxChildWidth(F)V
.end method

.method public abstract updateMinChildWidth(F)V
.end method

.method public updateMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V
    .locals 1
    .param p1, "minMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 38
    if-eqz p1, :cond_0

    .line 39
    invoke-virtual {p1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 40
    invoke-virtual {p1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 42
    :cond_0
    return-void
.end method
