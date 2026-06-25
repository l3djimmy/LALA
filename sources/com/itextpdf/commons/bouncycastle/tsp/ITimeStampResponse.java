package com.itextpdf.commons.bouncycastle.tsp;

import com.itextpdf.commons.bouncycastle.asn1.cmp.IPKIFailureInfo;
import java.io.IOException;
/* loaded from: classes12.dex */
public interface ITimeStampResponse {
    byte[] getEncoded() throws IOException;

    IPKIFailureInfo getFailInfo();

    String getStatusString();

    ITimeStampToken getTimeStampToken();

    void validate(ITimeStampRequest iTimeStampRequest) throws AbstractTSPException;
}
