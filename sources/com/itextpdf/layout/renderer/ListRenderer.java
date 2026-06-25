package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.numbering.EnglishAlphabetNumbering;
import com.itextpdf.kernel.numbering.GreekAlphabetNumbering;
import com.itextpdf.kernel.numbering.RomanNumbering;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.List;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.IListSymbolFactory;
import com.itextpdf.layout.properties.ListNumberingType;
import com.itextpdf.layout.properties.ListSymbolPosition;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.io.IOException;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ListRenderer extends BlockRenderer {
    public ListRenderer(List modelElement) {
        super(modelElement);
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        LayoutResult errorResult = initializeListSymbols(layoutContext);
        if (errorResult != null) {
            return errorResult;
        }
        LayoutResult result = super.layout(layoutContext);
        if (Boolean.TRUE.equals(getPropertyAsBoolean(26)) && result.getCauseOfNothing() != null) {
            if (1 == result.getStatus()) {
                return correctListSplitting(this, null, result.getCauseOfNothing(), result.getOccupiedArea());
            }
            if (2 == result.getStatus()) {
                return correctListSplitting(result.getSplitRenderer(), result.getOverflowRenderer(), result.getCauseOfNothing(), result.getOccupiedArea());
            }
            return result;
        }
        return result;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(ListRenderer.class, getClass());
        return new ListRenderer((List) this.modelElement);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.BlockRenderer
    public AbstractRenderer createSplitRenderer(int layoutResult) {
        AbstractRenderer splitRenderer = super.createSplitRenderer(layoutResult);
        splitRenderer.addAllProperties(getOwnProperties());
        splitRenderer.setProperty(40, Boolean.TRUE);
        return splitRenderer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.BlockRenderer
    public AbstractRenderer createOverflowRenderer(int layoutResult) {
        AbstractRenderer overflowRenderer = super.createOverflowRenderer(layoutResult);
        overflowRenderer.addAllProperties(getOwnProperties());
        overflowRenderer.setProperty(40, Boolean.TRUE);
        return overflowRenderer;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer, com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        LayoutResult errorResult = initializeListSymbols(new LayoutContext(new LayoutArea(1, new Rectangle(MinMaxWidthUtils.getInfWidth(), 1000000.0f))));
        if (errorResult != null) {
            return MinMaxWidthUtils.countDefaultMinMaxWidth(this);
        }
        return super.getMinMaxWidth();
    }

    protected IRenderer makeListSymbolRenderer(int index, IRenderer renderer) {
        IRenderer symbolRenderer = createListSymbolRenderer(index, renderer);
        if (symbolRenderer != null) {
            symbolRenderer.setProperty(74, false);
        }
        return symbolRenderer;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Object getListItemOrListProperty(IRenderer listItem, IRenderer list, int propertyId) {
        return listItem.hasProperty(propertyId) ? listItem.getProperty(propertyId) : list.getProperty(propertyId);
    }

    private IRenderer createListSymbolRenderer(int index, IRenderer renderer) {
        String numberText;
        IRenderer textRenderer;
        Object defaultListSymbol = getListItemOrListProperty(renderer, this, 37);
        if (defaultListSymbol instanceof Text) {
            return surroundTextBullet(new TextRenderer((Text) defaultListSymbol));
        }
        if (defaultListSymbol instanceof Image) {
            return ((Image) defaultListSymbol).getRenderer();
        }
        if (defaultListSymbol instanceof ListNumberingType) {
            ListNumberingType numberingType = (ListNumberingType) defaultListSymbol;
            switch (numberingType) {
                case DECIMAL:
                    numberText = String.valueOf(index);
                    break;
                case DECIMAL_LEADING_ZERO:
                    numberText = (index < 10 ? "0" : "") + String.valueOf(index);
                    break;
                case ROMAN_LOWER:
                    numberText = RomanNumbering.toRomanLowerCase(index);
                    break;
                case ROMAN_UPPER:
                    numberText = RomanNumbering.toRomanUpperCase(index);
                    break;
                case ENGLISH_LOWER:
                    numberText = EnglishAlphabetNumbering.toLatinAlphabetNumberLowerCase(index);
                    break;
                case ENGLISH_UPPER:
                    numberText = EnglishAlphabetNumbering.toLatinAlphabetNumberUpperCase(index);
                    break;
                case GREEK_LOWER:
                    numberText = GreekAlphabetNumbering.toGreekAlphabetNumber(index, false, true);
                    break;
                case GREEK_UPPER:
                    numberText = GreekAlphabetNumbering.toGreekAlphabetNumber(index, true, true);
                    break;
                case ZAPF_DINGBATS_1:
                    numberText = TextUtil.charToString((char) (index + 171));
                    break;
                case ZAPF_DINGBATS_2:
                    numberText = TextUtil.charToString((char) (index + 181));
                    break;
                case ZAPF_DINGBATS_3:
                    numberText = TextUtil.charToString((char) (index + 191));
                    break;
                case ZAPF_DINGBATS_4:
                    numberText = TextUtil.charToString((char) (index + 201));
                    break;
                default:
                    throw new IllegalStateException();
            }
            Text textElement = new Text(getListItemOrListProperty(renderer, this, 41) + numberText + getListItemOrListProperty(renderer, this, 42));
            if (numberingType == ListNumberingType.GREEK_LOWER || numberingType == ListNumberingType.GREEK_UPPER || numberingType == ListNumberingType.ZAPF_DINGBATS_1 || numberingType == ListNumberingType.ZAPF_DINGBATS_2 || numberingType == ListNumberingType.ZAPF_DINGBATS_3 || numberingType == ListNumberingType.ZAPF_DINGBATS_4) {
                String constantFont = (numberingType == ListNumberingType.GREEK_LOWER || numberingType == ListNumberingType.GREEK_UPPER) ? "Symbol" : "ZapfDingbats";
                IRenderer textRenderer2 = new ConstantFontTextRenderer(textElement, constantFont);
                try {
                    textRenderer2.setProperty(20, PdfFontFactory.createFont(constantFont));
                } catch (IOException e) {
                }
                textRenderer = textRenderer2;
            } else {
                textRenderer = new TextRenderer(textElement);
            }
            return surroundTextBullet(textRenderer);
        } else if (defaultListSymbol instanceof IListSymbolFactory) {
            return surroundTextBullet(((IListSymbolFactory) defaultListSymbol).createSymbol(index, this, renderer).createRendererSubTree());
        } else {
            if (defaultListSymbol == null) {
                return null;
            }
            throw new IllegalStateException();
        }
    }

    private LineRenderer surroundTextBullet(IRenderer bulletRenderer) {
        LineRenderer lineRenderer = new LineRenderer();
        Text zeroWidthJoiner = new Text("\u200d");
        zeroWidthJoiner.getAccessibilityProperties().setRole(StandardRoles.ARTIFACT);
        TextRenderer zeroWidthJoinerRenderer = new TextRenderer(zeroWidthJoiner);
        lineRenderer.addChild(zeroWidthJoinerRenderer);
        lineRenderer.addChild(bulletRenderer);
        lineRenderer.addChild(zeroWidthJoinerRenderer);
        return lineRenderer;
    }

    private LayoutResult correctListSplitting(IRenderer splitRenderer, IRenderer overflowRenderer, IRenderer causeOfNothing, LayoutArea occupiedArea) {
        int firstNotRendered = splitRenderer.getChildRenderers().get(0).getChildRenderers().indexOf(causeOfNothing);
        if (-1 == firstNotRendered) {
            return new LayoutResult(overflowRenderer == null ? 1 : 2, occupiedArea, splitRenderer, overflowRenderer, this);
        }
        IRenderer firstListItemRenderer = splitRenderer.getChildRenderers().get(0);
        ListRenderer newOverflowRenderer = (ListRenderer) createOverflowRenderer(2);
        newOverflowRenderer.deleteOwnProperty(26);
        newOverflowRenderer.childRenderers.add(((ListItemRenderer) firstListItemRenderer).createOverflowRenderer(2));
        newOverflowRenderer.childRenderers.addAll(splitRenderer.getChildRenderers().subList(1, splitRenderer.getChildRenderers().size()));
        java.util.List<IRenderer> childrenStillRemainingToRender = new ArrayList<>(firstListItemRenderer.getChildRenderers().subList(firstNotRendered + 1, firstListItemRenderer.getChildRenderers().size()));
        splitRenderer.getChildRenderers().removeAll(splitRenderer.getChildRenderers().subList(1, splitRenderer.getChildRenderers().size()));
        if (childrenStillRemainingToRender.size() != 0) {
            newOverflowRenderer.getChildRenderers().get(0).getChildRenderers().addAll(childrenStillRemainingToRender);
            splitRenderer.getChildRenderers().get(0).getChildRenderers().removeAll(childrenStillRemainingToRender);
            newOverflowRenderer.getChildRenderers().get(0).setProperty(44, splitRenderer.getChildRenderers().get(0).getProperty(44));
        } else {
            newOverflowRenderer.childRenderers.remove(0);
        }
        if (overflowRenderer != null) {
            newOverflowRenderer.childRenderers.addAll(overflowRenderer.getChildRenderers());
        }
        return newOverflowRenderer.childRenderers.size() != 0 ? new LayoutResult(2, occupiedArea, splitRenderer, newOverflowRenderer, this) : new LayoutResult(1, occupiedArea, null, null, this);
    }

    private LayoutResult initializeListSymbols(LayoutContext layoutContext) {
        int i;
        boolean z;
        LayoutResult listSymbolLayoutResult;
        int listItemNum;
        IRenderer currentSymbolRenderer;
        LayoutResult layoutResult = null;
        if (hasOwnProperty(40)) {
            return null;
        }
        java.util.List<IRenderer> symbolRenderers = new ArrayList<>();
        boolean z2 = true;
        int listItemNum2 = ((Integer) getProperty(36, 1)).intValue();
        int i2 = 0;
        while (true) {
            int listItemNum3 = 7;
            if (i2 < this.childRenderers.size()) {
                this.childRenderers.get(i2).setParent(this);
                int listItemNum4 = this.childRenderers.get(i2).getProperty(120) != null ? ((Integer) this.childRenderers.get(i2).getProperty(120)).intValue() : listItemNum2;
                IRenderer currentSymbolRenderer2 = makeListSymbolRenderer(listItemNum4, this.childRenderers.get(i2));
                if (currentSymbolRenderer2 != null && BaseDirection.RIGHT_TO_LEFT == getProperty(7)) {
                    currentSymbolRenderer2.setProperty(7, BaseDirection.RIGHT_TO_LEFT);
                }
                if (currentSymbolRenderer2 == null) {
                    listSymbolLayoutResult = null;
                    listItemNum = listItemNum4;
                } else {
                    currentSymbolRenderer2.setParent(this.childRenderers.get(i2));
                    LayoutResult listSymbolLayoutResult2 = currentSymbolRenderer2.layout(layoutContext);
                    currentSymbolRenderer2.setParent(null);
                    listSymbolLayoutResult = listSymbolLayoutResult2;
                    listItemNum = listItemNum4 + 1;
                }
                boolean isForcedPlacement = Boolean.TRUE.equals(getPropertyAsBoolean(26));
                boolean listSymbolNotFit = (listSymbolLayoutResult == null || listSymbolLayoutResult.getStatus() == 1) ? false : true;
                if (listSymbolNotFit && isForcedPlacement) {
                    currentSymbolRenderer = null;
                } else {
                    currentSymbolRenderer = currentSymbolRenderer2;
                }
                symbolRenderers.add(currentSymbolRenderer);
                if (listSymbolNotFit && !isForcedPlacement) {
                    return new LayoutResult(3, null, null, this, listSymbolLayoutResult.getCauseOfNothing());
                }
                i2++;
                listItemNum2 = listItemNum;
            } else {
                float maxSymbolWidth = 0.0f;
                int i3 = 0;
                while (true) {
                    i = 83;
                    if (i3 >= this.childRenderers.size()) {
                        break;
                    }
                    IRenderer symbolRenderer = symbolRenderers.get(i3);
                    if (symbolRenderer != null) {
                        IRenderer listItemRenderer = this.childRenderers.get(i3);
                        if (((ListSymbolPosition) getListItemOrListProperty(listItemRenderer, this, 83)) != ListSymbolPosition.INSIDE) {
                            maxSymbolWidth = Math.max(maxSymbolWidth, symbolRenderer.getOccupiedArea().getBBox().getWidth());
                        }
                    }
                    i3++;
                }
                Float symbolIndent = getPropertyAsFloat(39);
                int listItemNum5 = 0;
                for (IRenderer childRenderer : this.childRenderers) {
                    boolean isRtl = BaseDirection.RIGHT_TO_LEFT == childRenderer.getProperty(listItemNum3) ? z2 : false;
                    int marginToSet = isRtl ? 45 : 44;
                    childRenderer.deleteOwnProperty(marginToSet);
                    LayoutResult layoutResult2 = layoutResult;
                    UnitValue marginToSetUV = (UnitValue) childRenderer.getProperty(marginToSet, UnitValue.createPointValue(0.0f));
                    if (!marginToSetUV.isPointValue()) {
                        Logger logger = LoggerFactory.getLogger(ListRenderer.class);
                        logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(marginToSet)));
                    }
                    float calculatedMargin = marginToSetUV.getValue();
                    if (((ListSymbolPosition) getListItemOrListProperty(childRenderer, this, i)) == ListSymbolPosition.DEFAULT) {
                        calculatedMargin += (symbolIndent != null ? symbolIndent.floatValue() : 0.0f) + maxSymbolWidth;
                    }
                    childRenderer.setProperty(marginToSet, UnitValue.createPointValue(calculatedMargin));
                    int listItemNum6 = listItemNum5 + 1;
                    IRenderer symbolRenderer2 = symbolRenderers.get(listItemNum5);
                    ((ListItemRenderer) childRenderer).addSymbolRenderer(symbolRenderer2, maxSymbolWidth);
                    if (symbolRenderer2 != null) {
                        LayoutTaggingHelper taggingHelper = (LayoutTaggingHelper) getProperty(108);
                        if (taggingHelper == null) {
                            z = z2;
                        } else if (symbolRenderer2 instanceof LineRenderer) {
                            z = true;
                            taggingHelper.setRoleHint(symbolRenderer2.getChildRenderers().get(1), StandardRoles.LBL);
                        } else {
                            z = true;
                            taggingHelper.setRoleHint(symbolRenderer2, StandardRoles.LBL);
                        }
                    } else {
                        z = z2;
                    }
                    z2 = z;
                    listItemNum5 = listItemNum6;
                    layoutResult = layoutResult2;
                    listItemNum3 = 7;
                    i = 83;
                }
                return layoutResult;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static final class ConstantFontTextRenderer extends TextRenderer {
        private String constantFontName;

        public ConstantFontTextRenderer(Text textElement, String font) {
            super(textElement);
            this.constantFontName = font;
        }

        @Override // com.itextpdf.layout.renderer.TextRenderer, com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
        public void draw(DrawContext drawContext) {
            try {
                setProperty(20, PdfFontFactory.createFont(this.constantFontName));
            } catch (IOException e) {
            }
            super.draw(drawContext);
        }
    }
}
