.class final Lcom/itextpdf/layout/renderer/TableWidths;
.super Ljava/lang/Object;
.source "TableWidths.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;,
        Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ZeroWidth:Lcom/itextpdf/layout/properties/UnitValue;


# instance fields
.field private cells:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;",
            ">;"
        }
    .end annotation
.end field

.field private fixedTableLayout:Z

.field private fixedTableWidth:Z

.field private final horizontalBorderSpacing:F

.field private layoutMinWidth:F

.field private final leftBorderMaxWidth:F

.field private final numberOfColumns:I

.field private final rightBorderMaxWidth:F

.field private tableMaxWidth:F

.field private tableMinWidth:F

.field private final tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

.field private tableWidth:F

.field private final widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    nop

    .line 818
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/renderer/TableWidths;->ZeroWidth:Lcom/itextpdf/layout/properties/UnitValue;

    return-void
.end method

.method constructor <init>(Lcom/itextpdf/layout/renderer/TableRenderer;FZFF)V
    .locals 2
    .param p1, "tableRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p2, "availableWidth"    # F
    .param p3, "calculateTableMaxWidth"    # Z
    .param p4, "rightBorderMaxWidth"    # F
    .param p5, "leftBorderMaxWidth"    # F

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableLayout:Z

    .line 62
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 63
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getNumberOfColumns()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    .line 64
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    new-array v0, v0, [Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 65
    iput p4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->rightBorderMaxWidth:F

    .line 66
    iput p5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->leftBorderMaxWidth:F

    .line 67
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 68
    const/16 v0, 0x73

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 69
    .local v0, "horizontalSpacing":Ljava/lang/Float;
    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    :goto_0
    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    .line 70
    .end local v0    # "horizontalSpacing":Ljava/lang/Float;
    goto :goto_1

    .line 71
    :cond_1
    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    .line 73
    :goto_1
    invoke-direct {p0, p2, p3}, Lcom/itextpdf/layout/renderer/TableWidths;->calculateTableWidth(FZ)V

    .line 74
    return-void
.end method

.method private calculateMinMaxWidths()V
    .locals 11

    .line 634
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    new-array v0, v0, [F

    .line 635
    .local v0, "minWidths":[F
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    new-array v1, v1, [F

    .line 637
    .local v1, "maxWidths":[F
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->cells:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;

    .line 638
    .local v3, "cell":Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->setParent(Lcom/itextpdf/layout/renderer/TableRenderer;)V

    .line 639
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCell()Lcom/itextpdf/layout/renderer/CellRenderer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v4

    .line 640
    .local v4, "minMax":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    sget-object v5, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v7, 0x72

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_0

    .line 641
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getAdditionalWidth()F

    move-result v5

    iget v7, p0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    sub-float/2addr v5, v7

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setAdditionalWidth(F)V

    goto :goto_1

    .line 643
    :cond_0
    invoke-direct {p0, v3}, Lcom/itextpdf/layout/renderer/TableWidths;->getCellBorderIndents(Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;)[F

    move-result-object v5

    .line 644
    .local v5, "indents":[F
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getAdditionalWidth()F

    move-result v7

    aget v8, v5, v6

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    add-float/2addr v7, v8

    const/4 v8, 0x3

    aget v8, v5, v8

    div-float/2addr v8, v9

    add-float/2addr v7, v8

    invoke-virtual {v4, v7}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setAdditionalWidth(F)V

    .line 647
    .end local v5    # "indents":[F
    :goto_1
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v5

    if-ne v5, v6, :cond_1

    .line 648
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v7

    aget v7, v0, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    aput v6, v0, v5

    .line 649
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v7

    aget v7, v1, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    aput v6, v1, v5

    goto :goto_5

    .line 651
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v5

    .line 652
    .local v5, "remainMin":F
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v6

    .line 653
    .local v6, "remainMax":F
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v7

    .local v7, "i":I
    :goto_2
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v8

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v9

    add-int/2addr v8, v9

    if-ge v7, v8, :cond_2

    .line 654
    aget v8, v0, v7

    sub-float/2addr v5, v8

    .line 655
    aget v8, v1, v7

    sub-float/2addr v6, v8

    .line 653
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 657
    .end local v7    # "i":I
    :cond_2
    const/4 v7, 0x0

    cmpl-float v8, v5, v7

    if-lez v8, :cond_3

    .line 658
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v8

    .local v8, "i":I
    :goto_3
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v9

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v10

    add-int/2addr v9, v10

    if-ge v8, v9, :cond_3

    .line 659
    aget v9, v0, v8

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v10

    int-to-float v10, v10

    div-float v10, v5, v10

    add-float/2addr v9, v10

    aput v9, v0, v8

    .line 658
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 662
    .end local v8    # "i":I
    :cond_3
    cmpl-float v7, v6, v7

    if-lez v7, :cond_4

    .line 663
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v7

    .restart local v7    # "i":I
    :goto_4
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v8

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v9

    add-int/2addr v8, v9

    if-ge v7, v8, :cond_4

    .line 664
    aget v8, v1, v7

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v9

    int-to-float v9, v9

    div-float v9, v6, v9

    add-float/2addr v8, v9

    aput v8, v1, v7

    .line 663
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 668
    .end local v3    # "cell":Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;
    .end local v4    # "minMax":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v5    # "remainMin":F
    .end local v6    # "remainMax":F
    .end local v7    # "i":I
    :cond_4
    :goto_5
    goto/16 :goto_0

    .line 670
    :cond_5
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v3, v3

    if-ge v2, v3, :cond_6

    .line 671
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    new-instance v4, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget v5, v0, v2

    aget v6, v1, v2

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;-><init>(FF)V

    aput-object v4, v3, v2

    .line 670
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 673
    .end local v2    # "i":I
    :cond_6
    return-void
.end method

.method private calculateTableWidth(FZ)V
    .locals 6
    .param p1, "availableWidth"    # F
    .param p2, "calculateTableMaxWidth"    # Z

    .line 565
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 566
    const/16 v1, 0x5d

    const-string v2, "auto"

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 565
    const-string v1, "fixed"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableLayout:Z

    .line 567
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v1, 0x4d

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 568
    .local v0, "width":Lcom/itextpdf/layout/properties/UnitValue;
    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableLayout:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    cmpl-float v2, v2, v4

    if-ltz v2, :cond_3

    .line 569
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    .line 570
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    goto :goto_0

    .line 571
    :cond_0
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Table;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 572
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v5, p1, v1}, Lcom/itextpdf/layout/renderer/TableRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/element/Table;->setWidth(F)Lcom/itextpdf/layout/element/IElement;

    .line 574
    :cond_1
    :goto_0
    iput-boolean v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableWidth:Z

    .line 575
    invoke-direct {p0, v0, p1}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(Lcom/itextpdf/layout/properties/UnitValue;F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 576
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    iget v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    :goto_1
    iput v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    goto :goto_2

    .line 578
    :cond_3
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableLayout:Z

    .line 580
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    .line 581
    if-eqz p2, :cond_4

    .line 582
    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableWidth:Z

    .line 583
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(F)F

    move-result v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    goto :goto_2

    .line 584
    :cond_4
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    cmpl-float v2, v2, v4

    if-ltz v2, :cond_5

    .line 585
    iput-boolean v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableWidth:Z

    .line 586
    invoke-direct {p0, v0, p1}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(Lcom/itextpdf/layout/properties/UnitValue;F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    goto :goto_2

    .line 588
    :cond_5
    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableWidth:Z

    .line 589
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(F)F

    move-result v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 592
    :goto_2
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    invoke-direct {p0, v1, p1}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(Lcom/itextpdf/layout/properties/UnitValue;F)Ljava/lang/Float;

    move-result-object v1

    .line 593
    .local v1, "min":Ljava/lang/Float;
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v3, 0x4f

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    invoke-direct {p0, v2, p1}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(Lcom/itextpdf/layout/properties/UnitValue;F)Ljava/lang/Float;

    move-result-object v2

    .line 595
    .local v2, "max":Ljava/lang/Float;
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_3

    :cond_6
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    :goto_3
    iput v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMinWidth:F

    .line 596
    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_4

    :cond_7
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    :goto_4
    iput v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMaxWidth:F

    .line 598
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMinWidth:F

    iget v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMaxWidth:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_8

    .line 599
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMinWidth:F

    iput v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMaxWidth:F

    .line 601
    :cond_8
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMinWidth:F

    iget v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_9

    .line 602
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMinWidth:F

    iput v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 604
    :cond_9
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMaxWidth:F

    iget v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_a

    .line 605
    iget v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableMaxWidth:F

    iput v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 606
    :cond_a
    return-void
.end method

.method private extractWidths()[F
    .locals 7

    .line 718
    const/4 v0, 0x0

    .line 719
    .local v0, "actualWidth":F
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    .line 720
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v2, v2

    new-array v2, v2, [F

    .line 721
    .local v2, "columnWidths":[F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v4, v4

    if-ge v3, v4, :cond_1

    .line 722
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v4, v4, v3

    iget v4, v4, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    cmpl-float v4, v4, v1

    if-ltz v4, :cond_0

    .line 723
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v4, v4, v3

    iget v4, v4, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    iget v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    add-float/2addr v4, v5

    aput v4, v2, v3

    .line 724
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v4, v4, v3

    iget v4, v4, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    add-float/2addr v0, v4

    .line 725
    iget v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v3

    iget v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iget v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    add-float/2addr v5, v6

    add-float/2addr v4, v5

    iput v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    .line 721
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 722
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 727
    .end local v3    # "i":I
    :cond_1
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getEps()F

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v4, v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    cmpl-float v1, v0, v1

    if-lez v1, :cond_2

    .line 728
    const-class v1, Lcom/itextpdf/layout/renderer/TableWidths;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 729
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v3, "Table width is more than expected due to min width of cell(s)."

    invoke-interface {v1, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 731
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_2
    return-object v2
.end method

.method private fillAndSortCells()V
    .locals 2

    .line 688
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->cells:Ljava/util/List;

    .line 689
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_0

    .line 690
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableWidths;->fillRendererCells(Lcom/itextpdf/layout/renderer/TableRenderer;B)V

    .line 692
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableWidths;->fillRendererCells(Lcom/itextpdf/layout/renderer/TableRenderer;B)V

    .line 693
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v0, :cond_1

    .line 694
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableWidths;->fillRendererCells(Lcom/itextpdf/layout/renderer/TableRenderer;B)V

    .line 698
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->cells:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 699
    return-void
.end method

.method private fillRendererCells(Lcom/itextpdf/layout/renderer/TableRenderer;B)V
    .locals 5
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p2, "region"    # B

    .line 702
    const/4 v0, 0x0

    .local v0, "row":I
    :goto_0
    iget-object v1, p1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 703
    const/4 v1, 0x0

    .local v1, "col":I
    :goto_1
    iget v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v1, v2, :cond_1

    .line 704
    iget-object v2, p1, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v2, v2, v1

    .line 705
    .local v2, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    if-eqz v2, :cond_0

    .line 706
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->cells:Ljava/util/List;

    new-instance v4, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;

    invoke-direct {v4, v2, v0, v1, p2}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;-><init>(Lcom/itextpdf/layout/renderer/CellRenderer;IIB)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 703
    .end local v2    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 702
    .end local v1    # "col":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 710
    .end local v0    # "row":I
    :cond_2
    return-void
.end method

.method private getCellBorderIndents(Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;)[F
    .locals 6
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;

    .line 677
    iget-byte v0, p1, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->region:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 678
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .local v0, "renderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    goto :goto_0

    .line 679
    .end local v0    # "renderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    :cond_0
    iget-byte v0, p1, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->region:B

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 680
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v0, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->footerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .restart local v0    # "renderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    goto :goto_0

    .line 682
    .end local v0    # "renderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 684
    .restart local v0    # "renderer":Lcom/itextpdf/layout/renderer/TableRenderer;
    :goto_0
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getRow()I

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getRowspan()I

    move-result v4

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/itextpdf/layout/renderer/TableBorders;->getCellBorderIndents(IIII)[F

    move-result-object v1

    return-object v1
.end method

.method private getCellWidth(Lcom/itextpdf/layout/renderer/CellRenderer;Z)Lcom/itextpdf/layout/properties/UnitValue;
    .locals 9
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "zeroIsValid"    # Z

    .line 829
    new-instance v0, Lcom/itextpdf/layout/properties/UnitValue;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    const/16 v2, 0x4d

    invoke-virtual {p1, v2, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/properties/UnitValue;-><init>(Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 831
    .local v0, "widthValue":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    const v2, -0x472e48e9    # -1.0E-4f

    cmpg-float v1, v1, v2

    const/4 v2, 0x0

    if-gez v1, :cond_0

    .line 832
    return-object v2

    .line 835
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    const v3, 0x38d1b717    # 1.0E-4f

    cmpg-float v1, v1, v3

    if-gez v1, :cond_2

    .line 836
    if-eqz p2, :cond_1

    sget-object v2, Lcom/itextpdf/layout/renderer/TableWidths;->ZeroWidth:Lcom/itextpdf/layout/properties/UnitValue;

    :cond_1
    return-object v2

    .line 837
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 838
    return-object v0

    .line 840
    :cond_3
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/renderer/TableWidths;->resolveMinMaxCollision(Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 841
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 842
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 843
    .local v1, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v2, 0x1

    aget-object v3, v1, v2

    const/high16 v4, 0x40000000    # 2.0f

    if-eqz v3, :cond_5

    .line 844
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v5, v5, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v5, :cond_4

    aget-object v5, v1, v2

    .line 846
    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    goto :goto_0

    :cond_4
    aget-object v5, v1, v2

    .line 847
    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    div-float/2addr v5, v4

    :goto_0
    add-float/2addr v3, v5

    .line 844
    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 849
    :cond_5
    const/4 v3, 0x3

    aget-object v5, v1, v3

    if-eqz v5, :cond_7

    .line 850
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v6, v6, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v6, v6, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v6, :cond_6

    aget-object v4, v1, v3

    .line 852
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    goto :goto_1

    :cond_6
    aget-object v6, v1, v3

    .line 853
    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    div-float v4, v6, v4

    :goto_1
    add-float/2addr v5, v4

    .line 850
    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 855
    :cond_7
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 856
    .local v4, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    aget-object v5, v4, v2

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    const-string v6, "Property {0} in percents is not supported"

    const-class v7, Lcom/itextpdf/layout/renderer/TableWidths;

    if-nez v5, :cond_8

    .line 857
    invoke-static {v7}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 858
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 859
    const/16 v8, 0x30

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 858
    invoke-static {v6, v8}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 861
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_8
    aget-object v5, v4, v3

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_9

    .line 862
    invoke-static {v7}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 863
    .restart local v5    # "logger":Lorg/slf4j/Logger;
    nop

    .line 864
    const/16 v7, 0x31

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    .line 863
    invoke-static {v6, v7}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 866
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_9
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    aget-object v2, v4, v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    add-float/2addr v5, v2

    aget-object v2, v4, v3

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    add-float/2addr v5, v2

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 868
    .end local v1    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v4    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_a
    return-object v0
.end method

.method private getTable()Lcom/itextpdf/layout/element/Table;
    .locals 1

    .line 626
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    return-object v0
.end method

.method private resolveMinMaxCollision(Lcom/itextpdf/layout/renderer/CellRenderer;Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/properties/UnitValue;
    .locals 4
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "widthValue"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 873
    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 875
    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 876
    .local v0, "minWidthValue":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 877
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 878
    return-object v0

    .line 880
    :cond_0
    const/16 v1, 0x4f

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    .line 881
    .local v1, "maxWidthValue":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 882
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1

    .line 883
    return-object v1

    .line 885
    :cond_1
    return-object p2

    .line 873
    .end local v0    # "minWidthValue":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v1    # "maxWidthValue":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private retrieveTableWidth(F)F
    .locals 3
    .param p1, "width"    # F

    .line 616
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/16 v2, 0x72

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 620
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->rightBorderMaxWidth:F

    .line 616
    if-eqz v0, :cond_0

    .line 617
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->leftBorderMaxWidth:F

    add-float/2addr v1, v0

    sub-float/2addr p1, v1

    .line 618
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    add-int/lit8 v0, v0, 0x1

    int-to-float v0, v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    mul-float/2addr v0, v1

    sub-float/2addr p1, v0

    goto :goto_0

    .line 620
    :cond_0
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->leftBorderMaxWidth:F

    add-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v1, v0

    sub-float/2addr p1, v1

    .line 622
    :goto_0
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method private retrieveTableWidth(Lcom/itextpdf/layout/properties/UnitValue;F)Ljava/lang/Float;
    .locals 2
    .param p1, "width"    # Lcom/itextpdf/layout/properties/UnitValue;
    .param p2, "availableWidth"    # F

    .line 609
    if-nez p1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 610
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 611
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    mul-float/2addr v0, p2

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    goto :goto_0

    .line 612
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    .line 610
    :goto_0
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/TableWidths;->retrieveTableWidth(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method private warn100percent()V
    .locals 2

    .line 713
    const-class v0, Lcom/itextpdf/layout/renderer/TableWidths;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 714
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Sum of table columns is greater than 100%."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 715
    return-void
.end method


# virtual methods
.method autoLayout()[F
    .locals 6

    .line 93
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 94
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->fillAndSortCells()V

    .line 95
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->calculateMinMaxWidths()V

    .line 97
    const/4 v0, 0x0

    .line 98
    .local v0, "minSum":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 99
    .local v4, "width":Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    iget v5, v4, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    add-float/2addr v0, v5

    .line 98
    .end local v4    # "width":Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->cells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;

    .line 103
    .local v2, "cell":Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/TableWidths;->processCell(Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;)V

    .line 104
    .end local v2    # "cell":Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;
    goto :goto_1

    .line 106
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->processColumns()V

    .line 108
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TableWidths;->recalculate(F)V

    .line 110
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->extractWidths()[F

    move-result-object v1

    return-object v1

    .line 93
    .end local v0    # "minSum":F
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method autoLayoutCustom()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;",
            ">;"
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableRenderer;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->fillAndSortCells()V

    .line 116
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->calculateMinMaxWidths()V

    .line 117
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->cells:Ljava/util/List;

    return-object v0

    .line 114
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method fixedLayout()[F
    .locals 18

    .line 460
    move-object/from16 v0, p0

    iget v1, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    new-array v1, v1, [F

    .line 462
    .local v1, "columnWidths":[F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    const/high16 v4, 0x42c80000    # 100.0f

    const/4 v5, 0x0

    const/high16 v6, -0x40800000    # -1.0f

    if-ge v2, v3, :cond_3

    .line 463
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/element/Table;->getColumnWidth(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 464
    .local v3, "colWidth":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    cmpg-float v5, v7, v5

    if-gez v5, :cond_0

    goto :goto_1

    .line 466
    :cond_0
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 467
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    iget v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    mul-float/2addr v5, v6

    div-float/2addr v5, v4

    aput v5, v1, v2

    goto :goto_2

    .line 469
    :cond_1
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    aput v4, v1, v2

    goto :goto_2

    .line 465
    :cond_2
    :goto_1
    aput v6, v1, v2

    .line 462
    .end local v3    # "colWidth":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 473
    .end local v2    # "i":I
    :cond_3
    const/4 v2, 0x0

    .line 474
    .local v2, "processedColumns":I
    iget v3, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 476
    .local v3, "remainWidth":F
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v8, 0x0

    if-eqz v7, :cond_4

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_4

    .line 477
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->headerRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .local v7, "firtsRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_3

    .line 478
    .end local v7    # "firtsRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_4
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_5

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-nez v7, :cond_5

    .line 479
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v7, v7, Lcom/itextpdf/layout/renderer/TableRenderer;->rows:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lcom/itextpdf/layout/renderer/CellRenderer;

    .restart local v7    # "firtsRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_3

    .line 482
    .end local v7    # "firtsRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_5
    const/4 v7, 0x0

    .line 485
    .restart local v7    # "firtsRow":[Lcom/itextpdf/layout/renderer/CellRenderer;
    :goto_3
    array-length v8, v1

    new-array v8, v8, [F

    .line 486
    .local v8, "columnWidthIfPercent":[F
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4
    array-length v10, v8

    if-ge v9, v10, :cond_6

    .line 487
    aput v6, v8, v9

    .line 486
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 489
    .end local v9    # "i":I
    :cond_6
    const/4 v9, 0x0

    .line 492
    .local v9, "sumOfPercents":F
    if-eqz v7, :cond_e

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v10

    if-eqz v10, :cond_e

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    .line 493
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_5
    iget v11, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v10, v11, :cond_d

    .line 494
    aget v11, v1, v10

    cmpl-float v11, v11, v6

    if-nez v11, :cond_c

    .line 495
    aget-object v11, v7, v10

    .line 496
    .local v11, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    if-eqz v11, :cond_b

    .line 497
    const/4 v12, 0x1

    invoke-direct {v0, v11, v12}, Lcom/itextpdf/layout/renderer/TableWidths;->getCellWidth(Lcom/itextpdf/layout/renderer/CellRenderer;Z)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v12

    .line 498
    .local v12, "cellWidth":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v12, :cond_a

    .line 499
    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v13

    cmpl-float v13, v13, v5

    if-ltz v13, :cond_9

    .line 500
    const/4 v13, 0x0

    .line 501
    .local v13, "width":F
    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v14

    if-eqz v14, :cond_7

    .line 502
    iget v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v15

    mul-float/2addr v14, v15

    div-float/2addr v14, v4

    .line 503
    .end local v13    # "width":F
    .local v14, "width":F
    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v13

    aput v13, v8, v10

    .line 504
    aget v13, v8, v10

    add-float/2addr v9, v13

    goto :goto_6

    .line 506
    .end local v14    # "width":F
    .restart local v13    # "width":F
    :cond_7
    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v14

    .line 508
    .end local v13    # "width":F
    .restart local v14    # "width":F
    :goto_6
    invoke-virtual {v11}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v13}, Lcom/itextpdf/layout/element/Cell;->getColspan()I

    move-result v13

    .line 509
    .local v13, "colspan":I
    const/4 v15, 0x0

    .local v15, "j":I
    :goto_7
    if-ge v15, v13, :cond_8

    .line 510
    add-int v16, v10, v15

    move/from16 v17, v4

    int-to-float v4, v13

    div-float v4, v14, v4

    aput v4, v1, v16

    .line 509
    add-int/lit8 v15, v15, 0x1

    move/from16 v4, v17

    goto :goto_7

    :cond_8
    move/from16 v17, v4

    .line 512
    .end local v15    # "j":I
    aget v4, v1, v10

    sub-float/2addr v3, v4

    .line 513
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 499
    .end local v13    # "colspan":I
    .end local v14    # "width":F
    :cond_9
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 498
    :cond_a
    move/from16 v17, v4

    goto :goto_8

    .line 496
    .end local v12    # "cellWidth":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_b
    move/from16 v17, v4

    .line 516
    .end local v11    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :goto_8
    goto :goto_9

    .line 517
    :cond_c
    move/from16 v17, v4

    aget v4, v1, v10

    sub-float/2addr v3, v4

    .line 518
    add-int/lit8 v2, v2, 0x1

    .line 493
    :goto_9
    add-int/lit8 v10, v10, 0x1

    move/from16 v4, v17

    goto :goto_5

    :cond_d
    move/from16 v17, v4

    .end local v10    # "i":I
    goto :goto_b

    .line 492
    :cond_e
    move/from16 v17, v4

    .line 522
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_a
    iget v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v4, v10, :cond_10

    .line 523
    aget v10, v1, v4

    cmpl-float v10, v10, v6

    if-eqz v10, :cond_f

    .line 524
    add-int/lit8 v2, v2, 0x1

    .line 525
    aget v10, v1, v4

    sub-float/2addr v3, v10

    .line 522
    :cond_f
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 529
    .end local v4    # "i":I
    :cond_10
    :goto_b
    cmpl-float v4, v9, v17

    if-lez v4, :cond_11

    .line 530
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->warn100percent()V

    .line 532
    :cond_11
    cmpl-float v4, v3, v5

    if-lez v4, :cond_13

    .line 533
    iget v4, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ne v4, v2, :cond_15

    .line 535
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_c
    iget v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v4, v10, :cond_12

    .line 536
    iget v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    aget v11, v1, v4

    mul-float/2addr v10, v11

    iget v11, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    sub-float/2addr v11, v3

    div-float/2addr v10, v11

    aput v10, v1, v4

    .line 535
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .end local v4    # "i":I
    :cond_12
    goto :goto_f

    .line 539
    :cond_13
    cmpg-float v4, v3, v5

    if-gez v4, :cond_15

    .line 541
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_d
    iget v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v4, v10, :cond_15

    .line 542
    aget v10, v1, v4

    aget v11, v8, v4

    cmpl-float v11, v6, v11

    if-eqz v11, :cond_14

    aget v11, v8, v4

    mul-float/2addr v11, v3

    div-float/2addr v11, v9

    goto :goto_e

    :cond_14
    move v11, v5

    :goto_e
    add-float/2addr v10, v11

    aput v10, v1, v4

    .line 541
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 547
    .end local v4    # "i":I
    :cond_15
    :goto_f
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_10
    iget v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v4, v10, :cond_17

    .line 548
    aget v10, v1, v4

    cmpl-float v10, v10, v6

    if-nez v10, :cond_16

    .line 549
    iget v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    sub-int/2addr v10, v2

    int-to-float v10, v10

    div-float v10, v3, v10

    invoke-static {v5, v10}, Ljava/lang/Math;->max(FF)F

    move-result v10

    aput v10, v1, v4

    .line 547
    :cond_16
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 554
    .end local v4    # "i":I
    :cond_17
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableRenderer:Lcom/itextpdf/layout/renderer/TableRenderer;

    iget-object v4, v4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    instance-of v4, v4, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;

    if-eqz v4, :cond_18

    .line 555
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_11
    iget v5, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v4, v5, :cond_18

    .line 556
    aget v5, v1, v4

    iget v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->horizontalBorderSpacing:F

    add-float/2addr v5, v6

    aput v5, v1, v4

    .line 555
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 559
    .end local v4    # "i":I
    :cond_18
    return-object v1
.end method

.method getMinWidth()F
    .locals 1

    .line 89
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->layoutMinWidth:F

    return v0
.end method

.method hasFixedLayout()Z
    .locals 1

    .line 77
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableLayout:Z

    return v0
.end method

.method layout()[F
    .locals 1

    .line 81
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->hasFixedLayout()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->fixedLayout()[F

    move-result-object v0

    return-object v0

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->autoLayout()[F

    move-result-object v0

    return-object v0
.end method

.method processCell(Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;)V
    .locals 7
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;

    .line 124
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCell()Lcom/itextpdf/layout/renderer/CellRenderer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TableWidths;->getCellWidth(Lcom/itextpdf/layout/renderer/CellRenderer;Z)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 125
    .local v0, "cellWidth":Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x0

    if-eqz v0, :cond_b

    .line 126
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    cmpl-float v2, v2, v1

    if-lez v2, :cond_a

    .line 127
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_7

    .line 130
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v2

    if-ne v2, v3, :cond_0

    .line 131
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setPercents(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    goto/16 :goto_7

    .line 133
    :cond_0
    const/4 v2, 0x0

    .line 134
    .local v2, "pointColumns":I
    const/4 v3, 0x0

    .line 135
    .local v3, "percentSum":F
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v4

    .local v4, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v6

    add-int/2addr v5, v6

    if-ge v4, v5, :cond_2

    .line 136
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    iget-boolean v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v5, :cond_1

    .line 137
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 139
    :cond_1
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v3, v5

    .line 135
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 142
    .end local v4    # "i":I
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    sub-float/2addr v4, v3

    .line 143
    .local v4, "percentAddition":F
    cmpl-float v1, v4, v1

    if-lez v1, :cond_6

    .line 144
    if-nez v2, :cond_4

    .line 147
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v1

    .local v1, "i":I
    :goto_2
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v6

    add-int/2addr v5, v6

    if-ge v1, v5, :cond_3

    .line 148
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v1

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v4, v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->addPercents(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v1    # "i":I
    :cond_3
    goto :goto_4

    .line 153
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v1

    .restart local v1    # "i":I
    :goto_3
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v6

    add-int/2addr v5, v6

    if-ge v1, v5, :cond_6

    .line 154
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v1

    iget-boolean v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v5, :cond_5

    .line 155
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v1

    int-to-float v6, v2

    div-float v6, v4, v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setPercents(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 153
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 160
    .end local v1    # "i":I
    .end local v2    # "pointColumns":I
    .end local v3    # "percentSum":F
    .end local v4    # "percentAddition":F
    :cond_6
    :goto_4
    goto/16 :goto_7

    .line 164
    :cond_7
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v1

    if-ne v1, v3, :cond_9

    .line 165
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v2

    aget-object v1, v1, v2

    iget-boolean v1, v1, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v1, :cond_f

    .line 166
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v2

    aget-object v1, v1, v2

    iget v1, v1, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    cmpg-float v1, v1, v2

    .line 169
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 166
    if-gtz v1, :cond_8

    .line 167
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v1

    aget-object v1, v2, v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setFixed(Z)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    goto/16 :goto_7

    .line 169
    :cond_8
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v1

    aget-object v1, v2, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v3

    aget-object v2, v2, v3

    iget v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    goto :goto_7

    .line 173
    :cond_9
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/TableWidths;->processCellsRemainWidth(Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;Lcom/itextpdf/layout/properties/UnitValue;)V

    goto :goto_7

    .line 126
    :cond_a
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 176
    :cond_b
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFlexible()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 179
    const/4 v2, 0x0

    .line 180
    .local v2, "flexibleCols":I
    const/4 v3, 0x0

    .line 181
    .local v3, "remainWidth":F
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v4

    .local v4, "i":I
    :goto_5
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v6

    add-int/2addr v5, v6

    if-ge v4, v5, :cond_d

    .line 182
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFlexible()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 183
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->max:F

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v4

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    sub-float/2addr v5, v6

    add-float/2addr v3, v5

    .line 184
    add-int/lit8 v2, v2, 0x1

    .line 181
    :cond_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 187
    .end local v4    # "i":I
    :cond_d
    cmpl-float v1, v3, v1

    if-lez v1, :cond_f

    .line 190
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v1

    .restart local v1    # "i":I
    :goto_6
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v4

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v5

    add-int/2addr v4, v5

    if-ge v1, v4, :cond_f

    .line 191
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFlexible()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 192
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v4, v4, v1

    int-to-float v5, v2

    div-float v5, v3, v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->addPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 190
    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 197
    .end local v1    # "i":I
    .end local v2    # "flexibleCols":I
    .end local v3    # "remainWidth":F
    :cond_f
    :goto_7
    return-void
.end method

.method processCellsRemainWidth(Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 8
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;
    .param p2, "cellWidth"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 412
    const/4 v0, 0x0

    .line 413
    .local v0, "flexibleCols":I
    invoke-virtual {p2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    .line 414
    .local v1, "remainWidth":F
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v2

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v4

    add-int/2addr v3, v4

    if-ge v2, v3, :cond_2

    .line 415
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v2

    iget-boolean v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v3, :cond_1

    .line 416
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v2

    iget v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    sub-float/2addr v1, v3

    .line 417
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v2

    iget-boolean v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-nez v3, :cond_0

    .line 418
    add-int/lit8 v0, v0, 0x1

    .line 414
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 422
    :cond_1
    const/4 v1, 0x0

    .line 423
    nop

    .line 426
    .end local v2    # "i":I
    :cond_2
    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-lez v3, :cond_a

    .line 427
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v3

    new-array v3, v3, [I

    const/4 v4, -0x1

    invoke-static {v3, v4}, Lcom/itextpdf/io/util/ArrayUtil;->fillWithValue([II)[I

    move-result-object v3

    .line 428
    .local v3, "flexibleColIndexes":[I
    if-lez v0, :cond_9

    .line 430
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v4

    .local v4, "i":I
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v6

    add-int/2addr v5, v6

    if-ge v4, v5, :cond_6

    .line 431
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFlexible()Z

    move-result v5

    if-nez v5, :cond_3

    .line 432
    goto :goto_2

    .line 433
    :cond_3
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v4

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    int-to-float v7, v0

    div-float v7, v1, v7

    add-float/2addr v6, v7

    cmpl-float v5, v5, v6

    if-lez v5, :cond_4

    .line 434
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v4

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->resetPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 435
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v5, v5, v4

    iget v5, v5, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v4

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    sub-float/2addr v5, v6

    sub-float/2addr v1, v5

    .line 436
    add-int/lit8 v0, v0, -0x1

    .line 437
    if-eqz v0, :cond_6

    cmpg-float v5, v1, v2

    if-gtz v5, :cond_5

    .line 438
    goto :goto_3

    .line 441
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v5

    sub-int v5, v4, v5

    aput v4, v3, v5

    .line 430
    :cond_5
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 444
    .end local v4    # "i":I
    :cond_6
    :goto_3
    if-lez v0, :cond_a

    cmpl-float v2, v1, v2

    if-lez v2, :cond_a

    .line 445
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_4
    array-length v4, v3

    if-ge v2, v4, :cond_8

    .line 446
    aget v4, v3, v2

    if-ltz v4, :cond_7

    .line 447
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget v5, v3, v2

    aget-object v4, v4, v5

    int-to-float v5, v0

    div-float v5, v1, v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->addPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setFixed(Z)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 445
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .end local v2    # "i":I
    :cond_8
    goto :goto_6

    .line 452
    :cond_9
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v2

    .restart local v2    # "i":I
    :goto_5
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getCol()I

    move-result v4

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v5

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_a

    .line 453
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v4, v4, v2

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableWidths$CellInfo;->getColspan()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v1, v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->addPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 452
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 457
    .end local v2    # "i":I
    .end local v3    # "flexibleColIndexes":[I
    :cond_a
    :goto_6
    return-void
.end method

.method processColumns()V
    .locals 4

    .line 200
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v0, v1, :cond_4

    .line 201
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TableWidths;->getTable()Lcom/itextpdf/layout/element/Table;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/element/Table;->getColumnWidth(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    .line 202
    .local v1, "colWidth":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    .line 203
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v2

    .line 210
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 203
    if-eqz v2, :cond_1

    .line 204
    aget-object v2, v3, v0

    iget-boolean v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v2, :cond_3

    .line 205
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 206
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iput v3, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->max:F

    .line 208
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setPercents(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    goto :goto_1

    .line 210
    :cond_1
    aget-object v2, v3, v0

    iget-boolean v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v2, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_3

    .line 211
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    .line 214
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 211
    if-eqz v2, :cond_2

    .line 212
    aget-object v2, v3, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    goto :goto_1

    .line 214
    :cond_2
    aget-object v2, v3, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->resetPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->setFixed(Z)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 200
    .end local v1    # "colWidth":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 219
    .end local v0    # "i":I
    :cond_4
    return-void
.end method

.method recalculate(F)V
    .locals 18
    .param p1, "minSum"    # F

    .line 222
    move-object/from16 v0, p0

    iget v1, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    sub-float v1, v1, p1

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 223
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v1, v2, :cond_0

    .line 224
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v1

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v3, v3, v1

    iget v3, v3, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iput v3, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 223
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_0
    goto/16 :goto_17

    .line 227
    :cond_1
    const/4 v1, 0x0

    .line 229
    .local v1, "sumOfPercents":F
    const/4 v3, 0x0

    .line 230
    .local v3, "minTableWidth":F
    const/4 v4, 0x0

    .line 233
    .local v4, "totalNonPercent":F
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v6, v6

    const/high16 v7, 0x42c80000    # 100.0f

    if-ge v5, v6, :cond_5

    .line 234
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    iget-boolean v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v6, :cond_4

    .line 235
    cmpg-float v6, v1, v7

    if-gez v6, :cond_2

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v6, v1

    cmpl-float v6, v6, v7

    if-lez v6, :cond_2

    .line 236
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    sub-float/2addr v7, v1

    iput v7, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 237
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v1, v6

    .line 238
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->warn100percent()V

    goto :goto_2

    .line 239
    :cond_2
    cmpl-float v6, v1, v7

    .line 244
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 239
    if-ltz v6, :cond_3

    .line 240
    aget-object v6, v7, v5

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v5

    iget v7, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->resetPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 241
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    add-float/2addr v3, v6

    .line 242
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TableWidths;->warn100percent()V

    goto :goto_2

    .line 244
    :cond_3
    aget-object v6, v7, v5

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v1, v6

    goto :goto_2

    .line 247
    :cond_4
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    add-float/2addr v3, v6

    .line 248
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v5

    iget v6, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v4, v6

    .line 233
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 251
    .end local v5    # "i":I
    :cond_5
    cmpg-float v5, v1, v7

    if-gtz v5, :cond_2d

    .line 253
    const/4 v5, 0x1

    .line 254
    .local v5, "toBalance":Z
    iget-boolean v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableWidth:Z

    if-nez v6, :cond_a

    .line 255
    cmpg-float v6, v1, v7

    if-gez v6, :cond_6

    mul-float v6, v4, v7

    sub-float v8, v7, v1

    div-float/2addr v6, v8

    goto :goto_3

    :cond_6
    move v6, v2

    .line 257
    .local v6, "tableWidthBasedOnPercents":F
    :goto_3
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_4
    iget v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v8, v9, :cond_8

    .line 258
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    iget-boolean v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v9, :cond_7

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    cmpl-float v9, v9, v2

    if-lez v9, :cond_7

    .line 259
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->max:F

    mul-float/2addr v9, v7

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v10, v10, v8

    iget v10, v10, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    div-float/2addr v9, v10

    invoke-static {v9, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 257
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 263
    .end local v8    # "i":I
    :cond_8
    iget v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    cmpg-float v8, v6, v8

    if-gtz v8, :cond_a

    .line 264
    cmpl-float v8, v6, v3

    if-ltz v8, :cond_9

    .line 265
    iput v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 267
    const/4 v5, 0x0

    goto :goto_5

    .line 269
    :cond_9
    iput v3, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 274
    .end local v6    # "tableWidthBasedOnPercents":F
    :cond_a
    :goto_5
    cmpl-float v6, v1, v2

    if-lez v6, :cond_c

    cmpg-float v6, v1, v7

    if-gez v6, :cond_c

    cmpl-float v6, v4, v2

    if-nez v6, :cond_c

    .line 277
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_6
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    array-length v8, v8

    if-ge v6, v8, :cond_b

    .line 278
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v8, v8, v6

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v6

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v9, v7

    div-float/2addr v9, v1

    iput v9, v8, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 277
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 280
    .end local v6    # "i":I
    :cond_b
    const/high16 v1, 0x42c80000    # 100.0f

    .line 283
    :cond_c
    if-nez v5, :cond_f

    .line 285
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    iget v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v2, v6, :cond_e

    .line 286
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v6, v6, v2

    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v8, v8, v2

    iget-boolean v8, v8, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v8, :cond_d

    iget v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v2

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v8, v9

    div-float/2addr v8, v7

    goto :goto_8

    :cond_d
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v8, v8, v2

    iget v8, v8, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    :goto_8
    iput v8, v6, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 285
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .end local v2    # "i":I
    :cond_e
    goto/16 :goto_17

    .line 290
    :cond_f
    cmpl-float v6, v1, v7

    if-ltz v6, :cond_15

    .line 291
    const/high16 v1, 0x42c80000    # 100.0f

    .line 292
    const/4 v2, 0x0

    .line 293
    .local v2, "recalculatePercents":Z
    iget v6, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    sub-float/2addr v6, v3

    .line 294
    .local v6, "remainWidth":F
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_9
    iget v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v8, v9, :cond_12

    .line 295
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    iget-boolean v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    .line 306
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 295
    if-eqz v9, :cond_11

    .line 296
    aget-object v9, v10, v8

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v9, v6

    div-float/2addr v9, v7

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v10, v10, v8

    iget v10, v10, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    cmpl-float v9, v9, v10

    .line 299
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 296
    if-ltz v9, :cond_10

    .line 297
    aget-object v9, v10, v8

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v10, v10, v8

    iget v10, v10, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v10, v6

    div-float/2addr v10, v7

    iput v10, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    goto :goto_a

    .line 299
    :cond_10
    aget-object v9, v10, v8

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v10, v10, v8

    iget v10, v10, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iput v10, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 300
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    const/4 v10, 0x0

    iput-boolean v10, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    .line 301
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    sub-float/2addr v6, v9

    .line 302
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v8

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    sub-float/2addr v1, v9

    .line 303
    const/4 v2, 0x1

    goto :goto_a

    .line 306
    :cond_11
    aget-object v9, v10, v8

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v10, v10, v8

    iget v10, v10, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iput v10, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 294
    :goto_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    .line 309
    .end local v8    # "i":I
    :cond_12
    if-eqz v2, :cond_14

    .line 310
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_b
    iget v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v7, v8, :cond_14

    .line 311
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v8, v8, v7

    iget-boolean v8, v8, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v8, :cond_13

    .line 312
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v8, v8, v7

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v9, v9, v7

    iget v9, v9, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v9, v6

    div-float/2addr v9, v1

    iput v9, v8, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 310
    :cond_13
    add-int/lit8 v7, v7, 0x1

    goto :goto_b

    .line 316
    .end local v2    # "recalculatePercents":Z
    .end local v6    # "remainWidth":F
    .end local v7    # "i":I
    :cond_14
    goto/16 :goto_17

    .line 324
    :cond_15
    const/4 v6, 0x0

    .line 325
    .local v6, "totalPercent":F
    const/4 v8, 0x0

    .line 326
    .local v8, "minTotalNonPercent":F
    const/4 v9, 0x0

    .line 327
    .local v9, "fixedAddition":F
    const/4 v10, 0x0

    .line 328
    .local v10, "flexibleAddition":F
    const/4 v11, 0x0

    .line 330
    .local v11, "hasFlexibleCell":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_c
    iget v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v12, v13, :cond_19

    .line 331
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget-boolean v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v13, :cond_17

    .line 332
    iget v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v13, v14

    div-float/2addr v13, v7

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    cmpl-float v13, v13, v14

    .line 336
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 332
    if-ltz v13, :cond_16

    .line 333
    aget-object v13, v14, v12

    iget v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v15, v15, v12

    iget v15, v15, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v14, v15

    div-float/2addr v14, v7

    iput v14, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 334
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    add-float/2addr v6, v13

    goto :goto_d

    .line 336
    :cond_16
    aget-object v13, v14, v12

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    sub-float/2addr v1, v13

    .line 337
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    invoke-virtual {v13, v14}, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->resetPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 338
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iput v14, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 339
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    add-float/2addr v8, v13

    goto :goto_d

    .line 342
    :cond_17
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    iput v14, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 343
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    add-float/2addr v8, v13

    .line 344
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v12

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    sub-float/2addr v13, v14

    .line 345
    .local v13, "addition":F
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v12

    iget-boolean v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-eqz v14, :cond_18

    .line 346
    add-float/2addr v9, v13

    goto :goto_d

    .line 348
    :cond_18
    add-float/2addr v10, v13

    .line 349
    const/4 v11, 0x1

    .line 330
    .end local v13    # "addition":F
    :goto_d
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_c

    .line 353
    .end local v12    # "i":I
    :cond_19
    add-float v7, v6, v8

    iget v12, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    cmpl-float v7, v7, v12

    .line 364
    iget v12, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    .line 353
    if-lez v7, :cond_1c

    .line 355
    sub-float/2addr v12, v8

    .line 356
    .local v12, "extraWidth":F
    cmpl-float v2, v1, v2

    if-lez v2, :cond_1b

    .line 357
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    iget v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v2, v7, :cond_1b

    .line 358
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v2

    iget-boolean v7, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v7, :cond_1a

    .line 359
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v2

    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v2

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v13, v12

    div-float/2addr v13, v1

    iput v13, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 357
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 363
    .end local v2    # "i":I
    .end local v12    # "extraWidth":F
    :cond_1b
    goto/16 :goto_17

    .line 364
    :cond_1c
    sub-float/2addr v12, v6

    sub-float/2addr v12, v8

    .line 365
    .restart local v12    # "extraWidth":F
    cmpl-float v7, v9, v2

    if-lez v7, :cond_20

    cmpg-float v7, v12, v9

    if-ltz v7, :cond_1d

    if-nez v11, :cond_20

    .line 366
    :cond_1d
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_f
    iget v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v2, v7, :cond_1f

    .line 368
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v2

    iget-boolean v7, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-eqz v7, :cond_1e

    .line 369
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v2

    iget v13, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v2

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v15, v15, v2

    iget v15, v15, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    sub-float/2addr v14, v15

    mul-float/2addr v14, v12

    div-float/2addr v14, v9

    add-float/2addr v13, v14

    iput v13, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 366
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .end local v2    # "i":I
    :cond_1f
    goto/16 :goto_17

    .line 373
    :cond_20
    sub-float/2addr v12, v9

    .line 374
    cmpg-float v7, v12, v10

    if-gez v7, :cond_24

    .line 375
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_10
    iget v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v2, v7, :cond_23

    .line 376
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v2

    iget-boolean v7, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    .line 378
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 376
    if-eqz v7, :cond_21

    .line 377
    aget-object v7, v13, v2

    iget-object v13, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v13, v13, v2

    iget v13, v13, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iput v13, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    goto :goto_11

    .line 378
    :cond_21
    aget-object v7, v13, v2

    iget-boolean v7, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v7, :cond_22

    .line 379
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v7, v7, v2

    iget v13, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v14, v14, v2

    iget v14, v14, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v15, v15, v2

    iget v15, v15, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    sub-float/2addr v14, v15

    mul-float/2addr v14, v12

    div-float/2addr v14, v10

    add-float/2addr v13, v14

    iput v13, v7, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 375
    :cond_22
    :goto_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .end local v2    # "i":I
    :cond_23
    goto/16 :goto_17

    .line 383
    :cond_24
    const/4 v7, 0x0

    .line 384
    .local v7, "totalFixed":F
    const/4 v13, 0x0

    .line 385
    .local v13, "totalFlexible":F
    const/4 v14, 0x0

    .line 386
    .local v14, "flexibleCount":F
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_12
    move/from16 v16, v2

    iget v2, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v15, v2, :cond_27

    .line 387
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v15

    iget-boolean v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    .line 390
    move/from16 v17, v1

    .end local v1    # "sumOfPercents":F
    .local v17, "sumOfPercents":F
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    .line 387
    if-eqz v2, :cond_25

    .line 388
    aget-object v1, v1, v15

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v2, v2, v15

    iget v2, v2, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    iput v2, v1, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 389
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v1, v1, v15

    iget v1, v1, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v7, v1

    goto :goto_13

    .line 390
    :cond_25
    aget-object v1, v1, v15

    iget-boolean v1, v1, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v1, :cond_26

    .line 391
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v1, v1, v15

    iget v1, v1, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v13, v1

    .line 392
    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v14, v1

    .line 386
    :cond_26
    :goto_13
    add-int/lit8 v15, v15, 0x1

    move/from16 v2, v16

    move/from16 v1, v17

    goto :goto_12

    .end local v17    # "sumOfPercents":F
    .restart local v1    # "sumOfPercents":F
    :cond_27
    move/from16 v17, v1

    .line 395
    .end local v1    # "sumOfPercents":F
    .end local v15    # "i":I
    .restart local v17    # "sumOfPercents":F
    cmpl-float v1, v13, v16

    if-gtz v1, :cond_29

    cmpl-float v1, v14, v16

    if-lez v1, :cond_28

    goto :goto_14

    :cond_28
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 396
    :cond_29
    :goto_14
    iget v1, v0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    sub-float/2addr v1, v6

    sub-float/2addr v1, v7

    .line 397
    .end local v12    # "extraWidth":F
    .local v1, "extraWidth":F
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_15
    iget v12, v0, Lcom/itextpdf/layout/renderer/TableWidths;->numberOfColumns:I

    if-ge v2, v12, :cond_2c

    .line 398
    iget-object v12, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v12, v12, v2

    iget-boolean v12, v12, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v12, :cond_2b

    iget-object v12, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v12, v12, v2

    iget-boolean v12, v12, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-nez v12, :cond_2b

    .line 399
    iget-object v12, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v12, v12, v2

    cmpl-float v15, v13, v16

    if-lez v15, :cond_2a

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/TableWidths;->widths:[Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;

    aget-object v15, v15, v2

    iget v15, v15, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    mul-float/2addr v15, v1

    div-float/2addr v15, v13

    goto :goto_16

    :cond_2a
    div-float v15, v1, v14

    :goto_16
    iput v15, v12, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 397
    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 409
    .end local v1    # "extraWidth":F
    .end local v2    # "i":I
    .end local v3    # "minTableWidth":F
    .end local v4    # "totalNonPercent":F
    .end local v5    # "toBalance":Z
    .end local v6    # "totalPercent":F
    .end local v7    # "totalFixed":F
    .end local v8    # "minTotalNonPercent":F
    .end local v9    # "fixedAddition":F
    .end local v10    # "flexibleAddition":F
    .end local v11    # "hasFlexibleCell":Z
    .end local v13    # "totalFlexible":F
    .end local v14    # "flexibleCount":F
    .end local v17    # "sumOfPercents":F
    :cond_2c
    :goto_17
    return-void

    .line 251
    .local v1, "sumOfPercents":F
    .restart local v3    # "minTableWidth":F
    .restart local v4    # "totalNonPercent":F
    :cond_2d
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 740
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->tableWidth:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths;->fixedTableWidth:Z

    if-eqz v1, :cond_0

    const-string v1, "!!"

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
