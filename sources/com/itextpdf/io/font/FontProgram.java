package com.itextpdf.io.font;

import com.itextpdf.io.font.otf.Glyph;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public abstract class FontProgram {
    public static final int DEFAULT_WIDTH = 1000;
    public static final int HORIZONTAL_SCALING_FACTOR = 100;
    public static final int UNITS_NORMALIZATION = 1000;
    protected int avgWidth;
    protected FontNames fontNames;
    protected boolean isFontSpecific;
    protected String registry;
    protected Map<Integer, Glyph> codeToGlyph = new HashMap();
    protected Map<Integer, Glyph> unicodeToGlyph = new HashMap();
    protected FontMetrics fontMetrics = new FontMetrics();
    protected FontIdentification fontIdentification = new FontIdentification();
    protected String encodingScheme = FontEncoding.FONT_SPECIFIC;

    public abstract int getKerning(Glyph glyph, Glyph glyph2);

    public abstract int getPdfFontFlags();

    public static float convertTextSpaceToGlyphSpace(float value) {
        return value / 1000.0f;
    }

    public static float convertGlyphSpaceToTextSpace(float value) {
        return 1000.0f * value;
    }

    public static double convertGlyphSpaceToTextSpace(double value) {
        return 1000.0d * value;
    }

    public static int convertGlyphSpaceToTextSpace(int value) {
        return value * 1000;
    }

    public int countOfGlyphs() {
        return Math.max(this.codeToGlyph.size(), this.unicodeToGlyph.size());
    }

    public FontNames getFontNames() {
        return this.fontNames;
    }

    public FontMetrics getFontMetrics() {
        return this.fontMetrics;
    }

    public FontIdentification getFontIdentification() {
        return this.fontIdentification;
    }

    public String getRegistry() {
        return this.registry;
    }

    public boolean isFontSpecific() {
        return this.isFontSpecific;
    }

    public int getWidth(int unicode) {
        Glyph glyph = getGlyph(unicode);
        if (glyph != null) {
            return glyph.getWidth();
        }
        return 0;
    }

    public int getAvgWidth() {
        return this.avgWidth;
    }

    public int[] getCharBBox(int unicode) {
        Glyph glyph = getGlyph(unicode);
        if (glyph != null) {
            return glyph.getBbox();
        }
        return null;
    }

    public Glyph getGlyph(int unicode) {
        return this.unicodeToGlyph.get(Integer.valueOf(unicode));
    }

    public Glyph getGlyphByCode(int charCode) {
        return this.codeToGlyph.get(Integer.valueOf(charCode));
    }

    public boolean hasKernPairs() {
        return false;
    }

    public int getKerning(int first, int second) {
        return getKerning(this.unicodeToGlyph.get(Integer.valueOf(first)), this.unicodeToGlyph.get(Integer.valueOf(second)));
    }

    public boolean isBuiltWith(String fontName) {
        return false;
    }

    protected void setRegistry(String registry) {
        this.registry = registry;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String trimFontStyle(String name) {
        if (name == null) {
            return null;
        }
        if (name.endsWith(",Bold")) {
            return name.substring(0, name.length() - 5);
        }
        if (name.endsWith(",Italic")) {
            return name.substring(0, name.length() - 7);
        }
        if (name.endsWith(",BoldItalic")) {
            return name.substring(0, name.length() - 11);
        }
        return name;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTypoAscender(int ascender) {
        this.fontMetrics.setTypoAscender(ascender);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTypoDescender(int descender) {
        this.fontMetrics.setTypoDescender(descender);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCapHeight(int capHeight) {
        this.fontMetrics.setCapHeight(capHeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setXHeight(int xHeight) {
        this.fontMetrics.setXHeight(xHeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setItalicAngle(int italicAngle) {
        this.fontMetrics.setItalicAngle(italicAngle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStemV(int stemV) {
        this.fontMetrics.setStemV(stemV);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStemH(int stemH) {
        this.fontMetrics.setStemH(stemH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontWeight(int fontWeight) {
        this.fontNames.setFontWeight(fontWeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontStretch(String fontWidth) {
        this.fontNames.setFontStretch(fontWidth);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFixedPitch(boolean isFixedPitch) {
        this.fontMetrics.setIsFixedPitch(isFixedPitch);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setBold(boolean isBold) {
        FontNames fontNames = this.fontNames;
        if (isBold) {
            fontNames.setMacStyle(this.fontNames.getMacStyle() | 1);
        } else {
            fontNames.setMacStyle(this.fontNames.getMacStyle() & (-2));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setBbox(int[] bbox) {
        this.fontMetrics.setBbox(bbox[0], bbox[1], bbox[2], bbox[3]);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontFamily(String fontFamily) {
        this.fontNames.setFamilyName(fontFamily);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontName(String fontName) {
        this.fontNames.setFontName(fontName);
        if (this.fontNames.getFullName() == null) {
            this.fontNames.setFullName(fontName);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fixSpaceIssue() {
        Glyph space = this.unicodeToGlyph.get(32);
        if (space != null) {
            this.codeToGlyph.put(Integer.valueOf(space.getCode()), space);
        }
    }

    public String toString() {
        String name = getFontNames().getFontName();
        return (name == null || name.length() <= 0) ? super.toString() : name;
    }
}
