package com.itextpdf.kernel.pdf;

import java.security.SecureRandom;
import java.security.cert.Certificate;
/* loaded from: classes12.dex */
public class EncryptionProperties {
    protected int encryptionAlgorithm;
    protected byte[] ownerPassword;
    protected Certificate[] publicCertificates;
    protected int[] publicKeyEncryptPermissions;
    protected int standardEncryptPermissions;
    protected byte[] userPassword;

    public EncryptionProperties setStandardEncryption(byte[] userPassword, byte[] ownerPassword, int permissions, int encryptionAlgorithm) {
        clearEncryption();
        this.userPassword = userPassword;
        if (ownerPassword != null) {
            this.ownerPassword = ownerPassword;
        } else {
            this.ownerPassword = new byte[16];
            randomBytes(this.ownerPassword);
        }
        this.standardEncryptPermissions = permissions;
        this.encryptionAlgorithm = encryptionAlgorithm;
        return this;
    }

    public EncryptionProperties setPublicKeyEncryption(Certificate[] certs, int[] permissions, int encryptionAlgorithm) {
        clearEncryption();
        this.publicCertificates = certs;
        this.publicKeyEncryptPermissions = permissions;
        this.encryptionAlgorithm = encryptionAlgorithm;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isStandardEncryptionUsed() {
        return this.ownerPassword != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isPublicKeyEncryptionUsed() {
        return this.publicCertificates != null;
    }

    private void clearEncryption() {
        this.publicCertificates = null;
        this.publicKeyEncryptPermissions = null;
        this.userPassword = null;
        this.ownerPassword = null;
    }

    private static void randomBytes(byte[] bytes) {
        new SecureRandom().nextBytes(bytes);
    }
}
