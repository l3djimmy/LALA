package com.itextpdf.kernel.crypto;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class AESCipher {
    private static final String CIPHER_WITH_PKCS5_PADDING = "AES/CBC/PKCS5Padding";
    private static Cipher cipher;
    private static final Logger LOGGER = LoggerFactory.getLogger(AESCipher.class);
    private static final IBouncyCastleFactory BOUNCY_CASTLE_FACTORY = BouncyCastleFactoryCreator.getFactory();

    static {
        try {
            if ("BC".equals(BOUNCY_CASTLE_FACTORY.getProviderName())) {
                cipher = Cipher.getInstance(CIPHER_WITH_PKCS5_PADDING);
            } else {
                cipher = Cipher.getInstance(CIPHER_WITH_PKCS5_PADDING, BOUNCY_CASTLE_FACTORY.getProvider());
            }
        } catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
            throw new PdfException(KernelExceptionMessageConstant.ERROR_WHILE_INITIALIZING_AES_CIPHER, (Throwable) e);
        }
    }

    public AESCipher(boolean forEncryption, byte[] key, byte[] iv) {
        try {
            cipher.init(forEncryption ? 1 : 2, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
        } catch (InvalidAlgorithmParameterException | InvalidKeyException e) {
            throw new PdfException(KernelExceptionMessageConstant.ERROR_WHILE_INITIALIZING_AES_CIPHER, (Throwable) e);
        }
    }

    public byte[] update(byte[] inp, int inpOff, int inpLen) {
        return cipher.update(inp, inpOff, inpLen);
    }

    public byte[] doFinal() {
        try {
            return cipher.doFinal();
        } catch (BadPaddingException | IllegalBlockSizeException e) {
            LOGGER.info(KernelLogMessageConstant.ERROR_WHILE_FINALIZING_AES_CIPHER, (Throwable) e);
            return null;
        }
    }
}
