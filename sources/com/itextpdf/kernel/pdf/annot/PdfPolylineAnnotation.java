package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class PdfPolylineAnnotation extends PdfPolyGeomAnnotation {
    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfPolylineAnnotation(Rectangle rect, float[] vertices) {
        super(rect, vertices);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfPolylineAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.PolyLine;
    }
}
