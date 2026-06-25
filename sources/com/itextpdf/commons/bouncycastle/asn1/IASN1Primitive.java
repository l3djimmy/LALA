package com.itextpdf.commons.bouncycastle.asn1;

import java.io.IOException;
/* loaded from: classes12.dex */
public interface IASN1Primitive extends IASN1Encodable {
    byte[] getEncoded() throws IOException;

    byte[] getEncoded(String str) throws IOException;
}
