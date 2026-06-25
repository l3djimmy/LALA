package com.itextpdf.commons.bouncycastle.asn1.x509;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
/* loaded from: classes12.dex */
public interface IIssuingDistributionPoint extends IASN1Encodable {
    IDistributionPointName getDistributionPoint();

    IReasonFlags getOnlySomeReasons();

    boolean isIndirectCRL();

    boolean onlyContainsAttributeCerts();

    boolean onlyContainsCACerts();

    boolean onlyContainsUserCerts();
}
