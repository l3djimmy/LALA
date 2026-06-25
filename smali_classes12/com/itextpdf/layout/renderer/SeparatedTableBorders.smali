.class Lcom/itextpdf/layout/renderer/SeparatedTableBorders;
.super Lcom/itextpdf/layout/renderer/TableBorders;
.source "SeparatedTableBorders.java"


# direct methods
.method public constructor <init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V
    .locals 0
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

    .line 39
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/TableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;)V

    .line 40
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

    .line 43
    .local p1, "rows":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/layout/renderer/CellRenderer;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/renderer/TableBorders;-><init>(Ljava/util/List;I[Lcom/itextpdf/layout/borders/Border;I)V

    .line 44
    return-void
.end method


# virtual methods
.method protected applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 2
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "reverse"    # Z

    .line 76
    if-eqz p3, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->getMaxBottomWidth()F

    move-result v1

    mul-float/2addr v0, v1

    .line 77
    .local v0, "bottomTableBorderWidth":F
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 78
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 79
    return-object p0
.end method

.method protected applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 1
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "isEmpty"    # Z
    .param p4, "force"    # Z
    .param p5, "reverse"    # Z

    .line 71
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->applyBottomTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move-result-object v0

    return-object v0
.end method

.method protected applyCellIndents(Lcom/itextpdf/kernel/geom/Rectangle;FFFFZ)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 6
    .param p1, "box"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "topIndent"    # F
    .param p3, "rightIndent"    # F
    .param p4, "bottomIndent"    # F
    .param p5, "leftIndent"    # F
    .param p6, "reverse"    # Z

    .line 119
    const/4 v5, 0x0

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    .end local p1    # "box":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p2    # "topIndent":F
    .end local p3    # "rightIndent":F
    .end local p4    # "bottomIndent":F
    .end local p5    # "leftIndent":F
    .local v0, "box":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "topIndent":F
    .local v2, "rightIndent":F
    .local v3, "bottomIndent":F
    .local v4, "leftIndent":F
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 120
    return-object p0
.end method

.method protected applyLeftAndRightTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 6
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 84
    if-eqz p1, :cond_0

    .line 85
    iget v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rightBorderMaxWidth:F

    const/4 v3, 0x0

    iget v4, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->leftBorderMaxWidth:F

    const/4 v1, 0x0

    move-object v0, p1

    move v5, p2

    .end local p1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p2    # "reverse":Z
    .local v0, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "reverse":Z
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 84
    .end local v0    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "reverse":Z
    .restart local p1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local p2    # "reverse":Z
    :cond_0
    move-object v0, p1

    move v5, p2

    .line 88
    .end local p1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p2    # "reverse":Z
    .restart local v0    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v5    # "reverse":Z
    :goto_0
    return-object p0
.end method

.method protected applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 2
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "reverse"    # Z

    .line 63
    if-eqz p3, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->getMaxTopWidth()F

    move-result v1

    mul-float/2addr v0, v1

    .line 64
    .local v0, "topIndent":F
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 65
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 66
    return-object p0
.end method

.method protected applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;ZZZ)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 1
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "isEmpty"    # Z
    .param p4, "force"    # Z
    .param p5, "reverse"    # Z

    .line 58
    invoke-virtual {p0, p1, p2, p5}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->applyTopTableBorder(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/layout/renderer/TableBorders;

    move-result-object v0

    return-object v0
.end method

.method protected buildBordersArrays(Lcom/itextpdf/layout/renderer/CellRenderer;II[I)V
    .locals 15
    .param p1, "cell"    # Lcom/itextpdf/layout/renderer/CellRenderer;
    .param p2, "row"    # I
    .param p3, "col"    # I
    .param p4, "rowspansToDeduct"    # [I

    .line 176
    move-object/from16 v6, p1

    move/from16 v7, p2

    const/16 v1, 0x10

    invoke-virtual {v6, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 177
    .local v8, "colspan":I
    const/16 v1, 0x3c

    invoke-virtual {v6, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 178
    .local v1, "rowspan":I
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/Cell;

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Cell;->getCol()I

    move-result v9

    .line 179
    .local v9, "colN":I
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v10

    .line 182
    .local v10, "cellBorders":[Lcom/itextpdf/layout/borders/Border;
    add-int/lit8 v2, v7, 0x1

    sub-int/2addr v2, v1

    if-gez v2, :cond_0

    .line 183
    add-int/lit8 v1, v7, 0x1

    move v11, v1

    goto :goto_0

    .line 182
    :cond_0
    move v11, v1

    .line 187
    .end local v1    # "rowspan":I
    .local v11, "rowspan":I
    :goto_0
    const/4 v1, 0x0

    move v12, v1

    .local v12, "i":I
    :goto_1
    const/4 v13, 0x2

    if-ge v12, v8, :cond_1

    .line 188
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->horizontalBorders:Ljava/util/List;

    add-int/lit8 v2, v7, 0x1

    sub-int/2addr v2, v11

    mul-int/2addr v2, v13

    add-int v3, v9, v12

    const/4 v4, 0x0

    aget-object v4, v10, v4

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 187
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 191
    .end local v12    # "i":I
    :cond_1
    const/4 v1, 0x0

    move v12, v1

    .restart local v12    # "i":I
    :goto_2
    const/4 v14, 0x1

    if-ge v12, v8, :cond_2

    .line 192
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->horizontalBorders:Ljava/util/List;

    mul-int/lit8 v2, v7, 0x2

    add-int/2addr v2, v14

    add-int v3, v9, v12

    aget-object v4, v10, v13

    const/4 v5, 0x1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 191
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 195
    .end local v12    # "i":I
    :cond_2
    sub-int v1, v7, v11

    add-int/2addr v1, v14

    move v3, v1

    .local v3, "j":I
    :goto_3
    if-gt v3, v7, :cond_3

    .line 196
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->verticalBorders:Ljava/util/List;

    mul-int/lit8 v2, v9, 0x2

    const/4 v4, 0x3

    aget-object v4, v10, v4

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 195
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 199
    .end local v3    # "j":I
    :cond_3
    sub-int v1, v7, v11

    add-int/2addr v1, v14

    move v3, v1

    .local v3, "i":I
    :goto_4
    if-gt v3, v7, :cond_4

    .line 200
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->verticalBorders:Ljava/util/List;

    add-int v2, v9, v8

    mul-int/2addr v2, v13

    sub-int/2addr v2, v14

    aget-object v4, v10, v14

    const/4 v5, 0x1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z

    .line 199
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 202
    .end local v3    # "i":I
    :cond_4
    return-void
.end method

.method protected checkAndReplaceBorderInArray(Ljava/util/List;IILcom/itextpdf/layout/borders/Border;Z)Z
    .locals 4
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

    .line 205
    .local p1, "borderArray":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;>;"
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 206
    .local v0, "borders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/borders/Border;

    .line 207
    .local v1, "neighbour":Lcom/itextpdf/layout/borders/Border;
    if-nez v1, :cond_0

    .line 208
    invoke-interface {v0, p3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 210
    :cond_0
    const-class v2, Lcom/itextpdf/layout/renderer/TableRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 211
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Unexpected behaviour during table row collapsing. Calculated rowspan was less then 1."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 214
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :goto_0
    const/4 v2, 0x1

    return v2
.end method

.method protected collapseTableWithFooter(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "footerBordersHandler"    # Lcom/itextpdf/layout/renderer/TableBorders;
    .param p2, "hasContent"    # Z

    .line 104
    return-object p0
.end method

.method protected collapseTableWithHeader(Lcom/itextpdf/layout/renderer/TableBorders;Z)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "headerBordersHandler"    # Lcom/itextpdf/layout/renderer/TableBorders;
    .param p2, "updateBordersHandler"    # Z

    .line 109
    return-object p0
.end method

.method protected drawHorizontalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "borderDescriptor"    # Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    .line 48
    return-object p0
.end method

.method protected drawVerticalBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/layout/renderer/TableBorderDescriptor;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "borderDescriptor"    # Lcom/itextpdf/layout/renderer/TableBorderDescriptor;

    .line 53
    return-object p0
.end method

.method protected fixHeaderOccupiedArea(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "occupiedBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 114
    return-object p0
.end method

.method public getCellBorderIndents(IIII)[F
    .locals 1
    .param p1, "row"    # I
    .param p2, "col"    # I
    .param p3, "rowspan"    # I
    .param p4, "colspan"    # I

    .line 172
    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method protected getCellVerticalAddition([F)F
    .locals 1
    .param p1, "indents"    # [F

    .line 135
    const/4 v0, 0x0

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

    .line 241
    iget v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->startRow:I

    mul-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHorizontalBorder(I)Ljava/util/List;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->horizontalBorders:Ljava/util/List;

    iget v1, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->largeTableIndexOffset:I

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
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

    .line 246
    iget v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->finishRow:I

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->getHorizontalBorder(I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getMaxBottomWidth()F
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    :goto_0
    return v0
.end method

.method public getMaxLeftWidth()F
    .locals 2

    .line 266
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    :goto_0
    return v0
.end method

.method public getMaxRightWidth()F
    .locals 2

    .line 261
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    :goto_0
    return v0
.end method

.method public getMaxTopWidth()F
    .locals 2

    .line 251
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->tableBoundingBorders:[Lcom/itextpdf/layout/borders/Border;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    :goto_0
    return v0
.end method

.method public getVerticalBorder(I)Ljava/util/List;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method protected initializeBorders()Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 5

    .line 221
    nop

    :goto_0
    iget v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->numberOfColumns:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-le v0, v2, :cond_1

    .line 222
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .local v0, "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_0

    .line 224
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 226
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->verticalBorders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 229
    .end local v0    # "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_1
    :goto_2
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v0, v2, :cond_3

    .line 230
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 231
    .restart local v0    # "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :goto_3
    iget v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->numberOfColumns:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-le v2, v4, :cond_2

    .line 232
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 234
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->horizontalBorders:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 236
    .end local v0    # "tempBorders":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    :cond_3
    return-object p0
.end method

.method protected skipFooter([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "borders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 93
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->setTableBoundingBorders([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;

    .line 94
    return-object p0
.end method

.method protected skipHeader([Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 0
    .param p1, "borders"    # [Lcom/itextpdf/layout/borders/Border;

    .line 99
    return-object p0
.end method

.method protected updateBordersOnNewPage(ZZLcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;Lcom/itextpdf/layout/renderer/TableRenderer;)Lcom/itextpdf/layout/renderer/TableBorders;
    .locals 3
    .param p1, "isOriginalNonSplitRenderer"    # Z
    .param p2, "isFooterOrHeader"    # Z
    .param p3, "currentRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p4, "headerRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;
    .param p5, "footerRenderer"    # Lcom/itextpdf/layout/renderer/TableRenderer;

    .line 140
    if-nez p2, :cond_0

    .line 142
    if-eqz p1, :cond_0

    .line 143
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rows:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 144
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->processAllBordersAndEmptyRows()Lcom/itextpdf/layout/renderer/TableBorders;

    .line 145
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->getMaxRightWidth()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rightBorderMaxWidth:F

    .line 146
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->getMaxLeftWidth()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->leftBorderMaxWidth:F

    .line 150
    :cond_0
    if-eqz p5, :cond_1

    .line 151
    iget-object v0, p5, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxRightWidth()F

    move-result v0

    .line 152
    .local v0, "rightFooterBorderWidth":F
    iget-object v1, p5, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxLeftWidth()F

    move-result v1

    .line 154
    .local v1, "leftFooterBorderWidth":F
    iget v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->leftBorderMaxWidth:F

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->leftBorderMaxWidth:F

    .line 155
    iget v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rightBorderMaxWidth:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rightBorderMaxWidth:F

    .line 158
    .end local v0    # "rightFooterBorderWidth":F
    .end local v1    # "leftFooterBorderWidth":F
    :cond_1
    if-eqz p4, :cond_2

    .line 159
    iget-object v0, p4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxRightWidth()F

    move-result v0

    .line 160
    .local v0, "rightHeaderBorderWidth":F
    iget-object v1, p4, Lcom/itextpdf/layout/renderer/TableRenderer;->bordersHandler:Lcom/itextpdf/layout/renderer/TableBorders;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/TableBorders;->getMaxLeftWidth()F

    move-result v1

    .line 162
    .local v1, "leftHeaderBorderWidth":F
    iget v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->leftBorderMaxWidth:F

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->leftBorderMaxWidth:F

    .line 163
    iget v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rightBorderMaxWidth:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/SeparatedTableBorders;->rightBorderMaxWidth:F

    .line 166
    .end local v0    # "rightHeaderBorderWidth":F
    .end local v1    # "leftHeaderBorderWidth":F
    :cond_2
    return-object p0
.end method
