package com.itextpdf.layout.splitting;

import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.util.TextUtil;
/* loaded from: classes12.dex */
public class BreakAllSplitCharacters implements ISplitCharacters {
    @Override // com.itextpdf.layout.splitting.ISplitCharacters
    public boolean isSplitCharacter(GlyphLine text, int glyphPos) {
        if (text.size() - 1 == glyphPos) {
            return true;
        }
        Glyph glyphToCheck = text.get(glyphPos);
        if (glyphToCheck.hasValidUnicode()) {
            int charCode = glyphToCheck.getUnicode();
            Glyph nextGlyph = text.get(glyphPos + 1);
            if (nextGlyph.hasValidUnicode()) {
                boolean nextGlyphIsLetterOrDigit = TextUtil.isLetterOrDigit(nextGlyph);
                boolean nextGlyphIsMark = TextUtil.isMark(nextGlyph);
                boolean currentGlyphIsDefaultSplitCharacter = charCode <= 32 || charCode == 45 || charCode == 8208 || (charCode >= 8194 && charCode <= 8203);
                return (currentGlyphIsDefaultSplitCharacter || nextGlyphIsLetterOrDigit || nextGlyphIsMark) && !TextUtil.isNonBreakingHyphen(glyphToCheck);
            }
            return true;
        }
        return true;
    }
}
