package com.itextpdf.kernel.xmp.impl;

import okio.Utf8;
/* loaded from: classes12.dex */
public class Base64 {
    private static final byte EQUAL = -3;
    private static final byte INVALID = -1;
    private static final byte WHITESPACE = -2;
    private static byte[] base64 = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
    private static byte[] ascii = new byte[255];

    static {
        for (int idx = 0; idx < 255; idx++) {
            ascii[idx] = -1;
        }
        for (int idx2 = 0; idx2 < base64.length; idx2++) {
            ascii[base64[idx2]] = (byte) idx2;
        }
        ascii[9] = WHITESPACE;
        ascii[10] = WHITESPACE;
        ascii[13] = WHITESPACE;
        ascii[32] = WHITESPACE;
        ascii[61] = EQUAL;
    }

    public static final byte[] encode(byte[] src) {
        return encode(src, 0);
    }

    public static final byte[] encode(byte[] src, int lineFeed) {
        int lineFeed2 = (lineFeed / 4) * 4;
        if (lineFeed2 < 0) {
            lineFeed2 = 0;
        }
        int codeLength = ((src.length + 2) / 3) * 4;
        if (lineFeed2 > 0) {
            codeLength += (codeLength - 1) / lineFeed2;
        }
        byte[] dst = new byte[codeLength];
        int bits6 = 0;
        int bits24 = 0;
        int lf = 0;
        while (bits24 + 3 <= src.length) {
            int sidx = bits24 + 1;
            int bits242 = (src[bits24] & 255) << 16;
            int sidx2 = sidx + 1;
            int bits243 = bits242 | ((src[sidx] & 255) << 8);
            int sidx3 = sidx2 + 1;
            int bits244 = bits243 | ((src[sidx2] & 255) << 0);
            int bits62 = (bits244 & 16515072) >> 18;
            int didx = bits6 + 1;
            dst[bits6] = base64[bits62];
            int bits63 = (bits244 & 258048) >> 12;
            int bits64 = didx + 1;
            dst[didx] = base64[bits63];
            int bits65 = (bits244 & 4032) >> 6;
            int didx2 = bits64 + 1;
            dst[bits64] = base64[bits65];
            int bits66 = bits244 & 63;
            int didx3 = didx2 + 1;
            dst[didx2] = base64[bits66];
            lf += 4;
            if (didx3 >= codeLength || lineFeed2 <= 0 || lf % lineFeed2 != 0) {
                bits24 = sidx3;
                bits6 = didx3;
            } else {
                dst[didx3] = 10;
                bits24 = sidx3;
                bits6 = didx3 + 1;
            }
        }
        if (src.length - bits24 == 2) {
            int bits245 = ((src[bits24] & 255) << 16) | ((src[bits24 + 1] & 255) << 8);
            int bits67 = (bits245 & 16515072) >> 18;
            int didx4 = bits6 + 1;
            dst[bits6] = base64[bits67];
            int bits68 = (bits245 & 258048) >> 12;
            int bits69 = didx4 + 1;
            dst[didx4] = base64[bits68];
            int bits610 = (bits245 & 4032) >> 6;
            int didx5 = bits69 + 1;
            dst[bits69] = base64[bits610];
            int i = didx5 + 1;
            dst[didx5] = kotlin.io.encoding.Base64.padSymbol;
        } else {
            int bits246 = src.length;
            if (bits246 - bits24 == 1) {
                int bits247 = (src[bits24] & 255) << 16;
                int bits611 = (bits247 & 16515072) >> 18;
                int didx6 = bits6 + 1;
                dst[bits6] = base64[bits611];
                int bits612 = (bits247 & 258048) >> 12;
                int bits613 = didx6 + 1;
                dst[didx6] = base64[bits612];
                int didx7 = bits613 + 1;
                dst[bits613] = kotlin.io.encoding.Base64.padSymbol;
                int i2 = didx7 + 1;
                dst[didx7] = kotlin.io.encoding.Base64.padSymbol;
            }
        }
        return dst;
    }

    public static final String encode(String src) {
        return new String(encode(src.getBytes()));
    }

    public static final byte[] decode(byte[] src) throws IllegalArgumentException {
        int srcLen = 0;
        for (byte b : src) {
            byte val = ascii[b];
            if (val >= 0) {
                src[srcLen] = val;
                srcLen++;
            } else if (val == -1) {
                throw new IllegalArgumentException("Invalid base 64 string");
            }
        }
        while (srcLen > 0 && src[srcLen - 1] == -3) {
            srcLen--;
        }
        byte[] dst = new byte[(srcLen * 3) / 4];
        int sidx = 0;
        int didx = 0;
        while (didx < dst.length - 2) {
            dst[didx] = (byte) (((src[sidx] << 2) & 255) | ((src[sidx + 1] >>> 4) & 3));
            dst[didx + 1] = (byte) (((src[sidx + 1] << 4) & 255) | ((src[sidx + 2] >>> 2) & 15));
            dst[didx + 2] = (byte) (((src[sidx + 2] << 6) & 255) | (src[sidx + 3] & Utf8.REPLACEMENT_BYTE));
            sidx += 4;
            didx += 3;
        }
        if (didx < dst.length) {
            dst[didx] = (byte) (((src[sidx] << 2) & 255) | ((src[sidx + 1] >>> 4) & 3));
        }
        int didx2 = didx + 1;
        if (didx2 < dst.length) {
            dst[didx2] = (byte) (((src[sidx + 1] << 4) & 255) | ((src[sidx + 2] >>> 2) & 15));
        }
        return dst;
    }

    public static final String decode(String src) {
        return new String(decode(src.getBytes()));
    }
}
