package com.itextpdf.commons.bouncycastle.cert.ocsp;

import com.itextpdf.commons.bouncycastle.asn1.x509.IExtensions;
/* loaded from: classes12.dex */
public interface IOCSPReqBuilder {
    IOCSPReqBuilder addRequest(ICertificateID iCertificateID);

    IOCSPReq build() throws AbstractOCSPException;

    IOCSPReqBuilder setRequestExtensions(IExtensions iExtensions);
}
