package com.itextpdf.io.codec.brotli.dec;

import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes12.dex */
final class BitReader {
    private static final int BYTE_BUFFER_SIZE = 4160;
    private static final int BYTE_READ_SIZE = 4096;
    private static final int CAPACITY = 1024;
    private static final int INT_BUFFER_SIZE = 1040;
    private static final int SLACK = 16;
    long accumulator;
    int bitOffset;
    private boolean endOfStreamReached;
    private InputStream input;
    private int intOffset;
    private final byte[] byteBuffer = new byte[BYTE_BUFFER_SIZE];
    private final int[] intBuffer = new int[1040];
    private final IntReader intReader = new IntReader();
    private int tailBytes = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x003b, code lost:
        r5.endOfStreamReached = true;
        r5.tailBytes = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0040, code lost:
        r1 = r1 + 3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void readMoreInput(com.itextpdf.io.codec.brotli.dec.BitReader r5) {
        /*
            int r0 = r5.intOffset
            r1 = 1015(0x3f7, float:1.422E-42)
            if (r0 > r1) goto L7
            return
        L7:
            boolean r0 = r5.endOfStreamReached
            if (r0 == 0) goto L1b
            int r0 = intAvailable(r5)
            r1 = -2
            if (r0 < r1) goto L13
            return
        L13:
            com.itextpdf.io.codec.brotli.dec.BrotliRuntimeException r0 = new com.itextpdf.io.codec.brotli.dec.BrotliRuntimeException
            java.lang.String r1 = "No more input"
            r0.<init>(r1)
            throw r0
        L1b:
            int r0 = r5.intOffset
            int r0 = r0 << 2
            int r1 = 4096 - r0
            byte[] r2 = r5.byteBuffer
            byte[] r3 = r5.byteBuffer
            r4 = 0
            java.lang.System.arraycopy(r2, r0, r3, r4, r1)
            r5.intOffset = r4
        L2b:
            r2 = 4096(0x1000, float:5.74E-42)
            if (r1 >= r2) goto L4e
            java.io.InputStream r2 = r5.input     // Catch: java.io.IOException -> L45
            byte[] r3 = r5.byteBuffer     // Catch: java.io.IOException -> L45
            int r4 = 4096 - r1
            int r2 = r2.read(r3, r1, r4)     // Catch: java.io.IOException -> L45
            if (r2 > 0) goto L43
            r3 = 1
            r5.endOfStreamReached = r3     // Catch: java.io.IOException -> L45
            r5.tailBytes = r1     // Catch: java.io.IOException -> L45
            int r1 = r1 + 3
            goto L4e
        L43:
            int r1 = r1 + r2
            goto L2b
        L45:
            r2 = move-exception
            com.itextpdf.io.codec.brotli.dec.BrotliRuntimeException r3 = new com.itextpdf.io.codec.brotli.dec.BrotliRuntimeException
            java.lang.String r4 = "Failed to read input"
            r3.<init>(r4, r2)
            throw r3
        L4e:
            com.itextpdf.io.codec.brotli.dec.IntReader r2 = r5.intReader
            int r3 = r1 >> 2
            com.itextpdf.io.codec.brotli.dec.IntReader.convert(r2, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.codec.brotli.dec.BitReader.readMoreInput(com.itextpdf.io.codec.brotli.dec.BitReader):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void checkHealth(BitReader br, boolean endOfStream) {
        if (!br.endOfStreamReached) {
            return;
        }
        int byteOffset = ((br.intOffset << 2) + ((br.bitOffset + 7) >> 3)) - 8;
        if (byteOffset > br.tailBytes) {
            throw new BrotliRuntimeException("Read after end");
        }
        if (endOfStream && byteOffset != br.tailBytes) {
            throw new BrotliRuntimeException("Unused bytes after end");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void fillBitWindow(BitReader br) {
        int i;
        if (br.bitOffset >= 32) {
            int[] iArr = br.intBuffer;
            br.intOffset = br.intOffset + 1;
            br.accumulator = (iArr[i] << 32) | (br.accumulator >>> 32);
            br.bitOffset -= 32;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int readBits(BitReader br, int n) {
        fillBitWindow(br);
        int val = ((int) (br.accumulator >>> br.bitOffset)) & ((1 << n) - 1);
        br.bitOffset += n;
        return val;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void init(BitReader br, InputStream input) {
        if (br.input != null) {
            throw new IllegalStateException("Bit reader already has associated input stream");
        }
        IntReader.init(br.intReader, br.byteBuffer, br.intBuffer);
        br.input = input;
        br.accumulator = 0L;
        br.bitOffset = 64;
        br.intOffset = 1024;
        br.endOfStreamReached = false;
        prepare(br);
    }

    private static void prepare(BitReader br) {
        readMoreInput(br);
        checkHealth(br, false);
        fillBitWindow(br);
        fillBitWindow(br);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void reload(BitReader br) {
        if (br.bitOffset == 64) {
            prepare(br);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void close(BitReader br) throws IOException {
        InputStream is = br.input;
        br.input = null;
        if (is != null) {
            is.close();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void jumpToByteBoundary(BitReader br) {
        int padding = (64 - br.bitOffset) & 7;
        if (padding != 0) {
            int paddingBits = readBits(br, padding);
            if (paddingBits != 0) {
                throw new BrotliRuntimeException("Corrupted padding bits");
            }
        }
    }

    static int intAvailable(BitReader br) {
        int limit = 1024;
        if (br.endOfStreamReached) {
            limit = (br.tailBytes + 3) >> 2;
        }
        return limit - br.intOffset;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void copyBytes(BitReader br, byte[] data, int offset, int length) {
        if ((br.bitOffset & 7) != 0) {
            throw new BrotliRuntimeException("Unaligned copyBytes");
        }
        while (br.bitOffset != 64 && length != 0) {
            data[offset] = (byte) (br.accumulator >>> br.bitOffset);
            br.bitOffset += 8;
            length--;
            offset++;
        }
        if (length == 0) {
            return;
        }
        int copyInts = Math.min(intAvailable(br), length >> 2);
        if (copyInts > 0) {
            int readOffset = br.intOffset << 2;
            System.arraycopy(br.byteBuffer, readOffset, data, offset, copyInts << 2);
            offset += copyInts << 2;
            length -= copyInts << 2;
            br.intOffset += copyInts;
        }
        if (length == 0) {
            return;
        }
        if (intAvailable(br) > 0) {
            fillBitWindow(br);
            while (length != 0) {
                data[offset] = (byte) (br.accumulator >>> br.bitOffset);
                br.bitOffset += 8;
                length--;
                offset++;
            }
            checkHealth(br, false);
            return;
        }
        while (length > 0) {
            try {
                int len = br.input.read(data, offset, length);
                if (len == -1) {
                    throw new BrotliRuntimeException("Unexpected end of input");
                }
                offset += len;
                length -= len;
            } catch (IOException e) {
                throw new BrotliRuntimeException("Failed to read input", e);
            }
        }
    }
}
