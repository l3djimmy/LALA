package com.itextpdf.commons.bouncycastle.tsp;

import com.itextpdf.commons.bouncycastle.asn1.tsp.ITSTInfo;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
import java.io.IOException;
import java.util.Date;
/* loaded from: classes12.dex */
public interface ITimeStampTokenInfo {
    byte[] getEncoded() throws IOException;

    Date getGenTime();

    IAlgorithmIdentifier getHashAlgorithm();

    ITSTInfo toASN1Structure();
}
