package com.itextpdf.commons.bouncycastle.asn1.ocsp;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import java.text.ParseException;
import java.util.Date;
/* loaded from: classes12.dex */
public interface IBasicOCSPResponse extends IASN1Encodable {
    Date getProducedAtDate() throws ParseException;
}
