package com.itextpdf.layout.renderer;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class SeparatedTableBorders extends TableBorders {
    public SeparatedTableBorders(List<CellRenderer[]> rows, int numberOfColumns, Border[] tableBoundingBorders) {
        super(rows, numberOfColumns, tableBoundingBorders);
    }

    public SeparatedTableBorders(List<CellRenderer[]> rows, int numberOfColumns, Border[] tableBoundingBorders, int largeTableIndexOffset) {
        super(rows, numberOfColumns, tableBoundingBorders, largeTableIndexOffset);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders drawHorizontalBorder(PdfCanvas canvas, TableBorderDescriptor borderDescriptor) {
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders drawVerticalBorder(PdfCanvas canvas, TableBorderDescriptor borderDescriptor) {
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyTopTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean isEmpty, boolean force, boolean reverse) {
        return applyTopTableBorder(occupiedBox, layoutBox, reverse);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyTopTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean reverse) {
        float topIndent = (reverse ? -1 : 1) * getMaxTopWidth();
        layoutBox.decreaseHeight(topIndent);
        occupiedBox.moveDown(topIndent).increaseHeight(topIndent);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyBottomTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean isEmpty, boolean force, boolean reverse) {
        return applyBottomTableBorder(occupiedBox, layoutBox, reverse);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyBottomTableBorder(Rectangle occupiedBox, Rectangle layoutBox, boolean reverse) {
        float bottomTableBorderWidth = (reverse ? -1 : 1) * getMaxBottomWidth();
        layoutBox.decreaseHeight(bottomTableBorderWidth);
        occupiedBox.moveDown(bottomTableBorderWidth).increaseHeight(bottomTableBorderWidth);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyLeftAndRightTableBorder(Rectangle layoutBox, boolean reverse) {
        if (layoutBox != null) {
            layoutBox.applyMargins(0.0f, this.rightBorderMaxWidth, 0.0f, this.leftBorderMaxWidth, reverse);
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders skipFooter(Border[] borders) {
        setTableBoundingBorders(borders);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders skipHeader(Border[] borders) {
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders collapseTableWithFooter(TableBorders footerBordersHandler, boolean hasContent) {
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders collapseTableWithHeader(TableBorders headerBordersHandler, boolean updateBordersHandler) {
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders fixHeaderOccupiedArea(Rectangle occupiedBox, Rectangle layoutBox) {
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders applyCellIndents(Rectangle box, float topIndent, float rightIndent, float bottomIndent, float leftIndent, boolean reverse) {
        box.applyMargins(topIndent, rightIndent, bottomIndent, leftIndent, false);
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public List<Border> getVerticalBorder(int index) {
        return this.verticalBorders.get(index);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public List<Border> getHorizontalBorder(int index) {
        return this.horizontalBorders.get(index - this.largeTableIndexOffset);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected float getCellVerticalAddition(float[] indents) {
        return 0.0f;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders updateBordersOnNewPage(boolean isOriginalNonSplitRenderer, boolean isFooterOrHeader, TableRenderer currentRenderer, TableRenderer headerRenderer, TableRenderer footerRenderer) {
        if (!isFooterOrHeader && isOriginalNonSplitRenderer && this.rows != null) {
            processAllBordersAndEmptyRows();
            this.rightBorderMaxWidth = getMaxRightWidth();
            this.leftBorderMaxWidth = getMaxLeftWidth();
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
    public float[] getCellBorderIndents(int row, int col, int rowspan, int colspan) {
        return new float[]{0.0f, 0.0f, 0.0f, 0.0f};
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected void buildBordersArrays(CellRenderer cell, int row, int col, int[] rowspansToDeduct) {
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
            checkAndReplaceBorderInArray(this.horizontalBorders, ((row + 1) - rowspan) * 2, colN + i, cellBorders[0], false);
        }
        for (int i2 = 0; i2 < colspan; i2++) {
            checkAndReplaceBorderInArray(this.horizontalBorders, (row * 2) + 1, colN + i2, cellBorders[2], true);
        }
        for (int j = (row - rowspan) + 1; j <= row; j++) {
            checkAndReplaceBorderInArray(this.verticalBorders, colN * 2, j, cellBorders[3], false);
        }
        for (int i3 = (row - rowspan) + 1; i3 <= row; i3++) {
            checkAndReplaceBorderInArray(this.verticalBorders, ((colN + colspan) * 2) - 1, i3, cellBorders[1], true);
        }
    }

    protected boolean checkAndReplaceBorderInArray(List<List<Border>> borderArray, int i, int j, Border borderToAdd, boolean hasPriority) {
        List<Border> borders = borderArray.get(i);
        Border neighbour = borders.get(j);
        if (neighbour == null) {
            borders.set(j, borderToAdd);
            return true;
        }
        Logger logger = LoggerFactory.getLogger(TableRenderer.class);
        logger.warn(IoLogMessageConstant.UNEXPECTED_BEHAVIOUR_DURING_TABLE_ROW_COLLAPSING);
        return true;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    protected TableBorders initializeBorders() {
        while (Math.max(this.numberOfColumns, 1) * 2 > this.verticalBorders.size()) {
            List<Border> tempBorders = new ArrayList<>();
            while (Math.max(this.rows.size(), 1) * 2 > tempBorders.size()) {
                tempBorders.add(null);
            }
            this.verticalBorders.add(tempBorders);
        }
        while (Math.max(this.rows.size(), 1) * 2 > this.horizontalBorders.size()) {
            List<Border> tempBorders2 = new ArrayList<>();
            while (this.numberOfColumns > tempBorders2.size()) {
                tempBorders2.add(null);
            }
            this.horizontalBorders.add(tempBorders2);
        }
        return this;
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public List<Border> getFirstHorizontalBorder() {
        return getHorizontalBorder(this.startRow * 2);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public List<Border> getLastHorizontalBorder() {
        return getHorizontalBorder((this.finishRow * 2) + 1);
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public float getMaxTopWidth() {
        if (this.tableBoundingBorders[0] == null) {
            return 0.0f;
        }
        return this.tableBoundingBorders[0].getWidth();
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public float getMaxBottomWidth() {
        if (this.tableBoundingBorders[2] == null) {
            return 0.0f;
        }
        return this.tableBoundingBorders[2].getWidth();
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public float getMaxRightWidth() {
        if (this.tableBoundingBorders[1] == null) {
            return 0.0f;
        }
        return this.tableBoundingBorders[1].getWidth();
    }

    @Override // com.itextpdf.layout.renderer.TableBorders
    public float getMaxLeftWidth() {
        if (this.tableBoundingBorders[3] == null) {
            return 0.0f;
        }
        return this.tableBoundingBorders[3].getWidth();
    }
}
