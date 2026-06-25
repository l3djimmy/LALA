package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.CanvasArtifact;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.BorderCollapsePropertyValue;
import com.itextpdf.layout.properties.CaptionSide;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class TableRenderer extends AbstractRenderer {
    TableBorders bordersHandler;
    protected DivRenderer captionRenderer;
    private float[] columnWidths;
    private float[] countedColumnWidth;
    protected TableRenderer footerRenderer;
    protected TableRenderer headerRenderer;
    private List<Float> heights;
    protected boolean isOriginalNonSplitRenderer;
    protected Table.RowRange rowRange;
    protected List<CellRenderer[]> rows;
    private float topBorderMaxWidth;
    private float totalWidthForColumns;

    private TableRenderer() {
        this.rows = new ArrayList();
        this.isOriginalNonSplitRenderer = true;
        this.columnWidths = null;
        this.heights = new ArrayList();
        this.countedColumnWidth = null;
    }

    public TableRenderer(Table modelElement, Table.RowRange rowRange) {
        super(modelElement);
        this.rows = new ArrayList();
        this.isOriginalNonSplitRenderer = true;
        this.columnWidths = null;
        this.heights = new ArrayList();
        this.countedColumnWidth = null;
        setRowRange(rowRange);
    }

    public TableRenderer(Table modelElement) {
        this(modelElement, new Table.RowRange(0, modelElement.getNumberOfRows() - 1));
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void addChild(IRenderer renderer) {
        if (renderer instanceof CellRenderer) {
            Cell cell = (Cell) renderer.getModelElement();
            this.rows.get(((cell.getRow() - this.rowRange.getStartRow()) + cell.getRowspan()) - 1)[cell.getCol()] = (CellRenderer) renderer;
            return;
        }
        Logger logger = LoggerFactory.getLogger(TableRenderer.class);
        logger.error("Only CellRenderer could be added");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle applyBorderBox(Rectangle rect, Border[] borders, boolean reverse) {
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            super.applyBorderBox(rect, borders, reverse);
        }
        return rect;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle applyPaddings(Rectangle rect, UnitValue[] paddings, boolean reverse) {
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            super.applyPaddings(rect, paddings, reverse);
        }
        return rect;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle applyPaddings(Rectangle rect, boolean reverse) {
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            super.applyPaddings(rect, reverse);
        }
        return rect;
    }

    private Rectangle applySpacing(Rectangle rect, float horizontalSpacing, float verticalSpacing, boolean reverse) {
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            return rect.applyMargins(verticalSpacing / 2.0f, horizontalSpacing / 2.0f, verticalSpacing / 2.0f, horizontalSpacing / 2.0f, reverse);
        }
        return rect;
    }

    private Rectangle applySingleSpacing(Rectangle rect, float spacing, boolean isHorizontal, boolean reverse) {
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            if (isHorizontal) {
                return rect.applyMargins(0.0f, spacing / 2.0f, 0.0f, spacing / 2.0f, reverse);
            }
            return rect.applyMargins(spacing / 2.0f, 0.0f, spacing / 2.0f, 0.0f, reverse);
        }
        return rect;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Table getTable() {
        return (Table) getModelElement();
    }

    private void initializeHeaderAndFooter(boolean isFirstOnThePage) {
        Table table = (Table) getModelElement();
        Border[] tableBorder = getBorders();
        Table headerElement = table.getHeader();
        boolean footerShouldBeApplied = false;
        boolean isFirstHeader = this.rowRange.getStartRow() == 0 && this.isOriginalNonSplitRenderer;
        boolean headerShouldBeApplied = (table.isComplete() || !this.rows.isEmpty()) && isFirstOnThePage && !((table.isSkipFirstHeader() && isFirstHeader) || Boolean.TRUE.equals(getOwnProperty(97)));
        if (headerElement != null && headerShouldBeApplied) {
            this.headerRenderer = initFooterOrHeaderRenderer(false, tableBorder);
        }
        Table footerElement = table.getFooter();
        if ((!table.isComplete() || table.getLastRowBottomBorder().size() == 0 || !table.isSkipLastFooter()) && !Boolean.TRUE.equals(getOwnProperty(96))) {
            footerShouldBeApplied = true;
        }
        if (footerElement != null && footerShouldBeApplied) {
            this.footerRenderer = initFooterOrHeaderRenderer(true, tableBorder);
        }
    }

    private void initializeCaptionRenderer(Div caption) {
        if (this.isOriginalNonSplitRenderer && caption != null) {
            this.captionRenderer = (DivRenderer) caption.createRendererSubTree();
            this.captionRenderer.setParent(this.parent);
            LayoutTaggingHelper taggingHelper = (LayoutTaggingHelper) getProperty(108);
            if (taggingHelper != null) {
                taggingHelper.addKidsHint(this, Collections.singletonList(this.captionRenderer));
                LayoutTaggingHelper.addTreeHints(taggingHelper, this.captionRenderer);
            }
        }
    }

    private boolean isOriginalRenderer() {
        return (!this.isOriginalNonSplitRenderer || isFooterRenderer() || isHeaderRenderer()) ? false : true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x02b9  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x02f8  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x034d  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x035d  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x03c2  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x04c0  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x04e3  */
    /* JADX WARN: Removed duplicated region for block: B:417:0x0ce7  */
    /* JADX WARN: Removed duplicated region for block: B:418:0x0d02  */
    /* JADX WARN: Removed duplicated region for block: B:661:0x1437  */
    /* JADX WARN: Removed duplicated region for block: B:681:0x14df  */
    /* JADX WARN: Removed duplicated region for block: B:684:0x14ea  */
    /* JADX WARN: Removed duplicated region for block: B:689:0x14f9  */
    /* JADX WARN: Removed duplicated region for block: B:693:0x150b  */
    /* JADX WARN: Removed duplicated region for block: B:698:0x152c  */
    /* JADX WARN: Removed duplicated region for block: B:719:0x15c0  */
    /* JADX WARN: Removed duplicated region for block: B:731:0x15f3  */
    /* JADX WARN: Removed duplicated region for block: B:734:0x1616  */
    /* JADX WARN: Removed duplicated region for block: B:744:0x16c5  */
    /* JADX WARN: Removed duplicated region for block: B:745:0x16cb  */
    /* JADX WARN: Removed duplicated region for block: B:748:0x16e6  */
    /* JADX WARN: Removed duplicated region for block: B:752:0x16f4  */
    /* JADX WARN: Removed duplicated region for block: B:756:0x1709  */
    /* JADX WARN: Removed duplicated region for block: B:763:0x171a  */
    /* JADX WARN: Removed duplicated region for block: B:768:0x1729 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0201  */
    /* JADX WARN: Type inference failed for: r0v69, types: [com.itextpdf.layout.renderer.TableBorders] */
    /* JADX WARN: Type inference failed for: r13v50, types: [com.itextpdf.layout.renderer.CollapsedTableBorders] */
    /* JADX WARN: Type inference failed for: r14v10 */
    /* JADX WARN: Type inference failed for: r14v11, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r14v53 */
    /* JADX WARN: Type inference failed for: r33v25 */
    /* JADX WARN: Type inference failed for: r33v7 */
    /* JADX WARN: Type inference failed for: r7v26 */
    /* JADX WARN: Type inference failed for: r7v27, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r7v35 */
    @Override // com.itextpdf.layout.renderer.IRenderer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.itextpdf.layout.layout.LayoutResult layout(com.itextpdf.layout.layout.LayoutContext r85) {
        /*
            Method dump skipped, instructions count: 5984
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.TableRenderer.layout(com.itextpdf.layout.layout.LayoutContext):com.itextpdf.layout.layout.LayoutResult");
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        boolean isTagged = drawContext.isTaggingEnabled();
        LayoutTaggingHelper taggingHelper = null;
        if (isTagged) {
            taggingHelper = (LayoutTaggingHelper) getProperty(108);
            if (taggingHelper == null) {
                isTagged = false;
            } else {
                TagTreePointer tagPointer = taggingHelper.useAutoTaggingPointerAndRememberItsPosition(this);
                if (taggingHelper.createTag(this, tagPointer)) {
                    tagPointer.getProperties().addAttributes(0, AccessibleAttributesApplier.getLayoutAttributes(this, tagPointer));
                }
            }
        }
        beginTransformationIfApplied(drawContext.getCanvas());
        applyDestinationsAndAnnotation(drawContext);
        boolean relativePosition = isRelativePosition();
        if (relativePosition) {
            applyRelativePositioningTranslation(false);
        }
        beginElementOpacityApplying(drawContext);
        float captionHeight = this.captionRenderer != null ? this.captionRenderer.getOccupiedArea().getBBox().getHeight() : 0.0f;
        boolean isBottomCaption = CaptionSide.BOTTOM.equals(0.0f != captionHeight ? this.captionRenderer.getProperty(Property.CAPTION_SIDE) : null);
        if (0.0f != captionHeight) {
            this.occupiedArea.getBBox().applyMargins(isBottomCaption ? 0.0f : captionHeight, 0.0f, isBottomCaption ? captionHeight : 0.0f, 0.0f, false);
        }
        drawBackground(drawContext);
        if ((this.bordersHandler instanceof SeparatedTableBorders) && !isHeaderRenderer() && !isFooterRenderer()) {
            drawBorder(drawContext);
        }
        drawChildren(drawContext);
        drawPositionedChildren(drawContext);
        if (0.0f != captionHeight) {
            this.occupiedArea.getBBox().applyMargins(isBottomCaption ? 0.0f : captionHeight, 0.0f, isBottomCaption ? captionHeight : 0.0f, 0.0f, true);
        }
        drawCaption(drawContext);
        endElementOpacityApplying(drawContext);
        if (relativePosition) {
            applyRelativePositioningTranslation(true);
        }
        this.flushed = true;
        endTransformationIfApplied(drawContext.getCanvas());
        if (isTagged) {
            if (this.isLastRendererForModelElement && ((Table) getModelElement()).isComplete()) {
                taggingHelper.finishTaggingHint(this);
            }
            taggingHelper.restoreAutoTaggingPointerPosition(this);
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawChildren(DrawContext drawContext) {
        if (this.headerRenderer != null) {
            this.headerRenderer.draw(drawContext);
        }
        for (IRenderer child : this.childRenderers) {
            child.draw(drawContext);
        }
        if (this.bordersHandler instanceof CollapsedTableBorders) {
            drawBorders(drawContext);
        }
        if (this.footerRenderer != null) {
            this.footerRenderer.draw(drawContext);
        }
    }

    protected void drawBackgrounds(DrawContext drawContext) {
        boolean shrinkBackgroundArea = (this.bordersHandler instanceof CollapsedTableBorders) && (isHeaderRenderer() || isFooterRenderer());
        if (shrinkBackgroundArea) {
            this.occupiedArea.getBBox().applyMargins(this.bordersHandler.getMaxTopWidth() / 2.0f, this.bordersHandler.getRightBorderMaxWidth() / 2.0f, this.bordersHandler.getMaxBottomWidth() / 2.0f, this.bordersHandler.getLeftBorderMaxWidth() / 2.0f, false);
        }
        super.drawBackground(drawContext);
        if (shrinkBackgroundArea) {
            this.occupiedArea.getBBox().applyMargins(this.bordersHandler.getMaxTopWidth() / 2.0f, this.bordersHandler.getRightBorderMaxWidth() / 2.0f, this.bordersHandler.getMaxBottomWidth() / 2.0f, this.bordersHandler.getLeftBorderMaxWidth() / 2.0f, true);
        }
        if (this.headerRenderer != null) {
            this.headerRenderer.drawBackgrounds(drawContext);
        }
        if (this.footerRenderer != null) {
            this.footerRenderer.drawBackgrounds(drawContext);
        }
    }

    protected void drawCaption(DrawContext drawContext) {
        if (this.captionRenderer != null && !isFooterRenderer() && !isHeaderRenderer()) {
            this.captionRenderer.draw(drawContext);
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawBackground(DrawContext drawContext) {
        if (!isFooterRenderer() && !isHeaderRenderer()) {
            drawBackgrounds(drawContext);
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(TableRenderer.class, getClass());
        TableRenderer nextTable = new TableRenderer();
        nextTable.modelElement = this.modelElement;
        return nextTable;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void move(float dxRight, float dyUp) {
        super.move(dxRight, dyUp);
        if (this.headerRenderer != null) {
            this.headerRenderer.move(dxRight, dyUp);
        }
        if (this.footerRenderer != null) {
            this.footerRenderer.move(dxRight, dyUp);
        }
    }

    protected TableRenderer[] split(int row) {
        return split(row, false);
    }

    protected TableRenderer[] split(int row, boolean hasContent) {
        return split(row, hasContent, false);
    }

    protected TableRenderer[] split(int row, boolean hasContent, boolean cellWithBigRowspanAdded) {
        TableRenderer splitRenderer = createSplitRenderer(new Table.RowRange(this.rowRange.getStartRow(), this.rowRange.getStartRow() + row));
        splitRenderer.rows = this.rows.subList(0, row);
        splitRenderer.bordersHandler = this.bordersHandler;
        splitRenderer.heights = this.heights;
        splitRenderer.columnWidths = this.columnWidths;
        splitRenderer.countedColumnWidth = this.countedColumnWidth;
        splitRenderer.totalWidthForColumns = this.totalWidthForColumns;
        splitRenderer.occupiedArea = this.occupiedArea;
        TableRenderer overflowRenderer = createOverflowRenderer(new Table.RowRange(this.rowRange.getStartRow() + row, this.rowRange.getFinishRow()));
        if (row == 0 && !hasContent && !cellWithBigRowspanAdded && this.rowRange.getStartRow() == 0) {
            overflowRenderer.isOriginalNonSplitRenderer = this.isOriginalNonSplitRenderer;
        }
        overflowRenderer.rows = this.rows.subList(row, this.rows.size());
        overflowRenderer.bordersHandler = this.bordersHandler;
        return new TableRenderer[]{splitRenderer, overflowRenderer};
    }

    protected TableRenderer createSplitRenderer(Table.RowRange rowRange) {
        TableRenderer splitRenderer = (TableRenderer) getNextRenderer();
        splitRenderer.rowRange = rowRange;
        splitRenderer.parent = this.parent;
        splitRenderer.modelElement = this.modelElement;
        splitRenderer.childRenderers = this.childRenderers;
        splitRenderer.addAllProperties(getOwnProperties());
        splitRenderer.headerRenderer = this.headerRenderer;
        splitRenderer.footerRenderer = this.footerRenderer;
        splitRenderer.isLastRendererForModelElement = false;
        splitRenderer.topBorderMaxWidth = this.topBorderMaxWidth;
        splitRenderer.captionRenderer = this.captionRenderer;
        splitRenderer.isOriginalNonSplitRenderer = this.isOriginalNonSplitRenderer;
        return splitRenderer;
    }

    protected TableRenderer createOverflowRenderer(Table.RowRange rowRange) {
        TableRenderer overflowRenderer = (TableRenderer) getNextRenderer();
        overflowRenderer.setRowRange(rowRange);
        overflowRenderer.parent = this.parent;
        overflowRenderer.modelElement = this.modelElement;
        overflowRenderer.addAllProperties(getOwnProperties());
        overflowRenderer.isOriginalNonSplitRenderer = false;
        overflowRenderer.countedColumnWidth = this.countedColumnWidth;
        return overflowRenderer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float retrieveWidth(float parentBoxWidth) {
        Float tableWidth = super.retrieveWidth(parentBoxWidth);
        Table tableModel = (Table) getModelElement();
        if (tableWidth == null || tableWidth.floatValue() == 0.0f) {
            float totalColumnWidthInPercent = 0.0f;
            for (int col = 0; col < tableModel.getNumberOfColumns(); col++) {
                UnitValue columnWidth = tableModel.getColumnWidth(col);
                if (columnWidth.isPercentValue()) {
                    totalColumnWidthInPercent += columnWidth.getValue();
                }
            }
            Float tableWidth2 = Float.valueOf(parentBoxWidth);
            if (totalColumnWidthInPercent > 0.0f) {
                return Float.valueOf((parentBoxWidth * totalColumnWidthInPercent) / 100.0f);
            }
            return tableWidth2;
        }
        return tableWidth;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        if (this.isOriginalNonSplitRenderer) {
            initializeTableLayoutBorders();
        }
        float rightMaxBorder = this.bordersHandler.getRightBorderMaxWidth();
        float leftMaxBorder = this.bordersHandler.getLeftBorderMaxWidth();
        TableWidths tableWidths = new TableWidths(this, MinMaxWidthUtils.getInfWidth(), true, rightMaxBorder, leftMaxBorder);
        float maxColTotalWidth = 0.0f;
        float[] columns = this.isOriginalNonSplitRenderer ? tableWidths.layout() : this.countedColumnWidth;
        for (float column : columns) {
            maxColTotalWidth += column;
        }
        float minWidth = this.isOriginalNonSplitRenderer ? tableWidths.getMinWidth() : maxColTotalWidth;
        UnitValue marginRightUV = getPropertyAsUnitValue(45);
        if (!marginRightUV.isPointValue()) {
            Logger logger = LoggerFactory.getLogger(TableRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 45));
        }
        UnitValue marginLefttUV = getPropertyAsUnitValue(44);
        if (!marginLefttUV.isPointValue()) {
            Logger logger2 = LoggerFactory.getLogger(TableRenderer.class);
            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
        }
        float additionalWidth = marginLefttUV.getValue() + marginRightUV.getValue() + (rightMaxBorder / 2.0f) + (leftMaxBorder / 2.0f);
        return new MinMaxWidth(minWidth, maxColTotalWidth, additionalWidth);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public boolean allowLastYLineRecursiveExtraction() {
        return false;
    }

    private void initializeTableLayoutBorders() {
        TableBorders collapsedTableBorders;
        boolean isSeparated = BorderCollapsePropertyValue.SEPARATE.equals(getProperty(Property.BORDER_COLLAPSE));
        if (isSeparated) {
            collapsedTableBorders = new SeparatedTableBorders(this.rows, ((Table) getModelElement()).getNumberOfColumns(), getBorders());
        } else {
            collapsedTableBorders = new CollapsedTableBorders(this.rows, ((Table) getModelElement()).getNumberOfColumns(), getBorders());
        }
        this.bordersHandler = collapsedTableBorders;
        this.bordersHandler.initializeBorders();
        this.bordersHandler.setTableBoundingBorders(getBorders());
        this.bordersHandler.setRowRange(this.rowRange.getStartRow(), this.rowRange.getFinishRow());
        boolean z = true;
        initializeHeaderAndFooter(true);
        TableBorders tableBorders = this.bordersHandler;
        boolean z2 = this.isOriginalNonSplitRenderer;
        if (!isFooterRenderer() && !isHeaderRenderer()) {
            z = false;
        }
        tableBorders.updateBordersOnNewPage(z2, z, this, this.headerRenderer, this.footerRenderer);
        correctRowRange();
    }

    private void correctRowRange() {
        if (this.rows.size() < (this.rowRange.getFinishRow() - this.rowRange.getStartRow()) + 1) {
            this.rowRange = new Table.RowRange(this.rowRange.getStartRow(), (this.rowRange.getStartRow() + this.rows.size()) - 1);
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawBorder(DrawContext drawContext) {
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            super.drawBorder(drawContext);
        }
    }

    protected void drawBorders(DrawContext drawContext) {
        drawBorders(drawContext, this.headerRenderer != null, this.footerRenderer != null);
    }

    private void drawBorders(DrawContext drawContext, boolean hasHeader, boolean hasFooter) {
        float startY;
        int i;
        float height = this.occupiedArea.getBBox().getHeight();
        if (this.footerRenderer != null) {
            height -= this.footerRenderer.occupiedArea.getBBox().getHeight();
        }
        if (this.headerRenderer != null) {
            height -= this.headerRenderer.occupiedArea.getBBox().getHeight();
        }
        if (height >= 1.0E-4f) {
            float startX = getOccupiedArea().getBBox().getX() + (this.bordersHandler.getLeftBorderMaxWidth() / 2.0f);
            float startY2 = getOccupiedArea().getBBox().getY() + getOccupiedArea().getBBox().getHeight();
            if (this.headerRenderer != null) {
                startY = (startY2 - this.headerRenderer.occupiedArea.getBBox().getHeight()) + (this.topBorderMaxWidth / 2.0f);
            } else {
                startY = startY2 - (this.topBorderMaxWidth / 2.0f);
            }
            if (hasProperty(46)) {
                UnitValue topMargin = getPropertyAsUnitValue(46);
                if (topMargin != null && !topMargin.isPointValue()) {
                    Logger logger = LoggerFactory.getLogger(TableRenderer.class);
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
                }
                startY -= topMargin == null ? 0.0f : topMargin.getValue();
            }
            if (hasProperty(44)) {
                UnitValue leftMargin = getPropertyAsUnitValue(44);
                if (leftMargin != null && !leftMargin.isPointValue()) {
                    Logger logger2 = LoggerFactory.getLogger(TableRenderer.class);
                    logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
                }
                startX += leftMargin == null ? 0.0f : leftMargin.getValue();
            }
            if (this.childRenderers.size() == 0) {
                Border[] borders = this.bordersHandler.tableBoundingBorders;
                if (borders[0] != null) {
                    if (borders[2] != null && this.heights.size() == 0) {
                        this.heights.add(0, Float.valueOf((borders[0].getWidth() / 2.0f) + (borders[2].getWidth() / 2.0f)));
                    }
                } else if (borders[2] != null) {
                    startY -= borders[2].getWidth() / 2.0f;
                }
                if (this.heights.size() == 0) {
                    this.heights.add(Float.valueOf(0.0f));
                }
            }
            boolean isTagged = drawContext.isTaggingEnabled();
            if (isTagged) {
                drawContext.getCanvas().openTag(new CanvasArtifact());
            }
            boolean isTopTablePart = isTopTablePart();
            boolean isBottomTablePart = isBottomTablePart();
            boolean isComplete = getTable().isComplete();
            boolean isFooterRendererOfLargeTable = isFooterRendererOfLargeTable();
            this.bordersHandler.setRowRange(this.rowRange.getStartRow(), (this.rowRange.getStartRow() + this.heights.size()) - 1);
            if (this.bordersHandler instanceof CollapsedTableBorders) {
                if (hasFooter) {
                    ((CollapsedTableBorders) this.bordersHandler).setBottomBorderCollapseWith(this.footerRenderer.bordersHandler.getFirstHorizontalBorder(), ((CollapsedTableBorders) this.footerRenderer.bordersHandler).getVerticalBordersCrossingTopHorizontalBorder());
                } else if (isBottomTablePart) {
                    ((CollapsedTableBorders) this.bordersHandler).setBottomBorderCollapseWith(null, null);
                }
            }
            float y1 = startY;
            float[] heightsArray = new float[this.heights.size()];
            for (int j = 0; j < this.heights.size(); j++) {
                heightsArray[j] = this.heights.get(j).floatValue();
            }
            float x1 = startX;
            for (int i2 = 0; i2 <= this.bordersHandler.getNumberOfColumns(); i2++) {
                this.bordersHandler.drawVerticalBorder(drawContext.getCanvas(), new TableBorderDescriptor(i2, startY, x1, heightsArray));
                if (i2 < this.countedColumnWidth.length) {
                    x1 += this.countedColumnWidth[i2];
                }
            }
            boolean shouldDrawTopBorder = isFooterRendererOfLargeTable || isTopTablePart;
            if (this.heights.isEmpty() || shouldDrawTopBorder) {
                i = 0;
            } else {
                i = 0;
                y1 -= this.heights.get(0).floatValue();
            }
            if (!shouldDrawTopBorder) {
                i = 1;
            }
            while (i < this.heights.size()) {
                this.bordersHandler.drawHorizontalBorder(drawContext.getCanvas(), new TableBorderDescriptor(i, startX, y1, this.countedColumnWidth));
                y1 -= this.heights.get(i).floatValue();
                i++;
                height = height;
                startY = startY;
            }
            if ((!isBottomTablePart && isComplete) || (isBottomTablePart && (isComplete || (!this.isLastRendererForModelElement && !isEmptyTableRenderer())))) {
                this.bordersHandler.drawHorizontalBorder(drawContext.getCanvas(), new TableBorderDescriptor(this.heights.size(), startX, y1, this.countedColumnWidth));
            }
            if (isTagged) {
                drawContext.getCanvas().closeTag();
            }
        }
    }

    private boolean isEmptyTableRenderer() {
        return this.rows.isEmpty() && this.heights.size() == 1 && this.heights.get(0).floatValue() == 0.0f;
    }

    private void applyFixedXOrYPosition(boolean isXPosition, Rectangle layoutBox) {
        if (isPositioned() && isFixedLayout()) {
            if (isXPosition) {
                float x = getPropertyAsFloat(34).floatValue();
                layoutBox.setX(x);
                return;
            }
            float y = getPropertyAsFloat(14).floatValue();
            move(0.0f, y - this.occupiedArea.getBBox().getY());
        }
    }

    private void adjustFooterAndFixOccupiedArea(Rectangle layoutBox, float verticalBorderSpacing) {
        if (this.footerRenderer != null) {
            this.footerRenderer.move(0.0f, layoutBox.getHeight() + verticalBorderSpacing);
            float footerHeight = this.footerRenderer.getOccupiedArea().getBBox().getHeight() - verticalBorderSpacing;
            this.occupiedArea.getBBox().moveDown(footerHeight).increaseHeight(footerHeight);
        }
    }

    private void adjustCaptionAndFixOccupiedArea(Rectangle layoutBox, float verticalBorderSpacing) {
        if (this.captionRenderer != null) {
            float captionHeight = this.captionRenderer.getOccupiedArea().getBBox().getHeight();
            this.occupiedArea.getBBox().moveDown(captionHeight).increaseHeight(captionHeight);
            if (CaptionSide.BOTTOM.equals(this.captionRenderer.getProperty(Property.CAPTION_SIDE))) {
                this.captionRenderer.move(0.0f, layoutBox.getHeight() + verticalBorderSpacing);
            } else {
                this.occupiedArea.getBBox().moveUp(captionHeight);
            }
        }
    }

    private void correctLayoutedCellsOccupiedAreas(LayoutResult[] splits, int row, int[] targetOverflowRowIndex, Float blockMinHeight, Rectangle layoutBox, List<Boolean> rowsHasCellWithSetHeight, boolean isLastRenderer, boolean processBigRowspan, boolean skip) {
        float f;
        float f2;
        float additionalCellHeight;
        int numOfRowsWithFloatHeight;
        char c;
        float f3;
        CellRenderer[] currentRow;
        int finish = this.bordersHandler.getFinishRow();
        this.bordersHandler.setFinishRow(this.rowRange.getFinishRow());
        Border currentBorder = this.bordersHandler.getWidestHorizontalBorder(finish + 1);
        this.bordersHandler.setFinishRow(finish);
        char c2 = 2;
        if (skip) {
            this.bordersHandler.tableBoundingBorders[2] = getBorders()[2];
            this.bordersHandler.skipFooter(this.bordersHandler.tableBoundingBorders);
        }
        if (this.bordersHandler instanceof CollapsedTableBorders) {
            f = currentBorder == null ? 0.0f : currentBorder.getWidth();
        } else {
            f = 0.0f;
        }
        float currentBottomIndent = f;
        float realBottomIndent = this.bordersHandler instanceof CollapsedTableBorders ? this.bordersHandler.getMaxBottomWidth() : 0.0f;
        float f4 = 2.0f;
        if (this.heights.size() != 0) {
            this.heights.set(this.heights.size() - 1, Float.valueOf(this.heights.get(this.heights.size() - 1).floatValue() + ((realBottomIndent - currentBottomIndent) / 2.0f)));
            this.occupiedArea.getBBox().increaseHeight((realBottomIndent - currentBottomIndent) / 2.0f).moveDown((realBottomIndent - currentBottomIndent) / 2.0f);
            layoutBox.decreaseHeight((realBottomIndent - currentBottomIndent) / 2.0f);
            if (processBigRowspan) {
                CellRenderer[] currentRow2 = this.rows.get(this.heights.size());
                int col = 0;
                while (col < currentRow2.length) {
                    CellRenderer cell = splits[col] == null ? currentRow2[col] : (CellRenderer) splits[col].getSplitRenderer();
                    if (cell == null) {
                        c = c2;
                        currentRow = currentRow2;
                        f3 = f4;
                    } else {
                        float height = 0.0f;
                        int rowspan = cell.getPropertyAsInteger(60).intValue();
                        int colspan = cell.getPropertyAsInteger(16).intValue();
                        int l = (this.heights.size() - 1) - 1;
                        while (true) {
                            c = c2;
                            if (l <= targetOverflowRowIndex[col] - rowspan || l < 0) {
                                break;
                            }
                            height += this.heights.get(l).floatValue();
                            l--;
                            c2 = c;
                        }
                        float[] indents = this.bordersHandler.getCellBorderIndents(this.bordersHandler instanceof SeparatedTableBorders ? row : targetOverflowRowIndex[col], col, rowspan, colspan);
                        float cellHeightInLastRow = (cell.getOccupiedArea().getBBox().getHeight() - height) + (indents[0] / f4) + (indents[c] / f4);
                        f3 = f4;
                        if (this.heights.get(this.heights.size() - 1).floatValue() < cellHeightInLastRow) {
                            if (this.bordersHandler instanceof SeparatedTableBorders) {
                                float differenceToConsider = cellHeightInLastRow - this.heights.get(this.heights.size() - 1).floatValue();
                                this.occupiedArea.getBBox().moveDown(differenceToConsider);
                                this.occupiedArea.getBBox().increaseHeight(differenceToConsider);
                            }
                            currentRow = currentRow2;
                            this.heights.set(this.heights.size() - 1, Float.valueOf(cellHeightInLastRow));
                        } else {
                            currentRow = currentRow2;
                            float shift = this.heights.get(this.heights.size() - 1).floatValue() - cellHeightInLastRow;
                            Rectangle bBox = cell.getOccupiedArea().getBBox();
                            bBox.moveDown(shift);
                            bBox.setHeight(this.heights.get(this.heights.size() - 1).floatValue() + height);
                            cell.applyVerticalAlignment();
                        }
                    }
                    col++;
                    f4 = f3;
                    c2 = c;
                    currentRow2 = currentRow;
                }
                f2 = f4;
            } else {
                f2 = 2.0f;
            }
        } else {
            f2 = 2.0f;
        }
        int numOfRowsWithFloatHeight2 = 0;
        if (!isLastRenderer) {
            additionalCellHeight = 0.0f;
            numOfRowsWithFloatHeight = 0;
        } else {
            float additionalHeight = 0.0f;
            if (blockMinHeight != null && blockMinHeight.floatValue() > this.occupiedArea.getBBox().getHeight() + (realBottomIndent / f2)) {
                additionalHeight = Math.min(layoutBox.getHeight() - (realBottomIndent / f2), (blockMinHeight.floatValue() - this.occupiedArea.getBBox().getHeight()) - (realBottomIndent / f2));
                for (int k = 0; k < rowsHasCellWithSetHeight.size(); k++) {
                    if (Boolean.FALSE.equals(rowsHasCellWithSetHeight.get(k))) {
                        numOfRowsWithFloatHeight2++;
                    }
                }
            }
            float additionalCellHeight2 = additionalHeight / (numOfRowsWithFloatHeight2 == 0 ? this.heights.size() : numOfRowsWithFloatHeight2);
            for (int k2 = 0; k2 < this.heights.size(); k2++) {
                if (numOfRowsWithFloatHeight2 == 0 || Boolean.FALSE.equals(rowsHasCellWithSetHeight.get(k2))) {
                    this.heights.set(k2, Float.valueOf(this.heights.get(k2).floatValue() + additionalCellHeight2));
                }
            }
            additionalCellHeight = additionalCellHeight2;
            numOfRowsWithFloatHeight = numOfRowsWithFloatHeight2;
        }
        float cumulativeShift = 0.0f;
        for (int k3 = 0; k3 < this.heights.size(); k3++) {
            correctRowCellsOccupiedAreas(splits, row, targetOverflowRowIndex, k3, rowsHasCellWithSetHeight, cumulativeShift, additionalCellHeight);
            if (isLastRenderer && (numOfRowsWithFloatHeight == 0 || Boolean.FALSE.equals(rowsHasCellWithSetHeight.get(k3)))) {
                cumulativeShift += additionalCellHeight;
            }
        }
        this.occupiedArea.getBBox().moveDown(cumulativeShift).increaseHeight(cumulativeShift);
        layoutBox.decreaseHeight(cumulativeShift);
    }

    private void correctRowCellsOccupiedAreas(LayoutResult[] splits, int row, int[] targetOverflowRowIndex, int currentRowIndex, List<Boolean> rowsHasCellWithSetHeight, float cumulativeShift, float additionalCellHeight) {
        TableRenderer tableRenderer = this;
        CellRenderer[] currentRow = tableRenderer.rows.get(currentRowIndex);
        int col = 0;
        while (col < currentRow.length) {
            CellRenderer cell = (currentRowIndex < row || splits[col] == null) ? currentRow[col] : (CellRenderer) splits[col].getSplitRenderer();
            if (cell != null) {
                float height = 0.0f;
                int colspan = cell.getPropertyAsInteger(16).intValue();
                int rowspan = cell.getPropertyAsInteger(60).intValue();
                float rowspanOffset = 0.0f;
                int l = (currentRowIndex < row ? currentRowIndex : tableRenderer.heights.size() - 1) - 1;
                while (true) {
                    if (l <= (currentRowIndex < row ? currentRowIndex : targetOverflowRowIndex[col]) - rowspan || l < 0) {
                        break;
                    }
                    height += tableRenderer.heights.get(l).floatValue();
                    if (Boolean.FALSE.equals(rowsHasCellWithSetHeight.get(l))) {
                        rowspanOffset += additionalCellHeight;
                    }
                    l--;
                }
                float height2 = height + tableRenderer.heights.get(currentRowIndex < row ? currentRowIndex : tableRenderer.heights.size() - 1).floatValue();
                float[] indents = tableRenderer.bordersHandler.getCellBorderIndents((currentRowIndex < row || (tableRenderer.bordersHandler instanceof SeparatedTableBorders)) ? currentRowIndex : targetOverflowRowIndex[col], col, rowspan, colspan);
                float height3 = height2 - ((indents[0] / 2.0f) + (indents[2] / 2.0f));
                float shift = height3 - cell.getOccupiedArea().getBBox().getHeight();
                Rectangle bBox = cell.getOccupiedArea().getBBox();
                bBox.moveDown(shift);
                try {
                    cell.move(0.0f, -(cumulativeShift - rowspanOffset));
                    bBox.setHeight(height3);
                    cell.applyVerticalAlignment();
                } catch (NullPointerException e) {
                    Logger logger = LoggerFactory.getLogger(TableRenderer.class);
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Some of the cell's content might not end up placed correctly."));
                }
            }
            col++;
            tableRenderer = this;
        }
    }

    protected void extendLastRow(CellRenderer[] lastRow, Rectangle freeBox) {
        if (lastRow != null && this.heights.size() != 0) {
            this.heights.set(this.heights.size() - 1, Float.valueOf(this.heights.get(this.heights.size() - 1).floatValue() + freeBox.getHeight()));
            this.occupiedArea.getBBox().moveDown(freeBox.getHeight()).increaseHeight(freeBox.getHeight());
            for (CellRenderer cell : lastRow) {
                if (cell != null) {
                    cell.occupiedArea.getBBox().moveDown(freeBox.getHeight()).increaseHeight(freeBox.getHeight());
                }
            }
            freeBox.moveUp(freeBox.getHeight()).setHeight(0.0f);
        }
    }

    private void setRowRange(Table.RowRange rowRange) {
        this.rowRange = rowRange;
        for (int row = rowRange.getStartRow(); row <= rowRange.getFinishRow(); row++) {
            this.rows.add(new CellRenderer[((Table) this.modelElement).getNumberOfColumns()]);
        }
    }

    private TableRenderer initFooterOrHeaderRenderer(boolean footer, Border[] tableBorders) {
        TableBorders collapsedTableBorders;
        Table table = (Table) getModelElement();
        boolean isSeparated = BorderCollapsePropertyValue.SEPARATE.equals(getProperty(Property.BORDER_COLLAPSE));
        Table footerOrHeader = footer ? table.getFooter() : table.getHeader();
        boolean firstHeader = false;
        int innerBorder = footer ? 0 : 2;
        int outerBorder = footer ? 2 : 0;
        TableRenderer renderer = (TableRenderer) footerOrHeader.createRendererSubTree().setParent(this);
        ensureFooterOrHeaderHasTheSamePropertiesAsParentTableRenderer(renderer);
        if (!footer && this.rowRange.getStartRow() == 0 && this.isOriginalNonSplitRenderer) {
            firstHeader = true;
        }
        LayoutTaggingHelper taggingHelper = (LayoutTaggingHelper) getProperty(108);
        if (taggingHelper != null) {
            taggingHelper.addKidsHint(this, Collections.singletonList(renderer));
            LayoutTaggingHelper.addTreeHints(taggingHelper, renderer);
            if (!footer && !firstHeader) {
                taggingHelper.markArtifactHint(renderer);
            }
        }
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            if (table.isEmpty()) {
                if (!footer || this.headerRenderer == null) {
                    renderer.setBorders(tableBorders[innerBorder], innerBorder);
                }
                this.bordersHandler.tableBoundingBorders[innerBorder] = Border.NO_BORDER;
            }
            renderer.setBorders(tableBorders[1], 1);
            renderer.setBorders(tableBorders[3], 3);
            renderer.setBorders(tableBorders[outerBorder], outerBorder);
            this.bordersHandler.tableBoundingBorders[outerBorder] = Border.NO_BORDER;
        } else if (this.bordersHandler instanceof CollapsedTableBorders) {
            Border[] borders = renderer.getBorders();
            if (table.isEmpty()) {
                renderer.setBorders(CollapsedTableBorders.getCollapsedBorder(borders[innerBorder], tableBorders[innerBorder]), innerBorder);
                this.bordersHandler.tableBoundingBorders[innerBorder] = Border.NO_BORDER;
            }
            renderer.setBorders(CollapsedTableBorders.getCollapsedBorder(borders[1], tableBorders[1]), 1);
            renderer.setBorders(CollapsedTableBorders.getCollapsedBorder(borders[3], tableBorders[3]), 3);
            renderer.setBorders(CollapsedTableBorders.getCollapsedBorder(borders[outerBorder], tableBorders[outerBorder]), outerBorder);
            this.bordersHandler.tableBoundingBorders[outerBorder] = Border.NO_BORDER;
        }
        if (isSeparated) {
            collapsedTableBorders = new SeparatedTableBorders(renderer.rows, ((Table) renderer.getModelElement()).getNumberOfColumns(), renderer.getBorders());
        } else {
            collapsedTableBorders = new CollapsedTableBorders(renderer.rows, ((Table) renderer.getModelElement()).getNumberOfColumns(), renderer.getBorders());
        }
        renderer.bordersHandler = collapsedTableBorders;
        renderer.bordersHandler.initializeBorders();
        renderer.bordersHandler.setRowRange(renderer.rowRange.getStartRow(), renderer.rowRange.getFinishRow());
        renderer.bordersHandler.processAllBordersAndEmptyRows();
        renderer.correctRowRange();
        return renderer;
    }

    private void ensureFooterOrHeaderHasTheSamePropertiesAsParentTableRenderer(TableRenderer headerOrFooterRenderer) {
        headerOrFooterRenderer.setProperty(Property.BORDER_COLLAPSE, getProperty(Property.BORDER_COLLAPSE));
        if (this.bordersHandler instanceof SeparatedTableBorders) {
            headerOrFooterRenderer.setProperty(Property.HORIZONTAL_BORDER_SPACING, getPropertyAsFloat(Property.HORIZONTAL_BORDER_SPACING));
            headerOrFooterRenderer.setProperty(Property.VERTICAL_BORDER_SPACING, getPropertyAsFloat(Property.VERTICAL_BORDER_SPACING));
            headerOrFooterRenderer.setProperty(9, Border.NO_BORDER);
            headerOrFooterRenderer.setProperty(11, Border.NO_BORDER);
            headerOrFooterRenderer.setProperty(13, Border.NO_BORDER);
            headerOrFooterRenderer.setProperty(12, Border.NO_BORDER);
            headerOrFooterRenderer.setProperty(10, Border.NO_BORDER);
        }
    }

    private TableRenderer prepareFooterOrHeaderRendererForLayout(TableRenderer renderer, float layoutBoxWidth) {
        renderer.countedColumnWidth = this.countedColumnWidth;
        renderer.bordersHandler.leftBorderMaxWidth = this.bordersHandler.getLeftBorderMaxWidth();
        renderer.bordersHandler.rightBorderMaxWidth = this.bordersHandler.getRightBorderMaxWidth();
        if (hasProperty(77)) {
            renderer.setProperty(77, UnitValue.createPointValue(layoutBoxWidth));
        }
        return this;
    }

    private boolean isHeaderRenderer() {
        return (this.parent instanceof TableRenderer) && ((TableRenderer) this.parent).headerRenderer == this;
    }

    private boolean isFooterRenderer() {
        return (this.parent instanceof TableRenderer) && ((TableRenderer) this.parent).footerRenderer == this;
    }

    private boolean isFooterRendererOfLargeTable() {
        return isFooterRenderer() && !(((TableRenderer) this.parent).getTable().isComplete() && ((TableRenderer) this.parent).getTable().getLastRowBottomBorder().size() == 0);
    }

    private boolean isTopTablePart() {
        return this.headerRenderer == null && (!isFooterRenderer() || (((TableRenderer) this.parent).rows.size() == 0 && ((TableRenderer) this.parent).headerRenderer == null));
    }

    private boolean isBottomTablePart() {
        return this.footerRenderer == null && (!isHeaderRenderer() || (((TableRenderer) this.parent).rows.size() == 0 && ((TableRenderer) this.parent).footerRenderer == null));
    }

    private void calculateColumnWidths(float availableWidth) {
        if (this.countedColumnWidth == null || this.totalWidthForColumns != availableWidth) {
            TableWidths tableWidths = new TableWidths(this, availableWidth, false, this.bordersHandler.rightBorderMaxWidth, this.bordersHandler.leftBorderMaxWidth);
            this.countedColumnWidth = tableWidths.layout();
        }
    }

    private float getTableWidth() {
        float[] fArr;
        float sum = 0.0f;
        for (float column : this.countedColumnWidth) {
            sum += column;
        }
        boolean z = this.bordersHandler instanceof SeparatedTableBorders;
        TableBorders tableBorders = this.bordersHandler;
        if (z) {
            float sum2 = sum + tableBorders.getRightBorderMaxWidth() + this.bordersHandler.getLeftBorderMaxWidth();
            Float horizontalSpacing = getPropertyAsFloat(Property.HORIZONTAL_BORDER_SPACING);
            return sum2 + (horizontalSpacing == null ? 0.0f : horizontalSpacing.floatValue());
        }
        return sum + (tableBorders.getRightBorderMaxWidth() / 2.0f) + (this.bordersHandler.getLeftBorderMaxWidth() / 2.0f);
    }

    /* loaded from: classes12.dex */
    private static class CellRendererInfo {
        public CellRenderer cellRenderer;
        public int column;
        public int finishRowInd;

        public CellRendererInfo(CellRenderer cellRenderer, int column, int finishRow) {
            this.cellRenderer = cellRenderer;
            this.column = column;
            this.finishRowInd = finishRow;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class OverflowRowsWrapper {
        private boolean isReplaced = false;
        private TableRenderer overflowRenderer;

        public OverflowRowsWrapper(TableRenderer overflowRenderer) {
            this.overflowRenderer = overflowRenderer;
        }

        public CellRenderer getCell(int row, int col) {
            return this.overflowRenderer.rows.get(row)[col];
        }

        public CellRenderer setCell(int row, int col, CellRenderer newCell) {
            if (!this.isReplaced) {
                this.overflowRenderer.rows = new ArrayList(this.overflowRenderer.rows);
                this.isReplaced = true;
            }
            this.overflowRenderer.rows.set(row, (CellRenderer[]) this.overflowRenderer.rows.get(row).clone());
            this.overflowRenderer.rows.get(row)[col] = newCell;
            return newCell;
        }
    }

    private void enlargeCellWithBigRowspan(CellRenderer[] currentRow, OverflowRowsWrapper overflowRows, int row, int col, int minRowspan, TableRenderer[] splitResult, int[] targetOverflowRowIndex) {
        this.childRenderers.add(currentRow[col]);
        int i = row;
        while (i < row + minRowspan && i + 1 < this.rows.size() && splitResult[1].rows.get((i + 1) - row)[col] != null) {
            overflowRows.setCell(i - row, col, splitResult[1].rows.get((i + 1) - row)[col]);
            overflowRows.setCell((i + 1) - row, col, null);
            this.rows.get(i)[col] = this.rows.get(i + 1)[col];
            this.rows.get(i + 1)[col] = null;
            i++;
        }
        if (i != (row + minRowspan) - 1 && this.rows.get(i)[col] != null) {
            CellRenderer overflowCell = (CellRenderer) ((Cell) this.rows.get(i)[col].getModelElement()).getRenderer().setParent(this);
            overflowRows.setCell(i - row, col, null);
            overflowRows.setCell(targetOverflowRowIndex[col] - row, col, overflowCell);
            CellRenderer originalCell = this.rows.get(i)[col];
            this.rows.get(i)[col] = null;
            this.rows.get(targetOverflowRowIndex[col])[col] = originalCell;
            originalCell.isLastRendererForModelElement = false;
            overflowCell.setProperty(109, originalCell.getProperty(109));
        }
    }

    private void enlargeCell(int col, int row, int minRowspan, CellRenderer[] currentRow, OverflowRowsWrapper overflowRows, int[] targetOverflowRowIndex, TableRenderer[] splitResult) {
        LayoutArea cellOccupiedArea = currentRow[col].getOccupiedArea();
        if (1 == minRowspan) {
            CellRenderer overflowCell = (CellRenderer) ((Cell) currentRow[col].getModelElement()).clone(true).getRenderer();
            overflowCell.setParent(this);
            overflowCell.deleteProperty(27);
            overflowCell.deleteProperty(85);
            overflowCell.deleteProperty(84);
            overflowRows.setCell(0, col, null);
            overflowRows.setCell(targetOverflowRowIndex[col] - row, col, overflowCell);
            this.childRenderers.add(currentRow[col]);
            CellRenderer originalCell = currentRow[col];
            currentRow[col] = null;
            this.rows.get(targetOverflowRowIndex[col])[col] = originalCell;
            originalCell.isLastRendererForModelElement = false;
            overflowCell.setProperty(109, originalCell.getProperty(109));
        } else {
            enlargeCellWithBigRowspan(currentRow, overflowRows, row, col, minRowspan, splitResult, targetOverflowRowIndex);
        }
        overflowRows.getCell(targetOverflowRowIndex[col] - row, col).occupiedArea = cellOccupiedArea;
    }

    void applyMarginsAndPaddingsAndCalculateColumnWidths(Rectangle layoutBox) {
        UnitValue[] margins = getMargins();
        if (!margins[1].isPointValue()) {
            Logger logger = LoggerFactory.getLogger(TableRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 45));
        }
        if (!margins[3].isPointValue()) {
            Logger logger2 = LoggerFactory.getLogger(TableRenderer.class);
            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
        }
        UnitValue[] paddings = getPaddings();
        if (!paddings[1].isPointValue()) {
            Logger logger3 = LoggerFactory.getLogger(TableRenderer.class);
            logger3.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 49));
        }
        if (!paddings[3].isPointValue()) {
            Logger logger4 = LoggerFactory.getLogger(TableRenderer.class);
            logger4.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 48));
        }
        calculateColumnWidths((((layoutBox.getWidth() - margins[1].getValue()) - margins[3].getValue()) - paddings[1].getValue()) - paddings[3].getValue());
    }
}
