package com.itextpdf.layout.renderer;

import com.itextpdf.io.font.FontProgram;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.layout.properties.LineHeight;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.RenderingMode;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class LineHeightHelper {
    public static final int ASCENDER_INDEX = 0;
    private static final float DEFAULT_LINE_HEIGHT_COEFF = 1.15f;
    public static final int DESCENDER_INDEX = 1;
    public static final int LEADING_INDEX = 3;
    public static final int XHEIGHT_INDEX = 2;

    private LineHeightHelper() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float[] getActualAscenderDescender(AbstractRenderer renderer) {
        float[] result = getActualFontInfo(renderer);
        return new float[]{result[0], result[1]};
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float[] getActualFontInfo(AbstractRenderer renderer) {
        float lineHeight = calculateLineHeight(renderer);
        float[] fontAscenderDescender = getFontAscenderDescenderNormalized(renderer);
        float leading = lineHeight - (fontAscenderDescender[0] - fontAscenderDescender[1]);
        float ascender = fontAscenderDescender[0] + (leading / 2.0f);
        float descender = fontAscenderDescender[1] - (leading / 2.0f);
        return new float[]{ascender, descender, fontAscenderDescender[2], leading};
    }

    static float[] getFontAscenderDescenderNormalized(AbstractRenderer renderer) {
        PdfFont font = renderer.resolveFirstPdfFont();
        float fontSize = renderer.getPropertyAsUnitValue(24).getValue();
        float[] fontAscenderDescenderFromMetrics = TextRenderer.calculateAscenderDescender(font, RenderingMode.HTML_MODE);
        float fontAscender = FontProgram.convertTextSpaceToGlyphSpace(fontAscenderDescenderFromMetrics[0]) * fontSize;
        float fontDescender = FontProgram.convertTextSpaceToGlyphSpace(fontAscenderDescenderFromMetrics[1]) * fontSize;
        float xHeight = FontProgram.convertTextSpaceToGlyphSpace(font.getFontProgram().getFontMetrics().getXHeight()) * fontSize;
        return new float[]{fontAscender, fontDescender, xHeight};
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float calculateLineHeight(AbstractRenderer renderer) {
        LineHeight lineHeight = (LineHeight) renderer.getProperty(Property.LINE_HEIGHT);
        float fontSize = renderer.getPropertyAsUnitValue(24).getValue();
        if (lineHeight == null || lineHeight.isNormalValue() || lineHeight.getValue() < 0.0f) {
            float lineHeightValue = DEFAULT_LINE_HEIGHT_COEFF * fontSize;
            float[] fontAscenderDescender = getFontAscenderDescenderNormalized(renderer);
            float fontAscenderDescenderSum = fontAscenderDescender[0] - fontAscenderDescender[1];
            if (fontAscenderDescenderSum > lineHeightValue) {
                return fontAscenderDescenderSum;
            }
            return lineHeightValue;
        } else if (lineHeight.isFixedValue()) {
            return lineHeight.getValue();
        } else {
            return lineHeight.getValue() * fontSize;
        }
    }
}
