package com.itextpdf.commons.utils;

import java.text.MessageFormat;
import java.util.Locale;
/* loaded from: classes12.dex */
public final class MessageFormatUtil {
    private MessageFormatUtil() {
    }

    public static String format(String pattern, Object... arguments) {
        return new MessageFormat(pattern.replace("'", "''").replace("{{{", "'{'{").replace("}}}", "}'}'").replace("{{", "'{'").replace("}}", "'}'"), Locale.ROOT).format(arguments);
    }
}
