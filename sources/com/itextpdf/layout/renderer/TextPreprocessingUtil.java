package com.itextpdf.layout.renderer;

import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.kernel.font.PdfFont;
/* loaded from: classes12.dex */
public final class TextPreprocessingUtil {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    static final int AMOUNT_OF_SPACE_IN_TAB = 3;
    static final int NON_MONO_SPACE_ENSP_WIDTH = 500;
    static final int NON_MONO_SPACE_THINSP_WIDTH = 200;

    private TextPreprocessingUtil() {
    }

    public static GlyphLine replaceSpecialWhitespaceGlyphs(GlyphLine line, PdfFont font) {
        if (line != null) {
            boolean isMonospaceFont = font.getFontProgram().getFontMetrics().isFixedPitch();
            Glyph space = font.getGlyph(32);
            int spaceWidth = space.getWidth();
            int lineSize = line.size();
            for (int i = 0; i < lineSize; i++) {
                Glyph glyph = line.get(i);
                Integer xAdvance = calculateXAdvancement(spaceWidth, isMonospaceFont, glyph);
                boolean isSpecialWhitespaceGlyph = xAdvance != null;
                if (isSpecialWhitespaceGlyph) {
                    Glyph newGlyph = new Glyph(space);
                    newGlyph.setChars(glyph.getChars());
                    if (xAdvance.intValue() > 32767 || xAdvance.intValue() < -32768) {
                        throw new AssertionError();
                    }
                    newGlyph.setXAdvance((short) xAdvance.intValue());
                    line.set(i, newGlyph);
                }
            }
        }
        return line;
    }

    private static Integer calculateXAdvancement(int spaceWidth, boolean isMonospaceFont, Glyph glyph) {
        if (glyph.getCode() > 0) {
            return null;
        }
        switch (glyph.getUnicode()) {
            case 9:
                Integer xAdvance = Integer.valueOf(spaceWidth * 3);
                return xAdvance;
            case 8194:
                Integer xAdvance2 = Integer.valueOf(isMonospaceFont ? 0 : 500 - spaceWidth);
                return xAdvance2;
            case 8195:
                Integer xAdvance3 = Integer.valueOf(isMonospaceFont ? 0 : 1000 - spaceWidth);
                return xAdvance3;
            case 8201:
                Integer xAdvance4 = Integer.valueOf(isMonospaceFont ? 0 : 200 - spaceWidth);
                return xAdvance4;
            default:
                return null;
        }
    }
}
