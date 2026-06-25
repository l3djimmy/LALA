package com.itextpdf.layout.font;

import com.itextpdf.io.font.FontProgramDescriptor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes12.dex */
public class FontSelector {
    private static final int EXPECTED_FONT_IS_BOLD_AWARD = 5;
    private static final int EXPECTED_FONT_IS_ITALIC_AWARD = 5;
    private static final int EXPECTED_FONT_IS_MONOSPACED_AWARD = 5;
    private static final int EXPECTED_FONT_IS_NOT_BOLD_AWARD = 3;
    private static final int EXPECTED_FONT_IS_NOT_ITALIC_AWARD = 3;
    private static final int EXPECTED_FONT_IS_NOT_MONOSPACED_AWARD = 1;
    private static final int EXPECTED_FONT_WEIGHT_IS_EQUALS_AWARD = 1;
    private static final int EXPECTED_FONT_WEIGHT_IS_FAR_AWARD = 1;
    private static final int FONT_FAMILY_EQUALS_AWARD = 13;
    protected List<FontInfo> fonts;

    public FontSelector(Collection<FontInfo> allFonts, List<String> fontFamilies, FontCharacteristics fc) {
        this.fonts = new ArrayList(allFonts);
        Collections.sort(this.fonts, getComparator(fontFamilies, fc));
    }

    public final FontInfo bestMatch() {
        return this.fonts.get(0);
    }

    public final Iterable<FontInfo> getFonts() {
        return this.fonts;
    }

    protected Comparator<FontInfo> getComparator(List<String> fontFamilies, FontCharacteristics fc) {
        return new PdfFontComparator(fontFamilies, fc);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class PdfFontComparator implements Comparator<FontInfo> {
        List<String> fontFamilies = new ArrayList();
        List<FontCharacteristics> fontStyles = new ArrayList();

        PdfFontComparator(List<String> fontFamilies, FontCharacteristics fc) {
            if (fontFamilies != null && fontFamilies.size() > 0) {
                for (String fontFamily : fontFamilies) {
                    String lowercaseFontFamily = fontFamily.toLowerCase();
                    this.fontFamilies.add(lowercaseFontFamily);
                    this.fontStyles.add(parseFontStyle(lowercaseFontFamily, fc));
                }
                return;
            }
            this.fontStyles.add(fc);
        }

        @Override // java.util.Comparator
        public int compare(FontInfo o1, FontInfo o2) {
            int res = 0;
            int i = 0;
            while (i < this.fontFamilies.size() && res == 0) {
                FontCharacteristics fc = this.fontStyles.get(i);
                String fontFamily = this.fontFamilies.get(i);
                if ("monospace".equalsIgnoreCase(fontFamily)) {
                    fc.setMonospaceFlag(true);
                }
                boolean isLastFontFamilyToBeProcessed = i == this.fontFamilies.size() - 1;
                int res2 = characteristicsSimilarity(fontFamily, fc, o2, isLastFontFamilyToBeProcessed) - characteristicsSimilarity(fontFamily, fc, o1, isLastFontFamilyToBeProcessed);
                if (res2 != 0) {
                    res = res2;
                } else {
                    res = family2Similarity(fontFamily, fc, o2) - family2Similarity(fontFamily, fc, o1);
                }
                i++;
            }
            return res;
        }

        private static FontCharacteristics parseFontStyle(String fontFamily, FontCharacteristics fc) {
            if (fc == null) {
                fc = new FontCharacteristics();
            }
            if (fc.isUndefined()) {
                if (fontFamily.contains("bold")) {
                    fc.setBoldFlag(true);
                }
                if (fontFamily.contains("italic") || fontFamily.contains("oblique")) {
                    fc.setItalicFlag(true);
                }
            }
            return fc;
        }

        private static int characteristicsSimilarity(String fontFamily, FontCharacteristics fc, FontInfo fontInfo, boolean isLastFontFamilyToBeProcessed) {
            FontProgramDescriptor fontDescriptor = fontInfo.getDescriptor();
            boolean isFontItalic = false;
            boolean isFontBold = fontDescriptor.isBold() || fontDescriptor.getFontWeight() > 500;
            if (fontDescriptor.isItalic() || fontDescriptor.getItalicAngle() < 0.0f) {
                isFontItalic = true;
            }
            boolean isFontMonospace = fontDescriptor.isMonospace();
            int score = 0;
            boolean fontFamilySetByCharacteristics = false;
            if (fc.isMonospace()) {
                fontFamilySetByCharacteristics = true;
                if (isFontMonospace) {
                    score = 0 + 5;
                } else {
                    score = 0 - 5;
                }
            } else if (isFontMonospace) {
                score = 0 - 1;
            }
            if (!fontFamilySetByCharacteristics) {
                if (!"".equals(fontFamily) && ((fontInfo.getAlias() == null && fontDescriptor.getFamilyNameLowerCase() != null && fontDescriptor.getFamilyNameLowerCase().equals(fontFamily)) || (fontInfo.getAlias() != null && fontInfo.getAlias().toLowerCase().equals(fontFamily)))) {
                    score += 13;
                } else if (!isLastFontFamilyToBeProcessed) {
                    return score;
                }
            }
            int maxWeight = Math.max(fontDescriptor.getFontWeight(), (int) fc.getFontWeight());
            int minWeight = Math.min(fontDescriptor.getFontWeight(), (int) fc.getFontWeight());
            if (maxWeight == minWeight) {
                score++;
            } else if (maxWeight - minWeight >= 300) {
                score--;
            }
            if (fc.isBold()) {
                if (isFontBold) {
                    score += 5;
                } else {
                    score -= 5;
                }
            } else if (isFontBold) {
                score -= 3;
            }
            if (fc.isItalic()) {
                if (isFontItalic) {
                    return score + 5;
                }
                return score - 5;
            } else if (isFontItalic) {
                return score - 3;
            } else {
                return score;
            }
        }

        private static int family2Similarity(String fontFamily, FontCharacteristics fc, FontInfo fontInfo) {
            FontProgramDescriptor fontDescriptor = fontInfo.getDescriptor();
            if (!fc.isMonospace() && fontInfo.getAlias() == null && fontDescriptor.getFamilyName2LowerCase() != null && fontDescriptor.getFamilyName2LowerCase().equals(fontFamily)) {
                return 1;
            }
            return 0;
        }
    }
}
