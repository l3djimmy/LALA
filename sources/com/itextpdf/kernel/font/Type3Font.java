package com.itextpdf.kernel.font;

import com.itextpdf.io.font.FontNames;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.otf.Glyph;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public class Type3Font extends FontProgram {
    private boolean colorized;
    private final Map<Integer, Type3Glyph> type3Glyphs = new HashMap();
    private final Map<Integer, Type3Glyph> type3GlyphsWithoutUnicode = new HashMap();
    private int flags = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Type3Font(boolean colorized) {
        this.colorized = false;
        this.colorized = colorized;
        this.fontNames = new FontNames();
        getFontMetrics().setBbox(0, 0, 0, 0);
    }

    public Type3Glyph getType3Glyph(int unicode) {
        return this.type3Glyphs.get(Integer.valueOf(unicode));
    }

    public Type3Glyph getType3GlyphByCode(int code) {
        Type3Glyph glyph = this.type3GlyphsWithoutUnicode.get(Integer.valueOf(code));
        if (glyph == null && this.codeToGlyph.get(Integer.valueOf(code)) != null) {
            return this.type3Glyphs.get(Integer.valueOf(this.codeToGlyph.get(Integer.valueOf(code)).getUnicode()));
        }
        return glyph;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getPdfFontFlags() {
        return this.flags;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean isFontSpecific() {
        return false;
    }

    public boolean isColorized() {
        return this.colorized;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getKerning(Glyph glyph1, Glyph glyph2) {
        return 0;
    }

    public int getNumberOfGlyphs() {
        return this.type3Glyphs.size() + this.type3GlyphsWithoutUnicode.size();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setFontName(String fontName) {
        super.setFontName(fontName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setFontFamily(String fontFamily) {
        super.setFontFamily(fontFamily);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setFontWeight(int fontWeight) {
        super.setFontWeight(fontWeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setFontStretch(String fontWidth) {
        super.setFontStretch(fontWidth);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setCapHeight(int capHeight) {
        super.setCapHeight(capHeight);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setItalicAngle(int italicAngle) {
        super.setItalicAngle(italicAngle);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setTypoAscender(int ascender) {
        super.setTypoAscender(ascender);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.FontProgram
    public void setTypoDescender(int descender) {
        super.setTypoDescender(descender);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setPdfFontFlags(int flags) {
        this.flags = flags;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addGlyph(int code, int unicode, int width, int[] bbox, Type3Glyph type3Glyph) {
        if (this.codeToGlyph.containsKey(Integer.valueOf(code))) {
            removeGlyphFromMappings(code);
        }
        Glyph glyph = new Glyph(code, width, unicode, bbox);
        this.codeToGlyph.put(Integer.valueOf(code), glyph);
        if (unicode < 0) {
            this.type3GlyphsWithoutUnicode.put(Integer.valueOf(code), type3Glyph);
        } else {
            this.unicodeToGlyph.put(Integer.valueOf(unicode), glyph);
            this.type3Glyphs.put(Integer.valueOf(unicode), type3Glyph);
        }
        recalculateAverageWidth();
    }

    private void removeGlyphFromMappings(int glyphCode) {
        Glyph removed = this.codeToGlyph.remove(Integer.valueOf(glyphCode));
        if (removed == null) {
            return;
        }
        int unicode = removed.getUnicode();
        if (unicode < 0) {
            this.type3GlyphsWithoutUnicode.remove(Integer.valueOf(glyphCode));
            return;
        }
        this.unicodeToGlyph.remove(Integer.valueOf(unicode));
        this.type3Glyphs.remove(Integer.valueOf(unicode));
    }

    private void recalculateAverageWidth() {
        int widthSum = 0;
        int glyphsNumber = this.codeToGlyph.size();
        for (Glyph glyph : this.codeToGlyph.values()) {
            if (glyph.getWidth() == 0) {
                glyphsNumber--;
            } else {
                widthSum += glyph.getWidth();
            }
        }
        this.avgWidth = glyphsNumber == 0 ? 0 : widthSum / glyphsNumber;
    }
}
