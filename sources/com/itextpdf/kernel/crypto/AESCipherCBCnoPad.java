package com.itextpdf.kernel.crypto;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
/* loaded from: classes12.dex */
public class AESCipherCBCnoPad {
    private static final IBouncyCastleFactory BOUNCY_CASTLE_FACTORY = BouncyCastleFactoryCreator.getFactory();
    private static final String CIPHER_WITHOUT_PADDING = "AES/CBC/NoPadding";
    private static Cipher cipher;

    static {
        try {
            if ("BC".equals(BOUNCY_CASTLE_FACTORY.getProviderName())) {
                cipher = Cipher.getInstance(CIPHER_WITHOUT_PADDING);
            } else {
                cipher = Cipher.getInstance(CIPHER_WITHOUT_PADDING, BOUNCY_CASTLE_FACTORY.getProvider());
            }
        } catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
            throw new PdfException(KernelExceptionMessageConstant.ERROR_WHILE_INITIALIZING_AES_CIPHER, (Throwable) e);
        }
    }

    public AESCipherCBCnoPad(boolean forEncryption, byte[] key) {
        this(forEncryption, key, new byte[16]);
    }

    public AESCipherCBCnoPad(boolean forEncryption, byte[] key, byte[] initVector) {
        try {
            cipher.init(forEncryption ? 1 : 2, new SecretKeySpec(key, "AES"), new IvParameterSpec(initVector));
        } catch (InvalidAlgorithmParameterException | InvalidKeyException e) {
            throw new PdfException(KernelExceptionMessageConstant.ERROR_WHILE_INITIALIZING_AES_CIPHER, (Throwable) e);
        }
    }

    public byte[] processBlock(byte[] inp, int inpOff, int inpLen) {
        return cipher.update(inp, inpOff, inpLen);
    }
}
