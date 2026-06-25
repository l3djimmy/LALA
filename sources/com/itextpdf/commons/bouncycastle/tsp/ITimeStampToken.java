package com.itextpdf.commons.bouncycastle.tsp;

import com.itextpdf.commons.bouncycastle.cms.ISignerInformationVerifier;
import java.io.IOException;
/* loaded from: classes12.dex */
public interface ITimeStampToken {
    byte[] getEncoded() throws IOException;

    ITimeStampTokenInfo getTimeStampInfo();

    void validate(ISignerInformationVerifier iSignerInformationVerifier) throws AbstractTSPException;
}
