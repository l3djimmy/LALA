package com.itextpdf.commons.bouncycastle.asn1.x509;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.IASN1ObjectIdentifier;
/* loaded from: classes12.dex */
public interface IAlgorithmIdentifier extends IASN1Encodable {
    IASN1ObjectIdentifier getAlgorithm();

    IASN1Encodable getParameters();
}
