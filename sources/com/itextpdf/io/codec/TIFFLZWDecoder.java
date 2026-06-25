package com.itextpdf.io.codec;

import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class TIFFLZWDecoder {
    int bitPointer;
    int bytePointer;
    int dstIndex;
    int h;
    int predictor;
    int samplesPerPixel;
    byte[][] stringTable;
    int tableIndex;
    byte[] uncompData;
    int w;
    byte[] data = null;
    int bitsToGet = 9;
    int nextData = 0;
    int nextBits = 0;
    int[] andTable = {511, 1023, 2047, 4095};

    public TIFFLZWDecoder(int w, int predictor, int samplesPerPixel) {
        this.w = w;
        this.predictor = predictor;
        this.samplesPerPixel = samplesPerPixel;
    }

    public byte[] decode(byte[] data, byte[] uncompData, int h) {
        if (data[0] == 0 && data[1] == 1) {
            throw new IOException(IoExceptionMessageConstant.TIFF_50_STYLE_LZW_CODES_ARE_NOT_SUPPORTED);
        }
        initializeStringTable();
        this.data = data;
        this.h = h;
        this.uncompData = uncompData;
        this.bytePointer = 0;
        this.bitPointer = 0;
        this.dstIndex = 0;
        this.nextData = 0;
        this.nextBits = 0;
        int oldCode = 0;
        while (true) {
            int code = getNextCode();
            if (code == 257 || this.dstIndex >= uncompData.length) {
                break;
            } else if (code == 256) {
                initializeStringTable();
                int code2 = getNextCode();
                if (code2 == 257) {
                    break;
                }
                writeString(this.stringTable[code2]);
                oldCode = code2;
            } else {
                int i = this.tableIndex;
                byte[][] bArr = this.stringTable;
                if (code < i) {
                    byte[] str = bArr[code];
                    writeString(str);
                    addStringToTable(this.stringTable[oldCode], str[0]);
                    oldCode = code;
                } else {
                    byte[] str2 = bArr[oldCode];
                    byte[] str3 = composeString(str2, str2[0]);
                    writeString(str3);
                    addStringToTable(str3);
                    oldCode = code;
                }
            }
        }
        if (this.predictor == 2) {
            for (int j = 0; j < h; j++) {
                int count = this.samplesPerPixel * ((this.w * j) + 1);
                for (int i2 = this.samplesPerPixel; i2 < this.w * this.samplesPerPixel; i2++) {
                    uncompData[count] = (byte) (uncompData[count] + uncompData[count - this.samplesPerPixel]);
                    count++;
                }
            }
        }
        return uncompData;
    }

    public void initializeStringTable() {
        this.stringTable = new byte[4096];
        for (int i = 0; i < 256; i++) {
            this.stringTable[i] = new byte[1];
            this.stringTable[i][0] = (byte) i;
        }
        this.tableIndex = 258;
        this.bitsToGet = 9;
    }

    public void writeString(byte[] str) {
        int max = this.uncompData.length - this.dstIndex;
        if (str.length < max) {
            max = str.length;
        }
        System.arraycopy(str, 0, this.uncompData, this.dstIndex, max);
        this.dstIndex += max;
    }

    public void addStringToTable(byte[] oldString, byte newString) {
        int length = oldString.length;
        byte[] str = new byte[length + 1];
        System.arraycopy(oldString, 0, str, 0, length);
        str[length] = newString;
        byte[][] bArr = this.stringTable;
        int i = this.tableIndex;
        this.tableIndex = i + 1;
        bArr[i] = str;
        if (this.tableIndex == 511) {
            this.bitsToGet = 10;
        } else if (this.tableIndex == 1023) {
            this.bitsToGet = 11;
        } else if (this.tableIndex == 2047) {
            this.bitsToGet = 12;
        }
    }

    public void addStringToTable(byte[] str) {
        byte[][] bArr = this.stringTable;
        int i = this.tableIndex;
        this.tableIndex = i + 1;
        bArr[i] = str;
        if (this.tableIndex == 511) {
            this.bitsToGet = 10;
        } else if (this.tableIndex == 1023) {
            this.bitsToGet = 11;
        } else if (this.tableIndex == 2047) {
            this.bitsToGet = 12;
        }
    }

    public byte[] composeString(byte[] oldString, byte newString) {
        int length = oldString.length;
        byte[] str = new byte[length + 1];
        System.arraycopy(oldString, 0, str, 0, length);
        str[length] = newString;
        return str;
    }

    public int getNextCode() {
        try {
            byte[] bArr = this.data;
            int i = this.bytePointer;
            this.bytePointer = i + 1;
            this.nextData = (this.nextData << 8) | (bArr[i] & UByte.MAX_VALUE);
            this.nextBits += 8;
            if (this.nextBits < this.bitsToGet) {
                byte[] bArr2 = this.data;
                int i2 = this.bytePointer;
                this.bytePointer = i2 + 1;
                this.nextData = (this.nextData << 8) | (bArr2[i2] & UByte.MAX_VALUE);
                this.nextBits += 8;
            }
            int code = (this.nextData >> (this.nextBits - this.bitsToGet)) & this.andTable[this.bitsToGet - 9];
            this.nextBits -= this.bitsToGet;
            return code;
        } catch (ArrayIndexOutOfBoundsException e) {
            return 257;
        }
    }
}
