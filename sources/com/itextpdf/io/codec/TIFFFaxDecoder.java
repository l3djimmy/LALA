package com.itextpdf.io.codec;

import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import kotlin.UByte;
import kotlin.io.encoding.Base64;
import kotlin.jvm.internal.ByteCompanionObject;
import okio.Utf8;
/* loaded from: classes12.dex */
public class TIFFFaxDecoder {
    private int[] currChangingElems;
    private byte[] data;
    private int fillOrder;
    private int h;
    private int oneD;
    private int[] prevChangingElems;
    private boolean recoverFromImageError;
    private int w;
    static int[] table1 = {0, 1, 3, 7, 15, 31, 63, 127, 255};
    static int[] table2 = {0, 128, 192, 224, 240, 248, 252, TIFFConstants.TIFFTAG_SUBFILETYPE, 255};
    public static byte[] flipTable = {0, ByteCompanionObject.MIN_VALUE, 64, -64, 32, -96, 96, -32, 16, -112, 80, -48, 48, -80, 112, -16, 8, -120, 72, -56, 40, -88, 104, -24, 24, -104, 88, -40, 56, -72, 120, -8, 4, -124, 68, -60, 36, -92, 100, -28, 20, -108, 84, -44, 52, -76, 116, -12, 12, -116, 76, -52, 44, -84, 108, -20, 28, -100, 92, -36, 60, -68, 124, -4, 2, -126, 66, -62, 34, -94, 98, -30, 18, -110, 82, -46, 50, -78, 114, -14, 10, -118, 74, -54, 42, -86, 106, -22, 26, -102, 90, -38, 58, -70, 122, -6, 6, -122, 70, -58, 38, -90, 102, -26, 22, -106, 86, -42, 54, -74, 118, -10, 14, -114, 78, -50, 46, -82, 110, -18, 30, -98, 94, -34, 62, -66, 126, -2, 1, -127, 65, -63, 33, -95, 97, -31, 17, -111, 81, -47, 49, -79, 113, -15, 9, -119, 73, -55, 41, -87, 105, -23, 25, -103, 89, -39, 57, -71, 121, -7, 5, -123, 69, -59, 37, -91, 101, -27, 21, -107, 85, -43, 53, -75, 117, -11, 13, -115, 77, -51, 45, -83, 109, -19, 29, -99, 93, -35, Base64.padSymbol, -67, 125, -3, 3, -125, 67, -61, 35, -93, 99, -29, 19, -109, 83, -45, 51, -77, 115, -13, 11, -117, 75, -53, 43, -85, 107, -21, 27, -101, 91, -37, 59, -69, 123, -5, 7, -121, 71, -57, 39, -89, 103, -25, 23, -105, 87, -41, 55, -73, 119, -9, 15, -113, 79, -49, 47, -81, 111, -17, 31, -97, 95, -33, Utf8.REPLACEMENT_BYTE, -65, ByteCompanionObject.MAX_VALUE, -1};
    static short[] white = {6430, 6400, 6400, 6400, 3225, 3225, 3225, 3225, 944, 944, 944, 944, 976, 976, 976, 976, 1456, 1456, 1456, 1456, 1488, 1488, 1488, 1488, 718, 718, 718, 718, 718, 718, 718, 718, 750, 750, 750, 750, 750, 750, 750, 750, 1520, 1520, 1520, 1520, 1552, 1552, 1552, 1552, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 654, 654, 654, 654, 654, 654, 654, 654, 1072, 1072, 1072, 1072, 1104, 1104, 1104, 1104, 1136, 1136, 1136, 1136, 1168, 1168, 1168, 1168, 1200, 1200, 1200, 1200, 1232, 1232, 1232, 1232, 622, 622, 622, 622, 622, 622, 622, 622, 1008, 1008, 1008, 1008, 1040, 1040, 1040, 1040, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 1712, 1712, 1712, 1712, 1744, 1744, 1744, 1744, 846, 846, 846, 846, 846, 846, 846, 846, 1264, 1264, 1264, 1264, 1296, 1296, 1296, 1296, 1328, 1328, 1328, 1328, 1360, 1360, 1360, 1360, 1392, 1392, 1392, 1392, 1424, 1424, 1424, 1424, 686, 686, 686, 686, 686, 686, 686, 686, 910, 910, 910, 910, 910, 910, 910, 910, 1968, 1968, 1968, 1968, 2000, 2000, 2000, 2000, 2032, 2032, 2032, 2032, 16, 16, 16, 16, 10257, 10257, 10257, 10257, 12305, 12305, 12305, 12305, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 878, 878, 878, 878, 878, 878, 878, 878, 1904, 1904, 1904, 1904, 1936, 1936, 1936, 1936, -18413, -18413, -16365, -16365, -14317, -14317, -10221, -10221, 590, 590, 590, 590, 590, 590, 590, 590, 782, 782, 782, 782, 782, 782, 782, 782, 1584, 1584, 1584, 1584, 1616, 1616, 1616, 1616, 1648, 1648, 1648, 1648, 1680, 1680, 1680, 1680, 814, 814, 814, 814, 814, 814, 814, 814, 1776, 1776, 1776, 1776, 1808, 1808, 1808, 1808, 1840, 1840, 1840, 1840, 1872, 1872, 1872, 1872, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, 14353, 14353, 14353, 14353, 16401, 16401, 16401, 16401, 22547, 22547, 24595, 24595, 20497, 20497, 20497, 20497, 18449, 18449, 18449, 18449, 26643, 26643, 28691, 28691, 30739, 30739, -32749, -32749, -30701, -30701, -28653, -28653, -26605, -26605, -24557, -24557, -22509, -22509, -20461, -20461, 8207, 8207, 8207, 8207, 8207, 8207, 8207, 8207, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 
    232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232};
    public static short[] additionalMakeup = {28679, 28679, 31752, -32759, -31735, -30711, -29687, -28663, 29703, 29703, 30727, 30727, -27639, -26615, -25591, -24567};
    static short[] initBlack = {3226, 6412, 200, 168, 38, 38, 134, 134, 100, 100, 100, 100, 68, 68, 68, 68};
    static short[] twoBitBlack = {292, 260, 226, 226};
    static short[] black = {62, 62, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 588, 588, 588, 588, 588, 588, 588, 588, 1680, 1680, 20499, 22547, 24595, 26643, 1776, 1776, 1808, 1808, -24557, -22509, -20461, -18413, 1904, 1904, 1936, 1936, -16365, -14317, 782, 782, 782, 782, 814, 814, 814, 814, -12269, -10221, 10257, 10257, 12305, 12305, 14353, 14353, 16403, 18451, 1712, 1712, 1744, 1744, 28691, 30739, -32749, -30701, -28653, -26605, 2061, 2061, 2061, 2061, 2061, 2061, 2061, 2061, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 750, 750, 750, 750, 1616, 1616, 1648, 1648, 1424, 1424, 1456, 1456, 1488, 1488, 1520, 1520, 1840, 1840, 1872, 1872, 1968, 1968, 8209, 8209, 524, 524, 524, 524, 524, 524, 524, 524, 556, 556, 556, 556, 556, 556, 556, 556, 1552, 1552, 1584, 1584, 2000, 2000, 2032, 2032, 976, 976, 1008, 1008, 1040, 1040, 1072, 1072, 1296, 1296, 1328, 1328, 718, 718, 718, 718, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 4113, 4113, 6161, 6161, 848, 848, 880, 880, 912, 912, 944, 944, 622, 622, 622, 622, 654, 654, 654, 654, 1104, 1104, 1136, 1136, 1168, 1168, 1200, 1200, 1232, 1232, 1264, 1264, 686, 686, 686, 686, 1360, 1360, 1392, 1392, 12, 12, 12, 12, 12, 12, 12, 12, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390};
    static byte[] twoDCodes = {80, 88, 23, 71, 30, 30, 62, 62, 4, 4, 4, 4, 4, 4, 4, 4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41};
    private int changingElemSize = 0;
    private int lastChangingElement = 0;
    private int compression = 2;
    private int uncompressedMode = 0;
    private int fillBits = 0;
    private int bitPointer = 0;
    private int bytePointer = 0;

    public TIFFFaxDecoder(int fillOrder, int w, int h) {
        this.fillOrder = fillOrder;
        this.w = w;
        this.h = h;
        this.prevChangingElems = new int[w * 2];
        this.currChangingElems = new int[w * 2];
    }

    public static void reverseBits(byte[] b) {
        for (int k = 0; k < b.length; k++) {
            b[k] = flipTable[b[k] & UByte.MAX_VALUE];
        }
    }

    public void decode1D(byte[] buffer, byte[] compData, int startX, int height) {
        this.data = compData;
        int lineOffset = 0;
        int scanlineStride = (this.w + 7) / 8;
        this.bitPointer = 0;
        this.bytePointer = 0;
        for (int i = 0; i < height; i++) {
            decodeNextScanline(buffer, lineOffset, startX);
            lineOffset += scanlineStride;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0070, code lost:
        r9 = r16.w;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0072, code lost:
        if (r3 != r9) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0076, code lost:
        if (r16.compression != 2) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0078, code lost:
        advancePointer();
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x007d, code lost:
        if (r4 != false) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x007f, code lost:
        r10 = nextLesserThan8Bits(4);
        r11 = com.itextpdf.io.codec.TIFFFaxDecoder.initBlack[r10];
        r12 = (r11 >>> 1) & 15;
        r13 = (r11 >>> 5) & 2047;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0091, code lost:
        if (r13 != 100) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0093, code lost:
        r10 = nextNBits(9);
        r11 = com.itextpdf.io.codec.TIFFFaxDecoder.black[r10];
        r14 = r11 & 1;
        r12 = (r11 >>> 1) & 15;
        r13 = (r11 >>> 5) & 2047;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00a7, code lost:
        if (r12 != r6) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00a9, code lost:
        updatePointer(5);
        r9 = nextLesserThan8Bits(4);
        r10 = com.itextpdf.io.codec.TIFFFaxDecoder.additionalMakeup[r9];
        r11 = r10 >>> 1;
        r11 = r11 & 7;
        r12 = r10 >>> 4;
        r12 = r12 & 4095;
        setToBlack(r17, r18, r3, r12);
        r3 = r3 + r12;
        updatePointer(4 - r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00c7, code lost:
        if (r12 == 15) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00c9, code lost:
        setToBlack(r17, r18, r3, r13);
        r3 = r3 + r13;
        updatePointer(9 - r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00d2, code lost:
        if (r14 != 0) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00d4, code lost:
        r4 = true;
        r9 = r16.currChangingElems;
        r15 = r16.changingElemSize;
        r16.changingElemSize = r15 + 1;
        r9[r15] = r3;
        r6 = 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00e2, code lost:
        r6 = 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00ea, code lost:
        throw new com.itextpdf.io.exceptions.IOException(com.itextpdf.io.exceptions.IoExceptionMessageConstant.EOL_CODE_WORD_ENCOUNTERED_IN_WHITE_RUN);
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00ed, code lost:
        if (r13 != 200) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00ef, code lost:
        r6 = nextLesserThan8Bits(2);
        r9 = com.itextpdf.io.codec.TIFFFaxDecoder.twoBitBlack[r6];
        r10 = (r9 >>> 5) & 2047;
        r11 = (r9 >>> 1) & 15;
        setToBlack(r17, r18, r3, r10);
        r3 = r3 + r10;
        updatePointer(2 - r11);
        r4 = true;
        r12 = r16.currChangingElems;
        r13 = r16.changingElemSize;
        r16.changingElemSize = r13 + 1;
        r12[r13] = r3;
        r6 = 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0116, code lost:
        setToBlack(r17, r18, r3, r13);
        r3 = r3 + r13;
        updatePointer(4 - r12);
        r4 = true;
        r6 = r16.currChangingElems;
        r9 = r16.changingElemSize;
        r16.changingElemSize = r9 + 1;
        r6[r9] = r3;
        r6 = 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0134, code lost:
        if (r16.compression != 2) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0136, code lost:
        advancePointer();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void decodeNextScanline(byte[] r17, int r18, int r19) {
        /*
            Method dump skipped, instructions count: 324
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.codec.TIFFFaxDecoder.decodeNextScanline(byte[], int, int):void");
    }

    public void decode2D(byte[] buffer, byte[] compData, int startX, int height, long tiffT4Options) {
        int a0;
        int i;
        int currIndex;
        this.data = compData;
        int currIndex2 = 3;
        this.compression = 3;
        int i2 = 0;
        this.bitPointer = 0;
        this.bytePointer = 0;
        int entry = 7;
        int scanlineStride = (this.w + 7) / 8;
        int[] b = new int[2];
        this.oneD = (int) (tiffT4Options & 1);
        int b1 = 1;
        this.uncompressedMode = (int) ((tiffT4Options & 2) >> 1);
        this.fillBits = (int) ((tiffT4Options & 4) >> 2);
        if (readEOL() != 1) {
            throw new IOException(IoExceptionMessageConstant.FIRST_SCANLINE_MUST_BE_1D_ENCODED);
        }
        decodeNextScanline(buffer, 0, startX);
        int lineOffset = 0 + scanlineStride;
        int lines = 1;
        while (lines < height) {
            if (readEOL() == 0) {
                int[] temp = this.prevChangingElems;
                this.prevChangingElems = this.currChangingElems;
                this.currChangingElems = temp;
                int currIndex3 = 0;
                this.lastChangingElement = i2;
                a0 = currIndex2;
                int a02 = -1;
                i = i2;
                boolean isWhite = true;
                int bitOffset = startX;
                while (true) {
                    int i3 = b1;
                    if (bitOffset >= this.w) {
                        this.currChangingElems[currIndex3] = bitOffset;
                        this.changingElemSize = currIndex3 + 1;
                        break;
                    }
                    getNextChangingElement(a02, isWhite, b);
                    int b12 = b[i];
                    int b2 = b[i3];
                    int entry2 = twoDCodes[nextLesserThan8Bits(entry)] & UByte.MAX_VALUE;
                    int code = (entry2 & 120) >>> 3;
                    int bits = entry2 & 7;
                    if (code == 0) {
                        if (!isWhite) {
                            int a03 = b2 - bitOffset;
                            setToBlack(buffer, lineOffset, bitOffset, a03);
                        }
                        bitOffset = b2;
                        int a04 = 7 - bits;
                        updatePointer(a04);
                        b1 = i3;
                        a02 = b2;
                        entry = 7;
                    } else if (code == i3) {
                        updatePointer(7 - bits);
                        if (isWhite) {
                            int bitOffset2 = bitOffset + decodeWhiteCodeWord();
                            int currIndex4 = currIndex3 + 1;
                            this.currChangingElems[currIndex3] = bitOffset2;
                            int number = decodeBlackCodeWord();
                            setToBlack(buffer, lineOffset, bitOffset2, number);
                            bitOffset = bitOffset2 + number;
                            currIndex = currIndex4 + 1;
                            this.currChangingElems[currIndex4] = bitOffset;
                        } else {
                            int number2 = decodeBlackCodeWord();
                            setToBlack(buffer, lineOffset, bitOffset, number2);
                            int bitOffset3 = bitOffset + number2;
                            int currIndex5 = currIndex3 + 1;
                            this.currChangingElems[currIndex3] = bitOffset3;
                            bitOffset = bitOffset3 + decodeWhiteCodeWord();
                            currIndex = currIndex5 + 1;
                            this.currChangingElems[currIndex5] = bitOffset;
                        }
                        currIndex3 = currIndex;
                        a02 = bitOffset;
                        entry = 7;
                        b1 = 1;
                    } else if (code <= 8) {
                        int a1 = b12 + (code - 5);
                        int currIndex6 = currIndex3 + 1;
                        this.currChangingElems[currIndex3] = a1;
                        if (!isWhite) {
                            setToBlack(buffer, lineOffset, bitOffset, a1 - bitOffset);
                        }
                        a02 = a1;
                        bitOffset = a1;
                        isWhite = !isWhite ? true : i;
                        updatePointer(7 - bits);
                        currIndex3 = currIndex6;
                        entry = 7;
                        b1 = 1;
                    } else {
                        throw new IOException(IoExceptionMessageConstant.INVALID_CODE_ENCOUNTERED_WHILE_DECODING_2D_GROUP_3_COMPRESSED_DATA);
                    }
                }
            } else {
                a0 = currIndex2;
                i = i2;
                decodeNextScanline(buffer, lineOffset, startX);
            }
            lineOffset += scanlineStride;
            lines++;
            currIndex2 = a0;
            i2 = i;
            entry = 7;
            b1 = 1;
        }
    }

    public void decodeT6(byte[] buffer, byte[] compData, int startX, int height, long tiffT6Options) {
        int bitOffset;
        int scanlineStride;
        int scanlineStride2;
        int scanlineStride3;
        this.data = compData;
        this.compression = 4;
        int i = 0;
        this.bitPointer = 0;
        this.bytePointer = 0;
        int currIndex = 8;
        int scanlineStride4 = (this.w + 7) / 8;
        int[] b = new int[2];
        int b2 = 1;
        this.uncompressedMode = (int) ((tiffT6Options & 2) >> 1);
        this.fillBits = (int) ((tiffT6Options & 4) >> 2);
        int[] cce = this.currChangingElems;
        this.changingElemSize = 0;
        int i2 = this.changingElemSize;
        this.changingElemSize = i2 + 1;
        cce[i2] = this.w;
        int i3 = this.changingElemSize;
        this.changingElemSize = i3 + 1;
        cce[i3] = this.w;
        int lineOffset = 0;
        int lines = 0;
        while (lines < height) {
            int a0 = -1;
            boolean isWhite = true;
            int[] temp = this.prevChangingElems;
            int a1 = currIndex;
            this.prevChangingElems = this.currChangingElems;
            this.currChangingElems = temp;
            int currIndex2 = 0;
            if (this.fillBits == b2 && this.bitPointer > 0) {
                int bitsLeft = 8 - this.bitPointer;
                if (nextNBits(bitsLeft) != 0) {
                    throw new IOException(IoExceptionMessageConstant.EXPECTED_TRAILING_ZERO_BITS_FOR_BYTE_ALIGNED_LINES);
                }
            }
            this.lastChangingElement = i;
            int bitOffset2 = startX;
            while (true) {
                bitOffset = i;
                if (bitOffset2 >= this.w) {
                    scanlineStride = scanlineStride4;
                    scanlineStride2 = b2;
                    break;
                }
                int i4 = b2;
                if (this.bytePointer >= this.data.length - 1) {
                    scanlineStride = scanlineStride4;
                    scanlineStride2 = i4;
                    break;
                }
                getNextChangingElement(a0, isWhite, b);
                int b1 = b[bitOffset];
                int b22 = b[i4];
                int entry = twoDCodes[nextLesserThan8Bits(7)] & UByte.MAX_VALUE;
                int code = (entry & 120) >>> 3;
                int bits = entry & 7;
                if (code == 0) {
                    if (!isWhite) {
                        int b12 = b22 - bitOffset2;
                        setToBlack(buffer, lineOffset, bitOffset2, b12);
                    }
                    a0 = b22;
                    bitOffset2 = b22;
                    updatePointer(7 - bits);
                    i = bitOffset;
                    b2 = i4;
                } else if (code == i4) {
                    updatePointer(7 - bits);
                    if (isWhite) {
                        int bitOffset3 = bitOffset2 + decodeWhiteCodeWord();
                        int currIndex3 = currIndex2 + 1;
                        temp[currIndex2] = bitOffset3;
                        int number = decodeBlackCodeWord();
                        setToBlack(buffer, lineOffset, bitOffset3, number);
                        bitOffset2 = bitOffset3 + number;
                        currIndex2 = currIndex3 + 1;
                        temp[currIndex3] = bitOffset2;
                    } else {
                        int number2 = decodeBlackCodeWord();
                        setToBlack(buffer, lineOffset, bitOffset2, number2);
                        int bitOffset4 = bitOffset2 + number2;
                        int currIndex4 = currIndex2 + 1;
                        temp[currIndex2] = bitOffset4;
                        bitOffset2 = bitOffset4 + decodeWhiteCodeWord();
                        currIndex2 = currIndex4 + 1;
                        temp[currIndex4] = bitOffset2;
                    }
                    a0 = bitOffset2;
                    i = bitOffset;
                    b2 = 1;
                } else {
                    int i5 = a1;
                    if (code <= i5) {
                        int a12 = b1 + (code - 5);
                        int currIndex5 = currIndex2 + 1;
                        temp[currIndex2] = a12;
                        if (!isWhite) {
                            setToBlack(buffer, lineOffset, bitOffset2, a12 - bitOffset2);
                        }
                        a0 = a12;
                        bitOffset2 = a12;
                        isWhite = !isWhite ? true : bitOffset;
                        updatePointer(7 - bits);
                        a1 = i5;
                        i = bitOffset;
                        currIndex2 = currIndex5;
                        b2 = 1;
                    } else if (code == 11) {
                        if (nextLesserThan8Bits(3) != 7) {
                            throw new IOException(IoExceptionMessageConstant.INVALID_CODE_ENCOUNTERED_WHILE_DECODING_2D_GROUP_4_COMPRESSED_DATA);
                        }
                        int zeros = 0;
                        boolean exit = false;
                        while (!exit) {
                            while (true) {
                                scanlineStride3 = scanlineStride4;
                                int scanlineStride5 = nextLesserThan8Bits(1);
                                if (scanlineStride5 == 1) {
                                    break;
                                }
                                zeros++;
                                scanlineStride4 = scanlineStride3;
                            }
                            if (zeros > 5) {
                                zeros -= 6;
                                if (!isWhite && zeros > 0) {
                                    temp[currIndex2] = bitOffset2;
                                    currIndex2++;
                                }
                                bitOffset2 += zeros;
                                if (zeros > 0) {
                                    isWhite = true;
                                }
                                if (nextLesserThan8Bits(1) == 0) {
                                    if (!isWhite) {
                                        temp[currIndex2] = bitOffset2;
                                        currIndex2++;
                                    }
                                    isWhite = true;
                                } else {
                                    if (isWhite) {
                                        temp[currIndex2] = bitOffset2;
                                        currIndex2++;
                                    }
                                    isWhite = false;
                                }
                                exit = true;
                            }
                            if (zeros == 5) {
                                if (!isWhite) {
                                    temp[currIndex2] = bitOffset2;
                                    currIndex2++;
                                }
                                bitOffset2 += zeros;
                                isWhite = true;
                                scanlineStride4 = scanlineStride3;
                            } else {
                                int bitOffset5 = bitOffset2 + zeros;
                                temp[currIndex2] = bitOffset5;
                                setToBlack(buffer, lineOffset, bitOffset5, 1);
                                bitOffset2 = bitOffset5 + 1;
                                isWhite = false;
                                currIndex2++;
                                scanlineStride4 = scanlineStride3;
                            }
                        }
                        b2 = 1;
                        i = bitOffset;
                        scanlineStride4 = scanlineStride4;
                        a1 = 8;
                    } else {
                        bitOffset2 = this.w;
                        updatePointer(7 - bits);
                        b2 = 1;
                        i = bitOffset;
                        scanlineStride4 = scanlineStride4;
                        a1 = 8;
                    }
                }
            }
            if (currIndex2 < temp.length) {
                temp[currIndex2] = bitOffset2;
                currIndex2++;
            }
            this.changingElemSize = currIndex2;
            lineOffset += scanlineStride;
            lines++;
            b2 = scanlineStride2;
            i = bitOffset;
            scanlineStride4 = scanlineStride;
            currIndex = 8;
        }
    }

    private void setToBlack(byte[] buffer, int lineOffset, int bitOffset, int numBits) {
        int bitNum = (lineOffset * 8) + bitOffset;
        int lastBit = bitNum + numBits;
        int byteNum = bitNum >> 3;
        int shift = bitNum & 7;
        if (shift > 0) {
            int maskVal = 1 << (7 - shift);
            byte val = buffer[byteNum];
            while (maskVal > 0 && bitNum < lastBit) {
                val = (byte) (((byte) maskVal) | val);
                maskVal >>= 1;
                bitNum++;
            }
            buffer[byteNum] = val;
        }
        int byteNum2 = bitNum >> 3;
        while (bitNum < lastBit - 7) {
            buffer[byteNum2] = -1;
            bitNum += 8;
            byteNum2++;
        }
        while (bitNum < lastBit) {
            int byteNum3 = bitNum >> 3;
            if (!this.recoverFromImageError || byteNum3 < buffer.length) {
                buffer[byteNum3] = (byte) (buffer[byteNum3] | ((byte) (1 << (7 - (bitNum & 7)))));
            }
            bitNum++;
        }
    }

    private int decodeWhiteCodeWord() {
        int runLength = 0;
        boolean isWhite = true;
        while (isWhite) {
            int current = nextNBits(10);
            short s = white[current];
            int isT = s & 1;
            int bits = (s >>> 1) & 15;
            if (bits == 12) {
                int twoBits = nextLesserThan8Bits(2);
                short s2 = additionalMakeup[(12 & (current << 2)) | twoBits];
                int code = (s2 >>> 4) & 4095;
                runLength += code;
                updatePointer(4 - ((s2 >>> 1) & 7));
            } else if (bits == 0) {
                throw new IOException(IoExceptionMessageConstant.INVALID_CODE_ENCOUNTERED);
            } else {
                if (bits == 15) {
                    if (runLength == 0) {
                        isWhite = false;
                    } else {
                        throw new IOException(IoExceptionMessageConstant.EOL_CODE_WORD_ENCOUNTERED_IN_WHITE_RUN);
                    }
                } else {
                    int code2 = (s >>> 5) & 2047;
                    runLength += code2;
                    updatePointer(10 - bits);
                    if (isT == 0) {
                        isWhite = false;
                    }
                }
            }
        }
        return runLength;
    }

    private int decodeBlackCodeWord() {
        int runLength = 0;
        boolean isWhite = false;
        while (!isWhite) {
            int current = nextLesserThan8Bits(4);
            short s = initBlack[current];
            int i = s & 1;
            int bits = (s >>> 1) & 15;
            int code = (s >>> 5) & 2047;
            if (code == 100) {
                int current2 = nextNBits(9);
                short s2 = black[current2];
                int isT = s2 & 1;
                int bits2 = (s2 >>> 1) & 15;
                int code2 = (s2 >>> 5) & 2047;
                if (bits2 == 12) {
                    updatePointer(5);
                    int current3 = nextLesserThan8Bits(4);
                    short s3 = additionalMakeup[current3];
                    int entry = s3 >>> 1;
                    int bits3 = entry & 7;
                    int bits4 = s3 >>> 4;
                    runLength += bits4 & 4095;
                    updatePointer(4 - bits3);
                } else if (bits2 == 15) {
                    throw new IOException(IoExceptionMessageConstant.EOL_CODE_WORD_ENCOUNTERED_IN_BLACK_RUN);
                } else {
                    runLength += code2;
                    updatePointer(9 - bits2);
                    if (isT == 0) {
                        isWhite = true;
                    }
                }
            } else if (code == 200) {
                int current4 = nextLesserThan8Bits(2);
                short s4 = twoBitBlack[current4];
                int entry2 = s4 >>> 5;
                runLength += entry2 & 2047;
                int bits5 = (s4 >>> 1) & 15;
                updatePointer(2 - bits5);
                isWhite = true;
            } else {
                runLength += code;
                updatePointer(4 - bits);
                isWhite = true;
            }
        }
        return runLength;
    }

    private int readEOL() {
        do {
        } while (nextLesserThan8Bits(1) == 0);
        updatePointer(12);
        int next12Bits = nextNBits(12);
        if (next12Bits != 1) {
            throw new IOException(IoExceptionMessageConstant.ALL_FILL_BITS_PRECEDING_EOL_CODE_MUST_BE_0);
        }
        if (this.oneD == 0) {
            return 1;
        }
        return nextLesserThan8Bits(1);
    }

    private void getNextChangingElement(int a0, boolean isWhite, int[] ret) {
        int start;
        int[] pce = this.prevChangingElems;
        int ces = this.changingElemSize;
        int start2 = this.lastChangingElement > 0 ? this.lastChangingElement - 1 : 0;
        if (isWhite) {
            start = start2 & (-2);
        } else {
            start = start2 | 1;
        }
        int i = start;
        while (true) {
            if (i >= ces) {
                break;
            }
            int temp = pce[i];
            if (temp <= a0) {
                i += 2;
            } else {
                this.lastChangingElement = i;
                ret[0] = temp;
                break;
            }
        }
        if (i + 1 < ces) {
            ret[1] = pce[i + 1];
        }
    }

    private int nextNBits(int bitsToGet) {
        byte b;
        byte next;
        byte next2next;
        int l = this.data.length - 1;
        int bp = this.bytePointer;
        if (this.fillOrder == 1) {
            b = this.data[bp];
            if (bp == l) {
                next = 0;
                next2next = 0;
            } else {
                int i = bp + 1;
                byte[] bArr = this.data;
                if (i == l) {
                    next = bArr[bp + 1];
                    next2next = 0;
                } else {
                    next = bArr[bp + 1];
                    next2next = this.data[bp + 2];
                }
            }
        } else if (this.fillOrder == 2) {
            b = flipTable[this.data[bp] & UByte.MAX_VALUE];
            if (bp == l) {
                next = 0;
                next2next = 0;
            } else {
                int i2 = bp + 1;
                byte[] bArr2 = this.data;
                if (i2 == l) {
                    next = flipTable[bArr2[bp + 1] & UByte.MAX_VALUE];
                    next2next = 0;
                } else {
                    next = flipTable[bArr2[bp + 1] & UByte.MAX_VALUE];
                    next2next = flipTable[this.data[bp + 2] & UByte.MAX_VALUE];
                }
            }
        } else {
            throw new IOException(IoExceptionMessageConstant.TIFF_FILL_ORDER_TAG_MUST_BE_EITHER_1_OR_2);
        }
        int bitsLeft = 8 - this.bitPointer;
        int bitsFromNextByte = bitsToGet - bitsLeft;
        int bitsFromNext2NextByte = 0;
        if (bitsFromNextByte > 8) {
            bitsFromNext2NextByte = bitsFromNextByte - 8;
            bitsFromNextByte = 8;
        }
        this.bytePointer++;
        int i1 = (table1[bitsLeft] & b) << (bitsToGet - bitsLeft);
        int i3 = (table2[bitsFromNextByte] & next) >>> (8 - bitsFromNextByte);
        if (bitsFromNext2NextByte != 0) {
            int i22 = i3 << bitsFromNext2NextByte;
            this.bytePointer++;
            this.bitPointer = bitsFromNext2NextByte;
            i3 = i22 | ((table2[bitsFromNext2NextByte] & next2next) >>> (8 - bitsFromNext2NextByte));
        } else if (bitsFromNextByte == 8) {
            this.bitPointer = 0;
            this.bytePointer++;
        } else {
            this.bitPointer = bitsFromNextByte;
        }
        return i1 | i3;
    }

    private int nextLesserThan8Bits(int bitsToGet) {
        byte b = 0;
        byte next = 0;
        int l = this.data.length - 1;
        int bp = this.bytePointer;
        if (this.fillOrder == 1) {
            b = this.data[bp];
            if (bp == l) {
                next = 0;
            } else {
                next = this.data[bp + 1];
            }
        } else if (this.fillOrder == 2) {
            if (!this.recoverFromImageError || bp < this.data.length) {
                b = flipTable[this.data[bp] & UByte.MAX_VALUE];
                if (bp == l) {
                    next = 0;
                } else {
                    next = flipTable[this.data[bp + 1] & UByte.MAX_VALUE];
                }
            }
        } else {
            throw new IOException(IoExceptionMessageConstant.TIFF_FILL_ORDER_TAG_MUST_BE_EITHER_1_OR_2);
        }
        int bitsLeft = 8 - this.bitPointer;
        int bitsFromNextByte = bitsToGet - bitsLeft;
        int shift = bitsLeft - bitsToGet;
        if (shift >= 0) {
            int i1 = (table1[bitsLeft] & b) >>> shift;
            this.bitPointer += bitsToGet;
            if (this.bitPointer == 8) {
                this.bitPointer = 0;
                this.bytePointer++;
                return i1;
            }
            return i1;
        }
        int i12 = (table1[bitsLeft] & b) << (-shift);
        int i2 = (table2[bitsFromNextByte] & next) >>> (8 - bitsFromNextByte);
        int i13 = i12 | i2;
        this.bytePointer++;
        this.bitPointer = bitsFromNextByte;
        return i13;
    }

    private void updatePointer(int bitsToMoveBack) {
        int totalBits = ((this.bytePointer * 8) + this.bitPointer) - bitsToMoveBack;
        this.bitPointer = totalBits % 8;
        this.bytePointer = totalBits / 8;
    }

    private boolean advancePointer() {
        if (this.bitPointer != 0) {
            this.bytePointer++;
            this.bitPointer = 0;
        }
        return true;
    }

    public void setRecoverFromImageError(boolean recoverFromImageError) {
        this.recoverFromImageError = recoverFromImageError;
    }
}
