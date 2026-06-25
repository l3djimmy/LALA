package com.itextpdf.layout.renderer;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.ArrayUtil;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.layout.element.TabStop;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.LineLayoutResult;
import com.itextpdf.layout.layout.TextLayoutResult;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.FloatPropertyValue;
import com.itextpdf.layout.properties.InlineVerticalAlignment;
import com.itextpdf.layout.properties.InlineVerticalAlignmentType;
import com.itextpdf.layout.properties.Leading;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.RenderingMode;
import com.itextpdf.layout.properties.TabAlignment;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class LineRenderer extends AbstractRenderer {
    private static final float MIN_MAX_WIDTH_CORRECTION_EPS = 0.001f;
    private static final Logger logger = LoggerFactory.getLogger(LineRenderer.class);
    protected byte[] levels;
    protected float maxAscent;
    private float maxBlockAscent;
    private float maxBlockDescent;
    protected float maxDescent;
    float maxTextAscent;
    float maxTextDescent;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0397  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x03ba  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x03f0  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x04c8  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:305:0x098c  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:347:0x0b1b  */
    /* JADX WARN: Removed duplicated region for block: B:348:0x0b38  */
    /* JADX WARN: Removed duplicated region for block: B:350:0x0b3e  */
    /* JADX WARN: Removed duplicated region for block: B:414:0x0cdd  */
    /* JADX WARN: Removed duplicated region for block: B:422:0x0d7d  */
    /* JADX WARN: Removed duplicated region for block: B:448:0x0e29  */
    /* JADX WARN: Removed duplicated region for block: B:451:0x0e34  */
    /* JADX WARN: Removed duplicated region for block: B:455:0x0e3e  */
    /* JADX WARN: Removed duplicated region for block: B:474:0x0ec4 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:477:0x0ed2  */
    /* JADX WARN: Removed duplicated region for block: B:486:0x0d24 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:487:0x0540 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:489:0x02fc A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:490:0x0b58 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x02ed  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0381  */
    @Override // com.itextpdf.layout.renderer.IRenderer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.itextpdf.layout.layout.LayoutResult layout(com.itextpdf.layout.layout.LayoutContext r80) {
        /*
            Method dump skipped, instructions count: 3826
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.LineRenderer.layout(com.itextpdf.layout.layout.LayoutContext):com.itextpdf.layout.layout.LayoutResult");
    }

    public float getMaxAscent() {
        return this.maxAscent;
    }

    public float getMaxDescent() {
        return this.maxDescent;
    }

    public float getYLine() {
        return this.occupiedArea.getBBox().getY() - this.maxDescent;
    }

    public float getLeadingValue(Leading leading) {
        switch (leading.getType()) {
            case 1:
                return Math.max(leading.getValue(), this.maxBlockAscent - this.maxBlockDescent);
            case 2:
                return getTopLeadingIndent(leading) + getBottomLeadingIndent(leading);
            default:
                throw new IllegalStateException();
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        return new LineRenderer();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float getFirstYLineRecursively() {
        return Float.valueOf(getYLine());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float getLastYLineRecursively() {
        return Float.valueOf(getYLine());
    }

    public void justify(float width) {
        float ratio;
        float ratio2 = getPropertyAsFloat(61).floatValue();
        IRenderer lastChildRenderer = getLastNonFloatChildRenderer();
        if (lastChildRenderer == null) {
            return;
        }
        float freeWidth = ((this.occupiedArea.getBBox().getX() + width) - lastChildRenderer.getOccupiedArea().getBBox().getX()) - lastChildRenderer.getOccupiedArea().getBBox().getWidth();
        int numberOfSpaces = getNumberOfSpaces();
        int baseCharsCount = baseCharactersCount();
        float f = 1.0f;
        float baseFactor = freeWidth / ((numberOfSpaces * ratio2) + ((1.0f - ratio2) * (baseCharsCount - 1)));
        if (Float.isInfinite(baseFactor)) {
            baseFactor = 0.0f;
        }
        float wordSpacing = ratio2 * baseFactor;
        float characterSpacing = (1.0f - ratio2) * baseFactor;
        float lastRightPos = this.occupiedArea.getBBox().getX();
        Iterator<IRenderer> it = getChildRenderers().iterator();
        while (it.hasNext()) {
            IRenderer child = it.next();
            if (!FloatingHelper.isRendererFloating(child)) {
                float childX = child.getOccupiedArea().getBBox().getX();
                float f2 = f;
                child.move(lastRightPos - childX, 0.0f);
                float childX2 = lastRightPos;
                if (!(child instanceof TextRenderer)) {
                    ratio = ratio2;
                } else {
                    float childHSCale = ((TextRenderer) child).getPropertyAsFloat(29, Float.valueOf(f2)).floatValue();
                    Float oldCharacterSpacing = ((TextRenderer) child).getPropertyAsFloat(15);
                    Float oldWordSpacing = ((TextRenderer) child).getPropertyAsFloat(78);
                    ratio = ratio2;
                    child.setProperty(15, Float.valueOf((oldCharacterSpacing == null ? 0.0f : oldCharacterSpacing.floatValue()) + (characterSpacing / childHSCale)));
                    child.setProperty(78, Float.valueOf((oldWordSpacing == null ? 0.0f : oldWordSpacing.floatValue()) + (wordSpacing / childHSCale)));
                    boolean isLastTextRenderer = child == lastChildRenderer;
                    float widthAddition = ((isLastTextRenderer ? ((TextRenderer) child).lineLength() - 1 : ((TextRenderer) child).lineLength()) * characterSpacing) + (((TextRenderer) child).getNumberOfSpaces() * wordSpacing);
                    child.getOccupiedArea().getBBox().setWidth(child.getOccupiedArea().getBBox().getWidth() + widthAddition);
                }
                lastRightPos = childX2 + child.getOccupiedArea().getBBox().getWidth();
                f = f2;
                ratio2 = ratio;
            }
        }
        getOccupiedArea().getBBox().setWidth(width);
    }

    protected int getNumberOfSpaces() {
        int spaces = 0;
        for (IRenderer child : getChildRenderers()) {
            if ((child instanceof TextRenderer) && !FloatingHelper.isRendererFloating(child)) {
                spaces += ((TextRenderer) child).getNumberOfSpaces();
            }
        }
        return spaces;
    }

    protected int length() {
        int length = 0;
        for (IRenderer child : getChildRenderers()) {
            if ((child instanceof TextRenderer) && !FloatingHelper.isRendererFloating(child)) {
                length += ((TextRenderer) child).lineLength();
            }
        }
        return length;
    }

    protected int baseCharactersCount() {
        int count = 0;
        for (IRenderer child : getChildRenderers()) {
            if ((child instanceof TextRenderer) && !FloatingHelper.isRendererFloating(child)) {
                count += ((TextRenderer) child).baseCharactersCount();
            }
        }
        return count;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (IRenderer renderer : getChildRenderers()) {
            sb.append(renderer.toString());
        }
        return sb.toString();
    }

    protected LineRenderer createSplitRenderer() {
        return (LineRenderer) getNextRenderer();
    }

    protected LineRenderer createOverflowRenderer() {
        return (LineRenderer) getNextRenderer();
    }

    protected LineRenderer[] split() {
        LineRenderer splitRenderer = createSplitRenderer();
        splitRenderer.occupiedArea = this.occupiedArea.mo7332clone();
        splitRenderer.parent = this.parent;
        splitRenderer.maxAscent = this.maxAscent;
        splitRenderer.maxDescent = this.maxDescent;
        splitRenderer.maxTextAscent = this.maxTextAscent;
        splitRenderer.maxTextDescent = this.maxTextDescent;
        splitRenderer.maxBlockAscent = this.maxBlockAscent;
        splitRenderer.maxBlockDescent = this.maxBlockDescent;
        splitRenderer.levels = this.levels;
        splitRenderer.addAllProperties(getOwnProperties());
        LineRenderer overflowRenderer = createOverflowRenderer();
        overflowRenderer.parent = this.parent;
        overflowRenderer.addAllProperties(getOwnProperties());
        return new LineRenderer[]{splitRenderer, overflowRenderer};
    }

    protected LineRenderer adjustChildrenYLine() {
        if (RenderingMode.HTML_MODE == getProperty(Property.RENDERING_MODE) && hasInlineBlocksWithVerticalAlignment()) {
            InlineVerticalAlignmentHelper.adjustChildrenYLineHtmlMode(this);
        } else {
            adjustChildrenYLineDefaultMode();
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void applyLeading(float deltaY) {
        this.occupiedArea.getBBox().moveUp(deltaY);
        this.occupiedArea.getBBox().decreaseHeight(deltaY);
        for (IRenderer child : getChildRenderers()) {
            if (!FloatingHelper.isRendererFloating(child)) {
                child.move(0.0f, deltaY);
            }
        }
    }

    protected LineRenderer trimLast() {
        int lastIndex = getChildRenderers().size();
        IRenderer lastRenderer = null;
        do {
            lastIndex--;
            if (lastIndex < 0) {
                break;
            }
            IRenderer lastRenderer2 = getChildRenderers().get(lastIndex);
            lastRenderer = lastRenderer2;
        } while (FloatingHelper.isRendererFloating(lastRenderer));
        if ((lastRenderer instanceof TextRenderer) && lastIndex >= 0) {
            float trimmedSpace = ((TextRenderer) lastRenderer).trimLast();
            this.occupiedArea.getBBox().setWidth(this.occupiedArea.getBBox().getWidth() - trimmedSpace);
        }
        return this;
    }

    public boolean containsImage() {
        for (IRenderer renderer : getChildRenderers()) {
            if (renderer instanceof ImageRenderer) {
                return true;
            }
        }
        return false;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        LineLayoutResult result = (LineLayoutResult) layout(new LayoutContext(new LayoutArea(1, new Rectangle(MinMaxWidthUtils.getInfWidth(), 1000000.0f))));
        return result.getMinMaxWidth();
    }

    boolean hasChildRendererInHtmlMode() {
        for (IRenderer childRenderer : getChildRenderers()) {
            if (RenderingMode.HTML_MODE.equals(childRenderer.getProperty(Property.RENDERING_MODE))) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getTopLeadingIndent(Leading leading) {
        switch (leading.getType()) {
            case 1:
                float textDescent = leading.getValue();
                return (Math.max(textDescent, this.maxBlockAscent - this.maxBlockDescent) - this.occupiedArea.getBBox().getHeight()) / 2.0f;
            case 2:
                UnitValue fontSize = (UnitValue) getProperty(24, UnitValue.createPointValue(0.0f));
                if (!fontSize.isPointValue()) {
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
                }
                float textAscent = (this.maxTextAscent != 0.0f || this.maxTextDescent != 0.0f || Math.abs(this.maxAscent) + Math.abs(this.maxDescent) == 0.0f || containsImage()) ? this.maxTextAscent : fontSize.getValue() * 0.8f;
                float textDescent2 = (this.maxTextAscent != 0.0f || this.maxTextDescent != 0.0f || Math.abs(this.maxAscent) + Math.abs(this.maxDescent) == 0.0f || containsImage()) ? this.maxTextDescent : (-fontSize.getValue()) * 0.2f;
                return Math.max((((textAscent - textDescent2) * (leading.getValue() - 1.0f)) / 2.0f) + textAscent, this.maxBlockAscent) - this.maxAscent;
            default:
                throw new IllegalStateException();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getBottomLeadingIndent(Leading leading) {
        switch (leading.getType()) {
            case 1:
                return (Math.max(leading.getValue(), this.maxBlockAscent - this.maxBlockDescent) - this.occupiedArea.getBBox().getHeight()) / 2.0f;
            case 2:
                UnitValue fontSize = (UnitValue) getProperty(24, UnitValue.createPointValue(0.0f));
                if (!fontSize.isPointValue()) {
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
                }
                float textAscent = (this.maxTextAscent == 0.0f && this.maxTextDescent == 0.0f && !containsImage()) ? fontSize.getValue() * 0.8f : this.maxTextAscent;
                float textDescent = (this.maxTextAscent == 0.0f && this.maxTextDescent == 0.0f && !containsImage()) ? (-fontSize.getValue()) * 0.2f : this.maxTextDescent;
                return Math.max((-textDescent) + (((textAscent - textDescent) * (leading.getValue() - 1.0f)) / 2.0f), -this.maxBlockDescent) + this.maxDescent;
            default:
                throw new IllegalStateException();
        }
    }

    static LineSplitIntoGlyphsData splitLineIntoGlyphs(LineRenderer toSplit) {
        LineSplitIntoGlyphsData result = new LineSplitIntoGlyphsData();
        boolean newLineFound = false;
        TextRenderer lastTextRenderer = null;
        for (IRenderer child : toSplit.getChildRenderers()) {
            if (newLineFound) {
                break;
            } else if (child instanceof TextRenderer) {
                GlyphLine childLine = ((TextRenderer) child).line;
                int i = childLine.start;
                while (true) {
                    if (i >= childLine.end) {
                        break;
                    } else if (TextUtil.isNewLine(childLine.get(i))) {
                        newLineFound = true;
                        break;
                    } else {
                        result.addLineGlyph(new RendererGlyph(childLine.get(i), (TextRenderer) child));
                        i++;
                    }
                }
                lastTextRenderer = (TextRenderer) child;
            } else {
                result.addInsertAfter(lastTextRenderer, child);
            }
        }
        return result;
    }

    static void reorder(LineRenderer toProcess, LineSplitIntoGlyphsData splitLineIntoGlyphsResult, int[] newOrder) {
        toProcess.setChildRenderers(splitLineIntoGlyphsResult.getStarterNonTextRenderers());
        List<RendererGlyph> lineGlyphs = splitLineIntoGlyphsResult.getLineGlyphs();
        int initialPos = 0;
        while (true) {
            int offset = initialPos;
            if (offset < lineGlyphs.size()) {
                TextRenderer renderer = lineGlyphs.get(offset).renderer;
                TextRenderer newRenderer = new TextRenderer(renderer).removeReversedRanges();
                toProcess.addChildRenderer(newRenderer);
                toProcess.addAllChildRenderers(splitLineIntoGlyphsResult.getInsertAfterAndRemove(renderer));
                newRenderer.line = new GlyphLine(newRenderer.line);
                List<Glyph> replacementGlyphs = new ArrayList<>();
                boolean reversed = false;
                for (int pos = offset; pos < lineGlyphs.size() && lineGlyphs.get(pos).renderer == renderer; pos++) {
                    replacementGlyphs.add(lineGlyphs.get(pos).glyph);
                    if (pos + 1 < lineGlyphs.size() && lineGlyphs.get(pos + 1).renderer == renderer && newOrder[pos] == newOrder[pos + 1] + 1 && !TextUtil.isSpaceOrWhitespace(lineGlyphs.get(pos + 1).glyph) && !TextUtil.isSpaceOrWhitespace(lineGlyphs.get(pos).glyph)) {
                        reversed = true;
                    } else {
                        if (reversed) {
                            newRenderer.initReversedRanges().add(new int[]{initialPos - offset, pos - offset});
                            reversed = false;
                        }
                        initialPos = pos + 1;
                    }
                }
                newRenderer.line.setGlyphs(replacementGlyphs);
            } else {
                return;
            }
        }
    }

    static void adjustChildPositionsAfterReordering(List<IRenderer> children, float initialXPos) {
        float currentWidth;
        float currentXPos = initialXPos;
        for (IRenderer child : children) {
            if (!FloatingHelper.isRendererFloating(child)) {
                if (child instanceof TextRenderer) {
                    float currentWidth2 = ((TextRenderer) child).calculateLineWidth();
                    UnitValue[] margins = ((TextRenderer) child).getMargins();
                    if (!margins[1].isPointValue() && logger.isErrorEnabled()) {
                        logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, "right margin"));
                    }
                    if (!margins[3].isPointValue() && logger.isErrorEnabled()) {
                        logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, "left margin"));
                    }
                    UnitValue[] paddings = ((TextRenderer) child).getPaddings();
                    if (!paddings[1].isPointValue() && logger.isErrorEnabled()) {
                        logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, "right padding"));
                    }
                    if (!paddings[3].isPointValue() && logger.isErrorEnabled()) {
                        logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, "left padding"));
                    }
                    currentWidth = currentWidth2 + margins[1].getValue() + margins[3].getValue() + paddings[1].getValue() + paddings[3].getValue();
                    ((TextRenderer) child).occupiedArea.getBBox().setX(currentXPos).setWidth(currentWidth);
                } else {
                    currentWidth = child.getOccupiedArea().getBBox().getWidth();
                    child.move(currentXPos - child.getOccupiedArea().getBBox().getX(), 0.0f);
                }
                currentXPos += currentWidth;
            }
        }
    }

    private LineRenderer[] splitNotFittingFloat(int childPos, LayoutResult childResult) {
        LineRenderer[] split = split();
        split[0].addAllChildRenderers(getChildRenderers().subList(0, childPos));
        split[0].addChildRenderer(childResult.getSplitRenderer());
        split[1].addChildRenderer(childResult.getOverflowRenderer());
        split[1].addAllChildRenderers(getChildRenderers().subList(childPos + 1, getChildRenderers().size()));
        return split;
    }

    private void adjustLineOnFloatPlaced(Rectangle layoutBox, int childPos, FloatPropertyValue kidFloatPropertyVal, Rectangle justPlacedFloatBox) {
        if (justPlacedFloatBox.getBottom() >= layoutBox.getTop() || justPlacedFloatBox.getTop() < layoutBox.getTop()) {
            return;
        }
        float floatWidth = justPlacedFloatBox.getWidth();
        if (kidFloatPropertyVal.equals(FloatPropertyValue.LEFT)) {
            layoutBox.setWidth(layoutBox.getWidth() - floatWidth).moveRight(floatWidth);
            this.occupiedArea.getBBox().moveRight(floatWidth);
            for (int i = 0; i < childPos; i++) {
                IRenderer prevChild = getChildRenderers().get(i);
                if (!FloatingHelper.isRendererFloating(prevChild)) {
                    prevChild.move(floatWidth, 0.0f);
                }
            }
            return;
        }
        layoutBox.setWidth(layoutBox.getWidth() - floatWidth);
    }

    private void replaceSplitRendererKidFloats(Map<Integer, IRenderer> floatsToNextPageSplitRenderers, LineRenderer splitRenderer) {
        for (Map.Entry<Integer, IRenderer> splitFloat : floatsToNextPageSplitRenderers.entrySet()) {
            if (splitFloat.getValue() != null) {
                splitRenderer.setChildRenderer(splitFloat.getKey().intValue(), splitFloat.getValue());
            } else {
                splitRenderer.setChildRenderer(splitFloat.getKey().intValue(), null);
            }
        }
        for (int i = splitRenderer.getChildRenderers().size() - 1; i >= 0; i--) {
            if (splitRenderer.getChildRenderers().get(i) == null) {
                splitRenderer.removeChildRenderer(i);
            }
        }
    }

    private IRenderer getLastNonFloatChildRenderer() {
        for (int i = getChildRenderers().size() - 1; i >= 0; i--) {
            IRenderer current = getChildRenderers().get(i);
            if (!FloatingHelper.isRendererFloating(current)) {
                return current;
            }
        }
        return null;
    }

    private TabStop getNextTabStop(float curWidth) {
        NavigableMap<Float, TabStop> tabStops = (NavigableMap) getProperty(69);
        Map.Entry<Float, TabStop> nextTabStopEntry = null;
        if (tabStops != null) {
            nextTabStopEntry = tabStops.higherEntry(Float.valueOf(curWidth));
        }
        if (nextTabStopEntry == null) {
            return null;
        }
        TabStop nextTabStop = nextTabStopEntry.getValue();
        return nextTabStop;
    }

    private TabStop calculateTab(IRenderer childRenderer, float curWidth, float lineWidth) {
        TabStop nextTabStop = getNextTabStop(curWidth);
        if (nextTabStop == null) {
            processDefaultTab(childRenderer, curWidth, lineWidth);
            return null;
        }
        childRenderer.setProperty(68, nextTabStop.getTabLeader());
        childRenderer.setProperty(77, UnitValue.createPointValue(nextTabStop.getTabPosition() - curWidth));
        childRenderer.setProperty(85, UnitValue.createPointValue(this.maxAscent - this.maxDescent));
        if (nextTabStop.getTabAlignment() == TabAlignment.LEFT) {
            return null;
        }
        return nextTabStop;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0063  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private float calculateTab(com.itextpdf.kernel.geom.Rectangle r9, float r10, com.itextpdf.layout.element.TabStop r11, java.util.List<com.itextpdf.layout.renderer.IRenderer> r12, com.itextpdf.layout.renderer.IRenderer r13) {
        /*
            r8 = this;
            r0 = 0
            java.util.Iterator r1 = r12.iterator()
        L5:
            boolean r2 = r1.hasNext()
            if (r2 == 0) goto L1f
            java.lang.Object r2 = r1.next()
            com.itextpdf.layout.renderer.IRenderer r2 = (com.itextpdf.layout.renderer.IRenderer) r2
            com.itextpdf.layout.layout.LayoutArea r3 = r2.getOccupiedArea()
            com.itextpdf.kernel.geom.Rectangle r3 = r3.getBBox()
            float r3 = r3.getWidth()
            float r0 = r0 + r3
            goto L5
        L1f:
            r1 = 0
            int[] r2 = com.itextpdf.layout.renderer.LineRenderer.AnonymousClass1.$SwitchMap$com$itextpdf$layout$properties$TabAlignment
            com.itextpdf.layout.properties.TabAlignment r3 = r11.getTabAlignment()
            int r3 = r3.ordinal()
            r2 = r2[r3]
            switch(r2) {
                case 1: goto L79;
                case 2: goto L6d;
                case 3: goto L30;
                default: goto L2f;
            }
        L2f:
            goto L81
        L30:
            r2 = -1082130432(0xffffffffbf800000, float:-1.0)
            r3 = 0
            java.util.Iterator r4 = r12.iterator()
        L37:
            boolean r5 = r4.hasNext()
            r6 = -1082130432(0xffffffffbf800000, float:-1.0)
            if (r5 == 0) goto L5f
            java.lang.Object r5 = r4.next()
            com.itextpdf.layout.renderer.IRenderer r5 = (com.itextpdf.layout.renderer.IRenderer) r5
            r7 = r5
            com.itextpdf.layout.renderer.TextRenderer r7 = (com.itextpdf.layout.renderer.TextRenderer) r7
            float r2 = r7.getTabAnchorCharacterPosition()
            int r7 = (r6 > r2 ? 1 : (r6 == r2 ? 0 : -1))
            if (r7 == 0) goto L51
            goto L5f
        L51:
            com.itextpdf.layout.layout.LayoutArea r6 = r5.getOccupiedArea()
            com.itextpdf.kernel.geom.Rectangle r6 = r6.getBBox()
            float r6 = r6.getWidth()
            float r3 = r3 + r6
            goto L37
        L5f:
            int r4 = (r2 > r6 ? 1 : (r2 == r6 ? 0 : -1))
            if (r4 != 0) goto L64
            r2 = 0
        L64:
            float r4 = r11.getTabPosition()
            float r4 = r4 - r10
            float r4 = r4 - r2
            float r1 = r4 - r3
            goto L81
        L6d:
            float r2 = r11.getTabPosition()
            float r2 = r2 - r10
            r3 = 1073741824(0x40000000, float:2.0)
            float r3 = r0 / r3
            float r1 = r2 - r3
            goto L81
        L79:
            float r2 = r11.getTabPosition()
            float r2 = r2 - r10
            float r1 = r2 - r0
        L81:
            r2 = 0
            int r2 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            if (r2 >= 0) goto L87
            r1 = 0
        L87:
            float r2 = r10 + r1
            float r2 = r2 + r0
            float r3 = r9.getWidth()
            int r2 = (r2 > r3 ? 1 : (r2 == r3 ? 0 : -1))
            if (r2 <= 0) goto L9b
            float r2 = r10 + r0
            float r2 = r2 + r1
            float r3 = r9.getWidth()
            float r2 = r2 - r3
            float r1 = r1 - r2
        L9b:
            r2 = 77
            com.itextpdf.layout.properties.UnitValue r3 = com.itextpdf.layout.properties.UnitValue.createPointValue(r1)
            r13.setProperty(r2, r3)
            float r2 = r8.maxAscent
            float r3 = r8.maxDescent
            float r2 = r2 - r3
            com.itextpdf.layout.properties.UnitValue r2 = com.itextpdf.layout.properties.UnitValue.createPointValue(r2)
            r3 = 85
            r13.setProperty(r3, r2)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.LineRenderer.calculateTab(com.itextpdf.kernel.geom.Rectangle, float, com.itextpdf.layout.element.TabStop, java.util.List, com.itextpdf.layout.renderer.IRenderer):float");
    }

    private void processDefaultTab(IRenderer tabRenderer, float curWidth, float lineWidth) {
        Float tabDefault = getPropertyAsFloat(67);
        Float tabWidth = Float.valueOf(tabDefault.floatValue() - (curWidth % tabDefault.floatValue()));
        if (tabWidth.floatValue() + curWidth > lineWidth) {
            tabWidth = Float.valueOf(lineWidth - curWidth);
        }
        tabRenderer.setProperty(77, UnitValue.createPointValue(tabWidth.floatValue()));
        tabRenderer.setProperty(85, UnitValue.createPointValue(this.maxAscent - this.maxDescent));
    }

    private void updateChildrenParent() {
        for (IRenderer renderer : getChildRenderers()) {
            renderer.setParent(this);
        }
    }

    int trimFirst() {
        boolean trimFinished;
        int totalNumberOfTrimmedGlyphs = 0;
        for (IRenderer renderer : getChildRenderers()) {
            if (!FloatingHelper.isRendererFloating(renderer)) {
                if (renderer instanceof TextRenderer) {
                    TextRenderer textRenderer = (TextRenderer) renderer;
                    GlyphLine currentText = textRenderer.getText();
                    if (currentText != null) {
                        int prevTextStart = currentText.start;
                        textRenderer.trimFirst();
                        int numOfTrimmedGlyphs = textRenderer.getText().start - prevTextStart;
                        totalNumberOfTrimmedGlyphs += numOfTrimmedGlyphs;
                    }
                    int prevTextStart2 = textRenderer.length();
                    trimFinished = prevTextStart2 > 0;
                } else {
                    trimFinished = true;
                }
                if (trimFinished) {
                    break;
                }
            }
        }
        return totalNumberOfTrimmedGlyphs;
    }

    private BaseDirection applyOtf() {
        BaseDirection baseDirection = (BaseDirection) getProperty(7);
        for (IRenderer renderer : getChildRenderers()) {
            if (renderer instanceof TextRenderer) {
                ((TextRenderer) renderer).applyOtf();
                if (baseDirection == null || baseDirection == BaseDirection.NO_BIDI) {
                    baseDirection = (BaseDirection) renderer.getOwnProperty(7);
                }
            }
        }
        return baseDirection;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isChildFloating(IRenderer childRenderer) {
        FloatPropertyValue kidFloatPropertyVal = (FloatPropertyValue) childRenderer.getProperty(99);
        return (childRenderer instanceof AbstractRenderer) && FloatingHelper.isRendererFloating(childRenderer, kidFloatPropertyVal);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isInlineBlockChild(IRenderer child) {
        return (child instanceof BlockRenderer) || (child instanceof TableRenderer);
    }

    boolean isForceOverflowForTextRendererPartialResult(IRenderer childRenderer, boolean wasXOverflowChanged, OverflowPropertyValue oldXOverflow, LayoutContext layoutContext, Rectangle layoutBox, boolean wasParentsHeightClipped) {
        if (wasXOverflowChanged) {
            setProperty(103, oldXOverflow);
        }
        LayoutResult newLayoutResult = childRenderer.layout(new LayoutContext(new LayoutArea(layoutContext.getArea().getPageNumber(), layoutBox), wasParentsHeightClipped));
        if (wasXOverflowChanged) {
            setProperty(103, OverflowPropertyValue.FIT);
        }
        return (newLayoutResult instanceof TextLayoutResult) && !((TextLayoutResult) newLayoutResult).isWordHasBeenSplit();
    }

    float[] getAscentDescentOfLayoutedChildRenderer(IRenderer childRenderer, LayoutResult childResult, RenderingMode childRenderingMode, boolean isInlineBlockChild) {
        float childAscent = 0.0f;
        float childDescent = 0.0f;
        if ((childRenderer instanceof ILeafElementRenderer) && childResult.getStatus() != 3) {
            if (RenderingMode.HTML_MODE == childRenderingMode && (childRenderer instanceof TextRenderer)) {
                return LineHeightHelper.getActualAscenderDescender((TextRenderer) childRenderer);
            }
            childAscent = ((ILeafElementRenderer) childRenderer).getAscent();
            childDescent = ((ILeafElementRenderer) childRenderer).getDescent();
        } else if (isInlineBlockChild && childResult.getStatus() != 3) {
            if (childRenderer instanceof AbstractRenderer) {
                Float yLine = ((AbstractRenderer) childRenderer).getLastYLineRecursively();
                if (yLine == null) {
                    childAscent = childRenderer.getOccupiedArea().getBBox().getHeight();
                } else {
                    float childAscent2 = childRenderer.getOccupiedArea().getBBox().getTop() - yLine.floatValue();
                    childDescent = -(yLine.floatValue() - childRenderer.getOccupiedArea().getBBox().getBottom());
                    childAscent = childAscent2;
                }
            } else {
                childAscent = childRenderer.getOccupiedArea().getBBox().getHeight();
            }
        }
        return new float[]{childAscent, childDescent};
    }

    float[] updateAscentDescentAfterTextRendererSequenceProcessing(int newChildPos, LineAscentDescentState lineAscentDescentStateBeforeTextRendererSequence, Map<Integer, float[]> textRendererSequenceAscentDescent) {
        float maxAscentUpdated = lineAscentDescentStateBeforeTextRendererSequence.maxAscent;
        float maxDescentUpdated = lineAscentDescentStateBeforeTextRendererSequence.maxDescent;
        float maxTextAscentUpdated = lineAscentDescentStateBeforeTextRendererSequence.maxTextAscent;
        float maxTextDescentUpdated = lineAscentDescentStateBeforeTextRendererSequence.maxTextDescent;
        for (Map.Entry<Integer, float[]> childAscentDescent : textRendererSequenceAscentDescent.entrySet()) {
            if (childAscentDescent.getKey().intValue() <= newChildPos) {
                maxAscentUpdated = Math.max(maxAscentUpdated, childAscentDescent.getValue()[0]);
                maxDescentUpdated = Math.min(maxDescentUpdated, childAscentDescent.getValue()[1]);
                maxTextAscentUpdated = Math.max(maxTextAscentUpdated, childAscentDescent.getValue()[0]);
                maxTextDescentUpdated = Math.min(maxTextDescentUpdated, childAscentDescent.getValue()[1]);
            }
        }
        this.maxAscent = maxAscentUpdated;
        this.maxDescent = maxDescentUpdated;
        this.maxTextAscent = maxTextAscentUpdated;
        this.maxTextDescent = maxTextDescentUpdated;
        return new float[]{this.maxAscent, this.maxDescent};
    }

    void updateAscentDescentAfterChildLayout(float[] childAscentDescent, IRenderer childRenderer, boolean isChildFloating) {
        float childAscent = childAscentDescent[0];
        float childDescent = childAscentDescent[1];
        this.maxAscent = Math.max(this.maxAscent, childAscent);
        if (childRenderer instanceof TextRenderer) {
            this.maxTextAscent = Math.max(this.maxTextAscent, childAscent);
        } else if (!isChildFloating) {
            this.maxBlockAscent = Math.max(this.maxBlockAscent, childAscent);
        }
        this.maxDescent = Math.min(this.maxDescent, childDescent);
        if (childRenderer instanceof TextRenderer) {
            this.maxTextDescent = Math.min(this.maxTextDescent, childDescent);
        } else if (!isChildFloating) {
            this.maxBlockDescent = Math.min(this.maxBlockDescent, childDescent);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void updateBidiLevels(int totalNumberOfTrimmedGlyphs, BaseDirection baseDirection) {
        if (totalNumberOfTrimmedGlyphs != 0 && this.levels != null) {
            this.levels = Arrays.copyOfRange(this.levels, totalNumberOfTrimmedGlyphs, this.levels.length);
        }
        if (this.levels == null && baseDirection != null && baseDirection != BaseDirection.NO_BIDI) {
            List<Integer> unicodeIdsReorderingList = new ArrayList<>();
            boolean newLineFound = false;
            for (IRenderer child : getChildRenderers()) {
                if (newLineFound) {
                    break;
                } else if (child instanceof TextRenderer) {
                    GlyphLine text = ((TextRenderer) child).getText();
                    int i = text.start;
                    while (true) {
                        if (i < text.end) {
                            Glyph glyph = text.get(i);
                            if (TextUtil.isNewLine(glyph)) {
                                newLineFound = true;
                                break;
                            }
                            int unicode = glyph.hasValidUnicode() ? glyph.getUnicode() : glyph.getUnicodeChars()[0];
                            unicodeIdsReorderingList.add(Integer.valueOf(unicode));
                            i++;
                        }
                    }
                }
            }
            if (unicodeIdsReorderingList.size() > 0) {
                PdfDocument pdfDocument = getPdfDocument();
                SequenceId sequenceId = pdfDocument == null ? null : pdfDocument.getDocumentIdWrapper();
                MetaInfoContainer metaInfoContainer = (MetaInfoContainer) getProperty(Property.META_INFO);
                IMetaInfo metaInfo = metaInfoContainer != null ? metaInfoContainer.getMetaInfo() : null;
                this.levels = TypographyUtils.getBidiLevels(baseDirection, ArrayUtil.toIntArray(unicodeIdsReorderingList), sequenceId, metaInfo);
                return;
            }
            this.levels = null;
        }
    }

    private void resolveChildrenFonts() {
        List<IRenderer> newChildRenderers = new ArrayList<>(getChildRenderers().size());
        boolean updateChildRenderers = false;
        for (IRenderer child : getChildRenderers()) {
            if (child instanceof TextRenderer) {
                if (((TextRenderer) child).resolveFonts(newChildRenderers)) {
                    updateChildRenderers = true;
                }
            } else {
                newChildRenderers.add(child);
            }
        }
        if (updateChildRenderers) {
            setChildRenderers(newChildRenderers);
        }
    }

    private float decreaseRelativeWidthByChildAdditionalWidth(IRenderer childRenderer, float normalizedChildWidth) {
        if (childRenderer instanceof AbstractRenderer) {
            Rectangle dummyRect = new Rectangle(normalizedChildWidth, 0.0f);
            ((AbstractRenderer) childRenderer).applyMargins(dummyRect, false);
            if (!isBorderBoxSizing(childRenderer)) {
                ((AbstractRenderer) childRenderer).applyBorderBox(dummyRect, false);
                ((AbstractRenderer) childRenderer).applyPaddings(dummyRect, false);
            }
            return dummyRect.getWidth();
        }
        return normalizedChildWidth;
    }

    private void adjustChildrenYLineDefaultMode() {
        float actualYLine = (this.occupiedArea.getBBox().getY() + this.occupiedArea.getBBox().getHeight()) - this.maxAscent;
        for (IRenderer renderer : getChildRenderers()) {
            if (!FloatingHelper.isRendererFloating(renderer)) {
                if (renderer instanceof ILeafElementRenderer) {
                    float descent = ((ILeafElementRenderer) renderer).getDescent();
                    renderer.move(0.0f, (actualYLine - renderer.getOccupiedArea().getBBox().getBottom()) + descent);
                } else {
                    Float yLine = (isInlineBlockChild(renderer) && (renderer instanceof AbstractRenderer)) ? ((AbstractRenderer) renderer).getLastYLineRecursively() : null;
                    renderer.move(0.0f, actualYLine - (yLine == null ? renderer.getOccupiedArea().getBBox().getBottom() : yLine.floatValue()));
                }
            }
        }
    }

    private boolean hasInlineBlocksWithVerticalAlignment() {
        for (IRenderer child : getChildRenderers()) {
            if (child.hasProperty(Property.INLINE_VERTICAL_ALIGNMENT) && InlineVerticalAlignmentType.BASELINE != ((InlineVerticalAlignment) child.getProperty(Property.INLINE_VERTICAL_ALIGNMENT)).getType()) {
                return true;
            }
        }
        return false;
    }

    /* loaded from: classes12.dex */
    public static class RendererGlyph {
        public Glyph glyph;
        public TextRenderer renderer;

        public RendererGlyph(Glyph glyph, TextRenderer textRenderer) {
            this.glyph = glyph;
            this.renderer = textRenderer;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class LineAscentDescentState {
        float maxAscent;
        float maxDescent;
        float maxTextAscent;
        float maxTextDescent;

        /* JADX INFO: Access modifiers changed from: package-private */
        public LineAscentDescentState(float maxAscent, float maxDescent, float maxTextAscent, float maxTextDescent) {
            this.maxAscent = maxAscent;
            this.maxDescent = maxDescent;
            this.maxTextAscent = maxTextAscent;
            this.maxTextDescent = maxTextDescent;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class LineSplitIntoGlyphsData {
        private final List<RendererGlyph> lineGlyphs = new ArrayList();
        private final Map<TextRenderer, List<IRenderer>> insertAfter = new HashMap();
        private final List<IRenderer> starterNonTextRenderers = new ArrayList();

        public List<RendererGlyph> getLineGlyphs() {
            return this.lineGlyphs;
        }

        public List<IRenderer> getInsertAfterAndRemove(TextRenderer afterRenderer) {
            return this.insertAfter.remove(afterRenderer);
        }

        public List<IRenderer> getStarterNonTextRenderers() {
            return this.starterNonTextRenderers;
        }

        public void addLineGlyph(RendererGlyph glyph) {
            this.lineGlyphs.add(glyph);
        }

        public void addInsertAfter(TextRenderer afterRenderer, IRenderer toInsert) {
            if (afterRenderer == null) {
                this.starterNonTextRenderers.add(toInsert);
                return;
            }
            if (!this.insertAfter.containsKey(afterRenderer)) {
                this.insertAfter.put(afterRenderer, new ArrayList());
            }
            this.insertAfter.get(afterRenderer).add(toInsert);
        }
    }
}
