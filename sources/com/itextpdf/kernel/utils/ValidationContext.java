package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.pdf.PdfDocument;
import java.util.Collection;
/* loaded from: classes12.dex */
public class ValidationContext {
    private PdfDocument PdfDocument = null;
    private Collection<PdfFont> fonts = null;

    public ValidationContext withPdfDocument(PdfDocument pdfDocument) {
        this.PdfDocument = pdfDocument;
        return this;
    }

    public ValidationContext withFonts(Collection<PdfFont> fonts) {
        this.fonts = fonts;
        return this;
    }

    public PdfDocument getPdfDocument() {
        return this.PdfDocument;
    }

    public Collection<PdfFont> getFonts() {
        return this.fonts;
    }
}
