package com.itextpdf.commons.bouncycastle.cert.ocsp;

import com.itextpdf.commons.bouncycastle.asn1.IASN1ObjectIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.x509.IExtension;
import java.io.IOException;
/* loaded from: classes12.dex */
public interface IOCSPReq {
    byte[] getEncoded() throws IOException;

    IExtension getExtension(IASN1ObjectIdentifier iASN1ObjectIdentifier);

    IReq[] getRequestList();
}
