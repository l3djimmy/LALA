package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* loaded from: classes12.dex */
public class PdfSquareAnnotation extends PdfMarkupAnnotation {
    public PdfSquareAnnotation(Rectangle rect) {
        super(rect);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfSquareAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Square;
    }

    public PdfDictionary getBorderStyle() {
        return getPdfObject().getAsDictionary(PdfName.BS);
    }

    public PdfSquareAnnotation setBorderStyle(PdfDictionary borderStyle) {
        return (PdfSquareAnnotation) put(PdfName.BS, borderStyle);
    }

    public PdfSquareAnnotation setBorderStyle(PdfName style) {
        return setBorderStyle(BorderStyleUtil.setStyle(getBorderStyle(), style));
    }

    public PdfSquareAnnotation setDashPattern(PdfArray dashPattern) {
        return setBorderStyle(BorderStyleUtil.setDashPattern(getBorderStyle(), dashPattern));
    }

    public PdfArray getRectangleDifferences() {
        return getPdfObject().getAsArray(PdfName.RD);
    }

    public PdfSquareAnnotation setRectangleDifferences(PdfArray rect) {
        return (PdfSquareAnnotation) put(PdfName.RD, rect);
    }

    public PdfDictionary getBorderEffect() {
        return getPdfObject().getAsDictionary(PdfName.BE);
    }

    public PdfSquareAnnotation setBorderEffect(PdfDictionary borderEffect) {
        return (PdfSquareAnnotation) put(PdfName.BE, borderEffect);
    }

    public Color getInteriorColor() {
        return InteriorColorUtil.parseInteriorColor(getPdfObject().getAsArray(PdfName.IC));
    }

    public PdfSquareAnnotation setInteriorColor(PdfArray interiorColor) {
        return (PdfSquareAnnotation) put(PdfName.IC, interiorColor);
    }

    public PdfSquareAnnotation setInteriorColor(float[] interiorColor) {
        return setInteriorColor(new PdfArray(interiorColor));
    }
}
