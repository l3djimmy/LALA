package com.itextpdf.layout.splitting;

import com.itextpdf.io.font.otf.GlyphLine;
/* loaded from: classes12.dex */
public class KeepAllSplitCharacters implements ISplitCharacters {
    @Override // com.itextpdf.layout.splitting.ISplitCharacters
    public boolean isSplitCharacter(GlyphLine text, int glyphPos) {
        if (text.get(glyphPos).hasValidUnicode()) {
            int charCode = text.get(glyphPos).getUnicode();
            if (glyphPos == 0 && charCode == 45 && text.size() - 1 > glyphPos && isADigitChar(text, glyphPos + 1)) {
                return false;
            }
            return charCode <= 32 || charCode == 45 || charCode == 8208 || (charCode >= 8194 && charCode <= 8203);
        }
        return false;
    }

    private static boolean isADigitChar(GlyphLine text, int glyphPos) {
        return Character.isDigit(text.get(glyphPos).getChars()[0]);
    }
}
