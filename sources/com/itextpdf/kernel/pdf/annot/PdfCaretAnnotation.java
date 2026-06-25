package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public class PdfCaretAnnotation extends PdfMarkupAnnotation {
    public PdfCaretAnnotation(Rectangle rect) {
        super(rect);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfCaretAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Caret;
    }

    public PdfCaretAnnotation setSymbol(PdfString symbol) {
        return (PdfCaretAnnotation) put(PdfName.Sy, symbol);
    }

    public PdfString getSymbol() {
        return getPdfObject().getAsString(PdfName.Sy);
    }

    public PdfArray getRectangleDifferences() {
        return getPdfObject().getAsArray(PdfName.RD);
    }

    public PdfCaretAnnotation setRectangleDifferences(PdfArray rect) {
        return (PdfCaretAnnotation) put(PdfName.RD, rect);
    }
}
