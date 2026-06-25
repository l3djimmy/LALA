package com.itextpdf.kernel.pdf.filespec;

import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public class PdfStringFS extends PdfFileSpec {
    public PdfStringFS(String string) {
        super(new PdfString(string));
    }

    public PdfStringFS(PdfString pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.filespec.PdfFileSpec, com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
