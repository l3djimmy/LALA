package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.ArrayUtil;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.BorderCollapsePropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlinx.coroutines.DebugKt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class TableWidths {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final UnitValue ZeroWidth = UnitValue.createPointValue(0.0f);
    private List<CellInfo> cells;
    private boolean fixedTableLayout = false;
    private boolean fixedTableWidth;
    private final float horizontalBorderSpacing;
    private float layoutMinWidth;
    private final float leftBorderMaxWidth;
    private final int numberOfColumns;
    private final float rightBorderMaxWidth;
    private float tableMaxWidth;
    private float tableMinWidth;
    private final TableRenderer tableRenderer;
    private float tableWidth;
    private final ColumnWidthData[] widths;

    /* JADX INFO: Access modifiers changed from: package-private */
    public TableWidths(TableRenderer tableRenderer, float availableWidth, boolean calculateTableMaxWidth, float rightBorderMaxWidth, float leftBorderMaxWidth) {
        this.tableRenderer = tableRenderer;
        this.numberOfColumns = ((Table) tableRenderer.getModelElement()).getNumberOfColumns();
        this.widths = new ColumnWidthData[this.numberOfColumns];
        this.rightBorderMaxWidth = rightBorderMaxWidth;
        this.leftBorderMaxWidth = leftBorderMaxWidth;
        if (tableRenderer.bordersHandler instanceof SeparatedTableBorders) {
            Float horizontalSpacing = tableRenderer.getPropertyAsFloat(Property.HORIZONTAL_BORDER_SPACING);
            this.horizontalBorderSpacing = horizontalSpacing != null ? horizontalSpacing.floatValue() : 0.0f;
        } else {
            this.horizontalBorderSpacing = 0.0f;
        }
        calculateTableWidth(availableWidth, calculateTableMaxWidth);
    }

    boolean hasFixedLayout() {
        return this.fixedTableLayout;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float[] layout() {
        if (hasFixedLayout()) {
            return fixedLayout();
        }
        return autoLayout();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getMinWidth() {
        return this.layoutMinWidth;
    }

    float[] autoLayout() {
        ColumnWidthData[] columnWidthDataArr;
        if (!this.tableRenderer.getTable().isComplete()) {
            throw new AssertionError();
        }
        fillAndSortCells();
        calculateMinMaxWidths();
        float minSum = 0.0f;
        for (ColumnWidthData width : this.widths) {
            minSum += width.min;
        }
        for (CellInfo cell : this.cells) {
            processCell(cell);
        }
        processColumns();
        recalculate(minSum);
        return extractWidths();
    }

    List<CellInfo> autoLayoutCustom() {
        if (!this.tableRenderer.getTable().isComplete()) {
            throw new AssertionError();
        }
        fillAndSortCells();
        calculateMinMaxWidths();
        return this.cells;
    }

    void processCell(CellInfo cell) {
        UnitValue cellWidth = getCellWidth(cell.getCell(), false);
        if (cellWidth != null) {
            if (cellWidth.getValue() <= 0.0f) {
                throw new AssertionError();
            }
            if (cellWidth.isPercentValue()) {
                if (cell.getColspan() == 1) {
                    this.widths[cell.getCol()].setPercents(cellWidth.getValue());
                    return;
                }
                int pointColumns = 0;
                float percentSum = 0.0f;
                for (int i = cell.getCol(); i < cell.getCol() + cell.getColspan(); i++) {
                    if (!this.widths[i].isPercent) {
                        pointColumns++;
                    } else {
                        percentSum += this.widths[i].width;
                    }
                }
                float percentAddition = cellWidth.getValue() - percentSum;
                if (percentAddition > 0.0f) {
                    if (pointColumns == 0) {
                        for (int i2 = cell.getCol(); i2 < cell.getCol() + cell.getColspan(); i2++) {
                            this.widths[i2].addPercents(percentAddition / cell.getColspan());
                        }
                        return;
                    }
                    for (int i3 = cell.getCol(); i3 < cell.getCol() + cell.getColspan(); i3++) {
                        if (!this.widths[i3].isPercent) {
                            this.widths[i3].setPercents(percentAddition / pointColumns);
                        }
                    }
                }
            } else if (cell.getColspan() == 1) {
                if (!this.widths[cell.getCol()].isPercent) {
                    int i4 = (this.widths[cell.getCol()].min > cellWidth.getValue() ? 1 : (this.widths[cell.getCol()].min == cellWidth.getValue() ? 0 : -1));
                    ColumnWidthData[] columnWidthDataArr = this.widths;
                    if (i4 <= 0) {
                        columnWidthDataArr[cell.getCol()].setPoints(cellWidth.getValue()).setFixed(true);
                    } else {
                        columnWidthDataArr[cell.getCol()].setPoints(this.widths[cell.getCol()].min);
                    }
                }
            } else {
                processCellsRemainWidth(cell, cellWidth);
            }
        } else if (this.widths[cell.getCol()].isFlexible()) {
            int flexibleCols = 0;
            float remainWidth = 0.0f;
            for (int i5 = cell.getCol(); i5 < cell.getCol() + cell.getColspan(); i5++) {
                if (this.widths[i5].isFlexible()) {
                    remainWidth += this.widths[i5].max - this.widths[i5].width;
                    flexibleCols++;
                }
            }
            if (remainWidth > 0.0f) {
                for (int i6 = cell.getCol(); i6 < cell.getCol() + cell.getColspan(); i6++) {
                    if (this.widths[i6].isFlexible()) {
                        this.widths[i6].addPoints(remainWidth / flexibleCols);
                    }
                }
            }
        }
    }

    void processColumns() {
        for (int i = 0; i < this.numberOfColumns; i++) {
            UnitValue colWidth = getTable().getColumnWidth(i);
            if (colWidth != null && colWidth.getValue() > 0.0f) {
                boolean isPercentValue = colWidth.isPercentValue();
                ColumnWidthData[] columnWidthDataArr = this.widths;
                if (isPercentValue) {
                    if (!columnWidthDataArr[i].isPercent) {
                        if (this.widths[i].isFixed && this.widths[i].width > this.widths[i].min) {
                            this.widths[i].max = this.widths[i].width;
                        }
                        this.widths[i].setPercents(colWidth.getValue());
                    }
                } else if (!columnWidthDataArr[i].isPercent && colWidth.getValue() >= this.widths[i].min) {
                    boolean z = this.widths[i].isFixed;
                    ColumnWidthData[] columnWidthDataArr2 = this.widths;
                    if (z) {
                        columnWidthDataArr2[i].setPoints(colWidth.getValue());
                    } else {
                        columnWidthDataArr2[i].resetPoints(colWidth.getValue()).setFixed(true);
                    }
                }
            }
        }
    }

    void recalculate(float minSum) {
        float f;
        float f2 = 0.0f;
        if (this.tableWidth - minSum < 0.0f) {
            for (int i = 0; i < this.numberOfColumns; i++) {
                this.widths[i].finalWidth = this.widths[i].min;
            }
            return;
        }
        float sumOfPercents = 0.0f;
        float minTableWidth = 0.0f;
        float totalNonPercent = 0.0f;
        for (int i2 = 0; i2 < this.widths.length; i2++) {
            if (this.widths[i2].isPercent) {
                if (sumOfPercents < 100.0f && this.widths[i2].width + sumOfPercents > 100.0f) {
                    this.widths[i2].width = 100.0f - sumOfPercents;
                    sumOfPercents += this.widths[i2].width;
                    warn100percent();
                } else {
                    int i3 = (sumOfPercents > 100.0f ? 1 : (sumOfPercents == 100.0f ? 0 : -1));
                    ColumnWidthData[] columnWidthDataArr = this.widths;
                    if (i3 >= 0) {
                        columnWidthDataArr[i2].resetPoints(this.widths[i2].min);
                        minTableWidth += this.widths[i2].min;
                        warn100percent();
                    } else {
                        sumOfPercents += columnWidthDataArr[i2].width;
                    }
                }
            } else {
                minTableWidth += this.widths[i2].min;
                totalNonPercent += this.widths[i2].width;
            }
        }
        int i4 = (sumOfPercents > 100.0f ? 1 : (sumOfPercents == 100.0f ? 0 : -1));
        if (i4 > 0) {
            throw new AssertionError();
        }
        boolean toBalance = true;
        if (!this.fixedTableWidth) {
            float tableWidthBasedOnPercents = sumOfPercents < 100.0f ? (totalNonPercent * 100.0f) / (100.0f - sumOfPercents) : 0.0f;
            for (int i5 = 0; i5 < this.numberOfColumns; i5++) {
                if (this.widths[i5].isPercent && this.widths[i5].width > 0.0f) {
                    tableWidthBasedOnPercents = Math.max((this.widths[i5].max * 100.0f) / this.widths[i5].width, tableWidthBasedOnPercents);
                }
            }
            if (tableWidthBasedOnPercents <= this.tableWidth) {
                if (tableWidthBasedOnPercents >= minTableWidth) {
                    this.tableWidth = tableWidthBasedOnPercents;
                    toBalance = false;
                } else {
                    this.tableWidth = minTableWidth;
                }
            }
        }
        if (sumOfPercents > 0.0f && sumOfPercents < 100.0f && totalNonPercent == 0.0f) {
            for (int i6 = 0; i6 < this.widths.length; i6++) {
                this.widths[i6].width = (this.widths[i6].width * 100.0f) / sumOfPercents;
            }
            sumOfPercents = 100.0f;
        }
        if (!toBalance) {
            for (int i7 = 0; i7 < this.numberOfColumns; i7++) {
                this.widths[i7].finalWidth = this.widths[i7].isPercent ? (this.tableWidth * this.widths[i7].width) / 100.0f : this.widths[i7].width;
            }
        } else if (sumOfPercents >= 100.0f) {
            float sumOfPercents2 = 100.0f;
            boolean recalculatePercents = false;
            float remainWidth = this.tableWidth - minTableWidth;
            for (int i8 = 0; i8 < this.numberOfColumns; i8++) {
                boolean z = this.widths[i8].isPercent;
                ColumnWidthData[] columnWidthDataArr2 = this.widths;
                if (z) {
                    int i9 = (((columnWidthDataArr2[i8].width * remainWidth) / 100.0f) > this.widths[i8].min ? 1 : (((columnWidthDataArr2[i8].width * remainWidth) / 100.0f) == this.widths[i8].min ? 0 : -1));
                    ColumnWidthData[] columnWidthDataArr3 = this.widths;
                    if (i9 >= 0) {
                        columnWidthDataArr3[i8].finalWidth = (this.widths[i8].width * remainWidth) / 100.0f;
                    } else {
                        columnWidthDataArr3[i8].finalWidth = this.widths[i8].min;
                        this.widths[i8].isPercent = false;
                        remainWidth -= this.widths[i8].min;
                        sumOfPercents2 -= this.widths[i8].width;
                        recalculatePercents = true;
                    }
                } else {
                    columnWidthDataArr2[i8].finalWidth = this.widths[i8].min;
                }
            }
            if (recalculatePercents) {
                for (int i10 = 0; i10 < this.numberOfColumns; i10++) {
                    if (this.widths[i10].isPercent) {
                        this.widths[i10].finalWidth = (this.widths[i10].width * remainWidth) / sumOfPercents2;
                    }
                }
            }
        } else {
            float totalPercent = 0.0f;
            float minTotalNonPercent = 0.0f;
            float fixedAddition = 0.0f;
            float flexibleAddition = 0.0f;
            boolean hasFlexibleCell = false;
            for (int i11 = 0; i11 < this.numberOfColumns; i11++) {
                if (this.widths[i11].isPercent) {
                    int i12 = (((this.tableWidth * this.widths[i11].width) / 100.0f) > this.widths[i11].min ? 1 : (((this.tableWidth * this.widths[i11].width) / 100.0f) == this.widths[i11].min ? 0 : -1));
                    ColumnWidthData[] columnWidthDataArr4 = this.widths;
                    if (i12 >= 0) {
                        columnWidthDataArr4[i11].finalWidth = (this.tableWidth * this.widths[i11].width) / 100.0f;
                        totalPercent += this.widths[i11].finalWidth;
                    } else {
                        sumOfPercents -= columnWidthDataArr4[i11].width;
                        this.widths[i11].resetPoints(this.widths[i11].min);
                        this.widths[i11].finalWidth = this.widths[i11].min;
                        minTotalNonPercent += this.widths[i11].min;
                    }
                } else {
                    this.widths[i11].finalWidth = this.widths[i11].min;
                    minTotalNonPercent += this.widths[i11].min;
                    float addition = this.widths[i11].width - this.widths[i11].min;
                    if (this.widths[i11].isFixed) {
                        fixedAddition += addition;
                    } else {
                        flexibleAddition += addition;
                        hasFlexibleCell = true;
                    }
                }
            }
            int i13 = ((totalPercent + minTotalNonPercent) > this.tableWidth ? 1 : ((totalPercent + minTotalNonPercent) == this.tableWidth ? 0 : -1));
            float f3 = this.tableWidth;
            if (i13 > 0) {
                float extraWidth = f3 - minTotalNonPercent;
                if (sumOfPercents > 0.0f) {
                    for (int i14 = 0; i14 < this.numberOfColumns; i14++) {
                        if (this.widths[i14].isPercent) {
                            this.widths[i14].finalWidth = (this.widths[i14].width * extraWidth) / sumOfPercents;
                        }
                    }
                    return;
                }
                return;
            }
            float extraWidth2 = (f3 - totalPercent) - minTotalNonPercent;
            if (fixedAddition > 0.0f && (extraWidth2 < fixedAddition || !hasFlexibleCell)) {
                for (int i15 = 0; i15 < this.numberOfColumns; i15++) {
                    if (this.widths[i15].isFixed) {
                        this.widths[i15].finalWidth += ((this.widths[i15].width - this.widths[i15].min) * extraWidth2) / fixedAddition;
                    }
                }
                return;
            }
            float extraWidth3 = extraWidth2 - fixedAddition;
            if (extraWidth3 < flexibleAddition) {
                for (int i16 = 0; i16 < this.numberOfColumns; i16++) {
                    boolean z2 = this.widths[i16].isFixed;
                    ColumnWidthData[] columnWidthDataArr5 = this.widths;
                    if (z2) {
                        columnWidthDataArr5[i16].finalWidth = this.widths[i16].width;
                    } else if (!columnWidthDataArr5[i16].isPercent) {
                        this.widths[i16].finalWidth += ((this.widths[i16].width - this.widths[i16].min) * extraWidth3) / flexibleAddition;
                    }
                }
                return;
            }
            float totalFixed = 0.0f;
            float totalFlexible = 0.0f;
            float flexibleCount = 0.0f;
            int i17 = 0;
            while (true) {
                f = f2;
                if (i17 >= this.numberOfColumns) {
                    break;
                }
                boolean z3 = this.widths[i17].isFixed;
                float sumOfPercents3 = sumOfPercents;
                ColumnWidthData[] columnWidthDataArr6 = this.widths;
                if (z3) {
                    columnWidthDataArr6[i17].finalWidth = this.widths[i17].width;
                    totalFixed += this.widths[i17].width;
                } else if (!columnWidthDataArr6[i17].isPercent) {
                    totalFlexible += this.widths[i17].width;
                    flexibleCount += 1.0f;
                }
                i17++;
                f2 = f;
                sumOfPercents = sumOfPercents3;
            }
            if (totalFlexible <= f && flexibleCount <= f) {
                throw new AssertionError();
            }
            float extraWidth4 = (this.tableWidth - totalPercent) - totalFixed;
            for (int i18 = 0; i18 < this.numberOfColumns; i18++) {
                if (!this.widths[i18].isPercent && !this.widths[i18].isFixed) {
                    this.widths[i18].finalWidth = totalFlexible > f ? (this.widths[i18].width * extraWidth4) / totalFlexible : extraWidth4 / flexibleCount;
                }
            }
        }
    }

    void processCellsRemainWidth(CellInfo cell, UnitValue cellWidth) {
        int flexibleCols = 0;
        float remainWidth = cellWidth.getValue();
        int i = cell.getCol();
        while (true) {
            if (i >= cell.getCol() + cell.getColspan()) {
                break;
            } else if (!this.widths[i].isPercent) {
                remainWidth -= this.widths[i].width;
                if (!this.widths[i].isFixed) {
                    flexibleCols++;
                }
                i++;
            } else {
                remainWidth = 0.0f;
                break;
            }
        }
        if (remainWidth > 0.0f) {
            int[] flexibleColIndexes = ArrayUtil.fillWithValue(new int[cell.getColspan()], -1);
            if (flexibleCols > 0) {
                for (int i2 = cell.getCol(); i2 < cell.getCol() + cell.getColspan(); i2++) {
                    if (this.widths[i2].isFlexible()) {
                        if (this.widths[i2].min > this.widths[i2].width + (remainWidth / flexibleCols)) {
                            this.widths[i2].resetPoints(this.widths[i2].min);
                            remainWidth -= this.widths[i2].min - this.widths[i2].width;
                            flexibleCols--;
                            if (flexibleCols == 0 || remainWidth <= 0.0f) {
                                break;
                            }
                        } else {
                            flexibleColIndexes[i2 - cell.getCol()] = i2;
                        }
                    }
                }
                if (flexibleCols > 0 && remainWidth > 0.0f) {
                    for (int i3 = 0; i3 < flexibleColIndexes.length; i3++) {
                        if (flexibleColIndexes[i3] >= 0) {
                            this.widths[flexibleColIndexes[i3]].addPoints(remainWidth / flexibleCols).setFixed(true);
                        }
                    }
                    return;
                }
                return;
            }
            for (int i4 = cell.getCol(); i4 < cell.getCol() + cell.getColspan(); i4++) {
                this.widths[i4].addPoints(remainWidth / cell.getColspan());
            }
        }
    }

    float[] fixedLayout() {
        float f;
        CellRenderer[] firtsRow;
        float f2;
        float f3;
        float width;
        float[] columnWidths = new float[this.numberOfColumns];
        int i = 0;
        while (true) {
            f = 100.0f;
            if (i >= this.numberOfColumns) {
                break;
            }
            UnitValue colWidth = getTable().getColumnWidth(i);
            if (colWidth == null || colWidth.getValue() < 0.0f) {
                columnWidths[i] = -1.0f;
            } else if (colWidth.isPercentValue()) {
                columnWidths[i] = (colWidth.getValue() * this.tableWidth) / 100.0f;
            } else {
                columnWidths[i] = colWidth.getValue();
            }
            i++;
        }
        int processedColumns = 0;
        float remainWidth = this.tableWidth;
        if (this.tableRenderer.headerRenderer != null && this.tableRenderer.headerRenderer.rows.size() > 0) {
            firtsRow = this.tableRenderer.headerRenderer.rows.get(0);
        } else if (this.tableRenderer.rows.size() > 0 && getTable().isComplete() && getTable().getLastRowBottomBorder().size() == 0) {
            firtsRow = this.tableRenderer.rows.get(0);
        } else {
            firtsRow = null;
        }
        float[] columnWidthIfPercent = new float[columnWidths.length];
        for (int i2 = 0; i2 < columnWidthIfPercent.length; i2++) {
            columnWidthIfPercent[i2] = -1.0f;
        }
        float sumOfPercents = 0.0f;
        if (firtsRow == null || !getTable().isComplete() || !getTable().getLastRowBottomBorder().isEmpty()) {
            f2 = 100.0f;
            for (int i3 = 0; i3 < this.numberOfColumns; i3++) {
                if (columnWidths[i3] != -1.0f) {
                    processedColumns++;
                    remainWidth -= columnWidths[i3];
                }
            }
        } else {
            int i4 = 0;
            while (i4 < this.numberOfColumns) {
                if (columnWidths[i4] == -1.0f) {
                    CellRenderer cell = firtsRow[i4];
                    if (cell != null) {
                        UnitValue cellWidth = getCellWidth(cell, true);
                        if (cellWidth == null) {
                            f3 = f;
                        } else if (cellWidth.getValue() < 0.0f) {
                            throw new AssertionError();
                        } else {
                            if (cellWidth.isPercentValue()) {
                                width = (this.tableWidth * cellWidth.getValue()) / f;
                                float width2 = cellWidth.getValue();
                                columnWidthIfPercent[i4] = width2;
                                sumOfPercents += columnWidthIfPercent[i4];
                            } else {
                                width = cellWidth.getValue();
                            }
                            int colspan = ((Cell) cell.getModelElement()).getColspan();
                            int j = 0;
                            while (j < colspan) {
                                columnWidths[i4 + j] = width / colspan;
                                j++;
                                f = f;
                            }
                            f3 = f;
                            remainWidth -= columnWidths[i4];
                            processedColumns++;
                        }
                    } else {
                        f3 = f;
                    }
                } else {
                    f3 = f;
                    remainWidth -= columnWidths[i4];
                    processedColumns++;
                }
                i4++;
                f = f3;
            }
            f2 = f;
        }
        int i5 = (sumOfPercents > f2 ? 1 : (sumOfPercents == f2 ? 0 : -1));
        if (i5 > 0) {
            warn100percent();
        }
        if (remainWidth > 0.0f) {
            if (this.numberOfColumns == processedColumns) {
                for (int i6 = 0; i6 < this.numberOfColumns; i6++) {
                    columnWidths[i6] = (this.tableWidth * columnWidths[i6]) / (this.tableWidth - remainWidth);
                }
            }
        } else if (remainWidth < 0.0f) {
            for (int i7 = 0; i7 < this.numberOfColumns; i7++) {
                columnWidths[i7] = columnWidths[i7] + (-1.0f != columnWidthIfPercent[i7] ? (columnWidthIfPercent[i7] * remainWidth) / sumOfPercents : 0.0f);
            }
        }
        for (int i8 = 0; i8 < this.numberOfColumns; i8++) {
            if (columnWidths[i8] == -1.0f) {
                columnWidths[i8] = Math.max(0.0f, remainWidth / (this.numberOfColumns - processedColumns));
            }
        }
        if (this.tableRenderer.bordersHandler instanceof SeparatedTableBorders) {
            for (int i9 = 0; i9 < this.numberOfColumns; i9++) {
                columnWidths[i9] = columnWidths[i9] + this.horizontalBorderSpacing;
            }
        }
        return columnWidths;
    }

    private void calculateTableWidth(float availableWidth, boolean calculateTableMaxWidth) {
        this.fixedTableLayout = "fixed".equals(((String) this.tableRenderer.getProperty(93, DebugKt.DEBUG_PROPERTY_VALUE_AUTO)).toLowerCase());
        UnitValue width = (UnitValue) this.tableRenderer.getProperty(77);
        if (this.fixedTableLayout && width != null && width.getValue() >= 0.0f) {
            if (getTable().getLastRowBottomBorder().size() != 0) {
                width = getTable().getWidth();
            } else if (!getTable().isComplete() && getTable().getWidth() != null && getTable().getWidth().isPercentValue()) {
                getTable().setWidth(this.tableRenderer.retrieveUnitValue(availableWidth, 77).floatValue());
            }
            this.fixedTableWidth = true;
            this.tableWidth = retrieveTableWidth(width, availableWidth).floatValue();
            this.layoutMinWidth = width.isPercentValue() ? 0.0f : this.tableWidth;
        } else {
            this.fixedTableLayout = false;
            this.layoutMinWidth = -1.0f;
            if (calculateTableMaxWidth) {
                this.fixedTableWidth = false;
                this.tableWidth = retrieveTableWidth(availableWidth);
            } else if (width != null && width.getValue() >= 0.0f) {
                this.fixedTableWidth = true;
                this.tableWidth = retrieveTableWidth(width, availableWidth).floatValue();
            } else {
                this.fixedTableWidth = false;
                this.tableWidth = retrieveTableWidth(availableWidth);
            }
        }
        Float min = retrieveTableWidth((UnitValue) this.tableRenderer.getProperty(80), availableWidth);
        Float max = retrieveTableWidth((UnitValue) this.tableRenderer.getProperty(79), availableWidth);
        this.tableMinWidth = min != null ? min.floatValue() : this.layoutMinWidth;
        this.tableMaxWidth = max != null ? max.floatValue() : this.tableWidth;
        if (this.tableMinWidth > this.tableMaxWidth) {
            this.tableMaxWidth = this.tableMinWidth;
        }
        if (this.tableMinWidth > this.tableWidth) {
            this.tableWidth = this.tableMinWidth;
        }
        if (this.tableMaxWidth < this.tableWidth) {
            this.tableWidth = this.tableMaxWidth;
        }
    }

    private Float retrieveTableWidth(UnitValue width, float availableWidth) {
        float value;
        if (width == null) {
            return null;
        }
        if (width.isPercentValue()) {
            value = (width.getValue() * availableWidth) / 100.0f;
        } else {
            value = width.getValue();
        }
        return Float.valueOf(retrieveTableWidth(value));
    }

    private float retrieveTableWidth(float width) {
        float width2;
        boolean equals = BorderCollapsePropertyValue.SEPARATE.equals(this.tableRenderer.getProperty(Property.BORDER_COLLAPSE));
        float f = this.rightBorderMaxWidth;
        if (equals) {
            width2 = (width - (f + this.leftBorderMaxWidth)) - ((this.numberOfColumns + 1) * this.horizontalBorderSpacing);
        } else {
            width2 = width - ((f + this.leftBorderMaxWidth) / 2.0f);
        }
        return Math.max(width2, 0.0f);
    }

    private Table getTable() {
        return (Table) this.tableRenderer.getModelElement();
    }

    private void calculateMinMaxWidths() {
        float[] minWidths = new float[this.numberOfColumns];
        float[] maxWidths = new float[this.numberOfColumns];
        for (CellInfo cell : this.cells) {
            cell.setParent(this.tableRenderer);
            MinMaxWidth minMax = cell.getCell().getMinMaxWidth();
            if (BorderCollapsePropertyValue.SEPARATE.equals(this.tableRenderer.getProperty(Property.BORDER_COLLAPSE))) {
                minMax.setAdditionalWidth(minMax.getAdditionalWidth() - this.horizontalBorderSpacing);
            } else {
                float[] indents = getCellBorderIndents(cell);
                minMax.setAdditionalWidth(minMax.getAdditionalWidth() + (indents[1] / 2.0f) + (indents[3] / 2.0f));
            }
            if (cell.getColspan() == 1) {
                minWidths[cell.getCol()] = Math.max(minMax.getMinWidth(), minWidths[cell.getCol()]);
                maxWidths[cell.getCol()] = Math.max(minMax.getMaxWidth(), maxWidths[cell.getCol()]);
            } else {
                float remainMin = minMax.getMinWidth();
                float remainMax = minMax.getMaxWidth();
                for (int i = cell.getCol(); i < cell.getCol() + cell.getColspan(); i++) {
                    remainMin -= minWidths[i];
                    remainMax -= maxWidths[i];
                }
                if (remainMin > 0.0f) {
                    for (int i2 = cell.getCol(); i2 < cell.getCol() + cell.getColspan(); i2++) {
                        minWidths[i2] = minWidths[i2] + (remainMin / cell.getColspan());
                    }
                }
                if (remainMax > 0.0f) {
                    for (int i3 = cell.getCol(); i3 < cell.getCol() + cell.getColspan(); i3++) {
                        maxWidths[i3] = maxWidths[i3] + (remainMax / cell.getColspan());
                    }
                }
            }
        }
        for (int i4 = 0; i4 < this.widths.length; i4++) {
            this.widths[i4] = new ColumnWidthData(minWidths[i4], maxWidths[i4]);
        }
    }

    private float[] getCellBorderIndents(CellInfo cell) {
        TableRenderer renderer;
        if (cell.region == 1) {
            renderer = this.tableRenderer.headerRenderer;
        } else if (cell.region == 3) {
            renderer = this.tableRenderer.footerRenderer;
        } else {
            renderer = this.tableRenderer;
        }
        return renderer.bordersHandler.getCellBorderIndents(cell.getRow(), cell.getCol(), cell.getRowspan(), cell.getColspan());
    }

    private void fillAndSortCells() {
        this.cells = new ArrayList();
        if (this.tableRenderer.headerRenderer != null) {
            fillRendererCells(this.tableRenderer.headerRenderer, (byte) 1);
        }
        fillRendererCells(this.tableRenderer, (byte) 2);
        if (this.tableRenderer.footerRenderer != null) {
            fillRendererCells(this.tableRenderer.footerRenderer, (byte) 3);
        }
        Collections.sort(this.cells);
    }

    private void fillRendererCells(TableRenderer renderer, byte region) {
        for (int row = 0; row < renderer.rows.size(); row++) {
            for (int col = 0; col < this.numberOfColumns; col++) {
                CellRenderer cell = renderer.rows.get(row)[col];
                if (cell != null) {
                    this.cells.add(new CellInfo(cell, row, col, region));
                }
            }
        }
    }

    private void warn100percent() {
        Logger logger = LoggerFactory.getLogger(TableWidths.class);
        logger.warn(IoLogMessageConstant.SUM_OF_TABLE_COLUMNS_IS_GREATER_THAN_100);
    }

    private float[] extractWidths() {
        float actualWidth = 0.0f;
        this.layoutMinWidth = 0.0f;
        float[] columnWidths = new float[this.widths.length];
        for (int i = 0; i < this.widths.length; i++) {
            if (this.widths[i].finalWidth < 0.0f) {
                throw new AssertionError();
            }
            columnWidths[i] = this.widths[i].finalWidth + this.horizontalBorderSpacing;
            actualWidth += this.widths[i].finalWidth;
            this.layoutMinWidth += this.widths[i].min + this.horizontalBorderSpacing;
        }
        if (actualWidth > this.tableWidth + (MinMaxWidthUtils.getEps() * this.widths.length)) {
            Logger logger = LoggerFactory.getLogger(TableWidths.class);
            logger.warn(IoLogMessageConstant.TABLE_WIDTH_IS_MORE_THAN_EXPECTED_DUE_TO_MIN_WIDTH);
        }
        return columnWidths;
    }

    public String toString() {
        return "width=" + this.tableWidth + (this.fixedTableWidth ? "!!" : "");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ColumnWidthData {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        float max;
        final float min;
        float width = 0.0f;
        float finalWidth = -1.0f;
        boolean isPercent = false;
        boolean isFixed = false;

        ColumnWidthData(float min, float max) {
            if (min < 0.0f) {
                throw new AssertionError();
            }
            if (max < 0.0f) {
                throw new AssertionError();
            }
            this.min = min > 0.0f ? MinMaxWidthUtils.getEps() + min : 0.0f;
            this.max = max > 0.0f ? Math.min(MinMaxWidthUtils.getEps() + max, 32760.0f) : 0.0f;
        }

        ColumnWidthData setPoints(float width) {
            if (this.isPercent) {
                throw new AssertionError();
            }
            if (this.min > width) {
                throw new AssertionError();
            }
            this.width = Math.max(this.width, width);
            return this;
        }

        ColumnWidthData resetPoints(float width) {
            if (this.min > width) {
                throw new AssertionError();
            }
            this.width = width;
            this.isPercent = false;
            return this;
        }

        ColumnWidthData addPoints(float width) {
            if (this.isPercent) {
                throw new AssertionError();
            }
            this.width += width;
            return this;
        }

        ColumnWidthData setPercents(float percent) {
            if (this.isPercent) {
                this.width = Math.max(this.width, percent);
            } else {
                this.isPercent = true;
                this.width = percent;
            }
            this.isFixed = false;
            return this;
        }

        ColumnWidthData addPercents(float width) {
            if (!this.isPercent) {
                throw new AssertionError();
            }
            this.width += width;
            return this;
        }

        ColumnWidthData setFixed(boolean fixed) {
            this.isFixed = fixed;
            return this;
        }

        boolean isFlexible() {
            return (this.isFixed || this.isPercent) ? false : true;
        }

        public String toString() {
            return "w=" + this.width + (this.isPercent ? "%" : "pt") + (this.isFixed ? " !!" : "") + ", min=" + this.min + ", max=" + this.max + ", finalWidth=" + this.finalWidth;
        }
    }

    private UnitValue getCellWidth(CellRenderer cell, boolean zeroIsValid) {
        float width;
        float width2;
        UnitValue widthValue = new UnitValue((UnitValue) cell.getProperty(77, UnitValue.createPointValue(-1.0f)));
        if (widthValue.getValue() < -1.0E-4f) {
            return null;
        }
        if (widthValue.getValue() < 1.0E-4f) {
            if (zeroIsValid) {
                return ZeroWidth;
            }
            return null;
        } else if (widthValue.isPercentValue()) {
            return widthValue;
        } else {
            UnitValue widthValue2 = resolveMinMaxCollision(cell, widthValue);
            if (!AbstractRenderer.isBorderBoxSizing(cell)) {
                Border[] borders = cell.getBorders();
                if (borders[1] != null) {
                    float value = widthValue2.getValue();
                    if (this.tableRenderer.bordersHandler instanceof SeparatedTableBorders) {
                        width2 = borders[1].getWidth();
                    } else {
                        width2 = borders[1].getWidth() / 2.0f;
                    }
                    widthValue2.setValue(value + width2);
                }
                if (borders[3] != null) {
                    float value2 = widthValue2.getValue();
                    if (this.tableRenderer.bordersHandler instanceof SeparatedTableBorders) {
                        width = borders[3].getWidth();
                    } else {
                        width = borders[3].getWidth() / 2.0f;
                    }
                    widthValue2.setValue(value2 + width);
                }
                UnitValue[] paddings = cell.getPaddings();
                if (!paddings[1].isPointValue()) {
                    Logger logger = LoggerFactory.getLogger(TableWidths.class);
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 48));
                }
                if (!paddings[3].isPointValue()) {
                    Logger logger2 = LoggerFactory.getLogger(TableWidths.class);
                    logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 49));
                }
                widthValue2.setValue(widthValue2.getValue() + paddings[1].getValue() + paddings[3].getValue());
            }
            return widthValue2;
        }
    }

    private UnitValue resolveMinMaxCollision(CellRenderer cell, UnitValue widthValue) {
        if (!widthValue.isPointValue()) {
            throw new AssertionError();
        }
        UnitValue minWidthValue = (UnitValue) cell.getProperty(80);
        if (minWidthValue != null && minWidthValue.isPointValue() && minWidthValue.getValue() > widthValue.getValue()) {
            return minWidthValue;
        }
        UnitValue maxWidthValue = (UnitValue) cell.getProperty(79);
        if (maxWidthValue != null && maxWidthValue.isPointValue() && maxWidthValue.getValue() < widthValue.getValue()) {
            return maxWidthValue;
        }
        return widthValue;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class CellInfo implements Comparable<CellInfo> {
        static final byte BODY = 2;
        static final byte FOOTER = 3;
        static final byte HEADER = 1;
        private final CellRenderer cell;
        private final int col;
        final byte region;
        private final int row;

        CellInfo(CellRenderer cell, int row, int col, byte region) {
            this.cell = cell;
            this.region = region;
            this.row = row;
            this.col = col;
        }

        CellRenderer getCell() {
            return this.cell;
        }

        int getCol() {
            return this.col;
        }

        int getColspan() {
            return this.cell.getPropertyAsInteger(16).intValue();
        }

        int getRow() {
            return this.row;
        }

        int getRowspan() {
            return this.cell.getPropertyAsInteger(60).intValue();
        }

        @Override // java.lang.Comparable
        public int compareTo(CellInfo o) {
            int i;
            int i2;
            if ((getColspan() == 1) ^ (o.getColspan() == 1)) {
                return getColspan() - o.getColspan();
            }
            if (this.region == o.region && getRow() == o.getRow()) {
                return ((getCol() + getColspan()) - o.getCol()) - o.getColspan();
            }
            if (this.region == o.region) {
                i = getRow();
                i2 = o.getRow();
            } else {
                i = this.region;
                i2 = o.region;
            }
            return i - i2;
        }

        public String toString() {
            String str = MessageFormatUtil.format("row={0}, col={1}, rowspan={2}, colspan={3}, ", Integer.valueOf(getRow()), Integer.valueOf(getCol()), Integer.valueOf(getRowspan()), Integer.valueOf(getColspan()));
            if (this.region == 1) {
                return str + "header";
            }
            if (this.region == 2) {
                return str + "body";
            }
            if (this.region == 3) {
                return str + "footer";
            }
            return str;
        }

        public void setParent(TableRenderer tableRenderer) {
            if (this.region == 1) {
                this.cell.setParent(tableRenderer.headerRenderer);
                return;
            }
            byte b = this.region;
            CellRenderer cellRenderer = this.cell;
            if (b == 3) {
                cellRenderer.setParent(tableRenderer.footerRenderer);
            } else {
                cellRenderer.setParent(tableRenderer);
            }
        }
    }
}
