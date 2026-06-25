package com.itextpdf.io.exceptions;
/* loaded from: classes12.dex */
public final class ExceptionUtil {
    private ExceptionUtil() {
    }

    public static boolean isOutOfRange(Exception e) {
        return e instanceof IndexOutOfBoundsException;
    }
}
