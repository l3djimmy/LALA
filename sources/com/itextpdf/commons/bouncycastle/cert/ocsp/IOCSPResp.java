package com.itextpdf.commons.bouncycastle.cert.ocsp;

import java.io.IOException;
/* loaded from: classes12.dex */
public interface IOCSPResp {
    byte[] getEncoded() throws IOException;

    Object getResponseObject() throws AbstractOCSPException;

    int getStatus();

    int getSuccessful();
}
