package com.itextpdf.commons.bouncycastle.cms;

import java.util.Collection;
/* loaded from: classes12.dex */
public interface IRecipientInformationStore {
    IRecipientInformation get(IRecipientId iRecipientId);

    Collection<IRecipientInformation> getRecipients();
}
