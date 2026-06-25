package com.itextpdf.io.source;

import java.io.IOException;
/* loaded from: classes12.dex */
public interface IRandomAccessSource {
    void close() throws IOException;

    int get(long j) throws IOException;

    int get(long j, byte[] bArr, int i, int i2) throws IOException;

    long length();
}
