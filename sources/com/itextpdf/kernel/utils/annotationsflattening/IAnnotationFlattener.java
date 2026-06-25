package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
/* loaded from: classes12.dex */
public interface IAnnotationFlattener {
    boolean flatten(PdfAnnotation pdfAnnotation, PdfPage pdfPage);
}
