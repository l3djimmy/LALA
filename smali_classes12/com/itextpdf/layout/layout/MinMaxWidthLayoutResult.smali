.class public Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;
.super Lcom/itextpdf/layout/layout/LayoutResult;
.source "MinMaxWidthLayoutResult.java"


# instance fields
.field protected minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;


# direct methods
.method public constructor <init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "status"    # I
    .param p2, "occupiedArea"    # Lcom/itextpdf/layout/layout/LayoutArea;
    .param p3, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p4, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 48
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 49
    return-void
.end method

.method public constructor <init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "status"    # I
    .param p2, "occupiedArea"    # Lcom/itextpdf/layout/layout/LayoutArea;
    .param p3, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p4, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p5, "cause"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 61
    invoke-direct/range {p0 .. p5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 62
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 63
    return-void
.end method


# virtual methods
.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    return-object v0
.end method

.method public setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;
    .locals 0
    .param p1, "minMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 81
    iput-object p1, p0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 82
    return-object p0
.end method
