package com.itextpdf.kernel.pdf.filters;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import java.io.IOException;
import java.io.OutputStream;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class LZWDecoder {
    int bitPointer;
    int bytePointer;
    byte[][] stringTable;
    int tableIndex;
    OutputStream uncompData;
    byte[] data = null;
    int bitsToGet = 9;
    int nextData = 0;
    int nextBits = 0;
    int[] andTable = {511, 1023, 2047, 4095};

    public void decode(byte[] data, OutputStream uncompData) {
        if (data[0] == 0 && data[1] == 1) {
            throw new PdfException(KernelExceptionMessageConstant.LZW_FLAVOUR_NOT_SUPPORTED);
        }
        initializeStringTable();
        this.data = data;
        this.uncompData = uncompData;
        this.bytePointer = 0;
        this.bitPointer = 0;
        this.nextData = 0;
        this.nextBits = 0;
        int oldCode = 0;
        while (true) {
            int code = getNextCode();
            if (code != 257) {
                if (code == 256) {
                    initializeStringTable();
                    int code2 = getNextCode();
                    if (code2 != 257) {
                        writeString(this.stringTable[code2]);
                        oldCode = code2;
                    } else {
                        return;
                    }
                } else {
                    int i = this.tableIndex;
                    byte[][] bArr = this.stringTable;
                    if (code < i) {
                        byte[] string = bArr[code];
                        writeString(string);
                        addStringToTable(this.stringTable[oldCode], string[0]);
                        oldCode = code;
                    } else {
                        byte[] string2 = bArr[oldCode];
                        byte[] string3 = composeString(string2, string2[0]);
                        writeString(string3);
                        addStringToTable(string3);
                        oldCode = code;
                    }
                }
            } else {
                return;
            }
        }
    }

    public void initializeStringTable() {
        this.stringTable = new byte[8192];
        for (int i = 0; i < 256; i++) {
            this.stringTable[i] = new byte[1];
            this.stringTable[i][0] = (byte) i;
        }
        this.tableIndex = 258;
        this.bitsToGet = 9;
    }

    public void writeString(byte[] string) {
        try {
            this.uncompData.write(string);
        } catch (IOException e) {
            throw new PdfException(KernelExceptionMessageConstant.LZW_DECODER_EXCEPTION, (Throwable) e);
        }
    }

    public void addStringToTable(byte[] oldString, byte newString) {
        int length = oldString.length;
        byte[] string = new byte[length + 1];
        System.arraycopy(oldString, 0, string, 0, length);
        string[length] = newString;
        byte[][] bArr = this.stringTable;
        int i = this.tableIndex;
        this.tableIndex = i + 1;
        bArr[i] = string;
        if (this.tableIndex == 511) {
            this.bitsToGet = 10;
        } else if (this.tableIndex == 1023) {
            this.bitsToGet = 11;
        } else if (this.tableIndex == 2047) {
            this.bitsToGet = 12;
        }
    }

    public void addStringToTable(byte[] string) {
        byte[][] bArr = this.stringTable;
        int i = this.tableIndex;
        this.tableIndex = i + 1;
        bArr[i] = string;
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
        byte[] string = new byte[length + 1];
        System.arraycopy(oldString, 0, string, 0, length);
        string[length] = newString;
        return string;
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
