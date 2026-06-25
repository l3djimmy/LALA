package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
/* loaded from: classes12.dex */
public class PdfStampAnnotation extends PdfMarkupAnnotation {
    public PdfStampAnnotation(Rectangle rect) {
        super(rect);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfStampAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Stamp;
    }

    public PdfStampAnnotation setStampName(PdfName name) {
        return (PdfStampAnnotation) put(PdfName.Name, name);
    }

    public PdfName getStampName() {
        return getPdfObject().getAsName(PdfName.Name);
    }

    public PdfName getIconName() {
        return getPdfObject().getAsName(PdfName.Name);
    }

    public PdfNumber getRotation() {
        return getPdfObject().getAsNumber(PdfName.Rotate);
    }

    public PdfStampAnnotation setIconName(PdfName name) {
        return (PdfStampAnnotation) put(PdfName.Name, name);
    }

    public PdfStampAnnotation setRotation(int degAngle) {
        put(PdfName.Rotate, new PdfNumber(degAngle));
        return this;
    }
}
