.class public Lcom/itextpdf/layout/layout/LineLayoutContext;
.super Lcom/itextpdf/layout/layout/LayoutContext;
.source "LineLayoutContext.java"


# instance fields
.field private floatOverflowedToNextPageWithNothing:Z

.field private textIndent:F


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V
    .locals 1
    .param p1, "area"    # Lcom/itextpdf/layout/layout/LayoutArea;
    .param p2, "marginsCollapseInfo"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .param p4, "clippedHeight"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/layout/LayoutArea;",
            "Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;Z)V"
        }
    .end annotation

    .line 45
    .local p3, "floatedRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/LineLayoutContext;->floatOverflowedToNextPageWithNothing:Z

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/layout/LayoutContext;)V
    .locals 4
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 54
    iget-object v0, p1, Lcom/itextpdf/layout/layout/LayoutContext;->area:Lcom/itextpdf/layout/layout/LayoutArea;

    iget-object v1, p1, Lcom/itextpdf/layout/layout/LayoutContext;->marginsCollapseInfo:Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    iget-object v2, p1, Lcom/itextpdf/layout/layout/LayoutContext;->floatRendererAreas:Ljava/util/List;

    iget-boolean v3, p1, Lcom/itextpdf/layout/layout/LayoutContext;->clippedHeight:Z

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/LineLayoutContext;->floatOverflowedToNextPageWithNothing:Z

    .line 55
    return-void
.end method


# virtual methods
.method public getTextIndent()F
    .locals 1

    .line 81
    iget v0, p0, Lcom/itextpdf/layout/layout/LineLayoutContext;->textIndent:F

    return v0
.end method

.method public isFloatOverflowedToNextPageWithNothing()Z
    .locals 1

    .line 63
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/LineLayoutContext;->floatOverflowedToNextPageWithNothing:Z

    return v0
.end method

.method public setFloatOverflowedToNextPageWithNothing(Z)Lcom/itextpdf/layout/layout/LineLayoutContext;
    .locals 0
    .param p1, "floatOverflowedToNextPageWithNothing"    # Z

    .line 72
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/LineLayoutContext;->floatOverflowedToNextPageWithNothing:Z

    .line 73
    return-object p0
.end method

.method public setTextIndent(F)Lcom/itextpdf/layout/layout/LineLayoutContext;
    .locals 0
    .param p1, "textIndent"    # F

    .line 90
    iput p1, p0, Lcom/itextpdf/layout/layout/LineLayoutContext;->textIndent:F

    .line 91
    return-object p0
.end method
