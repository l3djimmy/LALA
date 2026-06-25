.class Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
.super Ljava/lang/Object;
.source "TableRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TableRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OverflowRowsWrapper"
.end annotation


# instance fields
.field private isReplaced:Z

.field private overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/renderer/TableRenderer;)V
    .locals 1
    .param p1, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1887
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1885
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->isReplaced:Z

    .line 1888
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1889
    return-void
.end method


# virtual methods
.method public getCell(II)Lcom/itextpdf/layout/renderer/CellRenderer;
    .locals 1
    .param p1, "row"    # I
    .param p2, "col"    # I

    .line 1892
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v0, v0, p2

    return-object v0
.end method

.method public setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;
    .locals 3
    .param p1, "row"    # I
    .param p2, "col"    # I
    .param p3, "newCell"    # Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1896
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->isReplaced:Z

    if-nez v0, :cond_0

    .line 1897
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1898
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->isReplaced:Z

    .line 1900
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-virtual {v1}, [Lcom/itextpdf/layout/renderer/CellRenderer;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1901
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->overflowRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object p3, v0, p2

    return-object p3
.end method
