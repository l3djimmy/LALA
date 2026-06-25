.class public Lcom/itextpdf/layout/renderer/TableRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "TableRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;,
        Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;
    }
.end annotation


# instance fields
.field bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

.field protected captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

.field private columnWidths:[F

.field private countedColumnWidth:[F

.field protected footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

.field protected headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

.field private heights:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field protected isOriginalNonSplitRenderer:Z

.field protected rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

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

.field private topBorderMaxWidth:F

.field private totalWidthForColumns:F


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 82
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>()V

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->columnWidths:[F

    .line 77
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    .line 78
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 83
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/element/Table;)V
    .locals 3
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/Table;

    .line 103
    new-instance v0, Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Table;->getNumberOfRows()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;-><init>(Lcom/itextpdf/layout/element/Table;Lcom/itextpdf/layout/element/Table$RowRange;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/element/Table;Lcom/itextpdf/layout/element/Table$RowRange;)V
    .locals 2
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/Table;
    .param p2, "rowRange"    # Lcom/itextpdf/layout/element/Table$RowRange;

    .line 93
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->columnWidths:[F

    .line 77
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    .line 78
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 94
    invoke-direct {p0, p2}, Lcom/itextpdf/layout/renderer/TableRenderer;->setRowRange(Lcom/itextpdf/layout/element/Table$RowRange;)V

    .line 95
    return-void
.end method

.method private adjustCaptionAndFixOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;F)V
    .locals 4
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "verticalBorderSpacing"    # F

    .line 1559
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    if-eqz v0, :cond_1

    .line 1560
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/DivRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 1561
    .local v0, "captionHeight":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1562
    sget-object v1, Lcom/itextpdf/layout/properties/CaptionSide;->BOTTOM:Lcom/itextpdf/layout/properties/CaptionSide;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    const/16 v3, 0x77

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/DivRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/properties/CaptionSide;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1563
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    add-float/2addr v2, p2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/layout/renderer/DivRenderer;->move(FF)V

    goto :goto_0

    .line 1565
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1568
    .end local v0    # "captionHeight":F
    :cond_1
    :goto_0
    return-void
.end method

.method private adjustFooterAndFixOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;F)V
    .locals 3
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "verticalBorderSpacing"    # F

    .line 1545
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    .line 1546
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v1, p2

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 1547
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    sub-float/2addr v0, p2

    .line 1548
    .local v0, "footerHeight":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1550
    .end local v0    # "footerHeight":F
    :cond_0
    return-void
.end method

.method private applyFixedXOrYPosition(ZLcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 3
    .param p1, "isXPosition"    # Z
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1525
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isPositioned()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1526
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFixedLayout()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1527
    if-eqz p1, :cond_0

    .line 1528
    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 1529
    .local v0, "x":F
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1530
    .end local v0    # "x":F
    goto :goto_0

    .line 1531
    :cond_0
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 1532
    .local v0, "y":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    sub-float v1, v0, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 1536
    .end local v0    # "y":F
    :cond_1
    :goto_0
    return-void
.end method

.method private applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 7
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "spacing"    # F
    .param p3, "isHorizontal"    # Z
    .param p4, "reverse"    # Z

    .line 182
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_1

    .line 183
    const/high16 v0, 0x40000000    # 2.0f

    if-eqz p3, :cond_0

    .line 184
    div-float v3, p2, v0

    const/4 v4, 0x0

    div-float v5, p2, v0

    const/4 v2, 0x0

    move-object v1, p1

    move v6, p4

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p4    # "reverse":Z
    .local v1, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v6, "reverse":Z
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    move v5, v6

    .end local v6    # "reverse":Z
    .local v5, "reverse":Z
    return-object p1

    .line 186
    .end local v1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "reverse":Z
    .restart local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local p4    # "reverse":Z
    :cond_0
    move-object v1, p1

    move v5, p4

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p4    # "reverse":Z
    .restart local v1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v5    # "reverse":Z
    move p1, v0

    move-object v0, v1

    .end local v1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v0, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    div-float v1, p2, p1

    div-float v3, p2, p1

    const/4 v4, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    return-object p1

    .line 191
    .end local v0    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "reverse":Z
    .restart local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local p4    # "reverse":Z
    :cond_1
    move-object v0, p1

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v0    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    return-object v0
.end method

.method private applySpacing(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 7
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "horizontalSpacing"    # F
    .param p3, "verticalSpacing"    # F
    .param p4, "reverse"    # Z

    .line 163
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_0

    .line 164
    const/high16 v0, 0x40000000    # 2.0f

    div-float v2, p3, v0

    div-float v3, p2, v0

    div-float v4, p3, v0

    div-float v5, p2, v0

    move-object v1, p1

    move v6, p4

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p4    # "reverse":Z
    .local v1, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v6, "reverse":Z
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    return-object p1

    .line 168
    .end local v1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v6    # "reverse":Z
    .restart local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local p4    # "reverse":Z
    :cond_0
    move-object v1, p1

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    return-object v1
.end method

.method private calculateColumnWidths(F)V
    .locals 7
    .param p1, "availableWidth"    # F

    .line 1842
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->totalWidthForColumns:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v3, p1

    goto :goto_1

    .line 1843
    :cond_1
    :goto_0
    new-instance v1, Lcom/itextpdf/layout/renderer/TableWidths;

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget v5, v0, Lcom/itextpdf/layout/renderer/TableBorders;->rightBorderMaxWidth:F

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget v6, v0, Lcom/itextpdf/layout/renderer/TableBorders;->leftBorderMaxWidth:F

    const/4 v4, 0x0

    move-object v2, p0

    move v3, p1

    .end local p1    # "availableWidth":F
    .local v3, "availableWidth":F
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/TableWidths;-><init>(Lcom/itextpdf/layout/renderer/TableRenderer;FZFF)V

    .line 1844
    .local v1, "tableWidths":Lcom/itextpdf/layout/renderer/TableWidths;
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableWidths;->layout()[F

    move-result-object p1

    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 1846
    .end local v1    # "tableWidths":Lcom/itextpdf/layout/renderer/TableWidths;
    :goto_1
    return-void
.end method

.method private correctLayoutedCellsOccupiedAreas([Lcom/itextpdf/layout/layout/LayoutResult;I[ILjava/lang/Float;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;ZZZ)V
    .locals 21
    .param p1, "splits"    # [Lcom/itextpdf/layout/layout/LayoutResult;
    .param p2, "row"    # I
    .param p3, "targetOverflowRowIndex"    # [I
    .param p4, "blockMinHeight"    # Ljava/lang/Float;
    .param p5, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p7, "isLastRenderer"    # Z
    .param p8, "processBigRowspan"    # Z
    .param p9, "skip"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            "I[I",
            "Ljava/lang/Float;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;ZZZ)V"
        }
    .end annotation

    .line 1576
    .local p6, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    move-object/from16 v0, p0

    move-object/from16 v8, p5

    move-object/from16 v5, p6

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getFinishRow()I

    move-result v9

    .line 1577
    .local v9, "finish":I
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1580
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    add-int/lit8 v2, v9, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestHorizontalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v10

    .line 1581
    .local v10, "currentBorder":Lcom/itextpdf/layout/borders/Border;
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1, v9}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1582
    const/4 v1, 0x2

    if-eqz p9, :cond_0

    .line 1584
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v3

    aget-object v3, v3, v1

    aput-object v3, v2, v1

    .line 1585
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->skipFooter([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1587
    :cond_0
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v2, v2, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    if-nez v10, :cond_1

    move v2, v3

    goto :goto_0

    .line 1588
    :cond_1
    invoke-virtual {v10}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    goto :goto_0

    :cond_2
    move v2, v3

    :goto_0
    move v11, v2

    .line 1590
    .local v11, "currentBottomIndent":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v2, v2, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v2, :cond_3

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1591
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v3

    goto :goto_1

    :cond_3
    nop

    :goto_1
    move v12, v3

    .line 1593
    .local v12, "realBottomIndent":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    if-eqz v2, :cond_c

    .line 1594
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    sub-float v7, v12, v11

    div-float/2addr v7, v3

    add-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-interface {v2, v4, v6}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1596
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    sub-float v4, v12, v11

    div-float/2addr v4, v3

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    sub-float v4, v12, v11

    div-float/2addr v4, v3

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1597
    sub-float v2, v12, v11

    div-float/2addr v2, v3

    invoke-virtual {v8, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1598
    if-eqz p8, :cond_b

    .line 1600
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1601
    .local v2, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    const/4 v4, 0x0

    .local v4, "col":I
    :goto_2
    array-length v6, v2

    if-ge v4, v6, :cond_a

    .line 1602
    aget-object v6, p1, v4

    if-nez v6, :cond_4

    aget-object v6, v2, v4

    goto :goto_3

    :cond_4
    aget-object v6, p1, v4

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1603
    .local v6, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :goto_3
    if-nez v6, :cond_5

    .line 1604
    move/from16 v17, v1

    move-object/from16 v19, v2

    move/from16 v16, v3

    goto/16 :goto_6

    .line 1606
    :cond_5
    const/4 v7, 0x0

    .line 1607
    .local v7, "height":F
    const/16 v13, 0x3c

    invoke-virtual {v6, v13}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 1608
    .local v13, "rowspan":I
    const/16 v14, 0x10

    invoke-virtual {v6, v14}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 1610
    .local v14, "colspan":I
    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    add-int/lit8 v15, v15, -0x1

    .local v15, "l":I
    :goto_4
    aget v16, p3, v4

    move/from16 v17, v1

    sub-int v1, v16, v13

    if-le v15, v1, :cond_6

    if-ltz v15, :cond_6

    .line 1611
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-float/2addr v7, v1

    .line 1610
    add-int/lit8 v15, v15, -0x1

    move/from16 v1, v17

    goto :goto_4

    .line 1614
    .end local v15    # "l":I
    :cond_6
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v15, v15, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v15, :cond_7

    move/from16 v15, p2

    goto :goto_5

    :cond_7
    aget v15, p3, v4

    :goto_5
    invoke-virtual {v1, v15, v4, v13, v14}, Lcom/itextpdf/layout/renderer/TableBorders;->getCellBorderIndents(IIII)[F

    move-result-object v1

    .line 1616
    .local v1, "indents":[F
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v15

    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v15

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v15

    sub-float/2addr v15, v7

    const/16 v16, 0x0

    aget v16, v1, v16

    div-float v16, v16, v3

    add-float v15, v15, v16

    aget v16, v1, v17

    div-float v16, v16, v3

    add-float v15, v15, v16

    .line 1618
    .local v15, "cellHeightInLastRow":F
    move/from16 v16, v3

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    move-object/from16 v18, v1

    .end local v1    # "indents":[F
    .local v18, "indents":[F
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpg-float v1, v1, v15

    if-gez v1, :cond_9

    .line 1620
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v1, :cond_8

    .line 1621
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float v1, v15, v1

    .line 1622
    .local v1, "differenceToConsider":F
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1623
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1625
    .end local v1    # "differenceToConsider":F
    :cond_8
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v19, v2

    .end local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v19, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 1628
    .end local v19    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_9
    move-object/from16 v19, v2

    .end local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v19    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v1, v15

    .line 1629
    .local v1, "shift":F
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 1630
    .local v2, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1631
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    move/from16 v20, v1

    .end local v1    # "shift":F
    .local v20, "shift":F
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-float/2addr v1, v7

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1632
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->applyVerticalAlignment()V

    .line 1601
    .end local v2    # "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v6    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v7    # "height":F
    .end local v13    # "rowspan":I
    .end local v14    # "colspan":I
    .end local v15    # "cellHeightInLastRow":F
    .end local v18    # "indents":[F
    .end local v20    # "shift":F
    :goto_6
    add-int/lit8 v4, v4, 0x1

    move/from16 v3, v16

    move/from16 v1, v17

    move-object/from16 v2, v19

    goto/16 :goto_2

    .end local v19    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v2, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_a
    move-object/from16 v19, v2

    move/from16 v16, v3

    .end local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v19    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_7

    .line 1598
    .end local v4    # "col":I
    .end local v19    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_b
    move/from16 v16, v3

    goto :goto_7

    .line 1593
    :cond_c
    move/from16 v16, v3

    .line 1637
    :goto_7
    const/4 v1, 0x0

    .line 1638
    .local v1, "additionalCellHeight":F
    const/4 v2, 0x0

    .line 1639
    .local v2, "numOfRowsWithFloatHeight":I
    if-eqz p7, :cond_13

    .line 1640
    const/4 v3, 0x0

    .line 1641
    .local v3, "additionalHeight":F
    if-eqz p4, :cond_e

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    div-float v7, v12, v16

    add-float/2addr v6, v7

    cmpl-float v4, v4, v6

    if-lez v4, :cond_e

    .line 1642
    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    div-float v6, v12, v16

    sub-float/2addr v4, v6

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    sub-float/2addr v6, v7

    div-float v7, v12, v16

    sub-float/2addr v6, v7

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 1643
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_8
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v4, v6, :cond_e

    .line 1644
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 1645
    add-int/lit8 v2, v2, 0x1

    .line 1643
    :cond_d
    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    .line 1649
    .end local v4    # "k":I
    :cond_e
    if-nez v2, :cond_f

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    goto :goto_9

    :cond_f
    move v4, v2

    :goto_9
    int-to-float v4, v4

    div-float v1, v3, v4

    .line 1650
    const/4 v4, 0x0

    .restart local v4    # "k":I
    :goto_a
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v4, v6, :cond_12

    .line 1651
    if-eqz v2, :cond_10

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 1652
    :cond_10
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v7, v1

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v6, v4, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1650
    :cond_11
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_12
    move v7, v1

    move v13, v2

    goto :goto_b

    .line 1639
    .end local v3    # "additionalHeight":F
    .end local v4    # "k":I
    :cond_13
    move v7, v1

    move v13, v2

    .line 1656
    .end local v1    # "additionalCellHeight":F
    .end local v2    # "numOfRowsWithFloatHeight":I
    .local v7, "additionalCellHeight":F
    .local v13, "numOfRowsWithFloatHeight":I
    :goto_b
    const/4 v1, 0x0

    .line 1658
    .local v1, "cumulativeShift":F
    const/4 v2, 0x0

    move v6, v1

    move v4, v2

    .end local v1    # "cumulativeShift":F
    .restart local v4    # "k":I
    .local v6, "cumulativeShift":F
    :goto_c
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v4, v1, :cond_16

    .line 1659
    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->correctRowCellsOccupiedAreas([Lcom/itextpdf/layout/layout/LayoutResult;I[IILjava/util/List;FF)V

    .line 1660
    if-eqz p7, :cond_15

    .line 1661
    if-eqz v13, :cond_14

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 1662
    :cond_14
    add-float/2addr v6, v7

    .line 1658
    :cond_15
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 1667
    .end local v4    # "k":I
    :cond_16
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1668
    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1669
    return-void
.end method

.method private correctRowCellsOccupiedAreas([Lcom/itextpdf/layout/layout/LayoutResult;I[IILjava/util/List;FF)V
    .locals 18
    .param p1, "splits"    # [Lcom/itextpdf/layout/layout/LayoutResult;
    .param p2, "row"    # I
    .param p3, "targetOverflowRowIndex"    # [I
    .param p4, "currentRowIndex"    # I
    .param p6, "cumulativeShift"    # F
    .param p7, "additionalCellHeight"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            "I[II",
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;FF)V"
        }
    .end annotation

    .line 1673
    .local p5, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    move-object/from16 v1, p0

    move/from16 v2, p2

    move/from16 v3, p4

    iget-object v0, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1674
    .local v4, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    const/4 v0, 0x0

    move v5, v0

    .local v5, "col":I
    :goto_0
    array-length v0, v4

    if-ge v5, v0, :cond_a

    .line 1675
    if-lt v3, v2, :cond_1

    aget-object v0, p1, v5

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    aget-object v0, p1, v5

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    goto :goto_2

    :cond_1
    :goto_1
    aget-object v0, v4, v5

    :goto_2
    move-object v6, v0

    .line 1676
    .local v6, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    if-nez v6, :cond_2

    .line 1677
    move-object/from16 v12, p5

    goto/16 :goto_9

    .line 1679
    :cond_2
    const/4 v0, 0x0

    .line 1680
    .local v0, "height":F
    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 1681
    .local v7, "colspan":I
    const/16 v8, 0x3c

    invoke-virtual {v6, v8}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 1682
    .local v8, "rowspan":I
    const/4 v9, 0x0

    .line 1684
    .local v9, "rowspanOffset":F
    if-ge v3, v2, :cond_3

    move v10, v3

    goto :goto_3

    :cond_3
    iget-object v10, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    :goto_3
    add-int/lit8 v10, v10, -0x1

    .local v10, "l":I
    :goto_4
    if-ge v3, v2, :cond_4

    move v11, v3

    goto :goto_5

    :cond_4
    aget v11, p3, v5

    :goto_5
    sub-int/2addr v11, v8

    if-le v10, v11, :cond_6

    if-ltz v10, :cond_6

    .line 1685
    iget-object v11, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    add-float/2addr v0, v11

    .line 1686
    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v12, p5

    invoke-interface {v12, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1687
    add-float v9, v9, p7

    .line 1684
    :cond_5
    add-int/lit8 v10, v10, -0x1

    goto :goto_4

    :cond_6
    move-object/from16 v12, p5

    .line 1690
    .end local v10    # "l":I
    iget-object v10, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    if-ge v3, v2, :cond_7

    move v11, v3

    goto :goto_6

    :cond_7
    iget-object v11, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    :goto_6
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    add-float/2addr v0, v10

    .line 1691
    iget-object v10, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    if-lt v3, v2, :cond_9

    iget-object v11, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v11, v11, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v11, :cond_8

    goto :goto_7

    :cond_8
    aget v11, p3, v5

    goto :goto_8

    :cond_9
    :goto_7
    move v11, v3

    :goto_8
    invoke-virtual {v10, v11, v5, v8, v7}, Lcom/itextpdf/layout/renderer/TableBorders;->getCellBorderIndents(IIII)[F

    move-result-object v10

    .line 1694
    .local v10, "indents":[F
    const/4 v11, 0x0

    aget v11, v10, v11

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v11, v13

    const/4 v14, 0x2

    aget v14, v10, v14

    div-float/2addr v14, v13

    add-float/2addr v11, v14

    sub-float v11, v0, v11

    .line 1697
    .end local v0    # "height":F
    .local v11, "height":F
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    sub-float v13, v11, v0

    .line 1698
    .local v13, "shift":F
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    .line 1699
    .local v14, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v14, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1701
    sub-float v0, p6, v9

    neg-float v0, v0

    const/4 v15, 0x0

    :try_start_0
    invoke-virtual {v6, v15, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->move(FF)V

    .line 1702
    invoke-virtual {v14, v11}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1703
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->applyVerticalAlignment()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1710
    goto :goto_9

    .line 1706
    :catch_0
    move-exception v0

    .line 1707
    .local v0, "e":Ljava/lang/NullPointerException;
    const-class v15, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-static {v15}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v15

    .line 1708
    .local v15, "logger":Lorg/slf4j/Logger;
    const-string v16, "Some of the cell\'s content might not end up placed correctly."

    move-object/from16 v17, v0

    .end local v0    # "e":Ljava/lang/NullPointerException;
    .local v17, "e":Ljava/lang/NullPointerException;
    filled-new-array/range {v16 .. v16}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Occupied area has not been initialized. {0}"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v15, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1674
    .end local v6    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v7    # "colspan":I
    .end local v8    # "rowspan":I
    .end local v9    # "rowspanOffset":F
    .end local v10    # "indents":[F
    .end local v11    # "height":F
    .end local v13    # "shift":F
    .end local v14    # "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v15    # "logger":Lorg/slf4j/Logger;
    .end local v17    # "e":Ljava/lang/NullPointerException;
    :goto_9
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, p0

    goto/16 :goto_0

    :cond_a
    move-object/from16 v12, p5

    .line 1712
    .end local v5    # "col":I
    return-void
.end method

.method private correctRowRange()V
    .locals 4

    .line 1370
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    if-ge v0, v1, :cond_0

    .line 1371
    new-instance v0, Lcom/itextpdf/layout/element/Table$RowRange;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    .line 1373
    :cond_0
    return-void
.end method

.method private drawBorders(Lcom/itextpdf/layout/renderer/DrawContext;ZZ)V
    .locals 18
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "hasHeader"    # Z
    .param p3, "hasFooter"    # Z

    .line 1389
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 1390
    .local v1, "height":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v2, :cond_0

    .line 1391
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v1, v2

    .line 1393
    :cond_0
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v2, :cond_1

    .line 1394
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v1, v2

    .line 1396
    :cond_1
    const v2, 0x38d1b717    # 1.0E-4f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_2

    .line 1397
    return-void

    .line 1400
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 1401
    .local v2, "startX":F
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    add-float/2addr v3, v5

    .line 1402
    .local v3, "startY":F
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v5, :cond_3

    .line 1403
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    sub-float/2addr v3, v5

    .line 1404
    iget v5, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->topBorderMaxWidth:F

    div-float/2addr v5, v4

    add-float/2addr v3, v5

    goto :goto_0

    .line 1406
    :cond_3
    iget v5, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->topBorderMaxWidth:F

    div-float/2addr v5, v4

    sub-float/2addr v3, v5

    .line 1408
    :goto_0
    const/16 v5, 0x2e

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->hasProperty(I)Z

    move-result v6

    const-string v7, "Property {0} in percents is not supported"

    const-class v8, Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v9, 0x0

    const/16 v10, 0x2c

    if-eqz v6, :cond_6

    .line 1409
    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 1410
    .local v5, "topMargin":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v5, :cond_4

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    if-nez v6, :cond_4

    .line 1411
    invoke-static {v8}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v6

    .line 1412
    .local v6, "logger":Lorg/slf4j/Logger;
    nop

    .line 1413
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v11

    .line 1412
    invoke-static {v7, v11}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v6, v11}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1415
    .end local v6    # "logger":Lorg/slf4j/Logger;
    :cond_4
    if-nez v5, :cond_5

    move v6, v9

    goto :goto_1

    :cond_5
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    :goto_1
    sub-float/2addr v3, v6

    .line 1417
    .end local v5    # "topMargin":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_6
    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/renderer/TableRenderer;->hasProperty(I)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1418
    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 1419
    .local v5, "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    if-nez v6, :cond_7

    .line 1420
    invoke-static {v8}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v6

    .line 1421
    .restart local v6    # "logger":Lorg/slf4j/Logger;
    nop

    .line 1422
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 1421
    invoke-static {v7, v8}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1424
    .end local v6    # "logger":Lorg/slf4j/Logger;
    :cond_7
    if-nez v5, :cond_8

    move v6, v9

    goto :goto_2

    :cond_8
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    :goto_2
    add-float/2addr v2, v6

    .line 1429
    .end local v5    # "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_9
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_c

    .line 1430
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    .line 1431
    .local v5, "borders":[Lcom/itextpdf/layout/borders/Border;
    aget-object v7, v5, v6

    const/4 v8, 0x2

    if-eqz v7, :cond_a

    .line 1432
    aget-object v7, v5, v8

    if-eqz v7, :cond_b

    .line 1433
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_b

    .line 1434
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    aget-object v10, v5, v6

    invoke-virtual {v10}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v10

    div-float/2addr v10, v4

    aget-object v8, v5, v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v8

    div-float/2addr v8, v4

    add-float/2addr v10, v8

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v7, v6, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_3

    .line 1437
    :cond_a
    aget-object v7, v5, v8

    if-eqz v7, :cond_b

    .line 1438
    aget-object v7, v5, v8

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    div-float/2addr v7, v4

    sub-float/2addr v3, v7

    .line 1440
    :cond_b
    :goto_3
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_c

    .line 1441
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1445
    .end local v5    # "borders":[Lcom/itextpdf/layout/borders/Border;
    :cond_c
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v4

    .line 1446
    .local v4, "isTagged":Z
    if-eqz v4, :cond_d

    .line 1447
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    new-instance v7, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1451
    :cond_d
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isTopTablePart()Z

    move-result v5

    .line 1452
    .local v5, "isTopTablePart":Z
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isBottomTablePart()Z

    move-result v7

    .line 1453
    .local v7, "isBottomTablePart":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v8

    .line 1454
    .local v8, "isComplete":Z
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRendererOfLargeTable()Z

    move-result v9

    .line 1456
    .local v9, "isFooterRendererOfLargeTable":Z
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v11, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v11}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v11

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v12}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v12

    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    add-int/2addr v12, v13

    const/4 v13, 0x1

    sub-int/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Lcom/itextpdf/layout/renderer/TableBorders;->setRowRange(II)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1458
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v10, v10, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v10, :cond_f

    .line 1459
    if-eqz p3, :cond_e

    .line 1460
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    check-cast v10, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    iget-object v11, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v11, v11, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1461
    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/TableBorders;->getFirstHorizontalBorder()Ljava/util/List;

    move-result-object v11

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v12, v12, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    check-cast v12, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 1463
    invoke-virtual {v12}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBordersCrossingTopHorizontalBorder()Ljava/util/List;

    move-result-object v12

    .line 1460
    invoke-virtual {v10, v11, v12}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    goto :goto_4

    .line 1464
    :cond_e
    if-eqz v7, :cond_f

    .line 1465
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    check-cast v10, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, v11}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 1469
    :cond_f
    :goto_4
    move v10, v3

    .line 1471
    .local v10, "y1":F
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    new-array v11, v11, [F

    .line 1472
    .local v11, "heightsArray":[F
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_5
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-ge v12, v14, :cond_10

    .line 1473
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v14, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Float;

    invoke-virtual {v14}, Ljava/lang/Float;->floatValue()F

    move-result v14

    aput v14, v11, v12

    .line 1472
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 1477
    .end local v12    # "j":I
    :cond_10
    move v12, v2

    .line 1478
    .local v12, "x1":F
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_6
    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v15}, Lcom/itextpdf/layout/renderer/TableBorders;->getNumberOfColumns()I

    move-result v15

    if-gt v14, v15, :cond_12

    .line 1479
    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    new-instance v6, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    invoke-direct {v6, v14, v3, v12, v11}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;-><init>(IFF[F)V

    invoke-virtual {v15, v13, v6}, Lcom/itextpdf/layout/renderer/TableBorders;->drawVerticalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1481
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    array-length v6, v6

    if-ge v14, v6, :cond_11

    .line 1482
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    aget v6, v6, v14

    add-float/2addr v12, v6

    .line 1478
    :cond_11
    add-int/lit8 v14, v14, 0x1

    const/4 v6, 0x0

    const/4 v13, 0x1

    goto :goto_6

    .line 1488
    .end local v14    # "i":I
    :cond_12
    if-nez v9, :cond_14

    if-eqz v5, :cond_13

    goto :goto_7

    :cond_13
    const/4 v6, 0x0

    goto :goto_8

    :cond_14
    :goto_7
    const/4 v6, 0x1

    .line 1491
    .local v6, "shouldDrawTopBorder":Z
    :goto_8
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_15

    if-nez v6, :cond_15

    .line 1492
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    sub-float/2addr v10, v13

    goto :goto_9

    .line 1491
    :cond_15
    const/4 v14, 0x0

    .line 1494
    :goto_9
    if-eqz v6, :cond_16

    goto :goto_a

    :cond_16
    const/4 v14, 0x1

    .restart local v14    # "i":I
    :goto_a
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    if-ge v14, v13, :cond_17

    .line 1495
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v15

    move/from16 v16, v1

    .end local v1    # "height":F
    .local v16, "height":F
    new-instance v1, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    move/from16 v17, v3

    .end local v3    # "startY":F
    .local v17, "startY":F
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    invoke-direct {v1, v14, v2, v10, v3}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;-><init>(IFF[F)V

    invoke-virtual {v13, v15, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->drawHorizontalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1497
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v10, v1

    .line 1494
    add-int/lit8 v14, v14, 0x1

    move/from16 v1, v16

    move/from16 v3, v17

    goto :goto_a

    .end local v16    # "height":F
    .end local v17    # "startY":F
    .restart local v1    # "height":F
    .restart local v3    # "startY":F
    :cond_17
    move/from16 v16, v1

    move/from16 v17, v3

    .line 1509
    .end local v1    # "height":F
    .end local v3    # "startY":F
    .end local v14    # "i":I
    .restart local v16    # "height":F
    .restart local v17    # "startY":F
    if-nez v7, :cond_18

    if-nez v8, :cond_19

    :cond_18
    if-eqz v7, :cond_1a

    if-nez v8, :cond_19

    iget-boolean v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->isLastRendererForModelElement:Z

    if-nez v1, :cond_1a

    .line 1510
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isEmptyTableRenderer()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 1511
    :cond_19
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    new-instance v13, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    .line 1512
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    invoke-direct {v13, v14, v2, v10, v15}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;-><init>(IFF[F)V

    .line 1511
    invoke-virtual {v1, v3, v13}, Lcom/itextpdf/layout/renderer/TableBorders;->drawHorizontalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1515
    :cond_1a
    if-eqz v4, :cond_1b

    .line 1516
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1518
    :cond_1b
    return-void
.end method

.method private enlargeCell(III[Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;[I[Lcom/itextpdf/layout/renderer/TableRenderer;)V
    .locals 10
    .param p1, "col"    # I
    .param p2, "row"    # I
    .param p3, "minRowspan"    # I
    .param p4, "currentRow"    # [Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p5, "overflowRows"    # Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .param p6, "targetOverflowRowIndex"    # [I
    .param p7, "splitResult"    # [Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1933
    aget-object v1, p4, p1

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v8

    .line 1934
    .local v8, "cellOccupiedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    const/4 v1, 0x1

    if-ne v1, p3, :cond_0

    .line 1939
    aget-object v3, p4, p1

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/element/Cell;->clone(Z)Lcom/itextpdf/layout/element/Cell;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Cell;->getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1940
    .local v1, "overflowCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual {v1, p0}, Lcom/itextpdf/layout/renderer/CellRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1941
    const/16 v3, 0x1b

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/CellRenderer;->deleteProperty(I)V

    .line 1942
    const/16 v3, 0x55

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/CellRenderer;->deleteProperty(I)V

    .line 1943
    const/16 v3, 0x54

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/CellRenderer;->deleteProperty(I)V

    .line 1944
    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-virtual {p5, v3, p1, v6}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1945
    aget v7, p6, p1

    sub-int/2addr v7, p2

    invoke-virtual {p5, v7, p1, v1}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1946
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    aget-object v9, p4, p1

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1947
    aget-object v7, p4, p1

    .line 1948
    .local v7, "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    aput-object v6, p4, p1

    .line 1949
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    aget v9, p6, p1

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v7, v6, p1

    .line 1950
    iput-boolean v3, v7, Lcom/itextpdf/layout/renderer/CellRenderer;->isLastRendererForModelElement:Z

    .line 1951
    const/16 v3, 0x6d

    invoke-virtual {v7, v3}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v3, v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1952
    .end local v1    # "overflowCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v7    # "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_0

    .line 1953
    :cond_0
    move-object v0, p0

    move v4, p1

    move v3, p2

    move v5, p3

    move-object v1, p4

    move-object v2, p5

    move-object/from16 v7, p6

    move-object/from16 v6, p7

    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->enlargeCellWithBigRowspan([Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;III[Lcom/itextpdf/layout/renderer/TableRenderer;[I)V

    .line 1955
    :goto_0
    aget v0, p6, p1

    sub-int/2addr v0, p2

    invoke-virtual {p5, v0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->getCell(II)Lcom/itextpdf/layout/renderer/CellRenderer;

    move-result-object v0

    iput-object v8, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1956
    return-void
.end method

.method private enlargeCellWithBigRowspan([Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;III[Lcom/itextpdf/layout/renderer/TableRenderer;[I)V
    .locals 5
    .param p1, "currentRow"    # [Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "overflowRows"    # Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .param p3, "row"    # I
    .param p4, "col"    # I
    .param p5, "minRowspan"    # I
    .param p6, "splitResult"    # [Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p7, "targetOverflowRowIndex"    # [I

    .line 1908
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    aget-object v1, p1, p4

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1910
    move v0, p3

    .line 1911
    .local v0, "i":I
    :goto_0
    add-int v1, p3, p5

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ge v0, v1, :cond_0

    add-int/lit8 v1, v0, 0x1

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    aget-object v1, p6, v3

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    add-int/lit8 v4, v0, 0x1

    sub-int/2addr v4, p3

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v1, v1, p4

    if-eqz v1, :cond_0

    .line 1912
    sub-int v1, v0, p3

    aget-object v3, p6, v3

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    add-int/lit8 v4, v0, 0x1

    sub-int/2addr v4, p3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v3, v3, p4

    invoke-virtual {p2, v1, p4, v3}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1913
    add-int/lit8 v1, v0, 0x1

    sub-int/2addr v1, p3

    invoke-virtual {p2, v1, p4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1914
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    add-int/lit8 v4, v0, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v3, v3, p4

    aput-object v3, v1, p4

    .line 1915
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    add-int/lit8 v3, v0, 0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v2, v1, p4

    .line 1911
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1919
    :cond_0
    add-int v1, p3, p5

    sub-int/2addr v1, v3

    if-eq v0, v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v1, v1, p4

    if-eqz v1, :cond_1

    .line 1920
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v1, v1, p4

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Cell;->getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v1, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1921
    .local v1, "overflowCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    sub-int v3, v0, p3

    invoke-virtual {p2, v3, p4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1922
    aget v3, p7, p4

    sub-int/2addr v3, p3

    invoke-virtual {p2, v3, p4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 1923
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v3, v3, p4

    .line 1924
    .local v3, "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v2, v4, p4

    .line 1925
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    aget v4, p7, p4

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v3, v2, p4

    .line 1926
    const/4 v2, 0x0

    iput-boolean v2, v3, Lcom/itextpdf/layout/renderer/CellRenderer;->isLastRendererForModelElement:Z

    .line 1927
    const/16 v2, 0x6d

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1929
    .end local v1    # "overflowCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v3    # "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_1
    return-void
.end method

.method private ensureFooterOrHeaderHasTheSamePropertiesAsParentTableRenderer(Lcom/itextpdf/layout/renderer/TableRenderer;)V
    .locals 2
    .param p1, "headerOrFooterRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1794
    const/16 v0, 0x72

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1795
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_0

    .line 1796
    const/16 v0, 0x73

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1797
    const/16 v0, 0x74

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1798
    const/16 v0, 0x9

    sget-object v1, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1799
    const/16 v0, 0xb

    sget-object v1, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1800
    const/16 v0, 0xd

    sget-object v1, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1801
    const/16 v0, 0xc

    sget-object v1, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1802
    const/16 v0, 0xa

    sget-object v1, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1804
    :cond_0
    return-void
.end method

.method private getTableWidth()F
    .locals 5

    .line 1849
    const/4 v0, 0x0

    .line 1850
    .local v0, "sum":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, v1, v3

    .line 1851
    .local v4, "column":F
    add-float/2addr v0, v4

    .line 1850
    .end local v4    # "column":F
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1853
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    .line 1858
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1853
    if-eqz v1, :cond_2

    .line 1854
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getRightBorderMaxWidth()F

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    .line 1855
    const/16 v1, 0x73

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    .line 1856
    .local v1, "horizontalSpacing":Ljava/lang/Float;
    if-nez v1, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :goto_1
    add-float/2addr v0, v2

    .line 1857
    .end local v1    # "horizontalSpacing":Ljava/lang/Float;
    goto :goto_2

    .line 1858
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getRightBorderMaxWidth()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v3

    div-float/2addr v3, v2

    add-float/2addr v1, v3

    add-float/2addr v0, v1

    .line 1860
    :goto_2
    return v0
.end method

.method private initFooterOrHeaderRenderer(Z[Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 13
    .param p1, "footer"    # Z
    .param p2, "tableBorders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 1740
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    .line 1741
    .local v0, "table":Lcom/itextpdf/layout/element/Table;
    sget-object v1, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    const/16 v2, 0x72

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1742
    .local v1, "isSeparated":Z
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getFooter()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getHeader()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    .line 1743
    .local v2, "footerOrHeader":Lcom/itextpdf/layout/element/Table;
    :goto_0
    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz p1, :cond_1

    move v5, v4

    goto :goto_1

    :cond_1
    move v5, v3

    .line 1744
    .local v5, "innerBorder":I
    :goto_1
    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    move v3, v4

    .line 1745
    .local v3, "outerBorder":I
    :goto_2
    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    invoke-interface {v6, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1746
    .local v6, "renderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    invoke-direct {p0, v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->ensureFooterOrHeaderHasTheSamePropertiesAsParentTableRenderer(Lcom/itextpdf/layout/renderer/TableRenderer;)V

    .line 1747
    const/4 v7, 0x1

    if-nez p1, :cond_3

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v8}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v8

    if-nez v8, :cond_3

    iget-boolean v8, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v8, :cond_3

    move v4, v7

    .line 1748
    .local v4, "firstHeader":Z
    :cond_3
    const/16 v8, 0x6c

    invoke-virtual {p0, v8}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 1749
    .local v8, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v8, :cond_4

    .line 1750
    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-virtual {v8, p0, v9}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 1751
    invoke-static {v8, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1754
    if-nez p1, :cond_4

    if-nez v4, :cond_4

    .line 1755
    invoke-virtual {v8, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 1759
    :cond_4
    iget-object v9, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v9, v9, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    const/4 v10, 0x3

    if-eqz v9, :cond_8

    .line 1760
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 1762
    if-eqz p1, :cond_5

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v9, :cond_6

    .line 1763
    :cond_5
    aget-object v9, p2, v5

    invoke-virtual {v6, v9, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1765
    :cond_6
    iget-object v9, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v9, v9, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    sget-object v11, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    aput-object v11, v9, v5

    .line 1767
    :cond_7
    aget-object v9, p2, v7

    invoke-virtual {v6, v9, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1768
    aget-object v7, p2, v10

    invoke-virtual {v6, v7, v10}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1769
    aget-object v7, p2, v3

    invoke-virtual {v6, v7, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1770
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    sget-object v9, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    aput-object v9, v7, v3

    goto :goto_3

    .line 1771
    :cond_8
    iget-object v9, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v9, v9, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v9, :cond_a

    .line 1772
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v9

    .line 1773
    .local v9, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_9

    .line 1774
    aget-object v11, v9, v5

    aget-object v12, p2, v5

    invoke-static {v11, v12}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v11

    invoke-virtual {v6, v11, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1775
    iget-object v11, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v11, v11, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    sget-object v12, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    aput-object v12, v11, v5

    .line 1777
    :cond_9
    aget-object v11, v9, v7

    aget-object v12, p2, v7

    invoke-static {v11, v12}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v11

    invoke-virtual {v6, v11, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1778
    aget-object v7, v9, v10

    aget-object v11, p2, v10

    invoke-static {v7, v11}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v7

    invoke-virtual {v6, v7, v10}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1779
    aget-object v7, v9, v3

    aget-object v10, p2, v3

    invoke-static {v7, v10}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1780
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    sget-object v10, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    aput-object v10, v7, v3

    .line 1783
    .end local v9    # "borders":[Lcom/itextpdf/layout/borders/Border;
    :cond_a
    :goto_3
    if-eqz v1, :cond_b

    new-instance v7, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    iget-object v9, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1784
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v10

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v11

    invoke-direct {v7, v9, v10, v11}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    goto :goto_4

    :cond_b
    new-instance v7, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    iget-object v9, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1785
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v10

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v11

    invoke-direct {v7, v9, v10, v11}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    :goto_4
    iput-object v7, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1786
    iget-object v7, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/TableBorders;->initializeBorders()Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1787
    iget-object v7, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v9, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v9

    iget-object v10, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v10

    invoke-virtual {v7, v9, v10}, Lcom/itextpdf/layout/renderer/TableBorders;->setRowRange(II)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1788
    iget-object v7, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/TableBorders;->processAllBordersAndEmptyRows()Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1789
    invoke-direct {v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->correctRowRange()V

    .line 1790
    return-object v6
.end method

.method private initializeCaptionRenderer(Lcom/itextpdf/layout/element/Div;)V
    .locals 2
    .param p1, "caption"    # Lcom/itextpdf/layout/element/Div;

    .line 220
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 221
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Div;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/DivRenderer;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    .line 222
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/DivRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 223
    const/16 v0, 0x6c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 224
    .local v0, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v0, :cond_0

    .line 225
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 226
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-static {v0, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 229
    .end local v0    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    :cond_0
    return-void
.end method

.method private initializeHeaderAndFooter(Z)V
    .locals 10
    .param p1, "isFirstOnThePage"    # Z

    .line 199
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    .line 200
    .local v0, "table":Lcom/itextpdf/layout/element/Table;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 202
    .local v1, "tableBorder":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getHeader()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    .line 203
    .local v2, "headerElement":Lcom/itextpdf/layout/element/Table;
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v3, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v5

    .line 204
    .local v3, "isFirstHeader":Z
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    :cond_1
    if-eqz p1, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isSkipFirstHeader()Z

    move-result v6

    if-eqz v6, :cond_2

    if-nez v3, :cond_3

    :cond_2
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 205
    const/16 v7, 0x61

    invoke-virtual {p0, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    move v6, v4

    goto :goto_1

    :cond_3
    move v6, v5

    .line 206
    .local v6, "headerShouldBeApplied":Z
    :goto_1
    if-eqz v2, :cond_4

    if-eqz v6, :cond_4

    .line 207
    invoke-direct {p0, v5, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->initFooterOrHeaderRenderer(Z[Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 210
    :cond_4
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getFooter()Lcom/itextpdf/layout/element/Table;

    move-result-object v7

    .line 212
    .local v7, "footerElement":Lcom/itextpdf/layout/element/Table;
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isSkipLastFooter()Z

    move-result v8

    if-nez v8, :cond_6

    :cond_5
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 213
    const/16 v9, 0x60

    invoke-virtual {p0, v9}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    move v5, v4

    goto :goto_2

    :cond_6
    nop

    .line 214
    .local v5, "footerShouldBeApplied":Z
    :goto_2
    if-eqz v7, :cond_7

    if-eqz v5, :cond_7

    .line 215
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->initFooterOrHeaderRenderer(Z[Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v4

    iput-object v4, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 217
    :cond_7
    return-void
.end method

.method private initializeTableLayoutBorders()V
    .locals 8

    .line 1357
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    const/16 v1, 0x72

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1358
    .local v0, "isSeparated":Z
    if-eqz v0, :cond_0

    new-instance v1, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1359
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1360
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    :goto_0
    iput-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1361
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->initializeBorders()Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1362
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableBorders;->setTableBoundingBorders([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1363
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->setRowRange(II)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1364
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->initializeHeaderAndFooter(Z)V

    .line 1365
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-boolean v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_1
    move v4, v1

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    move-object v5, p0

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/layout/renderer/TableBorders;->updateBordersOnNewPage(ZZLcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1366
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->correctRowRange()V

    .line 1367
    return-void
.end method

.method private isBottomTablePart()Z
    .locals 1

    .line 1834
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_1

    .line 1835
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1834
    :goto_0
    return v0
.end method

.method private isEmptyTableRenderer()Z
    .locals 4

    .line 1521
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v3, 0x0

    cmpl-float v0, v0, v3

    if-nez v0, :cond_0

    move v1, v2

    :cond_0
    return v1
.end method

.method private isFooterRenderer()Z
    .locals 1

    .line 1821
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isFooterRendererOfLargeTable()Z
    .locals 1

    .line 1825
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isHeaderRenderer()Z
    .locals 1

    .line 1817
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isOriginalRenderer()Z
    .locals 1

    .line 232
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isTopTablePart()Z
    .locals 1

    .line 1829
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_1

    .line 1830
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1829
    :goto_0
    return v0
.end method

.method private prepareFooterOrHeaderRendererForLayout(Lcom/itextpdf/layout/renderer/TableRenderer;F)Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 2
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p2, "layoutBoxWidth"    # F

    .line 1807
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    iput-object v0, p1, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 1808
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/TableBorders;->leftBorderMaxWidth:F

    .line 1809
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getRightBorderMaxWidth()F

    move-result v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/TableBorders;->rightBorderMaxWidth:F

    .line 1810
    const/16 v0, 0x4d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1811
    invoke-static {p2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1813
    :cond_0
    return-object p0
.end method

.method private setRowRange(Lcom/itextpdf/layout/element/Table$RowRange;)V
    .locals 3
    .param p1, "rowRange"    # Lcom/itextpdf/layout/element/Table$RowRange;

    .line 1733
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    .line 1734
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v0

    .local v0, "row":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 1735
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v2, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v2

    new-array v2, v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1734
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1737
    .end local v0    # "row":I
    :cond_0
    return-void
.end method


# virtual methods
.method public addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 4
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 111
    instance-of v0, p1, Lcom/itextpdf/layout/renderer/CellRenderer;

    if-eqz v0, :cond_0

    .line 114
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Cell;

    .line 115
    .local v0, "cell":Lcom/itextpdf/layout/element/Cell;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Cell;->getCol()I

    move-result v2

    move-object v3, p1

    check-cast v3, Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v3, v1, v2

    .line 116
    .end local v0    # "cell":Lcom/itextpdf/layout/element/Cell;
    goto :goto_0

    .line 117
    :cond_0
    const-class v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 118
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Only CellRenderer could be added"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 120
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :goto_0
    return-void
.end method

.method protected allowLastYLineRecursiveExtraction()Z
    .locals 1

    .line 1353
    const/4 v0, 0x0

    return v0
.end method

.method protected applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "borders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p3, "reverse"    # Z

    .line 124
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_0

    .line 125
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 129
    :cond_0
    return-object p1
.end method

.method applyMarginsAndPaddingsAndCalculateColumnWidths(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 8
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1959
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 1960
    .local v0, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    const-string v3, "Property {0} in percents is not supported"

    const-class v4, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v2, :cond_0

    .line 1961
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1962
    .local v2, "logger":Lorg/slf4j/Logger;
    nop

    .line 1963
    const/16 v5, 0x2d

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 1962
    invoke-static {v3, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1965
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/4 v2, 0x3

    aget-object v5, v0, v2

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1966
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1967
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 1968
    const/16 v6, 0x2c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 1967
    invoke-static {v3, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1970
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 1971
    .local v5, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    aget-object v6, v5, v1

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    if-nez v6, :cond_2

    .line 1972
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v6

    .line 1973
    .local v6, "logger":Lorg/slf4j/Logger;
    nop

    .line 1974
    const/16 v7, 0x31

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    .line 1973
    invoke-static {v3, v7}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1976
    .end local v6    # "logger":Lorg/slf4j/Logger;
    :cond_2
    aget-object v6, v5, v2

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1977
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 1978
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 1979
    const/16 v6, 0x30

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 1978
    invoke-static {v3, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1981
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    aget-object v4, v0, v1

    .line 1982
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    sub-float/2addr v3, v4

    aget-object v4, v0, v2

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    sub-float/2addr v3, v4

    aget-object v1, v5, v1

    .line 1983
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    sub-float/2addr v3, v1

    aget-object v1, v5, v2

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    sub-float/2addr v3, v1

    .line 1981
    invoke-direct {p0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->calculateColumnWidths(F)V

    .line 1984
    return-void
.end method

.method public applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 144
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_0

    .line 145
    invoke-super {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 149
    :cond_0
    return-object p1
.end method

.method protected applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "paddings"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p3, "reverse"    # Z

    .line 134
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_0

    .line 135
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 139
    :cond_0
    return-object p1
.end method

.method protected createOverflowRenderer(Lcom/itextpdf/layout/element/Table$RowRange;)Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 2
    .param p1, "rowRange"    # Lcom/itextpdf/layout/element/Table$RowRange;

    .line 1291
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1292
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    invoke-direct {v0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->setRowRange(Lcom/itextpdf/layout/element/Table$RowRange;)V

    .line 1293
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1294
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 1295
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 1296
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    .line 1297
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 1298
    return-object v0
.end method

.method protected createSplitRenderer(Lcom/itextpdf/layout/element/Table$RowRange;)Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 2
    .param p1, "rowRange"    # Lcom/itextpdf/layout/element/Table$RowRange;

    .line 1274
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1275
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    iput-object p1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    .line 1276
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1277
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 1278
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    .line 1279
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 1280
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1281
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1282
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->isLastRendererForModelElement:Z

    .line 1283
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->topBorderMaxWidth:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->topBorderMaxWidth:F

    .line 1284
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    .line 1285
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    .line 1287
    return-object v0
.end method

.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 13
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1098
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v0

    .line 1099
    .local v0, "isTagged":Z
    const/4 v1, 0x0

    .line 1100
    .local v1, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 1101
    const/16 v3, 0x6c

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    move-object v1, v3

    check-cast v1, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 1102
    if-nez v1, :cond_0

    .line 1103
    const/4 v0, 0x0

    goto :goto_0

    .line 1105
    :cond_0
    invoke-virtual {v1, p0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->useAutoTaggingPointerAndRememberItsPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v3

    .line 1106
    .local v3, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v1, p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1107
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v4

    invoke-static {p0, v3}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->getLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 1112
    .end local v3    # "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->beginTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 1114
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyDestinationsAndAnnotation(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1116
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isRelativePosition()Z

    move-result v3

    .line 1117
    .local v3, "relativePosition":Z
    if-eqz v3, :cond_2

    .line 1118
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyRelativePositioningTranslation(Z)V

    .line 1121
    :cond_2
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1122
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/DivRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    goto :goto_1

    :cond_3
    move v2, v4

    .line 1123
    .local v2, "captionHeight":F
    :goto_1
    sget-object v5, Lcom/itextpdf/layout/properties/CaptionSide;->BOTTOM:Lcom/itextpdf/layout/properties/CaptionSide;

    cmpl-float v6, v4, v2

    if-eqz v6, :cond_4

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    const/16 v7, 0x77

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/renderer/DivRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    goto :goto_2

    :cond_4
    const/4 v6, 0x0

    :goto_2
    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/CaptionSide;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 1124
    .local v5, "isBottomCaption":Z
    cmpl-float v6, v4, v2

    if-eqz v6, :cond_7

    .line 1125
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    if-eqz v5, :cond_5

    move v8, v4

    goto :goto_3

    :cond_5
    move v8, v2

    :goto_3
    if-eqz v5, :cond_6

    move v10, v2

    goto :goto_4

    :cond_6
    move v10, v4

    :goto_4
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v7 .. v12}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1127
    :cond_7
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1128
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v6, v6, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v6, :cond_8

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v6

    if-nez v6, :cond_8

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v6

    if-nez v6, :cond_8

    .line 1129
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1131
    :cond_8
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1132
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawPositionedChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1133
    cmpl-float v6, v4, v2

    if-eqz v6, :cond_b

    .line 1134
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    if-eqz v5, :cond_9

    move v8, v4

    goto :goto_5

    :cond_9
    move v8, v2

    :goto_5
    if-eqz v5, :cond_a

    move v10, v2

    goto :goto_6

    :cond_a
    move v10, v4

    :goto_6
    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v9, 0x0

    invoke-virtual/range {v7 .. v12}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1136
    :cond_b
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawCaption(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1137
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1139
    const/4 v4, 0x1

    if-eqz v3, :cond_c

    .line 1140
    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyRelativePositioningTranslation(Z)V

    .line 1143
    :cond_c
    iput-boolean v4, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->flushed:Z

    .line 1145
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->endTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 1147
    if-eqz v0, :cond_e

    .line 1148
    iget-boolean v4, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isLastRendererForModelElement:Z

    if-eqz v4, :cond_d

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v4}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 1149
    invoke-virtual {v1, p0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 1151
    :cond_d
    invoke-virtual {v1, p0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->restoreAutoTaggingPointerPosition(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1153
    :cond_e
    return-void
.end method

.method public drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 1
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1206
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1207
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBackgrounds(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1209
    :cond_0
    return-void
.end method

.method protected drawBackgrounds(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 9
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1178
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1179
    .local v0, "shrinkBackgroundArea":Z
    :goto_0
    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_2

    .line 1180
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxTopWidth()F

    move-result v2

    div-float v4, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getRightBorderMaxWidth()F

    move-result v2

    div-float v5, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1181
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v2

    div-float v6, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v2

    div-float v7, v2, v1

    .line 1180
    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1183
    :cond_2
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1184
    if-eqz v0, :cond_3

    .line 1185
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxTopWidth()F

    move-result v2

    div-float v4, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getRightBorderMaxWidth()F

    move-result v2

    div-float v5, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1186
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v2

    div-float v6, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v2

    div-float v7, v2, v1

    .line 1185
    const/4 v8, 0x1

    invoke-virtual/range {v3 .. v8}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1188
    :cond_3
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_4

    .line 1189
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBackgrounds(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1191
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_5

    .line 1192
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBackgrounds(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1194
    :cond_5
    return-void
.end method

.method public drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 1
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1377
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_0

    .line 1378
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1382
    :cond_0
    return-void
.end method

.method protected drawBorders(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 4
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1385
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBorders(Lcom/itextpdf/layout/renderer/DrawContext;ZZ)V

    .line 1386
    return-void
.end method

.method protected drawCaption(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 1
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1198
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1199
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/DivRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1201
    :cond_0
    return-void
.end method

.method public drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1160
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    .line 1161
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1164
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1165
    .local v1, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v1, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1166
    .end local v1    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 1168
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v0, :cond_2

    .line 1169
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->drawBorders(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1172
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_3

    .line 1173
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1175
    :cond_3
    return-void
.end method

.method protected extendLastRow([Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 5
    .param p1, "lastRow"    # [Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "freeBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1715
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_2

    .line 1716
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    add-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1717
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1718
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1719
    .local v2, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    if-eqz v2, :cond_0

    .line 1720
    iget-object v3, v2, Lcom/itextpdf/layout/renderer/CellRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1718
    .end local v2    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1723
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1725
    :cond_2
    return-void
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 12

    .line 1323
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v0, :cond_0

    .line 1324
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->initializeTableLayoutBorders()V

    .line 1326
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getRightBorderMaxWidth()F

    move-result v5

    .line 1327
    .local v5, "rightMaxBorder":F
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getLeftBorderMaxWidth()F

    move-result v6

    .line 1328
    .local v6, "leftMaxBorder":F
    new-instance v1, Lcom/itextpdf/layout/renderer/TableWidths;

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v3

    const/4 v4, 0x1

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/TableWidths;-><init>(Lcom/itextpdf/layout/renderer/TableRenderer;FZFF)V

    .line 1329
    .local v1, "tableWidths":Lcom/itextpdf/layout/renderer/TableWidths;
    const/4 v0, 0x0

    .line 1330
    .local v0, "maxColTotalWidth":F
    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableWidths;->layout()[F

    move-result-object v2

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 1331
    .local v2, "columns":[F
    :goto_0
    array-length v3, v2

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_2

    aget v7, v2, v4

    .line 1332
    .local v7, "column":F
    add-float/2addr v0, v7

    .line 1331
    .end local v7    # "column":F
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1334
    :cond_2
    iget-boolean v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v3, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableWidths;->getMinWidth()F

    move-result v3

    goto :goto_2

    :cond_3
    move v3, v0

    .line 1335
    .local v3, "minWidth":F
    :goto_2
    const/16 v4, 0x2d

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v7

    .line 1336
    .local v7, "marginRightUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v8

    const-string v9, "Property {0} in percents is not supported"

    const-class v10, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v8, :cond_4

    .line 1337
    invoke-static {v10}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v8

    .line 1338
    .local v8, "logger":Lorg/slf4j/Logger;
    nop

    .line 1339
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 1338
    invoke-static {v9, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v8, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1341
    .end local v8    # "logger":Lorg/slf4j/Logger;
    :cond_4
    const/16 v4, 0x2c

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v8

    .line 1342
    .local v8, "marginLefttUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v8}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v11

    if-nez v11, :cond_5

    .line 1343
    invoke-static {v10}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v10

    .line 1344
    .local v10, "logger":Lorg/slf4j/Logger;
    nop

    .line 1345
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 1344
    invoke-static {v9, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v10, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1347
    .end local v10    # "logger":Lorg/slf4j/Logger;
    :cond_5
    invoke-virtual {v8}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    add-float/2addr v4, v9

    const/high16 v9, 0x40000000    # 2.0f

    div-float v10, v5, v9

    add-float/2addr v4, v10

    div-float v9, v6, v9

    add-float/2addr v4, v9

    .line 1348
    .local v4, "additionalWidth":F
    new-instance v9, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v9, v3, v0, v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(FFF)V

    return-object v9
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 1224
    const-class v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 1225
    new-instance v0, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;-><init>()V

    .line 1226
    .local v0, "nextTable":Lcom/itextpdf/layout/renderer/TableRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 1227
    return-object v0
.end method

.method getTable()Lcom/itextpdf/layout/element/Table;
    .locals 1

    .line 195
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 84
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 240
    move-object/from16 v4, p0

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v6

    .line 241
    .local v6, "blockMinHeight":Ljava/lang/Float;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v10

    .line 243
    .local v10, "blockMaxHeight":Ljava/lang/Float;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v11

    .line 244
    .local v11, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v12

    .line 245
    .local v12, "wasParentsHeightClipped":Z
    const/4 v7, 0x0

    .line 246
    .local v7, "wasHeightClipped":Z
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v15

    .line 248
    .local v15, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    move-object/from16 v19, v0

    check-cast v19, Lcom/itextpdf/layout/element/Table;

    .line 249
    .local v19, "tableModel":Lcom/itextpdf/layout/element/Table;
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v0

    const/16 v8, 0x2b

    const/4 v9, 0x0

    if-nez v0, :cond_0

    .line 250
    invoke-static {v9}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {v4, v8, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 252
    :cond_0
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v0

    const/16 v13, 0x2e

    if-eqz v0, :cond_1

    .line 253
    invoke-static {v9}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {v4, v13, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 258
    :cond_1
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 259
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 264
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v14, v0

    .line 268
    .local v14, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v0

    .line 271
    .local v0, "numberOfColumns":I
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v20

    .line 272
    .local v20, "lastFlushedRowBottomBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2

    move/from16 v17, v3

    goto :goto_0

    :cond_2
    const/16 v17, 0x0

    .line 273
    .local v17, "isAndWasComplete":Z
    :goto_0
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v4, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFirstOnRootArea(Z)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    move v1, v3

    .line 275
    .local v1, "isFirstOnThePage":Z
    :goto_2
    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v5

    if-nez v5, :cond_8

    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v5

    if-nez v5, :cond_8

    .line 276
    iget-boolean v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v5, :cond_8

    .line 277
    sget-object v5, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    const/16 v2, 0x72

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 278
    .local v2, "isSeparated":Z
    if-eqz v2, :cond_6

    new-instance v5, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 279
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v13

    if-nez v17, :cond_5

    iget-object v8, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v8}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v8

    goto :goto_3

    :cond_5
    const/4 v8, 0x0

    :goto_3
    invoke-direct {v5, v3, v0, v13, v8}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;I)V

    goto :goto_5

    :cond_6
    new-instance v5, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 280
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v8

    if-nez v17, :cond_7

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v13}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v13

    goto :goto_4

    :cond_7
    const/4 v13, 0x0

    :goto_4
    invoke-direct {v5, v3, v0, v8, v13}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;I)V

    :goto_5
    iput-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 281
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableBorders;->initializeBorders()Lcom/itextpdf/layout/renderer/TableBorders;

    .line 284
    .end local v2    # "isSeparated":Z
    :cond_8
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v3

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v5

    invoke-virtual {v2, v3, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->setRowRange(II)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 285
    invoke-direct {v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->initializeHeaderAndFooter(Z)V

    .line 288
    move v2, v0

    .end local v0    # "numberOfColumns":I
    .local v2, "numberOfColumns":I
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    move v3, v1

    .end local v1    # "isFirstOnThePage":Z
    .local v3, "isFirstOnThePage":Z
    iget-boolean v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->isFooterRenderer()Z

    move-result v5

    if-nez v5, :cond_a

    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->isHeaderRenderer()Z

    move-result v5

    if-eqz v5, :cond_9

    goto :goto_6

    :cond_9
    move v5, v2

    const/4 v2, 0x0

    goto :goto_7

    :cond_a
    :goto_6
    move v5, v2

    const/4 v2, 0x1

    .end local v2    # "numberOfColumns":I
    .local v5, "numberOfColumns":I
    :goto_7
    iget-object v8, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    move v13, v5

    .end local v5    # "numberOfColumns":I
    .local v13, "numberOfColumns":I
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    move/from16 v23, v3

    move-object v3, v4

    move-object v4, v8

    const/4 v8, 0x0

    const/4 v9, 0x1

    .end local v3    # "isFirstOnThePage":Z
    .local v23, "isFirstOnThePage":Z
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/TableBorders;->updateBordersOnNewPage(ZZLcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 289
    move-object v4, v3

    iget-boolean v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    if-eqz v0, :cond_b

    .line 290
    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->correctRowRange()V

    .line 292
    :cond_b
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v0, :cond_c

    const/16 v0, 0x73

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 293
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_8

    :cond_c
    const/4 v0, 0x0

    .line 295
    .local v0, "horizontalBorderSpacing":F
    :goto_8
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v1, :cond_d

    const/16 v1, 0x74

    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    if-eqz v2, :cond_d

    .line 296
    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_9

    :cond_d
    const/4 v1, 0x0

    .line 298
    .local v1, "verticalBorderSpacing":F
    :goto_9
    if-nez v17, :cond_e

    if-nez v23, :cond_e

    .line 299
    invoke-virtual {v15, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 301
    :cond_e
    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalRenderer()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 302
    invoke-virtual {v4, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyMarginsAndPaddingsAndCalculateColumnWidths(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 304
    :cond_f
    invoke-direct {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTableWidth()F

    move-result v2

    .line 306
    .local v2, "tableWidth":F
    const/4 v3, 0x0

    .line 307
    .local v3, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v9, 0x59

    invoke-virtual {v4, v9}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 308
    .local v9, "marginsCollapsingEnabled":Z
    if-eqz v9, :cond_10

    .line 309
    new-instance v5, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v8

    invoke-direct {v5, v4, v8}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    move-object v3, v5

    move-object v8, v3

    goto :goto_a

    .line 308
    :cond_10
    move-object v8, v3

    .line 312
    .end local v3    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v8, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :goto_a
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v3

    .line 313
    .local v3, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-static {v4, v3, v15}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateClearHeightCorrection(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v5

    .line 314
    .local v5, "clearHeightCorrection":F
    move/from16 v16, v0

    .end local v0    # "horizontalBorderSpacing":F
    .local v16, "horizontalBorderSpacing":F
    const/16 v0, 0x63

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 315
    .local v0, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static {v4, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v18

    if-eqz v18, :cond_11

    .line 316
    invoke-virtual {v15, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 317
    invoke-static {v4, v15, v2, v3, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustFloatedTableLayoutBox(Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/kernel/geom/Rectangle;FLjava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;)V

    move-object/from16 v18, v0

    goto :goto_b

    .line 319
    :cond_11
    move-object/from16 v18, v0

    .end local v0    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v18, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v3, v15, v0, v5, v8}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustLayoutBoxAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;FLcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)F

    move-result v5

    .line 322
    :goto_b
    if-eqz v9, :cond_12

    .line 323
    invoke-virtual {v8, v15}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 325
    :cond_12
    const/4 v0, 0x0

    invoke-virtual {v4, v15, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 326
    const/4 v0, 0x1

    invoke-direct {v4, v0, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyFixedXOrYPosition(ZLcom/itextpdf/kernel/geom/Rectangle;)V

    .line 327
    const/4 v0, 0x0

    invoke-virtual {v4, v15, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 329
    const/16 v0, 0x1a

    if-eqz v10, :cond_13

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v27

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v28

    cmpg-float v27, v27, v28

    if-gtz v27, :cond_13

    move/from16 v27, v1

    .end local v1    # "verticalBorderSpacing":F
    .local v27, "verticalBorderSpacing":F
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 330
    move-object/from16 v28, v3

    .end local v3    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v28, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    .line 331
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sub-float/2addr v1, v3

    invoke-virtual {v15, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 332
    const/4 v7, 0x1

    move/from16 v29, v7

    goto :goto_c

    .line 329
    .end local v27    # "verticalBorderSpacing":F
    .end local v28    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v1    # "verticalBorderSpacing":F
    .restart local v3    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_13
    move/from16 v27, v1

    move-object/from16 v28, v3

    .line 335
    .end local v1    # "verticalBorderSpacing":F
    .end local v3    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v27    # "verticalBorderSpacing":F
    .restart local v28    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_14
    move/from16 v29, v7

    .end local v7    # "wasHeightClipped":Z
    .local v29, "wasHeightClipped":Z
    :goto_c
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getCaption()Lcom/itextpdf/layout/element/Div;

    move-result-object v1

    invoke-direct {v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->initializeCaptionRenderer(Lcom/itextpdf/layout/element/Div;)V

    .line 336
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    if-eqz v1, :cond_19

    .line 337
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DivRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v7

    .line 338
    .local v7, "minCaptionWidth":F
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    new-instance v3, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v0, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 339
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v4

    move/from16 v31, v5

    .end local v5    # "clearHeightCorrection":F
    .local v31, "clearHeightCorrection":F
    new-instance v5, Lcom/itextpdf/kernel/geom/Rectangle;

    move-object/from16 v32, v6

    .end local v6    # "blockMinHeight":Ljava/lang/Float;
    .local v32, "blockMinHeight":Ljava/lang/Float;
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v6

    move-object/from16 v33, v8

    .end local v8    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v33, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    move/from16 v34, v9

    .end local v9    # "marginsCollapsingEnabled":Z
    .local v34, "marginsCollapsingEnabled":Z
    invoke-static {v2, v7}, Ljava/lang/Math;->max(FF)F

    move-result v9

    move/from16 v35, v2

    .end local v2    # "tableWidth":F
    .local v35, "tableWidth":F
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-direct {v5, v6, v8, v9, v2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v0, v4, v5}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v29, :cond_16

    if-eqz v12, :cond_15

    goto :goto_d

    :cond_15
    const/4 v2, 0x0

    goto :goto_e

    :cond_16
    :goto_d
    const/4 v2, 0x1

    :goto_e
    invoke-direct {v3, v0, v2}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    .line 338
    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/DivRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v6

    .line 340
    .local v6, "captionLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    const/4 v9, 0x1

    if-eq v9, v0, :cond_17

    .line 341
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v3, 0x0

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    const/4 v1, 0x3

    const/4 v2, 0x0

    move-object/from16 v4, v28

    move-object/from16 v28, v11

    move-object v11, v4

    move-object/from16 v4, p0

    move/from16 v8, v16

    move/from16 v9, v27

    move-object/from16 v27, v10

    move/from16 v10, v35

    move/from16 v35, v12

    move/from16 v12, v31

    move-object/from16 v31, v18

    .end local v16    # "horizontalBorderSpacing":F
    .end local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v8, "horizontalBorderSpacing":F
    .local v9, "verticalBorderSpacing":F
    .local v10, "tableWidth":F
    .local v11, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "clearHeightCorrection":F
    .local v27, "blockMaxHeight":Ljava/lang/Float;
    .local v28, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v31, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v35, "wasParentsHeightClipped":Z
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0

    .line 343
    .end local v8    # "horizontalBorderSpacing":F
    .end local v9    # "verticalBorderSpacing":F
    .local v10, "blockMaxHeight":Ljava/lang/Float;
    .local v11, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v12, "wasParentsHeightClipped":Z
    .restart local v16    # "horizontalBorderSpacing":F
    .restart local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v27, "verticalBorderSpacing":F
    .local v28, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v31, "clearHeightCorrection":F
    .local v35, "tableWidth":F
    :cond_17
    move-object/from16 v4, v28

    move-object/from16 v28, v11

    move-object v11, v4

    move-object/from16 v4, p0

    move/from16 v8, v16

    move/from16 v9, v27

    move-object/from16 v27, v10

    move/from16 v10, v35

    move/from16 v35, v12

    move/from16 v12, v31

    move-object/from16 v31, v18

    .end local v16    # "horizontalBorderSpacing":F
    .end local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v8    # "horizontalBorderSpacing":F
    .restart local v9    # "verticalBorderSpacing":F
    .local v10, "tableWidth":F
    .local v11, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "clearHeightCorrection":F
    .local v27, "blockMaxHeight":Ljava/lang/Float;
    .local v28, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v31, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v35, "wasParentsHeightClipped":Z
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 344
    .local v0, "captionHeight":F
    sget-object v1, Lcom/itextpdf/layout/properties/CaptionSide;->BOTTOM:Lcom/itextpdf/layout/properties/CaptionSide;

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->getCaption()Lcom/itextpdf/layout/element/Div;

    move-result-object v2

    const/16 v3, 0x77

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/element/Div;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/properties/CaptionSide;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 345
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v2, v0

    neg-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/layout/renderer/DivRenderer;->move(FF)V

    .line 346
    invoke-virtual {v15, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 347
    invoke-virtual {v15, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_f

    .line 349
    :cond_18
    invoke-virtual {v15, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_f

    .line 336
    .end local v0    # "captionHeight":F
    .end local v7    # "minCaptionWidth":F
    .end local v31    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v32    # "blockMinHeight":Ljava/lang/Float;
    .end local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v34    # "marginsCollapsingEnabled":Z
    .end local v35    # "wasParentsHeightClipped":Z
    .restart local v2    # "tableWidth":F
    .restart local v5    # "clearHeightCorrection":F
    .local v6, "blockMinHeight":Ljava/lang/Float;
    .local v8, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v9, "marginsCollapsingEnabled":Z
    .local v10, "blockMaxHeight":Ljava/lang/Float;
    .local v11, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v12, "wasParentsHeightClipped":Z
    .restart local v16    # "horizontalBorderSpacing":F
    .restart local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v27, "verticalBorderSpacing":F
    .local v28, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_19
    move-object/from16 v31, v28

    move-object/from16 v28, v11

    move-object/from16 v11, v31

    move-object/from16 v32, v6

    move-object/from16 v33, v8

    move/from16 v34, v9

    move/from16 v35, v12

    move/from16 v8, v16

    move-object/from16 v31, v18

    move/from16 v9, v27

    move v12, v5

    move-object/from16 v27, v10

    move v10, v2

    .line 353
    .end local v2    # "tableWidth":F
    .end local v5    # "clearHeightCorrection":F
    .end local v6    # "blockMinHeight":Ljava/lang/Float;
    .end local v16    # "horizontalBorderSpacing":F
    .end local v18    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v8, "horizontalBorderSpacing":F
    .local v9, "verticalBorderSpacing":F
    .local v10, "tableWidth":F
    .local v11, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "clearHeightCorrection":F
    .local v27, "blockMaxHeight":Ljava/lang/Float;
    .local v28, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v31    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v32    # "blockMinHeight":Ljava/lang/Float;
    .restart local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v34    # "marginsCollapsingEnabled":Z
    .restart local v35    # "wasParentsHeightClipped":Z
    :goto_f
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v1

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    add-float/2addr v5, v6

    const/4 v6, 0x0

    invoke-direct {v2, v3, v5, v10, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 355
    invoke-static {v4}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 357
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v1, 0xa

    if-eqz v0, :cond_21

    .line 359
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-direct {v4, v0, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->prepareFooterOrHeaderRendererForLayout(Lcom/itextpdf/layout/renderer/TableRenderer;F)Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 362
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1c

    if-nez v17, :cond_1a

    const/4 v3, 0x0

    goto :goto_10

    .line 364
    :cond_1a
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_1b

    .line 365
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_11

    .line 364
    :cond_1b
    const/4 v3, 0x0

    goto :goto_11

    .line 362
    :cond_1c
    const/4 v3, 0x0

    .line 363
    :goto_10
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 368
    :goto_11
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v2, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v3, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v5

    invoke-direct {v3, v5, v15}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v29, :cond_1e

    if-eqz v35, :cond_1d

    goto :goto_12

    :cond_1d
    const/4 v5, 0x0

    goto :goto_13

    :cond_1e
    :goto_12
    const/4 v5, 0x1

    :goto_13
    invoke-direct {v2, v3, v5}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v6

    .line 369
    .local v6, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1f

    .line 371
    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    .line 372
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v3, 0x0

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0

    .line 374
    :cond_1f
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 375
    .local v0, "footerHeight":F
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    sub-float/2addr v3, v0

    neg-float v3, v3

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 376
    invoke-virtual {v15, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 379
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 380
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_20

    .line 381
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxTopWidth()F

    move-result v2

    .line 382
    .local v2, "maxFooterTopBorderWidth":F
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 383
    invoke-virtual {v15, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 387
    .end local v2    # "maxFooterTopBorderWidth":F
    :cond_20
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v3, 0x1a

    invoke-virtual {v4, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 388
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 392
    .end local v0    # "footerHeight":F
    .end local v6    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_21
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v2, 0xd

    if-eqz v0, :cond_27

    .line 393
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    invoke-direct {v4, v0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->prepareFooterOrHeaderRendererForLayout(Lcom/itextpdf/layout/renderer/TableRenderer;F)Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 394
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_22

    .line 395
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v5

    const/16 v25, 0x1

    xor-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v3, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithHeader(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_14

    .line 396
    :cond_22
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_23

    .line 397
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v5, 0x1

    invoke-virtual {v0, v3, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithHeader(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 401
    :cond_23
    :goto_14
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxTopWidth()F

    move-result v0

    iput v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->topBorderMaxWidth:F

    .line 402
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v3, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v5, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v6

    invoke-direct {v5, v6, v15}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v29, :cond_25

    if-eqz v35, :cond_24

    goto :goto_15

    :cond_24
    const/4 v6, 0x0

    goto :goto_16

    :cond_25
    :goto_15
    const/4 v6, 0x1

    :goto_16
    invoke-direct {v3, v5, v6}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v6

    .line 403
    .restart local v6    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    const/4 v5, 0x1

    if-eq v0, v5, :cond_26

    .line 405
    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    .line 406
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v3, 0x0

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0

    .line 408
    :cond_26
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 409
    .local v0, "headerHeight":F
    invoke-virtual {v15, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 410
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 411
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v3, v5, v15}, Lcom/itextpdf/layout/renderer/TableBorders;->fixHeaderOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 414
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 415
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 419
    .end local v0    # "headerHeight":F
    .end local v6    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_27
    const/4 v0, 0x0

    invoke-direct {v4, v15, v8, v9, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySpacing(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 420
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    const/4 v5, 0x1

    invoke-direct {v4, v3, v8, v5, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 421
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    const/high16 v36, 0x40000000    # 2.0f

    div-float v3, v9, v36

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 423
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxTopWidth()F

    move-result v0

    iput v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->topBorderMaxWidth:F

    .line 424
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v3, 0x0

    invoke-virtual {v0, v15, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 426
    move v5, v13

    .end local v13    # "numberOfColumns":I
    .local v5, "numberOfColumns":I
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 427
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_29

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_28

    goto :goto_17

    :cond_28
    const/16 v16, 0x0

    goto :goto_18

    :cond_29
    :goto_17
    const/16 v16, 0x1

    .line 426
    :goto_18
    const/16 v18, 0x0

    move-object v3, v14

    move-object v14, v0

    move-object v0, v3

    move v3, v5

    const/16 v5, 0x2e

    .end local v5    # "numberOfColumns":I
    .end local v14    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v0, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v3, "numberOfColumns":I
    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 428
    move/from16 v21, v17

    .end local v17    # "isAndWasComplete":Z
    .local v21, "isAndWasComplete":Z
    iget-object v6, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v6, v6, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v6, :cond_2a

    .line 429
    iget-object v6, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v6

    .line 430
    .local v6, "bottomBorderWidth":F
    nop

    .line 431
    invoke-virtual {v15, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    .line 432
    invoke-virtual {v7, v6}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 435
    .end local v6    # "bottomBorderWidth":F
    :cond_2a
    new-array v6, v3, [Lcom/itextpdf/layout/layout/LayoutResult;

    .line 438
    .local v6, "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    move v13, v3

    .end local v3    # "numberOfColumns":I
    .restart local v13    # "numberOfColumns":I
    new-array v3, v13, [I

    .line 440
    .local v3, "targetOverflowRowIndex":[I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 442
    .local v7, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    const/4 v14, 0x0

    .local v14, "row":I
    :goto_19
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const-class v37, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-ge v14, v1, :cond_ae

    .line 443
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 446
    .local v1, "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/4 v5, 0x1

    if-ne v14, v5, :cond_2c

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v42, v3

    const/16 v2, 0x1a

    .end local v3    # "targetOverflowRowIndex":[I
    .local v42, "targetOverflowRowIndex":[I
    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 447
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 448
    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    goto :goto_1a

    .line 450
    :cond_2b
    const/16 v26, 0x0

    invoke-static/range {v26 .. v26}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_1a

    .line 446
    .end local v42    # "targetOverflowRowIndex":[I
    .restart local v3    # "targetOverflowRowIndex":[I
    :cond_2c
    move-object/from16 v42, v3

    .line 454
    .end local v3    # "targetOverflowRowIndex":[I
    .restart local v42    # "targetOverflowRowIndex":[I
    :cond_2d
    :goto_1a
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 455
    .local v2, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    const/4 v3, 0x0

    .line 456
    .local v3, "rowHeight":F
    const/4 v5, 0x0

    .line 458
    .local v5, "split":Z
    const/16 v43, 0x1

    .line 462
    .local v43, "hasContent":Z
    const/16 v44, 0x0

    .line 463
    .local v44, "cellWithBigRowspanAdded":Z
    new-instance v45, Ljava/util/ArrayList;

    invoke-direct/range {v45 .. v45}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v46, v45

    .line 465
    .local v46, "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    new-instance v45, Ljava/util/ArrayDeque;

    invoke-direct/range {v45 .. v45}, Ljava/util/ArrayDeque;-><init>()V

    move-object/from16 v47, v45

    .line 466
    .local v47, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    const/16 v45, 0x0

    move/from16 v48, v3

    move/from16 v3, v45

    .local v3, "col":I
    .local v48, "rowHeight":F
    :goto_1b
    move/from16 v45, v5

    .end local v5    # "split":Z
    .local v45, "split":Z
    array-length v5, v2

    if-ge v3, v5, :cond_2f

    .line 467
    aget-object v5, v2, v3

    if-eqz v5, :cond_2e

    .line 468
    new-instance v5, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;

    move-object/from16 v49, v6

    .end local v6    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .local v49, "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    aget-object v6, v2, v3

    invoke-direct {v5, v6, v3, v14}, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;-><init>(Lcom/itextpdf/layout/renderer/CellRenderer;II)V

    move-object/from16 v6, v47

    .end local v47    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v6, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    invoke-interface {v6, v5}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    goto :goto_1c

    .line 467
    .end local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .local v6, "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v47    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    :cond_2e
    move-object/from16 v49, v6

    move-object/from16 v6, v47

    .line 466
    .end local v47    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v6, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_1c
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v47, v6

    move/from16 v5, v45

    move-object/from16 v6, v49

    goto :goto_1b

    .line 471
    .end local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .local v6, "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v47    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    :cond_2f
    move-object/from16 v49, v6

    move-object/from16 v6, v47

    .end local v47    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v6, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    const/4 v5, 0x0

    .line 473
    .local v5, "rowHasCellWithSetHeight":Z
    const/16 v47, 0x0

    .line 477
    .local v47, "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    move/from16 v50, v3

    .end local v3    # "col":I
    .local v50, "col":I
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    move/from16 v51, v5

    .end local v5    # "rowHasCellWithSetHeight":Z
    .local v51, "rowHasCellWithSetHeight":Z
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v5

    add-int/2addr v5, v14

    invoke-virtual {v3, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 478
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    .line 479
    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v5

    add-int/2addr v5, v14

    const/16 v25, 0x1

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v3

    .line 480
    .local v3, "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    invoke-static {v3}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getWidestBorder(Ljava/util/List;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v5

    .line 481
    .local v5, "widestRowBottomBorder":Lcom/itextpdf/layout/borders/Border;
    if-nez v5, :cond_30

    const/16 v52, 0x0

    goto :goto_1d

    :cond_30
    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v52

    .line 482
    .local v52, "widestRowBottomBorderWidth":F
    :goto_1d
    move-object/from16 v53, v5

    .end local v5    # "widestRowBottomBorder":Lcom/itextpdf/layout/borders/Border;
    .local v53, "widestRowBottomBorder":Lcom/itextpdf/layout/borders/Border;
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    move/from16 v54, v9

    .end local v9    # "verticalBorderSpacing":F
    .local v54, "verticalBorderSpacing":F
    iget-object v9, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v9}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v9

    invoke-virtual {v5, v9}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    move/from16 v5, v48

    .line 485
    .end local v48    # "rowHeight":F
    .local v5, "rowHeight":F
    :goto_1e
    invoke-interface {v6}, Ljava/util/Deque;->size()I

    move-result v9

    move/from16 v48, v10

    .end local v10    # "tableWidth":F
    .local v48, "tableWidth":F
    if-lez v9, :cond_5c

    .line 486
    invoke-interface {v6}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;

    .line 487
    .local v9, "currentCellInfo":Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;
    const/16 v56, 0x3

    iget v10, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->column:I

    .line 488
    .end local v50    # "col":I
    .local v10, "col":I
    move/from16 v57, v13

    .end local v13    # "numberOfColumns":I
    .local v57, "numberOfColumns":I
    iget-object v13, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->cellRenderer:Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 489
    .local v13, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    move-object/from16 v58, v11

    const/16 v11, 0x10

    .end local v11    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v58, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {v13, v11}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 490
    .local v11, "colspan":I
    move/from16 v59, v12

    .end local v12    # "clearHeightCorrection":F
    .local v59, "clearHeightCorrection":F
    const/16 v12, 0x3c

    invoke-virtual {v13, v12}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 491
    .local v12, "rowspan":I
    move-object/from16 v60, v7

    const/4 v7, 0x1

    .end local v7    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .local v60, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    if-eq v7, v12, :cond_31

    .line 492
    const/4 v7, 0x1

    move/from16 v44, v7

    .line 494
    :cond_31
    iget v7, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    aput v7, v42, v10

    .line 496
    iget v7, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    if-eq v14, v7, :cond_32

    const/4 v7, 0x1

    goto :goto_1f

    :cond_32
    const/4 v7, 0x0

    .line 497
    .local v7, "currentCellHasBigRowspan":Z
    :goto_1f
    move/from16 v50, v7

    .end local v7    # "currentCellHasBigRowspan":Z
    .local v50, "currentCellHasBigRowspan":Z
    const/16 v7, 0x1b

    invoke-virtual {v13, v7}, Lcom/itextpdf/layout/renderer/CellRenderer;->hasOwnOrModelProperty(I)Z

    move-result v7

    if-eqz v7, :cond_33

    .line 498
    const/4 v7, 0x1

    move/from16 v51, v7

    .line 500
    :cond_33
    const/4 v7, 0x0

    .local v7, "cellWidth":F
    const/16 v61, 0x0

    .line 501
    .local v61, "colOffset":F
    move/from16 v62, v10

    move/from16 v83, v62

    move/from16 v62, v5

    move/from16 v5, v83

    .local v5, "k":I
    .local v62, "rowHeight":F
    :goto_20
    move-object/from16 v63, v6

    .end local v6    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v63, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    add-int v6, v10, v11

    if-ge v5, v6, :cond_34

    .line 502
    iget-object v6, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    aget v6, v6, v5

    add-float/2addr v7, v6

    .line 501
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v6, v63

    goto :goto_20

    .line 504
    .end local v5    # "k":I
    :cond_34
    const/4 v5, 0x0

    .local v5, "l":I
    :goto_21
    if-ge v5, v10, :cond_35

    .line 505
    iget-object v6, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    aget v6, v6, v5

    add-float v61, v61, v6

    .line 504
    add-int/lit8 v5, v5, 0x1

    goto :goto_21

    .line 507
    .end local v5    # "l":I
    :cond_35
    const/4 v5, 0x0

    .line 508
    .local v5, "rowspanOffset":F
    add-int/lit8 v6, v14, -0x1

    .local v6, "m":I
    :goto_22
    move/from16 v64, v5

    .end local v5    # "rowspanOffset":F
    .local v64, "rowspanOffset":F
    iget v5, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    sub-int/2addr v5, v12

    if-le v6, v5, :cond_36

    if-ltz v6, :cond_36

    .line 509
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    add-float v5, v64, v5

    .line 508
    .end local v64    # "rowspanOffset":F
    .restart local v5    # "rowspanOffset":F
    add-int/lit8 v6, v6, -0x1

    goto :goto_22

    .line 511
    .end local v5    # "rowspanOffset":F
    .end local v6    # "m":I
    .restart local v64    # "rowspanOffset":F
    :cond_36
    if-eqz v50, :cond_38

    if-eqz v43, :cond_37

    goto :goto_23

    :cond_37
    const/4 v5, 0x0

    goto :goto_24

    :cond_38
    :goto_23
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    :goto_24
    add-float v5, v64, v5

    .line 512
    .local v5, "cellLayoutBoxHeight":F
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v6

    if-eqz v50, :cond_3a

    if-eqz v43, :cond_39

    goto :goto_25

    :cond_39
    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v65

    goto :goto_26

    :cond_3a
    :goto_25
    const/16 v65, 0x0

    :goto_26
    add-float v6, v6, v65

    .line 513
    .local v6, "cellLayoutBoxBottom":F
    move-object/from16 v65, v2

    .end local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v65, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v66

    move-object/from16 v67, v15

    .end local v15    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v67, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    add-float v15, v66, v61

    invoke-direct {v2, v15, v6, v7, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 514
    .local v2, "cellLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v15, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v66

    move/from16 v68, v5

    .end local v5    # "cellLayoutBoxHeight":F
    .local v68, "cellLayoutBoxHeight":F
    invoke-virtual/range {v66 .. v66}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v5

    invoke-direct {v15, v5, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 515
    .local v15, "cellArea":Lcom/itextpdf/layout/layout/LayoutArea;
    const/16 v5, 0x4b

    invoke-virtual {v13, v5}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v66

    move-object/from16 v69, v2

    .end local v2    # "cellLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v69, "cellLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    move-object/from16 v2, v66

    check-cast v2, Lcom/itextpdf/layout/properties/VerticalAlignment;

    .line 516
    .local v2, "verticalAlignment":Lcom/itextpdf/layout/properties/VerticalAlignment;
    move/from16 v66, v6

    const/4 v6, 0x0

    .end local v6    # "cellLayoutBoxBottom":F
    .local v66, "cellLayoutBoxBottom":F
    invoke-virtual {v13, v5, v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 517
    const/16 v6, 0x4d

    invoke-virtual {v13, v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v70

    move-object/from16 v5, v70

    check-cast v5, Lcom/itextpdf/layout/properties/UnitValue;

    .line 518
    .local v5, "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v5, :cond_3b

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v70

    if-eqz v70, :cond_3b

    .line 519
    move/from16 v70, v7

    .end local v7    # "cellWidth":F
    .local v70, "cellWidth":F
    invoke-static/range {v70 .. v70}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v7

    invoke-virtual {v13, v6, v7}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_27

    .line 518
    .end local v70    # "cellWidth":F
    .restart local v7    # "cellWidth":F
    :cond_3b
    move/from16 v70, v7

    .line 522
    .end local v7    # "cellWidth":F
    .restart local v70    # "cellWidth":F
    :goto_27
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget v6, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    invoke-virtual {v7, v6, v10, v12, v11}, Lcom/itextpdf/layout/renderer/TableBorders;->getCellBorderIndents(IIII)[F

    move-result-object v6

    .line 524
    .local v6, "cellIndents":[F
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v7, v7, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-nez v7, :cond_3d

    .line 555
    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_3c

    const/4 v7, 0x0

    goto :goto_28

    .line 557
    :cond_3c
    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    :goto_28
    nop

    .line 558
    .local v7, "potentialWideCellBorder":F
    move-object/from16 v80, v3

    .end local v3    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v80, "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v74

    const/16 v26, 0x0

    aget v75, v6, v26

    const/16 v25, 0x1

    aget v76, v6, v25

    add-float v77, v7, v52

    aget v78, v6, v56

    const/16 v79, 0x0

    move-object/from16 v73, v3

    invoke-virtual/range {v73 .. v79}, Lcom/itextpdf/layout/renderer/TableBorders;->applyCellIndents(Lcom/itextpdf/kernel/geom/Rectangle;FFFFZ)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_29

    .line 524
    .end local v7    # "potentialWideCellBorder":F
    .end local v80    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .restart local v3    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_3d
    move-object/from16 v80, v3

    .line 562
    .end local v3    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .restart local v80    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :goto_29
    invoke-virtual {v15}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    .line 565
    .end local v70    # "cellWidth":F
    .local v3, "cellWidth":F
    const/16 v7, 0x6c

    invoke-virtual {v4, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v70

    move-object/from16 v7, v70

    check-cast v7, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 566
    .local v7, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v7, :cond_3e

    .line 567
    move/from16 v70, v10

    .end local v10    # "col":I
    .local v70, "col":I
    invoke-static {v13}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-virtual {v7, v4, v10}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 568
    invoke-static {v7, v13}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_2a

    .line 566
    .end local v70    # "col":I
    .restart local v10    # "col":I
    :cond_3e
    move/from16 v70, v10

    .line 571
    .end local v10    # "col":I
    .restart local v70    # "col":I
    :goto_2a
    invoke-virtual {v13, v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v10

    move/from16 v73, v11

    .end local v11    # "colspan":I
    .local v73, "colspan":I
    new-instance v11, Lcom/itextpdf/layout/layout/LayoutContext;

    if-nez v29, :cond_40

    if-eqz v35, :cond_3f

    goto :goto_2b

    :cond_3f
    move/from16 v74, v12

    const/4 v12, 0x0

    goto :goto_2c

    :cond_40
    :goto_2b
    move/from16 v74, v12

    const/4 v12, 0x1

    .end local v12    # "rowspan":I
    .local v74, "rowspan":I
    :goto_2c
    move-object/from16 v75, v6

    const/4 v6, 0x0

    .end local v6    # "cellIndents":[F
    .local v75, "cellIndents":[F
    invoke-direct {v11, v15, v6, v1, v12}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    invoke-interface {v10, v11}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v6

    .line 572
    .local v6, "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    if-eqz v5, :cond_41

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v10

    if-eqz v10, :cond_41

    .line 573
    const/16 v10, 0x4d

    invoke-virtual {v13, v10, v5}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 574
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v11

    if-eqz v11, :cond_41

    .line 575
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v11

    invoke-interface {v11, v10, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 578
    :cond_41
    const/16 v10, 0x4b

    invoke-virtual {v13, v10, v2}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 580
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v10

    move/from16 v11, v56

    if-eq v10, v11, :cond_42

    .line 581
    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v10, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_2d

    .line 582
    :cond_42
    if-nez v47, :cond_43

    .line 583
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v47

    .line 586
    :cond_43
    :goto_2d
    if-eqz v50, :cond_46

    .line 588
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v10

    const/4 v11, 0x1

    if-eq v10, v11, :cond_44

    .line 589
    aput-object v6, v49, v70

    .line 590
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v10

    const/4 v11, 0x3

    if-eq v10, v11, :cond_44

    .line 592
    aget-object v10, v49, v70

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v10

    sget-object v11, Lcom/itextpdf/layout/properties/VerticalAlignment;->TOP:Lcom/itextpdf/layout/properties/VerticalAlignment;

    const/16 v12, 0x4b

    invoke-interface {v10, v12, v11}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 595
    :cond_44
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v10

    const/4 v11, 0x2

    if-ne v10, v11, :cond_45

    .line 596
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v10, v65, v70

    move-object/from16 v72, v0

    move-object/from16 v76, v1

    move/from16 v78, v3

    move-object/from16 v79, v5

    move-object/from16 v5, v63

    move-object/from16 v12, v65

    move-object/from16 v1, v67

    const/16 v24, 0x0

    move-object/from16 v63, v6

    goto/16 :goto_3a

    .line 598
    :cond_45
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget v11, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/itextpdf/layout/renderer/CellRenderer;

    const/16 v40, 0x0

    aput-object v40, v10, v70

    .line 599
    aput-object v13, v65, v70

    .line 600
    invoke-static/range {v70 .. v70}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    iget v11, v9, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;->finishRowInd:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v72, v0

    move-object/from16 v76, v1

    move/from16 v78, v3

    move-object/from16 v79, v5

    move-object/from16 v5, v63

    move-object/from16 v12, v65

    move-object/from16 v1, v67

    const/16 v24, 0x0

    move-object/from16 v63, v6

    goto/16 :goto_3a

    .line 603
    :cond_46
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v10

    const/4 v11, 0x1

    if-eq v10, v11, :cond_5a

    .line 605
    if-nez v45, :cond_57

    .line 610
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v10, :cond_47

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isSkipLastFooter()Z

    move-result v10

    if-eqz v10, :cond_47

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v10

    if-eqz v10, :cond_47

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 611
    const/16 v11, 0x1a

    invoke-virtual {v4, v11}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_47

    const/4 v10, 0x1

    goto :goto_2e

    :cond_47
    const/4 v10, 0x0

    .line 612
    .local v10, "skipLastFooter":Z
    :goto_2e
    if-eqz v10, :cond_54

    .line 613
    new-instance v11, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v12

    move-object/from16 v72, v0

    .end local v0    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v72, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-virtual/range {v67 .. v67}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-direct {v11, v12, v0}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 614
    .local v11, "potentialArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    const/4 v12, 0x1

    invoke-direct {v4, v0, v8, v12, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 616
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v12}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v12

    add-int/2addr v12, v14

    invoke-virtual {v0, v12}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestHorizontalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    .line 617
    .local v0, "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v12, v12, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v12, :cond_48

    if-eqz v0, :cond_48

    .line 618
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v76

    move-object/from16 v77, v0

    .end local v0    # "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    .local v77, "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    div-float v0, v76, v36

    invoke-virtual {v12, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_2f

    .line 617
    .end local v77    # "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    .restart local v0    # "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_48
    move-object/from16 v77, v0

    .line 620
    .end local v0    # "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    .restart local v77    # "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    :goto_2f
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_49

    .line 621
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v12}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxTopWidth()F

    move-result v12

    invoke-virtual {v0, v12}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 623
    :cond_49
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    move-object/from16 v76, v1

    const/4 v1, 0x1

    .end local v1    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v76, "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {v0, v12, v1}, Lcom/itextpdf/layout/renderer/TableBorders;->applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 624
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 625
    .local v0, "footerHeight":F
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    div-float v12, v54, v36

    sub-float v12, v0, v12

    invoke-virtual {v1, v12}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 627
    new-instance v1, Lcom/itextpdf/layout/element/Table$RowRange;

    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v12}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v12

    add-int/2addr v12, v14

    move/from16 v78, v3

    .end local v3    # "cellWidth":F
    .local v78, "cellWidth":F
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v3

    invoke-direct {v1, v12, v3}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->createOverflowRenderer(Lcom/itextpdf/layout/element/Table$RowRange;)Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v1

    .line 628
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    invoke-interface {v3, v14, v12}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    iput-object v3, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 629
    const/16 v3, 0x61

    const/16 v25, 0x1

    invoke-static/range {v25 .. v25}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-virtual {v1, v3, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 630
    const/16 v3, 0x60

    invoke-static/range {v25 .. v25}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-virtual {v1, v3, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 631
    const/16 v24, 0x0

    invoke-static/range {v24 .. v24}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    const/16 v12, 0x2e

    invoke-virtual {v1, v12, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 632
    invoke-static/range {v24 .. v24}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    const/16 v12, 0x2b

    invoke-virtual {v1, v12, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 633
    const/16 v3, 0x2c

    invoke-static/range {v24 .. v24}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v12

    invoke-virtual {v1, v3, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 634
    const/16 v3, 0x2d

    invoke-static/range {v24 .. v24}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v12

    invoke-virtual {v1, v3, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 636
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v3, :cond_4a

    .line 637
    sget-object v3, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    const/16 v12, 0xd

    invoke-virtual {v1, v12, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->setProperty(ILjava/lang/Object;)V

    .line 639
    :cond_4a
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iput-object v3, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 641
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v12

    invoke-virtual {v3, v12}, Lcom/itextpdf/layout/renderer/TableBorders;->skipFooter([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 642
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v3, :cond_4b

    .line 643
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v12

    invoke-virtual {v3, v12}, Lcom/itextpdf/layout/renderer/TableBorders;->skipHeader([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 645
    :cond_4b
    iget-object v3, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget v3, v3, Lcom/itextpdf/layout/renderer/TableBorders;->startRow:I

    .line 646
    .local v3, "savedStartRow":I
    iget-object v12, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v12, v14}, Lcom/itextpdf/layout/renderer/TableBorders;->setStartRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 647
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v12

    invoke-direct {v4, v1, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->prepareFooterOrHeaderRendererForLayout(Lcom/itextpdf/layout/renderer/TableRenderer;F)Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 648
    new-instance v12, Lcom/itextpdf/layout/layout/LayoutContext;

    if-nez v29, :cond_4d

    if-eqz v35, :cond_4c

    goto :goto_30

    :cond_4c
    move-object/from16 v79, v5

    const/4 v5, 0x0

    goto :goto_31

    :cond_4d
    :goto_30
    move-object/from16 v79, v5

    const/4 v5, 0x1

    .end local v5    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .local v79, "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_31
    invoke-direct {v12, v11, v5}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-virtual {v1, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v5

    .line 649
    .local v5, "res":Lcom/itextpdf/layout/layout/LayoutResult;
    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v12, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->setStartRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 650
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v12

    move-object/from16 v81, v1

    const/4 v1, 0x1

    .end local v1    # "overflowRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    .local v81, "overflowRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    if-ne v1, v12, :cond_52

    .line 651
    if-eqz v7, :cond_4e

    .line 653
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v7, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 655
    :cond_4e
    const/4 v1, 0x0

    iput-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 657
    move-object/from16 v1, v67

    .end local v67    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 658
    const/16 v12, 0xa

    invoke-virtual {v4, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    .line 660
    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    move/from16 v67, v0

    .end local v0    # "footerHeight":F
    .local v67, "footerHeight":F
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v0

    add-int/2addr v0, v14

    invoke-virtual {v12, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 661
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v12}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v12

    add-int/2addr v12, v14

    const/16 v25, 0x1

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {v0, v12}, Lcom/itextpdf/layout/renderer/TableBorders;->getWidestHorizontalBorder(I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v53

    .line 662
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v12, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v12}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v12

    invoke-virtual {v0, v12}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 663
    if-nez v53, :cond_4f

    move/from16 v0, v24

    goto :goto_32

    :cond_4f
    invoke-virtual/range {v53 .. v53}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    :goto_32
    move/from16 v52, v0

    .line 665
    invoke-interface/range {v63 .. v63}, Ljava/util/Deque;->clear()V

    .line 666
    invoke-interface/range {v46 .. v46}, Ljava/util/List;->clear()V

    .line 667
    const/4 v0, 0x0

    .local v0, "addCol":I
    :goto_33
    move-object/from16 v12, v65

    move/from16 v65, v3

    .end local v3    # "savedStartRow":I
    .local v12, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v65, "savedStartRow":I
    array-length v3, v12

    if-ge v0, v3, :cond_51

    .line 668
    aget-object v3, v12, v0

    if-eqz v3, :cond_50

    .line 669
    new-instance v3, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;

    move-object/from16 v82, v5

    .end local v5    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v82, "res":Lcom/itextpdf/layout/layout/LayoutResult;
    aget-object v5, v12, v0

    invoke-direct {v3, v5, v0, v14}, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;-><init>(Lcom/itextpdf/layout/renderer/CellRenderer;II)V

    move-object/from16 v5, v63

    .end local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    invoke-interface {v5, v3}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    goto :goto_34

    .line 668
    .end local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v5, "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    :cond_50
    move-object/from16 v82, v5

    move-object/from16 v5, v63

    .line 667
    .end local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_34
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v63, v5

    move/from16 v3, v65

    move-object/from16 v5, v82

    move-object/from16 v65, v12

    goto :goto_33

    .end local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v5, "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    :cond_51
    move-object/from16 v82, v5

    move-object/from16 v5, v63

    .end local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    move-object v15, v1

    move-object v6, v5

    move-object v2, v12

    move/from16 v10, v48

    move/from16 v13, v57

    move-object/from16 v11, v58

    move/from16 v12, v59

    move-object/from16 v7, v60

    move/from16 v5, v62

    move/from16 v50, v70

    move-object/from16 v0, v72

    move-object/from16 v1, v76

    move-object/from16 v3, v80

    goto/16 :goto_1e

    .line 674
    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v0, "footerHeight":F
    .restart local v3    # "savedStartRow":I
    .local v5, "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v65, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v67, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_52
    move-object/from16 v82, v5

    move-object/from16 v5, v63

    move-object/from16 v12, v65

    move-object/from16 v1, v67

    move/from16 v67, v0

    move/from16 v65, v3

    .end local v0    # "footerHeight":F
    .end local v3    # "savedStartRow":I
    .end local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v65, "savedStartRow":I
    .local v67, "footerHeight":F
    .restart local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_53

    .line 675
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    move-object/from16 v63, v6

    const/4 v6, 0x0

    .end local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v63, "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v0, v3, v6}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithHeader(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_35

    .line 674
    .end local v63    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_53
    move-object/from16 v63, v6

    const/4 v6, 0x0

    .line 677
    .end local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v63    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_35
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0, v3, v6}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 678
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    sget-object v3, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    const/16 v55, 0x2

    aput-object v3, v0, v55

    goto :goto_36

    .line 612
    .end local v11    # "potentialArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v77    # "widestRowTopBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v78    # "cellWidth":F
    .end local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v81    # "overflowRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    .end local v82    # "res":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v0, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v1, "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v3, "cellWidth":F
    .local v5, "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v63, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v65, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v67, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_54
    move-object/from16 v72, v0

    move-object/from16 v76, v1

    move/from16 v78, v3

    move-object/from16 v79, v5

    move-object/from16 v5, v63

    move-object/from16 v12, v65

    move-object/from16 v1, v67

    const/16 v24, 0x0

    move-object/from16 v63, v6

    const/4 v6, 0x0

    .line 685
    .end local v0    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v3    # "cellWidth":F
    .end local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v67    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v63, "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v78    # "cellWidth":F
    .restart local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_36
    const/4 v0, 0x0

    .local v0, "addCol":I
    :goto_37
    array-length v3, v12

    if-ge v0, v3, :cond_58

    .line 686
    aget-object v3, v12, v0

    if-nez v3, :cond_56

    .line 688
    add-int/lit8 v3, v14, 0x1

    .local v3, "addRow":I
    :goto_38
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-ge v3, v11, :cond_56

    .line 689
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v11, v11, v0

    if-eqz v11, :cond_55

    .line 690
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v11, v11, v0

    .line 691
    .local v11, "addRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    const/16 v6, 0x3c

    invoke-virtual {v11, v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v55

    invoke-virtual/range {v55 .. v55}, Ljava/lang/Integer;->intValue()I

    move-result v55

    add-int v55, v14, v55

    const/16 v25, 0x1

    add-int/lit8 v6, v55, -0x1

    if-lt v6, v3, :cond_56

    .line 692
    new-instance v6, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;

    invoke-direct {v6, v11, v0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;-><init>(Lcom/itextpdf/layout/renderer/CellRenderer;II)V

    invoke-interface {v5, v6}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    goto :goto_39

    .line 688
    .end local v11    # "addRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_55
    add-int/lit8 v3, v3, 0x1

    const/4 v6, 0x0

    goto :goto_38

    .line 685
    .end local v3    # "addRow":I
    :cond_56
    :goto_39
    add-int/lit8 v0, v0, 0x1

    const/4 v6, 0x0

    goto :goto_37

    .line 605
    .end local v10    # "skipLastFooter":Z
    .end local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v78    # "cellWidth":F
    .end local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .local v0, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v1, "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v3, "cellWidth":F
    .local v5, "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v63, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v67    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_57
    move-object/from16 v72, v0

    move-object/from16 v76, v1

    move/from16 v78, v3

    move-object/from16 v79, v5

    move-object/from16 v5, v63

    move-object/from16 v12, v65

    move-object/from16 v1, v67

    const/16 v24, 0x0

    move-object/from16 v63, v6

    .line 700
    .end local v0    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v3    # "cellWidth":F
    .end local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v67    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v63, "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v78    # "cellWidth":F
    .restart local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_58
    const/4 v0, 0x1

    .line 701
    .end local v45    # "split":Z
    .local v0, "split":Z
    aput-object v63, v49, v70

    .line 702
    invoke-virtual/range {v63 .. v63}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    const/4 v11, 0x3

    if-ne v3, v11, :cond_59

    .line 703
    const/4 v3, 0x0

    .line 704
    .end local v43    # "hasContent":Z
    .local v3, "hasContent":Z
    aget-object v6, v49, v70

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v6

    const/16 v10, 0x4b

    invoke-interface {v6, v10, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    move/from16 v45, v0

    move/from16 v43, v3

    goto :goto_3a

    .line 702
    .end local v3    # "hasContent":Z
    .restart local v43    # "hasContent":Z
    :cond_59
    move/from16 v45, v0

    goto :goto_3a

    .line 603
    .end local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v78    # "cellWidth":F
    .end local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .local v0, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v1, "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v3, "cellWidth":F
    .local v5, "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v45    # "split":Z
    .local v63, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v67    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_5a
    move-object/from16 v72, v0

    move-object/from16 v76, v1

    move/from16 v78, v3

    move-object/from16 v79, v5

    move-object/from16 v5, v63

    move-object/from16 v12, v65

    move-object/from16 v1, v67

    const/16 v24, 0x0

    move-object/from16 v63, v6

    .line 708
    .end local v0    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v3    # "cellWidth":F
    .end local v6    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v67    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v12    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v63, "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v78    # "cellWidth":F
    .restart local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_3a
    move-object/from16 v10, v46

    .end local v46    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v10, "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-interface {v10, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    invoke-virtual/range {v63 .. v63}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    const/4 v11, 0x3

    if-eq v0, v11, :cond_5b

    .line 710
    invoke-virtual/range {v63 .. v63}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    move-object/from16 v6, v75

    .end local v75    # "cellIndents":[F
    .local v6, "cellIndents":[F
    invoke-virtual {v3, v6}, Lcom/itextpdf/layout/renderer/TableBorders;->getCellVerticalAddition([F)F

    move-result v3

    add-float/2addr v0, v3

    sub-float v0, v0, v64

    move/from16 v3, v62

    .end local v62    # "rowHeight":F
    .local v3, "rowHeight":F
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .end local v3    # "rowHeight":F
    .local v0, "rowHeight":F
    goto :goto_3b

    .line 709
    .end local v0    # "rowHeight":F
    .end local v6    # "cellIndents":[F
    .restart local v62    # "rowHeight":F
    .restart local v75    # "cellIndents":[F
    :cond_5b
    move/from16 v3, v62

    move-object/from16 v6, v75

    .end local v62    # "rowHeight":F
    .end local v75    # "cellIndents":[F
    .restart local v3    # "rowHeight":F
    .restart local v6    # "cellIndents":[F
    move v0, v3

    .line 712
    .end local v2    # "verticalAlignment":Lcom/itextpdf/layout/properties/VerticalAlignment;
    .end local v3    # "rowHeight":F
    .end local v6    # "cellIndents":[F
    .end local v7    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v9    # "currentCellInfo":Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;
    .end local v13    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v15    # "cellArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v50    # "currentCellHasBigRowspan":Z
    .end local v61    # "colOffset":F
    .end local v63    # "cellResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v64    # "rowspanOffset":F
    .end local v66    # "cellLayoutBoxBottom":F
    .end local v68    # "cellLayoutBoxHeight":F
    .end local v69    # "cellLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v73    # "colspan":I
    .end local v74    # "rowspan":I
    .end local v78    # "cellWidth":F
    .end local v79    # "cellWidthProperty":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v0    # "rowHeight":F
    :goto_3b
    move-object v15, v1

    move-object v6, v5

    move-object/from16 v46, v10

    move-object v2, v12

    move/from16 v10, v48

    move/from16 v13, v57

    move-object/from16 v11, v58

    move/from16 v12, v59

    move-object/from16 v7, v60

    move/from16 v50, v70

    move-object/from16 v1, v76

    move-object/from16 v3, v80

    move v5, v0

    move-object/from16 v0, v72

    goto/16 :goto_1e

    .line 713
    .end local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v57    # "numberOfColumns":I
    .end local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v59    # "clearHeightCorrection":F
    .end local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .end local v70    # "col":I
    .end local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v80    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v0, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v1, "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v2, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v3, "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v5, "rowHeight":F
    .local v6, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .local v7, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .local v11, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "clearHeightCorrection":F
    .local v13, "numberOfColumns":I
    .local v15, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v46    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v50, "col":I
    :cond_5c
    move-object/from16 v72, v0

    move-object/from16 v76, v1

    move-object/from16 v80, v3

    move v3, v5

    move-object v5, v6

    move-object/from16 v60, v7

    move-object/from16 v58, v11

    move/from16 v59, v12

    move/from16 v57, v13

    move-object v1, v15

    move-object/from16 v10, v46

    const/16 v24, 0x0

    move-object v12, v2

    .end local v0    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v2    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v6    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .end local v7    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .end local v11    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v13    # "numberOfColumns":I
    .end local v15    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v46    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v3, "rowHeight":F
    .local v5, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v12, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v57    # "numberOfColumns":I
    .restart local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v59    # "clearHeightCorrection":F
    .restart local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .restart local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v80    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    if-eqz v43, :cond_5d

    .line 714
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 715
    invoke-static/range {v51 .. v51}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object/from16 v6, v60

    .end local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .local v6, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 716
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 717
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 718
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_3c

    .line 713
    .end local v6    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .restart local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    :cond_5d
    move-object/from16 v6, v60

    .line 721
    .end local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .restart local v6    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    :goto_3c
    if-nez v45, :cond_5f

    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v25, 0x1

    add-int/lit8 v0, v0, -0x1

    if-ne v14, v0, :cond_5e

    goto :goto_3d

    :cond_5e
    move-object v15, v1

    move/from16 v62, v3

    move-object/from16 v63, v5

    move/from16 v16, v8

    move-object/from16 v65, v12

    move v2, v14

    move/from16 v11, v24

    move-object/from16 v3, v42

    move/from16 v12, v57

    const/16 v13, 0xa

    const/4 v14, 0x1

    const/16 v17, 0xd

    const/16 v18, 0x56

    const/16 v22, 0x2b

    const/16 v26, 0x0

    const/16 v30, 0x1a

    const/16 v38, 0x2e

    const/16 v39, 0x6c

    const/16 v40, 0x0

    move-object/from16 v60, v6

    goto/16 :goto_42

    .line 722
    :cond_5f
    :goto_3d
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getStartRow()I

    move-result v2

    add-int/2addr v2, v14

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 723
    if-nez v43, :cond_60

    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getFinishRow()I

    move-result v0

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getStartRow()I

    move-result v2

    if-eq v0, v2, :cond_60

    .line 724
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getFinishRow()I

    move-result v2

    const/16 v25, 0x1

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TableBorders;->setFinishRow(I)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_3e

    .line 723
    :cond_60
    const/16 v25, 0x1

    .line 726
    :goto_3e
    const/4 v0, 0x0

    .line 727
    .local v0, "skip":Z
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v2, :cond_64

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isSkipLastFooter()Z

    move-result v2

    if-eqz v2, :cond_64

    if-nez v45, :cond_64

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 728
    const/16 v11, 0x1a

    invoke-virtual {v4, v11}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_63

    .line 729
    const/16 v7, 0x6c

    invoke-virtual {v4, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 730
    .local v2, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v2, :cond_61

    .line 732
    iget-object v9, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v2, v9}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 734
    :cond_61
    const/4 v9, 0x0

    iput-object v9, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 735
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_62

    .line 736
    const/16 v13, 0xd

    invoke-virtual {v4, v13}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    goto :goto_3f

    .line 735
    :cond_62
    const/16 v13, 0xd

    .line 738
    :goto_3f
    const/4 v0, 0x1

    goto :goto_40

    .line 728
    .end local v2    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    :cond_63
    const/16 v7, 0x6c

    const/4 v9, 0x0

    const/16 v13, 0xd

    goto :goto_40

    .line 727
    :cond_64
    const/16 v7, 0x6c

    const/4 v9, 0x0

    const/16 v11, 0x1a

    const/16 v13, 0xd

    .line 741
    :goto_40
    move/from16 v39, v7

    xor-int/lit8 v7, v45, 0x1

    if-nez v43, :cond_65

    if-eqz v44, :cond_65

    move/from16 v2, v25

    goto :goto_41

    :cond_65
    const/4 v2, 0x0

    :goto_41
    move/from16 v62, v3

    move-object/from16 v63, v5

    move/from16 v16, v8

    move-object/from16 v40, v9

    move/from16 v30, v11

    move-object/from16 v65, v12

    move/from16 v17, v13

    move/from16 v11, v24

    move-object/from16 v3, v42

    move/from16 v12, v57

    const/16 v13, 0xa

    const/16 v18, 0x56

    const/16 v22, 0x2b

    const/16 v26, 0x0

    const/16 v38, 0x2e

    move v9, v0

    move-object v5, v1

    move v8, v2

    move-object v0, v4

    move v2, v14

    move/from16 v14, v25

    move-object/from16 v4, v32

    move-object/from16 v1, v49

    .end local v0    # "skip":Z
    .end local v8    # "horizontalBorderSpacing":F
    .end local v14    # "row":I
    .end local v32    # "blockMinHeight":Ljava/lang/Float;
    .end local v42    # "targetOverflowRowIndex":[I
    .end local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v57    # "numberOfColumns":I
    .local v1, "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .local v2, "row":I
    .local v3, "targetOverflowRowIndex":[I
    .local v4, "blockMinHeight":Ljava/lang/Float;
    .local v5, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v9, "skip":Z
    .local v12, "numberOfColumns":I
    .restart local v16    # "horizontalBorderSpacing":F
    .restart local v62    # "rowHeight":F
    .local v63, "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-direct/range {v0 .. v9}, Lcom/itextpdf/layout/renderer/TableRenderer;->correctLayoutedCellsOccupiedAreas([Lcom/itextpdf/layout/layout/LayoutResult;I[ILjava/lang/Float;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/util/List;ZZZ)V

    move-object v15, v5

    move-object v4, v0

    move-object/from16 v60, v6

    .line 744
    .end local v1    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v4    # "blockMinHeight":Ljava/lang/Float;
    .end local v5    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v6    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .end local v9    # "skip":Z
    .restart local v15    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v32    # "blockMinHeight":Ljava/lang/Float;
    .restart local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    :goto_42
    if-nez v45, :cond_67

    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v14

    if-ne v2, v0, :cond_66

    goto :goto_43

    :cond_66
    move/from16 v8, v16

    move-object/from16 v0, v33

    move/from16 v5, v43

    move/from16 v6, v44

    move/from16 v9, v54

    move-object/from16 v1, v65

    move/from16 v33, v14

    goto/16 :goto_4a

    :cond_67
    :goto_43
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_70

    .line 746
    if-nez v43, :cond_68

    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_68

    .line 747
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v15, v14}, Lcom/itextpdf/layout/renderer/TableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move v11, v14

    move/from16 v8, v16

    move-object/from16 v0, v33

    move-object/from16 v7, v40

    move/from16 v5, v43

    move/from16 v6, v44

    move/from16 v9, v54

    move-object/from16 v1, v65

    goto :goto_44

    .line 749
    :cond_68
    move v0, v13

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move/from16 v8, v16

    .end local v16    # "horizontalBorderSpacing":F
    .restart local v8    # "horizontalBorderSpacing":F
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v16

    move/from16 v5, v17

    const/16 v17, 0x0

    move/from16 v6, v18

    const/16 v18, 0x1

    move v11, v14

    move-object/from16 v0, v33

    move-object/from16 v7, v40

    move/from16 v5, v43

    move/from16 v6, v44

    move/from16 v9, v54

    move-object v14, v1

    move-object/from16 v1, v65

    .end local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v43    # "hasContent":Z
    .end local v44    # "cellWithBigRowspanAdded":Z
    .end local v54    # "verticalBorderSpacing":F
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v0, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v1, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v5, "hasContent":Z
    .local v6, "cellWithBigRowspanAdded":Z
    .local v9, "verticalBorderSpacing":F
    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 751
    :goto_44
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v13, v13, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-nez v13, :cond_6f

    .line 752
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v13, v13, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    invoke-virtual {v15, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    iget-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v14, v14, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v14

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 754
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v13, v15, v11}, Lcom/itextpdf/layout/renderer/TableBorders;->applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 755
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v14

    invoke-direct {v4, v13, v14}, Lcom/itextpdf/layout/renderer/TableRenderer;->prepareFooterOrHeaderRendererForLayout(Lcom/itextpdf/layout/renderer/TableRenderer;F)Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 761
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v13, v13, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v13, :cond_69

    .line 762
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    check-cast v13, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    invoke-virtual {v13, v7, v7}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 764
    :cond_69
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v14, v14, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    if-nez v5, :cond_6b

    move/from16 v33, v11

    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-eqz v11, :cond_6a

    goto :goto_45

    :cond_6a
    const/4 v11, 0x0

    goto :goto_46

    :cond_6b
    move/from16 v33, v11

    :goto_45
    move/from16 v11, v33

    :goto_46
    invoke-virtual {v13, v14, v11}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 766
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v11, v11, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz v11, :cond_6c

    .line 767
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v13}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v13

    const/4 v14, 0x2

    aget-object v13, v13, v14

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v16

    move-object/from16 v40, v7

    aget-object v7, v16, v14

    invoke-static {v13, v7}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v7

    invoke-virtual {v11, v7, v14}, Lcom/itextpdf/layout/renderer/TableRenderer;->setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    goto :goto_47

    .line 766
    :cond_6c
    move-object/from16 v40, v7

    const/4 v14, 0x2

    .line 769
    :goto_47
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v11, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v13, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v14

    invoke-direct {v13, v14, v15}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v29, :cond_6e

    if-eqz v35, :cond_6d

    goto :goto_48

    :cond_6d
    const/4 v14, 0x0

    goto :goto_49

    :cond_6e
    :goto_48
    move/from16 v14, v33

    :goto_49
    invoke-direct {v11, v13, v14}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-virtual {v7, v11}, Lcom/itextpdf/layout/renderer/TableRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    .line 770
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v11, 0x0

    invoke-virtual {v7, v15, v11}, Lcom/itextpdf/layout/renderer/TableBorders;->applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 771
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    .line 772
    .local v7, "footerHeight":F
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    sub-float/2addr v13, v7

    neg-float v13, v13

    const/4 v14, 0x0

    invoke-virtual {v11, v14, v13}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 773
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v11, v11, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v11

    invoke-virtual {v15, v11}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v13

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v14

    sub-float/2addr v13, v14

    invoke-virtual {v11, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_4a

    .line 751
    .end local v7    # "footerHeight":F
    :cond_6f
    move-object/from16 v40, v7

    move/from16 v33, v11

    goto :goto_4a

    .line 744
    .end local v0    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v5    # "hasContent":Z
    .end local v6    # "cellWithBigRowspanAdded":Z
    .end local v8    # "horizontalBorderSpacing":F
    .end local v9    # "verticalBorderSpacing":F
    .restart local v16    # "horizontalBorderSpacing":F
    .restart local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v43    # "hasContent":Z
    .restart local v44    # "cellWithBigRowspanAdded":Z
    .restart local v54    # "verticalBorderSpacing":F
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_70
    move/from16 v8, v16

    move-object/from16 v0, v33

    move/from16 v5, v43

    move/from16 v6, v44

    move/from16 v9, v54

    move-object/from16 v1, v65

    move/from16 v33, v14

    .line 776
    .end local v16    # "horizontalBorderSpacing":F
    .end local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v43    # "hasContent":Z
    .end local v44    # "cellWithBigRowspanAdded":Z
    .end local v54    # "verticalBorderSpacing":F
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v0    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v5    # "hasContent":Z
    .restart local v6    # "cellWithBigRowspanAdded":Z
    .restart local v8    # "horizontalBorderSpacing":F
    .restart local v9    # "verticalBorderSpacing":F
    :goto_4a
    if-nez v45, :cond_71

    .line 777
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v7, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 778
    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 780
    :cond_71
    if-eqz v45, :cond_72

    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v7, :cond_72

    .line 781
    const/16 v7, 0x6c

    invoke-virtual {v4, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 782
    .local v7, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v7, :cond_72

    .line 783
    iget-object v11, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v7, v11}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 786
    .end local v7    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    :cond_72
    if-eqz v45, :cond_ad

    .line 787
    if-eqz v34, :cond_73

    .line 788
    invoke-virtual {v0, v15}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 790
    :cond_73
    invoke-virtual {v4, v2, v5, v6}, Lcom/itextpdf/layout/renderer/TableRenderer;->split(IZZ)[Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v7

    .line 791
    .local v7, "splitResult":[Lcom/itextpdf/layout/renderer/TableRenderer;
    new-instance v11, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;

    aget-object v13, v7, v33

    invoke-direct {v11, v13}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;-><init>(Lcom/itextpdf/layout/renderer/TableRenderer;)V

    .line 793
    .local v11, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v13, :cond_74

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v13, :cond_78

    .line 794
    :cond_74
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v13, :cond_75

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_76

    .line 795
    :cond_75
    aget-object v13, v7, v33

    const/16 v14, 0xd

    invoke-virtual {v13, v14}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    .line 797
    :cond_76
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v13, :cond_77

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_78

    .line 798
    :cond_77
    aget-object v13, v7, v33

    const/16 v14, 0xa

    invoke-virtual {v13, v14}, Lcom/itextpdf/layout/renderer/TableRenderer;->deleteOwnProperty(I)V

    .line 802
    :cond_78
    array-length v13, v1

    new-array v13, v13, [I

    .line 803
    .local v13, "rowspans":[I
    array-length v14, v1

    new-array v14, v14, [Z

    .line 804
    .local v14, "columnsWithCellToBeEnlarged":[Z
    const/16 v16, 0x0

    move-object/from16 v17, v0

    move/from16 v0, v16

    .end local v50    # "col":I
    .local v0, "col":I
    .local v17, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :goto_4b
    move/from16 v16, v2

    .end local v2    # "row":I
    .local v16, "row":I
    array-length v2, v1

    if-ge v0, v2, :cond_84

    .line 805
    aget-object v2, v49, v0

    if-eqz v2, :cond_7e

    .line 806
    aget-object v2, v49, v0

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 807
    .local v2, "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    if-eqz v2, :cond_79

    .line 808
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v18

    check-cast v18, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v18

    aput v18, v13, v0

    .line 810
    :cond_79
    aget-object v18, v49, v0

    move-object/from16 v65, v1

    .end local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    move-object/from16 v42, v3

    const/4 v3, 0x3

    .end local v3    # "targetOverflowRowIndex":[I
    .restart local v42    # "targetOverflowRowIndex":[I
    if-eq v1, v3, :cond_7b

    if-nez v5, :cond_7a

    if-eqz v6, :cond_7b

    .line 811
    :cond_7a
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 813
    :cond_7b
    aget-object v1, v65, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    .line 814
    .local v1, "cellOccupiedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    if-nez v5, :cond_7d

    if-nez v6, :cond_7d

    aget-object v3, v49, v0

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    move-object/from16 v18, v2

    const/4 v2, 0x3

    .end local v2    # "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v18, "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    if-ne v3, v2, :cond_7c

    goto :goto_4c

    .line 822
    :cond_7c
    aget v2, v42, v0

    sub-int v2, v2, v16

    aget-object v3, v65, v0

    invoke-virtual {v11, v2, v0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    move-object/from16 v3, v40

    goto :goto_4d

    .line 814
    .end local v18    # "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v2    # "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_7d
    move-object/from16 v18, v2

    .line 815
    .end local v2    # "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v18    # "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    :goto_4c
    aget-object v2, v49, v0

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 816
    .local v2, "cellOverflow":Lcom/itextpdf/layout/renderer/CellRenderer;
    aget-object v3, v65, v0

    .line 817
    .local v3, "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    aput-object v40, v65, v0

    .line 818
    move-object/from16 v22, v3

    .end local v3    # "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v22, "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    aget v4, v42, v0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aput-object v22, v3, v0

    .line 819
    move-object/from16 v3, v40

    const/4 v4, 0x0

    invoke-virtual {v11, v4, v0, v3}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 820
    aget v4, v42, v0

    sub-int v4, v4, v16

    invoke-virtual {v11, v4, v0, v2}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 821
    .end local v2    # "cellOverflow":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v22    # "originalCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    nop

    .line 824
    :goto_4d
    aget v2, v42, v0

    sub-int v2, v2, v16

    invoke-virtual {v11, v2, v0}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->getCell(II)Lcom/itextpdf/layout/renderer/CellRenderer;

    move-result-object v2

    iput-object v1, v2, Lcom/itextpdf/layout/renderer/CellRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .end local v1    # "cellOccupiedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v18    # "cellSplit":Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_4f

    .line 825
    .end local v42    # "targetOverflowRowIndex":[I
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v1, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v3, "targetOverflowRowIndex":[I
    :cond_7e
    move-object/from16 v65, v1

    move-object/from16 v42, v3

    move-object/from16 v3, v40

    .end local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v3    # "targetOverflowRowIndex":[I
    .restart local v42    # "targetOverflowRowIndex":[I
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    aget-object v1, v65, v0

    if-eqz v1, :cond_82

    .line 826
    if-eqz v5, :cond_7f

    .line 827
    aget-object v1, v65, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v1

    aput v1, v13, v0

    .line 829
    :cond_7f
    aget-object v1, v65, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v1

    move/from16 v2, v33

    if-eq v2, v1, :cond_80

    const/4 v2, 0x1

    goto :goto_4e

    :cond_80
    const/4 v2, 0x0

    .line 830
    .local v2, "isBigRowspannedCell":Z
    :goto_4e
    if-nez v5, :cond_81

    if-eqz v2, :cond_83

    .line 831
    :cond_81
    const/16 v25, 0x1

    aput-boolean v25, v14, v0

    goto :goto_50

    .line 825
    .end local v2    # "isBigRowspannedCell":Z
    :cond_82
    :goto_4f
    nop

    .line 804
    :cond_83
    :goto_50
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v4, p0

    move-object/from16 v40, v3

    move/from16 v2, v16

    move-object/from16 v3, v42

    move-object/from16 v1, v65

    const/16 v33, 0x1

    goto/16 :goto_4b

    .line 836
    .end local v42    # "targetOverflowRowIndex":[I
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .restart local v3    # "targetOverflowRowIndex":[I
    :cond_84
    move-object/from16 v65, v1

    move-object/from16 v42, v3

    move-object/from16 v3, v40

    .end local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v3    # "targetOverflowRowIndex":[I
    .restart local v42    # "targetOverflowRowIndex":[I
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    const v1, 0x7fffffff

    .line 837
    .local v1, "minRowspan":I
    const/4 v0, 0x0

    :goto_51
    array-length v2, v13

    if-ge v0, v2, :cond_86

    .line 838
    aget v2, v13, v0

    if-eqz v2, :cond_85

    .line 839
    aget v2, v13, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 837
    :cond_85
    add-int/lit8 v0, v0, 0x1

    goto :goto_51

    .line 843
    :cond_86
    const/4 v0, 0x0

    :goto_52
    if-ge v0, v12, :cond_88

    .line 844
    aget-boolean v2, v14, v0

    if-eqz v2, :cond_87

    .line 845
    move v3, v1

    move/from16 v43, v5

    move/from16 v44, v6

    move-object/from16 v24, v10

    move-object v5, v11

    move/from16 v57, v12

    move/from16 v2, v16

    move-object/from16 v25, v17

    move/from16 v11, v34

    move-object/from16 v6, v42

    move-object/from16 v12, v47

    move-object/from16 v4, v65

    const/16 v10, 0x56

    move v1, v0

    move-object/from16 v0, p0

    .end local v0    # "col":I
    .end local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v16    # "row":I
    .end local v17    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v34    # "marginsCollapsingEnabled":Z
    .end local v42    # "targetOverflowRowIndex":[I
    .end local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v1, "col":I
    .local v2, "row":I
    .local v3, "minRowspan":I
    .local v4, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v5, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v6, "targetOverflowRowIndex":[I
    .local v11, "marginsCollapsingEnabled":Z
    .local v12, "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v24, "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v25, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v43    # "hasContent":Z
    .restart local v44    # "cellWithBigRowspanAdded":Z
    .restart local v57    # "numberOfColumns":I
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->enlargeCell(III[Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;[I[Lcom/itextpdf/layout/renderer/TableRenderer;)V

    move/from16 v22, v1

    move/from16 v34, v3

    move-object v4, v0

    move v6, v2

    move-object v0, v5

    .end local v1    # "col":I
    .end local v2    # "row":I
    .end local v3    # "minRowspan":I
    .end local v4    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v5    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v0, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v6, "row":I
    .local v22, "col":I
    .local v34, "minRowspan":I
    .restart local v42    # "targetOverflowRowIndex":[I
    .restart local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_53

    .line 844
    .end local v22    # "col":I
    .end local v24    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v43    # "hasContent":Z
    .end local v44    # "cellWithBigRowspanAdded":Z
    .end local v57    # "numberOfColumns":I
    .local v0, "col":I
    .local v1, "minRowspan":I
    .local v5, "hasContent":Z
    .local v6, "cellWithBigRowspanAdded":Z
    .restart local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v11, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v12, "numberOfColumns":I
    .restart local v16    # "row":I
    .restart local v17    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v34, "marginsCollapsingEnabled":Z
    .restart local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_87
    move-object/from16 v4, p0

    move/from16 v22, v0

    move/from16 v43, v5

    move/from16 v44, v6

    move-object/from16 v24, v10

    move-object v0, v11

    move/from16 v57, v12

    move/from16 v6, v16

    move-object/from16 v25, v17

    move/from16 v11, v34

    move-object/from16 v12, v47

    const/16 v10, 0x56

    move/from16 v34, v1

    .line 843
    .end local v1    # "minRowspan":I
    .end local v5    # "hasContent":Z
    .end local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v16    # "row":I
    .end local v17    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v0, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v6, "row":I
    .local v11, "marginsCollapsingEnabled":Z
    .local v12, "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v22    # "col":I
    .restart local v24    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .restart local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v34, "minRowspan":I
    .restart local v43    # "hasContent":Z
    .restart local v44    # "cellWithBigRowspanAdded":Z
    .restart local v57    # "numberOfColumns":I
    :goto_53
    add-int/lit8 v1, v22, 0x1

    move v3, v11

    move-object v11, v0

    move v0, v1

    move/from16 v1, v34

    move/from16 v34, v3

    move/from16 v16, v6

    move-object/from16 v47, v12

    move-object/from16 v10, v24

    move-object/from16 v17, v25

    move/from16 v5, v43

    move/from16 v6, v44

    move/from16 v12, v57

    const/4 v3, 0x0

    .end local v22    # "col":I
    .local v1, "col":I
    goto :goto_52

    .line 849
    .end local v24    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v43    # "hasContent":Z
    .end local v44    # "cellWithBigRowspanAdded":Z
    .end local v57    # "numberOfColumns":I
    .local v0, "col":I
    .local v1, "minRowspan":I
    .restart local v5    # "hasContent":Z
    .local v6, "cellWithBigRowspanAdded":Z
    .restart local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v11, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v12, "numberOfColumns":I
    .restart local v16    # "row":I
    .restart local v17    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v34, "marginsCollapsingEnabled":Z
    .restart local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_88
    move-object/from16 v4, p0

    move/from16 v22, v0

    move/from16 v43, v5

    move/from16 v44, v6

    move-object/from16 v24, v10

    move-object v0, v11

    move/from16 v57, v12

    move/from16 v6, v16

    move-object/from16 v25, v17

    move/from16 v11, v34

    move-object/from16 v12, v47

    const/16 v10, 0x56

    move/from16 v34, v1

    .end local v1    # "minRowspan":I
    .end local v5    # "hasContent":Z
    .end local v10    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v16    # "row":I
    .end local v17    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v0, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v6, "row":I
    .local v11, "marginsCollapsingEnabled":Z
    .local v12, "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v22    # "col":I
    .restart local v24    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .restart local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v34, "minRowspan":I
    .restart local v43    # "hasContent":Z
    .restart local v44    # "cellWithBigRowspanAdded":Z
    .restart local v57    # "numberOfColumns":I
    const/4 v5, 0x1

    invoke-direct {v4, v15, v8, v9, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySpacing(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 850
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-direct {v4, v1, v8, v5, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 851
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_89

    .line 852
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 854
    :cond_89
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v1, :cond_8a

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8b

    .line 855
    :cond_8a
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 857
    :cond_8b
    if-nez v6, :cond_8c

    if-nez v43, :cond_8c

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v1, :cond_8c

    .line 858
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    div-float v2, v9, v36

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v3, 0x0

    goto :goto_54

    .line 860
    :cond_8c
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v5, 0x1

    invoke-direct {v4, v1, v9, v3, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 863
    :goto_54
    if-nez v21, :cond_8d

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_8d

    aget-object v1, v7, v3

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_8d

    .line 864
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 867
    :cond_8d
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v1, :cond_92

    .line 874
    const/16 v30, 0x0

    aget-object v1, v7, v30

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_91

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v1, v2, :cond_8e

    move-object/from16 v38, v13

    move-object/from16 v39, v14

    const/16 v55, 0x2

    goto :goto_56

    .line 877
    :cond_8e
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v15, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 879
    if-nez v21, :cond_90

    if-nez v23, :cond_90

    .line 880
    move-object v1, v13

    .end local v13    # "rowspans":[I
    .local v1, "rowspans":[I
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_8f

    const/16 v16, 0x1

    goto :goto_55

    :cond_8f
    const/16 v16, 0x0

    :goto_55
    const/16 v17, 0x1

    const/16 v18, 0x0

    move-object/from16 v38, v1

    move-object/from16 v39, v14

    const/16 v55, 0x2

    move-object v14, v2

    .end local v1    # "rowspans":[I
    .end local v14    # "columnsWithCellToBeEnlarged":[Z
    .local v38, "rowspans":[I
    .local v39, "columnsWithCellToBeEnlarged":[Z
    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_57

    .line 879
    .end local v38    # "rowspans":[I
    .end local v39    # "columnsWithCellToBeEnlarged":[Z
    .restart local v13    # "rowspans":[I
    .restart local v14    # "columnsWithCellToBeEnlarged":[Z
    :cond_90
    move-object/from16 v38, v13

    move-object/from16 v39, v14

    const/16 v55, 0x2

    .end local v13    # "rowspans":[I
    .end local v14    # "columnsWithCellToBeEnlarged":[Z
    .restart local v38    # "rowspans":[I
    .restart local v39    # "columnsWithCellToBeEnlarged":[Z
    goto :goto_57

    .line 874
    .end local v38    # "rowspans":[I
    .end local v39    # "columnsWithCellToBeEnlarged":[Z
    .restart local v13    # "rowspans":[I
    .restart local v14    # "columnsWithCellToBeEnlarged":[Z
    :cond_91
    move-object/from16 v38, v13

    move-object/from16 v39, v14

    const/16 v55, 0x2

    .line 875
    .end local v13    # "rowspans":[I
    .end local v14    # "columnsWithCellToBeEnlarged":[Z
    .restart local v38    # "rowspans":[I
    .restart local v39    # "columnsWithCellToBeEnlarged":[Z
    :goto_56
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v15, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_57

    .line 867
    .end local v38    # "rowspans":[I
    .end local v39    # "columnsWithCellToBeEnlarged":[Z
    .restart local v13    # "rowspans":[I
    .restart local v14    # "columnsWithCellToBeEnlarged":[Z
    :cond_92
    move-object/from16 v38, v13

    move-object/from16 v39, v14

    const/16 v55, 0x2

    .line 884
    .end local v13    # "rowspans":[I
    .end local v14    # "columnsWithCellToBeEnlarged":[Z
    .restart local v38    # "rowspans":[I
    .restart local v39    # "columnsWithCellToBeEnlarged":[Z
    :goto_57
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v10}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_93

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 885
    const/16 v2, 0x57

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_94

    .line 886
    :cond_93
    const/16 v33, 0x1

    aget-object v1, v7, v33

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-virtual {v4, v1, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->extendLastRow([Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 888
    :cond_94
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_95

    move v1, v9

    goto :goto_58

    :cond_95
    const/4 v1, 0x0

    :goto_58
    invoke-direct {v4, v15, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->adjustFooterAndFixOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 889
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_96

    move v1, v9

    goto :goto_59

    :cond_96
    const/4 v1, 0x0

    :goto_59
    invoke-direct {v4, v15, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->adjustCaptionAndFixOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 892
    invoke-interface/range {v72 .. v72}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_98

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 894
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/16 v33, 0x1

    aget-object v3, v7, v33

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v30, 0x0

    aget-object v10, v7, v30

    iget-object v10, v10, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v5, v10

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v3, v3, v5

    if-nez v3, :cond_97

    .line 895
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v3, v3, v5

    .line 896
    .local v3, "originalCellRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    const/16 v33, 0x1

    aget-object v5, v7, v33

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    const/16 v30, 0x0

    aget-object v10, v7, v30

    iget-object v10, v10, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int v14, v6, v10

    invoke-interface {v5, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    aget-object v5, v5, v10

    .line 897
    .local v5, "overflowCellRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-interface {v10, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    aput-object v3, v10, v13

    .line 898
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x0

    aput-object v14, v10, v13

    .line 899
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v30, 0x0

    aget-object v13, v7, v30

    iget-object v13, v13, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    sub-int/2addr v10, v13

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v0, v10, v13, v5}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 900
    aget-object v10, v7, v30

    iget-object v10, v10, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int v10, v6, v10

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v0, v10, v13, v14}, Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;->setCell(IILcom/itextpdf/layout/renderer/CellRenderer;)Lcom/itextpdf/layout/renderer/CellRenderer;

    goto :goto_5b

    .line 894
    .end local v3    # "originalCellRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v5    # "overflowCellRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_97
    const/4 v14, 0x0

    .line 902
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :goto_5b
    goto/16 :goto_5a

    .line 904
    :cond_98
    const/4 v14, 0x0

    invoke-virtual {v4, v12}, Lcom/itextpdf/layout/renderer/TableRenderer;->isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-eqz v1, :cond_9c

    .line 905
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_9b

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 906
    const/16 v2, 0x1a

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9a

    .line 907
    move-object v5, v0

    .end local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v5, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    move-object v1, v5

    if-nez v12, :cond_99

    move-object v5, v4

    goto :goto_5c

    :cond_99
    move-object v5, v12

    .end local v5    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v1, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :goto_5c
    move-object v2, v1

    .end local v1    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v2, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    const/4 v1, 0x3

    move-object v3, v2

    .end local v2    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v3, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    const/4 v2, 0x0

    move-object v10, v3

    .end local v3    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v10, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v0

    .line 906
    .end local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :cond_9a
    move-object v10, v0

    .end local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    goto :goto_5d

    .line 905
    .end local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :cond_9b
    move-object v10, v0

    const/16 v2, 0x1a

    .end local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    goto :goto_5d

    .line 904
    .end local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :cond_9c
    move-object v10, v0

    const/16 v2, 0x1a

    .line 911
    .end local v0    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :goto_5d
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v0, :cond_9d

    const/4 v0, 0x0

    goto :goto_5e

    :cond_9d
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 912
    .local v0, "footerHeight":F
    :goto_5e
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v1, :cond_9e

    const/4 v1, 0x0

    goto :goto_5f

    :cond_9e
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 913
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v3

    sub-float/2addr v1, v3

    :goto_5f
    nop

    .line 914
    .local v1, "headerHeight":F
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    if-nez v3, :cond_9f

    const/4 v3, 0x0

    goto :goto_60

    :cond_9f
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->captionRenderer:Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/DivRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    .line 915
    .local v3, "captionHeight":F
    :goto_60
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    sub-float/2addr v5, v0

    sub-float/2addr v5, v1

    sub-float/2addr v5, v3

    .line 916
    .local v5, "heightDiff":F
    const/4 v13, 0x0

    invoke-static {v13, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v13

    if-nez v13, :cond_a1

    if-nez v21, :cond_a0

    if-eqz v23, :cond_a1

    :cond_a0
    const/16 v55, 0x3

    :cond_a1
    move/from16 v13, v55

    .line 918
    .local v13, "status":I
    const/4 v14, 0x3

    if-ne v13, v14, :cond_a2

    sget-object v14, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a3

    :cond_a2
    if-eqz v29, :cond_aa

    .line 920
    :cond_a3
    if-eqz v29, :cond_a9

    .line 921
    invoke-static/range {v37 .. v37}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 922
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v14, "Element content was clipped because some height properties are set."

    invoke-interface {v2, v14}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 924
    const/4 v14, 0x3

    if-ne v13, v14, :cond_a6

    .line 925
    move/from16 v67, v13

    .end local v13    # "status":I
    .local v67, "status":I
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    move/from16 v26, v0

    .end local v0    # "footerHeight":F
    .local v26, "footerHeight":F
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_a4

    const/16 v16, 0x1

    goto :goto_61

    :cond_a4
    const/16 v16, 0x0

    :goto_61
    const/16 v17, 0x1

    const/16 v18, 0x0

    move-object/from16 v40, v10

    move/from16 v0, v67

    const/4 v10, 0x0

    .end local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .end local v67    # "status":I
    .local v0, "status":I
    .local v40, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 926
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    iget-object v10, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-nez v10, :cond_a5

    const/16 v16, 0x1

    goto :goto_62

    :cond_a5
    const/16 v16, 0x0

    :goto_62
    const/16 v17, 0x1

    const/16 v18, 0x0

    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_63

    .line 924
    .end local v26    # "footerHeight":F
    .end local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v0, "footerHeight":F
    .restart local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v13    # "status":I
    :cond_a6
    move/from16 v26, v0

    move-object/from16 v40, v10

    move v0, v13

    .line 929
    .end local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .end local v13    # "status":I
    .local v0, "status":I
    .restart local v26    # "footerHeight":F
    .restart local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :goto_63
    if-eqz v32, :cond_a8

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v10

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    cmpl-float v10, v10, v13

    if-lez v10, :cond_a8

    .line 930
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v10

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v13

    iget-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v14}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v14

    sub-float/2addr v13, v14

    sub-float/2addr v10, v13

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v13

    invoke-static {v10, v13}, Ljava/lang/Math;->max(FF)F

    move-result v10

    .line 931
    .local v10, "blockBottom":F
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    .line 934
    iget-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    .line 931
    if-nez v13, :cond_a7

    .line 932
    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v13

    move/from16 v16, v1

    .end local v1    # "headerHeight":F
    .local v16, "headerHeight":F
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    div-float v1, v1, v36

    sub-float/2addr v13, v1

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v14, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v17, v2

    goto :goto_64

    .line 934
    .end local v16    # "headerHeight":F
    .restart local v1    # "headerHeight":F
    :cond_a7
    move/from16 v16, v1

    .end local v1    # "headerHeight":F
    .restart local v16    # "headerHeight":F
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v33, 0x1

    add-int/lit8 v1, v1, -0x1

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    move-object/from16 v17, v2

    .end local v2    # "logger":Lorg/slf4j/Logger;
    .local v17, "logger":Lorg/slf4j/Logger;
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v13, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v13

    add-float/2addr v2, v13

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    sub-float/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v14, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 936
    :goto_64
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 937
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    sub-float/2addr v2, v10

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 938
    invoke-virtual {v1, v10}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_65

    .line 929
    .end local v10    # "blockBottom":F
    .end local v16    # "headerHeight":F
    .end local v17    # "logger":Lorg/slf4j/Logger;
    .restart local v1    # "headerHeight":F
    .restart local v2    # "logger":Lorg/slf4j/Logger;
    :cond_a8
    move/from16 v16, v1

    move-object/from16 v17, v2

    .end local v1    # "headerHeight":F
    .end local v2    # "logger":Lorg/slf4j/Logger;
    .restart local v16    # "headerHeight":F
    .restart local v17    # "logger":Lorg/slf4j/Logger;
    goto :goto_65

    .line 920
    .end local v16    # "headerHeight":F
    .end local v17    # "logger":Lorg/slf4j/Logger;
    .end local v26    # "footerHeight":F
    .end local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v0, "footerHeight":F
    .restart local v1    # "headerHeight":F
    .local v10, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .restart local v13    # "status":I
    :cond_a9
    move/from16 v26, v0

    move/from16 v16, v1

    move-object/from16 v40, v10

    move v0, v13

    .line 941
    .end local v1    # "headerHeight":F
    .end local v10    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .end local v13    # "status":I
    .local v0, "status":I
    .restart local v16    # "headerHeight":F
    .restart local v26    # "footerHeight":F
    .restart local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    :goto_65
    const/4 v1, 0x0

    invoke-direct {v4, v1, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyFixedXOrYPosition(ZLcom/itextpdf/kernel/geom/Rectangle;)V

    .line 942
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v4, v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 943
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v4, v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 945
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v10, v58

    move/from16 v13, v59

    .end local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v59    # "clearHeightCorrection":F
    .local v10, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v13, "clearHeightCorrection":F
    invoke-static {v4, v10, v1, v13, v11}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    .line 946
    .local v1, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v14, Lcom/itextpdf/layout/layout/LayoutResult;

    move/from16 v17, v3

    const/4 v3, 0x0

    .end local v3    # "captionHeight":F
    .local v17, "captionHeight":F
    aget-object v3, v7, v3

    move/from16 v18, v5

    const/4 v5, 0x0

    .end local v5    # "heightDiff":F
    .local v18, "heightDiff":F
    invoke-direct {v14, v2, v1, v3, v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v14

    .line 948
    .end local v16    # "headerHeight":F
    .end local v17    # "captionHeight":F
    .end local v18    # "heightDiff":F
    .end local v26    # "footerHeight":F
    .end local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v0, "footerHeight":F
    .local v1, "headerHeight":F
    .restart local v3    # "captionHeight":F
    .restart local v5    # "heightDiff":F
    .local v10, "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .local v13, "status":I
    .restart local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v59    # "clearHeightCorrection":F
    :cond_aa
    move/from16 v26, v0

    move/from16 v16, v1

    move/from16 v17, v3

    move/from16 v18, v5

    move-object/from16 v40, v10

    move v0, v13

    move-object/from16 v10, v58

    move/from16 v13, v59

    const/4 v2, 0x1

    const/4 v3, 0x0

    .end local v1    # "headerHeight":F
    .end local v3    # "captionHeight":F
    .end local v5    # "heightDiff":F
    .end local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v59    # "clearHeightCorrection":F
    .local v0, "status":I
    .local v10, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v13, "clearHeightCorrection":F
    .restart local v16    # "headerHeight":F
    .restart local v17    # "captionHeight":F
    .restart local v18    # "heightDiff":F
    .restart local v26    # "footerHeight":F
    .restart local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    aget-object v1, v7, v3

    aget-object v5, v7, v2

    invoke-virtual {v4, v3, v1, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->updateHeightsOnSplit(ZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 949
    invoke-direct {v4, v3, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyFixedXOrYPosition(ZLcom/itextpdf/kernel/geom/Rectangle;)V

    .line 950
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v4, v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 951
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v4, v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 953
    const/4 v1, 0x0

    .line 954
    .local v1, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    const/4 v14, 0x3

    if-eq v0, v14, :cond_ab

    .line 955
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-static {v4, v10, v2, v13, v11}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    move-object/from16 v68, v1

    goto :goto_66

    .line 954
    :cond_ab
    move-object/from16 v68, v1

    .line 957
    .end local v1    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v68, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    :goto_66
    new-instance v66, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v30, 0x0

    aget-object v69, v7, v30

    const/16 v33, 0x1

    aget-object v70, v7, v33

    if-nez v12, :cond_ac

    move-object/from16 v71, v4

    goto :goto_67

    :cond_ac
    move-object/from16 v71, v12

    :goto_67
    move/from16 v67, v0

    .end local v0    # "status":I
    .restart local v67    # "status":I
    invoke-direct/range {v66 .. v71}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v66

    .line 786
    .end local v7    # "splitResult":[Lcom/itextpdf/layout/renderer/TableRenderer;
    .end local v11    # "marginsCollapsingEnabled":Z
    .end local v13    # "clearHeightCorrection":F
    .end local v16    # "headerHeight":F
    .end local v17    # "captionHeight":F
    .end local v18    # "heightDiff":F
    .end local v22    # "col":I
    .end local v24    # "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .end local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v26    # "footerHeight":F
    .end local v38    # "rowspans":[I
    .end local v39    # "columnsWithCellToBeEnlarged":[Z
    .end local v40    # "overflowRows":Lcom/itextpdf/layout/renderer/TableRenderer$OverflowRowsWrapper;
    .end local v42    # "targetOverflowRowIndex":[I
    .end local v43    # "hasContent":Z
    .end local v44    # "cellWithBigRowspanAdded":Z
    .end local v57    # "numberOfColumns":I
    .end local v65    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v67    # "status":I
    .end local v68    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v0, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v1, "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .local v2, "row":I
    .local v3, "targetOverflowRowIndex":[I
    .local v5, "hasContent":Z
    .local v6, "cellWithBigRowspanAdded":Z
    .local v10, "currChildRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    .local v12, "numberOfColumns":I
    .local v34, "marginsCollapsingEnabled":Z
    .restart local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v50    # "col":I
    .restart local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v59    # "clearHeightCorrection":F
    :cond_ad
    move-object/from16 v25, v0

    move-object/from16 v65, v1

    move-object/from16 v42, v3

    move/from16 v43, v5

    move/from16 v44, v6

    move-object/from16 v24, v10

    move/from16 v57, v12

    move/from16 v11, v34

    move-object/from16 v12, v47

    move-object/from16 v10, v58

    move/from16 v13, v59

    const/16 v14, 0xd

    const/16 v16, 0xa

    move v6, v2

    const/16 v2, 0x1a

    .line 442
    .end local v0    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v1    # "currentRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v2    # "row":I
    .end local v3    # "targetOverflowRowIndex":[I
    .end local v5    # "hasContent":Z
    .end local v12    # "numberOfColumns":I
    .end local v34    # "marginsCollapsingEnabled":Z
    .end local v45    # "split":Z
    .end local v47    # "firstCauseOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v51    # "rowHasCellWithSetHeight":Z
    .end local v52    # "widestRowBottomBorderWidth":F
    .end local v53    # "widestRowBottomBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v58    # "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v59    # "clearHeightCorrection":F
    .end local v62    # "rowHeight":F
    .end local v63    # "cellProcessingQueue":Ljava/util/Deque;, "Ljava/util/Deque<Lcom/itextpdf/layout/renderer/TableRenderer$CellRendererInfo;>;"
    .end local v76    # "childFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v80    # "rowBottomBorderIfLastOnPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v6, "row":I
    .local v10, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v11    # "marginsCollapsingEnabled":Z
    .restart local v13    # "clearHeightCorrection":F
    .restart local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v42    # "targetOverflowRowIndex":[I
    .restart local v57    # "numberOfColumns":I
    add-int/lit8 v0, v6, 0x1

    move v12, v13

    move v2, v14

    move/from16 v1, v16

    move-object/from16 v33, v25

    move/from16 v5, v38

    move-object/from16 v6, v49

    move/from16 v13, v57

    move-object/from16 v7, v60

    move v14, v0

    move-object v11, v10

    move/from16 v10, v48

    move-object/from16 v0, v72

    .end local v6    # "row":I
    .local v0, "row":I
    goto/16 :goto_19

    .line 963
    .end local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v42    # "targetOverflowRowIndex":[I
    .end local v48    # "tableWidth":F
    .end local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v50    # "col":I
    .end local v57    # "numberOfColumns":I
    .end local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .end local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local v0, "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .restart local v3    # "targetOverflowRowIndex":[I
    .local v6, "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .local v7, "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .local v10, "tableWidth":F
    .local v11, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "clearHeightCorrection":F
    .local v13, "numberOfColumns":I
    .local v14, "row":I
    .restart local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v34    # "marginsCollapsingEnabled":Z
    :cond_ae
    move-object/from16 v72, v0

    move-object/from16 v42, v3

    move-object/from16 v49, v6

    move-object/from16 v60, v7

    move/from16 v48, v10

    move-object v10, v11

    move/from16 v57, v13

    move v6, v14

    move-object/from16 v25, v33

    move/from16 v11, v34

    const/16 v0, 0x56

    move v13, v12

    .end local v0    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v3    # "targetOverflowRowIndex":[I
    .end local v7    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .end local v12    # "clearHeightCorrection":F
    .end local v14    # "row":I
    .end local v33    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v34    # "marginsCollapsingEnabled":Z
    .local v6, "row":I
    .local v10, "siblingFloatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v11, "marginsCollapsingEnabled":Z
    .local v13, "clearHeightCorrection":F
    .restart local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v42    # "targetOverflowRowIndex":[I
    .restart local v48    # "tableWidth":F
    .restart local v49    # "splits":[Lcom/itextpdf/layout/layout/LayoutResult;
    .restart local v57    # "numberOfColumns":I
    .restart local v60    # "rowsHasCellWithSetHeight":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    .restart local v72    # "rowMoves":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v1

    if-eqz v1, :cond_b1

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b1

    .line 964
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/16 v33, 0x1

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 965
    .local v1, "lastRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    .line 966
    .local v2, "lastInRow":I
    :goto_68
    if-ltz v2, :cond_af

    aget-object v3, v1, v2

    if-nez v3, :cond_af

    .line 967
    add-int/lit8 v2, v2, -0x1

    goto :goto_68

    .line 969
    :cond_af
    if-ltz v2, :cond_b0

    array-length v3, v1

    aget-object v5, v1, v2

    const/16 v7, 0x10

    invoke-virtual {v5, v7}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, v2

    if-eq v3, v5, :cond_b1

    .line 970
    :cond_b0
    invoke-static/range {v37 .. v37}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 971
    .local v3, "logger":Lorg/slf4j/Logger;
    const-string v5, "Last row is not completed. Table bottom border may collapse as you do not expect it"

    invoke-interface {v3, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 976
    .end local v1    # "lastRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v2    # "lastInRow":I
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :cond_b1
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-nez v1, :cond_b9

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v1

    if-eqz v1, :cond_b9

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_b3

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b2

    goto :goto_69

    :cond_b2
    const/4 v5, 0x0

    goto/16 :goto_6e

    :cond_b3
    :goto_69
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_b9

    .line 977
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v15, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 979
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v5, 0x1

    invoke-virtual {v1, v15, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 980
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-direct {v4, v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->prepareFooterOrHeaderRendererForLayout(Lcom/itextpdf/layout/renderer/TableRenderer;F)Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 981
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_b6

    if-nez v21, :cond_b4

    const/4 v5, 0x1

    goto :goto_6a

    .line 983
    :cond_b4
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_b5

    .line 984
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_6b

    .line 983
    :cond_b5
    const/4 v5, 0x1

    goto :goto_6b

    .line 981
    :cond_b6
    const/4 v5, 0x1

    .line 982
    :goto_6a
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1, v2, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 987
    :goto_6b
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    new-instance v2, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v3, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual/range {v28 .. v28}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v5

    invoke-direct {v3, v5, v15}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v29, :cond_b8

    if-eqz v35, :cond_b7

    goto :goto_6c

    :cond_b7
    const/4 v5, 0x0

    goto :goto_6d

    :cond_b8
    :goto_6c
    const/4 v5, 0x1

    :goto_6d
    invoke-direct {v2, v3, v5}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    .line 988
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    const/4 v3, 0x0

    invoke-virtual {v1, v15, v3}, Lcom/itextpdf/layout/renderer/TableBorders;->applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 990
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 991
    .local v1, "footerHeight":F
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    sub-float/2addr v3, v1

    neg-float v3, v3

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 992
    invoke-virtual {v15, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_6e

    .line 976
    .end local v1    # "footerHeight":F
    :cond_b9
    const/4 v5, 0x0

    .line 995
    :goto_6e
    const/4 v2, 0x1

    invoke-direct {v4, v15, v8, v9, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySpacing(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 996
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-direct {v4, v1, v8, v2, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 997
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v1, :cond_ba

    .line 998
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1000
    :cond_ba
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v1, :cond_bb

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_bc

    .line 1001
    :cond_bb
    invoke-virtual {v15, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1003
    :cond_bc
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_bd

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v1, :cond_bd

    .line 1004
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    div-float v2, v9, v36

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_6f

    .line 1005
    :cond_bd
    if-nez v21, :cond_be

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_bf

    .line 1006
    :cond_be
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v4, v1, v9, v3, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->applySingleSpacing(Lcom/itextpdf/kernel/geom/Rectangle;FZZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1009
    :cond_bf
    :goto_6f
    iget-object v1, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v1

    .line 1011
    .local v1, "bottomTableBorderWidth":F
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v2

    .line 1030
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1011
    if-eqz v2, :cond_c5

    .line 1012
    if-nez v3, :cond_c4

    .line 1013
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_c0

    .line 1014
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v2, v3, v15, v7}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move v12, v13

    goto/16 :goto_73

    .line 1016
    :cond_c0
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v2

    .line 1019
    move/from16 v59, v13

    .end local v13    # "clearHeightCorrection":F
    .restart local v59    # "clearHeightCorrection":F
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1016
    if-eqz v2, :cond_c2

    .line 1017
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_c1

    const/16 v16, 0x1

    goto :goto_70

    :cond_c1
    const/16 v16, 0x0

    :goto_70
    const/16 v17, 0x1

    const/16 v18, 0x0

    move/from16 v12, v59

    .end local v59    # "clearHeightCorrection":F
    .restart local v12    # "clearHeightCorrection":F
    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    goto/16 :goto_73

    .line 1019
    .end local v12    # "clearHeightCorrection":F
    .restart local v59    # "clearHeightCorrection":F
    :cond_c2
    move/from16 v12, v59

    .end local v59    # "clearHeightCorrection":F
    .restart local v12    # "clearHeightCorrection":F
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_c3

    const/16 v16, 0x1

    goto :goto_71

    :cond_c3
    const/16 v16, 0x0

    :goto_71
    const/16 v17, 0x1

    const/16 v18, 0x0

    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_73

    .line 1023
    .end local v12    # "clearHeightCorrection":F
    .restart local v13    # "clearHeightCorrection":F
    :cond_c4
    move v12, v13

    .end local v13    # "clearHeightCorrection":F
    .restart local v12    # "clearHeightCorrection":F
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_c8

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v2, :cond_c8

    .line 1024
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxBottomWidth()F

    move-result v2

    .line 1025
    .local v2, "headerBottomBorderWidth":F
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v13, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    const/16 v17, 0x1

    const/16 v18, 0x1

    const/16 v16, 0x1

    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1026
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1027
    .end local v2    # "headerBottomBorderWidth":F
    goto :goto_73

    .line 1030
    .end local v12    # "clearHeightCorrection":F
    .restart local v13    # "clearHeightCorrection":F
    :cond_c5
    move v12, v13

    .end local v13    # "clearHeightCorrection":F
    .restart local v12    # "clearHeightCorrection":F
    if-nez v3, :cond_c7

    .line 1031
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_c8

    .line 1032
    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v14

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_c6

    const/16 v16, 0x1

    goto :goto_72

    :cond_c6
    const/16 v16, 0x0

    :goto_72
    const/16 v17, 0x0

    const/16 v18, 0x1

    invoke-virtual/range {v13 .. v18}, Lcom/itextpdf/layout/renderer/TableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;

    goto :goto_73

    .line 1036
    :cond_c7
    invoke-virtual {v15, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1041
    :cond_c8
    :goto_73
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_c9

    .line 1042
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_cb

    .line 1043
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/16 v33, 0x1

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-virtual {v4, v0, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->extendLastRow([Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto/16 :goto_75

    .line 1046
    :cond_c9
    if-eqz v32, :cond_cb

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    cmpl-float v0, v0, v2

    if-lez v0, :cond_cb

    .line 1047
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    sub-float/2addr v2, v3

    sub-float/2addr v0, v2

    invoke-virtual {v15}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 1048
    .local v0, "blockBottom":F
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .line 1051
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    .line 1048
    if-eqz v2, :cond_ca

    .line 1049
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/16 v33, 0x1

    add-int/lit8 v2, v2, -0x1

    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-interface {v7, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    iget-object v13, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v13

    add-float/2addr v7, v13

    sub-float/2addr v7, v0

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v3, v2, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_74

    .line 1051
    :cond_ca
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    sub-float/2addr v2, v0

    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    div-float v7, v7, v36

    add-float/2addr v2, v7

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1054
    :goto_74
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1055
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    sub-float/2addr v3, v0

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 1056
    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1060
    .end local v0    # "blockBottom":F
    :cond_cb
    :goto_75
    const/4 v3, 0x0

    invoke-direct {v4, v3, v15}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyFixedXOrYPosition(ZLcom/itextpdf/kernel/geom/Rectangle;)V

    .line 1062
    if-eqz v11, :cond_cc

    .line 1063
    move-object/from16 v0, v25

    .end local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v0, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    invoke-virtual {v0, v15}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_76

    .line 1062
    .end local v0    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :cond_cc
    move-object/from16 v0, v25

    .line 1066
    .end local v25    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v0    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :goto_76
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    const/4 v14, 0x1

    invoke-virtual {v4, v2, v14}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1067
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v4, v2, v14}, Lcom/itextpdf/layout/renderer/TableRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1070
    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v2

    if-nez v2, :cond_ce

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v2, :cond_ce

    .line 1071
    const/16 v7, 0x6c

    invoke-virtual {v4, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 1072
    .local v2, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v2, :cond_cd

    .line 1074
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 1076
    :cond_cd
    const/4 v14, 0x0

    iput-object v14, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 1077
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v7, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v3, v7}, Lcom/itextpdf/layout/renderer/TableBorders;->skipFooter([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1079
    .end local v2    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    :cond_ce
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v2, :cond_d0

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_cf

    goto :goto_77

    :cond_cf
    move v2, v5

    goto :goto_78

    :cond_d0
    :goto_77
    move v2, v9

    :goto_78
    invoke-direct {v4, v15, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->adjustFooterAndFixOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 1080
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-nez v2, :cond_d1

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d2

    :cond_d1
    move v5, v9

    :cond_d2
    invoke-direct {v4, v15, v5}, Lcom/itextpdf/layout/renderer/TableRenderer;->adjustCaptionAndFixOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;F)V

    .line 1082
    invoke-static {v10, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->removeFloatsAboveRendererBottom(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1084
    if-nez v21, :cond_d4

    if-nez v23, :cond_d4

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_d3

    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v2, :cond_d4

    invoke-virtual/range {v19 .. v19}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_d4

    .line 1085
    :cond_d3
    iget-object v2, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1088
    :cond_d4
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-static {v4, v10, v2, v12, v11}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v38

    .line 1090
    .local v38, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v36, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v40, 0x0

    const/16 v41, 0x0

    const/16 v37, 0x1

    const/16 v39, 0x0

    invoke-direct/range {v36 .. v41}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v36
.end method

.method public move(FF)V
    .locals 1
    .param p1, "dxRight"    # F
    .param p2, "dyUp"    # F

    .line 1235
    invoke-super {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V

    .line 1236
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    .line 1237
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 1239
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_1

    .line 1240
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/layout/renderer/TableRenderer;->move(FF)V

    .line 1242
    :cond_1
    return-void
.end method

.method protected retrieveWidth(F)Ljava/lang/Float;
    .locals 7
    .param p1, "parentBoxWidth"    # F

    .line 1303
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v0

    .line 1304
    .local v0, "tableWidth":Ljava/lang/Float;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Table;

    .line 1305
    .local v1, "tableModel":Lcom/itextpdf/layout/element/Table;
    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpl-float v3, v3, v2

    if-nez v3, :cond_3

    .line 1306
    :cond_0
    const/4 v3, 0x0

    .line 1307
    .local v3, "totalColumnWidthInPercent":F
    const/4 v4, 0x0

    .local v4, "col":I
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 1308
    invoke-virtual {v1, v4}, Lcom/itextpdf/layout/element/Table;->getColumnWidth(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 1309
    .local v5, "columnWidth":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1310
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    add-float/2addr v3, v6

    .line 1307
    .end local v5    # "columnWidth":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1313
    .end local v4    # "col":I
    :cond_2
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1314
    cmpl-float v2, v3, v2

    if-lez v2, :cond_3

    .line 1315
    mul-float v2, p1, v3

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1318
    .end local v3    # "totalColumnWidthInPercent":F
    :cond_3
    return-object v0
.end method

.method protected split(I)[Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 1
    .param p1, "row"    # I

    .line 1245
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->split(IZ)[Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v0

    return-object v0
.end method

.method protected split(IZ)[Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 1
    .param p1, "row"    # I
    .param p2, "hasContent"    # Z

    .line 1249
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->split(IZZ)[Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v0

    return-object v0
.end method

.method protected split(IZZ)[Lcom/itextpdf/layout/renderer/TableRenderer;
    .locals 4
    .param p1, "row"    # I
    .param p2, "hasContent"    # Z
    .param p3, "cellWithBigRowspanAdded"    # Z

    .line 1254
    new-instance v0, Lcom/itextpdf/layout/element/Table$RowRange;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    add-int/2addr v2, p1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->createSplitRenderer(Lcom/itextpdf/layout/element/Table$RowRange;)Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v0

    .line 1255
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1256
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1257
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->heights:Ljava/util/List;

    .line 1258
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->columnWidths:[F

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->columnWidths:[F

    .line 1259
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->countedColumnWidth:[F

    .line 1260
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->totalWidthForColumns:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->totalWidthForColumns:F

    .line 1261
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1263
    new-instance v1, Lcom/itextpdf/layout/element/Table$RowRange;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    add-int/2addr v2, p1

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Table$RowRange;->getFinishRow()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/layout/element/Table$RowRange;-><init>(II)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->createOverflowRenderer(Lcom/itextpdf/layout/element/Table$RowRange;)Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v1

    .line 1264
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-nez p3, :cond_0

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rowRange:Lcom/itextpdf/layout/element/Table$RowRange;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table$RowRange;->getStartRow()I

    move-result v2

    if-nez v2, :cond_0

    .line 1265
    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    iput-boolean v2, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->isOriginalNonSplitRenderer:Z

    .line 1267
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, p1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    iput-object v2, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    .line 1268
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    iput-object v2, v1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    .line 1270
    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/renderer/TableRenderer;

    move-result-object v2

    return-object v2
.end method
