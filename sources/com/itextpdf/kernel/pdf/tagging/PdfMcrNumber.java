package com.itextpdf.kernel.pdf.tagging;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfPage;
/* loaded from: classes12.dex */
public class PdfMcrNumber extends PdfMcr {
    public PdfMcrNumber(PdfNumber pdfObject, PdfStructElem parent) {
        super(pdfObject, parent);
    }

    public PdfMcrNumber(PdfPage page, PdfStructElem parent) {
        super(new PdfNumber(page.getNextMcid()), parent);
    }

    @Override // com.itextpdf.kernel.pdf.tagging.PdfMcr
    public int getMcid() {
        return ((PdfNumber) getPdfObject()).intValue();
    }

    @Override // com.itextpdf.kernel.pdf.tagging.PdfMcr
    public PdfDictionary getPageObject() {
        return super.getPageObject();
    }
}
