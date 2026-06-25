package com.itextpdf.layout.renderer;

import androidx.camera.video.AudioStats;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.CanvasArtifact;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import com.itextpdf.kernel.pdf.xobject.PdfXObject;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.MinMaxWidthLayoutResult;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.FloatPropertyValue;
import com.itextpdf.layout.properties.ObjectFit;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.renderer.objectfit.ObjectFitApplyingResult;
import com.itextpdf.layout.renderer.objectfit.ObjectFitCalculator;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ImageRenderer extends AbstractRenderer implements ILeafElementRenderer {
    protected float deltaX;
    private boolean doesObjectFitRequireCutting;
    protected Float fixedXPosition;
    protected Float fixedYPosition;
    private Float height;
    protected float imageHeight;
    protected float imageWidth;
    private Rectangle initialOccupiedAreaBBox;
    float[] matrix;
    protected float pivotY;
    private float renderedImageHeight;
    private float renderedImageWidth;
    private float rotatedDeltaX;
    private float rotatedDeltaY;
    private Float width;

    public ImageRenderer(Image image) {
        super(image);
        this.matrix = new float[6];
        this.imageWidth = image.getImageWidth();
        this.imageHeight = image.getImageHeight();
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        boolean nowrap;
        Rectangle layoutBox;
        List<Rectangle> floatRendererAreas;
        OverflowPropertyValue overflowX;
        OverflowPropertyValue overflowPropertyValue;
        Float angle;
        Image modelElement;
        float imageItselfWidth;
        float imageItselfHeight;
        boolean isPlacingForced;
        LayoutArea area;
        Border[] borders;
        float imageItselfHeight2;
        float scaleCoef;
        float imageItselfWidth2;
        UnitValue leftMargin;
        LayoutArea area2 = layoutContext.getArea().mo7332clone();
        Rectangle layoutBox2 = area2.getBBox().mo7327clone();
        AffineTransform t = new AffineTransform();
        Image modelElement2 = (Image) getModelElement();
        PdfXObject xObject = modelElement2.getXObject();
        calculateImageDimensions(layoutBox2, t, xObject);
        OverflowPropertyValue overflowX2 = this.parent != null ? (OverflowPropertyValue) this.parent.getProperty(103) : OverflowPropertyValue.FIT;
        if (this.parent instanceof LineRenderer) {
            boolean nowrap2 = Boolean.TRUE.equals(this.parent.getOwnProperty(Property.NO_SOFT_WRAP_INLINE));
            nowrap = nowrap2;
        } else {
            nowrap = false;
        }
        List<Rectangle> floatRendererAreas2 = layoutContext.getFloatRendererAreas();
        float clearHeightCorrection = FloatingHelper.calculateClearHeightCorrection(this, floatRendererAreas2, layoutBox2);
        FloatPropertyValue floatPropertyValue = (FloatPropertyValue) getProperty(99);
        if (FloatingHelper.isRendererFloating(this, floatPropertyValue)) {
            layoutBox2.decreaseHeight(clearHeightCorrection);
            FloatingHelper.adjustFloatedBlockLayoutBox(this, layoutBox2, this.width, floatRendererAreas2, floatPropertyValue, overflowX2);
            layoutBox = layoutBox2;
            floatRendererAreas = floatRendererAreas2;
            overflowX = overflowX2;
        } else {
            layoutBox = layoutBox2;
            floatRendererAreas = floatRendererAreas2;
            overflowX = overflowX2;
            clearHeightCorrection = FloatingHelper.adjustLayoutBoxAccordingToFloats(floatRendererAreas, layoutBox, this.width, clearHeightCorrection, null);
        }
        applyMargins(layoutBox, false);
        Border[] borders2 = getBorders();
        applyBorderBox(layoutBox, borders2, false);
        Float declaredMaxHeight = retrieveMaxHeight();
        if (this.parent == null || ((declaredMaxHeight == null || declaredMaxHeight.floatValue() > layoutBox.getHeight()) && !layoutContext.isClippedHeight())) {
            overflowPropertyValue = OverflowPropertyValue.FIT;
        } else {
            overflowPropertyValue = (OverflowPropertyValue) this.parent.getProperty(104);
        }
        OverflowPropertyValue overflowY = overflowPropertyValue;
        boolean processOverflowX = !isOverflowFit(overflowX) || nowrap;
        boolean processOverflowY = !isOverflowFit(overflowY);
        if (isAbsolutePosition()) {
            applyAbsolutePosition(layoutBox);
        }
        this.occupiedArea = new LayoutArea(area2.getPageNumber(), new Rectangle(layoutBox.getX(), layoutBox.getY() + layoutBox.getHeight(), 0.0f, 0.0f));
        TargetCounterHandler.addPageByID(this);
        float imageContainerWidth = this.width.floatValue();
        float imageContainerHeight = this.height.floatValue();
        if (isFixedLayout()) {
            this.fixedXPosition = getPropertyAsFloat(34);
            this.fixedYPosition = getPropertyAsFloat(14);
        }
        Float angle2 = getPropertyAsFloat(55);
        if (angle2 != null) {
            angle = angle2;
        } else {
            angle = Float.valueOf(0.0f);
        }
        t.rotate(angle.floatValue());
        this.initialOccupiedAreaBBox = getOccupiedAreaBBox().mo7327clone();
        float scaleCoef2 = adjustPositionAfterRotation(angle.floatValue(), layoutBox.getWidth(), layoutBox.getHeight());
        float imageContainerHeight2 = imageContainerHeight * scaleCoef2;
        float imageContainerWidth2 = imageContainerWidth * scaleCoef2;
        this.initialOccupiedAreaBBox.moveDown(imageContainerHeight2);
        this.initialOccupiedAreaBBox.setHeight(imageContainerHeight2);
        this.initialOccupiedAreaBBox.setWidth(imageContainerWidth2);
        if (!(xObject instanceof PdfFormXObject)) {
            modelElement = modelElement2;
        } else {
            modelElement = modelElement2;
            t.scale(scaleCoef2, scaleCoef2);
        }
        applyObjectFit(modelElement.getObjectFit(), this.imageWidth, this.imageHeight);
        if (modelElement.getObjectFit() == ObjectFit.FILL) {
            imageItselfWidth = imageContainerWidth2;
            imageItselfHeight = imageContainerHeight2;
        } else {
            float imageItselfWidth3 = this.renderedImageWidth;
            imageItselfWidth = imageItselfWidth3;
            imageItselfHeight = this.renderedImageHeight;
        }
        getMatrix(t, imageItselfWidth, imageItselfHeight);
        boolean isPlacingForced2 = false;
        if (this.width.floatValue() > layoutBox.getWidth() + 1.0E-4f || this.height.floatValue() > layoutBox.getHeight() + 1.0E-4f) {
            if (Boolean.TRUE.equals(getPropertyAsBoolean(26))) {
                isPlacingForced = true;
            } else {
                boolean isPlacingForced3 = true;
                if (this.width.floatValue() > layoutBox.getWidth() + 1.0E-4f) {
                    isPlacingForced3 = true & processOverflowX;
                }
                if (this.height.floatValue() <= layoutBox.getHeight() + 1.0E-4f) {
                    isPlacingForced = isPlacingForced3;
                } else {
                    isPlacingForced = isPlacingForced3 & processOverflowY;
                }
            }
            if (!isPlacingForced) {
                applyMargins(this.initialOccupiedAreaBBox, true);
                applyBorderBox(this.initialOccupiedAreaBBox, true);
                this.occupiedArea.getBBox().setHeight(this.initialOccupiedAreaBBox.getHeight());
                return new MinMaxWidthLayoutResult(3, this.occupiedArea, null, this, this);
            }
            area = area2;
            borders = borders2;
            imageItselfHeight2 = imageContainerWidth2;
            scaleCoef = scaleCoef2;
            imageItselfWidth2 = imageContainerHeight2;
            isPlacingForced2 = isPlacingForced;
        } else {
            area = area2;
            borders = borders2;
            imageItselfHeight2 = imageContainerWidth2;
            scaleCoef = scaleCoef2;
            imageItselfWidth2 = imageContainerHeight2;
        }
        this.occupiedArea.getBBox().moveDown(this.height.floatValue());
        if (borders[3] != null) {
            float delta = ((float) Math.sin(angle.floatValue())) * borders[3].getWidth();
            float renderScaling = this.renderedImageHeight / this.height.floatValue();
            this.height = Float.valueOf(this.height.floatValue() + delta);
            this.renderedImageHeight += delta * renderScaling;
        }
        this.occupiedArea.getBBox().setHeight(this.height.floatValue());
        this.occupiedArea.getBBox().setWidth(this.width.floatValue());
        UnitValue leftMargin2 = getPropertyAsUnitValue(44);
        if (!leftMargin2.isPointValue()) {
            Logger logger = LoggerFactory.getLogger(ImageRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
        }
        UnitValue topMargin = getPropertyAsUnitValue(46);
        if (topMargin.isPointValue()) {
            leftMargin = leftMargin2;
        } else {
            Logger logger2 = LoggerFactory.getLogger(ImageRenderer.class);
            leftMargin = leftMargin2;
            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 46));
        }
        if (0.0f != leftMargin.getValue() || 0.0f != topMargin.getValue()) {
            translateImage(leftMargin.getValue(), topMargin.getValue(), t);
            getMatrix(t, imageItselfHeight2, imageItselfWidth2);
        }
        applyBorderBox(this.occupiedArea.getBBox(), borders, true);
        applyMargins(this.occupiedArea.getBBox(), true);
        if (angle.floatValue() != 0.0f) {
            applyRotationLayout(angle.floatValue());
        }
        float unscaledWidth = this.occupiedArea.getBBox().getWidth() / scaleCoef;
        MinMaxWidth minMaxWidth = new MinMaxWidth(unscaledWidth, unscaledWidth, 0.0f);
        UnitValue rendererWidth = (UnitValue) getProperty(77);
        if (rendererWidth == null || !rendererWidth.isPercentValue()) {
            boolean autoScale = hasProperty(3) && ((Boolean) getProperty(3)).booleanValue();
            boolean autoScale2 = autoScale;
            boolean autoScaleWidth = hasProperty(5) && ((Boolean) getProperty(5)).booleanValue();
            if (autoScale2 || autoScaleWidth) {
                minMaxWidth.setChildrenMinWidth(0.0f);
            }
        } else {
            minMaxWidth.setChildrenMinWidth(0.0f);
            float coeff = this.imageWidth / retrieveWidth(area.getBBox().getWidth()).floatValue();
            minMaxWidth.setChildrenMaxWidth(unscaledWidth * coeff);
        }
        FloatingHelper.removeFloatsAboveRendererBottom(floatRendererAreas, this);
        LayoutArea editedArea = FloatingHelper.adjustResultOccupiedAreaForFloatAndClear(this, floatRendererAreas, layoutContext.getArea().getBBox(), clearHeightCorrection, false);
        applyAbsolutePositionIfNeeded(layoutContext);
        return new MinMaxWidthLayoutResult(1, editedArea, null, null, isPlacingForced2 ? this : null).setMinMaxWidth(minMaxWidth);
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        boolean z;
        if (this.occupiedArea == null) {
            Logger logger = LoggerFactory.getLogger(ImageRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Drawing won't be performed."));
            return;
        }
        boolean isRelativePosition = isRelativePosition();
        if (isRelativePosition) {
            applyRelativePositioningTranslation(false);
        }
        boolean isTagged = drawContext.isTaggingEnabled();
        LayoutTaggingHelper taggingHelper = null;
        boolean isArtifact = false;
        TagTreePointer tagPointer = null;
        if (isTagged) {
            taggingHelper = (LayoutTaggingHelper) getProperty(108);
            if (taggingHelper == null) {
                isArtifact = true;
            } else {
                isArtifact = taggingHelper.isArtifact(this);
                if (!isArtifact) {
                    tagPointer = taggingHelper.useAutoTaggingPointerAndRememberItsPosition(this);
                    if (taggingHelper.createTag(this, tagPointer)) {
                        tagPointer.getProperties().addAttributes(0, AccessibleAttributesApplier.getLayoutAttributes(this, tagPointer));
                    }
                }
            }
        }
        beginTransformationIfApplied(drawContext.getCanvas());
        Float angle = getPropertyAsFloat(55);
        if (angle != null) {
            drawContext.getCanvas().saveState();
            applyConcatMatrix(drawContext, angle);
        }
        super.draw(drawContext);
        boolean clipImageInAViewOfBorderRadius = clipBackgroundArea(drawContext, applyMargins(getOccupiedAreaBBox(), false), true);
        applyMargins(this.occupiedArea.getBBox(), false);
        applyBorderBox(this.occupiedArea.getBBox(), getBorders(), false);
        if (this.fixedYPosition == null) {
            this.fixedYPosition = Float.valueOf(this.occupiedArea.getBBox().getY() + this.pivotY);
        }
        if (this.fixedXPosition == null) {
            this.fixedXPosition = Float.valueOf(this.occupiedArea.getBBox().getX());
        }
        if (angle != null) {
            this.fixedXPosition = Float.valueOf(this.fixedXPosition.floatValue() + this.rotatedDeltaX);
            this.fixedYPosition = Float.valueOf(this.fixedYPosition.floatValue() - this.rotatedDeltaY);
            drawContext.getCanvas().restoreState();
        }
        PdfCanvas canvas = drawContext.getCanvas();
        if (isTagged) {
            if (isArtifact) {
                canvas.openTag(new CanvasArtifact());
            } else {
                canvas.openTag(tagPointer.getTagReference());
            }
        }
        beginObjectFitImageClipping(canvas);
        PdfXObject xObject = ((Image) getModelElement()).getXObject();
        beginElementOpacityApplying(drawContext);
        float renderedImageShiftX = (this.width.floatValue() - this.renderedImageWidth) / 2.0f;
        float renderedImageShiftY = (this.height.floatValue() - this.renderedImageHeight) / 2.0f;
        canvas.addXObjectWithTransformationMatrix(xObject, this.matrix[0], this.matrix[1], this.matrix[2], this.matrix[3], this.fixedXPosition.floatValue() + this.deltaX + renderedImageShiftX, this.fixedYPosition.floatValue() + renderedImageShiftY);
        endElementOpacityApplying(drawContext);
        endObjectFitImageClipping(canvas);
        endTransformationIfApplied(drawContext.getCanvas());
        if (Boolean.TRUE.equals(getPropertyAsBoolean(19))) {
            xObject.flush();
        }
        if (isTagged) {
            canvas.closeTag();
        }
        if (clipImageInAViewOfBorderRadius) {
            canvas.restoreState();
        }
        if (!isRelativePosition) {
            z = true;
        } else {
            z = true;
            applyRelativePositioningTranslation(true);
        }
        applyBorderBox(this.occupiedArea.getBBox(), getBorders(), z);
        applyMargins(this.occupiedArea.getBBox(), z);
        if (isTagged && !isArtifact) {
            taggingHelper.finishTaggingHint(this);
            taggingHelper.restoreAutoTaggingPointerPosition(this);
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        return null;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle getBorderAreaBBox() {
        applyMargins(this.initialOccupiedAreaBBox, false);
        applyBorderBox(this.initialOccupiedAreaBBox, getBorders(), false);
        boolean isRelativePosition = isRelativePosition();
        if (isRelativePosition) {
            applyRelativePositioningTranslation(false);
        }
        applyMargins(this.initialOccupiedAreaBBox, true);
        applyBorderBox(this.initialOccupiedAreaBBox, true);
        return this.initialOccupiedAreaBBox;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public boolean hasAspectRatio() {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float getAspectRatio() {
        return Float.valueOf(this.imageWidth / this.imageHeight);
    }

    public float getImageWidth() {
        return this.imageWidth;
    }

    public float getImageHeight() {
        return this.imageHeight;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle applyPaddings(Rectangle rect, UnitValue[] paddings, boolean reverse) {
        return rect;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void move(float dxRight, float dyUp) {
        super.move(dxRight, dyUp);
        if (this.initialOccupiedAreaBBox != null) {
            this.initialOccupiedAreaBBox.moveRight(dxRight);
            this.initialOccupiedAreaBBox.moveUp(dyUp);
        }
        if (this.fixedXPosition != null) {
            this.fixedXPosition = Float.valueOf(this.fixedXPosition.floatValue() + dxRight);
        }
        if (this.fixedYPosition != null) {
            this.fixedYPosition = Float.valueOf(this.fixedYPosition.floatValue() + dyUp);
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        return ((MinMaxWidthLayoutResult) layout(new LayoutContext(new LayoutArea(1, new Rectangle(MinMaxWidthUtils.getInfWidth(), 1000000.0f))))).getMinMaxWidth();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ImageRenderer autoScale(LayoutArea layoutArea) {
        Rectangle area = layoutArea.getBBox().mo7327clone();
        applyMargins(area, false);
        applyBorderBox(area, false);
        float angleScaleCoef = this.imageWidth / this.width.floatValue();
        if (this.width.floatValue() > area.getWidth() * angleScaleCoef) {
            updateHeight(UnitValue.createPointValue((area.getWidth() / this.width.floatValue()) * this.imageHeight));
            updateWidth(UnitValue.createPointValue(area.getWidth() * angleScaleCoef));
        }
        return this;
    }

    private void applyObjectFit(ObjectFit objectFit, float imageWidth, float imageHeight) {
        ObjectFitApplyingResult result = ObjectFitCalculator.calculateRenderedImageSize(objectFit, imageWidth, imageHeight, this.width.floatValue(), this.height.floatValue());
        this.renderedImageWidth = (float) result.getRenderedImageWidth();
        this.renderedImageHeight = (float) result.getRenderedImageHeight();
        this.doesObjectFitRequireCutting = result.isImageCuttingRequired();
    }

    private void beginObjectFitImageClipping(PdfCanvas canvas) {
        if (this.doesObjectFitRequireCutting) {
            canvas.saveState();
            Rectangle clippedArea = new Rectangle(this.fixedXPosition.floatValue(), this.fixedYPosition.floatValue(), this.width.floatValue(), this.height.floatValue());
            canvas.rectangle(clippedArea).clip().endPath();
        }
    }

    private void endObjectFitImageClipping(PdfCanvas canvas) {
        if (this.doesObjectFitRequireCutting) {
            canvas.restoreState();
        }
    }

    private void calculateImageDimensions(Rectangle layoutBox, AffineTransform t, PdfXObject xObject) {
        this.width = getProperty(77) != null ? retrieveWidth(layoutBox.getWidth()) : null;
        Float declaredHeight = retrieveHeight();
        this.height = declaredHeight;
        if (this.width == null && this.height == null) {
            this.width = Float.valueOf(this.imageWidth);
            this.height = Float.valueOf((this.width.floatValue() / this.imageWidth) * this.imageHeight);
        } else {
            Float f = this.width;
            Float f2 = this.height;
            if (f == null) {
                this.width = Float.valueOf((f2.floatValue() / this.imageHeight) * this.imageWidth);
            } else if (f2 == null) {
                this.height = Float.valueOf((this.width.floatValue() / this.imageWidth) * this.imageHeight);
            }
        }
        Float horizontalScaling = getPropertyAsFloat(29, Float.valueOf(1.0f));
        Float verticalScaling = getPropertyAsFloat(76, Float.valueOf(1.0f));
        if ((xObject instanceof PdfFormXObject) && this.width.floatValue() != this.imageWidth) {
            horizontalScaling = Float.valueOf(horizontalScaling.floatValue() * (this.width.floatValue() / this.imageWidth));
            verticalScaling = Float.valueOf(verticalScaling.floatValue() * (this.height.floatValue() / this.imageHeight));
        }
        if (horizontalScaling.floatValue() != 1.0f) {
            if (xObject instanceof PdfFormXObject) {
                t.scale(horizontalScaling.floatValue(), 1.0d);
                this.width = Float.valueOf(this.imageWidth * horizontalScaling.floatValue());
            } else {
                this.width = Float.valueOf(this.width.floatValue() * horizontalScaling.floatValue());
            }
        }
        if (verticalScaling.floatValue() != 1.0f) {
            if (xObject instanceof PdfFormXObject) {
                t.scale(1.0d, verticalScaling.floatValue());
                this.height = Float.valueOf(this.imageHeight * verticalScaling.floatValue());
            } else {
                this.height = Float.valueOf(this.height.floatValue() * verticalScaling.floatValue());
            }
        }
        Float minWidth = retrieveMinWidth(layoutBox.getWidth());
        Float maxWidth = retrieveMaxWidth(layoutBox.getWidth());
        if (minWidth != null && this.width.floatValue() < minWidth.floatValue()) {
            this.height = Float.valueOf(this.height.floatValue() * (minWidth.floatValue() / this.width.floatValue()));
            this.width = minWidth;
        } else if (maxWidth != null && this.width.floatValue() > maxWidth.floatValue()) {
            this.height = Float.valueOf(this.height.floatValue() * (maxWidth.floatValue() / this.width.floatValue()));
            this.width = maxWidth;
        }
        Float minHeight = retrieveMinHeight();
        Float maxHeight = retrieveMaxHeight();
        if (minHeight != null && this.height.floatValue() < minHeight.floatValue()) {
            this.width = Float.valueOf(this.width.floatValue() * (minHeight.floatValue() / this.height.floatValue()));
            this.height = minHeight;
        } else if (maxHeight != null && this.height.floatValue() > maxHeight.floatValue()) {
            this.width = Float.valueOf(this.width.floatValue() * (maxHeight.floatValue() / this.height.floatValue()));
            this.height = maxHeight;
        } else if (declaredHeight != null && !this.height.equals(declaredHeight)) {
            this.width = Float.valueOf(this.width.floatValue() * (declaredHeight.floatValue() / this.height.floatValue()));
            this.height = declaredHeight;
        }
    }

    private void getMatrix(AffineTransform t, float imageItselfScaledWidth, float imageItselfScaledHeight) {
        t.getMatrix(this.matrix);
        PdfXObject xObject = ((Image) getModelElement()).getXObject();
        if (xObject instanceof PdfImageXObject) {
            float[] fArr = this.matrix;
            fArr[0] = fArr[0] * imageItselfScaledWidth;
            float[] fArr2 = this.matrix;
            fArr2[1] = fArr2[1] * imageItselfScaledWidth;
            float[] fArr3 = this.matrix;
            fArr3[2] = fArr3[2] * imageItselfScaledHeight;
            float[] fArr4 = this.matrix;
            fArr4[3] = fArr4[3] * imageItselfScaledHeight;
        }
    }

    private float adjustPositionAfterRotation(float angle, float maxWidth, float maxHeight) {
        if (angle != 0.0f) {
            AffineTransform t = AffineTransform.getRotateInstance(angle);
            Point p00 = t.transform(new Point(0, 0), new Point());
            Point p01 = t.transform(new Point((double) AudioStats.AUDIO_AMPLITUDE_NONE, this.height.floatValue()), new Point());
            Point p10 = t.transform(new Point(this.width.floatValue(), (double) AudioStats.AUDIO_AMPLITUDE_NONE), new Point());
            Point p11 = t.transform(new Point(this.width.floatValue(), this.height.floatValue()), new Point());
            double[] xValues = {p01.getX(), p10.getX(), p11.getX()};
            double[] yValues = {p01.getY(), p10.getY(), p11.getY()};
            double minX = p00.getX();
            double minY = p00.getY();
            double maxX = minX;
            int length = xValues.length;
            int i = 0;
            while (i < length) {
                int i2 = i;
                double x = xValues[i2];
                minX = Math.min(minX, x);
                maxX = Math.max(maxX, x);
                i = i2 + 1;
                t = t;
            }
            int length2 = yValues.length;
            double maxY = minY;
            int i3 = 0;
            while (i3 < length2) {
                int i4 = length2;
                int i5 = i3;
                double y = yValues[i5];
                minY = Math.min(minY, y);
                maxY = Math.max(maxY, y);
                i3 = i5 + 1;
                length2 = i4;
            }
            this.height = Float.valueOf((float) (maxY - minY));
            this.width = Float.valueOf((float) (maxX - minX));
            this.pivotY = (float) (p00.getY() - minY);
            this.deltaX = -((float) minX);
        }
        float scaleCoeff = 1.0f;
        if (Boolean.TRUE.equals(getPropertyAsBoolean(3))) {
            if (maxWidth / this.width.floatValue() < maxHeight / this.height.floatValue()) {
                scaleCoeff = maxWidth / this.width.floatValue();
                this.height = Float.valueOf(this.height.floatValue() * (maxWidth / this.width.floatValue()));
                this.width = Float.valueOf(maxWidth);
            } else {
                scaleCoeff = maxHeight / this.height.floatValue();
                this.width = Float.valueOf(this.width.floatValue() * (maxHeight / this.height.floatValue()));
                this.height = Float.valueOf(maxHeight);
            }
        } else if (!Boolean.TRUE.equals(getPropertyAsBoolean(5))) {
            if (Boolean.TRUE.equals(getPropertyAsBoolean(4))) {
                scaleCoeff = maxHeight / this.height.floatValue();
                this.height = Float.valueOf(maxHeight);
                this.width = Float.valueOf(this.width.floatValue() * scaleCoeff);
            }
        } else {
            scaleCoeff = maxWidth / this.width.floatValue();
            this.height = Float.valueOf(this.height.floatValue() * scaleCoeff);
            this.width = Float.valueOf(maxWidth);
        }
        this.pivotY *= scaleCoeff;
        this.deltaX *= scaleCoeff;
        return scaleCoeff;
    }

    private void translateImage(float xDistance, float yDistance, AffineTransform t) {
        t.translate(xDistance, yDistance);
        t.getMatrix(this.matrix);
        if (this.fixedXPosition != null) {
            this.fixedXPosition = Float.valueOf(this.fixedXPosition.floatValue() + ((float) t.getTranslateX()));
        }
        if (this.fixedYPosition != null) {
            this.fixedYPosition = Float.valueOf(this.fixedYPosition.floatValue() + ((float) t.getTranslateY()));
        }
    }

    private void applyConcatMatrix(DrawContext drawContext, Float angle) {
        AffineTransform rotationTransform = AffineTransform.getRotateInstance(angle.floatValue());
        Rectangle rect = getBorderAreaBBox();
        List<Point> rotatedPoints = transformPoints(rectangleToPointsList(rect), rotationTransform);
        float[] shift = calculateShiftToPositionBBoxOfPointsAt(rect.getX(), rect.getY() + rect.getHeight(), rotatedPoints);
        double[] matrix = new double[6];
        rotationTransform.getMatrix(matrix);
        drawContext.getCanvas().concatMatrix(matrix[0], matrix[1], matrix[2], matrix[3], shift[0], shift[1]);
    }

    private void applyRotationLayout(float angle) {
        Border[] borders = getBorders();
        Rectangle rect = getBorderAreaBBox();
        float leftBorderWidth = borders[3] == null ? 0.0f : borders[3].getWidth();
        float rightBorderWidth = borders[1] == null ? 0.0f : borders[1].getWidth();
        float topBorderWidth = borders[0] == null ? 0.0f : borders[0].getWidth();
        if (leftBorderWidth != 0.0f) {
            float gip = (float) Math.sqrt(Math.pow(topBorderWidth, 2.0d) + Math.pow(leftBorderWidth, 2.0d));
            double atan = Math.atan(topBorderWidth / leftBorderWidth);
            if (angle < 0.0f) {
                atan = -atan;
            }
            this.rotatedDeltaX = Math.abs((float) ((gip * Math.cos(angle - atan)) - leftBorderWidth));
        } else {
            this.rotatedDeltaX = 0.0f;
        }
        rect.moveRight(this.rotatedDeltaX);
        this.occupiedArea.getBBox().setWidth(this.occupiedArea.getBBox().getWidth() + this.rotatedDeltaX);
        if (rightBorderWidth != 0.0f) {
            float gip2 = (float) Math.sqrt(Math.pow(topBorderWidth, 2.0d) + Math.pow(leftBorderWidth, 2.0d));
            double atan2 = Math.atan(rightBorderWidth / topBorderWidth);
            if (angle < 0.0f) {
                atan2 = -atan2;
            }
            this.rotatedDeltaY = Math.abs((float) ((gip2 * Math.cos(angle - atan2)) - topBorderWidth));
        } else {
            this.rotatedDeltaY = 0.0f;
        }
        rect.moveDown(this.rotatedDeltaY);
        if (angle < 0.0f) {
            this.rotatedDeltaY += rightBorderWidth;
        }
        this.occupiedArea.getBBox().increaseHeight(this.rotatedDeltaY);
    }

    @Override // com.itextpdf.layout.renderer.ILeafElementRenderer
    public float getAscent() {
        return this.occupiedArea.getBBox().getHeight();
    }

    @Override // com.itextpdf.layout.renderer.ILeafElementRenderer
    public float getDescent() {
        return 0.0f;
    }
}
