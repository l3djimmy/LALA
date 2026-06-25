package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
/* loaded from: classes12.dex */
public class PdfPrinterMarkAnnotation extends PdfAnnotation {
    public PdfPrinterMarkAnnotation(Rectangle rect, PdfFormXObject appearanceStream) {
        super(rect);
        setNormalAppearance(appearanceStream.getPdfObject());
        setFlags(68);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPrinterMarkAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.PrinterMark;
    }

    public PdfMarkupAnnotation setArbitraryTypeName(PdfName arbitraryTypeName) {
        return (PdfMarkupAnnotation) put(PdfName.MN, arbitraryTypeName);
    }

    public PdfName getArbitraryTypeName() {
        return getPdfObject().getAsName(PdfName.MN);
    }
}
