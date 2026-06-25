package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.geom.PageSize;
/* loaded from: classes12.dex */
public interface IPdfPageFactory {
    PdfPage createPdfPage(PdfDictionary pdfDictionary);

    PdfPage createPdfPage(PdfDocument pdfDocument, PageSize pageSize);
}
