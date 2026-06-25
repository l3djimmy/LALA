package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class NotSupportedFlattener implements IAnnotationFlattener {
    private static final Logger LOGGER = LoggerFactory.getLogger(NotSupportedFlattener.class);

    @Override // com.itextpdf.kernel.utils.annotationsflattening.IAnnotationFlattener
    public boolean flatten(PdfAnnotation annotation, PdfPage page) {
        String message = MessageFormatUtil.format(KernelLogMessageConstant.FLATTENING_IS_NOT_YET_SUPPORTED, annotation.getSubtype());
        LOGGER.warn(message);
        return false;
    }
}
