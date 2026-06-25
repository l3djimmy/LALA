package com.itextpdf.layout.renderer;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.commons.datastructures.Tuple2;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.FontMetrics;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.TrueTypeFont;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.EnumUtil;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfType0Font;
import com.itextpdf.kernel.font.PdfType1Font;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.canvas.CanvasArtifact;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.font.FontCharacteristics;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.font.FontSet;
import com.itextpdf.layout.font.selectorstrategy.IFontSelectorStrategy;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.TextLayoutResult;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.minmaxwidth.MinMaxWidthUtils;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.properties.FontKerning;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.RenderingMode;
import com.itextpdf.layout.properties.TransparentColor;
import com.itextpdf.layout.properties.Underline;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.splitting.BreakAllSplitCharacters;
import com.itextpdf.layout.splitting.ISplitCharacters;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.lang.Character;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class TextRenderer extends AbstractRenderer implements ILeafElementRenderer {
    private static final float BOLD_SIMULATION_STROKE_COEFF = 0.033333335f;
    private static final float ITALIC_ANGLE = 0.21256f;
    protected static final float TEXT_SPACE_COEFF = 1000.0f;
    static final float TYPO_ASCENDER_SCALE_COEFF = 1.2f;
    static final int UNDEFINED_FIRST_CHAR_TO_FORCE_OVERFLOW = Integer.MAX_VALUE;
    private PdfFont font;
    private int indexOfFirstCharacterToBeForcedToOverflow;
    protected GlyphLine line;
    protected boolean otfFeaturesApplied;
    protected List<int[]> reversedRanges;
    protected GlyphLine savedWordBreakAtLineEnding;
    private int specialScriptFirstNotFittingIndex;
    private List<Integer> specialScriptsWordBreakPoints;
    protected String strToBeConverted;
    protected float tabAnchorCharacterPosition;
    protected GlyphLine text;
    protected float yLineOffset;

    public TextRenderer(Text textElement) {
        this(textElement, textElement.getText());
    }

    public TextRenderer(Text textElement, String text) {
        super(textElement);
        this.otfFeaturesApplied = false;
        this.tabAnchorCharacterPosition = -1.0f;
        this.specialScriptFirstNotFittingIndex = -1;
        this.indexOfFirstCharacterToBeForcedToOverflow = Integer.MAX_VALUE;
        this.strToBeConverted = text;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TextRenderer(TextRenderer other) {
        super(other);
        this.otfFeaturesApplied = false;
        this.tabAnchorCharacterPosition = -1.0f;
        this.specialScriptFirstNotFittingIndex = -1;
        this.indexOfFirstCharacterToBeForcedToOverflow = Integer.MAX_VALUE;
        this.text = other.text;
        this.line = other.line;
        this.font = other.font;
        this.yLineOffset = other.yLineOffset;
        this.strToBeConverted = other.strToBeConverted;
        this.otfFeaturesApplied = other.otfFeaturesApplied;
        this.tabAnchorCharacterPosition = other.tabAnchorCharacterPosition;
        this.reversedRanges = other.reversedRanges;
        this.specialScriptsWordBreakPoints = other.specialScriptsWordBreakPoints;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x03df, code lost:
        if ((r14 + 1) < r88.indexOfFirstCharacterToBeForcedToOverflow) goto L254;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x03e1, code lost:
        r10 = r71;
        r47 = r5;
        r75 = r6;
        r5 = r28;
        r74 = r30;
        r77 = r50;
        r14 = r54;
        r1 = r61;
        r2 = r62;
        r3 = r63;
        r6 = r73;
        r28 = r26;
        r30 = r27;
        r26 = r13;
        r27 = r25;
        r13 = r42;
        r42 = r70;
        r25 = r15;
        r15 = r34;
        r34 = r12;
        r12 = r35;
        r35 = r11;
        r11 = r44;
        r44 = r7;
        r7 = r71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x0415, code lost:
        r60 = r14;
        r47 = r5;
        r75 = r6;
        r5 = r28;
        r74 = r30;
        r77 = r50;
        r14 = r54;
        r1 = r61;
        r2 = r62;
        r3 = r63;
        r6 = r73;
        r28 = r26;
        r30 = r27;
        r26 = r13;
        r27 = r25;
        r13 = r42;
        r42 = r70;
        r25 = r15;
        r15 = r34;
        r34 = r12;
        r12 = r35;
        r35 = r11;
        r11 = r44;
        r44 = r7;
        r7 = r71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x04e1, code lost:
        if (r10 != (-1)) goto L357;
     */
    /* JADX WARN: Code restructure failed: missing block: B:201:0x0684, code lost:
        if ((r14 + 1) < r88.indexOfFirstCharacterToBeForcedToOverflow) goto L343;
     */
    /* JADX WARN: Code restructure failed: missing block: B:202:0x0686, code lost:
        if (r2 != false) goto L343;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:0x0688, code lost:
        r10 = r71;
     */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x068b, code lost:
        r60 = r14;
        r1 = r42;
        r42 = r13;
        r13 = r1;
        r14 = r54;
        r1 = r61;
        r2 = r62;
        r3 = r63;
        r7 = r71;
     */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0538  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x05ba  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x05ea  */
    @Override // com.itextpdf.layout.renderer.IRenderer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.itextpdf.layout.layout.LayoutResult layout(com.itextpdf.layout.layout.LayoutContext r89) {
        /*
            Method dump skipped, instructions count: 3596
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.TextRenderer.layout(com.itextpdf.layout.layout.LayoutContext):com.itextpdf.layout.layout.LayoutResult");
    }

    private void increaseYLineOffset(UnitValue[] paddings, Border[] borders, UnitValue[] margins) {
        this.yLineOffset += paddings[0] != null ? paddings[0].getValue() : 0.0f;
        this.yLineOffset += borders[0] != null ? borders[0].getWidth() : 0.0f;
        this.yLineOffset += margins[0] != null ? margins[0].getValue() : 0.0f;
    }

    public void applyOtf() {
        Collection<Character.UnicodeScript> supportedScripts;
        Character.UnicodeScript script;
        int shapingRangeStart;
        updateFontAndText();
        Character.UnicodeScript script2 = (Character.UnicodeScript) getProperty(23);
        if (!this.otfFeaturesApplied && TypographyUtils.isPdfCalligraphAvailable() && this.text.start < this.text.end) {
            PdfDocument pdfDocument = getPdfDocument();
            SequenceId sequenceId = pdfDocument == null ? null : pdfDocument.getDocumentIdWrapper();
            MetaInfoContainer metaInfoContainer = (MetaInfoContainer) getProperty(Property.META_INFO);
            IMetaInfo metaInfo = metaInfoContainer == null ? null : metaInfoContainer.getMetaInfo();
            if (hasOtfFont()) {
                Object typographyConfig = getProperty(Property.TYPOGRAPHY_CONFIG);
                Collection<Character.UnicodeScript> supportedScripts2 = null;
                if (typographyConfig != null) {
                    supportedScripts2 = TypographyUtils.getSupportedScripts(typographyConfig);
                }
                if (supportedScripts2 != null) {
                    supportedScripts = supportedScripts2;
                } else {
                    Collection<Character.UnicodeScript> supportedScripts3 = TypographyUtils.getSupportedScripts();
                    supportedScripts = supportedScripts3;
                }
                List<ScriptRange> scriptsRanges = new ArrayList<>();
                if (script2 != null) {
                    scriptsRanges.add(new ScriptRange(script2, this.text.end));
                } else {
                    ScriptRange currRange = new ScriptRange(null, this.text.end);
                    scriptsRanges.add(currRange);
                    for (int i = this.text.start; i < this.text.end; i++) {
                        int unicode = this.text.get(i).getUnicode();
                        if (unicode > -1) {
                            Character.UnicodeScript glyphScript = Character.UnicodeScript.of(unicode);
                            if (!Character.UnicodeScript.COMMON.equals(glyphScript) && !Character.UnicodeScript.UNKNOWN.equals(glyphScript) && !Character.UnicodeScript.INHERITED.equals(glyphScript) && glyphScript != currRange.script) {
                                if (currRange.script == null) {
                                    currRange.script = glyphScript;
                                } else {
                                    currRange.rangeEnd = i;
                                    ScriptRange currRange2 = new ScriptRange(glyphScript, this.text.end);
                                    scriptsRanges.add(currRange2);
                                    currRange = currRange2;
                                }
                            }
                        }
                    }
                }
                int delta = 0;
                int origTextStart = this.text.start;
                int origTextEnd = this.text.end;
                int shapingRangeStart2 = this.text.start;
                for (ScriptRange scriptsRange : scriptsRanges) {
                    if (scriptsRange.script == null) {
                        script = script2;
                        shapingRangeStart = shapingRangeStart2;
                    } else if (!supportedScripts.contains(EnumUtil.throwIfNull(scriptsRange.script))) {
                        script = script2;
                        shapingRangeStart = shapingRangeStart2;
                    } else {
                        scriptsRange.rangeEnd += delta;
                        this.text.start = shapingRangeStart2;
                        Character.UnicodeScript script3 = script2;
                        this.text.end = scriptsRange.rangeEnd;
                        if ((scriptsRange.script == Character.UnicodeScript.ARABIC || scriptsRange.script == Character.UnicodeScript.HEBREW) && (this.parent instanceof LineRenderer)) {
                            setProperty(7, BaseDirection.DEFAULT_BIDI);
                        }
                        TypographyUtils.applyOtfScript(this.font.getFontProgram(), this.text, scriptsRange.script, typographyConfig, sequenceId, metaInfo);
                        delta += this.text.end - scriptsRange.rangeEnd;
                        shapingRangeStart2 = this.text.end;
                        scriptsRange.rangeEnd = shapingRangeStart2;
                        script2 = script3;
                    }
                    script2 = script;
                    shapingRangeStart2 = shapingRangeStart;
                }
                this.text.start = origTextStart;
                this.text.end = origTextEnd + delta;
            }
            FontKerning fontKerning = (FontKerning) getProperty(22, FontKerning.NO);
            if (fontKerning == FontKerning.YES) {
                TypographyUtils.applyKerning(this.font.getFontProgram(), this.text, sequenceId, metaInfo);
            }
            this.otfFeaturesApplied = true;
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        LayoutTaggingHelper taggingHelper;
        boolean isArtifact;
        TagTreePointer tagPointer;
        Integer textRenderingMode;
        PdfCanvas canvas;
        Float strokeWidth;
        float f;
        TransparentColor fontColor;
        TransparentColor fontColor2;
        float f2;
        TextRenderer textRenderer = this;
        if (textRenderer.occupiedArea == null) {
            Logger logger = LoggerFactory.getLogger(TextRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Drawing won't be performed."));
            return;
        }
        boolean isTagged = drawContext.isTaggingEnabled();
        if (!isTagged) {
            taggingHelper = null;
            isArtifact = false;
            tagPointer = null;
        } else {
            LayoutTaggingHelper taggingHelper2 = (LayoutTaggingHelper) textRenderer.getProperty(108);
            if (taggingHelper2 == null) {
                taggingHelper = taggingHelper2;
                isArtifact = true;
                tagPointer = null;
            } else {
                boolean isArtifact2 = taggingHelper2.isArtifact(textRenderer);
                if (isArtifact2) {
                    taggingHelper = taggingHelper2;
                    isArtifact = isArtifact2;
                    tagPointer = null;
                } else {
                    TagTreePointer tagPointer2 = taggingHelper2.useAutoTaggingPointerAndRememberItsPosition(textRenderer);
                    if (taggingHelper2.createTag(textRenderer, tagPointer2)) {
                        tagPointer2.getProperties().addAttributes(0, AccessibleAttributesApplier.getLayoutAttributes(textRenderer, tagPointer2));
                    }
                    taggingHelper = taggingHelper2;
                    isArtifact = isArtifact2;
                    tagPointer = tagPointer2;
                }
            }
        }
        super.draw(drawContext);
        boolean isRelativePosition = textRenderer.isRelativePosition();
        if (isRelativePosition) {
            textRenderer.applyRelativePositioningTranslation(false);
        }
        float leftBBoxX = textRenderer.getInnerAreaBBox().getX();
        if (textRenderer.line.end > textRenderer.line.start || textRenderer.savedWordBreakAtLineEnding != null) {
            UnitValue fontSize = textRenderer.getPropertyAsUnitValue(24);
            if (!fontSize.isPointValue()) {
                Logger logger2 = LoggerFactory.getLogger(TextRenderer.class);
                logger2.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
            }
            TransparentColor fontColor3 = textRenderer.getPropertyAsTransparentColor(21);
            Integer textRenderingMode2 = (Integer) textRenderer.getProperty(71);
            Float textRise = textRenderer.getPropertyAsFloat(72);
            Float characterSpacing = textRenderer.getPropertyAsFloat(15);
            Float wordSpacing = textRenderer.getPropertyAsFloat(78);
            Float horizontalScaling = (Float) textRenderer.getProperty(29);
            float[] skew = (float[]) textRenderer.getProperty(65);
            boolean italicSimulation = Boolean.TRUE.equals(textRenderer.getPropertyAsBoolean(31));
            boolean boldSimulation = Boolean.TRUE.equals(textRenderer.getPropertyAsBoolean(8));
            Float strokeWidth2 = null;
            if (!boldSimulation) {
                textRenderingMode = textRenderingMode2;
            } else {
                strokeWidth2 = Float.valueOf(fontSize.getValue() / 30.0f);
                textRenderingMode = 2;
            }
            PdfCanvas canvas2 = drawContext.getCanvas();
            if (isTagged) {
                if (isArtifact) {
                    canvas2.openTag(new CanvasArtifact());
                } else {
                    canvas2.openTag(tagPointer.getTagReference());
                }
            }
            beginElementOpacityApplying(drawContext);
            canvas2.saveState().beginText().setFontAndSize(textRenderer.font, fontSize.getValue());
            if (skew != null && skew.length == 2) {
                canvas2.setTextMatrix(1.0f, skew[0], skew[1], 1.0f, leftBBoxX, textRenderer.getYLine());
                strokeWidth = strokeWidth2;
                canvas = canvas2;
            } else if (italicSimulation) {
                canvas2.setTextMatrix(1.0f, 0.0f, ITALIC_ANGLE, 1.0f, leftBBoxX, textRenderer.getYLine());
                Float f3 = strokeWidth2;
                canvas = canvas2;
                strokeWidth = f3;
            } else {
                Float strokeWidth3 = strokeWidth2;
                canvas = canvas2;
                double d = leftBBoxX;
                strokeWidth = strokeWidth3;
                canvas.moveText(d, textRenderer.getYLine());
            }
            if (textRenderingMode.intValue() != 0) {
                canvas.setTextRenderingMode(textRenderingMode.intValue());
            }
            float f4 = 1.0f;
            if (textRenderingMode.intValue() == 1 || textRenderingMode.intValue() == 2) {
                if (strokeWidth == null) {
                    strokeWidth = textRenderer.getPropertyAsFloat(64);
                }
                if (strokeWidth != null && strokeWidth.floatValue() != 1.0f) {
                    canvas.setLineWidth(strokeWidth.floatValue());
                }
                Color strokeColor = textRenderer.getPropertyAsColor(63);
                if (strokeColor == null && fontColor3 != null) {
                    strokeColor = fontColor3.getColor();
                }
                if (strokeColor != null) {
                    canvas.setStrokeColor(strokeColor);
                }
            }
            if (fontColor3 != null) {
                canvas.setFillColor(fontColor3.getColor());
                fontColor3.applyFillTransparency(canvas);
            }
            if (textRise != null && textRise.floatValue() != 0.0f) {
                canvas.setTextRise(textRise.floatValue());
            }
            if (characterSpacing != null && characterSpacing.floatValue() != 0.0f) {
                canvas.setCharacterSpacing(characterSpacing.floatValue());
            }
            if (wordSpacing == null || wordSpacing.floatValue() == 0.0f) {
                f = 1.0f;
            } else if (textRenderer.font instanceof PdfType0Font) {
                int gInd = textRenderer.line.start;
                while (gInd < textRenderer.line.end) {
                    if (!TextUtil.isUni0020(textRenderer.line.get(gInd))) {
                        f2 = f4;
                    } else {
                        short advance = (short) (FontProgram.convertGlyphSpaceToTextSpace(wordSpacing.floatValue()) / fontSize.getValue());
                        f2 = f4;
                        Glyph copy = new Glyph(textRenderer.line.get(gInd));
                        copy.setXAdvance(advance);
                        textRenderer.line.set(gInd, copy);
                    }
                    gInd++;
                    f4 = f2;
                }
                f = f4;
            } else {
                f = 1.0f;
                canvas.setWordSpacing(wordSpacing.floatValue());
            }
            if (horizontalScaling != null && horizontalScaling.floatValue() != f) {
                canvas.setHorizontalScaling(horizontalScaling.floatValue() * 100.0f);
            }
            GlyphLine.IGlyphLineFilter filter = new CustomGlyphLineFilter();
            boolean appearanceStreamLayout = Boolean.TRUE.equals(textRenderer.getPropertyAsBoolean(82));
            if (textRenderer.getReversedRanges() != null) {
                boolean writeReversedChars = !appearanceStreamLayout;
                ArrayList<Integer> removedIds = new ArrayList<>();
                for (int i = textRenderer.line.start; i < textRenderer.line.end; i++) {
                    if (!filter.accept(textRenderer.line.get(i))) {
                        removedIds.add(Integer.valueOf(i));
                    }
                }
                for (int[] range : textRenderer.getReversedRanges()) {
                    updateRangeBasedOnRemovedCharacters(removedIds, range);
                }
                textRenderer.line = textRenderer.line.filter(filter);
                GlyphLine glyphLine = textRenderer.line;
                if (writeReversedChars) {
                    fontColor = fontColor3;
                    canvas.showText(glyphLine, new ReversedCharsIterator(textRenderer.reversedRanges, textRenderer.line).setUseReversed(true));
                } else {
                    fontColor = fontColor3;
                    canvas.showText(glyphLine);
                }
            } else {
                fontColor = fontColor3;
                if (appearanceStreamLayout) {
                    textRenderer.line.setActualText(textRenderer.line.start, textRenderer.line.end, null);
                }
                canvas.showText(textRenderer.line.filter(filter));
            }
            if (textRenderer.savedWordBreakAtLineEnding != null) {
                canvas.showText(textRenderer.savedWordBreakAtLineEnding);
            }
            canvas.endText().restoreState();
            endElementOpacityApplying(drawContext);
            if (isTagged) {
                canvas.closeTag();
            }
            Object underlines = textRenderer.getProperty(74);
            if (underlines instanceof List) {
                for (Object underline : (List) underlines) {
                    if (!(underline instanceof Underline)) {
                        fontColor2 = fontColor;
                    } else {
                        fontColor2 = fontColor;
                        textRenderer.drawAndTagSingleUnderline(drawContext.isTaggingEnabled(), (Underline) underline, fontColor2, canvas, fontSize.getValue(), italicSimulation ? 0.21256f : 0.0f);
                    }
                    textRenderer = this;
                    fontColor = fontColor2;
                }
                textRenderer = this;
            } else {
                TransparentColor fontColor4 = fontColor;
                if (!(underlines instanceof Underline)) {
                    textRenderer = this;
                } else {
                    textRenderer = this;
                    textRenderer.drawAndTagSingleUnderline(drawContext.isTaggingEnabled(), (Underline) underlines, fontColor4, canvas, fontSize.getValue(), italicSimulation ? 0.21256f : 0.0f);
                }
            }
        }
        if (isRelativePosition) {
            textRenderer.applyRelativePositioningTranslation(false);
        }
        if (isTagged && !isArtifact) {
            if (textRenderer.isLastRendererForModelElement) {
                taggingHelper.finishTaggingHint(textRenderer);
            }
            taggingHelper.restoreAutoTaggingPointerPosition(textRenderer);
        }
    }

    public void trimFirst() {
        updateFontAndText();
        if (this.text != null) {
            while (this.text.start < this.text.end) {
                Glyph glyph = this.text.get(this.text.start);
                if (!TextUtil.isWhitespace(glyph) || TextUtil.isNewLine(glyph)) {
                    break;
                }
                this.text.start++;
            }
        }
        if (textContainsSpecialScriptGlyphs(true) && this.specialScriptsWordBreakPoints.get(0).intValue() == this.text.start) {
            int size = this.specialScriptsWordBreakPoints.size();
            List<Integer> list = this.specialScriptsWordBreakPoints;
            if (size == 1) {
                list.set(0, -1);
            } else {
                list.remove(0);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float trimLast() {
        float trimmedSpace = 0.0f;
        if (this.line.end <= 0) {
            return 0.0f;
        }
        UnitValue fontSize = getPropertyAsUnitValue(24);
        if (!fontSize.isPointValue()) {
            Logger logger = LoggerFactory.getLogger(TextRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
        }
        Float characterSpacing = getPropertyAsFloat(15);
        Float wordSpacing = getPropertyAsFloat(78);
        float hScale = getPropertyAsFloat(29, Float.valueOf(1.0f)).floatValue();
        int firstNonSpaceCharIndex = this.line.end - 1;
        while (firstNonSpaceCharIndex >= this.line.start) {
            Glyph currentGlyph = this.line.get(firstNonSpaceCharIndex);
            if (!TextUtil.isWhitespace(currentGlyph)) {
                break;
            }
            saveWordBreakIfNotYetSaved(currentGlyph);
            float currentCharWidth = FontProgram.convertTextSpaceToGlyphSpace(getCharWidth(currentGlyph, fontSize.getValue(), Float.valueOf(hScale), characterSpacing, wordSpacing));
            float xAdvance = firstNonSpaceCharIndex > this.line.start ? FontProgram.convertTextSpaceToGlyphSpace(scaleXAdvance(this.line.get(firstNonSpaceCharIndex - 1).getXAdvance(), fontSize.getValue(), Float.valueOf(hScale))) : 0.0f;
            trimmedSpace += currentCharWidth - xAdvance;
            this.occupiedArea.getBBox().setWidth(this.occupiedArea.getBBox().getWidth() - currentCharWidth);
            firstNonSpaceCharIndex--;
        }
        this.line.end = firstNonSpaceCharIndex + 1;
        return trimmedSpace;
    }

    @Override // com.itextpdf.layout.renderer.ILeafElementRenderer
    public float getAscent() {
        return this.yLineOffset;
    }

    @Override // com.itextpdf.layout.renderer.ILeafElementRenderer
    public float getDescent() {
        return -((getOccupiedAreaBBox().getHeight() - this.yLineOffset) - getPropertyAsFloat(72).floatValue());
    }

    public float getYLine() {
        return ((this.occupiedArea.getBBox().getY() + this.occupiedArea.getBBox().getHeight()) - this.yLineOffset) - getPropertyAsFloat(72).floatValue();
    }

    public void moveYLineTo(float y) {
        float curYLine = getYLine();
        float delta = y - curYLine;
        this.occupiedArea.getBBox().setY(this.occupiedArea.getBBox().getY() + delta);
    }

    public void setText(String text) {
        this.strToBeConverted = text;
        updateFontAndText();
    }

    public void setText(GlyphLine text, PdfFont font) {
        GlyphLine newText = new GlyphLine(text);
        setProcessedGlyphLineAndFont(TextPreprocessingUtil.replaceSpecialWhitespaceGlyphs(newText, font), font);
    }

    public GlyphLine getText() {
        updateFontAndText();
        return this.text;
    }

    public int length() {
        if (this.text == null) {
            return 0;
        }
        return this.text.end - this.text.start;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public String toString() {
        if (this.line != null) {
            return this.line.toString();
        }
        return null;
    }

    public int charAt(int pos) {
        return this.text.get(this.text.start + pos).getUnicode();
    }

    public float getTabAnchorCharacterPosition() {
        return this.tabAnchorCharacterPosition;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(TextRenderer.class, getClass());
        return new TextRenderer((Text) this.modelElement);
    }

    public static float[] calculateAscenderDescender(PdfFont font) {
        return calculateAscenderDescender(font, RenderingMode.DEFAULT_LAYOUT_MODE);
    }

    public static float[] calculateAscenderDescender(PdfFont font, RenderingMode mode) {
        float ascender;
        float descender;
        FontMetrics fontMetrics = font.getFontProgram().getFontMetrics();
        float usedTypoAscenderScaleCoeff = TYPO_ASCENDER_SCALE_COEFF;
        if (RenderingMode.HTML_MODE.equals(mode) && !(font instanceof PdfType1Font)) {
            usedTypoAscenderScaleCoeff = 1.0f;
        }
        if (fontMetrics.getWinAscender() == 0 || fontMetrics.getWinDescender() == 0 || (fontMetrics.getTypoAscender() == fontMetrics.getWinAscender() && fontMetrics.getTypoDescender() == fontMetrics.getWinDescender())) {
            ascender = fontMetrics.getTypoAscender() * usedTypoAscenderScaleCoeff;
            descender = fontMetrics.getTypoDescender() * usedTypoAscenderScaleCoeff;
        } else {
            ascender = fontMetrics.getWinAscender();
            descender = fontMetrics.getWinDescender();
        }
        return new float[]{ascender, descender};
    }

    List<int[]> getReversedRanges() {
        return this.reversedRanges;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<int[]> initReversedRanges() {
        if (this.reversedRanges == null) {
            this.reversedRanges = new ArrayList();
        }
        return this.reversedRanges;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TextRenderer removeReversedRanges() {
        this.reversedRanges = null;
        return this;
    }

    private TextRenderer[] splitIgnoreFirstNewLine(int currentTextPos) {
        if (TextUtil.isCarriageReturnFollowedByLineFeed(this.text, currentTextPos)) {
            return split(currentTextPos + 2);
        }
        return split(currentTextPos + 1);
    }

    private GlyphLine convertToGlyphLine(String text) {
        return this.font.createGlyphLine(text);
    }

    private boolean hasOtfFont() {
        return (this.font instanceof PdfType0Font) && (this.font.getFontProgram() instanceof TrueTypeFont);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean textContainsSpecialScriptGlyphs(boolean analyzeSpecialScriptsWordBreakPointsOnly) {
        if (this.specialScriptsWordBreakPoints != null) {
            return !this.specialScriptsWordBreakPoints.isEmpty();
        }
        if (analyzeSpecialScriptsWordBreakPointsOnly) {
            return false;
        }
        ISplitCharacters splitCharacters = (ISplitCharacters) getProperty(62);
        if (splitCharacters instanceof BreakAllSplitCharacters) {
            this.specialScriptsWordBreakPoints = new ArrayList();
        }
        for (int i = this.text.start; i < this.text.end; i++) {
            int unicode = this.text.get(i).getUnicode();
            if (unicode > -1) {
                if (codePointIsOfSpecialScript(unicode)) {
                    return true;
                }
            } else {
                char[] chars = this.text.get(i).getChars();
                if (chars != null) {
                    for (char ch : chars) {
                        if (codePointIsOfSpecialScript(ch)) {
                            return true;
                        }
                    }
                    continue;
                } else {
                    continue;
                }
            }
        }
        this.specialScriptsWordBreakPoints = new ArrayList();
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSpecialScriptsWordBreakPoints(List<Integer> specialScriptsWordBreakPoints) {
        this.specialScriptsWordBreakPoints = specialScriptsWordBreakPoints;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<Integer> getSpecialScriptsWordBreakPoints() {
        return this.specialScriptsWordBreakPoints;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSpecialScriptFirstNotFittingIndex(int lastFittingIndex) {
        this.specialScriptFirstNotFittingIndex = lastFittingIndex;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getSpecialScriptFirstNotFittingIndex() {
        return this.specialScriptFirstNotFittingIndex;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setIndexOfFirstCharacterToBeForcedToOverflow(int indexOfFirstCharacterToBeForcedToOverflow) {
        this.indexOfFirstCharacterToBeForcedToOverflow = indexOfFirstCharacterToBeForcedToOverflow;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    protected Rectangle getBackgroundArea(Rectangle occupiedAreaWithMargins) {
        float textRise = getPropertyAsFloat(72).floatValue();
        return occupiedAreaWithMargins.moveUp(textRise).decreaseHeight(textRise);
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

    /* JADX INFO: Access modifiers changed from: protected */
    public int lineLength() {
        if (this.line.end > 0) {
            return this.line.end - this.line.start;
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int baseCharactersCount() {
        int count = 0;
        for (int i = this.line.start; i < this.line.end; i++) {
            Glyph glyph = this.line.get(i);
            if (!glyph.hasPlacement()) {
                count++;
            }
        }
        return count;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public MinMaxWidth getMinMaxWidth() {
        TextLayoutResult result = (TextLayoutResult) layout(new LayoutContext(new LayoutArea(1, new Rectangle(MinMaxWidthUtils.getInfWidth(), 1000000.0f))));
        return result.getMinMaxWidth();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getNumberOfSpaces() {
        if (this.line.end <= 0) {
            return 0;
        }
        int spaces = 0;
        for (int i = this.line.start; i < this.line.end; i++) {
            Glyph currentGlyph = this.line.get(i);
            if (currentGlyph.getUnicode() == 32) {
                spaces++;
            }
        }
        return spaces;
    }

    protected TextRenderer createSplitRenderer() {
        return (TextRenderer) getNextRenderer();
    }

    protected TextRenderer createOverflowRenderer() {
        return (TextRenderer) getNextRenderer();
    }

    protected TextRenderer[] split(int initialOverflowTextPos) {
        TextRenderer splitRenderer = createSplitRenderer();
        GlyphLine newText = new GlyphLine(this.text);
        newText.start = this.text.start;
        newText.end = initialOverflowTextPos;
        splitRenderer.setProcessedGlyphLineAndFont(newText, this.font);
        splitRenderer.line = this.line;
        splitRenderer.occupiedArea = this.occupiedArea.mo7332clone();
        splitRenderer.parent = this.parent;
        splitRenderer.yLineOffset = this.yLineOffset;
        splitRenderer.otfFeaturesApplied = this.otfFeaturesApplied;
        splitRenderer.isLastRendererForModelElement = false;
        splitRenderer.addAllProperties(getOwnProperties());
        TextRenderer overflowRenderer = createOverflowRenderer();
        GlyphLine newText2 = new GlyphLine(this.text);
        newText2.start = initialOverflowTextPos;
        newText2.end = this.text.end;
        overflowRenderer.setProcessedGlyphLineAndFont(newText2, this.font);
        overflowRenderer.otfFeaturesApplied = this.otfFeaturesApplied;
        overflowRenderer.parent = this.parent;
        overflowRenderer.addAllProperties(getOwnProperties());
        if (this.specialScriptsWordBreakPoints != null) {
            if (!this.specialScriptsWordBreakPoints.isEmpty()) {
                if (this.specialScriptsWordBreakPoints.get(0).intValue() != -1) {
                    int splitIndex = findPossibleBreaksSplitPosition(this.specialScriptsWordBreakPoints, initialOverflowTextPos, false);
                    if (splitIndex > -1) {
                        splitRenderer.setSpecialScriptsWordBreakPoints(this.specialScriptsWordBreakPoints.subList(0, splitIndex + 1));
                    } else {
                        List<Integer> split = new ArrayList<>(1);
                        split.add(-1);
                        splitRenderer.setSpecialScriptsWordBreakPoints(split);
                    }
                    if (splitIndex + 1 < this.specialScriptsWordBreakPoints.size()) {
                        overflowRenderer.setSpecialScriptsWordBreakPoints(this.specialScriptsWordBreakPoints.subList(splitIndex + 1, this.specialScriptsWordBreakPoints.size()));
                    } else {
                        List<Integer> split2 = new ArrayList<>(1);
                        split2.add(-1);
                        overflowRenderer.setSpecialScriptsWordBreakPoints(split2);
                    }
                } else {
                    List<Integer> split3 = new ArrayList<>(1);
                    split3.add(-1);
                    splitRenderer.setSpecialScriptsWordBreakPoints(split3);
                    List<Integer> overflow = new ArrayList<>(1);
                    overflow.add(-1);
                    overflowRenderer.setSpecialScriptsWordBreakPoints(overflow);
                }
            } else {
                splitRenderer.setSpecialScriptsWordBreakPoints(new ArrayList());
                overflowRenderer.setSpecialScriptsWordBreakPoints(new ArrayList());
            }
        }
        return new TextRenderer[]{splitRenderer, overflowRenderer};
    }

    protected void drawSingleUnderline(Underline underline, TransparentColor fontStrokeColor, PdfCanvas canvas, float fontSize, float italicAngleTan) {
        TransparentColor underlineColor = underline.getColor() != null ? new TransparentColor(underline.getColor(), underline.getOpacity()) : fontStrokeColor;
        canvas.saveState();
        if (underlineColor != null) {
            canvas.setStrokeColor(underlineColor.getColor());
            underlineColor.applyStrokeTransparency(canvas);
        }
        canvas.setLineCapStyle(underline.getLineCapStyle());
        float underlineThickness = underline.getThickness(fontSize);
        if (underlineThickness != 0.0f) {
            canvas.setLineWidth(underlineThickness);
            float yLine = getYLine();
            float underlineYPosition = underline.getYPosition(fontSize) + yLine;
            float italicWidthSubstraction = 0.5f * fontSize * italicAngleTan;
            Rectangle innerAreaBbox = getInnerAreaBBox();
            canvas.moveTo(innerAreaBbox.getX(), underlineYPosition).lineTo((innerAreaBbox.getX() + innerAreaBbox.getWidth()) - italicWidthSubstraction, underlineYPosition).stroke();
        }
        canvas.restoreState();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public float calculateLineWidth() {
        UnitValue fontSize = getPropertyAsUnitValue(24);
        if (!fontSize.isPointValue()) {
            Logger logger = LoggerFactory.getLogger(TextRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, 24));
        }
        return getGlyphLineWidth(this.line, fontSize.getValue(), getPropertyAsFloat(29, Float.valueOf(1.0f)).floatValue(), getPropertyAsFloat(15), getPropertyAsFloat(78));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean resolveFonts(List<IRenderer> addTo) {
        Object font = getProperty(20);
        if (font instanceof PdfFont) {
            addTo.add(this);
            return false;
        } else if (font instanceof String[]) {
            FontProvider provider = (FontProvider) getProperty(91);
            FontSet fontSet = (FontSet) getProperty(98);
            if (provider.getFontSet().isEmpty() && (fontSet == null || fontSet.isEmpty())) {
                throw new IllegalStateException(LayoutExceptionMessageConstant.FONT_PROVIDER_NOT_SET_FONT_FAMILY_NOT_RESOLVED);
            }
            if (this.strToBeConverted == null || this.strToBeConverted.isEmpty()) {
                addTo.add(this);
                return true;
            }
            FontCharacteristics fc = createFontCharacteristics();
            IFontSelectorStrategy strategy = provider.createFontSelectorStrategy(Arrays.asList((String[]) font), fc, fontSet);
            List<Tuple2<GlyphLine, PdfFont>> subTextWithFont = strategy.getGlyphLines(this.strToBeConverted);
            for (Tuple2<GlyphLine, PdfFont> subText : subTextWithFont) {
                TextRenderer textRenderer = createCopy(subText.getFirst(), subText.getSecond());
                addTo.add(textRenderer);
            }
            return true;
        } else {
            throw new IllegalStateException(LayoutExceptionMessageConstant.INVALID_FONT_PROPERTY_VALUE);
        }
    }

    protected void setProcessedGlyphLineAndFont(GlyphLine gl, PdfFont font) {
        this.text = gl;
        this.font = font;
        this.otfFeaturesApplied = false;
        this.strToBeConverted = null;
        this.specialScriptsWordBreakPoints = null;
        setProperty(20, font);
    }

    protected TextRenderer createCopy(GlyphLine gl, PdfFont font) {
        if (TextRenderer.class != getClass()) {
            Logger logger = LoggerFactory.getLogger(TextRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.CREATE_COPY_SHOULD_BE_OVERRIDDEN, new Object[0]));
        }
        TextRenderer copy = new TextRenderer(this);
        copy.setProcessedGlyphLineAndFont(gl, font);
        return copy;
    }

    static void updateRangeBasedOnRemovedCharacters(ArrayList<Integer> removedIds, int[] range) {
        int shift = numberOfElementsLessThan(removedIds, range[0]);
        range[0] = range[0] - shift;
        int shift2 = numberOfElementsLessThanOrEqual(removedIds, range[1]);
        range[1] = range[1] - shift2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int findPossibleBreaksSplitPosition(List<Integer> list, int textStartBasedInitialOverflowTextPos, boolean amongPresentOnly) {
        int low = 0;
        int high = list.size() - 1;
        while (low <= high) {
            int middle = (low + high) >>> 1;
            if (list.get(middle).compareTo(Integer.valueOf(textStartBasedInitialOverflowTextPos)) < 0) {
                low = middle + 1;
            } else if (list.get(middle).compareTo(Integer.valueOf(textStartBasedInitialOverflowTextPos)) > 0) {
                high = middle - 1;
            } else {
                return middle;
            }
        }
        if (!amongPresentOnly && low > 0) {
            return low - 1;
        }
        return -1;
    }

    static boolean codePointIsOfSpecialScript(int codePoint) {
        Character.UnicodeScript glyphScript = Character.UnicodeScript.of(codePoint);
        return Character.UnicodeScript.THAI == glyphScript || Character.UnicodeScript.KHMER == glyphScript || Character.UnicodeScript.LAO == glyphScript || Character.UnicodeScript.MYANMAR == glyphScript;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public PdfFont resolveFirstPdfFont(String[] font, FontProvider provider, FontCharacteristics fc, FontSet additionalFonts) {
        IFontSelectorStrategy strategy = provider.createFontSelectorStrategy(Arrays.asList(font), fc, additionalFonts);
        List<Tuple2<GlyphLine, PdfFont>> glyphLines = strategy.getGlyphLines(this.strToBeConverted);
        if (!glyphLines.isEmpty()) {
            return glyphLines.get(0).getSecond();
        }
        return super.resolveFirstPdfFont(font, provider, fc, additionalFonts);
    }

    boolean[] isStartsWithSplitCharWhiteSpaceAndEndsWithSplitChar(ISplitCharacters splitCharacters) {
        boolean startsWithBreak = this.line.start < this.line.end && splitCharacters.isSplitCharacter(this.text, this.line.start) && TextUtil.isSpaceOrWhitespace(this.text.get(this.line.start));
        boolean endsWithBreak = this.line.start < this.line.end && splitCharacters.isSplitCharacter(this.text, this.line.end - 1);
        if (this.specialScriptsWordBreakPoints == null || this.specialScriptsWordBreakPoints.isEmpty()) {
            return new boolean[]{startsWithBreak, endsWithBreak};
        }
        if (!endsWithBreak) {
            endsWithBreak = this.specialScriptsWordBreakPoints.contains(Integer.valueOf(this.line.end));
        }
        return new boolean[]{startsWithBreak, endsWithBreak};
    }

    private void drawAndTagSingleUnderline(boolean isTagged, Underline underline, TransparentColor fontStrokeColor, PdfCanvas canvas, float fontSize, float italicAngleTan) {
        if (isTagged) {
            canvas.openTag(new CanvasArtifact());
        }
        drawSingleUnderline(underline, fontStrokeColor, canvas, fontSize, italicAngleTan);
        if (isTagged) {
            canvas.closeTag();
        }
    }

    private float getCharWidth(Glyph g, float fontSize, Float hScale, Float characterSpacing, Float wordSpacing) {
        if (hScale == null) {
            hScale = Float.valueOf(1.0f);
        }
        float resultWidth = g.getWidth() * fontSize * hScale.floatValue();
        if (characterSpacing != null) {
            resultWidth += FontProgram.convertGlyphSpaceToTextSpace(characterSpacing.floatValue() * hScale.floatValue());
        }
        if (wordSpacing != null && g.getUnicode() == 32) {
            return resultWidth + FontProgram.convertGlyphSpaceToTextSpace(wordSpacing.floatValue() * hScale.floatValue());
        }
        return resultWidth;
    }

    private float scaleXAdvance(float xAdvance, float fontSize, Float hScale) {
        return xAdvance * fontSize * hScale.floatValue();
    }

    private float getGlyphLineWidth(GlyphLine glyphLine, float fontSize, float hScale, Float characterSpacing, Float wordSpacing) {
        float fontSize2;
        Float characterSpacing2;
        Float wordSpacing2;
        float width = 0.0f;
        int i = glyphLine.start;
        while (i < glyphLine.end) {
            if (noPrint(glyphLine.get(i))) {
                fontSize2 = fontSize;
                characterSpacing2 = characterSpacing;
                wordSpacing2 = wordSpacing;
            } else {
                fontSize2 = fontSize;
                characterSpacing2 = characterSpacing;
                wordSpacing2 = wordSpacing;
                float charWidth = getCharWidth(glyphLine.get(i), fontSize2, Float.valueOf(hScale), characterSpacing2, wordSpacing2);
                float width2 = width + charWidth;
                float xAdvance = i != glyphLine.start ? scaleXAdvance(glyphLine.get(i - 1).getXAdvance(), fontSize2, Float.valueOf(hScale)) : 0.0f;
                width = width2 + xAdvance;
            }
            i++;
            fontSize = fontSize2;
            characterSpacing = characterSpacing2;
            wordSpacing = wordSpacing2;
        }
        float fontSize3 = FontProgram.convertTextSpaceToGlyphSpace(width);
        return fontSize3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001d, code lost:
        if (r0 < r5) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0027, code lost:
        if (isGlyphPartOfWordForHyphenation(r4.get(r0)) == false) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0029, code lost:
        r0 = r0 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002c, code lost:
        r1 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002d, code lost:
        if (r1 >= r6) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0037, code lost:
        if (isGlyphPartOfWordForHyphenation(r4.get(r1)) == false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0039, code lost:
        r1 = r1 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0042, code lost:
        return new int[]{r0 + 1, r1};
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x001c, code lost:
        r0 = r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int[] getWordBoundsForHyphenation(com.itextpdf.io.font.otf.GlyphLine r4, int r5, int r6, int r7) {
        /*
            r3 = this;
        L1:
            if (r7 < r5) goto L1a
            com.itextpdf.io.font.otf.Glyph r0 = r4.get(r7)
            boolean r0 = r3.isGlyphPartOfWordForHyphenation(r0)
            if (r0 != 0) goto L1a
            com.itextpdf.io.font.otf.Glyph r0 = r4.get(r7)
            boolean r0 = com.itextpdf.io.util.TextUtil.isUni0020(r0)
            if (r0 != 0) goto L1a
            int r7 = r7 + (-1)
            goto L1
        L1a:
            if (r7 < r5) goto L43
            r0 = r7
        L1d:
            if (r0 < r5) goto L2c
            com.itextpdf.io.font.otf.Glyph r1 = r4.get(r0)
            boolean r1 = r3.isGlyphPartOfWordForHyphenation(r1)
            if (r1 == 0) goto L2c
            int r0 = r0 + (-1)
            goto L1d
        L2c:
            r1 = r7
        L2d:
            if (r1 >= r6) goto L3c
            com.itextpdf.io.font.otf.Glyph r2 = r4.get(r1)
            boolean r2 = r3.isGlyphPartOfWordForHyphenation(r2)
            if (r2 == 0) goto L3c
            int r1 = r1 + 1
            goto L2d
        L3c:
            int r2 = r0 + 1
            int[] r2 = new int[]{r2, r1}
            return r2
        L43:
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.TextRenderer.getWordBoundsForHyphenation(com.itextpdf.io.font.otf.GlyphLine, int, int, int):int[]");
    }

    private boolean isGlyphPartOfWordForHyphenation(Glyph g) {
        return Character.isLetter((char) g.getUnicode()) || 173 == g.getUnicode();
    }

    private void updateFontAndText() {
        PdfFont newFont;
        if (this.strToBeConverted != null) {
            try {
                newFont = getPropertyAsFont(20);
            } catch (ClassCastException e) {
                PdfFont newFont2 = resolveFirstPdfFont();
                if (!this.strToBeConverted.isEmpty()) {
                    Logger logger = LoggerFactory.getLogger(TextRenderer.class);
                    logger.error(IoLogMessageConstant.FONT_PROPERTY_MUST_BE_PDF_FONT_OBJECT);
                }
                newFont = newFont2;
            }
            GlyphLine newText = newFont.createGlyphLine(this.strToBeConverted);
            setProcessedGlyphLineAndFont(TextPreprocessingUtil.replaceSpecialWhitespaceGlyphs(newText, newFont), newFont);
        }
    }

    private void saveWordBreakIfNotYetSaved(Glyph wordBreak) {
        if (this.savedWordBreakAtLineEnding == null) {
            if (TextUtil.isNewLine(wordBreak)) {
                wordBreak = this.font.getGlyph(32);
            }
            this.savedWordBreakAtLineEnding = new GlyphLine(Collections.singletonList(wordBreak));
        }
    }

    private static int numberOfElementsLessThan(ArrayList<Integer> numbers, int n) {
        int x = Collections.binarySearch(numbers, Integer.valueOf(n));
        if (x >= 0) {
            return x;
        }
        return (-x) - 1;
    }

    private static int numberOfElementsLessThanOrEqual(ArrayList<Integer> numbers, int n) {
        int x = Collections.binarySearch(numbers, Integer.valueOf(n));
        if (x >= 0) {
            return x + 1;
        }
        return (-x) - 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean noPrint(Glyph g) {
        if (!g.hasValidUnicode()) {
            return false;
        }
        int c = g.getUnicode();
        return TextUtil.isNonPrintable(c);
    }

    private static boolean glyphBelongsToNonBreakingHyphenRelatedChunk(GlyphLine text, int ind) {
        return TextUtil.isNonBreakingHyphen(text.get(ind)) || (ind + 1 < text.end && TextUtil.isNonBreakingHyphen(text.get(ind + 1))) || (ind + (-1) >= text.start && TextUtil.isNonBreakingHyphen(text.get(ind + (-1))));
    }

    /* loaded from: classes12.dex */
    private static class ReversedCharsIterator implements Iterator<GlyphLine.GlyphLinePart> {
        private boolean useReversed;
        private int currentInd = 0;
        private List<Integer> outStart = new ArrayList();
        private List<Integer> outEnd = new ArrayList();
        private List<Boolean> reversed = new ArrayList();

        public ReversedCharsIterator(List<int[]> reversedRange, GlyphLine line) {
            if (reversedRange != null) {
                if (reversedRange.get(0)[0] > 0) {
                    this.outStart.add(0);
                    this.outEnd.add(Integer.valueOf(reversedRange.get(0)[0]));
                    this.reversed.add(false);
                }
                for (int i = 0; i < reversedRange.size(); i++) {
                    int[] range = reversedRange.get(i);
                    this.outStart.add(Integer.valueOf(range[0]));
                    this.outEnd.add(Integer.valueOf(range[1] + 1));
                    this.reversed.add(true);
                    if (i != reversedRange.size() - 1) {
                        this.outStart.add(Integer.valueOf(range[1] + 1));
                        this.outEnd.add(Integer.valueOf(reversedRange.get(i + 1)[0]));
                        this.reversed.add(false);
                    }
                }
                int lastIndex = reversedRange.get(reversedRange.size() - 1)[1];
                if (lastIndex < line.size() - 1) {
                    this.outStart.add(Integer.valueOf(lastIndex + 1));
                    this.outEnd.add(Integer.valueOf(line.size()));
                    this.reversed.add(false);
                    return;
                }
                return;
            }
            this.outStart.add(Integer.valueOf(line.start));
            this.outEnd.add(Integer.valueOf(line.end));
            this.reversed.add(false);
        }

        public ReversedCharsIterator setUseReversed(boolean useReversed) {
            this.useReversed = useReversed;
            return this;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.currentInd < this.outStart.size();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        public GlyphLine.GlyphLinePart next() {
            GlyphLine.GlyphLinePart part = new GlyphLine.GlyphLinePart(this.outStart.get(this.currentInd).intValue(), this.outEnd.get(this.currentInd).intValue()).setReversed(this.useReversed && this.reversed.get(this.currentInd).booleanValue());
            this.currentInd++;
            return part;
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new IllegalStateException("Operation not supported");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ScriptRange {
        int rangeEnd;
        Character.UnicodeScript script;

        ScriptRange(Character.UnicodeScript script, int rangeEnd) {
            this.script = script;
            this.rangeEnd = rangeEnd;
        }
    }

    /* loaded from: classes12.dex */
    private static final class CustomGlyphLineFilter implements GlyphLine.IGlyphLineFilter {
        private CustomGlyphLineFilter() {
        }

        @Override // com.itextpdf.io.font.otf.GlyphLine.IGlyphLineFilter
        public boolean accept(Glyph glyph) {
            return !TextRenderer.noPrint(glyph);
        }
    }
}
