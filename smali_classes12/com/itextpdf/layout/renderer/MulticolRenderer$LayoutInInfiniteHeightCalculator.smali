.class public Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;
.super Ljava/lang/Object;
.source "MulticolRenderer.java"

# interfaces
.implements Lcom/itextpdf/layout/renderer/MulticolRenderer$ColumnHeightCalculator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/MulticolRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutInInfiniteHeightCalculator"
.end annotation


# instance fields
.field private height:Ljava/lang/Float;

.field protected maxRelayoutCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 511
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 513
    const/4 v0, 0x4

    iput v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->maxRelayoutCount:I

    .line 514
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->height:Ljava/lang/Float;

    return-void
.end method


# virtual methods
.method public getAdditionalHeightOfEachColumn(Lcom/itextpdf/layout/renderer/MulticolRenderer;Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;)Ljava/lang/Float;
    .locals 6
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/MulticolRenderer;
    .param p2, "result"    # Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;

    .line 517
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->height:Ljava/lang/Float;

    if-eqz v0, :cond_0

    .line 518
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->height:Ljava/lang/Float;

    return-object v0

    .line 520
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    if-nez v0, :cond_1

    .line 521
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 523
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v2, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v3, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 524
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->access$000(Lcom/itextpdf/layout/renderer/MulticolRenderer;)F

    move-result v4

    const v5, 0x49742400    # 1000000.0f

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v1, v2}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    .line 523
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 525
    .local v0, "overflowResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 526
    .local v1, "overflowHeight":F
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/MulticolRenderer$MulticolLayoutResult;->getSplitRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 530
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/MulticolRenderer;->access$100(Lcom/itextpdf/layout/renderer/MulticolRenderer;)F

    move-result v2

    sub-float/2addr v1, v2

    .line 532
    :cond_2
    iget v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->maxRelayoutCount:I

    int-to-float v2, v2

    div-float v2, v1, v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->height:Ljava/lang/Float;

    .line 533
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->height:Ljava/lang/Float;

    return-object v2
.end method

.method public maxAmountOfRelayouts()I
    .locals 1

    .line 541
    iget v0, p0, Lcom/itextpdf/layout/renderer/MulticolRenderer$LayoutInInfiniteHeightCalculator;->maxRelayoutCount:I

    return v0
.end method
