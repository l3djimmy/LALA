package com.itextpdf.kernel.crypto;

import com.itextpdf.commons.utils.SystemUtil;
import java.nio.charset.StandardCharsets;
import org.slf4j.Marker;
/* loaded from: classes12.dex */
public final class IVGenerator {
    private static final ARCFOUREncryption arcfour = new ARCFOUREncryption();

    static {
        long time = SystemUtil.getTimeBasedSeed();
        long mem = SystemUtil.getFreeMemory();
        String s = time + Marker.ANY_NON_NULL_MARKER + mem;
        arcfour.prepareARCFOURKey(s.getBytes(StandardCharsets.ISO_8859_1));
    }

    private IVGenerator() {
    }

    public static byte[] getIV() {
        return getIV(16);
    }

    public static byte[] getIV(int len) {
        byte[] b = new byte[len];
        synchronized (arcfour) {
            arcfour.encryptARCFOUR(b);
        }
        return b;
    }
}
