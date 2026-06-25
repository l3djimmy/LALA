package com.itextpdf.commons.bouncycastle.tsp;

import java.io.IOException;
import java.math.BigInteger;
/* loaded from: classes12.dex */
public interface ITimeStampRequest {
    byte[] getEncoded() throws IOException;

    BigInteger getNonce();
}
