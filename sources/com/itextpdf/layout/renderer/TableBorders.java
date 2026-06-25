package com.itextpdf.layout.renderer;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public abstract class TableBorders {
    protected int finishRow;
    protected List<List<Border>> horizontalBorders;
    protected int largeTableIndexOffset;
    protected float leftBorderMaxWidth;
    protected final int numberOfColumns;
    protected float rightBorderMaxWidth;
    protected List<CellRenderer[]> rows;
    protected int startRow;
    protected Border[] tableBoundingBorders;
    protected List<List<Border>> verticalBorders;

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders applyBottomTableBorder(Rectangle rectangle, Rectangle rectangle2, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders applyBottomTableBorder(Rectangle rectangle, Rectangle rectangle2, boolean z, boolean z2, boolean z3);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders applyCellIndents(Rectangle rectangle, float f, float f2, float f3, float f4, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders applyLeftAndRightTableBorder(Rectangle rectangle, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders applyTopTableBorder(Rectangle rectangle, Rectangle rectangle2, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders applyTopTableBorder(Rectangle rectangle, Rectangle rectangle2, boolean z, boolean z2, boolean z3);

    @Deprecated
    protected abstract void buildBordersArrays(CellRenderer cellRenderer, int i, int i2, int[] iArr);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders collapseTableWithFooter(TableBorders tableBorders, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders collapseTableWithHeader(TableBorders tableBorders, boolean z);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders drawHorizontalBorder(PdfCanvas pdfCanvas, TableBorderDescriptor tableBorderDescriptor);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders drawVerticalBorder(PdfCanvas pdfCanvas, TableBorderDescriptor tableBorderDescriptor);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders fixHeaderOccupiedArea(Rectangle rectangle, Rectangle rectangle2);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract float getCellVerticalAddition(float[] fArr);

    public abstract List<Border> getHorizontalBorder(int i);

    public abstract List<Border> getVerticalBorder(int i);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders skipFooter(Border[] borderArr);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders skipHeader(Border[] borderArr);

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract TableBorders updateBordersOnNewPage(boolean z, boolean z2, TableRenderer tableRenderer, TableRenderer tableRenderer2, TableRenderer tableRenderer3);

    public TableBorders(List<CellRenderer[]> rows, int numberOfColumns, Border[] tableBoundingBorders) {
        this.horizontalBorders = new ArrayList();
        this.verticalBorders = new ArrayList();
        this.tableBoundingBorders = new Border[4];
        this.largeTableIndexOffset = 0;
        this.rows = rows;
        this.numberOfColumns = numberOfColumns;
        setTableBoundingBorders(tableBoundingBorders);
    }

    public TableBorders(List<CellRenderer[]> rows, int numberOfColumns, Border[] tableBoundingBorders, int largeTableIndexOffset) {
        this(rows, numberOfColumns, tableBoundingBorders);
        this.largeTableIndexOffset = largeTableIndexOffset;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TableBorders processAllBordersAndEmptyRows() {
        int numOfRowsToRemove = 0;
        if (!this.rows.isEmpty()) {
            int row = this.startRow - this.largeTableIndexOffset;
            while (row <= this.finishRow - this.largeTableIndexOffset) {
                CellRenderer[] currentRow = this.rows.get(row);
                boolean hasCells = false;
                int col = 0;
                while (col < this.numberOfColumns) {
                    if (currentRow[col] != null) {
                        if (numOfRowsToRemove != 0) {
                            updateRowspanForNextNonEmptyCellInEachColumn(numOfRowsToRemove, row);
                            removeRows(row - numOfRowsToRemove, numOfRowsToRemove);
                            row -= numOfRowsToRemove;
                            numOfRowsToRemove = 0;
                        }
                        buildBordersArrays(currentRow[col], row, col, null);
                        hasCells = true;
                        int colspan = currentRow[col].getPropertyAsInteger(16).intValue();
                        col += colspan - 1;
                    } else if (this.horizontalBorders.get(row).size() <= col) {
                        this.horizontalBorders.get(row).add(null);
                    }
                    col++;
                }
                if (!hasCells) {
                    if (row == this.rows.size() - 1) {
                        removeRows(row - numOfRowsToRemove, numOfRowsToRemove);
                        this.rows.remove(row - numOfRowsToRemove);
                        setFinishRow(this.finishRow - 1);
                        Logger logger = LoggerFactory.getLogger(TableRenderer.class);
                        logger.warn(IoLogMessageConstant.LAST_ROW_IS_NOT_COMPLETE);
                    } else {
                        numOfRowsToRemove++;
                    }
                }
                row++;
            }
        }
        int row2 = this.finishRow;
        if (row2 < this.startRow) {
            setFinishRow(this.startRow);
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TableBorders initializeBorders() {
        while (this.numberOfColumns + 1 > this.verticalBorders.size()) {
            List<Border> tempBorders = new ArrayList<>();
            while (Math.max(this.rows.size(), 1) > tempBorders.size()) {
                tempBorders.add(null);
            }
            this.verticalBorders.add(tempBorders);
        }
        while (Math.max(this.rows.size(), 1) + 1 > this.horizontalBorders.size()) {
            List<Border> tempBorders2 = new ArrayList<>();
            while (this.numberOfColumns > tempBorders2.size()) {
                tempBorders2.add(null);
            }
            this.horizontalBorders.add(tempBorders2);
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TableBorders setTableBoundingBorders(Border[] borders) {
        this.tableBoundingBorders = new Border[4];
        if (borders != null) {
            for (int i = 0; i < borders.length; i++) {
                this.tableBoundingBorders[i] = borders[i];
            }
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TableBorders setRowRange(int startRow, int finishRow) {
        this.startRow = startRow;
        this.finishRow = finishRow;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TableBorders setStartRow(int row) {
        this.startRow = row;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TableBorders setFinishRow(int row) {
        this.finishRow = row;
        return this;
    }

    public float getLeftBorderMaxWidth() {
        return this.leftBorderMaxWidth;
    }

    public float getRightBorderMaxWidth() {
        return this.rightBorderMaxWidth;
    }

    public float getMaxTopWidth() {
        Border widestBorder = getWidestHorizontalBorder(this.startRow);
        if (widestBorder == null || widestBorder.getWidth() < 0.0f) {
            return 0.0f;
        }
        float width = widestBorder.getWidth();
        return width;
    }

    public float getMaxBottomWidth() {
        Border widestBorder = getWidestHorizontalBorder(this.finishRow + 1);
        if (widestBorder == null || widestBorder.getWidth() < 0.0f) {
            return 0.0f;
        }
        float width = widestBorder.getWidth();
        return width;
    }

    public float getMaxRightWidth() {
        Border widestBorder = getWidestVerticalBorder(this.verticalBorders.size() - 1);
        if (widestBorder == null || widestBorder.getWidth() < 0.0f) {
            return 0.0f;
        }
        float width = widestBorder.getWidth();
        return width;
    }

    public float getMaxLeftWidth() {
        Border widestBorder = getWidestVerticalBorder(0);
        if (widestBorder == null || widestBorder.getWidth() < 0.0f) {
            return 0.0f;
        }
        float width = widestBorder.getWidth();
        return width;
    }

    public Border getWidestVerticalBorder(int col) {
        return TableBorderUtil.getWidestBorder(getVerticalBorder(col));
    }

    public Border getWidestVerticalBorder(int col, int start, int end) {
        return TableBorderUtil.getWidestBorder(getVerticalBorder(col), start, end);
    }

    public Border getWidestHorizontalBorder(int row) {
        return TableBorderUtil.getWidestBorder(getHorizontalBorder(row));
    }

    public Border getWidestHorizontalBorder(int row, int start, int end) {
        return TableBorderUtil.getWidestBorder(getHorizontalBorder(row), start, end);
    }

    public List<Border> getFirstHorizontalBorder() {
        return getHorizontalBorder(this.startRow);
    }

    public List<Border> getLastHorizontalBorder() {
        return getHorizontalBorder(this.finishRow + 1);
    }

    public List<Border> getFirstVerticalBorder() {
        return getVerticalBorder(0);
    }

    public List<Border> getLastVerticalBorder() {
        return getVerticalBorder(this.verticalBorders.size() - 1);
    }

    public int getNumberOfColumns() {
        return this.numberOfColumns;
    }

    public int getStartRow() {
        return this.startRow;
    }

    public int getFinishRow() {
        return this.finishRow;
    }

    public Border[] getTableBoundingBorders() {
        return this.tableBoundingBorders;
    }

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
        for (int i3 = ((this.startRow + row) - rowspan) + 1; i3 < this.startRow + row + 1; i3++) {
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
        for (int i6 = ((this.startRow + row) - rowspan) + 1; i6 < this.startRow + row + 1; i6++) {
            Border border4 = borderList4.get(i6);
            if (border4 != null && border4.getWidth() > indents[3]) {
                indents[3] = border4.getWidth();
            }
        }
        return indents;
    }

    private void removeRows(int startRow, int numOfRows) {
        for (int row = startRow; row < startRow + numOfRows; row++) {
            this.rows.remove(startRow);
            this.horizontalBorders.remove(startRow + 1);
            for (int j = 0; j <= this.numberOfColumns; j++) {
                this.verticalBorders.get(j).remove(startRow + 1);
            }
        }
        int row2 = this.finishRow;
        setFinishRow(row2 - numOfRows);
    }

    private void updateRowspanForNextNonEmptyCellInEachColumn(int numOfRowsToRemove, int row) {
        int c = 0;
        while (c < this.numberOfColumns) {
            int r = row;
            CellRenderer[] cr = null;
            while (r < this.rows.size() && (cr == null || cr[c] == null)) {
                CellRenderer[] cr2 = this.rows.get(r);
                cr = cr2;
                r++;
            }
            if (cr != null && cr[c] != null) {
                CellRenderer cell = cr[c];
                int origRowspan = cell.getPropertyAsInteger(60).intValue();
                int spansToRestore = 0;
                if (row - numOfRowsToRemove < r - origRowspan) {
                    spansToRestore = (r - row) - 1;
                }
                int rowspan = origRowspan - numOfRowsToRemove;
                if (rowspan < 1) {
                    rowspan = 1;
                }
                cell.setProperty(60, Integer.valueOf(Math.min(rowspan + spansToRestore, origRowspan)));
                int colspan = cell.getPropertyAsInteger(16).intValue();
                c += colspan;
            } else {
                c++;
            }
        }
    }
}
