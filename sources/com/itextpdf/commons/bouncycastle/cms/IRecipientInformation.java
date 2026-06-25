package com.itextpdf.commons.bouncycastle.cms;
/* loaded from: classes12.dex */
public interface IRecipientInformation {
    byte[] getContent(IRecipient iRecipient) throws AbstractCMSException;

    IRecipientId getRID();
}
