package com.itextpdf.commons.bouncycastle.asn1.x509;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Integer;
import com.itextpdf.commons.bouncycastle.asn1.x500.IX500Name;
/* loaded from: classes12.dex */
public interface ITBSCertificate extends IASN1Encodable {
    IX500Name getIssuer();

    IASN1Integer getSerialNumber();

    ISubjectPublicKeyInfo getSubjectPublicKeyInfo();
}
