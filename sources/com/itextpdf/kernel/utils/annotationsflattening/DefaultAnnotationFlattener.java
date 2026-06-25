package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class DefaultAnnotationFlattener implements IAnnotationFlattener {
    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultAnnotationFlattener.class);

    @Override // com.itextpdf.kernel.utils.annotationsflattening.IAnnotationFlattener
    public boolean flatten(PdfAnnotation annotation, PdfPage page) {
        if (annotation == null) {
            throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.ARG_SHOULD_NOT_BE_NULL, "annotation"));
        }
        if (page == null) {
            throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.ARG_SHOULD_NOT_BE_NULL, "page"));
        }
        PdfArray pdfArrayRectangle = annotation.getRectangle();
        if (pdfArrayRectangle == null) {
            return false;
        }
        PdfObject normalAppearance = annotation.getNormalAppearanceObject();
        if (normalAppearance instanceof PdfStream) {
            Rectangle area = annotation.getRectangle().toRectangle();
            PdfCanvas under = createCanvas(page);
            PdfStream annotationNormalAppearanceStream = (PdfStream) normalAppearance;
            under.addXObjectFittedIntoRectangle(new PdfFormXObject(annotationNormalAppearanceStream), area);
            page.removeAnnotation(annotation);
            return true;
        }
        boolean drawn = draw(annotation, page);
        if (drawn) {
            page.removeAnnotation(annotation);
            return true;
        }
        String message = MessageFormatUtil.format(KernelLogMessageConstant.FLATTENING_IS_NOT_YET_SUPPORTED, annotation.getSubtype());
        LOGGER.warn(message);
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfCanvas createCanvas(PdfPage page) {
        return new PdfCanvas(page.newContentStreamAfter(), page.getResources(), page.getDocument());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean draw(PdfAnnotation annotation, PdfPage page) {
        return false;
    }
}
