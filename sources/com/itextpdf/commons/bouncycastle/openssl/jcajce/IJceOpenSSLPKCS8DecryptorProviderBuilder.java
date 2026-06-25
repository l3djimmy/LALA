package com.itextpdf.commons.bouncycastle.openssl.jcajce;

import com.itextpdf.commons.bouncycastle.operator.AbstractOperatorCreationException;
import com.itextpdf.commons.bouncycastle.operator.IInputDecryptorProvider;
import java.security.Provider;
/* loaded from: classes12.dex */
public interface IJceOpenSSLPKCS8DecryptorProviderBuilder {
    IInputDecryptorProvider build(char[] cArr) throws AbstractOperatorCreationException;

    IJceOpenSSLPKCS8DecryptorProviderBuilder setProvider(Provider provider);
}
