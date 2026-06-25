package com.itextpdf.commons.bouncycastle.cert.jcajce;

import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
import java.security.Provider;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
/* loaded from: classes12.dex */
public interface IJcaX509CertificateConverter {
    X509Certificate getCertificate(IX509CertificateHolder iX509CertificateHolder) throws CertificateException;

    IJcaX509CertificateConverter setProvider(Provider provider);
}
