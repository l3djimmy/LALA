package com.itextpdf.io.font.cmap;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public final class StandardCMapCharsets {
    private static final Map<String, CMapCharsetEncoder> encoders = new HashMap();
    private static final CMapCharsetEncoder UTF16_ENCODER = new CMapCharsetEncoder(StandardCharsets.UTF_16BE);
    private static final CMapCharsetEncoder UCS2_ENCODER = new CMapCharsetEncoder(StandardCharsets.UTF_16BE, true);

    static {
        registerEncoder();
    }

    private StandardCMapCharsets() {
    }

    private static void registerHV(String cmapPrefix, CMapCharsetEncoder encoder) {
        encoders.put(cmapPrefix + "-H", encoder);
        encoders.put(cmapPrefix + "-V", encoder);
    }

    private static void registerEncoder() {
        registerHV("UniGB-UCS2", UCS2_ENCODER);
        registerHV("UniGB-UTF16", UTF16_ENCODER);
        registerHV("UniCNS-UCS2", UCS2_ENCODER);
        registerHV("UniCNS-UTF16", UTF16_ENCODER);
        registerHV("UniJIS-UCS2", UCS2_ENCODER);
        registerHV("UniJIS-UCS2-HW", UCS2_ENCODER);
        registerHV("UniJIS2004-UTF16", UTF16_ENCODER);
        registerHV("UniJIS-UTF16", UTF16_ENCODER);
        registerHV("UniKS-UCS2", UCS2_ENCODER);
        registerHV("UniKS-UTF16", UTF16_ENCODER);
    }

    public static CMapCharsetEncoder getEncoder(String stdCmapName) {
        return encoders.get(stdCmapName);
    }

    public static void disableCharsetEncoders() {
        encoders.clear();
    }

    public static void enableCharsetEncoders() {
        if (encoders.size() == 0) {
            registerEncoder();
        }
    }
}
