package com.itextpdf.commons.utils;

import java.util.regex.Pattern;
/* loaded from: classes12.dex */
public final class StringSplitUtil {
    private StringSplitUtil() {
    }

    public static String[] splitKeepTrailingWhiteSpace(String data, char toSplitOn) {
        return data.split(Pattern.quote(String.valueOf(toSplitOn)), -1);
    }
}
