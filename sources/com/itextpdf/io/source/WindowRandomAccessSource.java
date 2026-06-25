package com.itextpdf.io.source;

import java.io.IOException;
/* loaded from: classes12.dex */
public class WindowRandomAccessSource implements IRandomAccessSource {
    private final long length;
    private final long offset;
    private final IRandomAccessSource source;

    public WindowRandomAccessSource(IRandomAccessSource source, long offset) {
        this(source, offset, source.length() - offset);
    }

    public WindowRandomAccessSource(IRandomAccessSource source, long offset, long length) {
        this.source = source;
        this.offset = offset;
        this.length = length;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) throws IOException {
        if (position >= this.length) {
            return -1;
        }
        return this.source.get(this.offset + position);
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position, byte[] bytes, int off, int len) throws IOException {
        if (position >= this.length) {
            return -1;
        }
        long toRead = Math.min(len, this.length - position);
        return this.source.get(this.offset + position, bytes, off, (int) toRead);
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        return this.length;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        this.source.close();
    }
}
