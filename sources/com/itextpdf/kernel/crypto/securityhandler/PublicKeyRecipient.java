package com.itextpdf.kernel.crypto.securityhandler;

import java.security.cert.Certificate;
/* loaded from: classes12.dex */
public class PublicKeyRecipient {
    private Certificate certificate;
    protected byte[] cms = null;
    private int permission;

    public PublicKeyRecipient(Certificate certificate, int permission) {
        this.certificate = null;
        this.permission = 0;
        this.certificate = certificate;
        this.permission = permission;
    }

    public Certificate getCertificate() {
        return this.certificate;
    }

    public int getPermission() {
        return this.permission;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCms(byte[] cms) {
        this.cms = cms;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public byte[] getCms() {
        return this.cms;
    }
}
