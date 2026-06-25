package com.itextpdf.io.codec;

import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes12.dex */
class BitFile {
    boolean blocks;
    OutputStream output;
    byte[] buffer = new byte[256];
    int index = 0;
    int bitsLeft = 8;

    public BitFile(OutputStream output, boolean blocks) {
        this.blocks = false;
        this.output = output;
        this.blocks = blocks;
    }

    public void flush() throws IOException {
        int numBytes = this.index + (this.bitsLeft == 8 ? 0 : 1);
        if (numBytes > 0) {
            if (this.blocks) {
                this.output.write(numBytes);
            }
            this.output.write(this.buffer, 0, numBytes);
            this.buffer[0] = 0;
            this.index = 0;
            this.bitsLeft = 8;
        }
    }

    public void writeBits(int bits, int numbits) throws IOException {
        int bitsWritten = 0;
        do {
            if ((this.index == 254 && this.bitsLeft == 0) || this.index > 254) {
                if (this.blocks) {
                    this.output.write(255);
                }
                this.output.write(this.buffer, 0, 255);
                this.buffer[0] = 0;
                this.index = 0;
                this.bitsLeft = 8;
            }
            int i = this.bitsLeft;
            boolean z = this.blocks;
            if (numbits <= i) {
                byte[] bArr = this.buffer;
                if (z) {
                    int i2 = this.index;
                    bArr[i2] = (byte) (((byte) ((bits & ((1 << numbits) - 1)) << (8 - this.bitsLeft))) | bArr[i2]);
                    bitsWritten += numbits;
                    this.bitsLeft -= numbits;
                    numbits = 0;
                    continue;
                } else {
                    int i3 = this.index;
                    bArr[i3] = (byte) (bArr[i3] | ((byte) ((((1 << numbits) - 1) & bits) << (this.bitsLeft - numbits))));
                    bitsWritten += numbits;
                    this.bitsLeft -= numbits;
                    numbits = 0;
                    continue;
                }
            } else if (!z) {
                int topbits = (bits >>> (numbits - this.bitsLeft)) & ((1 << this.bitsLeft) - 1);
                byte[] bArr2 = this.buffer;
                int i4 = this.index;
                bArr2[i4] = (byte) (bArr2[i4] | ((byte) topbits));
                numbits -= this.bitsLeft;
                bitsWritten += this.bitsLeft;
                byte[] bArr3 = this.buffer;
                int i5 = this.index + 1;
                this.index = i5;
                bArr3[i5] = 0;
                this.bitsLeft = 8;
                continue;
            } else {
                byte[] bArr4 = this.buffer;
                int i6 = this.index;
                bArr4[i6] = (byte) (bArr4[i6] | ((byte) ((((1 << this.bitsLeft) - 1) & bits) << (8 - this.bitsLeft))));
                bitsWritten += this.bitsLeft;
                bits >>= this.bitsLeft;
                numbits -= this.bitsLeft;
                byte[] bArr5 = this.buffer;
                int i7 = this.index + 1;
                this.index = i7;
                bArr5[i7] = 0;
                this.bitsLeft = 8;
                continue;
            }
        } while (numbits != 0);
    }
}
