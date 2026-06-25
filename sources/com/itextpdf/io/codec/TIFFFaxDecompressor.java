package com.itextpdf.io.codec;

import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import kotlin.UByte;
import kotlin.io.encoding.Base64;
import kotlin.jvm.internal.ByteCompanionObject;
import okio.Utf8;
/* loaded from: classes12.dex */
public class TIFFFaxDecompressor {
    private int bitPointer;
    private int bitsPerScanline;
    private byte[] buffer;
    private int bytePointer;
    protected int compression;
    private int[] currChangingElems;
    private byte[] data;
    public int fails;
    protected int fillOrder;
    private int h;
    private int lineBitNum;
    protected int oneD;
    private int[] prevChangingElems;
    private int t4Options;
    private int t6Options;
    private int w;
    static int[] table1 = {0, 1, 3, 7, 15, 31, 63, 127, 255};
    static int[] table2 = {0, 128, 192, 224, 240, 248, 252, TIFFConstants.TIFFTAG_SUBFILETYPE, 255};
    static byte[] flipTable = {0, ByteCompanionObject.MIN_VALUE, 64, -64, 32, -96, 96, -32, 16, -112, 80, -48, 48, -80, 112, -16, 8, -120, 72, -56, 40, -88, 104, -24, 24, -104, 88, -40, 56, -72, 120, -8, 4, -124, 68, -60, 36, -92, 100, -28, 20, -108, 84, -44, 52, -76, 116, -12, 12, -116, 76, -52, 44, -84, 108, -20, 28, -100, 92, -36, 60, -68, 124, -4, 2, -126, 66, -62, 34, -94, 98, -30, 18, -110, 82, -46, 50, -78, 114, -14, 10, -118, 74, -54, 42, -86, 106, -22, 26, -102, 90, -38, 58, -70, 122, -6, 6, -122, 70, -58, 38, -90, 102, -26, 22, -106, 86, -42, 54, -74, 118, -10, 14, -114, 78, -50, 46, -82, 110, -18, 30, -98, 94, -34, 62, -66, 126, -2, 1, -127, 65, -63, 33, -95, 97, -31, 17, -111, 81, -47, 49, -79, 113, -15, 9, -119, 73, -55, 41, -87, 105, -23, 25, -103, 89, -39, 57, -71, 121, -7, 5, -123, 69, -59, 37, -91, 101, -27, 21, -107, 85, -43, 53, -75, 117, -11, 13, -115, 77, -51, 45, -83, 109, -19, 29, -99, 93, -35, Base64.padSymbol, -67, 125, -3, 3, -125, 67, -61, 35, -93, 99, -29, 19, -109, 83, -45, 51, -77, 115, -13, 11, -117, 75, -53, 43, -85, 107, -21, 27, -101, 91, -37, 59, -69, 123, -5, 7, -121, 71, -57, 39, -89, 103, -25, 23, -105, 87, -41, 55, -73, 119, -9, 15, -113, 79, -49, 47, -81, 111, -17, 31, -97, 95, -33, Utf8.REPLACEMENT_BYTE, -65, ByteCompanionObject.MAX_VALUE, -1};
    static short[] white = {6430, 6400, 6400, 6400, 3225, 3225, 3225, 3225, 944, 944, 944, 944, 976, 976, 976, 976, 1456, 1456, 1456, 1456, 1488, 1488, 1488, 1488, 718, 718, 718, 718, 718, 718, 718, 718, 750, 750, 750, 750, 750, 750, 750, 750, 1520, 1520, 1520, 1520, 1552, 1552, 1552, 1552, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 428, 654, 654, 654, 654, 654, 654, 654, 654, 1072, 1072, 1072, 1072, 1104, 1104, 1104, 1104, 1136, 1136, 1136, 1136, 1168, 1168, 1168, 1168, 1200, 1200, 1200, 1200, 1232, 1232, 1232, 1232, 622, 622, 622, 622, 622, 622, 622, 622, 1008, 1008, 1008, 1008, 1040, 1040, 1040, 1040, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 396, 1712, 1712, 1712, 1712, 1744, 1744, 1744, 1744, 846, 846, 846, 846, 846, 846, 846, 846, 1264, 1264, 1264, 1264, 1296, 1296, 1296, 1296, 1328, 1328, 1328, 1328, 1360, 1360, 1360, 1360, 1392, 1392, 1392, 1392, 1424, 1424, 1424, 1424, 686, 686, 686, 686, 686, 686, 686, 686, 910, 910, 910, 910, 910, 910, 910, 910, 1968, 1968, 1968, 1968, 2000, 2000, 2000, 2000, 2032, 2032, 2032, 2032, 16, 16, 16, 16, 10257, 10257, 10257, 10257, 12305, 12305, 12305, 12305, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 362, 878, 878, 878, 878, 878, 878, 878, 878, 1904, 1904, 1904, 1904, 1936, 1936, 1936, 1936, -18413, -18413, -16365, -16365, -14317, -14317, -10221, -10221, 590, 590, 590, 590, 590, 590, 590, 590, 782, 782, 782, 782, 782, 782, 782, 782, 1584, 1584, 1584, 1584, 1616, 1616, 1616, 1616, 1648, 1648, 1648, 1648, 1680, 1680, 1680, 1680, 814, 814, 814, 814, 814, 814, 814, 814, 1776, 1776, 1776, 1776, 1808, 1808, 1808, 1808, 1840, 1840, 1840, 1840, 1872, 1872, 1872, 1872, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, 6157, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, -12275, 14353, 14353, 14353, 14353, 16401, 16401, 16401, 16401, 22547, 22547, 24595, 24595, 20497, 20497, 20497, 20497, 18449, 18449, 18449, 18449, 26643, 26643, 28691, 28691, 30739, 30739, -32749, -32749, -30701, -30701, -28653, -28653, -26605, -26605, -24557, -24557, -22509, -22509, -20461, -20461, 8207, 8207, 8207, 8207, 8207, 8207, 8207, 8207, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 4107, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 266, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 298, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 524, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 556, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 136, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 460, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 492, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 2059, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 
    232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232, 232};
    public static short[] additionalMakeup = {28679, 28679, 31752, -32759, -31735, -30711, -29687, -28663, 29703, 29703, 30727, 30727, -27639, -26615, -25591, -24567};
    static short[] initBlack = {3226, 6412, 200, 168, 38, 38, 134, 134, 100, 100, 100, 100, 68, 68, 68, 68};
    static short[] twoBitBlack = {292, 260, 226, 226};
    static short[] black = {62, 62, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 3225, 588, 588, 588, 588, 588, 588, 588, 588, 1680, 1680, 20499, 22547, 24595, 26643, 1776, 1776, 1808, 1808, -24557, -22509, -20461, -18413, 1904, 1904, 1936, 1936, -16365, -14317, 782, 782, 782, 782, 814, 814, 814, 814, -12269, -10221, 10257, 10257, 12305, 12305, 14353, 14353, 16403, 18451, 1712, 1712, 1744, 1744, 28691, 30739, -32749, -30701, -28653, -26605, 2061, 2061, 2061, 2061, 2061, 2061, 2061, 2061, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 424, 750, 750, 750, 750, 1616, 1616, 1648, 1648, 1424, 1424, 1456, 1456, 1488, 1488, 1520, 1520, 1840, 1840, 1872, 1872, 1968, 1968, 8209, 8209, 524, 524, 524, 524, 524, 524, 524, 524, 556, 556, 556, 556, 556, 556, 556, 556, 1552, 1552, 1584, 1584, 2000, 2000, 2032, 2032, 976, 976, 1008, 1008, 1040, 1040, 1072, 1072, 1296, 1296, 1328, 1328, 718, 718, 718, 718, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 456, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 326, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 358, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 490, 4113, 4113, 6161, 6161, 848, 848, 880, 880, 912, 912, 944, 944, 622, 622, 622, 622, 654, 654, 654, 654, 1104, 1104, 1136, 1136, 1168, 1168, 1200, 1200, 1232, 1232, 1264, 1264, 686, 686, 686, 686, 1360, 1360, 1392, 1392, 12, 12, 12, 12, 12, 12, 12, 12, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390, 390};
    static byte[] twoDCodes = {80, 88, 23, 71, 30, 30, 62, 62, 4, 4, 4, 4, 4, 4, 4, 4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41};
    protected int uncompressedMode = 0;
    protected int fillBits = 0;
    private int changingElemSize = 0;
    private int lastChangingElement = 0;
    private final Object lock = new Object();

    public void SetOptions(int fillOrder, int compression, int t4Options, int t6Options) {
        this.fillOrder = fillOrder;
        this.compression = compression;
        this.t4Options = t4Options;
        this.t6Options = t6Options;
        this.oneD = t4Options & 1;
        this.uncompressedMode = (t4Options & 2) >> 1;
        this.fillBits = (t4Options & 4) >> 2;
    }

    public void decodeRaw(byte[] buffer, byte[] compData, int w, int h) {
        this.buffer = buffer;
        this.data = compData;
        this.w = w;
        this.h = h;
        this.bitsPerScanline = w;
        this.lineBitNum = 0;
        this.bitPointer = 0;
        this.bytePointer = 0;
        this.prevChangingElems = new int[w + 1];
        this.currChangingElems = new int[w + 1];
        this.fails = 0;
        try {
            if (this.compression == 2) {
                decodeRLE();
            } else if (this.compression == 3) {
                decodeT4();
            } else if (this.compression == 4) {
                this.uncompressedMode = (this.t6Options & 2) >> 1;
                decodeT6();
            } else {
                throw new IOException(IoExceptionMessageConstant.UNKNOWN_COMPRESSION_TYPE).setMessageParams(Integer.valueOf(this.compression));
            }
        } catch (ArrayIndexOutOfBoundsException e) {
        }
    }

    public void decodeRLE() {
        for (int i = 0; i < this.h; i++) {
            decodeNextScanline();
            if (this.bitPointer != 0) {
                this.bytePointer++;
                this.bitPointer = 0;
            }
            this.lineBitNum += this.bitsPerScanline;
        }
    }

    public void decodeNextScanline() {
        boolean isWhite = true;
        int bitOffset = 0;
        this.changingElemSize = 0;
        while (true) {
            if (bitOffset >= this.w) {
                break;
            }
            int runOffset = bitOffset;
            while (isWhite && bitOffset < this.w) {
                int current = nextNBits(10);
                short s = white[current];
                int isT = s & 1;
                int bits = (s >>> 1) & 15;
                if (bits == 12) {
                    int twoBits = nextLesserThan8Bits(2);
                    short s2 = additionalMakeup[(12 & (current << 2)) | twoBits];
                    int bits2 = (s2 >>> 1) & 7;
                    bitOffset += (s2 >>> 4) & 4095;
                    updatePointer(4 - bits2);
                } else if (bits == 0) {
                    this.fails++;
                } else if (bits == 15) {
                    this.fails++;
                    return;
                } else {
                    bitOffset += (s >>> 5) & 2047;
                    updatePointer(10 - bits);
                    if (isT == 0) {
                        isWhite = false;
                        int[] iArr = this.currChangingElems;
                        int i = this.changingElemSize;
                        this.changingElemSize = i + 1;
                        iArr[i] = bitOffset;
                    }
                }
            }
            int entry = this.w;
            if (bitOffset == entry) {
                int runLength = bitOffset - runOffset;
                if (isWhite && runLength != 0 && runLength % 64 == 0 && nextNBits(8) != 53) {
                    this.fails++;
                    updatePointer(8);
                }
            } else {
                int runOffset2 = bitOffset;
                while (!isWhite && bitOffset < this.w) {
                    int current2 = nextLesserThan8Bits(4);
                    short s3 = initBlack[current2];
                    int isT2 = s3 & 1;
                    int bits3 = (s3 >>> 1) & 15;
                    int code = (s3 >>> 5) & 2047;
                    if (code == 100) {
                        int current3 = nextNBits(9);
                        short s4 = black[current3];
                        int isT3 = s4 & 1;
                        int bits4 = (s4 >>> 1) & 15;
                        int code2 = (s4 >>> 5) & 2047;
                        if (bits4 == 12) {
                            updatePointer(5);
                            int current4 = nextLesserThan8Bits(4);
                            short s5 = additionalMakeup[current4];
                            int entry2 = s5 >>> 1;
                            int bits5 = entry2 & 7;
                            int code3 = (s5 >>> 4) & 4095;
                            setToBlack(bitOffset, code3);
                            bitOffset += code3;
                            updatePointer(4 - bits5);
                        } else if (bits4 == 15) {
                            this.fails++;
                            return;
                        } else {
                            setToBlack(bitOffset, code2);
                            bitOffset += code2;
                            updatePointer(9 - bits4);
                            if (isT3 == 0) {
                                isWhite = true;
                                int[] iArr2 = this.currChangingElems;
                                int i2 = this.changingElemSize;
                                this.changingElemSize = i2 + 1;
                                iArr2[i2] = bitOffset;
                            }
                        }
                    } else if (code == 200) {
                        int current5 = nextLesserThan8Bits(2);
                        short s6 = twoBitBlack[current5];
                        int entry3 = s6 >>> 5;
                        int code4 = entry3 & 2047;
                        int bits6 = (s6 >>> 1) & 15;
                        setToBlack(bitOffset, code4);
                        bitOffset += code4;
                        updatePointer(2 - bits6);
                        isWhite = true;
                        int[] iArr3 = this.currChangingElems;
                        int i3 = this.changingElemSize;
                        this.changingElemSize = i3 + 1;
                        iArr3[i3] = bitOffset;
                    } else {
                        setToBlack(bitOffset, code);
                        bitOffset += code;
                        updatePointer(4 - bits3);
                        isWhite = true;
                        int[] iArr4 = this.currChangingElems;
                        int i4 = this.changingElemSize;
                        this.changingElemSize = i4 + 1;
                        iArr4[i4] = bitOffset;
                    }
                }
                if (bitOffset == this.w) {
                    int runLength2 = bitOffset - runOffset2;
                    if (!isWhite && runLength2 != 0 && runLength2 % 64 == 0 && nextNBits(10) != 55) {
                        this.fails++;
                        updatePointer(10);
                    }
                }
            }
        }
        int[] iArr5 = this.currChangingElems;
        int i5 = this.changingElemSize;
        this.changingElemSize = i5 + 1;
        iArr5[i5] = bitOffset;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00fb, code lost:
        r6 = 1;
        r21.fails++;
        r17 = r2;
        r2 = r19;
        r19 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x0108, code lost:
        if (r2 == r6) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x010e, code lost:
        r2 = findNextLine();
        r19 = r19 + 1;
        r6 = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0114, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0115, code lost:
        r8 = r8 + (r19 - 1);
        updatePointer(13);
        r0 = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void decodeT4() {
        /*
            Method dump skipped, instructions count: 353
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.codec.TIFFFaxDecompressor.decodeT4():void");
    }

    public void decodeT6() {
        int height;
        int currIndex;
        int entranceCode;
        int[] b;
        synchronized (this.lock) {
            int height2 = this.h;
            int[] b2 = new int[2];
            int[] cce = this.currChangingElems;
            int entry = 0;
            this.changingElemSize = 0;
            int i = this.changingElemSize;
            this.changingElemSize = i + 1;
            cce[i] = this.w;
            int i2 = this.changingElemSize;
            this.changingElemSize = i2 + 1;
            cce[i2] = this.w;
            int lines = 0;
            while (lines < height2) {
                int a0 = -1;
                boolean isWhite = true;
                int[] temp = this.prevChangingElems;
                this.prevChangingElems = this.currChangingElems;
                this.currChangingElems = temp;
                int currIndex2 = 0;
                int bitOffset = 0;
                this.lastChangingElement = entry;
                while (bitOffset < this.w) {
                    getNextChangingElement(a0, isWhite, b2);
                    int b1 = b2[entry];
                    int b22 = b2[1];
                    int entry2 = nextLesserThan8Bits(7);
                    int entry3 = twoDCodes[entry2] & UByte.MAX_VALUE;
                    int code = (entry3 & 120) >>> 3;
                    int bits = entry3 & 7;
                    if (code == 0) {
                        if (!isWhite) {
                            if (b22 > this.w) {
                                b22 = this.w;
                            }
                            setToBlack(bitOffset, b22 - bitOffset);
                        }
                        a0 = b22;
                        bitOffset = b22;
                        updatePointer(7 - bits);
                        entry = 0;
                    } else if (code == 1) {
                        updatePointer(7 - bits);
                        if (isWhite) {
                            int bitOffset2 = bitOffset + decodeWhiteCodeWord();
                            int currIndex3 = currIndex2 + 1;
                            temp[currIndex2] = bitOffset2;
                            int number = decodeBlackCodeWord();
                            if (number > this.w - bitOffset2) {
                                number = this.w - bitOffset2;
                            }
                            setToBlack(bitOffset2, number);
                            bitOffset = bitOffset2 + number;
                            currIndex = currIndex3 + 1;
                            temp[currIndex3] = bitOffset;
                            height = height2;
                        } else {
                            int number2 = decodeBlackCodeWord();
                            height = height2;
                            int height3 = this.w;
                            if (number2 > height3 - bitOffset) {
                                number2 = this.w - bitOffset;
                            }
                            setToBlack(bitOffset, number2);
                            int bitOffset3 = bitOffset + number2;
                            int currIndex4 = currIndex2 + 1;
                            temp[currIndex2] = bitOffset3;
                            bitOffset = bitOffset3 + decodeWhiteCodeWord();
                            currIndex = currIndex4 + 1;
                            temp[currIndex4] = bitOffset;
                        }
                        a0 = bitOffset;
                        currIndex2 = currIndex;
                        height2 = height;
                        entry = 0;
                    } else {
                        int height4 = height2;
                        if (code <= 8) {
                            int a1 = (code - 5) + b1;
                            int currIndex5 = currIndex2 + 1;
                            temp[currIndex2] = a1;
                            if (!isWhite) {
                                if (a1 > this.w) {
                                    a1 = this.w;
                                }
                                setToBlack(bitOffset, a1 - bitOffset);
                            }
                            a0 = a1;
                            bitOffset = a1;
                            isWhite = !isWhite;
                            updatePointer(7 - bits);
                            currIndex2 = currIndex5;
                            height2 = height4;
                            entry = 0;
                        } else if (code == 11) {
                            int entranceCode2 = nextLesserThan8Bits(3);
                            int zeros = 0;
                            boolean exit = false;
                            while (!exit) {
                                while (true) {
                                    entranceCode = entranceCode2;
                                    b = b2;
                                    if (nextLesserThan8Bits(1) == 1) {
                                        break;
                                    }
                                    zeros++;
                                    entranceCode2 = entranceCode;
                                    b2 = b;
                                }
                                if (zeros > 5) {
                                    zeros -= 6;
                                    if (!isWhite && zeros > 0) {
                                        temp[currIndex2] = bitOffset;
                                        currIndex2++;
                                    }
                                    bitOffset += zeros;
                                    if (zeros > 0) {
                                        isWhite = true;
                                    }
                                    if (nextLesserThan8Bits(1) == 0) {
                                        if (!isWhite) {
                                            temp[currIndex2] = bitOffset;
                                            currIndex2++;
                                        }
                                        isWhite = true;
                                    } else {
                                        if (isWhite) {
                                            temp[currIndex2] = bitOffset;
                                            currIndex2++;
                                        }
                                        isWhite = false;
                                    }
                                    exit = true;
                                }
                                if (zeros == 5) {
                                    if (!isWhite) {
                                        temp[currIndex2] = bitOffset;
                                        currIndex2++;
                                    }
                                    bitOffset += zeros;
                                    isWhite = true;
                                    entranceCode2 = entranceCode;
                                    b2 = b;
                                } else {
                                    int bitOffset4 = bitOffset + zeros;
                                    temp[currIndex2] = bitOffset4;
                                    setToBlack(bitOffset4, 1);
                                    bitOffset = bitOffset4 + 1;
                                    isWhite = false;
                                    currIndex2++;
                                    entranceCode2 = entranceCode;
                                    b2 = b;
                                }
                            }
                            height2 = height4;
                            entry = 0;
                        } else {
                            height2 = height4;
                            entry = 0;
                        }
                    }
                }
                int height5 = height2;
                int[] b3 = b2;
                int height6 = this.w;
                if (currIndex2 <= height6) {
                    temp[currIndex2] = bitOffset;
                    currIndex2++;
                }
                this.changingElemSize = currIndex2;
                this.lineBitNum += this.bitsPerScanline;
                lines++;
                height2 = height5;
                b2 = b3;
                entry = 0;
            }
        }
    }

    private void setToBlack(int bitNum, int numBits) {
        int bitNum2 = bitNum + this.lineBitNum;
        int lastBit = bitNum2 + numBits;
        int byteNum = bitNum2 >> 3;
        int shift = bitNum2 & 7;
        if (shift > 0) {
            int maskVal = 1 << (7 - shift);
            byte val = this.buffer[byteNum];
            while (maskVal > 0 && bitNum2 < lastBit) {
                val = (byte) (((byte) maskVal) | val);
                maskVal >>= 1;
                bitNum2++;
            }
            this.buffer[byteNum] = val;
        }
        int byteNum2 = bitNum2 >> 3;
        while (bitNum2 < lastBit - 7) {
            this.buffer[byteNum2] = -1;
            bitNum2 += 8;
            byteNum2++;
        }
        while (bitNum2 < lastBit) {
            int byteNum3 = bitNum2 >> 3;
            byte[] bArr = this.buffer;
            bArr[byteNum3] = (byte) (bArr[byteNum3] | ((byte) (1 << (7 - (bitNum2 & 7)))));
            bitNum2++;
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
                throw new RuntimeException("Error 0");
            } else {
                if (bits == 15) {
                    throw new RuntimeException("Error 1");
                }
                int code2 = (s >>> 5) & 2047;
                runLength += code2;
                updatePointer(10 - bits);
                if (isT == 0) {
                    isWhite = false;
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
                    throw new RuntimeException("Error 2");
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

    private int findNextLine() {
        int bitIndexMax = (this.data.length * 8) - 1;
        int bitIndexMax12 = bitIndexMax - 12;
        int bitIndex = (this.bytePointer * 8) + this.bitPointer;
        while (bitIndex <= bitIndexMax12) {
            int next12Bits = nextNBits(12);
            bitIndex += 12;
            while (next12Bits != 1 && bitIndex < bitIndexMax) {
                next12Bits = ((next12Bits & 2047) << 1) | (nextLesserThan8Bits(1) & 1);
                bitIndex++;
            }
            if (next12Bits == 1) {
                if (this.oneD != 1) {
                    return 1;
                }
                if (bitIndex < bitIndexMax) {
                    return nextLesserThan8Bits(1);
                }
            }
        }
        throw new RuntimeException();
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
            throw new RuntimeException("Invalid FillOrder");
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
        int i22 = (table2[bitsFromNextByte] & next) >>> (8 - bitsFromNextByte);
        if (bitsFromNext2NextByte != 0) {
            int i3 = (table2[bitsFromNext2NextByte] & next2next) >>> (8 - bitsFromNext2NextByte);
            i22 = (i22 << bitsFromNext2NextByte) | i3;
            this.bytePointer++;
            this.bitPointer = bitsFromNext2NextByte;
        } else if (bitsFromNextByte == 8) {
            this.bitPointer = 0;
            this.bytePointer++;
        } else {
            this.bitPointer = bitsFromNextByte;
        }
        return i1 | i22;
    }

    private int nextLesserThan8Bits(int bitsToGet) {
        byte b;
        byte next;
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
            b = flipTable[this.data[bp] & UByte.MAX_VALUE];
            if (bp == l) {
                next = 0;
            } else {
                next = flipTable[this.data[bp + 1] & UByte.MAX_VALUE];
            }
        } else {
            throw new RuntimeException("Invalid FillOrder");
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
        if (bitsToMoveBack > 8) {
            this.bytePointer -= bitsToMoveBack / 8;
            bitsToMoveBack %= 8;
        }
        int i = this.bitPointer - bitsToMoveBack;
        if (i < 0) {
            this.bytePointer--;
            this.bitPointer = i + 8;
            return;
        }
        this.bitPointer = i;
    }
}
