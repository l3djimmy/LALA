package com.itextpdf.commons.bouncycastle.openssl.jcajce;

import com.itextpdf.commons.bouncycastle.asn1.pkcs.IPrivateKeyInfo;
import com.itextpdf.commons.bouncycastle.openssl.AbstractPEMException;
import java.security.PrivateKey;
import java.security.Provider;
/* loaded from: classes12.dex */
public interface IJcaPEMKeyConverter {
    PrivateKey getPrivateKey(IPrivateKeyInfo iPrivateKeyInfo) throws AbstractPEMException;

    IJcaPEMKeyConverter setProvider(Provider provider);
}
