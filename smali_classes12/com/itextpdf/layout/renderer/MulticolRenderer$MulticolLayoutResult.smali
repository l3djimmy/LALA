.class public Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;
.super Ljava/lang/Object;
.source "MulticolRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/MulticolRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MulticolLayoutResult"
.end annotation


# instance fields
.field private causeOfNothing:Lcom/itextpdf/layout/renderer/IRenderer;

.field private overflowRenderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

.field private splitRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 485
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 486
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->splitRenderers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 503
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->causeOfNothing:Lcom/itextpdf/layout/renderer/IRenderer;

    return-object v0
.end method

.method public getOverflowRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 1

    .line 495
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->overflowRenderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    return-object v0
.end method

.method public getSplitRenderers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation

    .line 491
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->splitRenderers:Ljava/util/List;

    return-object v0
.end method

.method public setCauseOfNothing(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 0
    .param p1, "causeOfNothing"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 507
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->causeOfNothing:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 508
    return-void
.end method

.method public setOverflowRenderer(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 0
    .param p1, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 499
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->overflowRenderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 500
    return-void
.end method
