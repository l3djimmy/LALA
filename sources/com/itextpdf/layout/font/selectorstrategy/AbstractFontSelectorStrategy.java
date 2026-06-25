package com.itextpdf.layout.font.selectorstrategy;

import com.itextpdf.commons.datastructures.Tuple2;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.layout.font.FontInfo;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.font.FontSelector;
import com.itextpdf.layout.font.FontSet;
import com.itextpdf.layout.renderer.TextPreprocessingUtil;
import java.lang.Character;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public abstract class AbstractFontSelectorStrategy implements IFontSelectorStrategy {
    private final FontSet additionalFonts;
    private final FontProvider fontProvider;
    private final FontSelector fontSelector;

    protected abstract boolean isCurrentFontCheckRequired();

    public AbstractFontSelectorStrategy(FontProvider fontProvider, FontSelector fontSelector, FontSet additionalFonts) {
        this.fontProvider = fontProvider;
        this.additionalFonts = additionalFonts;
        this.fontSelector = fontSelector;
    }

    @Override // com.itextpdf.layout.font.selectorstrategy.IFontSelectorStrategy
    public List<Tuple2<GlyphLine, PdfFont>> getGlyphLines(String text) {
        List<Tuple2<GlyphLine, PdfFont>> result = new ArrayList<>();
        int index = 0;
        int indexDiacritic = -1;
        while (index < text.length()) {
            PdfFont currentFont = null;
            int indexSignificant = nextSignificantIndex(index, text);
            if (indexSignificant < text.length()) {
                currentFont = matchFont(extractCodePoint(text, indexDiacritic == -1 ? indexSignificant : indexDiacritic), this.fontSelector, this.fontProvider, this.additionalFonts);
            }
            List<Glyph> resolvedGlyphs = new ArrayList<>();
            if (currentFont != null) {
                Character.UnicodeScript firstScript = null;
                int to = indexSignificant;
                boolean breakRequested = false;
                int i = indexSignificant;
                while (i < text.length()) {
                    int codePoint = extractCodePoint(text, i);
                    if (codePoint > 65535) {
                        i++;
                    }
                    if (isCurrentFontCheckRequired() && i != indexDiacritic - 1 && currentFont != matchFont(codePoint, this.fontSelector, this.fontProvider, this.additionalFonts)) {
                        breakRequested = true;
                    }
                    if (i > indexDiacritic) {
                        if (TextUtil.isDiacritic(codePoint)) {
                            PdfFont diacriticFont = matchFont(codePoint, this.fontSelector, this.fontProvider, this.additionalFonts);
                            boolean isPreviousMatchFont = i == 0 || diacriticFont == null || diacriticFont.containsGlyph(extractCodePoint(text, i + (-1)));
                            if (diacriticFont != null && diacriticFont != currentFont && isPreviousMatchFont) {
                                if (indexDiacritic != i - 1) {
                                    breakRequested = true;
                                }
                                indexDiacritic = i;
                                if (breakRequested) {
                                    to = i - 2;
                                }
                            }
                        } else {
                            indexDiacritic = -1;
                        }
                    }
                    Character.UnicodeScript currScript = Character.UnicodeScript.of(codePoint);
                    if (isSignificantUnicodeScript(currScript)) {
                        if (firstScript == null) {
                            firstScript = currScript;
                        } else if (firstScript != currScript) {
                            breakRequested = true;
                        }
                    }
                    if (breakRequested) {
                        break;
                    }
                    to = i;
                    i++;
                }
                if (to >= index) {
                    int numOfAppendedGlyphs = currentFont.appendGlyphs(text, index, to, resolvedGlyphs);
                    index += numOfAppendedGlyphs;
                }
            }
            if (resolvedGlyphs.isEmpty()) {
                currentFont = getPdfFont(this.fontSelector.bestMatch(), this.fontProvider, this.additionalFonts);
                if (index != indexSignificant) {
                    index += currentFont.appendGlyphs(text, index, indexSignificant - 1, resolvedGlyphs);
                }
                while (index <= indexSignificant && index < text.length()) {
                    index += currentFont.appendAnyGlyph(text, index, resolvedGlyphs);
                }
            }
            GlyphLine tempGlyphLine = new GlyphLine(resolvedGlyphs);
            GlyphLine finalGlyphLine = TextPreprocessingUtil.replaceSpecialWhitespaceGlyphs(tempGlyphLine, currentFont);
            result.add(new Tuple2<>(finalGlyphLine, currentFont));
        }
        return result;
    }

    protected PdfFont matchFont(int codePoint, FontSelector fontSelector, FontProvider fontProvider, FontSet additionalFonts) {
        PdfFont temptFont;
        Glyph glyph;
        for (FontInfo fontInfo : fontSelector.getFonts()) {
            if (fontInfo.getFontUnicodeRange().contains(codePoint) && (glyph = (temptFont = getPdfFont(fontInfo, fontProvider, additionalFonts)).getGlyph(codePoint)) != null && glyph.getCode() != 0) {
                return temptFont;
            }
        }
        return null;
    }

    private static int nextSignificantIndex(int startIndex, String text) {
        int nextValidChar = startIndex;
        while (nextValidChar < text.length() && TextUtil.isWhitespaceOrNonPrintable(text.charAt(nextValidChar))) {
            nextValidChar++;
        }
        return nextValidChar;
    }

    private static boolean isSignificantUnicodeScript(Character.UnicodeScript unicodeScript) {
        return (unicodeScript == Character.UnicodeScript.COMMON || unicodeScript == Character.UnicodeScript.INHERITED) ? false : true;
    }

    private static int extractCodePoint(String text, int idx) {
        return TextUtil.isSurrogatePair(text, idx) ? TextUtil.convertToUtf32(text, idx) : text.charAt(idx);
    }

    private static PdfFont getPdfFont(FontInfo fontInfo, FontProvider fontProvider, FontSet additionalFonts) {
        return fontProvider.getPdfFont(fontInfo, additionalFonts);
    }
}
