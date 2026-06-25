package com.itextpdf.commons.bouncycastle.pkcs;

import com.itextpdf.commons.bouncycastle.asn1.pkcs.IPrivateKeyInfo;
import com.itextpdf.commons.bouncycastle.operator.IInputDecryptorProvider;
/* loaded from: classes12.dex */
public interface IPKCS8EncryptedPrivateKeyInfo {
    IPrivateKeyInfo decryptPrivateKeyInfo(IInputDecryptorProvider iInputDecryptorProvider) throws AbstractPKCSException;
}
