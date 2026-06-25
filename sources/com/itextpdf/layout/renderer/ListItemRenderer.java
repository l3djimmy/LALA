package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.layout.element.ListItem;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.ListSymbolAlignment;
import com.itextpdf.layout.properties.ListSymbolPosition;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import com.itextpdf.layout.tagging.TaggingDummyElement;
import com.itextpdf.layout.tagging.TaggingHintKey;
import java.util.Collections;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ListItemRenderer extends DivRenderer {
    private boolean symbolAddedInside;
    protected float symbolAreaWidth;
    protected IRenderer symbolRenderer;

    public ListItemRenderer(ListItem modelElement) {
        super(modelElement);
    }

    public void addSymbolRenderer(IRenderer symbolRenderer, float symbolAreaWidth) {
        this.symbolRenderer = symbolRenderer;
        this.symbolAreaWidth = symbolAreaWidth;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        if (this.symbolRenderer != null && getProperty(27) == null && !isListSymbolEmpty(this.symbolRenderer)) {
            float[] ascenderDescender = calculateAscenderDescender();
            float minHeight = Math.max(this.symbolRenderer.getOccupiedArea().getBBox().getHeight(), ascenderDescender[0] - ascenderDescender[1]);
            updateMinHeight(UnitValue.createPointValue(minHeight));
        }
        applyListSymbolPosition();
        LayoutResult result = super.layout(layoutContext);
        if (2 == result.getStatus()) {
            result.getOverflowRenderer().deleteOwnProperty(85);
        }
        return result;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        LayoutTaggingHelper taggingHelper;
        if (this.occupiedArea == null) {
            Logger logger = LoggerFactory.getLogger(ListItemRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Drawing won't be performed."));
            return;
        }
        if (drawContext.isTaggingEnabled() && (taggingHelper = (LayoutTaggingHelper) getProperty(108)) != null) {
            if (this.symbolRenderer != null) {
                LayoutTaggingHelper.addTreeHints(taggingHelper, this.symbolRenderer);
            }
            if (taggingHelper.isArtifact(this)) {
                taggingHelper.markArtifactHint(this.symbolRenderer);
            } else {
                TaggingHintKey hintKey = LayoutTaggingHelper.getHintKey(this);
                TaggingHintKey parentHint = taggingHelper.getAccessibleParentHint(hintKey);
                if (parentHint != null && !StandardRoles.LI.equals(parentHint.getAccessibleElement().getAccessibilityProperties().getRole())) {
                    TaggingDummyElement listItemIntermediate = new TaggingDummyElement(StandardRoles.LI);
                    List<TaggingHintKey> intermediateKid = Collections.singletonList(LayoutTaggingHelper.getOrCreateHintKey(listItemIntermediate));
                    taggingHelper.replaceKidHint(hintKey, intermediateKid);
                    if (this.symbolRenderer != null) {
                        taggingHelper.addKidsHint(listItemIntermediate, Collections.singletonList(this.symbolRenderer));
                    }
                    taggingHelper.addKidsHint(listItemIntermediate, Collections.singletonList(this));
                }
            }
        }
        super.draw(drawContext);
        if (this.symbolRenderer != null && !this.symbolAddedInside) {
            boolean isRtl = BaseDirection.RIGHT_TO_LEFT == getProperty(7);
            this.symbolRenderer.setParent(this);
            Rectangle bBox = this.occupiedArea.getBBox();
            float x = isRtl ? bBox.getRight() : bBox.getLeft();
            ListSymbolPosition symbolPosition = (ListSymbolPosition) ListRenderer.getListItemOrListProperty(this, this.parent, 83);
            if (symbolPosition != ListSymbolPosition.DEFAULT) {
                Float symbolIndent = getPropertyAsFloat(39);
                float f = this.symbolAreaWidth;
                x = isRtl ? x + f + (symbolIndent == null ? 0.0f : symbolIndent.floatValue()) : x - (f + (symbolIndent == null ? 0.0f : symbolIndent.floatValue()));
                if (symbolPosition == ListSymbolPosition.OUTSIDE) {
                    if (isRtl) {
                        UnitValue marginRightUV = getPropertyAsUnitValue(45);
                        if (!marginRightUV.isPointValue()) {
                            Logger logger2 = LoggerFactory.getLogger(ListItemRenderer.class);
                            logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 45));
                        }
                        x -= marginRightUV.getValue();
                    } else {
                        UnitValue marginLeftUV = getPropertyAsUnitValue(44);
                        if (!marginLeftUV.isPointValue()) {
                            Logger logger3 = LoggerFactory.getLogger(ListItemRenderer.class);
                            logger3.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 44));
                        }
                        x += marginLeftUV.getValue();
                    }
                }
            }
            applyMargins(this.occupiedArea.getBBox(), false);
            applyBorderBox(this.occupiedArea.getBBox(), false);
            if (this.childRenderers.size() > 0) {
                Float yLine = null;
                for (int i = 0; i < this.childRenderers.size() && (this.childRenderers.get(i).getOccupiedArea().getBBox().getHeight() <= 0.0f || (yLine = ((AbstractRenderer) this.childRenderers.get(i)).getFirstYLineRecursively()) == null); i++) {
                }
                IRenderer iRenderer = this.symbolRenderer;
                if (yLine != null) {
                    boolean z = iRenderer instanceof LineRenderer;
                    IRenderer iRenderer2 = this.symbolRenderer;
                    if (z) {
                        iRenderer2.move(0.0f, yLine.floatValue() - ((LineRenderer) this.symbolRenderer).getYLine());
                    } else {
                        iRenderer2.move(0.0f, yLine.floatValue() - this.symbolRenderer.getOccupiedArea().getBBox().getY());
                    }
                } else {
                    iRenderer.move(0.0f, (this.occupiedArea.getBBox().getY() + this.occupiedArea.getBBox().getHeight()) - (this.symbolRenderer.getOccupiedArea().getBBox().getY() + this.symbolRenderer.getOccupiedArea().getBBox().getHeight()));
                }
            } else {
                boolean z2 = this.symbolRenderer instanceof TextRenderer;
                IRenderer iRenderer3 = this.symbolRenderer;
                if (z2) {
                    ((TextRenderer) iRenderer3).moveYLineTo((this.occupiedArea.getBBox().getY() + this.occupiedArea.getBBox().getHeight()) - calculateAscenderDescender()[0]);
                } else {
                    iRenderer3.move(0.0f, ((this.occupiedArea.getBBox().getY() + this.occupiedArea.getBBox().getHeight()) - this.symbolRenderer.getOccupiedArea().getBBox().getHeight()) - this.symbolRenderer.getOccupiedArea().getBBox().getY());
                }
            }
            applyBorderBox(this.occupiedArea.getBBox(), true);
            applyMargins(this.occupiedArea.getBBox(), true);
            ListSymbolAlignment listSymbolAlignment = (ListSymbolAlignment) this.parent.getProperty(38, isRtl ? ListSymbolAlignment.LEFT : ListSymbolAlignment.RIGHT);
            float dxPosition = x - this.symbolRenderer.getOccupiedArea().getBBox().getX();
            if (listSymbolAlignment == ListSymbolAlignment.RIGHT) {
                if (!isRtl) {
                    dxPosition += this.symbolAreaWidth - this.symbolRenderer.getOccupiedArea().getBBox().getWidth();
                }
            } else if (listSymbolAlignment == ListSymbolAlignment.LEFT && isRtl) {
                dxPosition -= this.symbolAreaWidth - this.symbolRenderer.getOccupiedArea().getBBox().getWidth();
            }
            if (this.symbolRenderer instanceof LineRenderer) {
                IRenderer iRenderer4 = this.symbolRenderer;
                if (isRtl) {
                    iRenderer4.move(dxPosition - this.symbolRenderer.getOccupiedArea().getBBox().getWidth(), 0.0f);
                } else {
                    iRenderer4.move(dxPosition, 0.0f);
                }
            } else {
                this.symbolRenderer.move(dxPosition, 0.0f);
            }
            RootRenderer root = getRootRenderer();
            Rectangle effectiveArea = root.getCurrentArea().getBBox();
            if ((!isRtl && this.symbolRenderer.getOccupiedArea().getBBox().getRight() > effectiveArea.getLeft()) || (isRtl && this.symbolRenderer.getOccupiedArea().getBBox().getLeft() < effectiveArea.getRight())) {
                beginElementOpacityApplying(drawContext);
                this.symbolRenderer.draw(drawContext);
                endElementOpacityApplying(drawContext);
            }
        }
    }

    @Override // com.itextpdf.layout.renderer.DivRenderer, com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        return new ListItemRenderer((ListItem) this.modelElement);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.BlockRenderer
    public AbstractRenderer createSplitRenderer(int layoutResult) {
        ListItemRenderer splitRenderer = (ListItemRenderer) getNextRenderer();
        splitRenderer.parent = this.parent;
        splitRenderer.modelElement = this.modelElement;
        splitRenderer.occupiedArea = this.occupiedArea;
        splitRenderer.symbolAddedInside = this.symbolAddedInside;
        splitRenderer.isLastRendererForModelElement = false;
        if (layoutResult == 2) {
            splitRenderer.symbolRenderer = this.symbolRenderer;
            splitRenderer.symbolAreaWidth = this.symbolAreaWidth;
        }
        splitRenderer.addAllProperties(getOwnProperties());
        return splitRenderer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.BlockRenderer
    public AbstractRenderer createOverflowRenderer(int layoutResult) {
        ListItemRenderer overflowRenderer = (ListItemRenderer) getNextRenderer();
        overflowRenderer.parent = this.parent;
        overflowRenderer.modelElement = this.modelElement;
        if (layoutResult == 3) {
            overflowRenderer.symbolRenderer = this.symbolRenderer;
            overflowRenderer.symbolAreaWidth = this.symbolAreaWidth;
        }
        overflowRenderer.addAllProperties(getOwnProperties());
        return overflowRenderer;
    }

    private void applyListSymbolPosition() {
        if (this.symbolRenderer != null) {
            ListSymbolPosition symbolPosition = (ListSymbolPosition) ListRenderer.getListItemOrListProperty(this, this.parent, 83);
            if (symbolPosition == ListSymbolPosition.INSIDE) {
                boolean isRtl = BaseDirection.RIGHT_TO_LEFT.equals(getProperty(7));
                if (this.childRenderers.size() > 0 && (this.childRenderers.get(0) instanceof ParagraphRenderer)) {
                    ParagraphRenderer paragraphRenderer = (ParagraphRenderer) this.childRenderers.get(0);
                    Float symbolIndent = getPropertyAsFloat(39);
                    if (this.symbolRenderer instanceof LineRenderer) {
                        if (symbolIndent != null) {
                            this.symbolRenderer.getChildRenderers().get(1).setProperty(isRtl ? 44 : 45, UnitValue.createPointValue(symbolIndent.floatValue()));
                        }
                        if (!paragraphRenderer.childRenderers.contains(this.symbolRenderer.getChildRenderers().get(1))) {
                            for (IRenderer childRenderer : this.symbolRenderer.getChildRenderers()) {
                                paragraphRenderer.childRenderers.add(0, childRenderer);
                            }
                        }
                    } else {
                        if (symbolIndent != null) {
                            this.symbolRenderer.setProperty(isRtl ? 44 : 45, UnitValue.createPointValue(symbolIndent.floatValue()));
                        }
                        if (!paragraphRenderer.childRenderers.contains(this.symbolRenderer)) {
                            paragraphRenderer.childRenderers.add(0, this.symbolRenderer);
                        }
                    }
                    this.symbolAddedInside = true;
                } else if (this.childRenderers.size() > 0 && (this.childRenderers.get(0) instanceof ImageRenderer)) {
                    IRenderer paragraphRenderer2 = renderSymbolInNeutralParagraph();
                    paragraphRenderer2.addChild(this.childRenderers.get(0));
                    this.childRenderers.set(0, paragraphRenderer2);
                    this.symbolAddedInside = true;
                }
                if (!this.symbolAddedInside) {
                    this.childRenderers.add(0, renderSymbolInNeutralParagraph());
                    this.symbolAddedInside = true;
                }
            }
        }
    }

    private IRenderer renderSymbolInNeutralParagraph() {
        Paragraph p = new Paragraph().setNeutralRole();
        IRenderer paragraphRenderer = p.setMargin(0.0f).createRendererSubTree();
        Float symbolIndent = (Float) ListRenderer.getListItemOrListProperty(this, this.parent, 39);
        if (symbolIndent != null) {
            this.symbolRenderer.setProperty(45, UnitValue.createPointValue(symbolIndent.floatValue()));
        }
        paragraphRenderer.addChild(this.symbolRenderer);
        return paragraphRenderer;
    }

    private boolean isListSymbolEmpty(IRenderer listSymbolRenderer) {
        return listSymbolRenderer instanceof TextRenderer ? ((TextRenderer) listSymbolRenderer).getText().toString().length() == 0 : (listSymbolRenderer instanceof LineRenderer) && ((TextRenderer) listSymbolRenderer.getChildRenderers().get(1)).getText().toString().length() == 0;
    }

    private float[] calculateAscenderDescender() {
        PdfFont listItemFont = resolveFirstPdfFont();
        UnitValue fontSize = getPropertyAsUnitValue(24);
        if (listItemFont != null && fontSize != null) {
            if (!fontSize.isPointValue()) {
                Logger logger = LoggerFactory.getLogger(ListItemRenderer.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
            }
            float[] ascenderDescender = TextRenderer.calculateAscenderDescender(listItemFont);
            return new float[]{fontSize.getValue() * FontProgram.convertTextSpaceToGlyphSpace(ascenderDescender[0]), fontSize.getValue() * FontProgram.convertTextSpaceToGlyphSpace(ascenderDescender[1])};
        }
        return new float[]{0.0f, 0.0f};
    }
}
