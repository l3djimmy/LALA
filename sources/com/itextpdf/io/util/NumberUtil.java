package com.itextpdf.io.util;
/* loaded from: classes12.dex */
public class NumberUtil {
    private NumberUtil() {
    }

    public static Float asFloat(Object obj) {
        Number value = (Number) obj;
        if (value != null) {
            return Float.valueOf(value.floatValue());
        }
        return null;
    }

    public static Integer asInteger(Object obj) {
        Number value = (Number) obj;
        if (value != null) {
            return Integer.valueOf(value.intValue());
        }
        return null;
    }
}
