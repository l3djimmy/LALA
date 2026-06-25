package com.itextpdf.commons.bouncycastle.cert.ocsp;

import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
import com.itextpdf.commons.bouncycastle.operator.IContentVerifierProvider;
import java.io.IOException;
import java.util.Date;
/* loaded from: classes12.dex */
public interface IBasicOCSPResp {
    IX509CertificateHolder[] getCerts();

    byte[] getEncoded() throws IOException;

    Date getProducedAt();

    ISingleResp[] getResponses();

    boolean isSignatureValid(IContentVerifierProvider iContentVerifierProvider) throws AbstractOCSPException;
}
