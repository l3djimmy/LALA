package com.itextpdf.io.source;

import java.io.IOException;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class GetBufferedRandomAccessSource implements IRandomAccessSource {
    private final byte[] getBuffer;
    private long getBufferEnd;
    private long getBufferStart;
    private final IRandomAccessSource source;

    public GetBufferedRandomAccessSource(IRandomAccessSource source) {
        this.getBufferStart = -1L;
        this.getBufferEnd = -1L;
        this.source = source;
        this.getBuffer = new byte[(int) Math.min(Math.max(source.length() / 4, 1L), 4096L)];
        this.getBufferStart = -1L;
        this.getBufferEnd = -1L;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) throws IOException {
        long position2;
        if (position < this.getBufferStart || position > this.getBufferEnd) {
            position2 = position;
            int count = this.source.get(position2, this.getBuffer, 0, this.getBuffer.length);
            if (count == -1) {
                return -1;
            }
            this.getBufferStart = position2;
            this.getBufferEnd = (count + position2) - 1;
        } else {
            position2 = position;
        }
        int bufPos = (int) (position2 - this.getBufferStart);
        return this.getBuffer[bufPos] & UByte.MAX_VALUE;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position, byte[] bytes, int off, int len) throws IOException {
        return this.source.get(position, bytes, off, len);
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        return this.source.length();
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        this.source.close();
        this.getBufferStart = -1L;
        this.getBufferEnd = -1L;
    }
}
