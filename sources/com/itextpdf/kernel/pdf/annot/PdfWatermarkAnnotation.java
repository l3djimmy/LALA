package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* loaded from: classes12.dex */
public class PdfWatermarkAnnotation extends PdfAnnotation {
    public PdfWatermarkAnnotation(Rectangle rect) {
        super(rect);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfWatermarkAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Watermark;
    }

    public PdfWatermarkAnnotation setFixedPrint(PdfFixedPrint fixedPrint) {
        return (PdfWatermarkAnnotation) put(PdfName.FixedPrint, fixedPrint.getPdfObject());
    }

    public PdfDictionary getFixedPrint() {
        return getPdfObject().getAsDictionary(PdfName.FixedPrint);
    }
}
