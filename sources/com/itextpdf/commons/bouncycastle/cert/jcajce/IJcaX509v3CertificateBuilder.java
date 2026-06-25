package com.itextpdf.commons.bouncycastle.cert.jcajce;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.IASN1ObjectIdentifier;
import com.itextpdf.commons.bouncycastle.cert.AbstractCertIOException;
import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
import com.itextpdf.commons.bouncycastle.operator.IContentSigner;
/* loaded from: classes12.dex */
public interface IJcaX509v3CertificateBuilder {
    IJcaX509v3CertificateBuilder addExtension(IASN1ObjectIdentifier iASN1ObjectIdentifier, boolean z, IASN1Encodable iASN1Encodable) throws AbstractCertIOException;

    IX509CertificateHolder build(IContentSigner iContentSigner);
}
