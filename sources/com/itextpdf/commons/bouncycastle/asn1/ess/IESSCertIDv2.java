package com.itextpdf.commons.bouncycastle.asn1.ess;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
/* loaded from: classes12.dex */
public interface IESSCertIDv2 extends IASN1Encodable {
    byte[] getCertHash();

    IAlgorithmIdentifier getHashAlgorithm();
}
