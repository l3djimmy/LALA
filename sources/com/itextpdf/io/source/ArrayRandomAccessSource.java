package com.itextpdf.io.source;

import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import java.io.IOException;
import kotlin.UByte;
/* loaded from: classes12.dex */
class ArrayRandomAccessSource implements IRandomAccessSource {
    private byte[] array;

    public ArrayRandomAccessSource(byte[] array) {
        if (array == null) {
            throw new IllegalArgumentException("Passed byte array can not be null.");
        }
        this.array = array;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long offset) {
        if (this.array == null) {
            throw new IllegalStateException(IoExceptionMessageConstant.ALREADY_CLOSED);
        }
        if (offset >= this.array.length) {
            return -1;
        }
        return this.array[(int) offset] & UByte.MAX_VALUE;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long offset, byte[] bytes, int off, int len) {
        if (this.array == null) {
            throw new IllegalStateException(IoExceptionMessageConstant.ALREADY_CLOSED);
        }
        if (offset >= this.array.length) {
            return -1;
        }
        if (len + offset > this.array.length) {
            len = (int) (this.array.length - offset);
        }
        System.arraycopy(this.array, (int) offset, bytes, off, len);
        return len;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        if (this.array == null) {
            throw new IllegalStateException(IoExceptionMessageConstant.ALREADY_CLOSED);
        }
        return this.array.length;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        this.array = null;
    }
}
