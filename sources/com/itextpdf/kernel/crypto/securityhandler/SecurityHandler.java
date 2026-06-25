package com.itextpdf.kernel.crypto.securityhandler;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.kernel.crypto.IDecryptor;
import com.itextpdf.kernel.crypto.OutputStreamEncryption;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import java.io.OutputStream;
import java.security.MessageDigest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class SecurityHandler {
    private static final IBouncyCastleFactory FACTORY = BouncyCastleFactoryCreator.getFactory();
    private static final Logger LOGGER = LoggerFactory.getLogger(SecurityHandler.class);
    protected MessageDigest md5;
    protected byte[] nextObjectKey;
    protected int nextObjectKeySize;
    protected byte[] mkey = new byte[0];
    protected byte[] extra = new byte[5];

    public abstract IDecryptor getDecryptor();

    public abstract OutputStreamEncryption getEncryptionStream(OutputStream outputStream);

    /* JADX INFO: Access modifiers changed from: protected */
    public SecurityHandler() {
        safeInitMessageDigest();
    }

    public void setHashKeyForNextObject(int objNumber, int objGeneration) {
        this.md5.reset();
        this.extra[0] = (byte) objNumber;
        this.extra[1] = (byte) (objNumber >> 8);
        this.extra[2] = (byte) (objNumber >> 16);
        this.extra[3] = (byte) objGeneration;
        this.extra[4] = (byte) (objGeneration >> 8);
        this.md5.update(this.mkey);
        this.md5.update(this.extra);
        this.nextObjectKey = this.md5.digest();
        this.nextObjectKeySize = this.mkey.length + 5;
        if (this.nextObjectKeySize > 16) {
            this.nextObjectKeySize = 16;
        }
    }

    private void safeInitMessageDigest() {
        try {
            this.md5 = MessageDigest.getInstance("MD5");
            if (FACTORY.isInApprovedOnlyMode()) {
                LOGGER.warn(KernelLogMessageConstant.MD5_IS_NOT_FIPS_COMPLIANT);
            }
        } catch (Exception e) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_ENCRYPTION, (Throwable) e);
        }
    }
}
