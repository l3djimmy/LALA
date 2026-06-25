package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
/* loaded from: classes12.dex */
public interface ICopyFilter {
    boolean shouldProcess(PdfObject pdfObject, PdfName pdfName, PdfObject pdfObject2);
}
