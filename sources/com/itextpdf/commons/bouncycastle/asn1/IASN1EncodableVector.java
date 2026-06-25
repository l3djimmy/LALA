package com.itextpdf.commons.bouncycastle.asn1;

import com.itextpdf.commons.bouncycastle.asn1.cms.IAttribute;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
/* loaded from: classes12.dex */
public interface IASN1EncodableVector {
    void add(IASN1Primitive iASN1Primitive);

    void add(IAttribute iAttribute);

    void add(IAlgorithmIdentifier iAlgorithmIdentifier);

    void addOptional(IASN1Primitive iASN1Primitive);

    void addOptional(IAttribute iAttribute);

    void addOptional(IAlgorithmIdentifier iAlgorithmIdentifier);
}
