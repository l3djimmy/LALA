package com.itextpdf.commons.bouncycastle.asn1.tsp;

import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import java.text.ParseException;
import java.util.Date;
/* loaded from: classes12.dex */
public interface ITSTInfo extends IASN1Encodable {
    Date getGenTime() throws ParseException;

    IMessageImprint getMessageImprint();
}
