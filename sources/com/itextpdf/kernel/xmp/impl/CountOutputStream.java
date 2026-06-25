package com.itextpdf.kernel.xmp.impl;

import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes12.dex */
public final class CountOutputStream extends OutputStream {
    private int bytesWritten = 0;
    private final OutputStream output;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CountOutputStream(OutputStream output) {
        this.output = output;
    }

    @Override // java.io.OutputStream
    public void write(byte[] buf, int off, int len) throws IOException {
        this.output.write(buf, off, len);
        this.bytesWritten += len;
    }

    @Override // java.io.OutputStream
    public void write(byte[] buf) throws IOException {
        this.output.write(buf);
        this.bytesWritten += buf.length;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.output.write(b);
        this.bytesWritten++;
    }

    public int getBytesWritten() {
        return this.bytesWritten;
    }
}
