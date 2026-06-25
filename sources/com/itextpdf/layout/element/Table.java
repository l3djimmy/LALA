package com.itextpdf.layout.element;

import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties;
import com.itextpdf.kernel.pdf.tagutils.DefaultAccessibilityProperties;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.properties.BorderCollapsePropertyValue;
import com.itextpdf.layout.properties.CaptionSide;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.TableRenderer;
import java.util.ArrayList;
import kotlinx.coroutines.DebugKt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class Table extends BlockElement<Table> implements ILargeElement {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private Div caption;
    private UnitValue[] columnWidths;
    private int currentColumn;
    private int currentRow;
    private Document document;
    private Table footer;
    private Table header;
    private boolean isComplete;
    private Cell[] lastAddedRow;
    private java.util.List<RowRange> lastAddedRowGroups;
    private int rowWindowStart;
    private java.util.List<Cell[]> rows;
    private boolean skipFirstHeader;
    private boolean skipLastFooter;
    protected DefaultAccessibilityProperties tagProperties;

    public Table(float[] columnWidths, boolean largeTable) {
        this.currentColumn = 0;
        this.currentRow = -1;
        this.rowWindowStart = 0;
        if (columnWidths == null) {
            throw new IllegalArgumentException("The widths array in table constructor can not be null.");
        }
        if (columnWidths.length == 0) {
            throw new IllegalArgumentException("The widths array in table constructor can not have zero length.");
        }
        this.columnWidths = normalizeColumnWidths(columnWidths);
        initializeLargeTable(largeTable);
        initializeRows();
    }

    public Table(UnitValue[] columnWidths, boolean largeTable) {
        this.currentColumn = 0;
        this.currentRow = -1;
        this.rowWindowStart = 0;
        if (columnWidths == null) {
            throw new IllegalArgumentException("The widths array in table constructor can not be null.");
        }
        if (columnWidths.length == 0) {
            throw new IllegalArgumentException("The widths array in table constructor can not have zero length.");
        }
        this.columnWidths = normalizeColumnWidths(columnWidths);
        initializeLargeTable(largeTable);
        initializeRows();
    }

    public Table(UnitValue[] columnWidths) {
        this(columnWidths, false);
    }

    public Table(float[] pointColumnWidths) {
        this(pointColumnWidths, false);
    }

    public Table(int numColumns, boolean largeTable) {
        this.currentColumn = 0;
        this.currentRow = -1;
        this.rowWindowStart = 0;
        if (numColumns <= 0) {
            throw new IllegalArgumentException("The number of columns in Table constructor must be greater than zero");
        }
        this.columnWidths = normalizeColumnWidths(numColumns);
        initializeLargeTable(largeTable);
        initializeRows();
    }

    public Table(int numColumns) {
        this(numColumns, false);
    }

    public Table setFixedLayout() {
        setProperty(93, "fixed");
        return this;
    }

    public Table setAutoLayout() {
        setProperty(93, DebugKt.DEBUG_PROPERTY_VALUE_AUTO);
        return this;
    }

    public Table useAllAvailableWidth() {
        setProperty(77, UnitValue.createPercentValue(100.0f));
        return this;
    }

    public UnitValue getColumnWidth(int column) {
        return this.columnWidths[column];
    }

    public int getNumberOfColumns() {
        return this.columnWidths.length;
    }

    public int getNumberOfRows() {
        return this.rows.size();
    }

    public Table addHeaderCell(Cell headerCell) {
        ensureHeaderIsInitialized();
        this.header.addCell(headerCell);
        return this;
    }

    public <T extends IElement> Table addHeaderCell(BlockElement<T> blockElement) {
        ensureHeaderIsInitialized();
        this.header.addCell(blockElement);
        return this;
    }

    public Table addHeaderCell(Image image) {
        ensureHeaderIsInitialized();
        this.header.addCell(image);
        return this;
    }

    public Table addHeaderCell(String content) {
        ensureHeaderIsInitialized();
        this.header.addCell(content);
        return this;
    }

    public Table getHeader() {
        return this.header;
    }

    public Table addFooterCell(Cell footerCell) {
        ensureFooterIsInitialized();
        this.footer.addCell(footerCell);
        return this;
    }

    public <T extends IElement> Table addFooterCell(BlockElement<T> blockElement) {
        ensureFooterIsInitialized();
        this.footer.addCell(blockElement);
        return this;
    }

    public Table addFooterCell(Image image) {
        ensureFooterIsInitialized();
        this.footer.addCell(image);
        return this;
    }

    public Table addFooterCell(String content) {
        ensureFooterIsInitialized();
        this.footer.addCell(content);
        return this;
    }

    public Table getFooter() {
        return this.footer;
    }

    public boolean isSkipFirstHeader() {
        return this.skipFirstHeader;
    }

    public Table setSkipFirstHeader(boolean skipFirstHeader) {
        this.skipFirstHeader = skipFirstHeader;
        return this;
    }

    public boolean isSkipLastFooter() {
        return this.skipLastFooter;
    }

    public Table setSkipLastFooter(boolean skipLastFooter) {
        this.skipLastFooter = skipLastFooter;
        return this;
    }

    public Table setCaption(Div caption) {
        this.caption = caption;
        if (caption != null) {
            ensureCaptionPropertiesAreSet();
        }
        return this;
    }

    public Table setCaption(Div caption, CaptionSide side) {
        if (caption != null) {
            caption.setProperty(Property.CAPTION_SIDE, side);
        }
        setCaption(caption);
        return this;
    }

    private void ensureCaptionPropertiesAreSet() {
        this.caption.getAccessibilityProperties().setRole(StandardRoles.CAPTION);
    }

    public Div getCaption() {
        return this.caption;
    }

    public Table startNewRow() {
        this.currentColumn = 0;
        this.currentRow++;
        if (this.currentRow >= this.rows.size()) {
            this.rows.add(new Cell[this.columnWidths.length]);
        }
        return this;
    }

    public Table addCell(Cell cell) {
        if (this.isComplete && this.lastAddedRow != null) {
            throw new PdfException(LayoutExceptionMessageConstant.CANNOT_ADD_CELL_TO_COMPLETED_LARGE_TABLE);
        }
        while (true) {
            if (this.currentColumn >= this.columnWidths.length || this.currentColumn == -1) {
                startNewRow();
            }
            if (this.rows.get(this.currentRow - this.rowWindowStart)[this.currentColumn] == null) {
                break;
            }
            this.currentColumn++;
        }
        this.childElements.add(cell);
        cell.updateCellIndexes(this.currentRow, this.currentColumn, this.columnWidths.length);
        while ((this.currentRow - this.rowWindowStart) + cell.getRowspan() > this.rows.size()) {
            this.rows.add(new Cell[this.columnWidths.length]);
        }
        for (int i = this.currentRow; i < this.currentRow + cell.getRowspan(); i++) {
            Cell[] row = this.rows.get(i - this.rowWindowStart);
            for (int j = this.currentColumn; j < this.currentColumn + cell.getColspan(); j++) {
                if (row[j] == null) {
                    row[j] = cell;
                }
            }
        }
        int i2 = this.currentColumn;
        this.currentColumn = i2 + cell.getColspan();
        return this;
    }

    public <T extends IElement> Table addCell(BlockElement<T> blockElement) {
        return addCell(new Cell().add(blockElement));
    }

    public Table addCell(Image image) {
        return addCell(new Cell().add(image));
    }

    public Table addCell(String content) {
        return addCell(new Cell().add(new Paragraph(content)));
    }

    public Cell getCell(int row, int column) {
        Cell cell;
        if (row - this.rowWindowStart < this.rows.size() && (cell = this.rows.get(row - this.rowWindowStart)[column]) != null && cell.getRow() == row && cell.getCol() == column) {
            return cell;
        }
        return null;
    }

    @Override // com.itextpdf.layout.element.AbstractElement, com.itextpdf.layout.element.IElement
    public IRenderer createRendererSubTree() {
        TableRenderer rendererRoot = (TableRenderer) getRenderer();
        for (IElement child : this.childElements) {
            boolean childShouldBeAdded = this.isComplete || cellBelongsToAnyRowGroup((Cell) child, this.lastAddedRowGroups);
            if (childShouldBeAdded) {
                rendererRoot.addChild(child.createRendererSubTree());
            }
        }
        return rendererRoot;
    }

    @Override // com.itextpdf.layout.element.AbstractElement, com.itextpdf.layout.element.IElement
    public IRenderer getRenderer() {
        if (this.nextRenderer != null) {
            if (this.nextRenderer instanceof TableRenderer) {
                IRenderer renderer = this.nextRenderer;
                this.nextRenderer = this.nextRenderer.getNextRenderer();
                return renderer;
            }
            Logger logger = LoggerFactory.getLogger(Table.class);
            logger.error("Invalid renderer for Table: must be inherited from TableRenderer");
        }
        if (this.isComplete) {
            if (this.lastAddedRow != null && this.rows.size() != 0) {
                java.util.List<RowRange> allRows = new ArrayList<>();
                allRows.add(new RowRange(this.rowWindowStart, (this.rowWindowStart + this.rows.size()) - 1));
                this.lastAddedRowGroups = allRows;
            }
        } else {
            this.lastAddedRowGroups = getRowGroups();
        }
        if (this.isComplete) {
            return new TableRenderer(this, new RowRange(this.rowWindowStart, (this.rowWindowStart + this.rows.size()) - 1));
        }
        int rowWindowFinish = this.lastAddedRowGroups.size() != 0 ? this.lastAddedRowGroups.get(this.lastAddedRowGroups.size() - 1).finishRow : -1;
        return new TableRenderer(this, new RowRange(this.rowWindowStart, rowWindowFinish));
    }

    @Override // com.itextpdf.layout.element.ILargeElement
    public boolean isComplete() {
        return this.isComplete;
    }

    @Override // com.itextpdf.layout.element.ILargeElement
    public void complete() {
        if (this.isComplete) {
            throw new AssertionError();
        }
        this.isComplete = true;
        flush();
    }

    @Override // com.itextpdf.layout.element.ILargeElement
    public void flush() {
        Cell[] row = null;
        int rowNum = this.rows.size();
        if (!this.rows.isEmpty()) {
            Cell[] row2 = this.rows.get(this.rows.size() - 1);
            row = row2;
        }
        this.document.add((IBlockElement) this);
        if (row != null && rowNum != this.rows.size()) {
            this.lastAddedRow = row;
        }
    }

    @Override // com.itextpdf.layout.element.ILargeElement
    public void flushContent() {
        if (this.lastAddedRowGroups == null || this.lastAddedRowGroups.isEmpty()) {
            return;
        }
        int firstRow = this.lastAddedRowGroups.get(0).startRow;
        int lastRow = this.lastAddedRowGroups.get(this.lastAddedRowGroups.size() - 1).finishRow;
        java.util.List<IElement> toRemove = new ArrayList<>();
        for (IElement cell : this.childElements) {
            if (((Cell) cell).getRow() >= firstRow && ((Cell) cell).getRow() <= lastRow) {
                toRemove.add(cell);
            }
        }
        this.childElements.removeAll(toRemove);
        int i = 0;
        while (true) {
            int i2 = lastRow - firstRow;
            java.util.List<Cell[]> list = this.rows;
            if (i < i2) {
                list.remove(firstRow - this.rowWindowStart);
                i++;
            } else {
                int i3 = this.rowWindowStart;
                this.lastAddedRow = list.remove(firstRow - i3);
                this.rowWindowStart = this.lastAddedRowGroups.get(this.lastAddedRowGroups.size() - 1).getFinishRow() + 1;
                this.lastAddedRowGroups = null;
                return;
            }
        }
    }

    @Override // com.itextpdf.layout.element.ILargeElement
    public void setDocument(Document document) {
        this.document = document;
    }

    public java.util.List<Border> getLastRowBottomBorder() {
        java.util.List<Border> horizontalBorder = new ArrayList<>();
        if (this.lastAddedRow != null) {
            for (int i = 0; i < this.lastAddedRow.length; i++) {
                Cell cell = this.lastAddedRow[i];
                Border border = null;
                if (cell != null) {
                    if (cell.hasProperty(10)) {
                        border = (Border) cell.getProperty(10);
                    } else if (cell.hasProperty(9)) {
                        border = (Border) cell.getProperty(9);
                    } else {
                        border = (Border) cell.getDefaultProperty(9);
                    }
                }
                horizontalBorder.add(border);
            }
        }
        return horizontalBorder;
    }

    public Table setExtendBottomRow(boolean isExtended) {
        setProperty(86, Boolean.valueOf(isExtended));
        return this;
    }

    public Table setExtendBottomRowOnSplit(boolean isExtended) {
        setProperty(87, Boolean.valueOf(isExtended));
        return this;
    }

    public Table setBorderCollapse(BorderCollapsePropertyValue collapsePropertyValue) {
        setProperty(Property.BORDER_COLLAPSE, collapsePropertyValue);
        if (this.header != null) {
            this.header.setBorderCollapse(collapsePropertyValue);
        }
        if (this.footer != null) {
            this.footer.setBorderCollapse(collapsePropertyValue);
        }
        return this;
    }

    public Table setHorizontalBorderSpacing(float spacing) {
        setProperty(Property.HORIZONTAL_BORDER_SPACING, Float.valueOf(spacing));
        if (this.header != null) {
            this.header.setHorizontalBorderSpacing(spacing);
        }
        if (this.footer != null) {
            this.footer.setHorizontalBorderSpacing(spacing);
        }
        return this;
    }

    public Table setVerticalBorderSpacing(float spacing) {
        setProperty(Property.VERTICAL_BORDER_SPACING, Float.valueOf(spacing));
        if (this.header != null) {
            this.header.setVerticalBorderSpacing(spacing);
        }
        if (this.footer != null) {
            this.footer.setVerticalBorderSpacing(spacing);
        }
        return this;
    }

    @Override // com.itextpdf.layout.tagging.IAccessibleElement
    public AccessibilityProperties getAccessibilityProperties() {
        if (this.tagProperties == null) {
            this.tagProperties = new DefaultAccessibilityProperties(StandardRoles.TABLE);
        }
        return this.tagProperties;
    }

    @Override // com.itextpdf.layout.element.AbstractElement
    protected IRenderer makeNewRenderer() {
        return new TableRenderer(this);
    }

    private static UnitValue[] normalizeColumnWidths(float[] pointColumnWidths) {
        UnitValue[] normalized = new UnitValue[pointColumnWidths.length];
        for (int i = 0; i < normalized.length; i++) {
            if (pointColumnWidths[i] >= 0.0f) {
                normalized[i] = UnitValue.createPointValue(pointColumnWidths[i]);
            }
        }
        return normalized;
    }

    private static UnitValue[] normalizeColumnWidths(UnitValue[] unitColumnWidths) {
        UnitValue[] normalized = new UnitValue[unitColumnWidths.length];
        for (int i = 0; i < unitColumnWidths.length; i++) {
            normalized[i] = (unitColumnWidths[i] == null || unitColumnWidths[i].getValue() < 0.0f) ? null : new UnitValue(unitColumnWidths[i]);
        }
        return normalized;
    }

    private static UnitValue[] normalizeColumnWidths(int numberOfColumns) {
        UnitValue[] normalized = new UnitValue[numberOfColumns];
        return normalized;
    }

    protected java.util.List<RowRange> getRowGroups() {
        int maxRowGroupFinish;
        int i = this.currentColumn;
        int length = this.columnWidths.length;
        int lastRowWeCanFlush = this.currentRow;
        if (i != length) {
            lastRowWeCanFlush--;
        }
        int[] cellBottomRows = new int[this.columnWidths.length];
        java.util.List<RowRange> rowGroups = new ArrayList<>();
        for (int currentRowGroupStart = this.rowWindowStart; currentRowGroupStart <= lastRowWeCanFlush; currentRowGroupStart = maxRowGroupFinish + 1) {
            for (int i2 = 0; i2 < this.columnWidths.length; i2++) {
                cellBottomRows[i2] = currentRowGroupStart;
            }
            maxRowGroupFinish = (cellBottomRows[0] + this.rows.get(cellBottomRows[0] - this.rowWindowStart)[0].getRowspan()) - 1;
            boolean converged = false;
            boolean rowGroupComplete = true;
            while (!converged) {
                converged = true;
                for (int i3 = 0; i3 < this.columnWidths.length; i3++) {
                    while (cellBottomRows[i3] < lastRowWeCanFlush && (cellBottomRows[i3] + this.rows.get(cellBottomRows[i3] - this.rowWindowStart)[i3].getRowspan()) - 1 < maxRowGroupFinish) {
                        cellBottomRows[i3] = cellBottomRows[i3] + this.rows.get(cellBottomRows[i3] - this.rowWindowStart)[i3].getRowspan();
                    }
                    if ((cellBottomRows[i3] + this.rows.get(cellBottomRows[i3] - this.rowWindowStart)[i3].getRowspan()) - 1 > maxRowGroupFinish) {
                        maxRowGroupFinish = (cellBottomRows[i3] + this.rows.get(cellBottomRows[i3] - this.rowWindowStart)[i3].getRowspan()) - 1;
                        converged = false;
                    } else if ((cellBottomRows[i3] + this.rows.get(cellBottomRows[i3] - this.rowWindowStart)[i3].getRowspan()) - 1 < maxRowGroupFinish) {
                        rowGroupComplete = false;
                    }
                }
            }
            if (rowGroupComplete) {
                rowGroups.add(new RowRange(currentRowGroupStart, maxRowGroupFinish));
            }
        }
        return rowGroups;
    }

    private void initializeRows() {
        this.rows = new ArrayList();
        this.currentColumn = -1;
    }

    private boolean cellBelongsToAnyRowGroup(Cell cell, java.util.List<RowRange> rowGroups) {
        return rowGroups != null && rowGroups.size() > 0 && cell.getRow() >= rowGroups.get(0).getStartRow() && cell.getRow() <= rowGroups.get(rowGroups.size() - 1).getFinishRow();
    }

    private void ensureHeaderIsInitialized() {
        if (this.header == null) {
            this.header = new Table(this.columnWidths);
            UnitValue width = getWidth();
            if (width != null) {
                this.header.setWidth(width);
            }
            this.header.getAccessibilityProperties().setRole(StandardRoles.THEAD);
            if (hasOwnProperty(Property.BORDER_COLLAPSE)) {
                this.header.setBorderCollapse((BorderCollapsePropertyValue) getProperty(Property.BORDER_COLLAPSE));
            }
            if (hasOwnProperty(Property.HORIZONTAL_BORDER_SPACING)) {
                this.header.setHorizontalBorderSpacing(((Float) getProperty(Property.HORIZONTAL_BORDER_SPACING)).floatValue());
            }
            if (hasOwnProperty(Property.VERTICAL_BORDER_SPACING)) {
                this.header.setVerticalBorderSpacing(((Float) getProperty(Property.VERTICAL_BORDER_SPACING)).floatValue());
            }
        }
    }

    private void ensureFooterIsInitialized() {
        if (this.footer == null) {
            this.footer = new Table(this.columnWidths);
            UnitValue width = getWidth();
            if (width != null) {
                this.footer.setWidth(width);
            }
            this.footer.getAccessibilityProperties().setRole(StandardRoles.TFOOT);
            if (hasOwnProperty(Property.BORDER_COLLAPSE)) {
                this.footer.setBorderCollapse((BorderCollapsePropertyValue) getProperty(Property.BORDER_COLLAPSE));
            }
            if (hasOwnProperty(Property.HORIZONTAL_BORDER_SPACING)) {
                this.footer.setHorizontalBorderSpacing(((Float) getProperty(Property.HORIZONTAL_BORDER_SPACING)).floatValue());
            }
            if (hasOwnProperty(Property.VERTICAL_BORDER_SPACING)) {
                this.footer.setVerticalBorderSpacing(((Float) getProperty(Property.VERTICAL_BORDER_SPACING)).floatValue());
            }
        }
    }

    private void initializeLargeTable(boolean largeTable) {
        this.isComplete = !largeTable;
        if (largeTable) {
            setWidth(UnitValue.createPercentValue(100.0f));
            setFixedLayout();
        }
    }

    /* loaded from: classes12.dex */
    public static class RowRange {
        int finishRow;
        int startRow;

        public RowRange(int startRow, int finishRow) {
            this.startRow = startRow;
            this.finishRow = finishRow;
        }

        public int getStartRow() {
            return this.startRow;
        }

        public int getFinishRow() {
            return this.finishRow;
        }
    }
}
