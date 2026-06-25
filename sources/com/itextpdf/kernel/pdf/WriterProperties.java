package com.itextpdf.kernel.pdf;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import java.security.cert.Certificate;
/* loaded from: classes12.dex */
public class WriterProperties {
    protected boolean addXmpMetadata;
    protected PdfString initialDocumentId;
    protected PdfString modifiedDocumentId;
    protected PdfVersion pdfVersion;
    protected boolean smartMode = false;
    protected boolean addUAXmpMetadata = false;
    protected int compressionLevel = -1;
    protected Boolean isFullCompression = null;
    protected EncryptionProperties encryptionProperties = new EncryptionProperties();

    public WriterProperties setPdfVersion(PdfVersion version) {
        this.pdfVersion = version;
        return this;
    }

    public WriterProperties useSmartMode() {
        this.smartMode = true;
        return this;
    }

    public WriterProperties addXmpMetadata() {
        this.addXmpMetadata = true;
        return this;
    }

    public WriterProperties setCompressionLevel(int compressionLevel) {
        this.compressionLevel = compressionLevel;
        return this;
    }

    public WriterProperties setFullCompressionMode(boolean fullCompressionMode) {
        this.isFullCompression = Boolean.valueOf(fullCompressionMode);
        return this;
    }

    public WriterProperties setStandardEncryption(byte[] userPassword, byte[] ownerPassword, int permissions, int encryptionAlgorithm) {
        this.encryptionProperties.setStandardEncryption(userPassword, ownerPassword, permissions, encryptionAlgorithm);
        return this;
    }

    public WriterProperties setPublicKeyEncryption(Certificate[] certs, int[] permissions, int encryptionAlgorithm) {
        BouncyCastleFactoryCreator.getFactory().isEncryptionFeatureSupported(encryptionAlgorithm, true);
        this.encryptionProperties.setPublicKeyEncryption(certs, permissions, encryptionAlgorithm);
        return this;
    }

    public WriterProperties setInitialDocumentId(PdfString initialDocumentId) {
        this.initialDocumentId = initialDocumentId;
        return this;
    }

    public WriterProperties setModifiedDocumentId(PdfString modifiedDocumentId) {
        this.modifiedDocumentId = modifiedDocumentId;
        return this;
    }

    public WriterProperties addUAXmpMetadata() {
        this.addUAXmpMetadata = true;
        return addXmpMetadata();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isStandardEncryptionUsed() {
        return this.encryptionProperties.isStandardEncryptionUsed();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isPublicKeyEncryptionUsed() {
        return this.encryptionProperties.isPublicKeyEncryptionUsed();
    }
}
