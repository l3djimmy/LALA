package com.itextpdf.commons.bouncycastle.cert;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.IASN1ObjectIdentifier;
import com.itextpdf.commons.bouncycastle.operator.IContentSigner;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Date;
/* loaded from: classes12.dex */
public interface IX509v2CRLBuilder {
    IX509v2CRLBuilder addCRLEntry(BigInteger bigInteger, Date date, int i);

    IX509v2CRLBuilder addExtension(IASN1ObjectIdentifier iASN1ObjectIdentifier, boolean z, IASN1Encodable iASN1Encodable) throws IOException;

    IX509CRLHolder build(IContentSigner iContentSigner);

    IX509v2CRLBuilder setNextUpdate(Date date);
}
