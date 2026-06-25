package com.itextpdf.commons.exceptions;
/* loaded from: classes12.dex */
public class ITextException extends RuntimeException {
    public ITextException() {
        super(CommonsExceptionMessageConstant.UNKNOWN_ITEXT_EXCEPTION);
    }

    public ITextException(String message) {
        super(message);
    }

    public ITextException(Throwable cause) {
        super(CommonsExceptionMessageConstant.UNKNOWN_ITEXT_EXCEPTION, cause);
    }

    public ITextException(String message, Throwable cause) {
        super(message, cause);
    }
}
