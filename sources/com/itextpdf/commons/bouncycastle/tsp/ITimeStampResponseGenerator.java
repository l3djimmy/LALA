package com.itextpdf.commons.bouncycastle.tsp;

import java.math.BigInteger;
import java.util.Date;
/* loaded from: classes12.dex */
public interface ITimeStampResponseGenerator {
    ITimeStampResponse generate(ITimeStampRequest iTimeStampRequest, BigInteger bigInteger, Date date) throws AbstractTSPException;
}
