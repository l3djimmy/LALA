package com.itextpdf.layout.renderer;

import androidx.camera.video.AudioStats;
import com.itextpdf.commons.datastructures.Tuple2;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.NumberUtil;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.gradients.AbstractLinearGradientBuilder;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfVersion;
import com.itextpdf.kernel.pdf.action.PdfAction;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfLinkAnnotation;
import com.itextpdf.kernel.pdf.canvas.CanvasArtifact;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
import com.itextpdf.kernel.pdf.navigation.PdfStructureDestination;
import com.itextpdf.kernel.pdf.tagging.PdfStructElem;
import com.itextpdf.kernel.pdf.tagutils.TagStructureContext;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.pdf.xobject.PdfXObject;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.IPropertyContainer;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.font.FontCharacteristics;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.font.FontSelector;
import com.itextpdf.layout.font.FontSet;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.PositionedLayoutContext;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.Background;
import com.itextpdf.layout.properties.BackgroundBox;
import com.itextpdf.layout.properties.BackgroundImage;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.BlendMode;
import com.itextpdf.layout.properties.BorderRadius;
import com.itextpdf.layout.properties.BoxSizingPropertyValue;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.Transform;
import com.itextpdf.layout.properties.TransparentColor;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class AbstractRenderer implements IRenderer {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int ARC_BOTTOM_DEGREE = 270;
    private static final int ARC_LEFT_DEGREE = 180;
    private static final int ARC_QUARTER_CLOCKWISE_EXTENT = -90;
    private static final int ARC_RIGHT_DEGREE = 0;
    private static final int ARC_TOP_DEGREE = 90;
    static final int BOTTOM_SIDE = 2;
    private static final Tuple2<String, PdfDictionary> CHECK_TUPLE2_TYPE = new Tuple2<>("", new PdfDictionary());
    protected static final float EPS = 1.0E-4f;
    protected static final float INF = 1000000.0f;
    static final int LEFT_SIDE = 3;
    public static final float OVERLAP_EPSILON = 1.0E-4f;
    static final int RIGHT_SIDE = 1;
    static final int TOP_SIDE = 0;
    protected List<IRenderer> childRenderers;
    protected boolean flushed;
    protected boolean isLastRendererForModelElement;
    protected IPropertyContainer modelElement;
    protected LayoutArea occupiedArea;
    protected IRenderer parent;
    protected List<IRenderer> positionedRenderers;
    protected Map<Integer, Object> properties;

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractRenderer() {
        this.childRenderers = new ArrayList();
        this.positionedRenderers = new ArrayList();
        this.flushed = false;
        this.properties = new HashMap();
        this.isLastRendererForModelElement = true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractRenderer(IElement modelElement) {
        this.childRenderers = new ArrayList();
        this.positionedRenderers = new ArrayList();
        this.flushed = false;
        this.properties = new HashMap();
        this.isLastRendererForModelElement = true;
        this.modelElement = modelElement;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractRenderer(AbstractRenderer other) {
        this.childRenderers = new ArrayList();
        this.positionedRenderers = new ArrayList();
        this.flushed = false;
        this.properties = new HashMap();
        this.isLastRendererForModelElement = true;
        this.childRenderers = other.childRenderers;
        this.positionedRenderers = other.positionedRenderers;
        this.modelElement = other.modelElement;
        this.flushed = other.flushed;
        this.occupiedArea = other.occupiedArea != null ? other.occupiedArea.mo7332clone() : null;
        this.parent = other.parent;
        this.properties.putAll(other.properties);
        this.isLastRendererForModelElement = other.isLastRendererForModelElement;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public void addChild(IRenderer renderer) {
        Integer positioning = (Integer) renderer.getProperty(52);
        if (positioning == null || positioning.intValue() == 2 || positioning.intValue() == 1) {
            this.childRenderers.add(renderer);
        } else if (positioning.intValue() == 4) {
            AbstractRenderer root = this;
            while (root.parent instanceof AbstractRenderer) {
                root = (AbstractRenderer) root.parent;
            }
            if (root == this) {
                this.positionedRenderers.add(renderer);
            } else {
                root.addChild(renderer);
            }
        } else if (positioning.intValue() == 3) {
            AbstractRenderer positionedParent = this;
            boolean noPositionInfo = noAbsolutePositionInfo(renderer);
            while (!positionedParent.isPositioned() && !noPositionInfo) {
                IRenderer parent = positionedParent.parent;
                if (!(parent instanceof AbstractRenderer)) {
                    break;
                }
                positionedParent = (AbstractRenderer) parent;
            }
            if (positionedParent == this) {
                this.positionedRenderers.add(renderer);
            } else {
                positionedParent.addChild(renderer);
            }
        }
        if ((renderer instanceof AbstractRenderer) && !((AbstractRenderer) renderer).isPositioned() && ((AbstractRenderer) renderer).positionedRenderers.size() > 0) {
            int pos = 0;
            List<IRenderer> childPositionedRenderers = ((AbstractRenderer) renderer).positionedRenderers;
            while (pos < childPositionedRenderers.size()) {
                if (noAbsolutePositionInfo(childPositionedRenderers.get(pos))) {
                    pos++;
                } else {
                    this.positionedRenderers.add(childPositionedRenderers.get(pos));
                    childPositionedRenderers.remove(pos);
                }
            }
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IPropertyContainer getModelElement() {
        return this.modelElement;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public List<IRenderer> getChildRenderers() {
        return this.childRenderers;
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public boolean hasProperty(int property) {
        return hasOwnProperty(property) || (this.modelElement != null && this.modelElement.hasProperty(property)) || (this.parent != null && Property.isPropertyInherited(property) && this.parent.hasProperty(property));
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public boolean hasOwnProperty(int property) {
        return this.properties.containsKey(Integer.valueOf(property));
    }

    public boolean hasOwnOrModelProperty(int property) {
        return hasOwnOrModelProperty(this, property);
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public void deleteOwnProperty(int property) {
        this.properties.remove(Integer.valueOf(property));
    }

    public void deleteProperty(int property) {
        if (this.properties.containsKey(Integer.valueOf(property))) {
            this.properties.remove(Integer.valueOf(property));
        } else if (this.modelElement != null) {
            this.modelElement.deleteOwnProperty(property);
        }
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getProperty(int key) {
        T1 t1;
        T1 t12;
        T1 t13 = (T1) this.properties.get(Integer.valueOf(key));
        if (t13 != null || this.properties.containsKey(Integer.valueOf(key))) {
            return t13;
        }
        if (this.modelElement == null || ((t12 = (T1) this.modelElement.getProperty(key)) == null && !this.modelElement.hasProperty(key))) {
            if (this.parent == null || !Property.isPropertyInherited(key) || (t1 = (T1) this.parent.getProperty(key)) == null) {
                T1 t14 = (T1) getDefaultProperty(key);
                if (t14 != null) {
                    return t14;
                }
                if (this.modelElement != null) {
                    return (T1) this.modelElement.getDefaultProperty(key);
                }
                return null;
            }
            return t1;
        }
        return t12;
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getOwnProperty(int property) {
        return (T1) this.properties.get(Integer.valueOf(property));
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public <T1> T1 getProperty(int property, T1 defaultValue) {
        T1 result = (T1) getProperty(property);
        return result != null ? result : defaultValue;
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public void setProperty(int property, Object value) {
        this.properties.put(Integer.valueOf(property), value);
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getDefaultProperty(int property) {
        return null;
    }

    public PdfFont getPropertyAsFont(int property) {
        return (PdfFont) getProperty(property);
    }

    public Color getPropertyAsColor(int property) {
        return (Color) getProperty(property);
    }

    public TransparentColor getPropertyAsTransparentColor(int property) {
        return (TransparentColor) getProperty(property);
    }

    public Float getPropertyAsFloat(int property) {
        return NumberUtil.asFloat(getProperty(property));
    }

    public Float getPropertyAsFloat(int property, Float defaultValue) {
        return NumberUtil.asFloat(getProperty(property, defaultValue));
    }

    public Boolean getPropertyAsBoolean(int property) {
        return (Boolean) getProperty(property);
    }

    public UnitValue getPropertyAsUnitValue(int property) {
        return (UnitValue) getProperty(property);
    }

    public Integer getPropertyAsInteger(int property) {
        return NumberUtil.asInteger(getProperty(property));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (IRenderer renderer : this.childRenderers) {
            sb.append(renderer.toString());
        }
        return sb.toString();
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public LayoutArea getOccupiedArea() {
        return this.occupiedArea;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        applyDestinationsAndAnnotation(drawContext);
        boolean relativePosition = isRelativePosition();
        if (relativePosition) {
            applyRelativePositioningTranslation(false);
        }
        beginElementOpacityApplying(drawContext);
        drawBackground(drawContext);
        drawBorder(drawContext);
        drawChildren(drawContext);
        drawPositionedChildren(drawContext);
        endElementOpacityApplying(drawContext);
        if (relativePosition) {
            applyRelativePositioningTranslation(true);
        }
        this.flushed = true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void beginElementOpacityApplying(DrawContext drawContext) {
        Float opacity = getPropertyAsFloat(92);
        if (opacity != null && opacity.floatValue() < 1.0f) {
            PdfExtGState extGState = new PdfExtGState();
            extGState.setStrokeOpacity(opacity.floatValue()).setFillOpacity(opacity.floatValue());
            drawContext.getCanvas().saveState().setExtGState(extGState);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void endElementOpacityApplying(DrawContext drawContext) {
        Float opacity = getPropertyAsFloat(92);
        if (opacity != null && opacity.floatValue() < 1.0f) {
            drawContext.getCanvas().restoreState();
        }
    }

    public void drawBackground(DrawContext drawContext) {
        Background background = (Background) getProperty(6);
        List<BackgroundImage> backgroundImagesList = (List) getProperty(90);
        if (background != null || backgroundImagesList != null) {
            Rectangle bBox = getOccupiedAreaBBox();
            boolean isTagged = drawContext.isTaggingEnabled();
            if (isTagged) {
                drawContext.getCanvas().openTag(new CanvasArtifact());
            }
            Rectangle backgroundArea = getBackgroundArea(applyMargins(bBox, false));
            if (backgroundArea.getWidth() <= 0.0f || backgroundArea.getHeight() <= 0.0f) {
                Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
                logger.info(MessageFormatUtil.format(IoLogMessageConstant.RECTANGLE_HAS_NEGATIVE_OR_ZERO_SIZES, "background"));
            } else {
                boolean backgroundAreaIsClipped = false;
                if (background != null) {
                    Rectangle clippedBackgroundArea = applyBackgroundBoxProperty(backgroundArea.mo7327clone(), background.getBackgroundClip());
                    backgroundAreaIsClipped = clipBackgroundArea(drawContext, clippedBackgroundArea);
                    drawColorBackground(background, drawContext, clippedBackgroundArea);
                }
                if (backgroundImagesList != null) {
                    backgroundAreaIsClipped = drawBackgroundImagesList(backgroundImagesList, backgroundAreaIsClipped, drawContext, backgroundArea);
                }
                if (backgroundAreaIsClipped) {
                    drawContext.getCanvas().restoreState();
                }
            }
            if (isTagged) {
                drawContext.getCanvas().closeTag();
            }
        }
    }

    private void drawColorBackground(Background background, DrawContext drawContext, Rectangle colorBackgroundArea) {
        TransparentColor backgroundColor = new TransparentColor(background.getColor(), background.getOpacity());
        drawContext.getCanvas().saveState().setFillColor(backgroundColor.getColor());
        backgroundColor.applyFillTransparency(drawContext.getCanvas());
        drawContext.getCanvas().rectangle(colorBackgroundArea.getX() - background.getExtraLeft(), colorBackgroundArea.getY() - background.getExtraBottom(), colorBackgroundArea.getWidth() + background.getExtraLeft() + background.getExtraRight(), colorBackgroundArea.getHeight() + background.getExtraTop() + background.getExtraBottom()).fill().restoreState();
    }

    private Rectangle applyBackgroundBoxProperty(Rectangle rectangle, BackgroundBox clip) {
        if (BackgroundBox.PADDING_BOX == clip) {
            applyBorderBox(rectangle, false);
        } else if (BackgroundBox.CONTENT_BOX == clip) {
            applyBorderBox(rectangle, false);
            applyPaddings(rectangle, false);
        }
        return rectangle;
    }

    private boolean drawBackgroundImagesList(List<BackgroundImage> backgroundImagesList, boolean backgroundAreaIsClipped, DrawContext drawContext, Rectangle backgroundArea) {
        for (int i = backgroundImagesList.size() - 1; i >= 0; i--) {
            BackgroundImage backgroundImage = backgroundImagesList.get(i);
            if (backgroundImage != null && backgroundImage.isBackgroundSpecified()) {
                if (!backgroundAreaIsClipped) {
                    backgroundAreaIsClipped = clipBackgroundArea(drawContext, backgroundArea);
                }
                drawBackgroundImage(backgroundImage, drawContext, backgroundArea);
            }
        }
        return backgroundAreaIsClipped;
    }

    private void drawBackgroundImage(BackgroundImage backgroundImage, DrawContext drawContext, Rectangle backgroundArea) {
        Rectangle imageRectangle;
        PdfFormXObject backgroundXObject;
        Rectangle originBackgroundArea = applyBackgroundBoxProperty(backgroundArea.mo7327clone(), backgroundImage.getBackgroundOrigin());
        float[] imageWidthAndHeight = BackgroundSizeCalculationUtil.calculateBackgroundImageSize(backgroundImage, originBackgroundArea.getWidth(), originBackgroundArea.getHeight());
        PdfXObject backgroundXObject2 = backgroundImage.getImage();
        if (backgroundXObject2 == null) {
            backgroundXObject2 = backgroundImage.getForm();
        }
        UnitValue xPosition = UnitValue.createPointValue(0.0f);
        UnitValue yPosition = UnitValue.createPointValue(0.0f);
        if (backgroundXObject2 == null) {
            AbstractLinearGradientBuilder gradientBuilder = backgroundImage.getLinearGradientBuilder();
            if (gradientBuilder != null) {
                backgroundImage.getBackgroundPosition().calculatePositionValues(0.0f, 0.0f, xPosition, yPosition);
                PdfFormXObject createXObject = createXObject(gradientBuilder, originBackgroundArea, drawContext.getDocument());
                imageRectangle = new Rectangle(originBackgroundArea.getLeft() + xPosition.getValue(), (originBackgroundArea.getTop() - imageWidthAndHeight[1]) - yPosition.getValue(), imageWidthAndHeight[0], imageWidthAndHeight[1]);
                backgroundXObject = createXObject;
            } else {
                return;
            }
        } else {
            backgroundImage.getBackgroundPosition().calculatePositionValues(originBackgroundArea.getWidth() - imageWidthAndHeight[0], originBackgroundArea.getHeight() - imageWidthAndHeight[1], xPosition, yPosition);
            imageRectangle = new Rectangle(originBackgroundArea.getLeft() + xPosition.getValue(), (originBackgroundArea.getTop() - imageWidthAndHeight[1]) - yPosition.getValue(), imageWidthAndHeight[0], imageWidthAndHeight[1]);
            backgroundXObject = backgroundXObject2;
        }
        if (imageRectangle.getWidth() > 0.0f && imageRectangle.getHeight() > 0.0f) {
            Rectangle clippedBackgroundArea = applyBackgroundBoxProperty(backgroundArea.mo7327clone(), backgroundImage.getBackgroundClip());
            drawContext.getCanvas().saveState().rectangle(clippedBackgroundArea).clip().endPath();
            drawPdfXObject(imageRectangle, backgroundImage, drawContext, backgroundXObject, backgroundArea, originBackgroundArea);
            drawContext.getCanvas().restoreState();
            return;
        }
        Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
        logger.info(MessageFormatUtil.format(IoLogMessageConstant.RECTANGLE_HAS_NEGATIVE_OR_ZERO_SIZES, "background-image"));
    }

    private static void drawPdfXObject(Rectangle imageRectangle, BackgroundImage backgroundImage, DrawContext drawContext, PdfXObject backgroundXObject, Rectangle backgroundArea, Rectangle originBackgroundArea) {
        boolean isNextOverlaps;
        BlendMode blendMode = backgroundImage.getBlendMode();
        if (blendMode != BlendMode.NORMAL) {
            drawContext.getCanvas().setExtGState(new PdfExtGState().setBlendMode(blendMode.getPdfRepresentation()));
        }
        Point whitespace = backgroundImage.getRepeat().prepareRectangleToDrawingAndGetWhitespace(imageRectangle, originBackgroundArea, backgroundImage.getBackgroundSize());
        float initialX = imageRectangle.getX();
        int counterY = 1;
        boolean firstDraw = true;
        while (true) {
            drawPdfXObjectHorizontally(imageRectangle, backgroundImage, drawContext, backgroundXObject, backgroundArea, firstDraw, (float) whitespace.getX());
            firstDraw = false;
            imageRectangle.setX(initialX);
            boolean isCurrentOverlaps = imageRectangle.overlaps(backgroundArea, 1.0E-4f);
            if (counterY % 2 == 1) {
                isNextOverlaps = imageRectangle.moveDown((imageRectangle.getHeight() + ((float) whitespace.getY())) * counterY).overlaps(backgroundArea, 1.0E-4f);
            } else {
                isNextOverlaps = imageRectangle.moveUp((imageRectangle.getHeight() + ((float) whitespace.getY())) * counterY).overlaps(backgroundArea, 1.0E-4f);
            }
            counterY++;
            if (backgroundImage.getRepeat().isNoRepeatOnYAxis()) {
                return;
            }
            if (!isCurrentOverlaps && !isNextOverlaps) {
                return;
            }
        }
    }

    private static void drawPdfXObjectHorizontally(Rectangle imageRectangle, BackgroundImage backgroundImage, DrawContext drawContext, PdfXObject backgroundXObject, Rectangle backgroundArea, boolean firstDraw, float xWhitespace) {
        boolean isNextOverlaps;
        boolean isItFirstDraw = firstDraw;
        int counterX = 1;
        while (true) {
            if (imageRectangle.overlaps(backgroundArea, 1.0E-4f) || isItFirstDraw) {
                drawContext.getCanvas().addXObjectFittedIntoRectangle(backgroundXObject, imageRectangle);
                isItFirstDraw = false;
            }
            boolean isCurrentOverlaps = imageRectangle.overlaps(backgroundArea, 1.0E-4f);
            if (counterX % 2 == 1) {
                isNextOverlaps = imageRectangle.moveRight((imageRectangle.getWidth() + xWhitespace) * counterX).overlaps(backgroundArea, 1.0E-4f);
            } else {
                isNextOverlaps = imageRectangle.moveLeft((imageRectangle.getWidth() + xWhitespace) * counterX).overlaps(backgroundArea, 1.0E-4f);
            }
            counterX++;
            if (backgroundImage.getRepeat().isNoRepeatOnXAxis()) {
                return;
            }
            if (!isCurrentOverlaps && !isNextOverlaps) {
                return;
            }
        }
    }

    public static PdfFormXObject createXObject(AbstractLinearGradientBuilder linearGradientBuilder, Rectangle xObjectArea, PdfDocument document) {
        Color gradientColor;
        Rectangle formBBox = new Rectangle(0.0f, 0.0f, xObjectArea.getWidth(), xObjectArea.getHeight());
        PdfFormXObject xObject = new PdfFormXObject(formBBox);
        if (linearGradientBuilder != null && (gradientColor = linearGradientBuilder.buildColor(formBBox, null, document)) != null) {
            new PdfCanvas(xObject, document).setColor(gradientColor, true).rectangle(formBBox).fill();
        }
        return xObject;
    }

    protected Rectangle getBackgroundArea(Rectangle occupiedAreaWithMargins) {
        return occupiedAreaWithMargins;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean clipBorderArea(DrawContext drawContext, Rectangle outerBorderBox) {
        return clipArea(drawContext, outerBorderBox, true, true, false, true);
    }

    protected boolean clipBackgroundArea(DrawContext drawContext, Rectangle outerBorderBox) {
        return clipArea(drawContext, outerBorderBox, true, false, false, false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean clipBackgroundArea(DrawContext drawContext, Rectangle outerBorderBox, boolean considerBordersBeforeClipping) {
        return clipArea(drawContext, outerBorderBox, true, false, considerBordersBeforeClipping, false);
    }

    private boolean clipArea(DrawContext drawContext, Rectangle outerBorderBox, boolean clipOuter, boolean clipInner, boolean considerBordersBeforeOuterClipping, boolean considerBordersBeforeInnerClipping) {
        float[] cornersX;
        float[] outerBox;
        float[] verticalRadii;
        float[] cornersX2;
        float[] cornersY;
        float[] borderWidths;
        PdfCanvas canvas;
        if (considerBordersBeforeOuterClipping && considerBordersBeforeInnerClipping) {
            throw new AssertionError();
        }
        float[] borderWidths2 = {0.0f, 0.0f, 0.0f, 0.0f};
        float[] outerBox2 = {outerBorderBox.getTop(), outerBorderBox.getRight(), outerBorderBox.getBottom(), outerBorderBox.getLeft()};
        BorderRadius[] borderRadii = getBorderRadii();
        float[] verticalRadii2 = calculateRadii(borderRadii, outerBorderBox, false);
        float[] horizontalRadii = calculateRadii(borderRadii, outerBorderBox, true);
        boolean hasNotNullRadius = false;
        for (int i = 0; i < 4; i++) {
            verticalRadii2[i] = Math.min(verticalRadii2[i], outerBorderBox.getHeight() / 2.0f);
            horizontalRadii[i] = Math.min(horizontalRadii[i], outerBorderBox.getWidth() / 2.0f);
            if (!hasNotNullRadius && (0.0f != verticalRadii2[i] || 0.0f != horizontalRadii[i])) {
                hasNotNullRadius = true;
            }
        }
        if (hasNotNullRadius) {
            float[] cornersX3 = {outerBox2[3] + horizontalRadii[0], outerBox2[1] - horizontalRadii[1], outerBox2[1] - horizontalRadii[2], outerBox2[3] + horizontalRadii[3]};
            float[] cornersY2 = {outerBox2[0] - verticalRadii2[0], outerBox2[0] - verticalRadii2[1], outerBox2[2] + verticalRadii2[2], outerBox2[2] + verticalRadii2[3]};
            PdfCanvas canvas2 = drawContext.getCanvas();
            canvas2.saveState();
            if (!considerBordersBeforeOuterClipping) {
                cornersX = cornersX3;
                outerBox = outerBox2;
                verticalRadii = verticalRadii2;
                cornersX2 = cornersY2;
                cornersY = horizontalRadii;
                borderWidths = borderWidths2;
            } else {
                cornersX = cornersX3;
                outerBox = outerBox2;
                verticalRadii = verticalRadii2;
                cornersX2 = cornersY2;
                cornersY = horizontalRadii;
                float[] borderWidths3 = decreaseBorderRadiiWithBorders(cornersY, verticalRadii, outerBox, cornersX, cornersX2);
                borderWidths = borderWidths3;
            }
            if (!clipOuter) {
                canvas = canvas2;
            } else {
                float[] cornersY3 = cornersX2;
                float[] cornersY4 = cornersX;
                float[] cornersX4 = outerBox;
                float[] outerBox3 = verticalRadii;
                float[] verticalRadii3 = cornersY;
                clipOuterArea(canvas2, verticalRadii3, outerBox3, cornersX4, cornersY4, cornersY3);
                canvas = canvas2;
                cornersY = verticalRadii3;
                verticalRadii = outerBox3;
                outerBox = cornersX4;
                cornersX = cornersY4;
                cornersX2 = cornersY3;
            }
            if (considerBordersBeforeInnerClipping) {
                borderWidths = decreaseBorderRadiiWithBorders(cornersY, verticalRadii, outerBox, cornersX, cornersX2);
            }
            if (clipInner) {
                float[] verticalRadii4 = verticalRadii;
                clipInnerArea(canvas, cornersY, verticalRadii4, outerBox, cornersX, cornersX2, borderWidths);
            }
        }
        return hasNotNullRadius;
    }

    private void clipOuterArea(PdfCanvas canvas, float[] horizontalRadii, float[] verticalRadii, float[] outerBox, float[] cornersX, float[] cornersY) {
        char c;
        double left;
        double right;
        double bottom;
        double right2;
        double right3;
        double left2;
        double bottom2;
        double top = outerBox[0];
        double right4 = outerBox[1];
        double bottom3 = outerBox[2];
        double left3 = outerBox[3];
        if (0.0f == horizontalRadii[0] && 0.0f == verticalRadii[0]) {
            c = 1;
            right = right4;
            bottom = bottom3;
            left = left3;
        } else {
            double arcBottom = cornersY[0] - verticalRadii[0];
            c = 1;
            double arcRight = cornersX[0] + horizontalRadii[0];
            left = left3;
            right = right4;
            bottom = bottom3;
            canvas.moveTo(left3, bottom3).arcContinuous(left, arcBottom, arcRight, top, 180.0d, -90.0d).lineTo(right, top).lineTo(right, bottom).lineTo(left, bottom);
            canvas.clip().endPath();
        }
        if (0.0f == horizontalRadii[c] && 0.0f == verticalRadii[c]) {
            right3 = right;
            right2 = bottom;
            left2 = left;
        } else {
            double arcLeft = cornersX[c] - horizontalRadii[c];
            double arcBottom2 = cornersY[c] - verticalRadii[c];
            double arcBottom3 = right;
            right2 = bottom;
            PdfCanvas arcContinuous = canvas.moveTo(left, top).arcContinuous(arcLeft, top, arcBottom3, arcBottom2, 90.0d, -90.0d);
            right3 = arcBottom3;
            top = top;
            left2 = left;
            arcContinuous.lineTo(right3, right2).lineTo(left2, right2).lineTo(left2, top);
            canvas.clip().endPath();
        }
        if (0.0f == horizontalRadii[2] && 0.0f == verticalRadii[2]) {
            bottom2 = right2;
        } else {
            double arcTop = cornersY[2] + verticalRadii[2];
            double bottom4 = right2;
            double arcLeft2 = cornersX[2] - horizontalRadii[2];
            bottom2 = bottom4;
            canvas.moveTo(right3, top).arcContinuous(right3, arcTop, arcLeft2, bottom4, AudioStats.AUDIO_AMPLITUDE_NONE, -90.0d).lineTo(left2, bottom2).lineTo(left2, top).lineTo(right3, top);
            canvas.clip().endPath();
        }
        if (0.0f != horizontalRadii[3] || 0.0f != verticalRadii[3]) {
            double arcRight2 = cornersX[3] + horizontalRadii[3];
            double arcTop2 = cornersY[3] + verticalRadii[3];
            double left4 = left2;
            canvas.moveTo(right3, bottom2).arcContinuous(arcRight2, bottom2, left4, arcTop2, 270.0d, -90.0d).lineTo(left4, top).lineTo(right3, top).lineTo(right3, bottom2);
            canvas.clip().endPath();
        }
    }

    private void clipInnerArea(PdfCanvas canvas, float[] horizontalRadii, float[] verticalRadii, float[] outerBox, float[] cornersX, float[] cornersY, float[] borderWidths) {
        double leftBorderWidth;
        double bottom;
        double x1;
        double y3;
        double right;
        double y1;
        double leftBorderWidth2;
        double x12;
        double y2;
        double y32;
        double x3;
        double left;
        double y4;
        double y33;
        double y12;
        double y42;
        double y43;
        double left2;
        double left3;
        double x4;
        double x42;
        double y22;
        double top = outerBox[0];
        double right2 = outerBox[1];
        double bottom2 = outerBox[2];
        double left4 = outerBox[3];
        double x13 = cornersX[0];
        double y13 = cornersY[0];
        double x2 = cornersX[1];
        double y23 = cornersY[1];
        double x32 = cornersX[2];
        double x33 = cornersY[2];
        double y34 = cornersX[3];
        double x43 = cornersY[3];
        double y44 = x43;
        double y45 = borderWidths[0];
        double topBorderWidth = borderWidths[1];
        double rightBorderWidth = borderWidths[2];
        double bottomBorderWidth = borderWidths[3];
        if (0.0f == horizontalRadii[0] && 0.0f == verticalRadii[0]) {
            right = right2;
            bottom = bottom2;
            leftBorderWidth = bottomBorderWidth;
            leftBorderWidth2 = y13;
            x1 = x13;
            y1 = y34;
            x12 = left4;
            y3 = x33;
        } else {
            leftBorderWidth = bottomBorderWidth;
            bottom = bottom2;
            x1 = x13;
            y3 = x33;
            right = right2;
            PdfCanvas lineTo = canvas.arc(left4, y13 - verticalRadii[0], x13 + horizontalRadii[0], top, 180.0d, -90.0d).lineTo(x2, top).lineTo(right2, y23).lineTo(right2, y3).lineTo(x32, bottom);
            x32 = x32;
            y1 = y34;
            PdfCanvas lineTo2 = lineTo.lineTo(y1, bottom).lineTo(left4, y44);
            y44 = y44;
            leftBorderWidth2 = y13;
            x12 = left4;
            y23 = y23;
            lineTo2.lineTo(left4, leftBorderWidth2).lineTo(x12 - leftBorderWidth, leftBorderWidth2).lineTo(x12 - leftBorderWidth, bottom - rightBorderWidth).lineTo(right + topBorderWidth, bottom - rightBorderWidth).lineTo(right + topBorderWidth, top + y45).lineTo(x12 - leftBorderWidth, top + y45).lineTo(x12 - leftBorderWidth, leftBorderWidth2);
            canvas.clip().endPath();
        }
        if (0.0f == horizontalRadii[1] && 0.0f == verticalRadii[1]) {
            y33 = y3;
            y12 = leftBorderWidth2;
            y32 = y1;
            left = x12;
            y2 = y23;
            x3 = x32;
            y4 = y44;
        } else {
            double y14 = leftBorderWidth2;
            double x44 = y1;
            double x22 = y3;
            y2 = y23;
            double x34 = x32;
            double y35 = right;
            PdfCanvas arc = canvas.arc(x2 - horizontalRadii[1], top, y35, y23 - verticalRadii[1], 90.0d, -90.0d);
            top = top;
            PdfCanvas lineTo3 = arc.lineTo(y35, x22);
            double bottom3 = bottom;
            y32 = x44;
            PdfCanvas lineTo4 = lineTo3.lineTo(x34, bottom3).lineTo(y32, bottom3);
            x3 = x34;
            left = x12;
            y4 = y44;
            y33 = x22;
            PdfCanvas lineTo5 = lineTo4.lineTo(left, y4).lineTo(left, y14);
            y12 = y14;
            x2 = x2;
            right = y35;
            lineTo5.lineTo(x1, top).lineTo(x2, top).lineTo(x2, top + y45).lineTo(left - leftBorderWidth, top + y45).lineTo(left - leftBorderWidth, bottom - rightBorderWidth).lineTo(right + topBorderWidth, bottom - rightBorderWidth).lineTo(right + topBorderWidth, top + y45).lineTo(x2, top + y45);
            canvas.clip().endPath();
        }
        if (0.0f == horizontalRadii[2] && 0.0f == verticalRadii[2]) {
            left2 = left;
            y42 = y4;
            x4 = y32;
            y43 = y12;
            left3 = x1;
            x42 = y33;
            y22 = y2;
        } else {
            double right3 = right;
            double bottom4 = bottom;
            PdfCanvas lineTo6 = canvas.arc(right3, y33 + verticalRadii[2], x3 - horizontalRadii[2], bottom4, AudioStats.AUDIO_AMPLITUDE_NONE, -90.0d).lineTo(y32, bottom4).lineTo(left, y4);
            y42 = y4;
            y43 = y12;
            PdfCanvas lineTo7 = lineTo6.lineTo(left, y43);
            left2 = left;
            left3 = x1;
            bottom = bottom4;
            double bottom5 = y2;
            x4 = y32;
            x42 = y33;
            y22 = bottom5;
            lineTo7.lineTo(left3, top).lineTo(x2, top).lineTo(right3, bottom5).lineTo(right3, x42).lineTo(right + topBorderWidth, x42).lineTo(right + topBorderWidth, top + y45).lineTo(left2 - leftBorderWidth, top + y45).lineTo(left2 - leftBorderWidth, bottom - rightBorderWidth).lineTo(right + topBorderWidth, bottom - rightBorderWidth).lineTo(right + topBorderWidth, x42);
            canvas.clip().endPath();
        }
        if (0.0f != horizontalRadii[3] || 0.0f != verticalRadii[3]) {
            double left5 = left2;
            double bottom6 = bottom;
            PdfCanvas lineTo8 = canvas.arc(x4 + horizontalRadii[3], bottom6, left5, y42 + verticalRadii[3], 270.0d, -90.0d).lineTo(left5, y43).lineTo(left3, top).lineTo(x2, top);
            double x23 = right;
            PdfCanvas lineTo9 = lineTo8.lineTo(x23, y22).lineTo(x23, x42).lineTo(x3, bottom6);
            double x35 = x4;
            lineTo9.lineTo(x35, bottom6).lineTo(x35, bottom6 - rightBorderWidth).lineTo(right + topBorderWidth, bottom6 - rightBorderWidth).lineTo(right + topBorderWidth, top + y45).lineTo(left5 - leftBorderWidth, top + y45).lineTo(left5 - leftBorderWidth, bottom6 - rightBorderWidth).lineTo(x35, bottom6 - rightBorderWidth);
            canvas.clip().endPath();
        }
    }

    private float[] decreaseBorderRadiiWithBorders(float[] horizontalRadii, float[] verticalRadii, float[] outerBox, float[] cornersX, float[] cornersY) {
        Border[] borders = getBorders();
        float[] borderWidths = {0.0f, 0.0f, 0.0f, 0.0f};
        if (borders[0] != null) {
            borderWidths[0] = borders[0].getWidth();
            outerBox[0] = outerBox[0] - borders[0].getWidth();
            if (cornersY[1] > outerBox[0]) {
                cornersY[1] = outerBox[0];
            }
            if (cornersY[0] > outerBox[0]) {
                cornersY[0] = outerBox[0];
            }
            verticalRadii[0] = Math.max(0.0f, verticalRadii[0] - borders[0].getWidth());
            verticalRadii[1] = Math.max(0.0f, verticalRadii[1] - borders[0].getWidth());
        }
        if (borders[1] != null) {
            borderWidths[1] = borders[1].getWidth();
            outerBox[1] = outerBox[1] - borders[1].getWidth();
            if (cornersX[1] > outerBox[1]) {
                cornersX[1] = outerBox[1];
            }
            if (cornersX[2] > outerBox[1]) {
                cornersX[2] = outerBox[1];
            }
            horizontalRadii[1] = Math.max(0.0f, horizontalRadii[1] - borders[1].getWidth());
            horizontalRadii[2] = Math.max(0.0f, horizontalRadii[2] - borders[1].getWidth());
        }
        if (borders[2] != null) {
            borderWidths[2] = borders[2].getWidth();
            outerBox[2] = outerBox[2] + borders[2].getWidth();
            if (cornersY[2] < outerBox[2]) {
                cornersY[2] = outerBox[2];
            }
            if (cornersY[3] < outerBox[2]) {
                cornersY[3] = outerBox[2];
            }
            verticalRadii[2] = Math.max(0.0f, verticalRadii[2] - borders[2].getWidth());
            verticalRadii[3] = Math.max(0.0f, verticalRadii[3] - borders[2].getWidth());
        }
        if (borders[3] != null) {
            borderWidths[3] = borders[3].getWidth();
            outerBox[3] = outerBox[3] + borders[3].getWidth();
            if (cornersX[3] < outerBox[3]) {
                cornersX[3] = outerBox[3];
            }
            if (cornersX[0] < outerBox[3]) {
                cornersX[0] = outerBox[3];
            }
            horizontalRadii[3] = Math.max(0.0f, horizontalRadii[3] - borders[3].getWidth());
            horizontalRadii[0] = Math.max(0.0f, horizontalRadii[0] - borders[3].getWidth());
        }
        return borderWidths;
    }

    public void drawChildren(DrawContext drawContext) {
        List<IRenderer> waitingRenderers = new ArrayList<>();
        for (IRenderer child : this.childRenderers) {
            Transform transformProp = (Transform) child.getProperty(53);
            RootRenderer rootRenderer = getRootRenderer();
            List<IRenderer> waiting = (rootRenderer == null || rootRenderer.waitingDrawingElements.contains(child)) ? waitingRenderers : rootRenderer.waitingDrawingElements;
            processWaitingDrawing(child, transformProp, waiting);
            if (!FloatingHelper.isRendererFloating(child) && transformProp == null) {
                child.draw(drawContext);
            }
        }
        for (IRenderer waitingRenderer : waitingRenderers) {
            waitingRenderer.draw(drawContext);
        }
    }

    public void drawBorder(DrawContext drawContext) {
        PdfCanvas canvas;
        float x1;
        float y2;
        float y1;
        float bottomWidth;
        float x2;
        float bottomWidth2;
        float x12;
        float y22;
        float bottomWidth3;
        Border[] borders = getBorders();
        boolean gotBorders = false;
        int length = borders.length;
        int i = 0;
        while (true) {
            boolean z = true;
            if (i >= length) {
                break;
            }
            Border border = borders[i];
            if (!gotBorders && border == null) {
                z = false;
            }
            gotBorders = z;
            i++;
        }
        if (gotBorders) {
            float topWidth = borders[0] != null ? borders[0].getWidth() : 0.0f;
            float leftWidth = borders[1] != null ? borders[1].getWidth() : 0.0f;
            char c = 2;
            float bottomWidth4 = borders[2] != null ? borders[2].getWidth() : 0.0f;
            float leftWidth2 = borders[3] != null ? borders[3].getWidth() : 0.0f;
            Rectangle bBox = getBorderAreaBBox();
            if (bBox.getWidth() >= 0.0f && bBox.getHeight() >= 0.0f) {
                float x13 = bBox.getX();
                float y12 = bBox.getY();
                float bottomWidth5 = bBox.getX() + bBox.getWidth();
                float y23 = bBox.getY() + bBox.getHeight();
                boolean isTagged = drawContext.isTaggingEnabled();
                PdfCanvas canvas2 = drawContext.getCanvas();
                if (isTagged) {
                    canvas2.openTag(new CanvasArtifact());
                }
                Rectangle borderRect = applyMargins(this.occupiedArea.getBBox().mo7327clone(), getMargins(), false);
                boolean isAreaClipped = clipBorderArea(drawContext, borderRect);
                BorderRadius[] borderRadii = getBorderRadii();
                float[] verticalRadii = calculateRadii(borderRadii, borderRect, false);
                float[] horizontalRadii = calculateRadii(borderRadii, borderRect, true);
                int i2 = 0;
                while (i2 < 4) {
                    verticalRadii[i2] = Math.min(verticalRadii[i2], borderRect.getHeight() / 2.0f);
                    horizontalRadii[i2] = Math.min(horizontalRadii[i2], borderRect.getWidth() / 2.0f);
                    i2++;
                    c = c;
                }
                char c2 = c;
                if (borders[0] == null) {
                    canvas = canvas2;
                    x1 = x13;
                } else {
                    if (0.0f != horizontalRadii[0] || 0.0f != verticalRadii[0] || 0.0f != horizontalRadii[1]) {
                        canvas = canvas2;
                    } else if (0.0f != verticalRadii[1]) {
                        canvas = canvas2;
                    } else {
                        float leftWidth3 = leftWidth2;
                        canvas = canvas2;
                        borders[0].draw(canvas, x13, y23, bottomWidth5, y23, Border.Side.TOP, leftWidth3, leftWidth);
                        leftWidth2 = leftWidth3;
                        leftWidth = leftWidth;
                        x1 = x13;
                    }
                    Border border2 = borders[0];
                    float f = horizontalRadii[0];
                    float rightWidth = verticalRadii[0];
                    float leftWidth4 = leftWidth2;
                    border2.draw(canvas, x13, y23, bottomWidth5, y23, f, rightWidth, horizontalRadii[1], verticalRadii[1], Border.Side.TOP, leftWidth4, leftWidth);
                    x1 = x13;
                    leftWidth2 = leftWidth4;
                    leftWidth = leftWidth;
                }
                if (borders[1] == null) {
                    y2 = y12;
                    y1 = y23;
                    bottomWidth = bottomWidth4;
                } else {
                    if (0.0f != horizontalRadii[1] || 0.0f != verticalRadii[1] || 0.0f != horizontalRadii[c2]) {
                        y22 = y12;
                        y1 = y23;
                        bottomWidth3 = bottomWidth4;
                    } else if (0.0f != verticalRadii[c2]) {
                        y22 = y12;
                        y1 = y23;
                        bottomWidth3 = bottomWidth4;
                    } else {
                        y1 = y23;
                        borders[1].draw(canvas, bottomWidth5, y1, bottomWidth5, y12, Border.Side.RIGHT, topWidth, bottomWidth4);
                        y2 = y12;
                        bottomWidth = bottomWidth4;
                    }
                    float x22 = bottomWidth3;
                    PdfCanvas canvas3 = canvas;
                    float y13 = y22;
                    borders[1].draw(canvas3, bottomWidth5, y1, bottomWidth5, y13, horizontalRadii[1], verticalRadii[1], horizontalRadii[c2], verticalRadii[c2], Border.Side.RIGHT, topWidth, x22);
                    canvas = canvas3;
                    topWidth = topWidth;
                    bottomWidth = x22;
                    bottomWidth5 = bottomWidth5;
                    y2 = y13;
                }
                if (borders[c2] == null) {
                    x2 = x1;
                } else {
                    if (0.0f == horizontalRadii[c2] && 0.0f == verticalRadii[c2] && 0.0f == horizontalRadii[3]) {
                        if (0.0f != verticalRadii[3]) {
                            x12 = x1;
                        } else {
                            float x23 = bottomWidth5;
                            float x24 = x1;
                            borders[c2].draw(canvas, x23, y2, x24, y2, Border.Side.BOTTOM, leftWidth, leftWidth2);
                            x2 = x24;
                        }
                    } else {
                        x12 = x1;
                    }
                    Border border3 = borders[c2];
                    float f2 = horizontalRadii[c2];
                    float rightWidth2 = verticalRadii[c2];
                    float x25 = bottomWidth5;
                    float x26 = x12;
                    float rightWidth3 = leftWidth;
                    border3.draw(canvas, x25, y2, x26, y2, f2, rightWidth2, horizontalRadii[3], verticalRadii[3], Border.Side.BOTTOM, rightWidth3, leftWidth2);
                    x2 = x26;
                }
                if (borders[3] != null) {
                    if (0.0f != horizontalRadii[3] || 0.0f != verticalRadii[3] || 0.0f != horizontalRadii[0]) {
                        bottomWidth2 = bottomWidth;
                    } else if (0.0f != verticalRadii[0]) {
                        bottomWidth2 = bottomWidth;
                    } else {
                        borders[3].draw(canvas, x2, y2, x2, y1, Border.Side.LEFT, bottomWidth, topWidth);
                    }
                    float x14 = x2;
                    PdfCanvas canvas4 = canvas;
                    borders[3].draw(canvas4, x14, y2, x14, y1, horizontalRadii[3], verticalRadii[3], horizontalRadii[0], verticalRadii[0], Border.Side.LEFT, bottomWidth2, topWidth);
                    canvas = canvas4;
                }
                if (isAreaClipped) {
                    drawContext.getCanvas().restoreState();
                }
                if (isTagged) {
                    canvas.closeTag();
                    return;
                }
                return;
            }
            Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.RECTANGLE_HAS_NEGATIVE_SIZE, "border"));
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public boolean isFlushed() {
        return this.flushed;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer setParent(IRenderer parent) {
        this.parent = parent;
        return this;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getParent() {
        return this.parent;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public void move(float dxRight, float dyUp) {
        Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
        if (this.occupiedArea == null) {
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Moving won't be performed."));
            return;
        }
        this.occupiedArea.getBBox().moveRight(dxRight);
        this.occupiedArea.getBBox().moveUp(dyUp);
        for (IRenderer childRenderer : this.childRenderers) {
            childRenderer.move(dxRight, dyUp);
        }
        for (IRenderer childRenderer2 : this.positionedRenderers) {
            childRenderer2.move(dxRight, dyUp);
        }
    }

    public List<Rectangle> initElementAreas(LayoutArea area) {
        return Collections.singletonList(area.getBBox());
    }

    public Rectangle getOccupiedAreaBBox() {
        return this.occupiedArea.getBBox().mo7327clone();
    }

    public Rectangle getBorderAreaBBox() {
        Rectangle rect = getOccupiedAreaBBox();
        applyMargins(rect, false);
        applyBorderBox(rect, false);
        return rect;
    }

    public Rectangle getInnerAreaBBox() {
        Rectangle rect = getOccupiedAreaBBox();
        applyMargins(rect, false);
        applyBorderBox(rect, false);
        applyPaddings(rect, false);
        return rect;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Rectangle applyMarginsBordersPaddings(Rectangle rect, boolean reverse) {
        applyMargins(rect, reverse);
        applyBorderBox(rect, reverse);
        applyPaddings(rect, reverse);
        return rect;
    }

    public Rectangle applyMargins(Rectangle rect, boolean reverse) {
        return applyMargins(rect, getMargins(), reverse);
    }

    public Rectangle applyBorderBox(Rectangle rect, boolean reverse) {
        Border[] borders = getBorders();
        return applyBorderBox(rect, borders, reverse);
    }

    public Rectangle applyPaddings(Rectangle rect, boolean reverse) {
        return applyPaddings(rect, getPaddings(), reverse);
    }

    public boolean isFirstOnRootArea() {
        return isFirstOnRootArea(false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void applyDestinationsAndAnnotation(DrawContext drawContext) {
        applyDestination(drawContext.getDocument());
        applyAction(drawContext.getDocument());
        applyLinkAnnotation(drawContext.getDocument());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean isBorderBoxSizing(IRenderer renderer) {
        BoxSizingPropertyValue boxSizing = (BoxSizingPropertyValue) renderer.getProperty(105);
        return boxSizing != null && boxSizing.equals(BoxSizingPropertyValue.BORDER_BOX);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isOverflowProperty(OverflowPropertyValue equalsTo, int overflowProperty) {
        return isOverflowProperty(equalsTo, (OverflowPropertyValue) getProperty(overflowProperty));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean isOverflowProperty(OverflowPropertyValue equalsTo, IRenderer renderer, int overflowProperty) {
        return isOverflowProperty(equalsTo, (OverflowPropertyValue) renderer.getProperty(overflowProperty));
    }

    protected static boolean isOverflowProperty(OverflowPropertyValue equalsTo, OverflowPropertyValue rendererOverflowProperty) {
        return equalsTo.equals(rendererOverflowProperty) || (equalsTo.equals(OverflowPropertyValue.FIT) && rendererOverflowProperty == null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean isOverflowFit(OverflowPropertyValue rendererOverflowProperty) {
        return rendererOverflowProperty == null || OverflowPropertyValue.FIT.equals(rendererOverflowProperty);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T> T replaceOwnProperty(int property, T replacementValue) {
        T ownProperty = (T) getOwnProperty(property);
        setProperty(property, replacementValue);
        return ownProperty;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T> void returnBackOwnProperty(int property, T prevValue) {
        if (prevValue == null) {
            deleteOwnProperty(property);
        } else {
            setProperty(property, prevValue);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean hasAspectRatio() {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Float getAspectRatio() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void processWaitingDrawing(IRenderer child, Transform transformProp, List<IRenderer> waitingDrawing) {
        if (FloatingHelper.isRendererFloating(child) || transformProp != null) {
            waitingDrawing.add(child);
        }
        Border outlineProp = (Border) child.getProperty(Property.OUTLINE);
        if (outlineProp != null && (child instanceof AbstractRenderer)) {
            AbstractRenderer abstractChild = (AbstractRenderer) child;
            if (abstractChild.isRelativePosition()) {
                abstractChild.applyRelativePositioningTranslation(false);
            }
            Div outlines = new Div().setNeutralRole();
            if (transformProp != null) {
                outlines.setProperty(53, transformProp);
            }
            outlines.setProperty(9, outlineProp);
            float offset = ((Border) outlines.getProperty(9)).getWidth();
            if (abstractChild.getPropertyAsFloat(107) != null) {
                offset += abstractChild.getPropertyAsFloat(107).floatValue();
            }
            DivRenderer div = new DivRenderer(outlines);
            div.setParent(abstractChild.getParent());
            Rectangle divOccupiedArea = abstractChild.applyMargins(abstractChild.occupiedArea.mo7332clone().getBBox(), false).moveLeft(offset).moveDown(offset);
            divOccupiedArea.setWidth(divOccupiedArea.getWidth() + (offset * 2.0f)).setHeight(divOccupiedArea.getHeight() + (offset * 2.0f));
            div.occupiedArea = new LayoutArea(abstractChild.getOccupiedArea().getPageNumber(), divOccupiedArea);
            float outlineWidth = ((Border) div.getProperty(9)).getWidth();
            if (divOccupiedArea.getWidth() >= outlineWidth * 2.0f && divOccupiedArea.getHeight() >= 2.0f * outlineWidth) {
                waitingDrawing.add(div);
            }
            if (abstractChild.isRelativePosition()) {
                abstractChild.applyRelativePositioningTranslation(true);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveWidth(float parentBoxWidth) {
        Float minWidth = retrieveUnitValue(parentBoxWidth, 80);
        Float maxWidth = retrieveUnitValue(parentBoxWidth, 79);
        if (maxWidth != null && minWidth != null && minWidth.floatValue() > maxWidth.floatValue()) {
            maxWidth = minWidth;
        }
        Float width = retrieveUnitValue(parentBoxWidth, 77);
        if (width != null) {
            if (maxWidth != null) {
                width = width.floatValue() > maxWidth.floatValue() ? maxWidth : width;
            }
            if (minWidth != null) {
                width = width.floatValue() < minWidth.floatValue() ? minWidth : width;
            }
        } else if (maxWidth != null) {
            width = maxWidth.floatValue() < parentBoxWidth ? maxWidth : null;
        }
        if (width != null && isBorderBoxSizing(this)) {
            width = Float.valueOf(width.floatValue() - calculatePaddingBorderWidth(this));
        }
        if (width != null) {
            return Float.valueOf(Math.max(0.0f, width.floatValue()));
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveMaxWidth(float parentBoxWidth) {
        Float maxWidth = retrieveUnitValue(parentBoxWidth, 79);
        if (maxWidth != null) {
            Float minWidth = retrieveUnitValue(parentBoxWidth, 80);
            if (minWidth != null && minWidth.floatValue() > maxWidth.floatValue()) {
                maxWidth = minWidth;
            }
            if (isBorderBoxSizing(this)) {
                maxWidth = Float.valueOf(maxWidth.floatValue() - calculatePaddingBorderWidth(this));
            }
            return Float.valueOf(maxWidth.floatValue() > 0.0f ? maxWidth.floatValue() : 0.0f);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveMinWidth(float parentBoxWidth) {
        Float minWidth = retrieveUnitValue(parentBoxWidth, 80);
        if (minWidth != null) {
            if (isBorderBoxSizing(this)) {
                minWidth = Float.valueOf(minWidth.floatValue() - calculatePaddingBorderWidth(this));
            }
            return Float.valueOf(minWidth.floatValue() > 0.0f ? minWidth.floatValue() : 0.0f);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateWidth(UnitValue updatedWidthValue) {
        if (updatedWidthValue.isPointValue() && isBorderBoxSizing(this)) {
            updatedWidthValue.setValue(updatedWidthValue.getValue() + calculatePaddingBorderWidth(this));
        }
        setProperty(77, updatedWidthValue);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveHeight() {
        Float height = null;
        UnitValue heightUV = getPropertyAsUnitValue(27);
        Float parentResolvedHeight = retrieveResolvedParentDeclaredHeight();
        Float minHeight = null;
        Float maxHeight = null;
        if (heightUV != null) {
            if (parentResolvedHeight == null) {
                if (heightUV.isPercentValue()) {
                    height = null;
                } else {
                    UnitValue minHeightUV = getPropertyAsUnitValue(85);
                    if (minHeightUV != null && minHeightUV.isPointValue()) {
                        minHeight = Float.valueOf(minHeightUV.getValue());
                    }
                    UnitValue maxHeightUV = getPropertyAsUnitValue(84);
                    if (maxHeightUV != null && maxHeightUV.isPointValue()) {
                        maxHeight = Float.valueOf(maxHeightUV.getValue());
                    }
                    height = Float.valueOf(heightUV.getValue());
                }
            } else {
                minHeight = retrieveUnitValue(parentResolvedHeight.floatValue(), 85);
                maxHeight = retrieveUnitValue(parentResolvedHeight.floatValue(), 84);
                height = retrieveUnitValue(parentResolvedHeight.floatValue(), 27);
            }
            if (maxHeight != null && minHeight != null && minHeight.floatValue() > maxHeight.floatValue()) {
                maxHeight = minHeight;
            }
            if (height != null) {
                if (maxHeight != null) {
                    height = height.floatValue() > maxHeight.floatValue() ? maxHeight : height;
                }
                if (minHeight != null) {
                    height = height.floatValue() < minHeight.floatValue() ? minHeight : height;
                }
            }
            if (height != null && isBorderBoxSizing(this)) {
                height = Float.valueOf(height.floatValue() - calculatePaddingBorderHeight(this));
            }
        }
        if (height != null) {
            return Float.valueOf(Math.max(0.0f, height.floatValue()));
        }
        return null;
    }

    private float[] calculateRadii(BorderRadius[] radii, Rectangle area, boolean horizontal) {
        float[] results = new float[4];
        for (int i = 0; i < 4; i++) {
            if (radii[i] != null) {
                UnitValue value = horizontal ? radii[i].getHorizontalRadius() : radii[i].getVerticalRadius();
                if (value != null) {
                    if (value.getUnitType() == 2) {
                        results[i] = (value.getValue() * (horizontal ? area.getWidth() : area.getHeight())) / 100.0f;
                    } else if (value.getUnitType() != 1) {
                        throw new AssertionError();
                    } else {
                        results[i] = value.getValue();
                    }
                } else {
                    results[i] = 0.0f;
                }
            } else {
                results[i] = 0.0f;
            }
        }
        return results;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateHeight(UnitValue updatedHeight) {
        if (isBorderBoxSizing(this) && updatedHeight.isPointValue()) {
            updatedHeight.setValue(updatedHeight.getValue() + calculatePaddingBorderHeight(this));
        }
        setProperty(27, updatedHeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveMaxHeight() {
        Float maxHeight;
        Float minHeight = null;
        Float directParentDeclaredHeight = retrieveDirectParentDeclaredHeight();
        UnitValue maxHeightAsUV = getPropertyAsUnitValue(84);
        if (maxHeightAsUV != null) {
            if (directParentDeclaredHeight != null) {
                maxHeight = retrieveUnitValue(directParentDeclaredHeight.floatValue(), 84);
            } else if (maxHeightAsUV.isPercentValue()) {
                maxHeight = null;
            } else {
                minHeight = retrieveMinHeight();
                UnitValue minHeightUV = getPropertyAsUnitValue(85);
                if (minHeightUV != null && minHeightUV.isPointValue()) {
                    minHeight = Float.valueOf(minHeightUV.getValue());
                }
                maxHeight = Float.valueOf(maxHeightAsUV.getValue());
            }
            if (maxHeight != null) {
                if (minHeight != null && minHeight.floatValue() > maxHeight.floatValue()) {
                    maxHeight = minHeight;
                }
                if (isBorderBoxSizing(this)) {
                    maxHeight = Float.valueOf(maxHeight.floatValue() - calculatePaddingBorderHeight(this));
                }
                return Float.valueOf(maxHeight.floatValue() > 0.0f ? maxHeight.floatValue() : 0.0f);
            }
        }
        return retrieveHeight();
    }

    protected void updateMaxHeight(UnitValue updatedMaxHeight) {
        if (isBorderBoxSizing(this) && updatedMaxHeight.isPointValue()) {
            updatedMaxHeight.setValue(updatedMaxHeight.getValue() + calculatePaddingBorderHeight(this));
        }
        setProperty(84, updatedMaxHeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveMinHeight() {
        Float minHeight;
        Float directParentDeclaredHeight = retrieveDirectParentDeclaredHeight();
        UnitValue minHeightUV = getPropertyAsUnitValue(this, 85);
        if (minHeightUV != null) {
            if (directParentDeclaredHeight != null) {
                minHeight = retrieveUnitValue(directParentDeclaredHeight.floatValue(), 85);
            } else if (minHeightUV.isPercentValue()) {
                minHeight = null;
            } else {
                minHeight = Float.valueOf(minHeightUV.getValue());
            }
            if (minHeight != null) {
                if (isBorderBoxSizing(this)) {
                    minHeight = Float.valueOf(minHeight.floatValue() - calculatePaddingBorderHeight(this));
                }
                return Float.valueOf(minHeight.floatValue() > 0.0f ? minHeight.floatValue() : 0.0f);
            }
        }
        return retrieveHeight();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateMinHeight(UnitValue updatedMinHeight) {
        if (isBorderBoxSizing(this) && updatedMinHeight.isPointValue()) {
            updatedMinHeight.setValue(updatedMinHeight.getValue() + calculatePaddingBorderHeight(this));
        }
        setProperty(85, updatedMinHeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float retrieveUnitValue(float baseValue, int property) {
        return retrieveUnitValue(baseValue, property, false);
    }

    protected Float retrieveUnitValue(float baseValue, int property, boolean pointOnly) {
        UnitValue value = (UnitValue) getProperty(property);
        if (pointOnly && value.getUnitType() == 1) {
            Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(property)));
        }
        if (value != null) {
            if (value.getUnitType() == 2) {
                return Float.valueOf(value.getValue() != 100.0f ? (value.getValue() * baseValue) / 100.0f : baseValue);
            } else if (value.getUnitType() != 1) {
                throw new AssertionError();
            } else {
                return Float.valueOf(value.getValue());
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Map<Integer, Object> getOwnProperties() {
        return this.properties;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void addAllProperties(Map<Integer, Object> properties) {
        this.properties.putAll(properties);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float getFirstYLineRecursively() {
        if (this.childRenderers.size() == 0) {
            return null;
        }
        return ((AbstractRenderer) this.childRenderers.get(0)).getFirstYLineRecursively();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Float getLastYLineRecursively() {
        Float lastYLine;
        if (allowLastYLineRecursiveExtraction()) {
            for (int i = this.childRenderers.size() - 1; i >= 0; i--) {
                IRenderer child = this.childRenderers.get(i);
                if ((child instanceof AbstractRenderer) && (lastYLine = ((AbstractRenderer) child).getLastYLineRecursively()) != null) {
                    return lastYLine;
                }
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean allowLastYLineRecursiveExtraction() {
        return (isOverflowProperty(OverflowPropertyValue.HIDDEN, 103) || isOverflowProperty(OverflowPropertyValue.HIDDEN, 104)) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Rectangle applyMargins(Rectangle rect, UnitValue[] margins, boolean reverse) {
        if (!margins[0].isPointValue()) {
            Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 46));
        }
        if (!margins[1].isPointValue()) {
            Logger logger2 = LoggerFactory.getLogger(AbstractRenderer.class);
            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 45));
        }
        if (!margins[2].isPointValue()) {
            Logger logger3 = LoggerFactory.getLogger(AbstractRenderer.class);
            logger3.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 43));
        }
        if (!margins[3].isPointValue()) {
            Logger logger4 = LoggerFactory.getLogger(AbstractRenderer.class);
            logger4.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
        }
        return rect.applyMargins(margins[0].getValue(), margins[1].getValue(), margins[2].getValue(), margins[3].getValue(), reverse);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UnitValue[] getMargins() {
        return getMargins(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UnitValue[] getPaddings() {
        return getPaddings(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Rectangle applyPaddings(Rectangle rect, UnitValue[] paddings, boolean reverse) {
        if (paddings[0] != null && !paddings[0].isPointValue()) {
            Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 50));
        }
        if (paddings[1] != null && !paddings[1].isPointValue()) {
            Logger logger2 = LoggerFactory.getLogger(AbstractRenderer.class);
            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 49));
        }
        if (paddings[2] != null && !paddings[2].isPointValue()) {
            Logger logger3 = LoggerFactory.getLogger(AbstractRenderer.class);
            logger3.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 47));
        }
        if (paddings[3] != null && !paddings[3].isPointValue()) {
            Logger logger4 = LoggerFactory.getLogger(AbstractRenderer.class);
            logger4.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 48));
        }
        return rect.applyMargins(paddings[0] != null ? paddings[0].getValue() : 0.0f, paddings[1] != null ? paddings[1].getValue() : 0.0f, paddings[2] != null ? paddings[2].getValue() : 0.0f, paddings[3] != null ? paddings[3].getValue() : 0.0f, reverse);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Rectangle applyBorderBox(Rectangle rect, Border[] borders, boolean reverse) {
        float topWidth = borders[0] != null ? borders[0].getWidth() : 0.0f;
        float rightWidth = borders[1] != null ? borders[1].getWidth() : 0.0f;
        float bottomWidth = borders[2] != null ? borders[2].getWidth() : 0.0f;
        float leftWidth = borders[3] != null ? borders[3].getWidth() : 0.0f;
        return rect.applyMargins(topWidth, rightWidth, bottomWidth, leftWidth, reverse);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void applyAbsolutePosition(Rectangle parentRect) {
        Float top = getPropertyAsFloat(73);
        Float bottom = getPropertyAsFloat(14);
        Float left = getPropertyAsFloat(34);
        Float right = getPropertyAsFloat(54);
        if (left == null && right == null && BaseDirection.RIGHT_TO_LEFT.equals(getProperty(7))) {
            right = Float.valueOf(0.0f);
        }
        if (top == null && bottom == null) {
            top = Float.valueOf(0.0f);
        }
        if (right != null) {
            try {
                move((parentRect.getRight() - right.floatValue()) - this.occupiedArea.getBBox().getRight(), 0.0f);
            } catch (Exception e) {
                Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Absolute positioning might be applied incorrectly."));
                return;
            }
        }
        if (left != null) {
            move((parentRect.getLeft() + left.floatValue()) - this.occupiedArea.getBBox().getLeft(), 0.0f);
        }
        if (top != null) {
            move(0.0f, (parentRect.getTop() - top.floatValue()) - this.occupiedArea.getBBox().getTop());
        }
        if (bottom != null) {
            move(0.0f, (parentRect.getBottom() + bottom.floatValue()) - this.occupiedArea.getBBox().getBottom());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void applyRelativePositioningTranslation(boolean reverse) {
        Float valueOf = Float.valueOf(0.0f);
        float top = getPropertyAsFloat(73, valueOf).floatValue();
        float bottom = getPropertyAsFloat(14, valueOf).floatValue();
        float left = getPropertyAsFloat(34, valueOf).floatValue();
        float right = getPropertyAsFloat(54, valueOf).floatValue();
        int reverseMultiplier = reverse ? -1 : 1;
        float dxRight = left != 0.0f ? reverseMultiplier * left : (-right) * reverseMultiplier;
        float dyUp = top != 0.0f ? (-top) * reverseMultiplier : reverseMultiplier * bottom;
        if (dxRight != 0.0f || dyUp != 0.0f) {
            move(dxRight, dyUp);
        }
    }

    protected void applyDestination(PdfDocument document) {
        Object destination = getProperty(17);
        if (destination == null) {
            return;
        }
        String destinationName = null;
        PdfDictionary linkActionDict = null;
        if (destination instanceof String) {
            destinationName = (String) destination;
        } else if (CHECK_TUPLE2_TYPE.getClass().equals(destination.getClass())) {
            Tuple2<String, PdfDictionary> destTuple = (Tuple2) destination;
            String destinationName2 = destTuple.getFirst();
            destinationName = destinationName2;
            linkActionDict = destTuple.getSecond();
        }
        if (destinationName != null) {
            int pageNumber = this.occupiedArea.getPageNumber();
            if (pageNumber < 1 || pageNumber > document.getNumberOfPages()) {
                Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
                logger.warn(MessageFormatUtil.format(IoLogMessageConstant.UNABLE_TO_APPLY_PAGE_DEPENDENT_PROP_UNKNOWN_PAGE_ON_WHICH_ELEMENT_IS_DRAWN, "Property.DESTINATION, which specifies this element location as destination, see ElementPropertyContainer.setDestination."));
                return;
            }
            PdfArray array = new PdfArray();
            array.add(document.getPage(pageNumber).getPdfObject());
            array.add(PdfName.XYZ);
            array.add(new PdfNumber(this.occupiedArea.getBBox().getX()));
            array.add(new PdfNumber(this.occupiedArea.getBBox().getY() + this.occupiedArea.getBBox().getHeight()));
            array.add(new PdfNumber(0));
            document.addNamedDestination(destinationName, array.makeIndirect(document));
        }
        boolean isPdf20 = document.getPdfVersion().compareTo(PdfVersion.PDF_2_0) >= 0;
        if (linkActionDict != null && isPdf20 && document.isTagged()) {
            PdfStructElem structElem = getCurrentStructElem(document);
            PdfStructureDestination dest = PdfStructureDestination.createFit(structElem);
            linkActionDict.put(PdfName.SD, dest.getPdfObject());
        }
        deleteProperty(17);
    }

    protected void applyAction(PdfDocument document) {
        PdfAction action = (PdfAction) getProperty(1);
        if (action != null) {
            PdfLinkAnnotation link = (PdfLinkAnnotation) getProperty(88);
            if (link == null) {
                link = (PdfLinkAnnotation) new PdfLinkAnnotation(new Rectangle(0.0f, 0.0f, 0.0f, 0.0f)).setFlags(4);
                Border border = (Border) getProperty(9);
                if (border != null) {
                    link.setBorder(new PdfArray(new float[]{0.0f, 0.0f, border.getWidth()}));
                } else {
                    link.setBorder(new PdfArray(new float[]{0.0f, 0.0f, 0.0f}));
                }
                setProperty(88, link);
            }
            link.setAction(action);
        }
    }

    protected void applyLinkAnnotation(PdfDocument document) {
        Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
        PdfLinkAnnotation linkAnnotation = (PdfLinkAnnotation) getProperty(88);
        if (linkAnnotation == null) {
            return;
        }
        int pageNumber = this.occupiedArea.getPageNumber();
        if (pageNumber < 1 || pageNumber > document.getNumberOfPages()) {
            logger.warn(MessageFormatUtil.format(IoLogMessageConstant.UNABLE_TO_APPLY_PAGE_DEPENDENT_PROP_UNKNOWN_PAGE_ON_WHICH_ELEMENT_IS_DRAWN, "Property.LINK_ANNOTATION, which specifies a link associated with this element content area, see com.itextpdf.layout.element.Link."));
            return;
        }
        PdfDictionary newAnnotation = (PdfDictionary) linkAnnotation.getPdfObject().m7331clone();
        PdfLinkAnnotation linkAnnotation2 = (PdfLinkAnnotation) PdfAnnotation.makeAnnotation(newAnnotation);
        Rectangle pdfBBox = calculateAbsolutePdfBBox();
        linkAnnotation2.setRectangle(new PdfArray(pdfBBox));
        PdfPage page = document.getPage(pageNumber);
        if (page.isFlushed()) {
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PAGE_WAS_FLUSHED_ACTION_WILL_NOT_BE_PERFORMED, "link annotation applying"));
        } else {
            page.addAnnotation(linkAnnotation2);
        }
    }

    private Float retrieveResolvedParentDeclaredHeight() {
        if (this.parent != null && this.parent.getProperty(27) != null) {
            UnitValue parentHeightUV = getPropertyAsUnitValue(this.parent, 27);
            if (parentHeightUV.isPointValue()) {
                return Float.valueOf(parentHeightUV.getValue());
            }
            return ((AbstractRenderer) this.parent).retrieveHeight();
        }
        return null;
    }

    private Float retrieveDirectParentDeclaredHeight() {
        if (this.parent != null && this.parent.getProperty(27) != null) {
            UnitValue parentHeightUV = getPropertyAsUnitValue(this.parent, 27);
            if (parentHeightUV.isPointValue()) {
                return Float.valueOf(parentHeightUV.getValue());
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateHeightsOnSplit(boolean wasHeightClipped, AbstractRenderer splitRenderer, AbstractRenderer overflowRenderer) {
        updateHeightsOnSplit(this.occupiedArea.getBBox().getHeight(), wasHeightClipped, splitRenderer, overflowRenderer, true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void updateHeightsOnSplit(float usedHeight, boolean wasHeightClipped, AbstractRenderer splitRenderer, AbstractRenderer overflowRenderer, boolean enlargeOccupiedAreaOnHeightWasClipped) {
        if (wasHeightClipped) {
            Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
            logger.warn(IoLogMessageConstant.CLIP_ELEMENT);
            if (enlargeOccupiedAreaOnHeightWasClipped) {
                Float maxHeight = retrieveMaxHeight();
                splitRenderer.occupiedArea.getBBox().moveDown(maxHeight.floatValue() - usedHeight).setHeight(maxHeight.floatValue());
                usedHeight = maxHeight.floatValue();
            }
        }
        if (overflowRenderer == null || isKeepTogether()) {
            return;
        }
        Float parentResolvedHeightPropertyValue = retrieveResolvedParentDeclaredHeight();
        UnitValue maxHeightUV = getPropertyAsUnitValue(this, 84);
        if (maxHeightUV != null) {
            if (maxHeightUV.isPointValue()) {
                UnitValue updateMaxHeight = UnitValue.createPointValue(retrieveMaxHeight().floatValue() - usedHeight);
                overflowRenderer.updateMaxHeight(updateMaxHeight);
            } else if (parentResolvedHeightPropertyValue != null) {
                float currentOccupiedFraction = (usedHeight / parentResolvedHeightPropertyValue.floatValue()) * 100.0f;
                float newFraction = maxHeightUV.getValue() - currentOccupiedFraction;
                overflowRenderer.updateMinHeight(UnitValue.createPercentValue(newFraction));
            }
        }
        UnitValue minHeightUV = getPropertyAsUnitValue(this, 85);
        if (minHeightUV != null) {
            if (minHeightUV.isPointValue()) {
                Float minHeight = retrieveMinHeight();
                UnitValue updateminHeight = UnitValue.createPointValue(minHeight.floatValue() - usedHeight);
                overflowRenderer.updateMinHeight(updateminHeight);
            } else if (parentResolvedHeightPropertyValue != null) {
                float currentOccupiedFraction2 = (usedHeight / parentResolvedHeightPropertyValue.floatValue()) * 100.0f;
                float newFraction2 = minHeightUV.getValue() - currentOccupiedFraction2;
                overflowRenderer.updateMinHeight(UnitValue.createPercentValue(newFraction2));
            }
        }
        UnitValue heightUV = getPropertyAsUnitValue(this, 27);
        if (heightUV != null) {
            if (heightUV.isPointValue()) {
                Float height = retrieveHeight();
                UnitValue updateHeight = UnitValue.createPointValue(height.floatValue() - usedHeight);
                overflowRenderer.updateHeight(updateHeight);
            } else if (parentResolvedHeightPropertyValue != null) {
                float currentOccupiedFraction3 = (usedHeight / parentResolvedHeightPropertyValue.floatValue()) * 100.0f;
                float newFraction3 = heightUV.getValue() - currentOccupiedFraction3;
                overflowRenderer.updateMinHeight(UnitValue.createPercentValue(newFraction3));
            }
        }
    }

    public MinMaxWidth getMinMaxWidth() {
        return MinMaxWidthUtils.countDefaultMinMaxWidth(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean setMinMaxWidthBasedOnFixedWidth(MinMaxWidth minMaxWidth) {
        Float width;
        if (hasAbsoluteUnitValue(77) && (width = retrieveWidth(0.0f)) != null) {
            minMaxWidth.setChildrenMaxWidth(width.floatValue());
            minMaxWidth.setChildrenMinWidth(width.floatValue());
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isNotFittingHeight(LayoutArea layoutArea) {
        return !isPositioned() && this.occupiedArea.getBBox().getHeight() > layoutArea.getBBox().getHeight();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isNotFittingWidth(LayoutArea layoutArea) {
        return !isPositioned() && this.occupiedArea.getBBox().getWidth() > layoutArea.getBBox().getWidth();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isNotFittingLayoutArea(LayoutArea layoutArea) {
        return isNotFittingHeight(layoutArea) || isNotFittingWidth(layoutArea);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isPositioned() {
        return !isStaticLayout();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isFixedLayout() {
        Object positioning = getProperty(52);
        Integer num = 4;
        return num.equals(positioning);
    }

    protected boolean isStaticLayout() {
        Object positioning = getProperty(52);
        if (positioning != null) {
            Integer num = 1;
            return num.equals(positioning);
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isRelativePosition() {
        Integer positioning = getPropertyAsInteger(52);
        Integer num = 2;
        return num.equals(positioning);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isAbsolutePosition() {
        Integer positioning = getPropertyAsInteger(52);
        Integer num = 3;
        return num.equals(positioning);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isKeepTogether() {
        return isKeepTogether(null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isKeepTogether(IRenderer causeOfNothing) {
        return Boolean.TRUE.equals(getPropertyAsBoolean(32)) && !(causeOfNothing instanceof AreaBreakRenderer);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void alignChildHorizontally(IRenderer childRenderer, Rectangle currentArea) {
        float availableWidth = currentArea.getWidth();
        HorizontalAlignment horizontalAlignment = (HorizontalAlignment) childRenderer.getProperty(28);
        if (horizontalAlignment != null && horizontalAlignment != HorizontalAlignment.LEFT) {
            float freeSpace = availableWidth - childRenderer.getOccupiedArea().getBBox().getWidth();
            if (freeSpace > 0.0f) {
                try {
                    switch (horizontalAlignment) {
                        case RIGHT:
                            childRenderer.move(freeSpace, 0.0f);
                            break;
                        case CENTER:
                            childRenderer.move(freeSpace / 2.0f, 0.0f);
                            break;
                    }
                } catch (NullPointerException e) {
                    Logger logger = LoggerFactory.getLogger(AbstractRenderer.class);
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Some of the children might not end up aligned horizontally."));
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border[] getBorders() {
        return getBorders(this);
    }

    protected BorderRadius[] getBorderRadii() {
        return getBorderRadii(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractRenderer setBorders(Border border, int borderNumber) {
        switch (borderNumber) {
            case 0:
                setProperty(13, border);
                break;
            case 1:
                setProperty(12, border);
                break;
            case 2:
                setProperty(10, border);
                break;
            case 3:
                setProperty(11, border);
                break;
        }
        return this;
    }

    protected Rectangle calculateAbsolutePdfBBox() {
        Rectangle contentBox = getOccupiedAreaBBox();
        List<Point> contentBoxPoints = rectangleToPointsList(contentBox);
        for (AbstractRenderer renderer = this; renderer.parent != null; renderer = (AbstractRenderer) renderer.parent) {
            if (renderer instanceof BlockRenderer) {
                Float angle = (Float) renderer.getProperty(55);
                if (angle != null) {
                    BlockRenderer blockRenderer = (BlockRenderer) renderer;
                    AffineTransform rotationTransform = blockRenderer.createRotationTransformInsideOccupiedArea();
                    transformPoints(contentBoxPoints, rotationTransform);
                }
            }
            if (renderer.getProperty(53) != null && ((renderer instanceof BlockRenderer) || (renderer instanceof ImageRenderer) || (renderer instanceof TableRenderer))) {
                AffineTransform rotationTransform2 = renderer.createTransformationInsideOccupiedArea();
                transformPoints(contentBoxPoints, rotationTransform2);
            }
        }
        return calculateBBox(contentBoxPoints);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Rectangle calculateBBox(List<Point> points) {
        return Rectangle.calculateBBox(points);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<Point> rectangleToPointsList(Rectangle rect) {
        return Arrays.asList(rect.toPointsArray());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<Point> transformPoints(List<Point> points, AffineTransform transform) {
        for (Point point : points) {
            transform.transform(point, point);
        }
        return points;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public float[] calculateShiftToPositionBBoxOfPointsAt(float left, float top, List<Point> points) {
        double minX = Double.MAX_VALUE;
        double maxY = -1.7976931348623157E308d;
        for (Point point : points) {
            minX = Math.min(point.getX(), minX);
            maxY = Math.max(point.getY(), maxY);
        }
        float dx = (float) (left - minX);
        float dy = (float) (top - maxY);
        return new float[]{dx, dy};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean hasAbsoluteUnitValue(int property) {
        UnitValue value = (UnitValue) getProperty(property);
        return value != null && value.isPointValue();
    }

    protected boolean hasRelativeUnitValue(int property) {
        UnitValue value = (UnitValue) getProperty(property);
        return value != null && value.isPercentValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isFirstOnRootArea(boolean checkRootAreaOnly) {
        boolean isFirstOnRootArea = true;
        IRenderer ancestor = this;
        while (isFirstOnRootArea && ancestor.getParent() != null) {
            IRenderer parent = ancestor.getParent();
            if (parent instanceof RootRenderer) {
                isFirstOnRootArea = ((RootRenderer) parent).currentArea.isEmptyArea();
            } else if (parent.getOccupiedArea() == null) {
                break;
            } else if (!checkRootAreaOnly) {
                isFirstOnRootArea = parent.getOccupiedArea().getBBox().getHeight() < 1.0E-4f;
            }
            ancestor = parent;
        }
        return isFirstOnRootArea;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfDocument getPdfDocument() {
        RootRenderer renderer = getRootRenderer();
        if (renderer instanceof DocumentRenderer) {
            Document document = ((DocumentRenderer) renderer).document;
            return document.getPdfDocument();
        } else if (renderer instanceof CanvasRenderer) {
            return ((CanvasRenderer) renderer).canvas.getPdfDocument();
        } else {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public RootRenderer getRootRenderer() {
        for (IRenderer currentRenderer = this; currentRenderer instanceof AbstractRenderer; currentRenderer = ((AbstractRenderer) currentRenderer).getParent()) {
            if (currentRenderer instanceof RootRenderer) {
                return (RootRenderer) currentRenderer;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float calculateAdditionalWidth(AbstractRenderer renderer) {
        Rectangle dummy = new Rectangle(0.0f, 0.0f);
        renderer.applyMargins(dummy, true);
        renderer.applyBorderBox(dummy, true);
        renderer.applyPaddings(dummy, true);
        return dummy.getWidth();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean noAbsolutePositionInfo(IRenderer renderer) {
        return (renderer.hasProperty(73) || renderer.hasProperty(14) || renderer.hasProperty(34) || renderer.hasProperty(54)) ? false : true;
    }

    static Float getPropertyAsFloat(IRenderer renderer, int property) {
        return NumberUtil.asFloat(renderer.getProperty(property));
    }

    static UnitValue getPropertyAsUnitValue(IRenderer renderer, int property) {
        UnitValue result = (UnitValue) renderer.getProperty(property);
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void shrinkOccupiedAreaForAbsolutePosition() {
        if (isAbsolutePosition()) {
            Float left = getPropertyAsFloat(34);
            Float right = getPropertyAsFloat(54);
            UnitValue width = (UnitValue) getProperty(77);
            if (left == null && right == null && width == null) {
                this.occupiedArea.getBBox().setWidth(0.0f);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void drawPositionedChildren(DrawContext drawContext) {
        for (IRenderer positionedChild : this.positionedRenderers) {
            positionedChild.draw(drawContext);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontCharacteristics createFontCharacteristics() {
        FontCharacteristics fc = new FontCharacteristics();
        if (hasProperty(95)) {
            fc.setFontWeight((String) getProperty(95));
        }
        if (hasProperty(94)) {
            fc.setFontStyle((String) getProperty(94));
        }
        return fc;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfFont resolveFirstPdfFont() {
        Object font = getProperty(20);
        if (font instanceof PdfFont) {
            return (PdfFont) font;
        }
        if (font instanceof String[]) {
            FontProvider provider = (FontProvider) getProperty(91);
            if (provider == null) {
                throw new IllegalStateException(LayoutExceptionMessageConstant.FONT_PROVIDER_NOT_SET_FONT_FAMILY_NOT_RESOLVED);
            }
            FontSet fontSet = (FontSet) getProperty(98);
            if (provider.getFontSet().isEmpty() && (fontSet == null || fontSet.isEmpty())) {
                throw new IllegalStateException(LayoutExceptionMessageConstant.FONT_PROVIDER_NOT_SET_FONT_FAMILY_NOT_RESOLVED);
            }
            FontCharacteristics fc = createFontCharacteristics();
            return resolveFirstPdfFont((String[]) font, provider, fc, fontSet);
        }
        throw new IllegalStateException("String[] or PdfFont expected as value of FONT property");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfFont resolveFirstPdfFont(String[] font, FontProvider provider, FontCharacteristics fc, FontSet additionalFonts) {
        FontSelector fontSelector = provider.getFontSelector(Arrays.asList(font), fc, additionalFonts);
        return provider.getPdfFont(fontSelector.bestMatch(), additionalFonts);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Border[] getBorders(IRenderer renderer) {
        Border border = (Border) renderer.getProperty(9);
        Border topBorder = (Border) renderer.getProperty(13);
        Border rightBorder = (Border) renderer.getProperty(12);
        Border bottomBorder = (Border) renderer.getProperty(10);
        Border leftBorder = (Border) renderer.getProperty(11);
        Border[] borders = {topBorder, rightBorder, bottomBorder, leftBorder};
        if (!hasOwnOrModelProperty(renderer, 13)) {
            borders[0] = border;
        }
        if (!hasOwnOrModelProperty(renderer, 12)) {
            borders[1] = border;
        }
        if (!hasOwnOrModelProperty(renderer, 10)) {
            borders[2] = border;
        }
        if (!hasOwnOrModelProperty(renderer, 11)) {
            borders[3] = border;
        }
        return borders;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void applyAbsolutePositionIfNeeded(LayoutContext layoutContext) {
        if (isAbsolutePosition()) {
            applyAbsolutePosition((layoutContext instanceof PositionedLayoutContext ? ((PositionedLayoutContext) layoutContext).getParentOccupiedArea() : layoutContext.getArea()).getBBox());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void preparePositionedRendererAndAreaForLayout(IRenderer childPositionedRenderer, Rectangle fullBbox, Rectangle parentBbox) {
        Float left = getPropertyAsFloat(childPositionedRenderer, 34);
        Float right = getPropertyAsFloat(childPositionedRenderer, 54);
        Float top = getPropertyAsFloat(childPositionedRenderer, 73);
        Float bottom = getPropertyAsFloat(childPositionedRenderer, 14);
        childPositionedRenderer.setParent(this);
        adjustPositionedRendererLayoutBoxWidth(childPositionedRenderer, fullBbox, left, right);
        Integer num = 3;
        if (num.equals(childPositionedRenderer.getProperty(52))) {
            updateMinHeightForAbsolutelyPositionedRenderer(childPositionedRenderer, parentBbox, top, bottom);
        }
    }

    private void updateMinHeightForAbsolutelyPositionedRenderer(IRenderer renderer, Rectangle parentRendererBox, Float top, Float bottom) {
        if (top != null && bottom != null && !renderer.hasProperty(27)) {
            UnitValue currentMaxHeight = getPropertyAsUnitValue(renderer, 84);
            UnitValue currentMinHeight = getPropertyAsUnitValue(renderer, 85);
            float resolvedMinHeight = Math.max(0.0f, ((parentRendererBox.getTop() - top.floatValue()) - parentRendererBox.getBottom()) - bottom.floatValue());
            Rectangle dummy = new Rectangle(0.0f, 0.0f);
            if (!isBorderBoxSizing(renderer)) {
                applyPaddings(dummy, getPaddings(renderer), true);
                applyBorderBox(dummy, getBorders(renderer), true);
            }
            applyMargins(dummy, getMargins(renderer), true);
            float resolvedMinHeight2 = resolvedMinHeight - dummy.getHeight();
            if (currentMinHeight != null) {
                resolvedMinHeight2 = Math.max(resolvedMinHeight2, currentMinHeight.getValue());
            }
            if (currentMaxHeight != null) {
                resolvedMinHeight2 = Math.min(resolvedMinHeight2, currentMaxHeight.getValue());
            }
            renderer.setProperty(85, UnitValue.createPointValue(resolvedMinHeight2));
        }
    }

    private void adjustPositionedRendererLayoutBoxWidth(IRenderer renderer, Rectangle fullBbox, Float left, Float right) {
        if (left != null) {
            fullBbox.setWidth(fullBbox.getWidth() - left.floatValue()).setX(fullBbox.getX() + left.floatValue());
        }
        if (right != null) {
            fullBbox.setWidth(fullBbox.getWidth() - right.floatValue());
        }
        if (left == null && right == null && !renderer.hasProperty(77)) {
            MinMaxWidth minMaxWidth = renderer instanceof BlockRenderer ? ((BlockRenderer) renderer).getMinMaxWidth() : null;
            if (minMaxWidth != null && minMaxWidth.getMaxWidth() < fullBbox.getWidth()) {
                fullBbox.setWidth(minMaxWidth.getMaxWidth() + 1.0E-4f);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float calculatePaddingBorderWidth(AbstractRenderer renderer) {
        Rectangle dummy = new Rectangle(0.0f, 0.0f);
        renderer.applyBorderBox(dummy, true);
        renderer.applyPaddings(dummy, true);
        return dummy.getWidth();
    }

    static float calculatePaddingBorderHeight(AbstractRenderer renderer) {
        Rectangle dummy = new Rectangle(0.0f, 0.0f);
        renderer.applyBorderBox(dummy, true);
        renderer.applyPaddings(dummy, true);
        return dummy.getHeight();
    }

    private AffineTransform createTransformationInsideOccupiedArea() {
        Rectangle backgroundArea = applyMargins(this.occupiedArea.mo7332clone().getBBox(), false);
        float x = backgroundArea.getX();
        float y = backgroundArea.getY();
        float height = backgroundArea.getHeight();
        float width = backgroundArea.getWidth();
        AffineTransform transform = AffineTransform.getTranslateInstance(((width / 2.0f) + x) * (-1.0f), ((height / 2.0f) + y) * (-1.0f));
        transform.preConcatenate(Transform.getAffineTransform((Transform) getProperty(53), width, height));
        transform.preConcatenate(AffineTransform.getTranslateInstance((width / 2.0f) + x, (height / 2.0f) + y));
        return transform;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void beginTransformationIfApplied(PdfCanvas canvas) {
        if (getProperty(53) != null) {
            AffineTransform transform = createTransformationInsideOccupiedArea();
            canvas.saveState().concatMatrix(transform);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void endTransformationIfApplied(PdfCanvas canvas) {
        if (getProperty(53) != null) {
            canvas.restoreState();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addChildRenderer(IRenderer child) {
        child.setParent(this);
        this.childRenderers.add(child);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addAllChildRenderers(List<IRenderer> children) {
        if (children == null) {
            return;
        }
        setThisAsParent(children);
        this.childRenderers.addAll(children);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addAllChildRenderers(int index, List<IRenderer> children) {
        setThisAsParent(children);
        this.childRenderers.addAll(index, children);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setChildRenderers(List<IRenderer> children) {
        removeThisFromParents(this.childRenderers);
        this.childRenderers.clear();
        addAllChildRenderers(children);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IRenderer removeChildRenderer(int index) {
        IRenderer removed = this.childRenderers.remove(index);
        removeThisFromParent(removed);
        return removed;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean removeAllChildRenderers(Collection<IRenderer> children) {
        removeThisFromParents(children);
        return this.childRenderers.removeAll(children);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IRenderer setChildRenderer(int index, IRenderer child) {
        if (child != null) {
            child.setParent(this);
        }
        IRenderer removedElement = this.childRenderers.set(index, child);
        removeThisFromParent(removedElement);
        return removedElement;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setThisAsParent(Collection<IRenderer> children) {
        for (IRenderer child : children) {
            child.setParent(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean logWarningIfGetNextRendererNotOverridden(Class<?> baseClass, Class<?> rendererClass) {
        if (baseClass != rendererClass) {
            Logger logger = LoggerFactory.getLogger(baseClass);
            logger.warn(MessageFormatUtil.format(IoLogMessageConstant.GET_NEXT_RENDERER_SHOULD_BE_OVERRIDDEN, new Object[0]));
            return false;
        }
        return true;
    }

    private void removeThisFromParent(IRenderer toRemove) {
        if (toRemove != null && this == toRemove.getParent() && !this.childRenderers.contains(toRemove)) {
            toRemove.setParent(null);
        }
    }

    private void removeThisFromParents(Collection<IRenderer> children) {
        for (IRenderer child : children) {
            if (child != null && this == child.getParent()) {
                child.setParent(null);
            }
        }
    }

    private static UnitValue[] getMargins(IRenderer renderer) {
        return new UnitValue[]{(UnitValue) renderer.getProperty(46), (UnitValue) renderer.getProperty(45), (UnitValue) renderer.getProperty(43), (UnitValue) renderer.getProperty(44)};
    }

    private static BorderRadius[] getBorderRadii(IRenderer renderer) {
        BorderRadius radius = (BorderRadius) renderer.getProperty(101);
        BorderRadius topLeftRadius = (BorderRadius) renderer.getProperty(Property.BORDER_TOP_LEFT_RADIUS);
        BorderRadius topRightRadius = (BorderRadius) renderer.getProperty(Property.BORDER_TOP_RIGHT_RADIUS);
        BorderRadius bottomRightRadius = (BorderRadius) renderer.getProperty(Property.BORDER_BOTTOM_RIGHT_RADIUS);
        BorderRadius bottomLeftRadius = (BorderRadius) renderer.getProperty(Property.BORDER_BOTTOM_LEFT_RADIUS);
        BorderRadius[] borderRadii = {topLeftRadius, topRightRadius, bottomRightRadius, bottomLeftRadius};
        if (!hasOwnOrModelProperty(renderer, Property.BORDER_TOP_LEFT_RADIUS)) {
            borderRadii[0] = radius;
        }
        if (!hasOwnOrModelProperty(renderer, Property.BORDER_TOP_RIGHT_RADIUS)) {
            borderRadii[1] = radius;
        }
        if (!hasOwnOrModelProperty(renderer, Property.BORDER_BOTTOM_RIGHT_RADIUS)) {
            borderRadii[2] = radius;
        }
        if (!hasOwnOrModelProperty(renderer, Property.BORDER_BOTTOM_LEFT_RADIUS)) {
            borderRadii[3] = radius;
        }
        return borderRadii;
    }

    private static UnitValue[] getPaddings(IRenderer renderer) {
        return new UnitValue[]{(UnitValue) renderer.getProperty(50), (UnitValue) renderer.getProperty(49), (UnitValue) renderer.getProperty(47), (UnitValue) renderer.getProperty(48)};
    }

    private static boolean hasOwnOrModelProperty(IRenderer renderer, int property) {
        return renderer.hasOwnProperty(property) || (renderer.getModelElement() != null && renderer.getModelElement().hasProperty(property));
    }

    private static PdfStructElem getCurrentStructElem(PdfDocument document) {
        TagStructureContext context = document.getTagStructureContext();
        TagTreePointer tagPointer = context.getAutoTaggingPointer();
        return context.getPointerStructElem(tagPointer);
    }
}
