package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.pdf.IsoKey;
import com.itextpdf.kernel.pdf.PdfResources;
import com.itextpdf.kernel.pdf.PdfStream;
/* loaded from: classes12.dex */
public interface IValidationChecker {
    void validateDocument(ValidationContext validationContext);

    void validateObject(Object obj, IsoKey isoKey, PdfResources pdfResources, PdfStream pdfStream, Object obj2);
}
