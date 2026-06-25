package com.itextpdf.commons.bouncycastle.cert.ocsp;

import com.itextpdf.commons.bouncycastle.asn1.x509.IExtensions;
import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
import com.itextpdf.commons.bouncycastle.operator.IContentSigner;
import java.util.Date;
/* loaded from: classes12.dex */
public interface IBasicOCSPRespBuilder {
    IBasicOCSPRespBuilder addResponse(ICertificateID iCertificateID, ICertificateStatus iCertificateStatus, Date date, Date date2, IExtensions iExtensions);

    IBasicOCSPResp build(IContentSigner iContentSigner, IX509CertificateHolder[] iX509CertificateHolderArr, Date date) throws AbstractOCSPException;

    IBasicOCSPRespBuilder setResponseExtensions(IExtensions iExtensions);
}
