.class Lcom/itextpdf/layout/renderer/CollapsedTableBorders;
.super Lcom/itextpdf/layout/renderer/TableBorders;
.source "CollapsedTableBorders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/CollapsedTableBorders$BorderComparator;
    }
.end annotation


# static fields
.field private static borderComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bottomBorderCollapseWith:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation
.end field

.field private topBorderCollapseWith:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation
.end field

.field private verticalBottomBorderCollapseWith:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 58
    new-instance v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders$BorderComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders$BorderComparator;-><init>(Lcom/itextpdf/layout/renderer/CollapsedTableBorders$1;)V

    sput-object v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->borderComparator:Ljava/util/Comparator;

    return-void
.end method

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

    .line 62
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/TableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->topBorderCollapseWith:Ljava/util/List;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->bottomBorderCollapseWith:Ljava/util/List;

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;I)V
    .locals 1
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

    .line 66
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/renderer/TableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;I)V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->topBorderCollapseWith:Ljava/util/List;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->bottomBorderCollapseWith:Ljava/util/List;

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    .line 67
    return-void
.end method

.method public static getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;
    .locals 2
    .param p0, "cellBorder"    # Lcom/itextpdf/layout/borders/Border;
    .param p1, "tableBorder"    # Lcom/itextpdf/layout/borders/Border;

    .line 502
    if-eqz p1, :cond_1

    .line 503
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 504
    :cond_0
    return-object p1

    .line 507
    :cond_1
    if-eqz p0, :cond_2

    .line 508
    return-object p0

    .line 510
    :cond_2
    sget-object v0, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    return-object v0
.end method

.method public static getCollapsedList(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 515
    .local p0, "innerList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local p1, "outerList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    :goto_0
    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    :goto_1
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 516
    .local v0, "size":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 517
    .local v1, "collapsedList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v0, :cond_2

    .line 518
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    invoke-static {v3, v4}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedBorder(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/borders/Border;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 517
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 520
    .end local v2    # "i":I
    :cond_2
    return-object v1
.end method

.method private varargs getWidestBorderWidth([Lcom/itextpdf/layout/borders/Border;)F
    .locals 5
    .param p1, "borders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 719
    const/4 v0, 0x0

    .line 720
    .local v0, "maxWidth":F
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 721
    .local v3, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    cmpg-float v4, v0, v4

    if-gez v4, :cond_0

    .line 722
    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    .line 720
    .end local v3    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 725
    :cond_1
    return v0
.end method

.method private static isBorderWider(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Z
    .locals 1
    .param p0, "thisBorder"    # Lcom/itextpdf/layout/borders/Border;
    .param p1, "otherBorder"    # Lcom/itextpdf/layout/borders/Border;

    .line 740
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->isBorderWider(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;Z)Z

    move-result v0

    return v0
.end method

.method private static isBorderWider(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;Z)Z
    .locals 4
    .param p0, "thisBorder"    # Lcom/itextpdf/layout/borders/Border;
    .param p1, "otherBorder"    # Lcom/itextpdf/layout/borders/Border;
    .param p2, "strict"    # Z

    .line 754
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 755
    return v0

    .line 757
    :cond_0
    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 758
    return v1

    .line 760
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    .line 761
    .local v2, "comparisonResult":I
    if-eqz p2, :cond_2

    if-lez v2, :cond_3

    goto :goto_0

    :cond_2
    if-ltz v2, :cond_3

    :goto_0
    move v0, v1

    :cond_3
    return v0
.end method


# virtual methods
.method protected applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 3
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "reverse"    # Z

    .line 564
    if-eqz p3, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getMaxBottomWidth()F

    move-result v1

    mul-float/2addr v0, v1

    .line 565
    .local v0, "bottomTableBorderWidth":F
    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, v0, v1

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 566
    div-float v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    div-float v1, v0, v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 567
    return-object p0
.end method

.method protected applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 1
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "isEmpty"    # Z
    .param p4, "force"    # Z
    .param p5, "reverse"    # Z

    .line 546
    if-nez p3, :cond_0

    .line 547
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move-result-object v0

    return-object v0

    .line 548
    :cond_0
    if-eqz p4, :cond_1

    .line 550
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 551
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move-result-object v0

    return-object v0

    .line 553
    :cond_1
    return-object p0
.end method

.method protected applyCellIndents(Lcom/itextpdf/kernel/geom/Rectangle;FFFFZ)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 7
    .param p1, "box"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "topIndent"    # F
    .param p3, "rightIndent"    # F
    .param p4, "bottomIndent"    # F
    .param p5, "leftIndent"    # F
    .param p6, "reverse"    # Z

    .line 572
    const/high16 v0, 0x40000000    # 2.0f

    div-float v2, p2, v0

    div-float v3, p3, v0

    div-float v4, p4, v0

    div-float v5, p5, v0

    const/4 v6, 0x0

    move-object v1, p1

    .end local p1    # "box":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "box":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 573
    return-object p0
.end method

.method protected applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 8
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 527
    if-eqz p1, :cond_0

    .line 528
    iget v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rightBorderMaxWidth:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float v4, v0, v1

    iget v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->leftBorderMaxWidth:F

    div-float v6, v0, v1

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v2, p1

    move v7, p2

    .end local p1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p2    # "reverse":Z
    .local v2, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v7, "reverse":Z
    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 527
    .end local v2    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v7    # "reverse":Z
    .restart local p1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local p2    # "reverse":Z
    :cond_0
    move-object v2, p1

    move v7, p2

    .line 531
    .end local p1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p2    # "reverse":Z
    .restart local v2    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v7    # "reverse":Z
    :goto_0
    return-object p0
.end method

.method protected applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 3
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "reverse"    # Z

    .line 557
    if-eqz p3, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getMaxTopWidth()F

    move-result v1

    mul-float/2addr v0, v1

    .line 558
    .local v0, "topIndent":F
    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, v0, v1

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 559
    div-float v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    div-float v1, v0, v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 560
    return-object p0
.end method

.method protected applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 1
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "isEmpty"    # Z
    .param p4, "force"    # Z
    .param p5, "reverse"    # Z

    .line 535
    if-nez p3, :cond_0

    .line 536
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move-result-object v0

    return-object v0

    .line 537
    :cond_0
    if-eqz p4, :cond_1

    .line 539
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 540
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move-result-object v0

    return-object v0

    .line 542
    :cond_1
    return-object p0
.end method

.method protected buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;II[I)V
    .locals 8
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "row"    # I
    .param p3, "col"    # I
    .param p4, "rowspansToDeduct"    # [I

    .line 245
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le p2, v0, :cond_0

    .line 246
    add-int/lit8 p2, p2, -0x1

    .line 248
    :cond_0
    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 254
    .local v1, "currCellColspan":I
    const/16 v2, 0x3c

    const/4 v3, 0x1

    if-eqz p3, :cond_4

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    add-int/lit8 v5, p3, -0x1

    aget-object v4, v4, v5

    if-nez v4, :cond_4

    .line 255
    move v4, p3

    .line 257
    .local v4, "j":I
    :cond_1
    add-int/lit8 v4, v4, -0x1

    .line 258
    move v5, p2

    .line 259
    .local v5, "nextCellRow":I
    :goto_0
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-eq v6, v5, :cond_2

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v6, v6, v4

    if-nez v6, :cond_2

    .line 260
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 263
    :cond_2
    if-lez v4, :cond_3

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-eq v6, v5, :cond_3

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    .line 264
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v6, v6, v4

    invoke-virtual {v6, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v6, v4

    if-ne v6, p3, :cond_1

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    .line 265
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v6, v6, v4

    invoke-virtual {v6, v2}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sub-int v6, v5, v6

    add-int/2addr v6, v3

    if-ne v6, p2, :cond_1

    .line 267
    :cond_3
    if-ltz v4, :cond_4

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-eq v5, v6, :cond_4

    if-le v5, p2, :cond_4

    .line 268
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v6, v6, v4

    .line 269
    .local v6, "nextCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual {p0, v6, v5, v3}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;IZ)V

    .line 274
    .end local v4    # "j":I
    .end local v5    # "nextCellRow":I
    .end local v6    # "nextCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_4
    const/4 v4, 0x0

    .line 275
    .restart local v4    # "j":I
    :goto_1
    if-ge v4, v1, :cond_8

    .line 276
    add-int/lit8 v5, p2, 0x1

    .line 277
    .restart local v5    # "nextCellRow":I
    :goto_2
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_5

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    add-int v7, p3, v4

    aget-object v6, v6, v7

    if-nez v6, :cond_5

    .line 278
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 280
    :cond_5
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ne v5, v6, :cond_6

    .line 281
    goto :goto_3

    .line 283
    :cond_6
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lcom/itextpdf/layout/renderer/CellRenderer;

    add-int v7, p3, v4

    aget-object v6, v6, v7

    .line 285
    .restart local v6    # "nextCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual {v6, v2}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sub-int v7, v5, v7

    if-ne p2, v7, :cond_7

    .line 286
    invoke-virtual {p0, v6, v5, v3}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;IZ)V

    .line 288
    :cond_7
    invoke-virtual {v6, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v4, v7

    .line 289
    .end local v6    # "nextCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    goto :goto_1

    .line 292
    .end local v5    # "nextCellRow":I
    :cond_8
    :goto_3
    add-int v0, p3, v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    array-length v2, v2

    if-ge v0, v2, :cond_a

    .line 293
    move v0, p2

    .line 294
    .local v0, "nextCellRow":I
    :goto_4
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_9

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    add-int v5, p3, v1

    aget-object v2, v2, v5

    if-nez v2, :cond_9

    .line 295
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 297
    :cond_9
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_a

    .line 298
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/layout/renderer/CellRenderer;

    add-int v5, p3, v1

    aget-object v2, v2, v5

    .line 299
    .local v2, "nextCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual {p0, v2, v0, v3}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;IZ)V

    .line 303
    .end local v0    # "nextCellRow":I
    .end local v2    # "nextCell":Lcom/itextpdf/layout/renderer/CellRenderer;
    :cond_a
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;IZ)V

    .line 305
    return-void
.end method

.method protected buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;IZ)V
    .locals 11
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "row"    # I
    .param p3, "isNeighbourCell"    # Z

    .line 308
    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 309
    .local v6, "colspan":I
    const/16 v1, 0x3c

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 310
    .local v1, "rowspan":I
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Cell;->getCol()I

    move-result v7

    .line 311
    .local v7, "colN":I
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v8

    .line 314
    .local v8, "cellBorders":[Lcom/itextpdf/layout/borders/Border;
    add-int/lit8 v2, p2, 0x1

    sub-int/2addr v2, v1

    if-gez v2, :cond_0

    .line 315
    add-int/lit8 v1, p2, 0x1

    move v9, v1

    goto :goto_0

    .line 314
    :cond_0
    move v9, v1

    .line 319
    .end local v1    # "rowspan":I
    .local v9, "rowspan":I
    :goto_0
    const/4 v1, 0x0

    move v10, v1

    .local v10, "i":I
    :goto_1
    if-ge v10, v6, :cond_1

    .line 320
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    add-int/lit8 v2, p2, 0x1

    sub-int/2addr v2, v9

    add-int v3, v7, v10

    const/4 v4, 0x0

    aget-object v4, v8, v4

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 319
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 323
    .end local v10    # "i":I
    :cond_1
    const/4 v1, 0x0

    move v10, v1

    .restart local v10    # "i":I
    :goto_2
    if-ge v10, v6, :cond_2

    .line 324
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    add-int/lit8 v2, p2, 0x1

    add-int v3, v7, v10

    const/4 v4, 0x2

    aget-object v4, v8, v4

    const/4 v5, 0x1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 323
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 327
    .end local v10    # "i":I
    :cond_2
    sub-int v1, p2, v9

    const/4 v10, 0x1

    add-int/2addr v1, v10

    move v3, v1

    .local v3, "j":I
    :goto_3
    if-gt v3, p2, :cond_3

    .line 328
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    const/4 v2, 0x3

    aget-object v4, v8, v2

    const/4 v5, 0x0

    move-object v0, p0

    move v2, v7

    .end local v7    # "colN":I
    .local v2, "colN":I
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 327
    .end local v2    # "colN":I
    .restart local v7    # "colN":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 331
    .end local v3    # "j":I
    :cond_3
    sub-int v1, p2, v9

    add-int/2addr v1, v10

    move v3, v1

    .local v3, "i":I
    :goto_4
    if-gt v3, p2, :cond_4

    .line 332
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    add-int v2, v7, v6

    aget-object v4, v8, v10

    const/4 v5, 0x1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 331
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 334
    .end local v3    # "i":I
    :cond_4
    return-void
.end method

.method protected checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z
    .locals 6
    .param p2, "i"    # I
    .param p3, "j"    # I
    .param p4, "borderToAdd"    # Lcom/itextpdf/layout/borders/Border;
    .param p5, "hasPriority"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;>;II",
            "Lcom/itextpdf/layout/borders/Border;",
            "Z)Z"
        }
    .end annotation

    .line 339
    .local p1, "borderArray":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;>;"
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 340
    .local v0, "borders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/borders/Border;

    .line 341
    .local v1, "neighbour":Lcom/itextpdf/layout/borders/Border;
    const/4 v2, 0x1

    if-nez v1, :cond_0

    .line 342
    invoke-interface {v0, p3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 343
    return v2

    .line 345
    :cond_0
    const/4 v3, 0x0

    if-eq v1, p4, :cond_2

    .line 346
    if-eqz p4, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    invoke-virtual {p4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_2

    .line 347
    if-nez p5, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    invoke-virtual {p4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    cmpl-float v4, v4, v5

    if-nez v4, :cond_1

    .line 348
    return v3

    .line 350
    :cond_1
    invoke-interface {v0, p3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 351
    return v2

    .line 356
    :cond_2
    return v3
.end method

.method protected collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 2
    .param p1, "footerBordersHandler"    # Lcom/itextpdf/layout/renderer/TableBorders;
    .param p2, "hasContent"    # Z

    .line 630
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    if-eqz p2, :cond_0

    .line 631
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getLastHorizontalBorder()Ljava/util/List;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getTopBorderCollapseWith()Ljava/util/List;

    move-result-object v1

    .line 630
    :goto_0
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTopBorderCollapseWith(Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 632
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 633
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBordersCrossingTopHorizontalBorder()Ljava/util/List;

    move-result-object v1

    .line 632
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 634
    return-object p0
.end method

.method protected collapseTableWithHeader(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 3
    .param p1, "headerBordersHandler"    # Lcom/itextpdf/layout/renderer/TableBorders;
    .param p2, "updateBordersHandler"    # Z

    .line 638
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    iget v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 639
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBordersCrossingTopHorizontalBorder()Ljava/util/List;

    move-result-object v2

    .line 638
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 640
    if-eqz p2, :cond_0

    .line 641
    nop

    .line 642
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/TableBorders;->getLastHorizontalBorder()Ljava/util/List;

    move-result-object v0

    .line 641
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTopBorderCollapseWith(Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 644
    :cond_0
    return-object p0
.end method

.method protected drawHorizontalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 22
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "borderDescriptor"    # Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    .line 362
    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getBorderIndex()I

    move-result v1

    .line 363
    .local v1, "i":I
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getMainCoordinateStart()F

    move-result v2

    .line 364
    .local v2, "startX":F
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getCrossCoordinate()F

    move-result v6

    .line 365
    .local v6, "y1":F
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getMainCoordinateWidths()[F

    move-result-object v10

    .line 367
    .local v10, "countedColumnWidth":[F
    iget v3, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    add-int/2addr v3, v1

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v11

    .line 368
    .local v11, "horizontalBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    move v3, v2

    .line 369
    .local v3, "x1":F
    const/4 v12, 0x0

    aget v4, v10, v12

    add-float/2addr v4, v3

    .line 371
    .local v4, "x2":F
    const/4 v5, 0x1

    move v13, v3

    move v14, v4

    move v15, v5

    .end local v3    # "x1":F
    .end local v4    # "x2":F
    .local v13, "x1":F
    .local v14, "x2":F
    .local v15, "j":I
    :goto_0
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v3

    if-gt v15, v3, :cond_8

    .line 372
    add-int/lit8 v3, v15, -0x1

    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    .line 373
    .local v3, "currentBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v4

    if-ge v15, v4, :cond_0

    invoke-interface {v11, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    move-object/from16 v16, v4

    .line 374
    .local v16, "nextBorder":Lcom/itextpdf/layout/borders/Border;
    if-eqz v3, :cond_6

    .line 375
    add-int/lit8 v4, v15, -0x1

    invoke-virtual {v0, v1, v4}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCrossingBorders(II)Ljava/util/List;

    move-result-object v4

    .line 376
    .local v4, "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v5, 0x2

    new-array v7, v5, [Lcom/itextpdf/layout/borders/Border;

    const/4 v8, 0x1

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/borders/Border;

    aput-object v9, v7, v12

    .line 377
    const/4 v9, 0x3

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/itextpdf/layout/borders/Border;

    aput-object v17, v7, v8

    .line 376
    invoke-direct {v0, v7}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getWidestBorderWidth([Lcom/itextpdf/layout/borders/Border;)F

    move-result v7

    .line 378
    .local v7, "startCornerWidth":F
    move/from16 v17, v12

    invoke-virtual {v0, v1, v15}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCrossingBorders(II)Ljava/util/List;

    move-result-object v12

    .line 379
    .local v12, "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    new-array v5, v5, [Lcom/itextpdf/layout/borders/Border;

    invoke-interface {v12, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/itextpdf/layout/borders/Border;

    aput-object v18, v5, v17

    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/itextpdf/layout/borders/Border;

    aput-object v18, v5, v8

    invoke-direct {v0, v5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getWidestBorderWidth([Lcom/itextpdf/layout/borders/Border;)F

    move-result v5

    .line 385
    .local v5, "endCornerWidth":F
    if-ne v8, v15, :cond_1

    .line 386
    move/from16 v9, v17

    invoke-interface {v4, v9, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 385
    :cond_1
    move/from16 v9, v17

    .line 388
    :goto_2
    if-nez v1, :cond_3

    .line 389
    if-eq v8, v15, :cond_2

    .line 390
    const/4 v8, 0x3

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v4, v9, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_3

    .line 389
    :cond_2
    const/4 v8, 0x3

    .line 392
    :goto_3
    invoke-interface {v12, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v12, v9, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 395
    :cond_3
    sget-object v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->borderComparator:Ljava/util/Comparator;

    invoke-static {v4, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 396
    sget-object v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->borderComparator:Ljava/util/Comparator;

    invoke-static {v12, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 398
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/itextpdf/layout/borders/Border;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/high16 v8, 0x40000000    # 2.0f

    if-eqz v0, :cond_4

    neg-float v0, v7

    div-float/2addr v0, v8

    goto :goto_4

    :cond_4
    div-float v0, v7, v8

    .line 401
    .local v0, "x1Offset":F
    :goto_4
    move/from16 v17, v8

    const/4 v9, 0x0

    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v3, v8}, Lcom/itextpdf/layout/borders/Border;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    div-float v8, v5, v17

    goto :goto_5

    :cond_5
    neg-float v8, v5

    div-float v8, v8, v17

    :goto_5
    move/from16 v17, v8

    .line 404
    .local v17, "x2Offset":F
    move v8, v5

    .end local v5    # "endCornerWidth":F
    .local v8, "endCornerWidth":F
    add-float v5, v13, v0

    move/from16 v18, v7

    .end local v7    # "startCornerWidth":F
    .local v18, "startCornerWidth":F
    add-float v7, v14, v17

    move/from16 v19, v9

    sget-object v9, Lcom/itextpdf/layout/borders/Border$Side;->NONE:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v20, v8

    .end local v8    # "endCornerWidth":F
    .local v20, "endCornerWidth":F
    move v8, v6

    move/from16 v21, v19

    move/from16 v19, v18

    move-object/from16 v18, v4

    move-object/from16 v4, p1

    .end local v4    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v18, "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v19, "startCornerWidth":F
    invoke-virtual/range {v3 .. v9}, Lcom/itextpdf/layout/borders/Border;->drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V

    .line 405
    move v0, v14

    .line 406
    .end local v12    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v13    # "x1":F
    .end local v17    # "x2Offset":F
    .end local v18    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v19    # "startCornerWidth":F
    .end local v20    # "endCornerWidth":F
    .local v0, "x1":F
    move v13, v0

    goto :goto_6

    .line 409
    .end local v0    # "x1":F
    .restart local v13    # "x1":F
    :cond_6
    move/from16 v21, v12

    add-int/lit8 v0, v15, -0x1

    aget v0, v10, v0

    add-float/2addr v13, v0

    .line 410
    move v14, v13

    .line 412
    :goto_6
    if-eqz v16, :cond_7

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v0

    if-eq v15, v0, :cond_7

    .line 413
    aget v0, v10, v15

    add-float/2addr v14, v0

    .line 371
    .end local v3    # "currentBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v16    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_7
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    move/from16 v12, v21

    goto/16 :goto_0

    .line 416
    .end local v15    # "j":I
    :cond_8
    return-object p0
.end method

.method protected drawVerticalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 23
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "borderDescriptor"    # Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    .line 420
    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getBorderIndex()I

    move-result v1

    .line 421
    .local v1, "i":I
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getMainCoordinateStart()F

    move-result v2

    .line 422
    .local v2, "startY":F
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getCrossCoordinate()F

    move-result v5

    .line 423
    .local v5, "x1":F
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->getMainCoordinateWidths()[F

    move-result-object v10

    .line 425
    .local v10, "heights":[F
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v11

    .line 426
    .local v11, "borders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    move v3, v2

    .line 427
    .local v3, "y1":F
    move v4, v3

    .line 428
    .local v4, "y2":F
    array-length v6, v10

    const/4 v12, 0x0

    if-eqz v6, :cond_0

    .line 429
    aget v6, v10, v12

    sub-float v4, v3, v6

    .line 431
    :cond_0
    const/4 v6, 0x0

    .line 432
    .local v6, "y1Offset":Ljava/lang/Float;
    const/4 v7, 0x1

    move v13, v3

    move v14, v4

    move v15, v7

    .end local v3    # "y1":F
    .end local v4    # "y2":F
    .local v13, "y1":F
    .local v14, "y2":F
    .local v15, "j":I
    :goto_0
    array-length v3, v10

    if-gt v15, v3, :cond_b

    .line 433
    iget v3, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v4, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v3, v4

    add-int/2addr v3, v15

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    .line 434
    .local v3, "currentBorder":Lcom/itextpdf/layout/borders/Border;
    array-length v7, v10

    if-ge v15, v7, :cond_1

    iget v7, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v8, v0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v7, v8

    add-int/2addr v7, v15

    invoke-interface {v11, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/borders/Border;

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    .line 435
    .local v7, "nextBorder":Lcom/itextpdf/layout/borders/Border;
    :goto_1
    if-eqz v3, :cond_9

    .line 436
    add-int/lit8 v8, v15, -0x1

    invoke-virtual {v0, v8, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCrossingBorders(II)Ljava/util/List;

    move-result-object v8

    .line 437
    .local v8, "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v9, 0x2

    move/from16 v16, v4

    new-array v4, v9, [Lcom/itextpdf/layout/borders/Border;

    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/itextpdf/layout/borders/Border;

    aput-object v17, v4, v12

    .line 438
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/itextpdf/layout/borders/Border;

    aput-object v17, v4, v16

    .line 437
    invoke-direct {v0, v4}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getWidestBorderWidth([Lcom/itextpdf/layout/borders/Border;)F

    move-result v4

    .line 443
    .local v4, "startCornerWidth":F
    move/from16 v9, v16

    if-ne v9, v15, :cond_2

    .line 444
    invoke-interface {v8, v12, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 446
    :cond_2
    sget-object v9, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->borderComparator:Ljava/util/Comparator;

    invoke-static {v8, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 448
    invoke-virtual {v0, v15, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCrossingBorders(II)Ljava/util/List;

    move-result-object v9

    .line 449
    .local v9, "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    move/from16 v18, v1

    move/from16 v17, v2

    const/4 v1, 0x2

    .end local v1    # "i":I
    .end local v2    # "startY":F
    .local v17, "startY":F
    .local v18, "i":I
    new-array v2, v1, [Lcom/itextpdf/layout/borders/Border;

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/itextpdf/layout/borders/Border;

    aput-object v19, v2, v12

    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/borders/Border;

    const/16 v16, 0x1

    aput-object v1, v2, v16

    invoke-direct {v0, v2}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getWidestBorderWidth([Lcom/itextpdf/layout/borders/Border;)F

    move-result v1

    .line 450
    .local v1, "endCornerWidth":F
    sget-object v2, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->borderComparator:Ljava/util/Comparator;

    invoke-static {v9, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 453
    invoke-virtual {v3, v7}, Lcom/itextpdf/layout/borders/Border;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/high16 v16, 0x40000000    # 2.0f

    if-nez v2, :cond_6

    .line 454
    if-nez v6, :cond_4

    .line 455
    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/borders/Border;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    div-float v2, v4, v16

    goto :goto_2

    :cond_3
    neg-float v2, v4

    div-float v2, v2, v16

    :goto_2
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    move-object v2, v6

    goto :goto_3

    .line 454
    :cond_4
    move-object v2, v6

    .line 459
    .end local v6    # "y1Offset":Ljava/lang/Float;
    .local v2, "y1Offset":Ljava/lang/Float;
    :goto_3
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/itextpdf/layout/borders/Border;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    neg-float v6, v1

    div-float v6, v6, v16

    goto :goto_4

    :cond_5
    div-float v6, v1, v16

    :goto_4
    move/from16 v16, v6

    .line 463
    .local v16, "y2Offset":F
    nop

    .line 464
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v6, v13

    move-object/from16 v19, v8

    .end local v8    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v19, "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    add-float v8, v14, v16

    move-object/from16 v20, v9

    .end local v9    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v20, "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    sget-object v9, Lcom/itextpdf/layout/borders/Border$Side;->NONE:Lcom/itextpdf/layout/borders/Border$Side;

    move-object/from16 v21, v7

    .end local v7    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .local v21, "nextBorder":Lcom/itextpdf/layout/borders/Border;
    move v7, v5

    move/from16 v22, v4

    move-object/from16 v0, v19

    move-object/from16 v4, p1

    .end local v4    # "startCornerWidth":F
    .end local v19    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v0, "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local v22, "startCornerWidth":F
    invoke-virtual/range {v3 .. v9}, Lcom/itextpdf/layout/borders/Border;->drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V

    .line 465
    move v13, v14

    .line 466
    const/4 v6, 0x0

    .line 467
    .end local v2    # "y1Offset":Ljava/lang/Float;
    .end local v16    # "y2Offset":F
    .restart local v6    # "y1Offset":Ljava/lang/Float;
    goto :goto_6

    .line 471
    .end local v0    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v20    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v21    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v22    # "startCornerWidth":F
    .restart local v4    # "startCornerWidth":F
    .restart local v7    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .restart local v8    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .restart local v9    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_6
    move/from16 v22, v4

    move-object/from16 v21, v7

    move-object v0, v8

    move-object/from16 v20, v9

    .end local v4    # "startCornerWidth":F
    .end local v7    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v8    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v9    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .restart local v0    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .restart local v20    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .restart local v21    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .restart local v22    # "startCornerWidth":F
    if-nez v6, :cond_8

    .line 472
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/borders/Border;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    move/from16 v2, v22

    .end local v22    # "startCornerWidth":F
    .local v2, "startCornerWidth":F
    div-float v4, v2, v16

    goto :goto_5

    .end local v2    # "startCornerWidth":F
    .restart local v22    # "startCornerWidth":F
    :cond_7
    move/from16 v2, v22

    .end local v22    # "startCornerWidth":F
    .restart local v2    # "startCornerWidth":F
    neg-float v4, v2

    div-float v4, v4, v16

    :goto_5
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    goto :goto_6

    .line 471
    .end local v2    # "startCornerWidth":F
    .restart local v22    # "startCornerWidth":F
    :cond_8
    move/from16 v2, v22

    .line 477
    .end local v0    # "crossingBordersAtStart":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v1    # "endCornerWidth":F
    .end local v20    # "crossingBordersAtEnd":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v22    # "startCornerWidth":F
    :goto_6
    goto :goto_7

    .line 480
    .end local v17    # "startY":F
    .end local v18    # "i":I
    .end local v21    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .local v1, "i":I
    .local v2, "startY":F
    .restart local v7    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_9
    move/from16 v18, v1

    move/from16 v17, v2

    move-object/from16 v21, v7

    .end local v1    # "i":I
    .end local v2    # "startY":F
    .end local v7    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    .restart local v17    # "startY":F
    .restart local v18    # "i":I
    .restart local v21    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    add-int/lit8 v0, v15, -0x1

    aget v0, v10, v0

    sub-float/2addr v13, v0

    .line 481
    move v14, v13

    .line 483
    :goto_7
    if-eqz v21, :cond_a

    .line 484
    aget v0, v10, v15

    sub-float/2addr v14, v0

    .line 432
    .end local v3    # "currentBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v21    # "nextBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_a
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    move/from16 v2, v17

    move/from16 v1, v18

    goto/16 :goto_0

    .line 487
    .end local v15    # "j":I
    .end local v17    # "startY":F
    .end local v18    # "i":I
    .restart local v1    # "i":I
    .restart local v2    # "startY":F
    :cond_b
    return-object p0
.end method

.method protected fixHeaderOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 2
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 648
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getMaxTopWidth()F

    move-result v0

    .line 649
    .local v0, "topBorderMaxWidth":F
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 650
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 651
    return-object p0
.end method

.method public getBottomBorderCollapseWith()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->bottomBorderCollapseWith:Ljava/util/List;

    return-object v0
.end method

.method public getCellBorderIndents(IIII)[F
    .locals 8
    .param p1, "row"    # I
    .param p2, "col"    # I
    .param p3, "rowspan"    # I
    .param p4, "colspan"    # I

    .line 81
    const/4 v0, 0x4

    new-array v0, v0, [F

    .line 85
    .local v0, "indents":[F
    iget v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    add-int/2addr v1, p1

    sub-int/2addr v1, p3

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 86
    .local v1, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    move v3, p2

    .local v3, "i":I
    :goto_0
    add-int v4, p2, p4

    if-ge v3, v4, :cond_1

    .line 87
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 88
    .local v4, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    const/4 v6, 0x0

    aget v7, v0, v6

    cmpl-float v5, v5, v7

    if-lez v5, :cond_0

    .line 89
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v6

    .line 86
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 93
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_1
    add-int v3, p2, p4

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 94
    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v3, v4

    add-int/2addr v3, p1

    sub-int/2addr v3, p3

    add-int/2addr v3, v2

    .restart local v3    # "i":I
    :goto_1
    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v4, v5

    add-int/2addr v4, p1

    add-int/2addr v4, v2

    if-ge v3, v4, :cond_3

    .line 95
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 96
    .restart local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aget v6, v0, v2

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    .line 97
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v2

    .line 94
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 101
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_3
    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    add-int/2addr v3, p1

    add-int/2addr v3, v2

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 102
    move v3, p2

    .restart local v3    # "i":I
    :goto_2
    add-int v4, p2, p4

    if-ge v3, v4, :cond_5

    .line 103
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 104
    .restart local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    const/4 v6, 0x2

    aget v7, v0, v6

    cmpl-float v5, v5, v7

    if-lez v5, :cond_4

    .line 105
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v6

    .line 102
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 109
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_5
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 110
    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v3, v4

    add-int/2addr v3, p1

    sub-int/2addr v3, p3

    add-int/2addr v3, v2

    .restart local v3    # "i":I
    :goto_3
    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v4, v5

    add-int/2addr v4, p1

    add-int/2addr v4, v2

    if-ge v3, v4, :cond_7

    .line 111
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 112
    .restart local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v4, :cond_6

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    const/4 v6, 0x3

    aget v7, v0, v6

    cmpl-float v5, v5, v7

    if-lez v5, :cond_6

    .line 113
    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    aput v5, v0, v6

    .line 110
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 116
    .end local v3    # "i":I
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_7
    return-object v0
.end method

.method protected getCellVerticalAddition([F)F
    .locals 3
    .param p1, "indents"    # [F

    .line 577
    const/4 v0, 0x0

    aget v0, p1, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const/4 v2, 0x2

    aget v2, p1, v2

    div-float/2addr v2, v1

    add-float/2addr v0, v2

    return v0
.end method

.method getCrossingBorders(II)Ljava/util/List;
    .locals 6
    .param p1, "horizontalIndex"    # I
    .param p2, "verticalIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 666
    iget v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    .line 667
    .local v0, "horizontalBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v1

    .line 669
    .local v1, "verticalBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 670
    .local v2, "crossingBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v3, 0x0

    if-lez p2, :cond_0

    add-int/lit8 v4, p2, -0x1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    goto :goto_0

    :cond_0
    move-object v4, v3

    :goto_0
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 671
    if-lez p1, :cond_1

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v4, v5

    add-int/2addr v4, p1

    add-int/lit8 v4, v4, -0x1

    .line 672
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    goto :goto_1

    :cond_1
    move-object v4, v3

    .line 671
    :goto_1
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 673
    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    if-ge p2, v4, :cond_2

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    goto :goto_2

    :cond_2
    move-object v4, v3

    :goto_2
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 674
    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->finishRow:I

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    sub-int/2addr v4, v5

    if-gt p1, v4, :cond_3

    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v3, v4

    add-int/2addr v3, p1

    .line 675
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    goto :goto_3

    :cond_3
    nop

    .line 674
    :goto_3
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 680
    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->finishRow:I

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    if-ne p1, v3, :cond_4

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    if-eqz v3, :cond_4

    .line 681
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    const/4 v4, 0x3

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/borders/Border;

    invoke-static {v3, v5}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->isBorderWider(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 682
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 685
    :cond_4
    return-object v2
.end method

.method public getHorizontalBorder(I)Ljava/util/List;
    .locals 9
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 153
    iget v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    const/16 v1, 0x10

    if-ne p1, v0, :cond_6

    .line 154
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->topBorderCollapseWith:Ljava/util/List;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    invoke-static {v0, v2, v3}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->createAndFillBorderList(Ljava/util/List;Lcom/itextpdf/layout/borders/Border;I)Ljava/util/List;

    move-result-object v0

    .line 155
    .local v0, "firstBorderOnCurrentPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    if-ne p1, v2, :cond_0

    .line 156
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedList(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 158
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_5

    .line 159
    const/4 v2, 0x0

    .line 160
    .local v2, "col":I
    move v3, p1

    .line 161
    .local v3, "row":I
    :cond_1
    :goto_0
    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    if-ge v2, v4, :cond_5

    .line 162
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v5, v3, v5

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v4, v4, v2

    if-eqz v4, :cond_4

    sub-int v4, v3, p1

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    iget v6, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v6, v3, v6

    .line 163
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v5, v5, v2

    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v5}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v5

    if-gt v4, v5, :cond_4

    .line 164
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v5, v3, v5

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v4, v4, v2

    .line 165
    .local v4, "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Cell;

    const/16 v6, 0xd

    invoke-static {v5, v6}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getCellSideBorder(Lcom/itextpdf/layout/element/Cell;I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v5

    .line 166
    .local v5, "cellModelTopBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 167
    .local v6, "colspan":I
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_2

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v8}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_3

    .line 168
    :cond_2
    move v7, v2

    .local v7, "i":I
    :goto_1
    add-int v8, v2, v6

    if-ge v7, v8, :cond_3

    .line 169
    invoke-interface {v0, v7, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 168
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 172
    .end local v7    # "i":I
    :cond_3
    add-int/2addr v2, v6

    .line 173
    move v3, p1

    .line 174
    .end local v4    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v5    # "cellModelTopBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v6    # "colspan":I
    goto :goto_0

    .line 175
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 176
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 177
    nop

    .line 182
    .end local v2    # "col":I
    .end local v3    # "row":I
    :cond_5
    return-object v0

    .line 184
    .end local v0    # "firstBorderOnCurrentPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_6
    iget v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->finishRow:I

    add-int/lit8 v0, v0, 0x1

    if-ne p1, v0, :cond_d

    .line 185
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->bottomBorderCollapseWith:Ljava/util/List;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    invoke-static {v0, v2, v3}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->createAndFillBorderList(Ljava/util/List;Lcom/itextpdf/layout/borders/Border;I)Ljava/util/List;

    move-result-object v0

    .line 186
    .local v0, "lastBorderOnCurrentPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v2, p1, v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_7

    .line 187
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedList(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 189
    :cond_7
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_c

    .line 190
    const/4 v2, 0x0

    .line 191
    .restart local v2    # "col":I
    add-int/lit8 v3, p1, -0x1

    .line 192
    .restart local v3    # "row":I
    :cond_8
    :goto_2
    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    if-ge v2, v4, :cond_c

    .line 193
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v5, v3, v5

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v4, v4, v2

    if-eqz v4, :cond_b

    .line 194
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    iget v5, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v5, v3, v5

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/layout/renderer/CellRenderer;

    aget-object v4, v4, v2

    .line 195
    .restart local v4    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Cell;

    const/16 v6, 0xa

    invoke-static {v5, v6}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->getCellSideBorder(Lcom/itextpdf/layout/element/Cell;I)Lcom/itextpdf/layout/borders/Border;

    move-result-object v5

    .line 196
    .local v5, "cellModelBottomBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 197
    .restart local v6    # "colspan":I
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_9

    if-eqz v5, :cond_a

    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v8}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_a

    .line 198
    :cond_9
    move v7, v2

    .restart local v7    # "i":I
    :goto_3
    add-int v8, v2, v6

    if-ge v7, v8, :cond_a

    .line 199
    invoke-interface {v0, v7, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 198
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 202
    .end local v7    # "i":I
    :cond_a
    add-int/2addr v2, v6

    .line 203
    add-int/lit8 v3, p1, -0x1

    .line 204
    .end local v4    # "cell":Lcom/itextpdf/layout/renderer/CellRenderer;
    .end local v5    # "cellModelBottomBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v6    # "colspan":I
    goto :goto_2

    .line 205
    :cond_b
    add-int/lit8 v3, v3, 0x1

    .line 206
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ne v3, v4, :cond_8

    .line 207
    nop

    .line 212
    .end local v2    # "col":I
    .end local v3    # "row":I
    :cond_c
    return-object v0

    .line 214
    .end local v0    # "lastBorderOnCurrentPage":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_d
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->horizontalBorders:Ljava/util/List;

    iget v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getTopBorderCollapseWith()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->topBorderCollapseWith:Ljava/util/List;

    return-object v0
.end method

.method public getVerticalBorder(I)Ljava/util/List;
    .locals 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 138
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 139
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v2, 0x3

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    .line 140
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->createAndFillBorderList(Ljava/util/List;Lcom/itextpdf/layout/borders/Border;I)Ljava/util/List;

    move-result-object v0

    .line 141
    .local v0, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedList(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 142
    .end local v0    # "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_0
    iget v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    if-ne p1, v1, :cond_1

    .line 143
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    .line 144
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    .line 143
    invoke-static {v0, v1, v3}, Lcom/itextpdf/layout/renderer/TableBorderUtil;->createAndFillBorderList(Ljava/util/List;Lcom/itextpdf/layout/borders/Border;I)Ljava/util/List;

    move-result-object v0

    .line 145
    .restart local v0    # "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v1, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getCollapsedList(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 147
    .end local v0    # "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getVerticalBordersCrossingTopHorizontalBorder()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    iget v1, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 126
    .local v0, "borders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->numberOfColumns:I

    if-gt v1, v2, :cond_1

    .line 127
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getVerticalBorder(I)Ljava/util/List;

    move-result-object v2

    .line 129
    .local v2, "verticalBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v3, v4

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    iget v3, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->startRow:I

    iget v4, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->largeTableIndexOffset:I

    sub-int/2addr v3, v4

    .line 130
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    .line 131
    .local v3, "borderToAdd":Lcom/itextpdf/layout/borders/Border;
    :goto_1
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .end local v2    # "verticalBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .end local v3    # "borderToAdd":Lcom/itextpdf/layout/borders/Border;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 133
    .end local v1    # "i":I
    :cond_1
    return-object v0
.end method

.method public setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;)",
            "Lcom/itextpdf/layout/renderer/CollapsedTableBorders;"
        }
    .end annotation

    .line 230
    .local p1, "bottomBorderCollapseWith":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    .local p2, "verticalBordersCrossingBottomBorder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->bottomBorderCollapseWith:Ljava/util/List;

    .line 231
    if-eqz p1, :cond_0

    .line 232
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->bottomBorderCollapseWith:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 234
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    .line 235
    if-eqz p2, :cond_1

    .line 236
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->verticalBottomBorderCollapseWith:Ljava/util/List;

    .line 238
    :cond_1
    return-object p0
.end method

.method public setTopBorderCollapseWith(Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;)",
            "Lcom/itextpdf/layout/renderer/CollapsedTableBorders;"
        }
    .end annotation

    .line 221
    .local p1, "topBorderCollapseWith":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->topBorderCollapseWith:Ljava/util/List;

    .line 222
    if-eqz p1, :cond_0

    .line 223
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->topBorderCollapseWith:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 225
    :cond_0
    return-object p0
.end method

.method protected skipFooter([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 1
    .param p1, "borders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 618
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTableBoundingBorders([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 619
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 620
    return-object p0
.end method

.method protected skipHeader([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 1
    .param p1, "borders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 624
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTableBoundingBorders([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 625
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTopBorderCollapseWith(Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 626
    return-object p0
.end method

.method protected updateBordersOnNewPage(ZZLcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 3
    .param p1, "isOriginalNonSplitRenderer"    # Z
    .param p2, "isFooterOrHeader"    # Z
    .param p3, "currentRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p4, "headerRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p5, "footerRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 583
    if-nez p2, :cond_2

    .line 585
    if-eqz p1, :cond_1

    .line 586
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rows:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 587
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->processAllBordersAndEmptyRows()Lcom/itextpdf/layout/renderer/TableBorders;

    .line 588
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getMaxRightWidth()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rightBorderMaxWidth:F

    .line 589
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->getMaxLeftWidth()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->leftBorderMaxWidth:F

    .line 592
    :cond_0
    invoke-virtual {p3}, Lcom/itextpdf/layout/renderer/TableRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getLastRowBottomBorder()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTopBorderCollapseWith(Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    goto :goto_0

    .line 594
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setTopBorderCollapseWith(Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 595
    invoke-virtual {p0, v0, v0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->setBottomBorderCollapseWith(Ljava/util/List;Ljava/util/List;)Lcom/itextpdf/layout/renderer/CollapsedTableBorders;

    .line 598
    :cond_2
    :goto_0
    if-eqz p5, :cond_3

    .line 599
    iget-object v0, p5, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxRightWidth()F

    move-result v0

    .line 600
    .local v0, "rightFooterBorderWidth":F
    iget-object v1, p5, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxLeftWidth()F

    move-result v1

    .line 602
    .local v1, "leftFooterBorderWidth":F
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->leftBorderMaxWidth:F

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->leftBorderMaxWidth:F

    .line 603
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rightBorderMaxWidth:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rightBorderMaxWidth:F

    .line 606
    .end local v0    # "rightFooterBorderWidth":F
    .end local v1    # "leftFooterBorderWidth":F
    :cond_3
    if-eqz p4, :cond_4

    .line 607
    iget-object v0, p4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxRightWidth()F

    move-result v0

    .line 608
    .local v0, "rightHeaderBorderWidth":F
    iget-object v1, p4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxLeftWidth()F

    move-result v1

    .line 610
    .local v1, "leftHeaderBorderWidth":F
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->leftBorderMaxWidth:F

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->leftBorderMaxWidth:F

    .line 611
    iget v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rightBorderMaxWidth:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/CollapsedTableBorders;->rightBorderMaxWidth:F

    .line 614
    .end local v0    # "rightHeaderBorderWidth":F
    .end local v1    # "leftHeaderBorderWidth":F
    :cond_4
    return-object p0
.end method
