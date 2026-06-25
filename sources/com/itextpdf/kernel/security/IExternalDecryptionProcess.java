package com.itextpdf.kernel.security;

import com.itextpdf.commons.bouncycastle.cms.IRecipient;
import com.itextpdf.commons.bouncycastle.cms.IRecipientId;
/* loaded from: classes12.dex */
public interface IExternalDecryptionProcess {
    IRecipient getCmsRecipient();

    IRecipientId getCmsRecipientId();
}
