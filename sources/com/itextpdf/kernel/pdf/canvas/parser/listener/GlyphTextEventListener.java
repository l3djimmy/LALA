package com.itextpdf.kernel.pdf.canvas.parser.listener;
/* loaded from: classes12.dex */
public class GlyphTextEventListener extends GlyphEventListener implements ITextExtractionStrategy {
    public GlyphTextEventListener(ITextExtractionStrategy delegate) {
        super(delegate);
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.listener.ITextExtractionStrategy
    public String getResultantText() {
        if (this.delegate instanceof ITextExtractionStrategy) {
            return ((ITextExtractionStrategy) this.delegate).getResultantText();
        }
        return null;
    }
}
