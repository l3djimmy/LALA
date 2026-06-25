package com.itextpdf.commons.bouncycastle.asn1.x509;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
/* loaded from: classes12.dex */
public interface IDistributionPointName extends IASN1Encodable {
    int getFullName();

    IASN1Encodable getName();

    int getType();
}
