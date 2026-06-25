package com.itextpdf.io.source;

import java.io.IOException;
/* loaded from: classes12.dex */
public class ThreadSafeRandomAccessSource implements IRandomAccessSource {
    private final Object lockObj = new Object();
    private final IRandomAccessSource source;

    public ThreadSafeRandomAccessSource(IRandomAccessSource source) {
        this.source = source;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) throws IOException {
        int i;
        synchronized (this.lockObj) {
            i = this.source.get(position);
        }
        return i;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position, byte[] bytes, int off, int len) throws IOException {
        Throwable th;
        synchronized (this.lockObj) {
            try {
                try {
                    return this.source.get(position, bytes, off, len);
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        long length;
        synchronized (this.lockObj) {
            length = this.source.length();
        }
        return length;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        synchronized (this.lockObj) {
            this.source.close();
        }
    }
}
