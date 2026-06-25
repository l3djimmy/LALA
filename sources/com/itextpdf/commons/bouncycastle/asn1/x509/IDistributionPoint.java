package com.itextpdf.commons.bouncycastle.asn1.x509;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
/* loaded from: classes12.dex */
public interface IDistributionPoint extends IASN1Encodable {
    IGeneralNames getCRLIssuer();

    IDistributionPointName getDistributionPoint();

    IReasonFlags getReasons();
}
