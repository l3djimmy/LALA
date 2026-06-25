package com.itextpdf.commons.bouncycastle.asn1.tsp;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
/* loaded from: classes12.dex */
public interface IMessageImprint extends IASN1Encodable {
    IAlgorithmIdentifier getHashAlgorithm();

    byte[] getHashedMessage();
}
