package com.itextpdf.commons.bouncycastle.asn1;

import java.io.Closeable;
import java.io.IOException;
/* loaded from: classes12.dex */
public interface IASN1InputStream extends Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close() throws IOException;

    IASN1Primitive readObject() throws IOException;
}
