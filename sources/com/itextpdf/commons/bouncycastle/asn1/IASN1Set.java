package com.itextpdf.commons.bouncycastle.asn1;

import java.util.Enumeration;
/* loaded from: classes12.dex */
public interface IASN1Set extends IASN1Primitive {
    IASN1Encodable getObjectAt(int i);

    Enumeration getObjects();

    int size();

    IASN1Encodable[] toArray();
}
