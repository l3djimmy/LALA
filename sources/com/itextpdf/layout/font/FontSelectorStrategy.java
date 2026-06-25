package com.itextpdf.layout.font;

import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.kernel.font.PdfFont;
import java.util.List;
@Deprecated
/* loaded from: classes12.dex */
public abstract class FontSelectorStrategy {
    protected final FontSet additionalFonts;
    protected int index = 0;
    protected final FontProvider provider;
    protected String text;

    public abstract PdfFont getCurrentFont();

    public abstract List<Glyph> nextGlyphs();

    /* JADX INFO: Access modifiers changed from: protected */
    public FontSelectorStrategy(String text, FontProvider provider, FontSet additionalFonts) {
        this.text = text;
        this.provider = provider;
        this.additionalFonts = additionalFonts;
    }

    public boolean endOfText() {
        return this.text == null || this.index >= this.text.length();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfFont getPdfFont(FontInfo fontInfo) {
        return this.provider.getPdfFont(fontInfo, this.additionalFonts);
    }
}
