package com.itextpdf.kernel.crypto;

import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes12.dex */
public abstract class OutputStreamEncryption extends OutputStream {
    protected OutputStream out;
    private byte[] sb = new byte[1];

    public abstract void finish();

    @Override // java.io.OutputStream
    public abstract void write(byte[] bArr, int i, int i2) throws IOException;

    /* JADX INFO: Access modifiers changed from: protected */
    public OutputStreamEncryption(OutputStream out) {
        this.out = out;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        finish();
        this.out.close();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.sb[0] = (byte) b;
        write(this.sb, 0, 1);
    }
}
