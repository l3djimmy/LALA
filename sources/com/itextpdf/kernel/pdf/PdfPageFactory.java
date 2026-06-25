package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.geom.PageSize;
/* loaded from: classes12.dex */
class PdfPageFactory implements IPdfPageFactory {
    @Override // com.itextpdf.kernel.pdf.IPdfPageFactory
    public PdfPage createPdfPage(PdfDictionary pdfObject) {
        return new PdfPage(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.IPdfPageFactory
    public PdfPage createPdfPage(PdfDocument pdfDocument, PageSize pageSize) {
        return new PdfPage(pdfDocument, pageSize);
    }
}
