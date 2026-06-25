package com.itextpdf.kernel.exceptions;
/* loaded from: classes12.dex */
public class BadPasswordException extends PdfException {
    public static final String PdfReaderNotOpenedWithOwnerPassword = "PdfReader is not opened with owner password";

    public BadPasswordException(String message, Throwable cause) {
        super(message, cause);
    }

    public BadPasswordException(String message) {
        super(message);
    }
}
