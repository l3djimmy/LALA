package com.itextpdf.kernel.pdf;

import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes12.dex */
public class CountOutputStream extends OutputStream {
    private long amountOfWrittenBytes = 0;
    private final OutputStream outputStream;

    public CountOutputStream(OutputStream outputStream) {
        this.outputStream = outputStream;
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        this.outputStream.write(b);
        this.amountOfWrittenBytes += b.length;
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        this.outputStream.write(b, off, len);
        this.amountOfWrittenBytes += len;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.outputStream.write(b);
        this.amountOfWrittenBytes++;
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.outputStream.flush();
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.outputStream.close();
    }

    public long getAmountOfWrittenBytes() {
        return this.amountOfWrittenBytes;
    }
}
