package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.security.IExternalDecryptionProcess;
import java.security.Key;
import java.security.cert.Certificate;
/* loaded from: classes12.dex */
public class ReaderProperties {
    protected Certificate certificate;
    protected Key certificateKey;
    protected String certificateKeyProvider;
    protected IExternalDecryptionProcess externalDecryptionProcess;
    protected MemoryLimitsAwareHandler memoryLimitsAwareHandler;
    protected byte[] password;

    public ReaderProperties setPassword(byte[] password) {
        clearEncryptionParams();
        this.password = password;
        return this;
    }

    public ReaderProperties setPublicKeySecurityParams(Certificate certificate, Key certificateKey, String certificateKeyProvider, IExternalDecryptionProcess externalDecryptionProcess) {
        clearEncryptionParams();
        this.certificate = certificate;
        this.certificateKey = certificateKey;
        this.certificateKeyProvider = certificateKeyProvider;
        this.externalDecryptionProcess = externalDecryptionProcess;
        return this;
    }

    public ReaderProperties setPublicKeySecurityParams(Certificate certificate, IExternalDecryptionProcess externalDecryptionProcess) {
        clearEncryptionParams();
        this.certificate = certificate;
        this.externalDecryptionProcess = externalDecryptionProcess;
        return this;
    }

    private void clearEncryptionParams() {
        this.password = null;
        this.certificate = null;
        this.certificateKey = null;
        this.certificateKeyProvider = null;
        this.externalDecryptionProcess = null;
    }

    public ReaderProperties setMemoryLimitsAwareHandler(MemoryLimitsAwareHandler memoryLimitsAwareHandler) {
        this.memoryLimitsAwareHandler = memoryLimitsAwareHandler;
        return this;
    }
}
