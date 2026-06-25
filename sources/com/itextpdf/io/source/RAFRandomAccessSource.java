package com.itextpdf.io.source;

import java.io.IOException;
import java.io.RandomAccessFile;
/* loaded from: classes12.dex */
class RAFRandomAccessSource implements IRandomAccessSource {
    private final long length;
    private final RandomAccessFile raf;

    public RAFRandomAccessSource(RandomAccessFile raf) throws IOException {
        this.raf = raf;
        this.length = raf.length();
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) throws IOException {
        if (position > this.length) {
            return -1;
        }
        if (this.raf.getFilePointer() != position) {
            this.raf.seek(position);
        }
        return this.raf.read();
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position, byte[] bytes, int off, int len) throws IOException {
        if (position > this.length) {
            return -1;
        }
        if (this.raf.getFilePointer() != position) {
            this.raf.seek(position);
        }
        return this.raf.read(bytes, off, len);
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        return this.length;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        this.raf.close();
    }
}
