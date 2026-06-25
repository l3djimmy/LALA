package com.itextpdf.layout.renderer;

import androidx.camera.video.AudioStats;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.margincollapse.MarginsCollapseHandler;
import com.itextpdf.layout.margincollapse.MarginsCollapseInfo;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.ContinuousContainer;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.properties.VerticalAlignment;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class BlockRenderer extends AbstractRenderer {
    /* JADX INFO: Access modifiers changed from: protected */
    public BlockRenderer(IElement modelElement) {
        super(modelElement);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0459  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x04c3  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x04c6  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x04d5  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x04f6  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0575  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x05ae  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x05c2  */
    /* JADX WARN: Removed duplicated region for block: B:283:0x07f2  */
    /* JADX WARN: Removed duplicated region for block: B:288:0x0861  */
    /* JADX WARN: Removed duplicated region for block: B:296:0x08a3  */
    /* JADX WARN: Removed duplicated region for block: B:308:0x0907  */
    /* JADX WARN: Removed duplicated region for block: B:311:0x0916  */
    /* JADX WARN: Removed duplicated region for block: B:313:0x0938  */
    /* JADX WARN: Type inference failed for: r16v14 */
    /* JADX WARN: Type inference failed for: r16v17 */
    /* JADX WARN: Type inference failed for: r16v2 */
    @Override // com.itextpdf.layout.renderer.IRenderer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.itextpdf.layout.layout.LayoutResult layout(com.itextpdf.layout.layout.LayoutContext r64) {
        /*
            Method dump skipped, instructions count: 2411
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.BlockRenderer.layout(com.itextpdf.layout.layout.LayoutContext):com.itextpdf.layout.layout.LayoutResult");
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        boolean processOverflow;
        Rectangle clippedArea;
        Logger logger = LoggerFactory.getLogger(BlockRenderer.class);
        if (this.occupiedArea == null) {
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Drawing won't be performed."));
            return;
        }
        boolean isTagged = drawContext.isTaggingEnabled();
        LayoutTaggingHelper taggingHelper = null;
        if (isTagged) {
            taggingHelper = (LayoutTaggingHelper) getProperty(108);
            if (taggingHelper == null) {
                isTagged = false;
            } else {
                TagTreePointer tagPointer = taggingHelper.useAutoTaggingPointerAndRememberItsPosition(this);
                if (taggingHelper.createTag(this, tagPointer)) {
                    tagPointer.getProperties().addAttributes(0, AccessibleAttributesApplier.getListAttributes(this, tagPointer)).addAttributes(0, AccessibleAttributesApplier.getTableAttributes(this, tagPointer)).addAttributes(0, AccessibleAttributesApplier.getLayoutAttributes(this, tagPointer));
                }
            }
        }
        beginTransformationIfApplied(drawContext.getCanvas());
        applyDestinationsAndAnnotation(drawContext);
        boolean isRelativePosition = isRelativePosition();
        if (isRelativePosition) {
            applyRelativePositioningTranslation(false);
        }
        beginElementOpacityApplying(drawContext);
        beginRotationIfApplied(drawContext.getCanvas());
        boolean overflowXHidden = isOverflowProperty(OverflowPropertyValue.HIDDEN, 103);
        boolean overflowYHidden = isOverflowProperty(OverflowPropertyValue.HIDDEN, 104);
        if (!overflowXHidden && !overflowYHidden) {
            processOverflow = false;
        } else {
            processOverflow = true;
        }
        drawBackground(drawContext);
        drawBorder(drawContext);
        addMarkedContent(drawContext, true);
        if (processOverflow) {
            drawContext.getCanvas().saveState();
            int pageNumber = this.occupiedArea.getPageNumber();
            if (pageNumber < 1 || pageNumber > drawContext.getDocument().getNumberOfPages()) {
                clippedArea = new Rectangle(-500000.0f, -500000.0f, 1000000.0f, 1000000.0f);
            } else {
                PdfPage page = drawContext.getDocument().getPage(pageNumber);
                if (page.isFlushed()) {
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.PAGE_WAS_FLUSHED_ACTION_WILL_NOT_BE_PERFORMED, "area clipping"));
                    clippedArea = new Rectangle(-500000.0f, -500000.0f, 1000000.0f, 1000000.0f);
                } else {
                    clippedArea = page.getPageSize();
                }
            }
            Rectangle area = getBorderAreaBBox();
            if (overflowXHidden) {
                clippedArea.setX(area.getX()).setWidth(area.getWidth());
            }
            if (overflowYHidden) {
                clippedArea.setY(area.getY()).setHeight(area.getHeight());
            }
            drawContext.getCanvas().rectangle(clippedArea).clip().endPath();
        }
        drawChildren(drawContext);
        addMarkedContent(drawContext, false);
        drawPositionedChildren(drawContext);
        if (processOverflow) {
            drawContext.getCanvas().restoreState();
        }
        endRotationIfApplied(drawContext.getCanvas());
        endElementOpacityApplying(drawContext);
        if (isRelativePosition) {
            applyRelativePositioningTranslation(true);
        }
        if (isTagged) {
            if (this.isLastRendererForModelElement) {
                taggingHelper.finishTaggingHint(this);
            }
            taggingHelper.restoreAutoTaggingPointerPosition(this);
        }
        this.flushed = true;
        endTransformationIfApplied(drawContext.getCanvas());
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle getOccupiedAreaBBox() {
        Rectangle bBox = this.occupiedArea.getBBox().mo7327clone();
        Float rotationAngle = (Float) getProperty(55);
        if (rotationAngle != null) {
            if (!hasOwnProperty(57) || !hasOwnProperty(56)) {
                Logger logger = LoggerFactory.getLogger(BlockRenderer.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.ROTATION_WAS_NOT_CORRECTLY_PROCESSED_FOR_RENDERER, getClass().getSimpleName()));
            } else {
                bBox.setWidth(getPropertyAsFloat(57).floatValue());
                bBox.setHeight(getPropertyAsFloat(56).floatValue());
            }
        }
        return bBox;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractRenderer createSplitRenderer(int layoutResult) {
        AbstractRenderer splitRenderer = (AbstractRenderer) getNextRenderer();
        splitRenderer.parent = this.parent;
        splitRenderer.modelElement = this.modelElement;
        splitRenderer.occupiedArea = this.occupiedArea;
        splitRenderer.isLastRendererForModelElement = false;
        splitRenderer.addAllProperties(getOwnProperties());
        return splitRenderer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractRenderer createOverflowRenderer(int layoutResult) {
        AbstractRenderer overflowRenderer = (AbstractRenderer) getNextRenderer();
        overflowRenderer.parent = this.parent;
        overflowRenderer.modelElement = this.modelElement;
        overflowRenderer.addAllProperties(getOwnProperties());
        return overflowRenderer;
    }

    void recalculateOccupiedAreaAfterChildLayout(Rectangle resultBBox, Float blockMaxHeight) {
        this.occupiedArea.setBBox(Rectangle.getCommonRectangle(this.occupiedArea.getBBox(), resultBBox));
    }

    MarginsCollapseInfo startChildMarginsHandling(IRenderer childRenderer, Rectangle layoutBox, MarginsCollapseHandler marginsCollapseHandler) {
        return marginsCollapseHandler.startChildMarginsHandling(childRenderer, layoutBox);
    }

    Rectangle recalculateLayoutBoxBeforeChildLayout(Rectangle layoutBox, IRenderer childRenderer, Rectangle initialLayoutBox) {
        return layoutBox;
    }

    AbstractRenderer[] createSplitAndOverflowRenderers(int childPos, int layoutStatus, LayoutResult childResult, Map<Integer, IRenderer> waitingFloatsSplitRenderers, List<IRenderer> waitingOverflowFloatRenderers) {
        AbstractRenderer splitRenderer = createSplitRenderer(layoutStatus);
        splitRenderer.childRenderers = new ArrayList(this.childRenderers.subList(0, childPos));
        if (childResult.getStatus() == 2 && childResult.getSplitRenderer() != null) {
            splitRenderer.childRenderers.add(childResult.getSplitRenderer());
        }
        replaceSplitRendererKidFloats(waitingFloatsSplitRenderers, splitRenderer);
        for (IRenderer renderer : splitRenderer.childRenderers) {
            renderer.setParent(splitRenderer);
        }
        AbstractRenderer overflowRenderer = createOverflowRenderer(layoutStatus);
        overflowRenderer.childRenderers.addAll(waitingOverflowFloatRenderers);
        if (childResult.getOverflowRenderer() != null) {
            overflowRenderer.addChildRenderer(childResult.getOverflowRenderer());
        }
        overflowRenderer.childRenderers.addAll(this.childRenderers.subList(childPos + 1, this.childRenderers.size()));
        ContinuousContainer.clearPropertiesFromOverFlowRenderer(overflowRenderer);
        if (childResult.getStatus() == 2) {
            overflowRenderer.deleteOwnProperty(26);
        }
        return new AbstractRenderer[]{splitRenderer, overflowRenderer};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void applyVerticalAlignment() {
        VerticalAlignment verticalAlignment = (VerticalAlignment) getProperty(75);
        if (verticalAlignment == null || verticalAlignment == VerticalAlignment.TOP || this.childRenderers.isEmpty()) {
            return;
        }
        float lowestChildBottom = Float.MAX_VALUE;
        if (FloatingHelper.isRendererFloating(this) || (this instanceof CellRenderer)) {
            for (IRenderer child : this.childRenderers) {
                if (child.getOccupiedArea() != null && child.getOccupiedArea().getBBox().getBottom() < lowestChildBottom) {
                    lowestChildBottom = child.getOccupiedArea().getBBox().getBottom();
                }
            }
        } else {
            int lastChildIndex = this.childRenderers.size() - 1;
            while (true) {
                if (lastChildIndex < 0) {
                    break;
                }
                int lastChildIndex2 = lastChildIndex - 1;
                IRenderer child2 = this.childRenderers.get(lastChildIndex);
                if (!FloatingHelper.isRendererFloating(child2) && child2.getOccupiedArea() != null) {
                    lowestChildBottom = child2.getOccupiedArea().getBBox().getBottom();
                    break;
                }
                lastChildIndex = lastChildIndex2;
            }
        }
        if (lowestChildBottom == Float.MAX_VALUE) {
            return;
        }
        float deltaY = lowestChildBottom - getInnerAreaBBox().getY();
        if (deltaY < 0.0f) {
            return;
        }
        switch (verticalAlignment) {
            case BOTTOM:
                for (IRenderer child3 : this.childRenderers) {
                    child3.move(0.0f, -deltaY);
                }
                return;
            case MIDDLE:
                for (IRenderer child4 : this.childRenderers) {
                    child4.move(0.0f, (-deltaY) / 2.0f);
                }
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void applyRotationLayout(Rectangle layoutBox) {
        float angle = getPropertyAsFloat(55).floatValue();
        float x = this.occupiedArea.getBBox().getX();
        float y = this.occupiedArea.getBBox().getY();
        float height = this.occupiedArea.getBBox().getHeight();
        float width = this.occupiedArea.getBBox().getWidth();
        setProperty(57, Float.valueOf(width));
        setProperty(56, Float.valueOf(height));
        AffineTransform rotationTransform = new AffineTransform();
        if (isPositioned()) {
            Float rotationPointX = getPropertyAsFloat(58);
            Float rotationPointY = getPropertyAsFloat(59);
            if (rotationPointX == null || rotationPointY == null) {
                rotationPointX = Float.valueOf(x);
                rotationPointY = Float.valueOf(y);
            }
            rotationTransform.translate(rotationPointX.floatValue(), rotationPointY.floatValue());
            rotationTransform.rotate(angle);
            rotationTransform.translate(-rotationPointX.floatValue(), -rotationPointY.floatValue());
            Rectangle newBBox = calculateBBox(transformPoints(rectangleToPointsList(this.occupiedArea.getBBox()), rotationTransform));
            this.occupiedArea.getBBox().setWidth(newBBox.getWidth());
            this.occupiedArea.getBBox().setHeight(newBBox.getHeight());
            float occupiedAreaShiftX = newBBox.getX() - x;
            float occupiedAreaShiftY = newBBox.getY() - y;
            move(occupiedAreaShiftX, occupiedAreaShiftY);
            return;
        }
        List<Point> rotatedPoints = transformPoints(rectangleToPointsList(this.occupiedArea.getBBox()), AffineTransform.getRotateInstance(angle));
        float[] shift = calculateShiftToPositionBBoxOfPointsAt(x, y + height, rotatedPoints);
        for (Point point : rotatedPoints) {
            point.setLocation(point.getX() + shift[0], point.getY() + shift[1]);
            angle = angle;
            x = x;
        }
        Rectangle newBBox2 = calculateBBox(rotatedPoints);
        this.occupiedArea.getBBox().setWidth(newBBox2.getWidth());
        this.occupiedArea.getBBox().setHeight(newBBox2.getHeight());
        float heightDiff = height - newBBox2.getHeight();
        move(0.0f, heightDiff);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AffineTransform createRotationTransformInsideOccupiedArea() {
        Float angle = (Float) getProperty(55);
        AffineTransform rotationTransform = AffineTransform.getRotateInstance(angle.floatValue());
        Rectangle contentBox = getOccupiedAreaBBox();
        List<Point> rotatedContentBoxPoints = transformPoints(rectangleToPointsList(contentBox), rotationTransform);
        float[] shift = calculateShiftToPositionBBoxOfPointsAt(this.occupiedArea.getBBox().getLeft(), this.occupiedArea.getBBox().getTop(), rotatedContentBoxPoints);
        rotationTransform.preConcatenate(AffineTransform.getTranslateInstance(shift[0], shift[1]));
        return rotationTransform;
    }

    protected void beginRotationIfApplied(PdfCanvas canvas) {
        Float angle = getPropertyAsFloat(55);
        if (angle != null) {
            if (!hasOwnProperty(56)) {
                Logger logger = LoggerFactory.getLogger(BlockRenderer.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.ROTATION_WAS_NOT_CORRECTLY_PROCESSED_FOR_RENDERER, getClass().getSimpleName()));
                return;
            }
            AffineTransform transform = createRotationTransformInsideOccupiedArea();
            canvas.saveState().concatMatrix(transform);
        }
    }

    protected void endRotationIfApplied(PdfCanvas canvas) {
        Float angle = getPropertyAsFloat(55);
        if (angle != null && hasOwnProperty(56)) {
            canvas.restoreState();
        }
    }

    protected PdfFont getResolvedFont(PdfDocument pdfDocument) {
        Object retrievedFont = getProperty(20);
        if (retrievedFont instanceof PdfFont) {
            return (PdfFont) retrievedFont;
        }
        if (getProperty(91) != null && retrievedFont != null) {
            return resolveFirstPdfFont();
        }
        if (pdfDocument != null) {
            return pdfDocument.getDefaultFont();
        }
        return null;
    }

    boolean stopLayoutingChildrenIfChildResultNotFull(LayoutResult returnResult) {
        return true;
    }

    LayoutResult processNotFullChildResult(LayoutContext layoutContext, Map<Integer, IRenderer> waitingFloatsSplitRenderers, List<IRenderer> waitingOverflowFloatRenderers, boolean wasHeightClipped, List<Rectangle> floatRendererAreas, boolean marginsCollapsingEnabled, float clearHeightCorrection, Border[] borders, UnitValue[] paddings, List<Rectangle> areas, int currentAreaPos, Rectangle layoutBox, Set<Rectangle> nonChildFloatingRendererAreas, IRenderer causeOfNothing, boolean anythingPlaced, int childPos, LayoutResult result) {
        AbstractRenderer splitRenderer;
        AbstractRenderer splitRenderer2;
        if (result.getStatus() == 2) {
            if (currentAreaPos + 1 == areas.size()) {
                AbstractRenderer[] splitAndOverflowRenderers = createSplitAndOverflowRenderers(childPos, 2, result, waitingFloatsSplitRenderers, waitingOverflowFloatRenderers);
                AbstractRenderer splitRenderer3 = splitAndOverflowRenderers[0];
                AbstractRenderer overflowRenderer = splitAndOverflowRenderers[1];
                overflowRenderer.deleteOwnProperty(26);
                updateHeightsOnSplit(wasHeightClipped, splitRenderer3, overflowRenderer);
                applyPaddings(this.occupiedArea.getBBox(), paddings, true);
                applyBorderBox(this.occupiedArea.getBBox(), borders, true);
                applyMargins(this.occupiedArea.getBBox(), true);
                correctFixedLayout(layoutBox);
                LayoutArea editedArea = FloatingHelper.adjustResultOccupiedAreaForFloatAndClear(this, layoutContext.getFloatRendererAreas(), layoutContext.getArea().getBBox(), clearHeightCorrection, marginsCollapsingEnabled);
                if (wasHeightClipped) {
                    return new LayoutResult(1, editedArea, splitRenderer3, null);
                }
                return new LayoutResult(2, editedArea, splitRenderer3, overflowRenderer, causeOfNothing);
            }
            this.childRenderers.set(childPos, result.getSplitRenderer());
            this.childRenderers.add(childPos + 1, result.getOverflowRenderer());
            return null;
        } else if (result.getStatus() == 3) {
            boolean keepTogether = isKeepTogether(causeOfNothing);
            int layoutResult = (!anythingPlaced || keepTogether) ? 3 : 2;
            AbstractRenderer[] splitAndOverflowRenderers2 = createSplitAndOverflowRenderers(childPos, layoutResult, result, waitingFloatsSplitRenderers, waitingOverflowFloatRenderers);
            AbstractRenderer splitRenderer4 = splitAndOverflowRenderers2[0];
            AbstractRenderer overflowRenderer2 = splitAndOverflowRenderers2[1];
            if (isRelativePosition() && this.positionedRenderers.size() > 0) {
                overflowRenderer2.positionedRenderers = new ArrayList(this.positionedRenderers);
            }
            updateHeightsOnSplit(wasHeightClipped, splitRenderer4, overflowRenderer2);
            if (!keepTogether) {
                splitRenderer = splitRenderer4;
            } else {
                overflowRenderer2.childRenderers.clear();
                overflowRenderer2.addAllChildRenderers(this.childRenderers);
                splitRenderer = null;
            }
            correctFixedLayout(layoutBox);
            applyPaddings(this.occupiedArea.getBBox(), paddings, true);
            applyBorderBox(this.occupiedArea.getBBox(), borders, true);
            applyMargins(this.occupiedArea.getBBox(), true);
            applyAbsolutePositionIfNeeded(layoutContext);
            if (Boolean.TRUE.equals(getPropertyAsBoolean(26))) {
                splitRenderer2 = splitRenderer;
            } else if (!wasHeightClipped) {
                if (layoutResult != 3) {
                    LayoutArea editedArea2 = FloatingHelper.adjustResultOccupiedAreaForFloatAndClear(this, layoutContext.getFloatRendererAreas(), layoutContext.getArea().getBBox(), clearHeightCorrection, marginsCollapsingEnabled);
                    return new LayoutResult(layoutResult, editedArea2, splitRenderer, overflowRenderer2, null).setAreaBreak(result.getAreaBreak());
                }
                floatRendererAreas.retainAll(nonChildFloatingRendererAreas);
                return new LayoutResult(layoutResult, null, null, overflowRenderer2, result.getCauseOfNothing()).setAreaBreak(result.getAreaBreak());
            } else {
                splitRenderer2 = splitRenderer;
            }
            LayoutArea editedArea3 = FloatingHelper.adjustResultOccupiedAreaForFloatAndClear(this, layoutContext.getFloatRendererAreas(), layoutContext.getArea().getBBox(), clearHeightCorrection, marginsCollapsingEnabled);
            return new LayoutResult(1, editedArea3, splitRenderer2, null, null);
        } else {
            return null;
        }
    }

    void decreaseLayoutBoxAfterChildPlacement(Rectangle layoutBox, LayoutResult result, IRenderer childRenderer) {
        layoutBox.setHeight(result.getOccupiedArea().getBBox().getY() - layoutBox.getY());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void correctFixedLayout(Rectangle layoutBox) {
        if (isFixedLayout()) {
            float y = getPropertyAsFloat(14).floatValue();
            move(0.0f, y - this.occupiedArea.getBBox().getY());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void applyWidth(Rectangle parentBBox, Float blockWidth, OverflowPropertyValue overflowX) {
        Float rotation = getPropertyAsFloat(55);
        if (blockWidth != null && (blockWidth.floatValue() < parentBBox.getWidth() || isPositioned() || rotation != null || !isOverflowFit(overflowX))) {
            parentBBox.setWidth(blockWidth.floatValue());
            return;
        }
        Float minWidth = retrieveMinWidth(parentBBox.getWidth());
        if (minWidth != null && minWidth.floatValue() > parentBBox.getWidth()) {
            parentBBox.setWidth(minWidth.floatValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean applyMaxHeight(Rectangle parentBBox, Float blockMaxHeight, MarginsCollapseHandler marginsCollapseHandler, boolean isCellRenderer, boolean wasParentsHeightClipped, OverflowPropertyValue overflowY) {
        if (blockMaxHeight != null) {
            if (blockMaxHeight.floatValue() >= parentBBox.getHeight() && isOverflowFit(overflowY)) {
                return false;
            }
            boolean wasHeightClipped = false;
            if (blockMaxHeight.floatValue() <= parentBBox.getHeight()) {
                wasHeightClipped = true;
            }
            float heightDelta = parentBBox.getHeight() - blockMaxHeight.floatValue();
            if (marginsCollapseHandler != null && !isCellRenderer) {
                marginsCollapseHandler.processFixedHeightAdjustment(heightDelta);
            }
            parentBBox.moveUp(heightDelta).setHeight(blockMaxHeight.floatValue());
            return wasHeightClipped;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AbstractRenderer applyMinHeight(OverflowPropertyValue overflowY, Rectangle layoutBox) {
        AbstractRenderer overflowRenderer = null;
        Float blockMinHeight = retrieveMinHeight();
        if (!Boolean.TRUE.equals(getPropertyAsBoolean(26)) && blockMinHeight != null && blockMinHeight.floatValue() > this.occupiedArea.getBBox().getHeight()) {
            float blockBottom = this.occupiedArea.getBBox().getBottom() - (blockMinHeight.floatValue() - this.occupiedArea.getBBox().getHeight());
            if (isFixedLayout()) {
                this.occupiedArea.getBBox().setY(blockBottom).setHeight(blockMinHeight.floatValue());
            } else if (isOverflowFit(overflowY) && 1.0E-4f + blockBottom < layoutBox.getBottom()) {
                float hDelta = this.occupiedArea.getBBox().getBottom() - layoutBox.getBottom();
                this.occupiedArea.getBBox().increaseHeight(hDelta).setY(layoutBox.getBottom());
                if (this.occupiedArea.getBBox().getHeight() < 0.0f) {
                    this.occupiedArea.getBBox().setHeight(0.0f);
                }
                this.isLastRendererForModelElement = false;
                overflowRenderer = createOverflowRenderer(2);
                overflowRenderer.updateMinHeight(UnitValue.createPointValue(blockMinHeight.floatValue() - this.occupiedArea.getBBox().getHeight()));
                if (hasProperty(27)) {
                    overflowRenderer.updateHeight(UnitValue.createPointValue(retrieveHeight().floatValue() - this.occupiedArea.getBBox().getHeight()));
                }
            } else {
                this.occupiedArea.getBBox().setY(blockBottom).setHeight(blockMinHeight.floatValue());
            }
        }
        return overflowRenderer;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void fixOccupiedAreaIfOverflowedX(OverflowPropertyValue overflowX, Rectangle layoutBox) {
        if (isOverflowFit(overflowX)) {
            return;
        }
        if (this.occupiedArea.getBBox().getWidth() > layoutBox.getWidth() || this.occupiedArea.getBBox().getLeft() < layoutBox.getLeft()) {
            this.occupiedArea.getBBox().setX(layoutBox.getX()).setWidth(layoutBox.getWidth());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void fixOccupiedAreaIfOverflowedY(OverflowPropertyValue overflowY, Rectangle layoutBox) {
        if (!isOverflowFit(overflowY) && this.occupiedArea.getBBox().getBottom() < layoutBox.getBottom()) {
            float difference = layoutBox.getBottom() - this.occupiedArea.getBBox().getBottom();
            this.occupiedArea.getBBox().moveUp(difference).decreaseHeight(difference);
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        MinMaxWidth childMinMaxWidth;
        MinMaxWidth minMaxWidth = new MinMaxWidth(calculateAdditionalWidth(this));
        if (!setMinMaxWidthBasedOnFixedWidth(minMaxWidth)) {
            Float minWidth = hasAbsoluteUnitValue(80) ? retrieveMinWidth(0.0f) : null;
            Float maxWidth = hasAbsoluteUnitValue(79) ? retrieveMaxWidth(0.0f) : null;
            if (minWidth == null || maxWidth == null) {
                AbstractWidthHandler handler = new MaxMaxWidthHandler(minMaxWidth);
                int epsilonNum = 0;
                int curEpsNum = 0;
                float previousFloatingChildWidth = 0.0f;
                for (IRenderer childRenderer : this.childRenderers) {
                    childRenderer.setParent(this);
                    if (childRenderer instanceof AbstractRenderer) {
                        childMinMaxWidth = ((AbstractRenderer) childRenderer).getMinMaxWidth();
                    } else {
                        childMinMaxWidth = MinMaxWidthUtils.countDefaultMinMaxWidth(childRenderer);
                    }
                    handler.updateMaxChildWidth(childMinMaxWidth.getMaxWidth() + (FloatingHelper.isRendererFloating(childRenderer) ? previousFloatingChildWidth : 0.0f));
                    handler.updateMinChildWidth(childMinMaxWidth.getMinWidth());
                    previousFloatingChildWidth = FloatingHelper.isRendererFloating(childRenderer) ? childMinMaxWidth.getMaxWidth() + previousFloatingChildWidth : 0.0f;
                    if (FloatingHelper.isRendererFloating(childRenderer)) {
                        curEpsNum++;
                    } else {
                        epsilonNum = Math.max(epsilonNum, curEpsNum);
                        curEpsNum = 0;
                    }
                }
                int epsilonNum2 = Math.max(epsilonNum, curEpsNum);
                handler.minMaxWidth.setChildrenMaxWidth(handler.minMaxWidth.getChildrenMaxWidth() + (epsilonNum2 * 1.0E-4f));
                handler.minMaxWidth.setChildrenMinWidth(handler.minMaxWidth.getChildrenMinWidth() + (epsilonNum2 * 1.0E-4f));
            }
            if (minWidth != null) {
                minMaxWidth.setChildrenMinWidth(minWidth.floatValue());
            }
            if (maxWidth != null) {
                minMaxWidth.setChildrenMaxWidth(maxWidth.floatValue());
            } else if (minMaxWidth.getChildrenMinWidth() > minMaxWidth.getChildrenMaxWidth()) {
                minMaxWidth.setChildrenMaxWidth(minMaxWidth.getChildrenMinWidth());
            }
        }
        if (getPropertyAsFloat(55) != null) {
            return RotationUtils.countRotationMinMaxWidth(minMaxWidth, this);
        }
        return minMaxWidth;
    }

    void handleForcedPlacement(boolean anythingPlaced) {
        if (anythingPlaced && hasOwnProperty(26)) {
            deleteOwnProperty(26);
        }
    }

    private boolean isAnythingOccupied() {
        return this.occupiedArea.getBBox().getHeight() >= 1.0E-4f;
    }

    private void replaceSplitRendererKidFloats(Map<Integer, IRenderer> waitingFloatsSplitRenderers, IRenderer splitRenderer) {
        for (Map.Entry<Integer, IRenderer> waitingSplitRenderer : waitingFloatsSplitRenderers.entrySet()) {
            if (waitingSplitRenderer.getValue() != null) {
                splitRenderer.getChildRenderers().set(waitingSplitRenderer.getKey().intValue(), waitingSplitRenderer.getValue());
            } else {
                splitRenderer.getChildRenderers().set(waitingSplitRenderer.getKey().intValue(), null);
            }
        }
        for (int i = splitRenderer.getChildRenderers().size() - 1; i >= 0; i--) {
            if (splitRenderer.getChildRenderers().get(i) == null) {
                splitRenderer.getChildRenderers().remove(i);
            }
        }
    }

    private void addMarkedContent(DrawContext drawContext, boolean isBegin) {
        if (Boolean.TRUE.equals(getProperty(Property.ADD_MARKED_CONTENT_TEXT))) {
            PdfCanvas canvas = drawContext.getCanvas();
            if (isBegin) {
                canvas.beginVariableText().saveState().endPath();
            } else {
                canvas.restoreState().endVariableText();
            }
        }
    }

    private List<Point> clipPolygon(List<Point> points, Point clipLineBeg, Point clipLineEnd) {
        List<Point> filteredPoints = new ArrayList<>();
        boolean prevOnRightSide = false;
        Point filteringPoint = points.get(0);
        if (checkPointSide(filteringPoint, clipLineBeg, clipLineEnd) >= 0) {
            filteredPoints.add(filteringPoint);
            prevOnRightSide = true;
        }
        Point prevPoint = filteringPoint;
        for (int i = 1; i < points.size() + 1; i++) {
            Point filteringPoint2 = points.get(i % points.size());
            if (checkPointSide(filteringPoint2, clipLineBeg, clipLineEnd) >= 0) {
                if (!prevOnRightSide) {
                    filteredPoints.add(getIntersectionPoint(prevPoint, filteringPoint2, clipLineBeg, clipLineEnd));
                }
                filteredPoints.add(filteringPoint2);
                prevOnRightSide = true;
            } else if (prevOnRightSide) {
                filteredPoints.add(getIntersectionPoint(prevPoint, filteringPoint2, clipLineBeg, clipLineEnd));
            }
            prevPoint = filteringPoint2;
        }
        return filteredPoints;
    }

    private int checkPointSide(Point filteredPoint, Point clipLineBeg, Point clipLineEnd) {
        double x1 = filteredPoint.getX() - clipLineBeg.getX();
        double y2 = clipLineEnd.getY() - clipLineBeg.getY();
        double x2 = clipLineEnd.getX() - clipLineBeg.getX();
        double y1 = filteredPoint.getY() - clipLineBeg.getY();
        double sgn = (x1 * y2) - (x2 * y1);
        if (Math.abs(sgn) < 0.001d) {
            return 0;
        }
        if (sgn > AudioStats.AUDIO_AMPLITUDE_NONE) {
            return 1;
        }
        return sgn < AudioStats.AUDIO_AMPLITUDE_NONE ? -1 : 0;
    }

    private Point getIntersectionPoint(Point lineBeg, Point lineEnd, Point clipLineBeg, Point clipLineEnd) {
        double A1 = lineBeg.getY() - lineEnd.getY();
        double A2 = clipLineBeg.getY() - clipLineEnd.getY();
        double B1 = lineEnd.getX() - lineBeg.getX();
        double B2 = clipLineEnd.getX() - clipLineBeg.getX();
        double C1 = (lineBeg.getX() * lineEnd.getY()) - (lineBeg.getY() * lineEnd.getX());
        double C2 = (clipLineBeg.getX() * clipLineEnd.getY()) - (clipLineBeg.getY() * clipLineEnd.getX());
        double M = (B1 * A2) - (B2 * A1);
        return new Point(((B2 * C1) - (B1 * C2)) / M, ((C2 * A1) - (C1 * A2)) / M);
    }
}
