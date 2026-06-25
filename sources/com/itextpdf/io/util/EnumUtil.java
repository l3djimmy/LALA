package com.itextpdf.io.util;

import java.util.Arrays;
import java.util.List;
/* loaded from: classes12.dex */
public final class EnumUtil {
    private EnumUtil() {
    }

    public static <T extends Enum<T>> T throwIfNull(T enumInstance) {
        if (enumInstance == null) {
            throw new RuntimeException("Expected not null enum instance");
        }
        return enumInstance;
    }

    public static <T extends Enum<T>> List<T> getAllValuesOfEnum(Class<T> enumInstance) {
        if (enumInstance == null) {
            throw new RuntimeException("Expected not null enum instance");
        }
        return Arrays.asList(enumInstance.getEnumConstants());
    }
}
