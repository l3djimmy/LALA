.class abstract Lcom/itextpdf/layout/renderer/TableBorders;
.super Ljava/lang/Object;
.source "TableBorders.java"


# instance fields
.field protected finishRow:I

.field protected horizontalBorders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;>;"
        }
    .end annotation
.end field

.field protected largeTableIndexOffset:I

.field protected leftBorderMaxWidth:F

.field protected final numberOfColumns:I

.field protected rightBorderMaxWidth:F

.field protected rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/layout/renderer/CellRenderer;",
            ">;"
        }
    .end annotation
.end field

.field protected startRow:I

.field protected tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

.field protected verticalBorders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V
    .locals 1
    .param p2, "numberOfColumns"    # I
    .param p3, "tableBoundingBorders"    # [Lcom/itextpdf/layout/borders/Border;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/layout/renderer/CellRenderer;",
            ">;I[",
            "Lcom/itextpdf/layout/borders/Border;",
            ")V"
        }
    .end annotation

    .line 108
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->horizontalBorders:Ljava/util/List;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->verticalBorders:Ljava/util/List;

    .line 66
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/itextpdf/layout/borders/Border;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    .line 106
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->largeTableIndexOffset:I

    .line 109
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    .line 110
    iput p2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    .line 111
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/renderer/TableBorders;->setTableBoundingBorders([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;I)V
    .locals 0
    .param p2, "numberOfColumns"    # I
    .param p3, "tableBoundingBorders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p4, "largeTableIndexOffset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/layout/renderer/CellRenderer;",
            ">;I[",
            "Lcom/itextpdf/layout/borders/Border;",
            "I)V"
        }
    .end annotation

    .line 115
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/TableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    .line 116
    iput p4, p0, Lcom/itextpdf/layout/renderer/TableBorders;->largeTableIndexOffset:I

    .line 117
    return-void
.end method

.method private removeRows(II)V
    .locals 4
    .param p1, "startRow"    # I
    .param p2, "numOfRows"    # I

    .line 403
    move v0, p1

    .local v0, "row":I
    :goto_0
    add-int v1, p1, p2

    if-ge v0, v1, :cond_1

    .line 404
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 405
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->horizontalBorders:Ljava/util/List;

    add-int/lit8 v2, p1, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 406
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    if-gt v1, v2, :cond_0

    .line 407
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    add-int/lit8 v3, p1, 0x1

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 406
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 403
    .end local v1    # "j":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 410
    .end local v0    # "row":I
    :cond_1
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    sub-int/2addr v0, p2

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 411
    return-void
.end method

.method private updateRowspanForNextNonEmptyCellInEachColumn(II)V
    .locals 10
    .param p1, "numOfRowsToRemove"    # I
    .param p2, "row"    # I

    .line 419
    const/4 v0, 0x0

    .line 420
    .local v0, "c":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    if-ge v0, v1, :cond_5

    .line 421
    move v1, p2

    .line 422
    .local v1, "r":I
    const/4 v2, 0x0

    .line 424
    .local v2, "cr":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :goto_1
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    if-eqz v2, :cond_0

    aget-object v3, v2, v0

    if-nez v3, :cond_1

    .line 425
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v2, v3

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 426
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 430
    :cond_1
    if-eqz v2, :cond_4

    aget-object v3, v2, v0

    if-eqz v3, :cond_4

    .line 431
    aget-object v3, v2, v0

    .line 432
    .local v3, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    const/16 v4, 0x3c

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 433
    .local v5, "origRowspan":I
    const/4 v6, 0x0

    .line 438
    .local v6, "spansToRestore":I
    sub-int v7, p2, p1

    sub-int v8, v1, v5

    const/4 v9, 0x1

    if-ge v7, v8, :cond_2

    .line 439
    sub-int v7, v1, p2

    add-int/lit8 v6, v7, -0x1

    .line 442
    :cond_2
    move v7, v5

    .line 443
    .local v7, "rowspan":I
    sub-int/2addr v7, p1

    .line 444
    if-ge v7, v9, :cond_3

    .line 445
    const/4 v7, 0x1

    .line 447
    :cond_3
    add-int/2addr v7, v6

    .line 448
    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 450
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v4, v8}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 452
    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 453
    .local v4, "colspan":I
    add-int/2addr v0, v4

    .line 454
    .end local v3    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v4    # "colspan":I
    .end local v5    # "origRowspan":I
    .end local v6    # "spansToRestore":I
    .end local v7    # "rowspan":I
    goto :goto_2

    .line 455
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 457
    .end local v1    # "r":I
    .end local v2    # "cr":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :goto_2
    goto :goto_0

    .line 458
    :cond_5
    return-void
.end method


# virtual methods
.method protected abstract applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract applyCellIndents(Lcom/itextpdf/kernel/geom/Rectangle;FFFFZ)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;II[I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method protected abstract collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract collapseTableWithHeader(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract drawHorizontalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract drawVerticalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract fixHeaderOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method public getCellBorderIndents(IIII)[F
    .locals 8
    .param p1, "row"    # I
    .param p2, "col"    # I
    .param p3, "rowspan"    # I
    .param p4, "colspan"    # I

    .line 363
    const/4 v0, 0x4

    new-array v0, v0, [F

    .line 367
    .local v0, "indents":[F
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    add-int/2addr v1, p1

    sub-int/2addr v1, p3

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 368
    .local v1, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    move v3, p2

    .local v3, "i":I
    :goto_0
    add-int v4, p2, p4

    if-ge v3, v4, :cond_1

    .line 369
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 370
    .local v4, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    const/4 v6, 0x0

    aget v7, v0, v6

    cmpl-float v5, v5, v7

    if-lez v5, :cond_0

    .line 371
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v6

    .line 368
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 375
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_1
    add-int v3, p2, p4

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 376
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    add-int/2addr v3, p1

    sub-int/2addr v3, p3

    add-int/2addr v3, v2

    .restart local v3    # "i":I
    :goto_1
    iget v4, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    add-int/2addr v4, p1

    add-int/2addr v4, v2

    if-ge v3, v4, :cond_3

    .line 377
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 378
    .restart local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aget v6, v0, v2

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    .line 379
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v2

    .line 376
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 383
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_3
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    add-int/2addr v3, p1

    add-int/2addr v3, v2

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 384
    move v3, p2

    .restart local v3    # "i":I
    :goto_2
    add-int v4, p2, p4

    if-ge v3, v4, :cond_5

    .line 385
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 386
    .restart local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    const/4 v6, 0x2

    aget v7, v0, v6

    cmpl-float v5, v5, v7

    if-lez v5, :cond_4

    .line 387
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v6

    .line 384
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 391
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_5
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/TableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 392
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    add-int/2addr v3, p1

    sub-int/2addr v3, p3

    add-int/2addr v3, v2

    .restart local v3    # "i":I
    :goto_3
    iget v4, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    add-int/2addr v4, p1

    add-int/2addr v4, v2

    if-ge v3, v4, :cond_7

    .line 393
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 394
    .restart local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_6

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    const/4 v6, 0x3

    aget v7, v0, v6

    cmpl-float v5, v5, v7

    if-lez v5, :cond_6

    .line 395
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v6

    .line 392
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 398
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_7
    return-object v0
.end method

.method protected abstract getCellVerticalAddition([F)F
.end method

.method public getFinishRow()I
    .locals 1

    .line 355
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    return v0
.end method

.method public getFirstHorizontalBorder()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 331
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFirstVerticalBorder()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 339
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public abstract getHorizontalBorder(I)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation
.end method

.method public getLastHorizontalBorder()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 335
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getLastVerticalBorder()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 343
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getLeftBorderMaxWidth()F
    .locals 1

    .line 271
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->leftBorderMaxWidth:F

    return v0
.end method

.method public getMaxBottomWidth()F
    .locals 3

    .line 288
    const/4 v0, 0x0

    .line 289
    .local v0, "width":F
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestHorizontalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 290
    .local v1, "widestBorder":Lcom/itextpdf/layout/borders/Border;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    cmpl-float v2, v2, v0

    if-ltz v2, :cond_0

    .line 291
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    .line 293
    :cond_0
    return v0
.end method

.method public getMaxLeftWidth()F
    .locals 3

    .line 306
    const/4 v0, 0x0

    .line 307
    .local v0, "width":F
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestVerticalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 308
    .local v1, "widestBorder":Lcom/itextpdf/layout/borders/Border;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    cmpl-float v2, v2, v0

    if-ltz v2, :cond_0

    .line 309
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    .line 311
    :cond_0
    return v0
.end method

.method public getMaxRightWidth()F
    .locals 3

    .line 297
    const/4 v0, 0x0

    .line 298
    .local v0, "width":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestVerticalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 299
    .local v1, "widestBorder":Lcom/itextpdf/layout/borders/Border;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    cmpl-float v2, v2, v0

    if-ltz v2, :cond_0

    .line 300
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    .line 302
    :cond_0
    return v0
.end method

.method public getMaxTopWidth()F
    .locals 3

    .line 279
    const/4 v0, 0x0

    .line 280
    .local v0, "width":F
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestHorizontalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 281
    .local v1, "widestBorder":Lcom/itextpdf/layout/borders/Border;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    cmpl-float v2, v2, v0

    if-ltz v2, :cond_0

    .line 282
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    .line 284
    :cond_0
    return v0
.end method

.method public getNumberOfColumns()I
    .locals 1

    .line 347
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    return v0
.end method

.method public getRightBorderMaxWidth()F
    .locals 1

    .line 275
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rightBorderMaxWidth:F

    return v0
.end method

.method public getStartRow()I
    .locals 1

    .line 351
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    return v0
.end method

.method public getTableBoundingBorders()[Lcom/itextpdf/layout/borders/Border;
    .locals 1

    .line 359
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    return-object v0
.end method

.method public abstract getVerticalBorder(I)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation
.end method

.method public getWidestHorizontalBorder(I)Lcom/itextpdf/layout/borders/Border;
    .locals 1
    .param p1, "row"    # I

    .line 323
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getWidestBorder(Ljava/util/List;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    return-object v0
.end method

.method public getWidestHorizontalBorder(III)Lcom/itextpdf/layout/borders/Border;
    .locals 1
    .param p1, "row"    # I
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 327
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getWidestBorder(Ljava/util/List;II)Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    return-object v0
.end method

.method public getWidestVerticalBorder(I)Lcom/itextpdf/layout/borders/Border;
    .locals 1
    .param p1, "col"    # I

    .line 315
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getWidestBorder(Ljava/util/List;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    return-object v0
.end method

.method public getWidestVerticalBorder(III)Lcom/itextpdf/layout/borders/Border;
    .locals 1
    .param p1, "col"    # I
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 319
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getWidestBorder(Ljava/util/List;II)Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    return-object v0
.end method

.method protected initializeBorders()Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 5

    .line 222
    nop

    :goto_0
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-le v0, v2, :cond_1

    .line 223
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v0, "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_0

    .line 225
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 227
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 230
    .end local v0    # "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_1
    :goto_2
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v0, v2, :cond_3

    .line 231
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .restart local v0    # "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :goto_3
    iget v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_2

    .line 233
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 235
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 237
    .end local v0    # "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_3
    return-object p0
.end method

.method protected processAllBordersAndEmptyRows()Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 7

    .line 169
    const/4 v0, 0x0

    .line 170
    .local v0, "numOfRowsToRemove":I
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 171
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    iget v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->largeTableIndexOffset:I

    sub-int/2addr v1, v2

    .local v1, "row":I
    :goto_0
    iget v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    iget v3, p0, Lcom/itextpdf/layout/renderer/TableBorders;->largeTableIndexOffset:I

    sub-int/2addr v2, v3

    if-gt v1, v2, :cond_6

    .line 172
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 173
    .local v2, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    const/4 v3, 0x0

    .line 174
    .local v3, "hasCells":Z
    const/4 v4, 0x0

    .local v4, "col":I
    :goto_1
    iget v5, p0, Lcom/itextpdf/layout/renderer/TableBorders;->numberOfColumns:I

    if-ge v4, v5, :cond_3

    .line 175
    aget-object v5, v2, v4

    const/4 v6, 0x0

    if-eqz v5, :cond_1

    .line 176
    if-eqz v0, :cond_0

    .line 178
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->updateRowspanForNextNonEmptyCellInEachColumn(II)V

    .line 181
    sub-int v5, v1, v0

    invoke-direct {p0, v5, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->removeRows(II)V

    .line 182
    sub-int/2addr v1, v0

    .line 183
    const/4 v0, 0x0

    .line 186
    :cond_0
    aget-object v5, v2, v4

    invoke-virtual {p0, v5, v1, v4, v6}, Lcom/itextpdf/layout/renderer/TableBorders;->buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;II[I)V

    .line 187
    const/4 v3, 0x1

    .line 188
    aget-object v5, v2, v4

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 189
    .local v5, "colspan":I
    add-int/lit8 v6, v5, -0x1

    add-int/2addr v4, v6

    .line 190
    .end local v5    # "colspan":I
    goto :goto_2

    .line 191
    :cond_1
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gt v5, v4, :cond_2

    .line 192
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 197
    .end local v4    # "col":I
    :cond_3
    if-nez v3, :cond_5

    .line 198
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v1, v4, :cond_4

    .line 199
    sub-int v4, v1, v0

    invoke-direct {p0, v4, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->removeRows(II)V

    .line 201
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableBorders;->rows:Ljava/util/List;

    sub-int v5, v1, v0

    invoke-interface {v4, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 202
    iget v4, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 204
    const-class v4, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 205
    .local v4, "logger":Lorg/slf4j/Logger;
    const-string v5, "Last row is not completed. Table bottom border may collapse as you do not expect it"

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 206
    .end local v4    # "logger":Lorg/slf4j/Logger;
    goto :goto_3

    .line 207
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 171
    .end local v3    # "hasCells":Z
    :cond_5
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 212
    .end local v1    # "row":I
    .end local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_6
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    iget v2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    if-ge v1, v2, :cond_7

    .line 213
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 215
    :cond_7
    return-object p0
.end method

.method protected setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "row"    # I

    .line 264
    iput p1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    .line 265
    return-object p0
.end method

.method protected setRowRange(II)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "startRow"    # I
    .param p2, "finishRow"    # I

    .line 253
    iput p1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    .line 254
    iput p2, p0, Lcom/itextpdf/layout/renderer/TableBorders;->finishRow:I

    .line 255
    return-object p0
.end method

.method protected setStartRow(I)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "row"    # I

    .line 259
    iput p1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    .line 260
    return-object p0
.end method

.method protected setTableBoundingBorders([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 3
    .param p1, "borders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 243
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/itextpdf/layout/borders/Border;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    .line 244
    if-eqz p1, :cond_0

    .line 245
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 246
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    aget-object v2, p1, v0

    aput-object v2, v1, v0

    .line 245
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 249
    .end local v0    # "i":I
    :cond_0
    return-object p0
.end method

.method protected abstract skipFooter([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract skipHeader([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
.end method

.method protected abstract updateBordersOnNewPage(ZZLcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;)Lcom/itextpdf/layout/renderer/TableBorders;
.end method
