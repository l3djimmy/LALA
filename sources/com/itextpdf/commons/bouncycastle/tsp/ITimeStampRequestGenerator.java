package com.itextpdf.commons.bouncycastle.tsp;

import com.itextpdf.commons.bouncycastle.asn1.IASN1ObjectIdentifier;
import java.math.BigInteger;
/* loaded from: classes12.dex */
public interface ITimeStampRequestGenerator {
    ITimeStampRequest generate(IASN1ObjectIdentifier iASN1ObjectIdentifier, byte[] bArr, BigInteger bigInteger);

    void setCertReq(boolean z);

    void setReqPolicy(String str);
}
