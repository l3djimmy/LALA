package com.itextpdf.kernel.utils.checkers;

import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.font.PdfFont;
/* loaded from: classes12.dex */
public final class FontCheckUtil {

    /* loaded from: classes12.dex */
    public interface CharacterChecker {
        boolean check(int i, PdfFont pdfFont);
    }

    private FontCheckUtil() {
    }

    public static int checkGlyphsOfText(String text, PdfFont font, CharacterChecker checker) {
        int ch;
        int i = 0;
        while (i < text.length()) {
            if (TextUtil.isSurrogatePair(text, i)) {
                ch = TextUtil.convertToUtf32(text, i);
                i++;
            } else {
                ch = text.charAt(i);
            }
            if (!checker.check(ch, font)) {
                i++;
            } else {
                return i;
            }
        }
        return -1;
    }
}
