package com.itextpdf.kernel.crypto;

import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes12.dex */
public class OutputStreamStandardEncryption extends OutputStreamEncryption {
    protected ARCFOUREncryption arcfour;

    public OutputStreamStandardEncryption(OutputStream out, byte[] key, int off, int len) {
        super(out);
        this.arcfour = new ARCFOUREncryption();
        this.arcfour.prepareARCFOURKey(key, off, len);
    }

    public OutputStreamStandardEncryption(OutputStream out, byte[] key) {
        this(out, key, 0, key.length);
    }

    @Override // com.itextpdf.kernel.crypto.OutputStreamEncryption, java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        byte[] b2 = new byte[Math.min(len, 4192)];
        int off2 = off;
        while (len > 0) {
            int sz = Math.min(len, b2.length);
            byte[] b3 = b;
            this.arcfour.encryptARCFOUR(b3, off2, sz, b2, 0);
            this.out.write(b2, 0, sz);
            len -= sz;
            off2 += sz;
            b = b3;
        }
    }

    @Override // com.itextpdf.kernel.crypto.OutputStreamEncryption
    public void finish() {
    }
}
