package com.itextpdf.commons.bouncycastle.cms;

import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
/* loaded from: classes12.dex */
public interface IRecipientId {
    boolean match(IX509CertificateHolder iX509CertificateHolder);
}
