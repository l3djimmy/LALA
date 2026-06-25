package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class CollapsedTableBorders extends TableBorders {
    private static Comparator<Border> borderComparator = new BorderComparator();
    private List<Border> bottomBorderCollapseWith;
    private List<Border> topBorderCollapseWith;
    private List<Border> verticalBottomBorderCollapseWith;

    public CollapsedTableBorders(List<CellRenderer[]> rows, int numberOfColumns, Border[] tableBoundingBorders) {
        super(rows, numberOfColumns, tableBoundingBorders);
        this.topBorderCollapseWith = new ArrayList();
        this.bottomBorderCollapseWith = new ArrayList();
        this.verticalBottomBorderCollapseWith = null;
    }

    public CollapsedTableBorders(List<CellRenderer[]> rows, int numberOfColumns, Border[] tableBoundingBorders, int largeTableIndexOffset) {
        super(rows, numberOfColumns, tableBoundingBorders, largeTableIndexOffset);
        this.topBorderCollapseWith = new ArrayList();
        this.bottomBorderCollapseWith = new ArrayList();
        this.verticalBottomBorderCollapseWith = null;
    }

    public List<Border> getTopBorderCollapseWith() {
        return this.topBorderCollapseWith;
    }

    public List<Border> getBottomBorderCollapseWith() {
        return this.bottomBorderCollapseWith;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public float[] getCellBorderIndents(int row, int col, int rowspan, int colspan) {
        float[] indents = new float[4];
        List<Border> borderList = getHorizontalBorder(((this.startRow + row) - rowspan) + 1);
        for (int i = col; i < col + colspan; i++) {
            Border border = borderList.get(i);
            if (border != null && border.getWidth() > indents[0]) {
                indents[0] = border.getWidth();
            }
        }
        int i2 = col + colspan;
        List<Border> borderList2 = getVerticalBorder(i2);
        for (int i3 = (((this.startRow - this.largeTableIndexOffset) + row) - rowspan) + 1; i3 < (this.startRow - this.largeTableIndexOffset) + row + 1; i3++) {
            Border border2 = borderList2.get(i3);
            if (border2 != null && border2.getWidth() > indents[1]) {
                indents[1] = border2.getWidth();
            }
        }
        int i4 = this.startRow;
        List<Border> borderList3 = getHorizontalBorder(i4 + row + 1);
        for (int i5 = col; i5 < col + colspan; i5++) {
            Border border3 = borderList3.get(i5);
            if (border3 != null && border3.getWidth() > indents[2]) {
                indents[2] = border3.getWidth();
            }
        }
        List<Border> borderList4 = getVerticalBorder(col);
        for (int i6 = (((this.startRow - this.largeTableIndexOffset) + row) - rowspan) + 1; i6 < (this.startRow - this.largeTableIndexOffset) + row + 1; i6++) {
            Border border4 = borderList4.get(i6);
            if (border4 != null && border4.getWidth() > indents[3]) {
                indents[3] = border4.getWidth();
            }
        }
        return indents;
    }

    public List<Border> getVerticalBordersCrossingTopHorizontalBorder() {
        List<Border> borders = new ArrayList<>(this.numberOfColumns + 1);
        for (int i = 0; i <= this.numberOfColumns; i++) {
            List<Border> verticalBorder = getVerticalBorder(i);
            Border borderToAdd = this.startRow - this.largeTableIndexOffset < verticalBorder.size() ? verticalBorder.get(this.startRow - this.largeTableIndexOffset) : null;
            borders.add(borderToAdd);
        }
        return borders;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public List<Border> getVerticalBorder(int index) {
        if (index == 0) {
            List<Border> borderList = TableBorderUtil.createAndFillBorderList(null, this.tableBoundingBorders[3], this.verticalBorders.get(0).size());
            return getCollapsedList(this.verticalBorders.get(0), borderList);
        } else if (index == this.numberOfColumns) {
            List<Border> borderList2 = TableBorderUtil.createAndFillBorderList(null, this.tableBoundingBorders[1], this.verticalBorders.get(this.verticalBorders.size() - 1).size());
            return getCollapsedList(this.verticalBorders.get(this.verticalBorders.size() - 1), borderList2);
        } else {
            return this.verticalBorders.get(index);
        }
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public List<Border> getHorizontalBorder(int index) {
        if (index == this.startRow) {
            List<Border> firstBorderOnCurrentPage = TableBorderUtil.createAndFillBorderList(this.topBorderCollapseWith, this.tableBoundingBorders[0], this.numberOfColumns);
            if (index == this.largeTableIndexOffset) {
                return getCollapsedList(this.horizontalBorders.get(index - this.largeTableIndexOffset), firstBorderOnCurrentPage);
            }
            if (this.rows.size() != 0) {
                int col = 0;
                int row = index;
                while (col < this.numberOfColumns) {
                    if (this.rows.get(row - this.largeTableIndexOffset)[col] != null && (row - index) + 1 <= ((Cell) this.rows.get(row - this.largeTableIndexOffset)[col].getModelElement()).getRowspan()) {
                        CellRenderer cell = this.rows.get(row - this.largeTableIndexOffset)[col];
                        Border cellModelTopBorder = TableBorderUtil.getCellSideBorder((Cell) cell.getModelElement(), 13);
                        int colspan = cell.getPropertyAsInteger(16).intValue();
                        if (firstBorderOnCurrentPage.get(col) == null || (cellModelTopBorder != null && cellModelTopBorder.getWidth() > firstBorderOnCurrentPage.get(col).getWidth())) {
                            for (int i = col; i < col + colspan; i++) {
                                firstBorderOnCurrentPage.set(i, cellModelTopBorder);
                            }
                        }
                        col += colspan;
                        row = index;
                    } else {
                        row++;
                        if (row == this.rows.size()) {
                            break;
                        }
                    }
                }
            }
            return firstBorderOnCurrentPage;
        } else if (index == this.finishRow + 1) {
            List<Border> lastBorderOnCurrentPage = TableBorderUtil.createAndFillBorderList(this.bottomBorderCollapseWith, this.tableBoundingBorders[2], this.numberOfColumns);
            if (index - this.largeTableIndexOffset == this.horizontalBorders.size() - 1) {
                return getCollapsedList(this.horizontalBorders.get(index - this.largeTableIndexOffset), lastBorderOnCurrentPage);
            }
            if (this.rows.size() != 0) {
                int col2 = 0;
                int row2 = index - 1;
                while (col2 < this.numberOfColumns) {
                    if (this.rows.get(row2 - this.largeTableIndexOffset)[col2] != null) {
                        CellRenderer cell2 = this.rows.get(row2 - this.largeTableIndexOffset)[col2];
                        Border cellModelBottomBorder = TableBorderUtil.getCellSideBorder((Cell) cell2.getModelElement(), 10);
                        int colspan2 = cell2.getPropertyAsInteger(16).intValue();
                        if (lastBorderOnCurrentPage.get(col2) == null || (cellModelBottomBorder != null && cellModelBottomBorder.getWidth() > lastBorderOnCurrentPage.get(col2).getWidth())) {
                            for (int i2 = col2; i2 < col2 + colspan2; i2++) {
                                lastBorderOnCurrentPage.set(i2, cellModelBottomBorder);
                            }
                        }
                        col2 += colspan2;
                        row2 = index - 1;
                    } else {
                        row2++;
                        if (row2 == this.rows.size()) {
                            break;
                        }
                    }
                }
            }
            return lastBorderOnCurrentPage;
        } else {
            return this.horizontalBorders.get(index - this.largeTableIndexOffset);
        }
    }

    public CollapsedTableBorders setTopBorderCollapseWith(List<Border> topBorderCollapseWith) {
        this.topBorderCollapseWith = new ArrayList();
        if (topBorderCollapseWith != null) {
            this.topBorderCollapseWith.addAll(topBorderCollapseWith);
        }
        return this;
    }

    public CollapsedTableBorders setBottomBorderCollapseWith(List<Border> bottomBorderCollapseWith, List<Border> verticalBordersCrossingBottomBorder) {
        this.bottomBorderCollapseWith = new ArrayList();
        if (bottomBorderCollapseWith != null) {
            this.bottomBorderCollapseWith.addAll(bottomBorderCollapseWith);
        }
        this.verticalBottomBorderCollapseWith = null;
        if (verticalBordersCrossingBottomBorder != null) {
            this.verticalBottomBorderCollapseWith = new ArrayList(verticalBordersCrossingBottomBorder);
        }
        return this;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0080, code lost:
        if (r5 == r8.rows.size()) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0082, code lost:
        if (r5 <= r10) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0084, code lost:
        buildBordersArrays(r8.rows.get(r5)[r4], r5, true);
     */
    @Override // com.itextpdf.layout.renderer.TableBorders
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void buildBordersArrays(com.itextpdf.layout.renderer.CellRenderer r9, int r10, int r11, int[] r12) {
        /*
            Method dump skipped, instructions count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.CollapsedTableBorders.buildBordersArrays(com.itextpdf.layout.renderer.CellRenderer, int, int, int[]):void");
    }

    protected void buildBordersArrays(CellRenderer cell, int row, boolean isNeighbourCell) {
        int rowspan;
        int colspan = cell.getPropertyAsInteger(16).intValue();
        int rowspan2 = cell.getPropertyAsInteger(60).intValue();
        int colN = ((Cell) cell.getModelElement()).getCol();
        Border[] cellBorders = cell.getBorders();
        if ((row + 1) - rowspan2 >= 0) {
            rowspan = rowspan2;
        } else {
            rowspan = row + 1;
        }
        for (int i = 0; i < colspan; i++) {
            checkAndReplaceBorderInArray(this.horizontalBorders, (row + 1) - rowspan, colN + i, cellBorders[0], false);
        }
        for (int i2 = 0; i2 < colspan; i2++) {
            checkAndReplaceBorderInArray(this.horizontalBorders, row + 1, colN + i2, cellBorders[2], true);
        }
        for (int j = (row - rowspan) + 1; j <= row; j++) {
            checkAndReplaceBorderInArray(this.verticalBorders, colN, j, cellBorders[3], false);
        }
        for (int i3 = (row - rowspan) + 1; i3 <= row; i3++) {
            checkAndReplaceBorderInArray(this.verticalBorders, colN + colspan, i3, cellBorders[1], true);
        }
    }

    protected boolean checkAndReplaceBorderInArray(List<List<Border>> borderArray, int i, int j, Border borderToAdd, boolean hasPriority) {
        List<Border> borders = borderArray.get(i);
        Border neighbour = borders.get(j);
        if (neighbour == null) {
            borders.set(j, borderToAdd);
            return true;
        } else if (neighbour == borderToAdd || borderToAdd == null || neighbour.getWidth() > borderToAdd.getWidth()) {
            return false;
        } else {
            if (!hasPriority && neighbour.getWidth() == borderToAdd.getWidth()) {
                return false;
            }
            borders.set(j, borderToAdd);
            return true;
        }
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders drawHorizontalBorder(PdfCanvas canvas, TableBorderDescriptor borderDescriptor) {
        int i;
        int i2;
        int i3;
        CollapsedTableBorders collapsedTableBorders = this;
        int i4 = borderDescriptor.getBorderIndex();
        float startX = borderDescriptor.getMainCoordinateStart();
        float y1 = borderDescriptor.getCrossCoordinate();
        float[] countedColumnWidth = borderDescriptor.getMainCoordinateWidths();
        List<Border> horizontalBorder = collapsedTableBorders.getHorizontalBorder(collapsedTableBorders.startRow + i4);
        int i5 = 0;
        float x2 = countedColumnWidth[0] + startX;
        float x1 = startX;
        float x22 = x2;
        int j = 1;
        while (j <= horizontalBorder.size()) {
            Border currentBorder = horizontalBorder.get(j - 1);
            Border nextBorder = j < horizontalBorder.size() ? horizontalBorder.get(j) : null;
            if (currentBorder != null) {
                List<Border> crossingBordersAtStart = collapsedTableBorders.getCrossingBorders(i4, j - 1);
                Border[] borderArr = new Border[2];
                borderArr[i5] = crossingBordersAtStart.get(1);
                borderArr[1] = crossingBordersAtStart.get(3);
                float startCornerWidth = collapsedTableBorders.getWidestBorderWidth(borderArr);
                int i6 = i5;
                List<Border> crossingBordersAtEnd = collapsedTableBorders.getCrossingBorders(i4, j);
                Border[] borderArr2 = new Border[2];
                borderArr2[i6] = crossingBordersAtEnd.get(1);
                borderArr2[1] = crossingBordersAtEnd.get(3);
                float endCornerWidth = collapsedTableBorders.getWidestBorderWidth(borderArr2);
                if (1 != j) {
                    i2 = i6;
                } else {
                    i2 = i6;
                    crossingBordersAtStart.add(i2, currentBorder);
                }
                if (i4 == 0) {
                    if (1 == j) {
                        i3 = 3;
                    } else {
                        i3 = 3;
                        crossingBordersAtStart.add(i2, crossingBordersAtStart.get(3));
                    }
                    crossingBordersAtEnd.add(i2, crossingBordersAtEnd.get(i3));
                }
                Collections.sort(crossingBordersAtStart, borderComparator);
                Collections.sort(crossingBordersAtEnd, borderComparator);
                float x1Offset = currentBorder.equals(crossingBordersAtStart.get(i2)) ? (-startCornerWidth) / 2.0f : startCornerWidth / 2.0f;
                float x2Offset = currentBorder.equals(crossingBordersAtEnd.get(0)) ? endCornerWidth / 2.0f : (-endCornerWidth) / 2.0f;
                i = 0;
                currentBorder.drawCellBorder(canvas, x1 + x1Offset, y1, x22 + x2Offset, y1, Border.Side.NONE);
                float x1Offset2 = x22;
                x1 = x1Offset2;
            } else {
                i = i5;
                x1 += countedColumnWidth[j - 1];
                x22 = x1;
            }
            if (nextBorder != null && j != horizontalBorder.size()) {
                x22 += countedColumnWidth[j];
            }
            j++;
            collapsedTableBorders = this;
            i5 = i;
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders drawVerticalBorder(PdfCanvas canvas, TableBorderDescriptor borderDescriptor) {
        int i;
        float startY;
        Border nextBorder;
        Float y1Offset;
        CollapsedTableBorders collapsedTableBorders = this;
        int i2 = borderDescriptor.getBorderIndex();
        float startY2 = borderDescriptor.getMainCoordinateStart();
        float x1 = borderDescriptor.getCrossCoordinate();
        float[] heights = borderDescriptor.getMainCoordinateWidths();
        List<Border> borders = collapsedTableBorders.getVerticalBorder(i2);
        float y2 = startY2;
        if (heights.length != 0) {
            y2 = startY2 - heights[0];
        }
        Float y1Offset2 = null;
        float y1 = startY2;
        float y22 = y2;
        int j = 1;
        while (j <= heights.length) {
            Border currentBorder = borders.get(((collapsedTableBorders.startRow - collapsedTableBorders.largeTableIndexOffset) + j) - 1);
            Border nextBorder2 = j < heights.length ? borders.get((collapsedTableBorders.startRow - collapsedTableBorders.largeTableIndexOffset) + j) : null;
            if (currentBorder != null) {
                List<Border> crossingBordersAtStart = collapsedTableBorders.getCrossingBorders(j - 1, i2);
                float startCornerWidth = collapsedTableBorders.getWidestBorderWidth(crossingBordersAtStart.get(0), crossingBordersAtStart.get(2));
                if (1 == j) {
                    crossingBordersAtStart.add(0, currentBorder);
                }
                Collections.sort(crossingBordersAtStart, borderComparator);
                List<Border> crossingBordersAtEnd = collapsedTableBorders.getCrossingBorders(j, i2);
                i = i2;
                startY = startY2;
                float endCornerWidth = collapsedTableBorders.getWidestBorderWidth(crossingBordersAtEnd.get(0), crossingBordersAtEnd.get(2));
                Collections.sort(crossingBordersAtEnd, borderComparator);
                if (currentBorder.equals(nextBorder2)) {
                    nextBorder = nextBorder2;
                    if (y1Offset2 == null) {
                        y1Offset2 = Float.valueOf(currentBorder.equals(crossingBordersAtStart.get(0)) ? startCornerWidth / 2.0f : (-startCornerWidth) / 2.0f);
                    }
                } else {
                    if (y1Offset2 != null) {
                        y1Offset = y1Offset2;
                    } else {
                        Float y1Offset3 = Float.valueOf(currentBorder.equals(crossingBordersAtStart.get(0)) ? startCornerWidth / 2.0f : (-startCornerWidth) / 2.0f);
                        y1Offset = y1Offset3;
                    }
                    float y2Offset = currentBorder.equals(crossingBordersAtEnd.get(0)) ? (-endCornerWidth) / 2.0f : endCornerWidth / 2.0f;
                    nextBorder = nextBorder2;
                    currentBorder.drawCellBorder(canvas, x1, y1Offset.floatValue() + y1, x1, y22 + y2Offset, Border.Side.NONE);
                    y1 = y22;
                    y1Offset2 = null;
                }
            } else {
                i = i2;
                startY = startY2;
                nextBorder = nextBorder2;
                y1 -= heights[j - 1];
                y22 = y1;
            }
            if (nextBorder != null) {
                y22 -= heights[j];
            }
            j++;
            collapsedTableBorders = this;
            startY2 = startY;
            i2 = i;
        }
        return this;
    }

    public static Border getCollapsedBorder(Border cellBorder, Border tableBorder) {
        if (tableBorder != null && (cellBorder == null || cellBorder.getWidth() < tableBorder.getWidth())) {
            return tableBorder;
        }
        if (cellBorder != null) {
            return cellBorder;
        }
        return Border.NO_BORDER;
    }

    public static List<Border> getCollapsedList(List<Border> innerList, List<Border> outerList) {
        int size = Math.min(innerList == null ? 0 : innerList.size(), outerList != null ? outerList.size() : 0);
        List<Border> collapsedList = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            collapsedList.add(getCollapsedBorder(innerList.get(i), outerList.get(i)));
        }
        return collapsedList;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyLeftAndRightTableBorder(Rectangle layoutBox, boolean reverse) {
        if (layoutBox != null) {
            layoutBox.applyMargins(0.0f, this.rightBorderMaxWidth / 2.0f, 0.0f, this.leftBorderMaxWidth / 2.0f, reverse);
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyTopTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean isEmpty, boolean force, boolean reverse) {
        if (!isEmpty) {
            return applyTopTableBorder(occupiedBox, layoutBox, reverse);
        }
        if (force) {
            applyTopTableBorder(occupiedBox, layoutBox, reverse);
            return applyTopTableBorder(occupiedBox, layoutBox, reverse);
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyBottomTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean isEmpty, boolean force, boolean reverse) {
        if (!isEmpty) {
            return applyBottomTableBorder(occupiedBox, layoutBox, reverse);
        }
        if (force) {
            applyBottomTableBorder(occupiedBox, layoutBox, reverse);
            return applyBottomTableBorder(occupiedBox, layoutBox, reverse);
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyTopTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean reverse) {
        float topIndent = (reverse ? -1 : 1) * getMaxTopWidth();
        layoutBox.decreaseHeight(topIndent / 2.0f);
        occupiedBox.moveDown(topIndent / 2.0f).increaseHeight(topIndent / 2.0f);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyBottomTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean reverse) {
        float bottomTableBorderWidth = (reverse ? -1 : 1) * getMaxBottomWidth();
        layoutBox.decreaseHeight(bottomTableBorderWidth / 2.0f);
        occupiedBox.moveDown(bottomTableBorderWidth / 2.0f).increaseHeight(bottomTableBorderWidth / 2.0f);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyCellIndents(Rectangle box, float topIndent, float rightIndent, float bottomIndent, float leftIndent, boolean reverse) {
        box.applyMargins(topIndent / 2.0f, rightIndent / 2.0f, bottomIndent / 2.0f, leftIndent / 2.0f, false);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected float getCellVerticalAddition(float[] indents) {
        return (indents[0] / 2.0f) + (indents[2] / 2.0f);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders updateBordersOnNewPage(boolean isOriginalNonSplitRenderer, boolean isFooterOrHeader, TableRenderer currentRenderer, TableRenderer headerRenderer, TableRenderer footerRenderer) {
        if (!isFooterOrHeader) {
            if (isOriginalNonSplitRenderer) {
                if (this.rows != null) {
                    processAllBordersAndEmptyRows();
                    this.rightBorderMaxWidth = getMaxRightWidth();
                    this.leftBorderMaxWidth = getMaxLeftWidth();
                }
                setTopBorderCollapseWith(((Table) currentRenderer.getModelElement()).getLastRowBottomBorder());
            } else {
                setTopBorderCollapseWith(null);
                setBottomBorderCollapseWith(null, null);
            }
        }
        if (footerRenderer != null) {
            float rightFooterBorderWidth = footerRenderer.bordersHandler.getMaxRightWidth();
            float leftFooterBorderWidth = footerRenderer.bordersHandler.getMaxLeftWidth();
            this.leftBorderMaxWidth = Math.max(this.leftBorderMaxWidth, leftFooterBorderWidth);
            this.rightBorderMaxWidth = Math.max(this.rightBorderMaxWidth, rightFooterBorderWidth);
        }
        if (headerRenderer != null) {
            float rightHeaderBorderWidth = headerRenderer.bordersHandler.getMaxRightWidth();
            float leftHeaderBorderWidth = headerRenderer.bordersHandler.getMaxLeftWidth();
            this.leftBorderMaxWidth = Math.max(this.leftBorderMaxWidth, leftHeaderBorderWidth);
            this.rightBorderMaxWidth = Math.max(this.rightBorderMaxWidth, rightHeaderBorderWidth);
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders skipFooter(Border[] borders) {
        setTableBoundingBorders(borders);
        setBottomBorderCollapseWith(null, null);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders skipHeader(Border[] borders) {
        setTableBoundingBorders(borders);
        setTopBorderCollapseWith(null);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders collapseTableWithFooter(TableBorders footerBordersHandler, boolean hasContent) {
        ((CollapsedTableBorders) footerBordersHandler).setTopBorderCollapseWith(hasContent ? getLastHorizontalBorder() : getTopBorderCollapseWith());
        setBottomBorderCollapseWith(footerBordersHandler.getHorizontalBorder(0), ((CollapsedTableBorders) footerBordersHandler).getVerticalBordersCrossingTopHorizontalBorder());
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders collapseTableWithHeader(TableBorders headerBordersHandler, boolean updateBordersHandler) {
        ((CollapsedTableBorders) headerBordersHandler).setBottomBorderCollapseWith(getHorizontalBorder(this.startRow), getVerticalBordersCrossingTopHorizontalBorder());
        if (updateBordersHandler) {
            setTopBorderCollapseWith(headerBordersHandler.getLastHorizontalBorder());
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders fixHeaderOccupiedArea(Rectangle occupiedBox, Rectangle layoutBox) {
        float topBorderMaxWidth = getMaxTopWidth();
        layoutBox.increaseHeight(topBorderMaxWidth);
        occupiedBox.moveUp(topBorderMaxWidth).decreaseHeight(topBorderMaxWidth);
        return this;
    }

    List<Border> getCrossingBorders(int horizontalIndex, int verticalIndex) {
        Border border;
        List<Border> horizontalBorder = getHorizontalBorder(this.startRow + horizontalIndex);
        List<Border> verticalBorder = getVerticalBorder(verticalIndex);
        List<Border> crossingBorders = new ArrayList<>(4);
        Border border2 = null;
        crossingBorders.add(verticalIndex > 0 ? horizontalBorder.get(verticalIndex - 1) : null);
        if (horizontalIndex <= 0) {
            border = null;
        } else {
            border = verticalBorder.get(((this.startRow - this.largeTableIndexOffset) + horizontalIndex) - 1);
        }
        crossingBorders.add(border);
        crossingBorders.add(verticalIndex < this.numberOfColumns ? horizontalBorder.get(verticalIndex) : null);
        if (horizontalIndex <= this.finishRow - this.startRow) {
            border2 = verticalBorder.get((this.startRow - this.largeTableIndexOffset) + horizontalIndex);
        }
        crossingBorders.add(border2);
        if (horizontalIndex == (this.finishRow - this.startRow) + 1 && this.verticalBottomBorderCollapseWith != null && isBorderWider(this.verticalBottomBorderCollapseWith.get(verticalIndex), crossingBorders.get(3))) {
            crossingBorders.set(3, this.verticalBottomBorderCollapseWith.get(verticalIndex));
        }
        return crossingBorders;
    }

    /* loaded from: classes12.dex */
    private static class BorderComparator implements Comparator<Border> {
        private BorderComparator() {
        }

        @Override // java.util.Comparator
        public int compare(Border o1, Border o2) {
            if (o1 == o2) {
                return 0;
            }
            if (o1 == null) {
                return 1;
            }
            if (o2 == null) {
                return -1;
            }
            return Float.compare(o2.getWidth(), o1.getWidth());
        }
    }

    private float getWidestBorderWidth(Border... borders) {
        float maxWidth = 0.0f;
        for (Border border : borders) {
            if (border != null && maxWidth < border.getWidth()) {
                maxWidth = border.getWidth();
            }
        }
        return maxWidth;
    }

    private static boolean isBorderWider(Border thisBorder, Border otherBorder) {
        return isBorderWider(thisBorder, otherBorder, true);
    }

    private static boolean isBorderWider(Border thisBorder, Border otherBorder, boolean strict) {
        if (thisBorder == null) {
            return false;
        }
        if (otherBorder == null) {
            return true;
        }
        int comparisonResult = Float.compare(thisBorder.getWidth(), otherBorder.getWidth());
        if (strict) {
            if (comparisonResult <= 0) {
                return false;
            }
        } else if (comparisonResult < 0) {
            return false;
        }
        return true;
    }
}
