package com.itextpdf.io.source;

import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes12.dex */
public class RASInputStream extends InputStream {
    private long position = 0;
    private final IRandomAccessSource source;

    public RASInputStream(IRandomAccessSource source) {
        this.source = source;
    }

    public IRandomAccessSource getSource() {
        return this.source;
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int count = this.source.get(this.position, b, off, len);
        this.position += count;
        return count;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        IRandomAccessSource iRandomAccessSource = this.source;
        long j = this.position;
        this.position = 1 + j;
        return iRandomAccessSource.get(j);
    }
}
