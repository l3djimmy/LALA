package com.itextpdf.io.font.cmap;

import com.itextpdf.io.font.PdfEncodings;
import java.util.ArrayList;
import java.util.List;
import kotlin.UByte;
/* loaded from: classes12.dex */
public abstract class AbstractCMap {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private String cmapName;
    private String ordering;
    private String registry;
    private int supplement;

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void addChar(String str, CMapObject cMapObject);

    public String getName() {
        return this.cmapName;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setName(String cmapName) {
        this.cmapName = cmapName;
    }

    public String getOrdering() {
        return this.ordering;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOrdering(String ordering) {
        this.ordering = ordering;
    }

    public String getRegistry() {
        return this.registry;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setRegistry(String registry) {
        this.registry = registry;
    }

    public int getSupplement() {
        return this.supplement;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSupplement(int supplement) {
        this.supplement = supplement;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addCodeSpaceRange(byte[] low, byte[] high) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addRange(String from, String to, CMapObject code) {
        byte[] a1 = decodeStringToByte(from);
        byte[] a2 = decodeStringToByte(to);
        if (a1.length != a2.length || a1.length == 0) {
            throw new IllegalArgumentException("Invalid map.");
        }
        byte[] sout = null;
        if (code.isString()) {
            sout = decodeStringToByte(code.toString());
        }
        int start = byteArrayToInt(a1);
        int end = byteArrayToInt(a2);
        for (int k = start; k <= end; k++) {
            intToByteArray(k, a1);
            String mark = PdfEncodings.convertToString(a1, null);
            if (code.isArray()) {
                List<CMapObject> codes = (ArrayList) code.getValue();
                addChar(mark, codes.get(k - start));
            } else if (code.isNumber()) {
                int nn = (((Integer) code.getValue()).intValue() + k) - start;
                addChar(mark, new CMapObject(4, Integer.valueOf(nn)));
            } else if (code.isString()) {
                CMapObject s1 = new CMapObject(2, sout);
                addChar(mark, s1);
                if (sout == null) {
                    throw new AssertionError();
                }
                intToByteArray(byteArrayToInt(sout) + 1, sout);
            } else {
                continue;
            }
        }
    }

    public static byte[] decodeStringToByte(String range) {
        byte[] bytes = new byte[range.length()];
        for (int i = 0; i < range.length(); i++) {
            bytes[i] = (byte) range.charAt(i);
        }
        return bytes;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String toUnicodeString(String value, boolean isHexWriting) {
        byte[] bytes = decodeStringToByte(value);
        if (isHexWriting) {
            return PdfEncodings.convertToString(bytes, PdfEncodings.UNICODE_BIG_UNMARKED);
        }
        if (bytes.length >= 2 && bytes[0] == -2 && bytes[1] == -1) {
            return PdfEncodings.convertToString(bytes, PdfEncodings.UNICODE_BIG);
        }
        return PdfEncodings.convertToString(bytes, PdfEncodings.PDF_DOC_ENCODING);
    }

    private static void intToByteArray(int n, byte[] b) {
        for (int k = b.length - 1; k >= 0; k--) {
            b[k] = (byte) n;
            n >>>= 8;
        }
    }

    private static int byteArrayToInt(byte[] b) {
        int n = 0;
        for (byte b2 : b) {
            n = (n << 8) | (b2 & UByte.MAX_VALUE);
        }
        return n;
    }
}
