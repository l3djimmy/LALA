package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.MemoryLimitsAwareException;
import java.io.ByteArrayOutputStream;
import java.util.Arrays;
/* loaded from: classes12.dex */
class MemoryLimitsAwareOutputStream extends ByteArrayOutputStream {
    private static final int DEFAULT_MAX_STREAM_SIZE = 2147483639;
    private int maxStreamSize;

    public MemoryLimitsAwareOutputStream() {
        this.maxStreamSize = DEFAULT_MAX_STREAM_SIZE;
    }

    public MemoryLimitsAwareOutputStream(int size) {
        super(size);
        this.maxStreamSize = DEFAULT_MAX_STREAM_SIZE;
    }

    public long getMaxStreamSize() {
        return this.maxStreamSize;
    }

    public MemoryLimitsAwareOutputStream setMaxStreamSize(int maxStreamSize) {
        this.maxStreamSize = maxStreamSize;
        return this;
    }

    @Override // java.io.ByteArrayOutputStream, java.io.OutputStream
    public synchronized void write(byte[] b, int off, int len) {
        if (off >= 0) {
            if (off <= b.length && len >= 0 && (off + len) - b.length <= 0) {
                int minCapacity = this.count + len;
                if (minCapacity < 0) {
                    throw new MemoryLimitsAwareException(KernelExceptionMessageConstant.DURING_DECOMPRESSION_SINGLE_STREAM_OCCUPIED_MORE_THAN_MAX_INTEGER_VALUE);
                }
                if (minCapacity > this.maxStreamSize) {
                    throw new MemoryLimitsAwareException(KernelExceptionMessageConstant.DURING_DECOMPRESSION_SINGLE_STREAM_OCCUPIED_MORE_MEMORY_THAN_ALLOWED);
                }
                int oldCapacity = this.buf.length;
                int newCapacity = oldCapacity << 1;
                if (newCapacity < 0 || newCapacity - minCapacity < 0) {
                    newCapacity = minCapacity;
                }
                if (newCapacity - this.maxStreamSize > 0) {
                    this.buf = Arrays.copyOf(this.buf, this.maxStreamSize);
                }
                super.write(b, off, len);
            }
        }
        throw new IndexOutOfBoundsException();
    }
}
