package com.itextpdf.kernel.utils;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.utils.annotationsflattening.IAnnotationFlattener;
import com.itextpdf.kernel.utils.annotationsflattening.PdfAnnotationFlattenFactory;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfAnnotationFlattener {
    private final PdfAnnotationFlattenFactory pdfAnnotationFlattenFactory;

    public PdfAnnotationFlattener(PdfAnnotationFlattenFactory pdfAnnotationFlattenFactory) {
        this.pdfAnnotationFlattenFactory = pdfAnnotationFlattenFactory;
    }

    public PdfAnnotationFlattener() {
        this.pdfAnnotationFlattenFactory = new PdfAnnotationFlattenFactory();
    }

    public List<PdfAnnotation> flatten(List<PdfAnnotation> annotationsToFlatten) {
        PdfPage page;
        if (annotationsToFlatten == null) {
            throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.ARG_SHOULD_NOT_BE_NULL, "annotationsToFlatten"));
        }
        List<PdfAnnotation> unFlattenedAnnotations = new ArrayList<>();
        for (PdfAnnotation pdfAnnotation : annotationsToFlatten) {
            if (pdfAnnotation != null && (page = pdfAnnotation.getPage()) != null) {
                IAnnotationFlattener worker = this.pdfAnnotationFlattenFactory.getAnnotationFlattenWorker(pdfAnnotation.getSubtype());
                boolean flattenedSuccessfully = worker.flatten(pdfAnnotation, page);
                if (!flattenedSuccessfully) {
                    unFlattenedAnnotations.add(pdfAnnotation);
                }
            }
        }
        return unFlattenedAnnotations;
    }

    public List<PdfAnnotation> flatten(PdfDocument document) {
        if (document == null) {
            throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.ARG_SHOULD_NOT_BE_NULL, "document"));
        }
        List<PdfAnnotation> annotations = new ArrayList<>();
        int documentNumberOfPages = document.getNumberOfPages();
        for (int i = 1; i <= documentNumberOfPages; i++) {
            PdfPage page = document.getPage(i);
            List<PdfAnnotation> failedFlatteningAnnotations = flatten(page.getAnnotations());
            annotations.addAll(failedFlatteningAnnotations);
        }
        return annotations;
    }
}
