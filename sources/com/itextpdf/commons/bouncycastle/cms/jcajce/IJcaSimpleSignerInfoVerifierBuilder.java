package com.itextpdf.commons.bouncycastle.cms.jcajce;

import com.itextpdf.commons.bouncycastle.cms.ISignerInformationVerifier;
import com.itextpdf.commons.bouncycastle.operator.AbstractOperatorCreationException;
import java.security.cert.X509Certificate;
/* loaded from: classes12.dex */
public interface IJcaSimpleSignerInfoVerifierBuilder {
    ISignerInformationVerifier build(X509Certificate x509Certificate) throws AbstractOperatorCreationException;

    IJcaSimpleSignerInfoVerifierBuilder setProvider(String str);
}
