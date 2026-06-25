package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.margincollapse.MarginsCollapseHandler;
import com.itextpdf.layout.margincollapse.MarginsCollapseInfo;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.AlignmentPropertyValue;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.FlexDirectionPropertyValue;
import com.itextpdf.layout.properties.FlexWrapPropertyValue;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
/* loaded from: classes12.dex */
public class FlexContainerRenderer extends DivRenderer {
    private IFlexItemMainDirector flexItemMainDirector;
    private final Map<Float, Float> hypotheticalCrossSizes;
    private List<List<FlexItemInfo>> lines;

    public FlexContainerRenderer(Div modelElement) {
        super(modelElement);
        this.hypotheticalCrossSizes = new HashMap();
        this.flexItemMainDirector = null;
    }

    @Override // com.itextpdf.layout.renderer.DivRenderer, com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(FlexContainerRenderer.class, getClass());
        return new FlexContainerRenderer((Div) this.modelElement);
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        int i;
        Rectangle rectangleWithoutBordersMarginsPaddings;
        Rectangle layoutContextRectangle = layoutContext.getArea().getBBox();
        setThisAsParent(getChildRenderers());
        this.lines = FlexUtil.calculateChildrenRectangles(layoutContextRectangle, this);
        applyWrapReverse();
        List<IRenderer> renderers = getFlexItemMainDirector().applyDirection(this.lines);
        removeAllChildRenderers(getChildRenderers());
        addAllChildRenderers(renderers);
        List<IRenderer> renderersToOverflow = retrieveRenderersToOverflow(layoutContextRectangle);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        Iterator<List<FlexItemInfo>> it = this.lines.iterator();
        while (true) {
            int i2 = 27;
            i = 77;
            if (!it.hasNext()) {
                break;
            }
            List<FlexItemInfo> line = it.next();
            for (FlexItemInfo itemInfo : line) {
                if (AbstractRenderer.isBorderBoxSizing(itemInfo.getRenderer())) {
                    rectangleWithoutBordersMarginsPaddings = itemInfo.getRenderer().applyMargins(itemInfo.getRectangle().mo7327clone(), false);
                } else {
                    rectangleWithoutBordersMarginsPaddings = itemInfo.getRenderer().applyMarginsBordersPaddings(itemInfo.getRectangle().mo7327clone(), false);
                }
                arrayList.add(itemInfo.getRenderer().getProperty(77));
                arrayList2.add(itemInfo.getRenderer().getProperty(i2));
                arrayList3.add(itemInfo.getRenderer().getProperty(85));
                itemInfo.getRenderer().setProperty(77, UnitValue.createPointValue(rectangleWithoutBordersMarginsPaddings.getWidth()));
                itemInfo.getRenderer().setProperty(i2, UnitValue.createPointValue(rectangleWithoutBordersMarginsPaddings.getHeight()));
                itemInfo.getRenderer().setProperty(85, UnitValue.createPointValue(rectangleWithoutBordersMarginsPaddings.getHeight()));
                itemInfo.getRenderer().setProperty(28, null);
                i2 = 27;
            }
        }
        LayoutResult result = super.layout(layoutContext);
        if (!renderersToOverflow.isEmpty()) {
            adjustLayoutResultToHandleOverflowRenderers(result, renderersToOverflow);
        }
        int counter = 0;
        for (List<FlexItemInfo> line2 : this.lines) {
            for (FlexItemInfo itemInfo2 : line2) {
                itemInfo2.getRenderer().setProperty(i, arrayList.get(counter));
                itemInfo2.getRenderer().setProperty(27, arrayList2.get(counter));
                itemInfo2.getRenderer().setProperty(85, arrayList3.get(counter));
                counter++;
                i = 77;
            }
            i = 77;
        }
        return result;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        MinMaxWidth minMaxWidth = new MinMaxWidth(calculateAdditionalWidth(this));
        AbstractWidthHandler minMaxWidthHandler = new MaxMaxWidthHandler(minMaxWidth);
        if (!setMinMaxWidthBasedOnFixedWidth(minMaxWidth)) {
            Float minWidth = hasAbsoluteUnitValue(80) ? retrieveMinWidth(0.0f) : null;
            Float maxWidth = hasAbsoluteUnitValue(79) ? retrieveMaxWidth(0.0f) : null;
            if (minWidth == null || maxWidth == null) {
                findMinMaxWidthIfCorrespondingPropertiesAreNotSet(minMaxWidth, minMaxWidthHandler);
            }
            if (minWidth != null) {
                minMaxWidth.setChildrenMinWidth(minWidth.floatValue());
            }
            if (maxWidth == null) {
                if (minMaxWidth.getChildrenMinWidth() > minMaxWidth.getChildrenMaxWidth()) {
                    minMaxWidth.setChildrenMaxWidth(minMaxWidth.getChildrenMinWidth());
                }
            } else {
                minMaxWidth.setChildrenMaxWidth(maxWidth.floatValue());
            }
        }
        if (getPropertyAsFloat(55) != null) {
            return RotationUtils.countRotationMinMaxWidth(minMaxWidth, this);
        }
        return minMaxWidth;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IFlexItemMainDirector getFlexItemMainDirector() {
        if (this.flexItemMainDirector == null) {
            this.flexItemMainDirector = createMainDirector();
        }
        return this.flexItemMainDirector;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isWrapReverse() {
        return FlexWrapPropertyValue.WRAP_REVERSE == getProperty(128, null);
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    AbstractRenderer[] createSplitAndOverflowRenderers(int childPos, int layoutStatus, LayoutResult childResult, Map<Integer, IRenderer> waitingFloatsSplitRenderers, List<IRenderer> waitingOverflowFloatRenderers) {
        List<FlexItemInfo> line;
        boolean z;
        boolean z2;
        AbstractRenderer splitRenderer = createSplitRenderer(layoutStatus);
        AbstractRenderer overflowRenderer = createOverflowRenderer(layoutStatus);
        final IRenderer childRenderer = getChildRenderers().get(childPos);
        boolean forcedPlacement = Boolean.TRUE.equals(getProperty(26));
        boolean metChildRenderer = false;
        int i = 0;
        while (true) {
            boolean z3 = true;
            if (i < this.lines.size()) {
                List<FlexItemInfo> line2 = this.lines.get(i);
                boolean isSplitLine = line2.stream().anyMatch(new Predicate() { // from class: com.itextpdf.layout.renderer.FlexContainerRenderer$$ExternalSyntheticLambda0
                    @Override // java.util.function.Predicate
                    public final boolean test(Object obj) {
                        return FlexContainerRenderer.lambda$createSplitAndOverflowRenderers$0(IRenderer.this, (FlexItemInfo) obj);
                    }
                });
                boolean metChildRenderer2 = metChildRenderer || isSplitLine;
                if (!isSplitLine || forcedPlacement || layoutStatus != 2) {
                    line = line2;
                } else {
                    if (FlexUtil.isColumnDirection(this)) {
                        if (i != 0) {
                            line = line2;
                        } else if (line2.get(0).getRenderer() != childRenderer) {
                            line = line2;
                        }
                    }
                    fillSplitOverflowRenderersForPartialResult(splitRenderer, overflowRenderer, line2, childRenderer, childResult);
                    getFlexItemMainDirector().applyDirectionForLine(overflowRenderer.getChildRenderers());
                    i++;
                    metChildRenderer = metChildRenderer2;
                }
                ArrayList arrayList = new ArrayList();
                boolean isSingleColumn = this.lines.size() == 1 && FlexUtil.isColumnDirection(this);
                boolean metChildRendererInLine = false;
                for (FlexItemInfo itemInfo : line) {
                    if (metChildRendererInLine) {
                        z = z3;
                    } else {
                        z = z3;
                        if (itemInfo.getRenderer() != childRenderer) {
                            z2 = false;
                            metChildRendererInLine = z2;
                            if (((isSingleColumn && metChildRenderer2) || metChildRendererInLine) && !forcedPlacement) {
                                arrayList.add(itemInfo.getRenderer());
                            } else {
                                splitRenderer.addChildRenderer(itemInfo.getRenderer());
                            }
                            z3 = z;
                        }
                    }
                    z2 = z;
                    metChildRendererInLine = z2;
                    if (isSingleColumn) {
                    }
                    splitRenderer.addChildRenderer(itemInfo.getRenderer());
                    z3 = z;
                }
                getFlexItemMainDirector().applyDirectionForLine(arrayList);
                if (isWrapReverse()) {
                    overflowRenderer.addAllChildRenderers(0, arrayList);
                } else {
                    overflowRenderer.addAllChildRenderers(arrayList);
                }
                i++;
                metChildRenderer = metChildRenderer2;
            } else {
                overflowRenderer.deleteOwnProperty(26);
                return new AbstractRenderer[]{splitRenderer, overflowRenderer};
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$createSplitAndOverflowRenderers$0(IRenderer childRenderer, FlexItemInfo flexItem) {
        return flexItem.getRenderer() == childRenderer;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    LayoutResult processNotFullChildResult(LayoutContext layoutContext, Map<Integer, IRenderer> waitingFloatsSplitRenderers, List<IRenderer> waitingOverflowFloatRenderers, boolean wasHeightClipped, List<Rectangle> floatRendererAreas, boolean marginsCollapsingEnabled, float clearHeightCorrection, Border[] borders, UnitValue[] paddings, List<Rectangle> areas, int currentAreaPos, Rectangle layoutBox, Set<Rectangle> nonChildFloatingRendererAreas, IRenderer causeOfNothing, boolean anythingPlaced, int childPos, LayoutResult result) {
        AbstractRenderer splitRenderer;
        boolean keepTogether = isKeepTogether(causeOfNothing);
        if (!Boolean.TRUE.equals(getPropertyAsBoolean(26)) && !wasHeightClipped) {
            AbstractRenderer[] splitAndOverflowRenderers = createSplitAndOverflowRenderers(childPos, result.getStatus(), result, waitingFloatsSplitRenderers, waitingOverflowFloatRenderers);
            AbstractRenderer splitRenderer2 = splitAndOverflowRenderers[0];
            AbstractRenderer overflowRenderer = splitAndOverflowRenderers[1];
            overflowRenderer.deleteOwnProperty(26);
            updateHeightsOnSplit(wasHeightClipped, splitRenderer2, overflowRenderer);
            if (isRelativePosition() && !this.positionedRenderers.isEmpty()) {
                overflowRenderer.positionedRenderers = new ArrayList(this.positionedRenderers);
            }
            if (!keepTogether) {
                splitRenderer = splitRenderer2;
            } else {
                overflowRenderer.setChildRenderers(getChildRenderers());
                splitRenderer = null;
            }
            correctFixedLayout(layoutBox);
            applyAbsolutePositionIfNeeded(layoutContext);
            applyPaddings(this.occupiedArea.getBBox(), paddings, true);
            applyBorderBox(this.occupiedArea.getBBox(), borders, true);
            applyMargins(this.occupiedArea.getBBox(), true);
            if (splitRenderer != null && !splitRenderer.getChildRenderers().isEmpty()) {
                return new LayoutResult(2, layoutContext.getArea(), splitRenderer, overflowRenderer, null).setAreaBreak(result.getAreaBreak());
            }
            return new LayoutResult(3, null, null, overflowRenderer, result.getCauseOfNothing()).setAreaBreak(result.getAreaBreak());
        }
        AbstractRenderer splitRenderer3 = keepTogether ? null : createSplitRenderer(result.getStatus());
        if (splitRenderer3 != null) {
            splitRenderer3.setChildRenderers(getChildRenderers());
        }
        return new LayoutResult(1, getOccupiedAreaInCaseNothingWasWrappedWithFull(result, splitRenderer3), splitRenderer3, null, null);
    }

    LayoutArea getOccupiedAreaInCaseNothingWasWrappedWithFull(LayoutResult result, IRenderer splitRenderer) {
        return result.getOccupiedArea() != null ? result.getOccupiedArea() : splitRenderer.getOccupiedArea();
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    boolean stopLayoutingChildrenIfChildResultNotFull(LayoutResult returnResult) {
        return returnResult.getStatus() != 1;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    void recalculateOccupiedAreaAfterChildLayout(Rectangle resultBBox, Float blockMaxHeight) {
        Rectangle oldBBox = this.occupiedArea.getBBox().mo7327clone();
        Rectangle recalculatedRectangle = Rectangle.getCommonRectangle(this.occupiedArea.getBBox(), resultBBox);
        this.occupiedArea.getBBox().setY(recalculatedRectangle.getY());
        this.occupiedArea.getBBox().setHeight(recalculatedRectangle.getHeight());
        if (oldBBox.getTop() < this.occupiedArea.getBBox().getTop()) {
            this.occupiedArea.getBBox().decreaseHeight(this.occupiedArea.getBBox().getTop() - oldBBox.getTop());
        }
        if (blockMaxHeight != null && this.occupiedArea.getBBox().getHeight() > blockMaxHeight.floatValue()) {
            this.occupiedArea.getBBox().moveUp(this.occupiedArea.getBBox().getHeight() - blockMaxHeight.floatValue());
            this.occupiedArea.getBBox().setHeight(blockMaxHeight.floatValue());
        }
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    MarginsCollapseInfo startChildMarginsHandling(IRenderer childRenderer, Rectangle layoutBox, MarginsCollapseHandler marginsCollapseHandler) {
        return marginsCollapseHandler.startChildMarginsHandling(null, layoutBox);
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    void decreaseLayoutBoxAfterChildPlacement(Rectangle layoutBox, LayoutResult result, IRenderer childRenderer) {
        if (FlexUtil.isColumnDirection(this)) {
            decreaseLayoutBoxAfterChildPlacementColumnLayout(layoutBox, childRenderer);
        } else {
            decreaseLayoutBoxAfterChildPlacementRowLayout(layoutBox, result, childRenderer);
        }
    }

    void decreaseLayoutBoxAfterChildPlacementRowLayout(Rectangle layoutBox, LayoutResult result, IRenderer childRenderer) {
        layoutBox.decreaseWidth(result.getOccupiedArea().getBBox().getRight() - layoutBox.getLeft());
        layoutBox.setX(result.getOccupiedArea().getBBox().getRight());
        List<FlexItemInfo> line = findLine(childRenderer);
        boolean isLastInLine = childRenderer.equals(line.get(line.size() - 1).getRenderer());
        if (isLastInLine) {
            float minBottom = layoutBox.getTop();
            float minLeft = layoutBox.getLeft();
            float commonWidth = 0.0f;
            for (FlexItemInfo item : line) {
                minLeft = Math.min(minLeft, item.getRenderer().getOccupiedArea().getBBox().getLeft() - item.getRectangle().getLeft());
                minBottom = Math.min(minBottom, item.getRenderer().getOccupiedArea().getBBox().getBottom());
                commonWidth += item.getRectangle().getLeft() + item.getRenderer().getOccupiedArea().getBBox().getWidth();
            }
            layoutBox.setX(minLeft);
            layoutBox.increaseWidth(commonWidth);
            layoutBox.decreaseHeight(layoutBox.getTop() - minBottom);
        }
    }

    void decreaseLayoutBoxAfterChildPlacementColumnLayout(Rectangle layoutBox, IRenderer childRenderer) {
        FlexItemInfo childFlexItemInfo = findFlexItemInfo((AbstractRenderer) childRenderer);
        layoutBox.decreaseHeight(childFlexItemInfo.getRenderer().getOccupiedArea().getBBox().getHeight() + childFlexItemInfo.getRectangle().getY());
        List<FlexItemInfo> line = findLine(childRenderer);
        boolean isLastInLine = childRenderer.equals(line.get(line.size() - 1).getRenderer());
        if (isLastInLine) {
            float maxWidth = 0.0f;
            float commonHeight = 0.0f;
            for (FlexItemInfo item : line) {
                maxWidth = Math.max(maxWidth, item.getRenderer().getOccupiedArea().getBBox().getWidth() + item.getRectangle().getX());
                commonHeight += item.getRectangle().getY() + item.getRenderer().getOccupiedArea().getBBox().getHeight();
            }
            layoutBox.increaseHeight(commonHeight);
            layoutBox.decreaseWidth(maxWidth);
            layoutBox.moveRight(maxWidth);
        }
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    Rectangle recalculateLayoutBoxBeforeChildLayout(Rectangle layoutBox, IRenderer childRenderer, Rectangle initialLayoutBox) {
        FlexItemInfo childFlexItemInfo;
        Rectangle layoutBoxCopy = layoutBox.mo7327clone();
        if ((childRenderer instanceof AbstractRenderer) && (childFlexItemInfo = findFlexItemInfo((AbstractRenderer) childRenderer)) != null) {
            layoutBoxCopy.decreaseWidth(childFlexItemInfo.getRectangle().getX());
            layoutBoxCopy.moveRight(childFlexItemInfo.getRectangle().getX());
            layoutBoxCopy.decreaseHeight(childFlexItemInfo.getRectangle().getY());
        }
        return layoutBoxCopy;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    void handleForcedPlacement(boolean anythingPlaced) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setHypotheticalCrossSize(Float mainSize, Float hypotheticalCrossSize) {
        this.hypotheticalCrossSizes.put(Float.valueOf(mainSize.floatValue()), hypotheticalCrossSize);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Float getHypotheticalCrossSize(Float mainSize) {
        return this.hypotheticalCrossSizes.get(Float.valueOf(mainSize.floatValue()));
    }

    private void applyWrapReverse() {
        if (!isWrapReverse()) {
            return;
        }
        Collections.reverse(this.lines);
        List<IRenderer> reorderedRendererList = new ArrayList<>();
        for (List<FlexItemInfo> line : this.lines) {
            for (FlexItemInfo itemInfo : line) {
                reorderedRendererList.add(itemInfo.getRenderer());
            }
        }
        removeAllChildRenderers(getChildRenderers());
        addAllChildRenderers(reorderedRendererList);
    }

    private FlexItemInfo findFlexItemInfo(AbstractRenderer renderer) {
        for (List<FlexItemInfo> line : this.lines) {
            for (FlexItemInfo itemInfo : line) {
                if (itemInfo.getRenderer().equals(renderer)) {
                    return itemInfo;
                }
            }
        }
        return null;
    }

    private List<FlexItemInfo> findLine(IRenderer renderer) {
        for (List<FlexItemInfo> line : this.lines) {
            for (FlexItemInfo itemInfo : line) {
                if (itemInfo.getRenderer().equals(renderer)) {
                    return line;
                }
            }
        }
        return null;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    void fixOccupiedAreaIfOverflowedX(OverflowPropertyValue overflowX, Rectangle layoutBox) {
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void addChild(IRenderer renderer) {
        renderer.setProperty(103, OverflowPropertyValue.VISIBLE);
        super.addChild(renderer);
    }

    private static void addSimulateDiv(AbstractRenderer overflowRenderer, float width) {
        IRenderer fakeOverflowRenderer = new DivRenderer(new Div().setMinWidth(width).setMaxWidth(width));
        overflowRenderer.addChildRenderer(fakeOverflowRenderer);
    }

    private void fillSplitOverflowRenderersForPartialResult(AbstractRenderer splitRenderer, AbstractRenderer overflowRenderer, List<FlexItemInfo> line, IRenderer childRenderer, LayoutResult childResult) {
        float occupiedSpace = 0.0f;
        float maxHeightInLine = 0.0f;
        boolean metChildRendererInLine = false;
        for (FlexItemInfo itemInfo : line) {
            if (itemInfo.getRenderer() == childRenderer) {
                metChildRendererInLine = true;
                if (childResult.getSplitRenderer() != null) {
                    splitRenderer.addChildRenderer(childResult.getSplitRenderer());
                }
                if (childResult.getOverflowRenderer() != null) {
                    if (!FlexUtil.isColumnDirection(this)) {
                        childResult.getOverflowRenderer().setProperty(Property.ALIGN_SELF, AlignmentPropertyValue.START);
                    }
                    overflowRenderer.addChildRenderer(childResult.getOverflowRenderer());
                }
                maxHeightInLine = Math.max(maxHeightInLine, itemInfo.getRectangle().getY() + itemInfo.getRenderer().getOccupiedAreaBBox().getHeight());
            } else if (metChildRendererInLine) {
                if (FlexUtil.isColumnDirection(this)) {
                    overflowRenderer.addChildRenderer(itemInfo.getRenderer());
                } else {
                    Rectangle neighbourBbox = new Rectangle(getOccupiedAreaBBox().getX() + occupiedSpace, getOccupiedAreaBBox().getY(), itemInfo.getRectangle().getWidth(), maxHeightInLine - itemInfo.getRectangle().getY());
                    LayoutResult neighbourLayoutResult = itemInfo.getRenderer().layout(new LayoutContext(new LayoutArea(childResult.getOccupiedArea().getPageNumber(), neighbourBbox)));
                    if (neighbourLayoutResult.getStatus() == 2 && neighbourLayoutResult.getSplitRenderer() != null) {
                        splitRenderer.addChildRenderer(neighbourLayoutResult.getSplitRenderer());
                    } else if (neighbourLayoutResult.getStatus() == 1) {
                        splitRenderer.addChildRenderer(itemInfo.getRenderer());
                    }
                    if (neighbourLayoutResult.getOverflowRenderer() != null) {
                        if (neighbourLayoutResult.getStatus() == 2) {
                            neighbourLayoutResult.getOverflowRenderer().setProperty(Property.ALIGN_SELF, AlignmentPropertyValue.START);
                        }
                        overflowRenderer.addChildRenderer(neighbourLayoutResult.getOverflowRenderer());
                    } else {
                        addSimulateDiv(overflowRenderer, itemInfo.getRectangle().getWidth());
                    }
                }
            } else {
                splitRenderer.addChildRenderer(itemInfo.getRenderer());
                addSimulateDiv(overflowRenderer, itemInfo.getRectangle().getWidth());
                maxHeightInLine = Math.max(maxHeightInLine, itemInfo.getRectangle().getY() + itemInfo.getRenderer().getOccupiedAreaBBox().getHeight());
            }
            occupiedSpace += itemInfo.getRectangle().getX() + itemInfo.getRectangle().getWidth();
        }
    }

    private void findMinMaxWidthIfCorrespondingPropertiesAreNotSet(MinMaxWidth minMaxWidth, AbstractWidthHandler minMaxWidthHandler) {
        float initialMinWidth = minMaxWidth.getChildrenMinWidth();
        float initialMaxWidth = minMaxWidth.getChildrenMaxWidth();
        if (this.lines == null || this.lines.size() == 1) {
            findMinMaxWidth(initialMinWidth, initialMaxWidth, minMaxWidthHandler, getChildRenderers());
            return;
        }
        for (List<FlexItemInfo> line : this.lines) {
            List<IRenderer> childRenderers = new ArrayList<>();
            for (FlexItemInfo itemInfo : line) {
                childRenderers.add(itemInfo.getRenderer());
            }
            findMinMaxWidth(initialMinWidth, initialMaxWidth, minMaxWidthHandler, childRenderers);
        }
    }

    private void findMinMaxWidth(float initialMinWidth, float initialMaxWidth, AbstractWidthHandler minMaxWidthHandler, List<IRenderer> childRenderers) {
        MinMaxWidth childMinMaxWidth;
        float maxWidth = initialMaxWidth;
        float minWidth = initialMinWidth;
        for (IRenderer childRenderer : childRenderers) {
            childRenderer.setParent(this);
            if (childRenderer instanceof AbstractRenderer) {
                childMinMaxWidth = ((AbstractRenderer) childRenderer).getMinMaxWidth();
            } else {
                childMinMaxWidth = MinMaxWidthUtils.countDefaultMinMaxWidth(childRenderer);
            }
            if (FlexUtil.isColumnDirection(this)) {
                maxWidth = Math.max(maxWidth, childMinMaxWidth.getMaxWidth());
                minWidth = Math.max(minWidth, childMinMaxWidth.getMinWidth());
            } else {
                maxWidth += childMinMaxWidth.getMaxWidth();
                minWidth += childMinMaxWidth.getMinWidth();
            }
        }
        minMaxWidthHandler.updateMaxChildWidth(maxWidth);
        minMaxWidthHandler.updateMinChildWidth(minWidth);
    }

    private boolean isRowReverse() {
        return FlexDirectionPropertyValue.ROW_REVERSE == getProperty(Property.FLEX_DIRECTION, null);
    }

    private boolean isColumnReverse() {
        return FlexDirectionPropertyValue.COLUMN_REVERSE == getProperty(Property.FLEX_DIRECTION, null);
    }

    private IFlexItemMainDirector createMainDirector() {
        if (FlexUtil.isColumnDirection(this)) {
            return isColumnReverse() ? new BottomToTopFlexItemMainDirector() : new TopToBottomFlexItemMainDirector();
        }
        boolean isRtlDirection = BaseDirection.RIGHT_TO_LEFT == getProperty(7, null);
        this.flexItemMainDirector = isRowReverse() ^ isRtlDirection ? new RtlFlexItemMainDirector() : new LtrFlexItemMainDirector();
        return this.flexItemMainDirector;
    }

    private List<IRenderer> retrieveRenderersToOverflow(Rectangle flexContainerBBox) {
        List<IRenderer> renderersToOverflow = new ArrayList<>();
        Rectangle layoutContextRectangle = flexContainerBBox.mo7327clone();
        applyMarginsBordersPaddings(layoutContextRectangle, false);
        if (FlexUtil.isColumnDirection(this) && FlexUtil.getMainSize(this, layoutContextRectangle) >= layoutContextRectangle.getHeight()) {
            float commonLineCrossSize = 0.0f;
            List<Float> lineCrossSizes = FlexUtil.calculateColumnDirectionCrossSizes(this.lines);
            for (int i = 0; i < this.lines.size(); i++) {
                commonLineCrossSize += lineCrossSizes.get(i).floatValue();
                if (i > 0 && commonLineCrossSize > layoutContextRectangle.getWidth()) {
                    ArrayList arrayList = new ArrayList();
                    for (FlexItemInfo itemInfo : this.lines.get(i)) {
                        arrayList.add(itemInfo.getRenderer());
                    }
                    getFlexItemMainDirector().applyDirectionForLine(arrayList);
                    if (isWrapReverse()) {
                        renderersToOverflow.addAll(0, arrayList);
                    } else {
                        renderersToOverflow.addAll(arrayList);
                    }
                    for (IRenderer renderer : renderersToOverflow) {
                        this.childRenderers.remove(renderer);
                    }
                }
            }
        }
        return renderersToOverflow;
    }

    private void adjustLayoutResultToHandleOverflowRenderers(LayoutResult result, List<IRenderer> renderersToOverflow) {
        if (1 == result.getStatus()) {
            IRenderer splitRenderer = createSplitRenderer(2);
            IRenderer overflowRenderer = createOverflowRenderer(2);
            for (IRenderer childRenderer : renderersToOverflow) {
                overflowRenderer.addChild(childRenderer);
            }
            for (IRenderer childRenderer2 : getChildRenderers()) {
                splitRenderer.addChild(childRenderer2);
            }
            result.setStatus(2);
            result.setSplitRenderer(splitRenderer);
            result.setOverflowRenderer(overflowRenderer);
        }
        if (2 == result.getStatus()) {
            IRenderer overflowRenderer2 = result.getOverflowRenderer();
            for (IRenderer childRenderer3 : renderersToOverflow) {
                if (!overflowRenderer2.getChildRenderers().contains(childRenderer3)) {
                    overflowRenderer2.addChild(childRenderer3);
                }
            }
        }
    }
}
