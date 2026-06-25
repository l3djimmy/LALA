package com.itextpdf.io.util;

import com.itextpdf.io.source.ByteBuffer;
/* loaded from: classes12.dex */
public final class PdfNameUtil {
    private PdfNameUtil() {
    }

    public static String decodeName(byte[] content) {
        StringBuilder buf = new StringBuilder();
        int k = 0;
        while (k < content.length) {
            try {
                char c = (char) content[k];
                if (c == '#') {
                    byte c1 = content[k + 1];
                    byte c2 = content[k + 2];
                    c = (char) ((ByteBuffer.getHex(c1) << 4) + ByteBuffer.getHex(c2));
                    k += 2;
                }
                buf.append(c);
                k++;
            } catch (IndexOutOfBoundsException e) {
            }
        }
        return buf.toString();
    }
}
