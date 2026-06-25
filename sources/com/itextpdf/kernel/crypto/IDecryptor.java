package com.itextpdf.kernel.crypto;
/* loaded from: classes12.dex */
public interface IDecryptor {
    byte[] finish();

    byte[] update(byte[] bArr, int i, int i2);
}
