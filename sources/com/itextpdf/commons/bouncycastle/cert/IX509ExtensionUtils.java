package com.itextpdf.commons.bouncycastle.cert;

import com.itextpdf.commons.bouncycastle.asn1.x509.IAuthorityKeyIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.x509.ISubjectKeyIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.x509.ISubjectPublicKeyInfo;
/* loaded from: classes12.dex */
public interface IX509ExtensionUtils {
    IAuthorityKeyIdentifier createAuthorityKeyIdentifier(ISubjectPublicKeyInfo iSubjectPublicKeyInfo);

    ISubjectKeyIdentifier createSubjectKeyIdentifier(ISubjectPublicKeyInfo iSubjectPublicKeyInfo);
}
