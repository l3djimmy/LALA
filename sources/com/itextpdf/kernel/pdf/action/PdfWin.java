package com.itextpdf.kernel.pdf.action;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public class PdfWin extends PdfObjectWrapper<PdfDictionary> {
    public PdfWin(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public PdfWin(PdfString f) {
        this(new PdfDictionary());
        getPdfObject().put(PdfName.F, f);
    }

    public PdfWin(PdfString f, PdfString d, PdfString o, PdfString p) {
        this(new PdfDictionary());
        getPdfObject().put(PdfName.F, f);
        getPdfObject().put(PdfName.D, d);
        getPdfObject().put(PdfName.O, o);
        getPdfObject().put(PdfName.P, p);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
