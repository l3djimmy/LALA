package com.itextpdf.kernel.pdf.tagging;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfPage;
/* loaded from: classes12.dex */
public class PdfMcrDictionary extends PdfMcr {
    public PdfMcrDictionary(PdfDictionary pdfObject, PdfStructElem parent) {
        super(pdfObject, parent);
    }

    public PdfMcrDictionary(PdfPage page, PdfStructElem parent) {
        super(new PdfDictionary(), parent);
        PdfDictionary dict = (PdfDictionary) getPdfObject();
        dict.put(PdfName.Type, PdfName.MCR);
        dict.put(PdfName.Pg, page.getPdfObject().getIndirectReference());
        dict.put(PdfName.MCID, new PdfNumber(page.getNextMcid()));
    }

    @Override // com.itextpdf.kernel.pdf.tagging.PdfMcr
    public int getMcid() {
        PdfNumber mcidNumber = ((PdfDictionary) getPdfObject()).getAsNumber(PdfName.MCID);
        if (mcidNumber != null) {
            return mcidNumber.intValue();
        }
        return -1;
    }

    @Override // com.itextpdf.kernel.pdf.tagging.PdfMcr
    public PdfDictionary getPageObject() {
        return super.getPageObject();
    }
}
