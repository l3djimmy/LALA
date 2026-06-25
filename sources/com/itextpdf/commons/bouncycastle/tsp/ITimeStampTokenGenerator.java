package com.itextpdf.commons.bouncycastle.tsp;

import com.itextpdf.commons.bouncycastle.cert.jcajce.IJcaCertStore;
import java.math.BigInteger;
import java.util.Date;
/* loaded from: classes12.dex */
public interface ITimeStampTokenGenerator {
    void addCertificates(IJcaCertStore iJcaCertStore);

    ITimeStampToken generate(ITimeStampRequest iTimeStampRequest, BigInteger bigInteger, Date date) throws AbstractTSPException;

    void setAccuracySeconds(int i);
}
