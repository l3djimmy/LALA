package com.itextpdf.commons.bouncycastle.cert.ocsp;

import java.util.Date;
/* loaded from: classes12.dex */
public interface ISingleResp {
    ICertificateID getCertID();

    ICertificateStatus getCertStatus();

    Date getNextUpdate();

    Date getThisUpdate();
}
