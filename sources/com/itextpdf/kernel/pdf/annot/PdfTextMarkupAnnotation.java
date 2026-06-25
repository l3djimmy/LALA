package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* loaded from: classes12.dex */
public class PdfTextMarkupAnnotation extends PdfMarkupAnnotation {
    public static final PdfName MarkupHighlight = PdfName.Highlight;
    public static final PdfName MarkupUnderline = PdfName.Underline;
    public static final PdfName MarkupStrikeout = PdfName.StrikeOut;
    public static final PdfName MarkupSquiggly = PdfName.Squiggly;

    public PdfTextMarkupAnnotation(Rectangle rect, PdfName subtype, float[] quadPoints) {
        super(rect);
        put(PdfName.Subtype, subtype);
        setQuadPoints(new PdfArray(quadPoints));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfTextMarkupAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public static PdfTextMarkupAnnotation createHighLight(Rectangle rect, float[] quadPoints) {
        return new PdfTextMarkupAnnotation(rect, MarkupHighlight, quadPoints);
    }

    public static PdfTextMarkupAnnotation createUnderline(Rectangle rect, float[] quadPoints) {
        return new PdfTextMarkupAnnotation(rect, MarkupUnderline, quadPoints);
    }

    public static PdfTextMarkupAnnotation createStrikeout(Rectangle rect, float[] quadPoints) {
        return new PdfTextMarkupAnnotation(rect, MarkupStrikeout, quadPoints);
    }

    public static PdfTextMarkupAnnotation createSquiggly(Rectangle rect, float[] quadPoints) {
        return new PdfTextMarkupAnnotation(rect, MarkupSquiggly, quadPoints);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        PdfName subType = getPdfObject().getAsName(PdfName.Subtype);
        if (subType == null) {
            return MarkupUnderline;
        }
        return subType;
    }

    public PdfArray getQuadPoints() {
        return getPdfObject().getAsArray(PdfName.QuadPoints);
    }

    public PdfTextMarkupAnnotation setQuadPoints(PdfArray quadPoints) {
        return (PdfTextMarkupAnnotation) put(PdfName.QuadPoints, quadPoints);
    }
}
