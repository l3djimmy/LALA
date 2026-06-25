package com.itextpdf.commons.bouncycastle.asn1.pkcs;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
import java.math.BigInteger;
/* loaded from: classes12.dex */
public interface IRSASSAPSSParams extends IASN1Encodable {
    IAlgorithmIdentifier getHashAlgorithm();

    IAlgorithmIdentifier getMaskGenAlgorithm();

    BigInteger getSaltLength();

    BigInteger getTrailerField();
}
