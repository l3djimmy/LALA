package com.itextpdf.io.font;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.zip.InflaterInputStream;
import kotlin.UByte;
/* loaded from: classes12.dex */
class WoffConverter {
    private static final long woffSignature = 2001684038;

    WoffConverter() {
    }

    public static boolean isWoffFont(byte[] woffBytes) {
        return bytesToUInt(woffBytes, 0) == woffSignature;
    }

    public static byte[] convert(byte[] woffBytes) throws IOException {
        int i;
        Iterator<TableDirectory> it;
        byte[] uncompressedData;
        byte[] bArr = woffBytes;
        if (bytesToUInt(bArr, 0) != woffSignature) {
            throw new IllegalArgumentException();
        }
        int srcPos = 0 + 4;
        byte[] flavor = new byte[4];
        int i2 = 0;
        System.arraycopy(bArr, srcPos, flavor, 0, 4);
        int srcPos2 = srcPos + 4;
        if (bytesToUInt(bArr, srcPos2) != bArr.length) {
            throw new IllegalArgumentException();
        }
        int srcPos3 = srcPos2 + 4;
        int i3 = 2;
        byte[] numTables = new byte[2];
        System.arraycopy(bArr, srcPos3, numTables, 0, 2);
        int srcPos4 = srcPos3 + 2;
        if (bytesToUShort(bArr, srcPos4) != 0) {
            throw new IllegalArgumentException();
        }
        int srcPos5 = srcPos4 + 2;
        long totalSfntSize = bytesToUInt(bArr, srcPos5);
        int srcPos6 = srcPos5 + 4 + 2 + 2 + 4 + 4 + 4 + 4 + 4;
        byte[] otfBytes = new byte[(int) totalSfntSize];
        System.arraycopy(flavor, 0, otfBytes, 0, 4);
        int destPos = 0 + 4;
        System.arraycopy(numTables, 0, otfBytes, destPos, 2);
        int destPos2 = destPos + 2;
        int entrySelector = -1;
        int searchRange = -1;
        int numTablesVal = bytesToUShort(numTables, 0);
        int i4 = 0;
        while (true) {
            if (i4 >= 17) {
                i = i3;
                break;
            }
            i = i3;
            byte[] numTables2 = numTables;
            byte[] flavor2 = flavor;
            int powOfTwo = (int) Math.pow(2.0d, i4);
            if (powOfTwo <= numTablesVal) {
                i4++;
                i3 = i;
                numTables = numTables2;
                flavor = flavor2;
            } else {
                entrySelector = i4;
                searchRange = powOfTwo * 16;
                break;
            }
        }
        if (entrySelector < 0) {
            throw new IllegalArgumentException();
        }
        otfBytes[destPos2] = (byte) (searchRange >> 8);
        otfBytes[destPos2 + 1] = (byte) searchRange;
        int destPos3 = destPos2 + i;
        otfBytes[destPos3] = (byte) (entrySelector >> 8);
        otfBytes[destPos3 + 1] = (byte) entrySelector;
        int destPos4 = destPos3 + i;
        int rangeShift = (numTablesVal * 16) - searchRange;
        otfBytes[destPos4] = (byte) (rangeShift >> 8);
        otfBytes[destPos4 + 1] = (byte) rangeShift;
        int destPos5 = destPos4 + i;
        int outTableOffset = destPos5;
        List<TableDirectory> tdList = new ArrayList<>(numTablesVal);
        int i5 = 0;
        while (i5 < numTablesVal) {
            TableDirectory td = new TableDirectory();
            int destPos6 = destPos5;
            System.arraycopy(bArr, srcPos6, td.tag, 0, 4);
            int srcPos7 = srcPos6 + 4;
            int rangeShift2 = rangeShift;
            td.offset = bytesToUInt(bArr, srcPos7);
            int srcPos8 = srcPos7 + 4;
            if (td.offset % 4 != 0) {
                throw new IllegalArgumentException();
            }
            td.compLength = bytesToUInt(bArr, srcPos8);
            int srcPos9 = srcPos8 + 4;
            System.arraycopy(bArr, srcPos9, td.origLength, 0, 4);
            td.origLengthVal = bytesToUInt(td.origLength, 0);
            int srcPos10 = srcPos9 + 4;
            System.arraycopy(bArr, srcPos10, td.origChecksum, 0, 4);
            srcPos6 = srcPos10 + 4;
            tdList.add(td);
            outTableOffset += 16;
            i5++;
            rangeShift = rangeShift2;
            destPos5 = destPos6;
        }
        int destPos7 = destPos5;
        int destPos8 = destPos7;
        for (TableDirectory td2 : tdList) {
            int srcPos11 = srcPos6;
            System.arraycopy(td2.tag, i2, otfBytes, destPos8, 4);
            int destPos9 = destPos8 + 4;
            System.arraycopy(td2.origChecksum, i2, otfBytes, destPos9, 4);
            int destPos10 = destPos9 + 4;
            otfBytes[destPos10] = (byte) (outTableOffset >> 24);
            otfBytes[destPos10 + 1] = (byte) (outTableOffset >> 16);
            otfBytes[destPos10 + 2] = (byte) (outTableOffset >> 8);
            otfBytes[destPos10 + 3] = (byte) outTableOffset;
            int destPos11 = destPos10 + 4;
            System.arraycopy(td2.origLength, i2, otfBytes, destPos11, 4);
            destPos8 = destPos11 + 4;
            td2.outOffset = outTableOffset;
            List<TableDirectory> tdList2 = tdList;
            outTableOffset += (int) td2.origLengthVal;
            if (outTableOffset % 4 != 0) {
                outTableOffset += 4 - (outTableOffset % 4);
            }
            tdList = tdList2;
            srcPos6 = srcPos11;
            i2 = 0;
        }
        List<TableDirectory> tdList3 = tdList;
        if (outTableOffset != totalSfntSize) {
            throw new IllegalArgumentException();
        }
        Iterator<TableDirectory> it2 = tdList3.iterator();
        while (it2.hasNext()) {
            TableDirectory td3 = it2.next();
            byte[] compressedData = new byte[(int) td3.compLength];
            int destPos12 = destPos8;
            int outTableOffset2 = outTableOffset;
            System.arraycopy(bArr, (int) td3.offset, compressedData, 0, (int) td3.compLength);
            int expectedUncompressedLen = (int) td3.origLengthVal;
            Iterator<TableDirectory> it3 = it2;
            if (td3.compLength > td3.origLengthVal) {
                throw new IllegalArgumentException();
            }
            if (td3.compLength != td3.origLengthVal) {
                ByteArrayInputStream stream = new ByteArrayInputStream(compressedData);
                InflaterInputStream zip = new InflaterInputStream(stream);
                uncompressedData = new byte[expectedUncompressedLen];
                int bytesRead = 0;
                while (expectedUncompressedLen - bytesRead > 0) {
                    Iterator<TableDirectory> it4 = it3;
                    int readRes = zip.read(uncompressedData, bytesRead, expectedUncompressedLen - bytesRead);
                    if (readRes < 0) {
                        throw new IllegalArgumentException();
                    }
                    bytesRead += readRes;
                    it3 = it4;
                }
                it = it3;
                if (zip.read() >= 0) {
                    throw new IllegalArgumentException();
                }
            } else {
                it = it3;
                uncompressedData = compressedData;
            }
            System.arraycopy(uncompressedData, 0, otfBytes, td3.outOffset, expectedUncompressedLen);
            bArr = woffBytes;
            destPos8 = destPos12;
            outTableOffset = outTableOffset2;
            it2 = it;
        }
        return otfBytes;
    }

    private static long bytesToUInt(byte[] b, int start) {
        return ((b[start] & 255) << 24) | ((b[start + 1] & 255) << 16) | ((b[start + 2] & 255) << 8) | (255 & b[start + 3]);
    }

    private static int bytesToUShort(byte[] b, int start) {
        return ((b[start] & UByte.MAX_VALUE) << 8) | (b[start + 1] & UByte.MAX_VALUE);
    }

    /* loaded from: classes12.dex */
    private static class TableDirectory {
        long compLength;
        long offset;
        byte[] origChecksum;
        byte[] origLength;
        long origLengthVal;
        int outOffset;
        byte[] tag;

        private TableDirectory() {
            this.tag = new byte[4];
            this.origLength = new byte[4];
            this.origChecksum = new byte[4];
        }
    }
}
