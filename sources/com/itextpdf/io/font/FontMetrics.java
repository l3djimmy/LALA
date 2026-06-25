package com.itextpdf.io.font;

import com.itextpdf.io.font.constants.FontWeights;
/* loaded from: classes12.dex */
public class FontMetrics {
    private int advanceWidthMax;
    private int ascender;
    private int descender;
    private int[] glyphWidths;
    private boolean isFixedPitch;
    private int lineGap;
    private int numOfGlyphs;
    private int strikeoutPosition;
    private int strikeoutSize;
    private int subscriptOffset;
    private int subscriptSize;
    private int superscriptOffset;
    private int superscriptSize;
    private int winAscender;
    private int winDescender;
    protected float normalizationCoef = 1.0f;
    private int unitsPerEm = 1000;
    private int typoAscender = FontWeights.EXTRA_BOLD;
    private int typoDescender = -200;
    private int capHeight = 700;
    private int xHeight = 0;
    private float italicAngle = 0.0f;
    private int[] bbox = {-50, -200, 1000, 900};
    private int underlinePosition = -100;
    private int underlineThickness = 50;
    private int stemV = 80;
    private int stemH = 0;

    public int getUnitsPerEm() {
        return this.unitsPerEm;
    }

    public int getNumberOfGlyphs() {
        return this.numOfGlyphs;
    }

    public int[] getGlyphWidths() {
        return this.glyphWidths;
    }

    public int getTypoAscender() {
        return this.typoAscender;
    }

    public int getTypoDescender() {
        return this.typoDescender;
    }

    public int getCapHeight() {
        return this.capHeight;
    }

    public int getXHeight() {
        return this.xHeight;
    }

    public float getItalicAngle() {
        return this.italicAngle;
    }

    public int[] getBbox() {
        return this.bbox;
    }

    public void setBbox(int llx, int lly, int urx, int ury) {
        this.bbox[0] = llx;
        this.bbox[1] = lly;
        this.bbox[2] = urx;
        this.bbox[3] = ury;
    }

    public int getAscender() {
        return this.ascender;
    }

    public int getDescender() {
        return this.descender;
    }

    public int getLineGap() {
        return this.lineGap;
    }

    public int getWinAscender() {
        return this.winAscender;
    }

    public int getWinDescender() {
        return this.winDescender;
    }

    public int getAdvanceWidthMax() {
        return this.advanceWidthMax;
    }

    public int getUnderlinePosition() {
        return this.underlinePosition - (this.underlineThickness / 2);
    }

    public int getUnderlineThickness() {
        return this.underlineThickness;
    }

    public int getStrikeoutPosition() {
        return this.strikeoutPosition;
    }

    public int getStrikeoutSize() {
        return this.strikeoutSize;
    }

    public int getSubscriptSize() {
        return this.subscriptSize;
    }

    public int getSubscriptOffset() {
        return this.subscriptOffset;
    }

    public int getSuperscriptSize() {
        return this.superscriptSize;
    }

    public int getSuperscriptOffset() {
        return this.superscriptOffset;
    }

    public int getStemV() {
        return this.stemV;
    }

    public int getStemH() {
        return this.stemH;
    }

    public boolean isFixedPitch() {
        return this.isFixedPitch;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setUnitsPerEm(int unitsPerEm) {
        this.unitsPerEm = unitsPerEm;
        this.normalizationCoef = 1000.0f / unitsPerEm;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateBbox(float llx, float lly, float urx, float ury) {
        this.bbox[0] = (int) (this.normalizationCoef * llx);
        this.bbox[1] = (int) (this.normalizationCoef * lly);
        this.bbox[2] = (int) (this.normalizationCoef * urx);
        this.bbox[3] = (int) (this.normalizationCoef * ury);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setNumberOfGlyphs(int numOfGlyphs) {
        this.numOfGlyphs = numOfGlyphs;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setGlyphWidths(int[] glyphWidths) {
        this.glyphWidths = glyphWidths;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTypoAscender(int typoAscender) {
        this.typoAscender = (int) (typoAscender * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTypoDescender(int typoDescender) {
        this.typoDescender = (int) (typoDescender * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCapHeight(int capHeight) {
        this.capHeight = (int) (capHeight * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setXHeight(int xHeight) {
        this.xHeight = (int) (xHeight * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setItalicAngle(float italicAngle) {
        this.italicAngle = italicAngle;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAscender(int ascender) {
        this.ascender = (int) (ascender * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setDescender(int descender) {
        this.descender = (int) (descender * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setLineGap(int lineGap) {
        this.lineGap = (int) (lineGap * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setWinAscender(int winAscender) {
        this.winAscender = (int) (winAscender * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setWinDescender(int winDescender) {
        this.winDescender = (int) (winDescender * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAdvanceWidthMax(int advanceWidthMax) {
        this.advanceWidthMax = (int) (advanceWidthMax * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setUnderlinePosition(int underlinePosition) {
        this.underlinePosition = (int) (underlinePosition * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setUnderlineThickness(int underineThickness) {
        this.underlineThickness = underineThickness;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStrikeoutPosition(int strikeoutPosition) {
        this.strikeoutPosition = (int) (strikeoutPosition * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStrikeoutSize(int strikeoutSize) {
        this.strikeoutSize = (int) (strikeoutSize * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSubscriptSize(int subscriptSize) {
        this.subscriptSize = (int) (subscriptSize * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSubscriptOffset(int subscriptOffset) {
        this.subscriptOffset = (int) (subscriptOffset * this.normalizationCoef);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSuperscriptSize(int superscriptSize) {
        this.superscriptSize = superscriptSize;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSuperscriptOffset(int superscriptOffset) {
        this.superscriptOffset = (int) (superscriptOffset * this.normalizationCoef);
    }

    public void setStemV(int stemV) {
        this.stemV = stemV;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStemH(int stemH) {
        this.stemH = stemH;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setIsFixedPitch(boolean isFixedPitch) {
        this.isFixedPitch = isFixedPitch;
    }
}
