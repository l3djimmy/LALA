package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class PdfPolygonAnnotation extends PdfPolyGeomAnnotation {
    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfPolygonAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfPolygonAnnotation(Rectangle rect, float[] vertices) {
        super(rect, vertices);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Polygon;
    }
}
