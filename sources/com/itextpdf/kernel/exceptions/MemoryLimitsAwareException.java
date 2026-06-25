package com.itextpdf.kernel.exceptions;
/* loaded from: classes12.dex */
public class MemoryLimitsAwareException extends PdfException {
    public MemoryLimitsAwareException(String message) {
        super(message);
    }

    public MemoryLimitsAwareException(Throwable cause) {
        this(KernelExceptionMessageConstant.UNKNOWN_PDF_EXCEPTION, cause);
    }

    public MemoryLimitsAwareException(String message, Throwable cause) {
        super(message, cause);
    }
}
