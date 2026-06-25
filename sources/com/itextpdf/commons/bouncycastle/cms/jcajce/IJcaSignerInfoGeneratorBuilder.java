package com.itextpdf.commons.bouncycastle.cms.jcajce;

import com.itextpdf.commons.bouncycastle.cms.ISignerInfoGenerator;
import com.itextpdf.commons.bouncycastle.operator.AbstractOperatorCreationException;
import com.itextpdf.commons.bouncycastle.operator.IContentSigner;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
/* loaded from: classes12.dex */
public interface IJcaSignerInfoGeneratorBuilder {
    ISignerInfoGenerator build(IContentSigner iContentSigner, X509Certificate x509Certificate) throws AbstractOperatorCreationException, CertificateEncodingException;
}
