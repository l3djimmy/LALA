package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.LineLayoutContext;
import com.itextpdf.layout.layout.LineLayoutResult;
import com.itextpdf.layout.layout.MinMaxWidthLayoutResult;
import com.itextpdf.layout.logs.LayoutLogMessageConstant;
import com.itextpdf.layout.margincollapse.MarginsCollapseHandler;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.ContinuousContainer;
import com.itextpdf.layout.properties.FloatPropertyValue;
import com.itextpdf.layout.properties.Leading;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.ParagraphOrphansControl;
import com.itextpdf.layout.properties.ParagraphWidowsControl;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.RenderingMode;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ParagraphRenderer extends BlockRenderer {
    protected List<LineRenderer> lines;

    public ParagraphRenderer(Paragraph modelElement) {
        super(modelElement);
        this.lines = null;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        ParagraphOrphansControl orphansControl = (ParagraphOrphansControl) getProperty(Property.ORPHANS_CONTROL);
        ParagraphWidowsControl widowsControl = (ParagraphWidowsControl) getProperty(Property.WIDOWS_CONTROL);
        if (orphansControl != null || widowsControl != null) {
            return OrphansWidowsLayoutHelper.orphansWidowsAwareLayout(this, layoutContext, orphansControl, widowsControl);
        }
        LayoutResult layoutResult = directLayout(layoutContext);
        updateParentLines(this);
        updateParentLines((ParagraphRenderer) layoutResult.getSplitRenderer());
        return layoutResult;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r66v0, types: [com.itextpdf.layout.renderer.ParagraphRenderer, java.lang.Object, com.itextpdf.layout.renderer.IRenderer, com.itextpdf.layout.renderer.AbstractRenderer] */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11, types: [boolean] */
    /* JADX WARN: Type inference failed for: r8v13 */
    public LayoutResult directLayout(LayoutContext layoutContext) {
        MarginsCollapseHandler marginsCollapseHandler;
        float clearHeightCorrection;
        Float blockWidth;
        OverflowPropertyValue overflowX;
        List<Rectangle> floatRendererAreas;
        Float blockMaxHeight;
        Float blockWidth2;
        List<Rectangle> areas;
        OverflowPropertyValue overflowY;
        Border[] borders;
        UnitValue[] paddings;
        float lineIndent;
        float lineIndent2;
        LineLayoutResult result;
        boolean onlyOverflowedFloatsLeft;
        int pageNumber;
        List<IRenderer> inlineFloatsOverflowedToNextPage;
        float minChildWidth;
        float maxChildWidth;
        LineLayoutResult result2;
        boolean isFit;
        Leading leading;
        List<IRenderer> inlineFloatsOverflowedToNextPage2;
        boolean floatOverflowedToNextPageWithNothing;
        OverflowPropertyValue overflowY2;
        boolean marginsCollapsingEnabled;
        int i;
        LineRenderer processedRenderer;
        float deltaY;
        float clearHeightCorrection2;
        LineRenderer currentRenderer;
        boolean firstLineInBox;
        OverflowPropertyValue overflowY3;
        boolean minHeightOverflowed;
        ?? r8;
        boolean wasParentsHeightClipped = layoutContext.isClippedHeight();
        int pageNumber2 = layoutContext.getArea().getPageNumber();
        boolean anythingPlaced = false;
        LineRenderer currentRenderer2 = (LineRenderer) new LineRenderer().setParent(this);
        Rectangle parentBBox = layoutContext.getArea().getBBox().mo7327clone();
        boolean marginsCollapsingEnabled2 = Boolean.TRUE.equals(getPropertyAsBoolean(89));
        if (marginsCollapsingEnabled2) {
            MarginsCollapseHandler marginsCollapseHandler2 = new MarginsCollapseHandler(this, layoutContext.getMarginsCollapseInfo());
            marginsCollapseHandler = marginsCollapseHandler2;
        } else {
            marginsCollapseHandler = null;
        }
        ContinuousContainer.setupContinuousContainerIfNeeded(this);
        OverflowPropertyValue overflowX2 = (OverflowPropertyValue) getProperty(103);
        Boolean nowrapProp = getPropertyAsBoolean(Property.NO_SOFT_WRAP_INLINE);
        currentRenderer2.setProperty(Property.NO_SOFT_WRAP_INLINE, nowrapProp);
        boolean notAllKidsAreFloats = false;
        List<Rectangle> floatRendererAreas2 = layoutContext.getFloatRendererAreas();
        FloatPropertyValue floatPropertyValue = (FloatPropertyValue) getProperty(99);
        float clearHeightCorrection3 = FloatingHelper.calculateClearHeightCorrection(this, floatRendererAreas2, parentBBox);
        FloatingHelper.applyClearance(parentBBox, marginsCollapseHandler, clearHeightCorrection3, FloatingHelper.isRendererFloating(this));
        Float blockWidth3 = retrieveWidth(parentBBox.getWidth());
        if (FloatingHelper.isRendererFloating(this, floatPropertyValue)) {
            clearHeightCorrection = clearHeightCorrection3;
            blockWidth = FloatingHelper.adjustFloatedBlockLayoutBox(this, parentBBox, blockWidth3, floatRendererAreas2, floatPropertyValue, overflowX2);
            overflowX = overflowX2;
            floatRendererAreas = new ArrayList<>();
        } else {
            clearHeightCorrection = clearHeightCorrection3;
            blockWidth = blockWidth3;
            overflowX = overflowX2;
            floatRendererAreas = floatRendererAreas2;
        }
        if (this.childRenderers.size() == 0) {
            anythingPlaced = true;
            currentRenderer2 = null;
        }
        boolean isPositioned = isPositioned();
        Float rotation = getPropertyAsFloat(55);
        Float blockWidth4 = blockWidth;
        Float blockMaxHeight2 = retrieveMaxHeight();
        boolean onlyOverflowedFloatsLeft2 = anythingPlaced;
        OverflowPropertyValue overflowY4 = ((blockMaxHeight2 == null || blockMaxHeight2.floatValue() > parentBBox.getHeight()) && !wasParentsHeightClipped) ? OverflowPropertyValue.FIT : (OverflowPropertyValue) getProperty(104);
        if (rotation != null || isFixedLayout()) {
            blockMaxHeight = blockMaxHeight2;
            parentBBox.moveDown(1000000.0f - parentBBox.getHeight()).setHeight(1000000.0f);
        } else {
            blockMaxHeight = blockMaxHeight2;
        }
        if (rotation != null && !FloatingHelper.isRendererFloating(this)) {
            blockWidth2 = RotationUtils.retrieveRotatedLayoutWidth(parentBBox.getWidth(), this);
        } else {
            blockWidth2 = blockWidth4;
        }
        if (marginsCollapsingEnabled2) {
            marginsCollapseHandler.startMarginsCollapse(parentBBox);
        }
        Border[] borders2 = getBorders();
        UnitValue[] paddings2 = getPaddings();
        float parentWidth = parentBBox.getWidth();
        boolean firstLineInBox2 = true;
        applyMargins(parentBBox, false);
        applyBorderBox(parentBBox, borders2, false);
        if (isFixedLayout()) {
            parentBBox.setX(getPropertyAsFloat(34).floatValue());
        }
        applyPaddings(parentBBox, paddings2, false);
        float additionalWidth = parentWidth - parentBBox.getWidth();
        applyWidth(parentBBox, blockWidth2, overflowX);
        OverflowPropertyValue overflowX3 = overflowX;
        MarginsCollapseHandler marginsCollapseHandler3 = marginsCollapseHandler;
        List<Rectangle> floatRendererAreas3 = floatRendererAreas;
        OverflowPropertyValue overflowY5 = overflowY4;
        UnitValue[] paddings3 = paddings2;
        boolean wasHeightClipped = applyMaxHeight(parentBBox, blockMaxHeight, marginsCollapseHandler3, false, wasParentsHeightClipped, overflowY5);
        MarginsCollapseHandler marginsCollapseHandler4 = marginsCollapseHandler3;
        OverflowPropertyValue overflowY6 = overflowY5;
        MinMaxWidth minMaxWidth = new MinMaxWidth(additionalWidth);
        AbstractWidthHandler widthHandler = new MaxMaxWidthHandler(minMaxWidth);
        if (!isPositioned) {
            areas = initElementAreas(new LayoutArea(pageNumber2, parentBBox));
        } else {
            areas = Collections.singletonList(parentBBox);
        }
        MinMaxWidth minMaxWidth2 = minMaxWidth;
        float additionalWidth2 = parentBBox.getX();
        boolean marginsCollapsingEnabled3 = marginsCollapsingEnabled2;
        float clearHeightCorrection4 = clearHeightCorrection;
        this.occupiedArea = new LayoutArea(pageNumber2, new Rectangle(additionalWidth2, parentBBox.getY() + parentBBox.getHeight(), parentBBox.getWidth(), 0.0f));
        shrinkOccupiedAreaForAbsolutePosition();
        TargetCounterHandler.addPageByID(this);
        Rectangle layoutBox = areas.get(0).mo7327clone();
        this.lines = new ArrayList();
        for (IRenderer child : this.childRenderers) {
            notAllKidsAreFloats = notAllKidsAreFloats || !FloatingHelper.isRendererFloating(child);
            currentRenderer2.addChild(child);
        }
        float lastYLine = layoutBox.getY() + layoutBox.getHeight();
        List<IRenderer> inlineFloatsOverflowedToNextPage3 = new ArrayList<>();
        Set<Rectangle> nonChildFloatingRendererAreas = new HashSet<>(floatRendererAreas3);
        if (marginsCollapsingEnabled3 && this.childRenderers.size() > 0) {
            marginsCollapseHandler4.startChildMarginsHandling(null, layoutBox);
        }
        boolean includeFloatsInOccupiedArea = BlockFormattingContextUtil.isRendererCreateBfc(this);
        int currentAreaPos = 0;
        boolean firstLineInBox3 = false;
        boolean onlyOverflowedFloatsLeft3 = false;
        float lastLineBottomLeadingIndent = 0.0f;
        float previousDescent = 0.0f;
        LineRenderer currentRenderer3 = currentRenderer2;
        float lastYLine2 = lastYLine;
        while (true) {
            int currentAreaPos2 = currentAreaPos;
            if (currentRenderer3 == null) {
                OverflowPropertyValue overflowY7 = overflowY6;
                UnitValue[] paddings4 = paddings3;
                boolean includeFloatsInOccupiedArea2 = includeFloatsInOccupiedArea;
                MinMaxWidth minMaxWidth3 = minMaxWidth2;
                boolean marginsCollapsingEnabled4 = marginsCollapsingEnabled3;
                MarginsCollapseHandler marginsCollapseHandler5 = marginsCollapseHandler4;
                Rectangle layoutBox2 = layoutBox;
                float clearHeightCorrection5 = clearHeightCorrection4;
                if (!RenderingMode.HTML_MODE.equals(getProperty(Property.RENDERING_MODE))) {
                    float moveDown = lastLineBottomLeadingIndent;
                    if (isOverflowFit(overflowY7) && moveDown > this.occupiedArea.getBBox().getY() - layoutBox2.getY()) {
                        moveDown = this.occupiedArea.getBBox().getY() - layoutBox2.getY();
                    }
                    this.occupiedArea.getBBox().moveDown(moveDown);
                    this.occupiedArea.getBBox().setHeight(this.occupiedArea.getBBox().getHeight() + moveDown);
                }
                if (marginsCollapsingEnabled4 && this.childRenderers.size() > 0 && notAllKidsAreFloats) {
                    marginsCollapseHandler5.endChildMarginsHandling(layoutBox2);
                }
                if (includeFloatsInOccupiedArea2) {
                    FloatingHelper.includeChildFloatsInOccupiedArea(floatRendererAreas3, (IRenderer) this, nonChildFloatingRendererAreas);
                    fixOccupiedAreaIfOverflowedX(overflowX3, layoutBox2);
                }
                if (!wasHeightClipped) {
                    overflowY = overflowY7;
                } else {
                    overflowY = overflowY7;
                    fixOccupiedAreaIfOverflowedY(overflowY, layoutBox2);
                }
                if (marginsCollapsingEnabled4) {
                    marginsCollapseHandler5.endMarginsCollapse(layoutBox2);
                }
                AbstractRenderer overflowRenderer = applyMinHeight(overflowY, layoutBox2);
                if (overflowRenderer == null || !isKeepTogether()) {
                    ContinuousContainer continuousContainer = (ContinuousContainer) getProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER_RESULT);
                    if (continuousContainer != null && overflowRenderer == null) {
                        continuousContainer.reApplyProperties(this);
                        paddings = getPaddings();
                        borders = getBorders();
                    } else {
                        borders = borders2;
                        paddings = paddings4;
                    }
                    correctFixedLayout(layoutBox2);
                    applyPaddings(this.occupiedArea.getBBox(), paddings, true);
                    applyBorderBox(this.occupiedArea.getBBox(), borders, true);
                    applyMargins(this.occupiedArea.getBBox(), true);
                    applyAbsolutePositionIfNeeded(layoutContext);
                    if (rotation != null) {
                        applyRotationLayout(layoutContext.getArea().getBBox().mo7327clone());
                        if (isNotFittingLayoutArea(layoutContext.getArea())) {
                            if (!isNotFittingWidth(layoutContext.getArea()) || isNotFittingHeight(layoutContext.getArea())) {
                                if (!Boolean.TRUE.equals(getPropertyAsBoolean(26))) {
                                    floatRendererAreas3.retainAll(nonChildFloatingRendererAreas);
                                    return new MinMaxWidthLayoutResult(3, null, null, this, this);
                                }
                            } else {
                                LoggerFactory.getLogger(getClass()).warn(MessageFormatUtil.format(LayoutLogMessageConstant.ELEMENT_DOES_NOT_FIT_AREA, "It fits by height so it will be forced placed"));
                            }
                        }
                    }
                    applyVerticalAlignment();
                    FloatingHelper.removeFloatsAboveRendererBottom(floatRendererAreas3, this);
                    LayoutArea editedArea = FloatingHelper.adjustResultOccupiedAreaForFloatAndClear(this, layoutContext.getFloatRendererAreas(), layoutContext.getArea().getBBox(), clearHeightCorrection5, marginsCollapsingEnabled4);
                    ContinuousContainer.clearPropertiesFromOverFlowRenderer(overflowRenderer);
                    if (overflowRenderer == null) {
                        return new MinMaxWidthLayoutResult(1, editedArea, null, null, null).setMinMaxWidth(minMaxWidth3);
                    }
                    return new MinMaxWidthLayoutResult(2, editedArea, this, overflowRenderer, null).setMinMaxWidth(minMaxWidth3);
                }
                floatRendererAreas3.retainAll(nonChildFloatingRendererAreas);
                return new LayoutResult(3, null, null, this, this);
            }
            MarginsCollapseHandler marginsCollapseHandler6 = marginsCollapseHandler4;
            currentRenderer3.setProperty(67, getPropertyAsFloat(67));
            currentRenderer3.setProperty(69, getProperty(69));
            if (!onlyOverflowedFloatsLeft2) {
                lineIndent = getPropertyAsFloat(18).floatValue();
            } else {
                lineIndent = 0.0f;
            }
            List<Rectangle> areas2 = areas;
            float x = layoutBox.getX();
            float lastYLine3 = lastYLine2;
            float lastYLine4 = layoutBox.getY();
            boolean includeFloatsInOccupiedArea3 = includeFloatsInOccupiedArea;
            UnitValue[] paddings5 = paddings3;
            Rectangle childLayoutBox = new Rectangle(x, lastYLine4, layoutBox.getWidth(), layoutBox.getHeight());
            currentRenderer3.setProperty(103, overflowX3);
            currentRenderer3.setProperty(104, overflowY6);
            LineLayoutContext lineLayoutContext = new LineLayoutContext(new LayoutArea(pageNumber2, childLayoutBox), null, floatRendererAreas3, wasHeightClipped || wasParentsHeightClipped).setTextIndent(lineIndent).setFloatOverflowedToNextPageWithNothing(firstLineInBox3);
            LineLayoutResult result3 = (LineLayoutResult) ((LineRenderer) currentRenderer3.setParent(this)).layout(lineLayoutContext);
            boolean isLastLineReLaidOut = false;
            boolean floatOverflowedToNextPageWithNothing2 = firstLineInBox3;
            if (result3.getStatus() != 3) {
                lineIndent2 = lineIndent;
                result = result3;
                onlyOverflowedFloatsLeft = onlyOverflowedFloatsLeft3;
            } else {
                if (!layoutContext.isClippedHeight()) {
                    lineIndent2 = lineIndent;
                } else {
                    OverflowPropertyValue previousOverflowProperty = (OverflowPropertyValue) currentRenderer3.getProperty(104);
                    lineIndent2 = lineIndent;
                    currentRenderer3.setProperty(104, OverflowPropertyValue.VISIBLE);
                    lineLayoutContext.setClippedHeight(true);
                    result3 = (LineLayoutResult) ((LineRenderer) currentRenderer3.setParent(this)).layout(lineLayoutContext);
                    currentRenderer3.setProperty(104, previousOverflowProperty);
                    isLastLineReLaidOut = true;
                }
                Float lineShiftUnderFloats = FloatingHelper.calculateLineShiftUnderFloats(floatRendererAreas3, layoutBox);
                if (lineShiftUnderFloats != null) {
                    layoutBox.decreaseHeight(lineShiftUnderFloats.floatValue());
                    firstLineInBox2 = true;
                    currentAreaPos = currentAreaPos2;
                    marginsCollapseHandler4 = marginsCollapseHandler6;
                    areas = areas2;
                    lastYLine2 = lastYLine3;
                    includeFloatsInOccupiedArea = includeFloatsInOccupiedArea3;
                    paddings3 = paddings5;
                    firstLineInBox3 = floatOverflowedToNextPageWithNothing2;
                } else {
                    boolean allRemainingKidsAreFloats = !currentRenderer3.childRenderers.isEmpty();
                    for (IRenderer renderer : currentRenderer3.childRenderers) {
                        allRemainingKidsAreFloats = allRemainingKidsAreFloats && FloatingHelper.isRendererFloating(renderer);
                    }
                    if (!allRemainingKidsAreFloats) {
                        result = result3;
                        onlyOverflowedFloatsLeft = onlyOverflowedFloatsLeft3;
                    } else {
                        result = result3;
                        onlyOverflowedFloatsLeft = true;
                    }
                }
            }
            boolean floatOverflowedToNextPageWithNothing3 = lineLayoutContext.isFloatOverflowedToNextPageWithNothing();
            if (result.getFloatsOverflowedToNextPage() == null) {
                pageNumber = pageNumber2;
                inlineFloatsOverflowedToNextPage = inlineFloatsOverflowedToNextPage3;
            } else {
                pageNumber = pageNumber2;
                inlineFloatsOverflowedToNextPage = inlineFloatsOverflowedToNextPage3;
                inlineFloatsOverflowedToNextPage.addAll(result.getFloatsOverflowedToNextPage());
            }
            if (!(result instanceof MinMaxWidthLayoutResult)) {
                minChildWidth = 0.0f;
                maxChildWidth = 0.0f;
            } else {
                minChildWidth = result.getMinMaxWidth().getMinWidth();
                float maxChildWidth2 = result.getMinMaxWidth().getMaxWidth();
                maxChildWidth = maxChildWidth2;
            }
            widthHandler.updateMinChildWidth(minChildWidth);
            widthHandler.updateMaxChildWidth(maxChildWidth);
            LineRenderer processedRenderer2 = (LineRenderer) result.getSplitRenderer();
            if (processedRenderer2 == null) {
                result2 = result;
                if (result.getStatus() == 1) {
                    processedRenderer2 = currentRenderer3;
                }
            } else {
                result2 = result;
            }
            if (onlyOverflowedFloatsLeft) {
                processedRenderer2 = null;
            }
            TextAlignment textAlignment = (TextAlignment) getProperty(70, TextAlignment.LEFT);
            LineLayoutResult result4 = result2;
            AbstractWidthHandler widthHandler2 = widthHandler;
            List<Rectangle> floatRendererAreas4 = floatRendererAreas3;
            MinMaxWidth minMaxWidth4 = minMaxWidth2;
            OverflowPropertyValue overflowY8 = overflowY6;
            LineRenderer processedRenderer3 = processedRenderer2;
            applyTextAlignment(textAlignment, result4, processedRenderer3, layoutBox, floatRendererAreas4, onlyOverflowedFloatsLeft, lineIndent2);
            boolean onlyOverflowedFloatsLeft4 = onlyOverflowedFloatsLeft;
            Rectangle layoutBox3 = layoutBox;
            floatRendererAreas3 = floatRendererAreas4;
            Leading leading2 = RenderingMode.HTML_MODE.equals(getProperty(Property.RENDERING_MODE)) ? null : (Leading) getProperty(33);
            boolean lineHasContent = processedRenderer3 != null && processedRenderer3.getOccupiedArea().getBBox().getHeight() > 0.0f;
            boolean isFit2 = processedRenderer3 != null;
            float deltaY2 = 0.0f;
            if (isFit2) {
                isFit = isFit2;
                if (!RenderingMode.HTML_MODE.equals(getProperty(Property.RENDERING_MODE))) {
                    if (lineHasContent) {
                        float indentFromLastLine = ((previousDescent - lastLineBottomLeadingIndent) - (leading2 != null ? processedRenderer3.getTopLeadingIndent(leading2) : 0.0f)) - processedRenderer3.getMaxAscent();
                        if (processedRenderer3.containsImage()) {
                            indentFromLastLine += previousDescent;
                        }
                        deltaY2 = (lastYLine3 + indentFromLastLine) - processedRenderer3.getYLine();
                        lastLineBottomLeadingIndent = leading2 != null ? processedRenderer3.getBottomLeadingIndent(leading2) : 0.0f;
                        if (lastLineBottomLeadingIndent < 0.0f && processedRenderer3.containsImage()) {
                            lastLineBottomLeadingIndent = 0.0f;
                        }
                    }
                    if (firstLineInBox2) {
                        deltaY2 = (processedRenderer3 == null || leading2 == null) ? 0.0f : -processedRenderer3.getTopLeadingIndent(leading2);
                    }
                    if (isLastLineReLaidOut) {
                        isFit = leading2 == null || (processedRenderer3.getOccupiedArea().getBBox().getY() + deltaY2) - lastLineBottomLeadingIndent >= layoutBox3.getY();
                    } else {
                        isFit = leading2 == null || processedRenderer3.getOccupiedArea().getBBox().getY() + deltaY2 >= layoutBox3.getY();
                    }
                }
            } else {
                isFit = isFit2;
            }
            if (isFit) {
                leading = leading2;
                inlineFloatsOverflowedToNextPage2 = inlineFloatsOverflowedToNextPage;
                floatOverflowedToNextPageWithNothing = floatOverflowedToNextPageWithNothing3;
                overflowY2 = overflowY8;
                marginsCollapsingEnabled = marginsCollapsingEnabled3;
                i = 2;
                processedRenderer = processedRenderer3;
                deltaY = deltaY2;
                clearHeightCorrection2 = clearHeightCorrection4;
            } else if (processedRenderer3 != null && !isOverflowFit(overflowY8)) {
                leading = leading2;
                inlineFloatsOverflowedToNextPage2 = inlineFloatsOverflowedToNextPage;
                floatOverflowedToNextPageWithNothing = floatOverflowedToNextPageWithNothing3;
                overflowY2 = overflowY8;
                marginsCollapsingEnabled = marginsCollapsingEnabled3;
                i = 2;
                processedRenderer = processedRenderer3;
                deltaY = deltaY2;
                clearHeightCorrection2 = clearHeightCorrection4;
            } else if (currentAreaPos2 + 1 >= areas2.size()) {
                boolean keepTogether = isKeepTogether(result4.getCauseOfNothing());
                if (keepTogether) {
                    floatRendererAreas3.retainAll(nonChildFloatingRendererAreas);
                    return new MinMaxWidthLayoutResult(3, null, null, this, this);
                }
                if (marginsCollapsingEnabled3 && onlyOverflowedFloatsLeft2 && notAllKidsAreFloats) {
                    marginsCollapseHandler6.endChildMarginsHandling(layoutBox3);
                }
                boolean includeFloatsInOccupiedAreaOnSplit = !onlyOverflowedFloatsLeft4 || includeFloatsInOccupiedArea3;
                if (includeFloatsInOccupiedAreaOnSplit) {
                    FloatingHelper.includeChildFloatsInOccupiedArea(floatRendererAreas3, (IRenderer) this, nonChildFloatingRendererAreas);
                    fixOccupiedAreaIfOverflowedX(overflowX3, layoutBox3);
                }
                if (marginsCollapsingEnabled3) {
                    marginsCollapseHandler6.endMarginsCollapse(layoutBox3);
                }
                if (includeFloatsInOccupiedAreaOnSplit) {
                    overflowY3 = overflowY8;
                    minHeightOverflowed = false;
                } else {
                    overflowY3 = overflowY8;
                    AbstractRenderer minHeightOverflow = applyMinHeight(overflowY3, layoutBox3);
                    boolean minHeightOverflowed2 = minHeightOverflow != null;
                    applyVerticalAlignment();
                    minHeightOverflowed = minHeightOverflowed2;
                }
                ParagraphRenderer[] split = split();
                split[0].lines = this.lines;
                for (Iterator<LineRenderer> it = this.lines.iterator(); it.hasNext(); it = it) {
                    LineRenderer line = it.next();
                    split[0].childRenderers.addAll(line.getChildRenderers());
                }
                split[1].childRenderers.addAll(inlineFloatsOverflowedToNextPage);
                if (processedRenderer3 != null) {
                    split[1].childRenderers.addAll(processedRenderer3.getChildRenderers());
                }
                if (result4.getOverflowRenderer() != null) {
                    split[1].childRenderers.addAll(result4.getOverflowRenderer().getChildRenderers());
                }
                if (onlyOverflowedFloatsLeft4 && !includeFloatsInOccupiedArea3 && !minHeightOverflowed) {
                    FloatingHelper.removeParentArtifactsOnPageSplitIfOnlyFloatsOverflow(split[1]);
                }
                float usedHeight = this.occupiedArea.getBBox().getHeight();
                if (includeFloatsInOccupiedAreaOnSplit) {
                    r8 = 1;
                } else {
                    r8 = 1;
                    Rectangle commonRectangle = Rectangle.getCommonRectangle(layoutBox3, this.occupiedArea.getBBox());
                    usedHeight = commonRectangle.getHeight();
                }
                updateHeightsOnSplit(usedHeight, wasHeightClipped, this, split[r8], includeFloatsInOccupiedAreaOnSplit);
                correctFixedLayout(layoutBox3);
                applyPaddings(this.occupiedArea.getBBox(), paddings5, r8);
                applyBorderBox(this.occupiedArea.getBBox(), borders2, r8);
                applyMargins(this.occupiedArea.getBBox(), r8);
                applyAbsolutePositionIfNeeded(layoutContext);
                LayoutArea editedArea2 = FloatingHelper.adjustResultOccupiedAreaForFloatAndClear(this, layoutContext.getFloatRendererAreas(), layoutContext.getArea().getBBox(), clearHeightCorrection4, marginsCollapsingEnabled3);
                if (wasHeightClipped) {
                    return new MinMaxWidthLayoutResult(1, editedArea2, split[0], null).setMinMaxWidth(minMaxWidth4);
                }
                if (!onlyOverflowedFloatsLeft2) {
                    if (Boolean.TRUE.equals(getPropertyAsBoolean(26))) {
                        this.occupiedArea.setBBox(Rectangle.getCommonRectangle(this.occupiedArea.getBBox(), currentRenderer3.getOccupiedArea().getBBox()));
                        fixOccupiedAreaIfOverflowedX(overflowX3, layoutBox3);
                        this.parent.setProperty(25, true);
                        this.lines.add(currentRenderer3);
                        if (2 == result4.getStatus()) {
                            IRenderer childNotRendered = result4.getCauseOfNothing();
                            int firstNotRendered = currentRenderer3.childRenderers.indexOf(childNotRendered);
                            currentRenderer3.childRenderers.retainAll(currentRenderer3.childRenderers.subList(0, firstNotRendered));
                            for (IRenderer child2 : currentRenderer3.getChildRenderers()) {
                                child2.setParent(currentRenderer3);
                            }
                            split[1].childRenderers.removeAll(split[1].childRenderers.subList(0, firstNotRendered));
                            return new MinMaxWidthLayoutResult(2, editedArea2, this, split[1], null).setMinMaxWidth(minMaxWidth4);
                        }
                        return new MinMaxWidthLayoutResult(1, editedArea2, null, null, this).setMinMaxWidth(minMaxWidth4);
                    }
                    floatRendererAreas3.retainAll(nonChildFloatingRendererAreas);
                    return new MinMaxWidthLayoutResult(3, null, null, this, result4.getCauseOfNothing() == null ? this : result4.getCauseOfNothing());
                }
                return new MinMaxWidthLayoutResult(2, editedArea2, split[0], split[1]).setMinMaxWidth(minMaxWidth4);
            } else {
                int currentAreaPos3 = currentAreaPos2 + 1;
                Rectangle layoutBox4 = areas2.get(currentAreaPos3).mo7327clone();
                float lastYLine5 = layoutBox4.getY() + layoutBox4.getHeight();
                layoutBox = layoutBox4;
                inlineFloatsOverflowedToNextPage2 = inlineFloatsOverflowedToNextPage;
                floatOverflowedToNextPageWithNothing = floatOverflowedToNextPageWithNothing3;
                firstLineInBox = true;
                overflowY2 = overflowY8;
                marginsCollapsingEnabled = marginsCollapsingEnabled3;
                lastYLine2 = lastYLine5;
                onlyOverflowedFloatsLeft3 = onlyOverflowedFloatsLeft4;
                currentAreaPos2 = currentAreaPos3;
                currentRenderer = currentRenderer3;
                clearHeightCorrection2 = clearHeightCorrection4;
                marginsCollapsingEnabled3 = marginsCollapsingEnabled;
                marginsCollapseHandler4 = marginsCollapseHandler6;
                minMaxWidth2 = minMaxWidth4;
                clearHeightCorrection4 = clearHeightCorrection2;
                currentRenderer3 = currentRenderer;
                currentAreaPos = currentAreaPos2;
                widthHandler = widthHandler2;
                includeFloatsInOccupiedArea = includeFloatsInOccupiedArea3;
                paddings3 = paddings5;
                pageNumber2 = pageNumber;
                areas = areas2;
                inlineFloatsOverflowedToNextPage3 = inlineFloatsOverflowedToNextPage2;
                overflowY6 = overflowY2;
                firstLineInBox2 = firstLineInBox;
                firstLineInBox3 = floatOverflowedToNextPageWithNothing;
            }
            if (leading != null) {
                processedRenderer.applyLeading(deltaY);
                if (lineHasContent) {
                    lastYLine3 = processedRenderer.getYLine();
                }
            }
            if (lineHasContent) {
                LayoutArea layoutArea = this.occupiedArea;
                Rectangle[] rectangleArr = new Rectangle[i];
                rectangleArr[0] = this.occupiedArea.getBBox();
                rectangleArr[1] = processedRenderer.getOccupiedArea().getBBox();
                layoutArea.setBBox(Rectangle.getCommonRectangle(rectangleArr));
                fixOccupiedAreaIfOverflowedX(overflowX3, layoutBox3);
            }
            firstLineInBox = false;
            layoutBox3.setHeight(processedRenderer.getOccupiedArea().getBBox().getY() - layoutBox3.getY());
            this.lines.add(processedRenderer);
            LineRenderer currentRenderer4 = (LineRenderer) result4.getOverflowRenderer();
            float previousDescent2 = processedRenderer.getMaxDescent();
            if (!inlineFloatsOverflowedToNextPage2.isEmpty() && result4.getOverflowRenderer() == null) {
                currentRenderer = new LineRenderer();
                previousDescent = previousDescent2;
                layoutBox = layoutBox3;
                onlyOverflowedFloatsLeft3 = true;
                lastYLine2 = lastYLine3;
                onlyOverflowedFloatsLeft2 = true;
            } else {
                onlyOverflowedFloatsLeft2 = true;
                currentRenderer = currentRenderer4;
                previousDescent = previousDescent2;
                layoutBox = layoutBox3;
                lastYLine2 = lastYLine3;
                onlyOverflowedFloatsLeft3 = onlyOverflowedFloatsLeft4;
            }
            marginsCollapsingEnabled3 = marginsCollapsingEnabled;
            marginsCollapseHandler4 = marginsCollapseHandler6;
            minMaxWidth2 = minMaxWidth4;
            clearHeightCorrection4 = clearHeightCorrection2;
            currentRenderer3 = currentRenderer;
            currentAreaPos = currentAreaPos2;
            widthHandler = widthHandler2;
            includeFloatsInOccupiedArea = includeFloatsInOccupiedArea3;
            paddings3 = paddings5;
            pageNumber2 = pageNumber;
            areas = areas2;
            inlineFloatsOverflowedToNextPage3 = inlineFloatsOverflowedToNextPage2;
            overflowY6 = overflowY2;
            firstLineInBox2 = firstLineInBox;
            firstLineInBox3 = floatOverflowedToNextPageWithNothing;
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(ParagraphRenderer.class, getClass());
        return new ParagraphRenderer((Paragraph) this.modelElement);
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getDefaultProperty(int property) {
        if ((property == 46 || property == 43) && (this.parent instanceof CellRenderer)) {
            return (T1) UnitValue.createPointValue(0.0f);
        }
        return (T1) super.getDefaultProperty(property);
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.lines != null && this.lines.size() > 0) {
            for (int i = 0; i < this.lines.size(); i++) {
                if (i > 0) {
                    sb.append("\n");
                }
                sb.append(this.lines.get(i).toString());
            }
        } else {
            for (IRenderer renderer : this.childRenderers) {
                sb.append(renderer.toString());
            }
        }
        return sb.toString();
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawChildren(DrawContext drawContext) {
        if (this.lines != null) {
            for (LineRenderer line : this.lines) {
                line.draw(drawContext);
            }
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void move(float dxRight, float dyUp) {
        Logger logger = LoggerFactory.getLogger(ParagraphRenderer.class);
        if (this.occupiedArea == null) {
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Moving won't be performed."));
            return;
        }
        this.occupiedArea.getBBox().moveRight(dxRight);
        this.occupiedArea.getBBox().moveUp(dyUp);
        if (this.lines != null) {
            for (LineRenderer line : this.lines) {
                line.move(dxRight, dyUp);
            }
        }
    }

    public List<LineRenderer> getLines() {
        return this.lines;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float getFirstYLineRecursively() {
        if (this.lines == null || this.lines.size() == 0) {
            return null;
        }
        return this.lines.get(0).getFirstYLineRecursively();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float getLastYLineRecursively() {
        if (!allowLastYLineRecursiveExtraction() || this.lines == null || this.lines.size() == 0) {
            return null;
        }
        for (int i = this.lines.size() - 1; i >= 0; i--) {
            Float yLine = this.lines.get(i).getLastYLineRecursively();
            if (yLine != null) {
                return yLine;
            }
        }
        return null;
    }

    private ParagraphRenderer createOverflowRenderer() {
        return (ParagraphRenderer) getNextRenderer();
    }

    private ParagraphRenderer createSplitRenderer() {
        return (ParagraphRenderer) getNextRenderer();
    }

    protected ParagraphRenderer createOverflowRenderer(IRenderer parent) {
        ParagraphRenderer overflowRenderer = createOverflowRenderer();
        overflowRenderer.parent = parent;
        fixOverflowRenderer(overflowRenderer);
        overflowRenderer.addAllProperties(getOwnProperties());
        ContinuousContainer.clearPropertiesFromOverFlowRenderer(overflowRenderer);
        return overflowRenderer;
    }

    protected ParagraphRenderer createSplitRenderer(IRenderer parent) {
        ParagraphRenderer splitRenderer = createSplitRenderer();
        splitRenderer.parent = parent;
        splitRenderer.addAllProperties(getOwnProperties());
        return splitRenderer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.BlockRenderer
    public AbstractRenderer createOverflowRenderer(int layoutResult) {
        return createOverflowRenderer(this.parent);
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        MinMaxWidth minMaxWidth = new MinMaxWidth();
        Float rotation = getPropertyAsFloat(55);
        if (!setMinMaxWidthBasedOnFixedWidth(minMaxWidth)) {
            Float minWidth = hasAbsoluteUnitValue(80) ? retrieveMinWidth(0.0f) : null;
            Float maxWidth = hasAbsoluteUnitValue(79) ? retrieveMaxWidth(0.0f) : null;
            if (minWidth == null || maxWidth == null) {
                boolean restoreRotation = hasOwnProperty(55);
                setProperty(55, null);
                MinMaxWidthLayoutResult result = (MinMaxWidthLayoutResult) layout(new LayoutContext(new LayoutArea(1, new Rectangle(MinMaxWidthUtils.getInfWidth(), 1000000.0f))));
                if (restoreRotation) {
                    setProperty(55, rotation);
                } else {
                    deleteOwnProperty(55);
                }
                minMaxWidth = result.getMinMaxWidth();
            }
            if (minWidth != null) {
                minMaxWidth.setChildrenMinWidth(minWidth.floatValue());
            }
            if (maxWidth != null) {
                minMaxWidth.setChildrenMaxWidth(maxWidth.floatValue());
            }
            if (minMaxWidth.getChildrenMinWidth() > minMaxWidth.getChildrenMaxWidth()) {
                minMaxWidth.setChildrenMaxWidth(minMaxWidth.getChildrenMaxWidth());
            }
        } else {
            minMaxWidth.setAdditionalWidth(calculateAdditionalWidth(this));
        }
        return rotation != null ? RotationUtils.countRotationMinMaxWidth(minMaxWidth, this) : minMaxWidth;
    }

    protected ParagraphRenderer[] split() {
        ParagraphRenderer splitRenderer = createSplitRenderer(this.parent);
        splitRenderer.occupiedArea = this.occupiedArea;
        splitRenderer.isLastRendererForModelElement = false;
        ParagraphRenderer overflowRenderer = createOverflowRenderer(this.parent);
        return new ParagraphRenderer[]{splitRenderer, overflowRenderer};
    }

    private void fixOverflowRenderer(ParagraphRenderer overflowRenderer) {
        float firstLineIndent = overflowRenderer.getPropertyAsFloat(18).floatValue();
        if (firstLineIndent != 0.0f) {
            overflowRenderer.setProperty(18, Float.valueOf(0.0f));
        }
    }

    private void alignStaticKids(LineRenderer renderer, float dxRight) {
        renderer.getOccupiedArea().getBBox().moveRight(dxRight);
        for (IRenderer childRenderer : renderer.getChildRenderers()) {
            if (!FloatingHelper.isRendererFloating(childRenderer)) {
                childRenderer.move(dxRight, 0.0f);
            }
        }
    }

    private void applyTextAlignment(TextAlignment textAlignment, LineLayoutResult result, LineRenderer processedRenderer, Rectangle layoutBox, List<Rectangle> floatRendererAreas, boolean onlyOverflowedFloatsLeft, float lineIndent) {
        if ((textAlignment == TextAlignment.JUSTIFIED && result.getStatus() == 2 && !result.isSplitForcedByNewline() && !onlyOverflowedFloatsLeft) || textAlignment == TextAlignment.JUSTIFIED_ALL) {
            if (processedRenderer != null) {
                Rectangle actualLineLayoutBox = layoutBox.mo7327clone();
                FloatingHelper.adjustLineAreaAccordingToFloats(floatRendererAreas, actualLineLayoutBox);
                processedRenderer.justify(actualLineLayoutBox.getWidth() - lineIndent);
            }
        } else if (textAlignment != TextAlignment.LEFT && processedRenderer != null) {
            Rectangle actualLineLayoutBox2 = layoutBox.mo7327clone();
            FloatingHelper.adjustLineAreaAccordingToFloats(floatRendererAreas, actualLineLayoutBox2);
            float deltaX = Math.max(0.0f, (actualLineLayoutBox2.getWidth() - lineIndent) - processedRenderer.getOccupiedArea().getBBox().getWidth());
            switch (textAlignment) {
                case RIGHT:
                    alignStaticKids(processedRenderer, deltaX);
                    return;
                case CENTER:
                    alignStaticKids(processedRenderer, deltaX / 2.0f);
                    return;
                case JUSTIFIED:
                    if (BaseDirection.RIGHT_TO_LEFT.equals(getProperty(7))) {
                        alignStaticKids(processedRenderer, deltaX);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    private static void updateParentLines(ParagraphRenderer re) {
        if (re == null) {
            return;
        }
        for (LineRenderer lineRenderer : re.lines) {
            lineRenderer.setParent(re);
        }
        for (IRenderer childRenderer : re.getChildRenderers()) {
            IRenderer line = childRenderer.getParent();
            if (!(line instanceof LineRenderer) || !re.lines.contains((LineRenderer) line)) {
                childRenderer.setParent(null);
            }
        }
    }
}
