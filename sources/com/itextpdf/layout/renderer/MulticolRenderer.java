package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.CanvasArtifact;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.MulticolContainer;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.properties.ContinuousContainer;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
/* loaded from: classes12.dex */
public class MulticolRenderer extends AbstractRenderer {
    private static final float ZERO_DELTA = 1.0E-4f;
    private float approximateHeight;
    private int columnCount;
    private float columnGap;
    private float columnWidth;
    private BlockRenderer elementRenderer;
    private ColumnHeightCalculator heightCalculator;
    private Float heightFromProperties;
    private boolean isFirstLayout;

    /* loaded from: classes12.dex */
    public interface ColumnHeightCalculator {
        Float getAdditionalHeightOfEachColumn(MulticolRenderer multicolRenderer, MulticolLayoutResult multicolLayoutResult);

        int maxAmountOfRelayouts();
    }

    public MulticolRenderer(MulticolContainer modelElement) {
        super(modelElement);
        this.isFirstLayout = true;
        setHeightCalculator(new LayoutInInfiniteHeightCalculator());
    }

    public final void setHeightCalculator(ColumnHeightCalculator heightCalculator) {
        this.heightCalculator = heightCalculator;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        setProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER, Boolean.TRUE);
        setOverflowForAllChildren(this);
        Rectangle actualBBox = layoutContext.getArea().getBBox().mo7327clone();
        float originalWidth = actualBBox.getWidth();
        applyWidth(actualBBox, originalWidth);
        ContinuousContainer.setupContinuousContainerIfNeeded(this);
        applyPaddings(actualBBox, false);
        applyBorderBox(actualBBox, false);
        applyMargins(actualBBox, false);
        calculateColumnCountAndWidth(actualBBox.getWidth());
        this.heightFromProperties = determineHeight(actualBBox);
        if (this.elementRenderer == null) {
            this.elementRenderer = getElementsRenderer();
        }
        this.elementRenderer.setParent(this);
        MulticolLayoutResult layoutResult = layoutInColumns(layoutContext, actualBBox);
        if (layoutResult.getSplitRenderers().isEmpty()) {
            for (IRenderer child : this.elementRenderer.getChildRenderers()) {
                child.setParent(this.elementRenderer);
            }
            return new LayoutResult(3, null, null, this, layoutResult.getCauseOfNothing());
        } else if (layoutResult.getOverflowRenderer() == null) {
            ContinuousContainer continuousContainer = (ContinuousContainer) getProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER_RESULT);
            if (continuousContainer != null) {
                continuousContainer.reApplyProperties(this);
            }
            this.childRenderers.clear();
            addAllChildRenderers(layoutResult.getSplitRenderers());
            this.occupiedArea = calculateContainerOccupiedArea(layoutContext, true);
            return new LayoutResult(1, this.occupiedArea, this, null);
        } else {
            this.occupiedArea = calculateContainerOccupiedArea(layoutContext, false);
            return new LayoutResult(2, this.occupiedArea, createSplitRenderer(layoutResult.getSplitRenderers()), createOverflowRenderer(layoutResult.getOverflowRenderer()));
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(MulticolRenderer.class, getClass());
        return new MulticolRenderer((MulticolContainer) this.modelElement);
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawBorder(final DrawContext drawContext) {
        super.drawBorder(drawContext);
        Rectangle borderRect = applyMargins(this.occupiedArea.getBBox().mo7327clone(), getMargins(), false);
        final boolean isAreaClipped = clipBorderArea(drawContext, borderRect);
        final Border gap = (Border) getProperty(Property.COLUMN_GAP_BORDER);
        if (getChildRenderers().isEmpty() || gap == null || gap.getWidth() <= 1.0E-4f) {
            return;
        }
        drawTaggedWhenNeeded(drawContext, new Consumer() { // from class: com.itextpdf.layout.renderer.MulticolRenderer$$ExternalSyntheticLambda0
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                MulticolRenderer.this.m7334xf517d44b(gap, isAreaClipped, drawContext, (PdfCanvas) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$drawBorder$0$com-itextpdf-layout-renderer-MulticolRenderer  reason: not valid java name */
    public /* synthetic */ void m7334xf517d44b(Border gap, boolean isAreaClipped, DrawContext drawContext, PdfCanvas canvas) {
        for (int i = 0; i < getChildRenderers().size() - 1; i++) {
            Rectangle columnBBox = getChildRenderers().get(i).getOccupiedArea().getBBox();
            Rectangle columnSpaceBBox = new Rectangle(columnBBox.getX() + columnBBox.getWidth(), columnBBox.getY(), this.columnGap, columnBBox.getHeight());
            float x1 = columnSpaceBBox.getX() + (columnSpaceBBox.getWidth() / 2.0f) + (gap.getWidth() / 2.0f);
            float y1 = columnSpaceBBox.getY();
            float y2 = columnSpaceBBox.getY() + columnSpaceBBox.getHeight();
            gap.draw(canvas, x1, y1, x1, y2, Border.Side.RIGHT, 0.0f, 0.0f);
        }
        if (isAreaClipped) {
            drawContext.getCanvas().restoreState();
        }
    }

    protected MulticolLayoutResult layoutInColumns(LayoutContext layoutContext, Rectangle actualBBox) {
        LayoutResult inifiniteHeighOneColumnLayoutResult = this.elementRenderer.layout(new LayoutContext(new LayoutArea(1, new Rectangle(this.columnWidth, 1000000.0f))));
        if (inifiniteHeighOneColumnLayoutResult.getStatus() != 1) {
            MulticolLayoutResult result = new MulticolLayoutResult();
            result.setCauseOfNothing(inifiniteHeighOneColumnLayoutResult.getCauseOfNothing());
            return result;
        }
        this.approximateHeight = inifiniteHeighOneColumnLayoutResult.getOccupiedArea().getBBox().getHeight() / this.columnCount;
        return balanceContentAndLayoutColumns(layoutContext, actualBBox);
    }

    protected AbstractRenderer createSplitRenderer(List<IRenderer> children) {
        AbstractRenderer splitRenderer = (AbstractRenderer) getNextRenderer();
        splitRenderer.parent = this.parent;
        splitRenderer.modelElement = this.modelElement;
        splitRenderer.occupiedArea = this.occupiedArea;
        splitRenderer.isLastRendererForModelElement = false;
        splitRenderer.setChildRenderers(children);
        splitRenderer.addAllProperties(getOwnProperties());
        ContinuousContainer.setupContinuousContainerIfNeeded(splitRenderer);
        return splitRenderer;
    }

    protected AbstractRenderer createOverflowRenderer(IRenderer overflowedContentRenderer) {
        MulticolRenderer overflowRenderer = (MulticolRenderer) getNextRenderer();
        overflowRenderer.isFirstLayout = false;
        overflowRenderer.parent = this.parent;
        overflowRenderer.modelElement = this.modelElement;
        overflowRenderer.addAllProperties(getOwnProperties());
        List<IRenderer> children = new ArrayList<>(1);
        children.add(overflowedContentRenderer);
        overflowRenderer.setChildRenderers(children);
        ContinuousContainer.clearPropertiesFromOverFlowRenderer(overflowRenderer);
        return overflowRenderer;
    }

    private void setOverflowForAllChildren(IRenderer renderer) {
        if (renderer == null || (renderer instanceof AreaBreakRenderer)) {
            return;
        }
        renderer.setProperty(103, OverflowPropertyValue.VISIBLE);
        for (IRenderer child : renderer.getChildRenderers()) {
            setOverflowForAllChildren(child);
        }
    }

    private void drawTaggedWhenNeeded(DrawContext drawContext, Consumer<PdfCanvas> action) {
        PdfCanvas canvas = drawContext.getCanvas();
        if (drawContext.isTaggingEnabled()) {
            canvas.openTag(new CanvasArtifact());
        }
        action.accept(canvas);
        if (drawContext.isTaggingEnabled()) {
            canvas.closeTag();
        }
    }

    private void applyWidth(Rectangle parentBbox, float originalWidth) {
        Float blockWidth = retrieveWidth(originalWidth);
        if (blockWidth != null) {
            parentBbox.setWidth(blockWidth.floatValue());
            return;
        }
        Float minWidth = retrieveMinWidth(parentBbox.getWidth());
        if (minWidth != null && minWidth.floatValue() > parentBbox.getWidth()) {
            parentBbox.setWidth(minWidth.floatValue());
        }
    }

    private Float determineHeight(Rectangle parentBBox) {
        Float height = retrieveHeight();
        Float minHeight = retrieveMinHeight();
        Float maxHeight = retrieveMaxHeight();
        if ((height == null || (minHeight != null && height.floatValue() < minHeight.floatValue())) && minHeight != null && parentBBox.getHeight() < minHeight.floatValue()) {
            height = minHeight;
        }
        if (height != null && maxHeight != null && height.floatValue() > maxHeight.floatValue()) {
            return maxHeight;
        }
        return height;
    }

    private void recalculateHeightWidthAfterLayouting(Rectangle parentBBox, boolean isFull) {
        Float height = determineHeight(parentBBox);
        if (height != null) {
            Float height2 = Float.valueOf(updateOccupiedHeight(height.floatValue(), isFull));
            float heightDelta = parentBBox.getHeight() - height2.floatValue();
            parentBBox.moveUp(heightDelta);
            parentBBox.setHeight(height2.floatValue());
        }
        float heightDelta2 = parentBBox.getWidth();
        applyWidth(parentBBox, heightDelta2);
    }

    private float safelyRetrieveFloatProperty(int property) {
        Object value = getProperty(property);
        if (value instanceof UnitValue) {
            return ((UnitValue) value).getValue();
        }
        if (value instanceof Border) {
            return ((Border) value).getWidth();
        }
        return 0.0f;
    }

    private MulticolLayoutResult balanceContentAndLayoutColumns(LayoutContext prelayoutContext, Rectangle actualBbox) {
        MulticolLayoutResult result = new MulticolLayoutResult();
        int counter = this.heightCalculator.maxAmountOfRelayouts() + 1;
        float maxHeight = actualBbox.getHeight();
        boolean isLastLayout = false;
        while (true) {
            int counter2 = counter - 1;
            if (counter > 0) {
                if (this.approximateHeight > maxHeight) {
                    this.approximateHeight = maxHeight;
                    isLastLayout = true;
                }
                float workingHeight = this.approximateHeight;
                if (this.heightFromProperties != null) {
                    workingHeight = Math.min(this.heightFromProperties.floatValue(), this.approximateHeight);
                }
                result = layoutColumnsAndReturnOverflowRenderer(prelayoutContext, actualBbox, workingHeight);
                if (result.getOverflowRenderer() == null || isLastLayout) {
                    break;
                }
                float additionalHeightPerIteration = this.heightCalculator.getAdditionalHeightOfEachColumn(this, result).floatValue();
                if (Math.abs(additionalHeightPerIteration) <= 1.0E-4f) {
                    clearOverFlowRendererIfNeeded(result);
                    return result;
                }
                this.approximateHeight += additionalHeightPerIteration;
                clearOverFlowRendererIfNeeded(result);
                counter = counter2;
            } else {
                return result;
            }
        }
        clearOverFlowRendererIfNeeded(result);
        return result;
    }

    private void calculateColumnCountAndWidth(float initialWidth) {
        Integer columnCountTemp = (Integer) getProperty(Property.COLUMN_COUNT);
        Float columnWidthTemp = (Float) getProperty(Property.COLUMN_WIDTH);
        Float columnGapTemp = (Float) getProperty(Property.COLUMN_GAP);
        this.columnGap = columnGapTemp == null ? 0.0f : columnGapTemp.floatValue();
        if ((columnCountTemp == null && columnWidthTemp == null) || ((columnCountTemp != null && columnCountTemp.intValue() < 0) || ((columnWidthTemp != null && columnWidthTemp.floatValue() < 0.0f) || this.columnGap < 0.0f))) {
            throw new IllegalStateException(LayoutExceptionMessageConstant.INVALID_COLUMN_PROPERTIES);
        }
        if (columnWidthTemp == null) {
            this.columnCount = columnCountTemp.intValue();
        } else if (columnCountTemp == null) {
            float columnWidthPlusGap = columnWidthTemp.floatValue() + this.columnGap;
            if (columnWidthPlusGap > 1.0E-4f) {
                this.columnCount = Math.max(1, (int) Math.floor((this.columnGap + initialWidth) / columnWidthPlusGap));
            } else {
                this.columnCount = 1;
            }
        } else {
            float columnWidthPlusGap2 = columnWidthTemp.floatValue() + this.columnGap;
            if (columnWidthPlusGap2 > 1.0E-4f) {
                this.columnCount = Math.min(columnCountTemp.intValue(), Math.max(1, (int) Math.floor((this.columnGap + initialWidth) / columnWidthPlusGap2)));
            } else {
                this.columnCount = 1;
            }
        }
        this.columnWidth = Math.max(0.0f, ((this.columnGap + initialWidth) / this.columnCount) - this.columnGap);
    }

    private void clearOverFlowRendererIfNeeded(MulticolLayoutResult result) {
        if (this.heightFromProperties != null && this.heightFromProperties.floatValue() < this.approximateHeight) {
            result.setOverflowRenderer(null);
        }
    }

    private LayoutArea calculateContainerOccupiedArea(LayoutContext layoutContext, boolean isFull) {
        LayoutArea area = layoutContext.getArea().mo7332clone();
        float totalHeight = updateOccupiedHeight(this.approximateHeight, isFull);
        area.getBBox().setHeight(totalHeight);
        Rectangle initialBBox = layoutContext.getArea().getBBox();
        area.getBBox().setY((initialBBox.getY() + initialBBox.getHeight()) - area.getBBox().getHeight());
        recalculateHeightWidthAfterLayouting(area.getBBox(), isFull);
        return area;
    }

    private float updateOccupiedHeight(float initialHeight, boolean isFull) {
        if (isFull) {
            initialHeight = initialHeight + safelyRetrieveFloatProperty(47) + safelyRetrieveFloatProperty(43);
            if (!hasOwnProperty(9) || getProperty(9) == null) {
                initialHeight += safelyRetrieveFloatProperty(10);
            }
        }
        float initialHeight2 = initialHeight + safelyRetrieveFloatProperty(50) + safelyRetrieveFloatProperty(46);
        if (!hasOwnProperty(9) || getProperty(9) == null) {
            initialHeight2 += safelyRetrieveFloatProperty(13);
        }
        float TOP_AND_BOTTOM = (isFull && this.isFirstLayout) ? 2.0f : 1.0f;
        if (!isFull && !this.isFirstLayout) {
            TOP_AND_BOTTOM = 0.0f;
        }
        return initialHeight2 + (safelyRetrieveFloatProperty(9) * TOP_AND_BOTTOM);
    }

    private BlockRenderer getElementsRenderer() {
        if (getChildRenderers().size() != 1 || !(getChildRenderers().get(0) instanceof BlockRenderer)) {
            throw new IllegalStateException("Invalid child renderers, it should be one and be a block element");
        }
        return (BlockRenderer) getChildRenderers().get(0);
    }

    private MulticolLayoutResult layoutColumnsAndReturnOverflowRenderer(LayoutContext preLayoutContext, Rectangle actualBBox, float workingHeight) {
        MulticolLayoutResult result = new MulticolLayoutResult();
        IRenderer renderer = this.elementRenderer;
        for (int i = 0; i < this.columnCount && renderer != null; i++) {
            LayoutArea tempArea = preLayoutContext.getArea().mo7332clone();
            tempArea.getBBox().setWidth(this.columnWidth);
            tempArea.getBBox().setHeight(workingHeight);
            tempArea.getBBox().setX(actualBBox.getX() + ((this.columnWidth + this.columnGap) * i));
            tempArea.getBBox().setY((actualBBox.getY() + actualBBox.getHeight()) - tempArea.getBBox().getHeight());
            LayoutContext columnContext = new LayoutContext(tempArea, preLayoutContext.getMarginsCollapseInfo(), preLayoutContext.getFloatRendererAreas(), preLayoutContext.isClippedHeight());
            renderer.setProperty(89, false);
            LayoutResult tempResultColumn = renderer.layout(columnContext);
            if (tempResultColumn.getStatus() == 3) {
                result.setOverflowRenderer(renderer);
                result.setCauseOfNothing(tempResultColumn.getCauseOfNothing());
                return result;
            }
            if (tempResultColumn.getSplitRenderer() == null) {
                result.getSplitRenderers().add(renderer);
            } else {
                result.getSplitRenderers().add(tempResultColumn.getSplitRenderer());
            }
            renderer = tempResultColumn.getOverflowRenderer();
        }
        result.setOverflowRenderer(renderer);
        return result;
    }

    /* loaded from: classes12.dex */
    public static class MulticolLayoutResult {
        private IRenderer causeOfNothing;
        private AbstractRenderer overflowRenderer;
        private List<IRenderer> splitRenderers = new ArrayList();

        public List<IRenderer> getSplitRenderers() {
            return this.splitRenderers;
        }

        public AbstractRenderer getOverflowRenderer() {
            return this.overflowRenderer;
        }

        public void setOverflowRenderer(AbstractRenderer overflowRenderer) {
            this.overflowRenderer = overflowRenderer;
        }

        public IRenderer getCauseOfNothing() {
            return this.causeOfNothing;
        }

        public void setCauseOfNothing(IRenderer causeOfNothing) {
            this.causeOfNothing = causeOfNothing;
        }
    }

    /* loaded from: classes12.dex */
    public static class LayoutInInfiniteHeightCalculator implements ColumnHeightCalculator {
        protected int maxRelayoutCount = 4;
        private Float height = null;

        @Override // com.itextpdf.layout.renderer.MulticolRenderer.ColumnHeightCalculator
        public Float getAdditionalHeightOfEachColumn(MulticolRenderer renderer, MulticolLayoutResult result) {
            if (this.height != null) {
                return this.height;
            }
            if (result.getOverflowRenderer() == null) {
                return Float.valueOf(0.0f);
            }
            LayoutResult overflowResult = result.getOverflowRenderer().layout(new LayoutContext(new LayoutArea(1, new Rectangle(renderer.columnWidth, 1000000.0f))));
            float overflowHeight = overflowResult.getOccupiedArea().getBBox().getHeight();
            if (result.getSplitRenderers().isEmpty()) {
                overflowHeight -= renderer.approximateHeight;
            }
            this.height = Float.valueOf(overflowHeight / this.maxRelayoutCount);
            return this.height;
        }

        @Override // com.itextpdf.layout.renderer.MulticolRenderer.ColumnHeightCalculator
        public int maxAmountOfRelayouts() {
            return this.maxRelayoutCount;
        }
    }
}
