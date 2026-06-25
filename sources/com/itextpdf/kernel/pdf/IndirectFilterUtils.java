package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import org.slf4j.Logger;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class IndirectFilterUtils {
    private IndirectFilterUtils() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void throwFlushedFilterException(PdfStream stream) {
        throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.FLUSHED_STREAM_FILTER_EXCEPTION, Integer.valueOf(stream.getIndirectReference().getObjNumber()), Integer.valueOf(stream.getIndirectReference().getGenNumber())));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void logFilterWasAlreadyFlushed(Logger logger, PdfStream stream) {
        logger.info(MessageFormatUtil.format(IoLogMessageConstant.FILTER_WAS_ALREADY_FLUSHED, Integer.valueOf(stream.getIndirectReference().getObjNumber()), Integer.valueOf(stream.getIndirectReference().getGenNumber())));
    }
}
