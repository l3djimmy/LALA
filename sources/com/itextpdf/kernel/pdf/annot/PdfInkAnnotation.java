package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* loaded from: classes12.dex */
public class PdfInkAnnotation extends PdfMarkupAnnotation {
    public PdfInkAnnotation(Rectangle rect) {
        super(rect);
    }

    public PdfInkAnnotation(Rectangle rect, PdfArray inkList) {
        this(rect);
        put(PdfName.InkList, inkList);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfInkAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Ink;
    }

    public PdfDictionary getBorderStyle() {
        return getPdfObject().getAsDictionary(PdfName.BS);
    }

    public PdfInkAnnotation setBorderStyle(PdfDictionary borderStyle) {
        return (PdfInkAnnotation) put(PdfName.BS, borderStyle);
    }

    public PdfInkAnnotation setBorderStyle(PdfName style) {
        return setBorderStyle(BorderStyleUtil.setStyle(getBorderStyle(), style));
    }

    public PdfInkAnnotation setDashPattern(PdfArray dashPattern) {
        return setBorderStyle(BorderStyleUtil.setDashPattern(getBorderStyle(), dashPattern));
    }
}
