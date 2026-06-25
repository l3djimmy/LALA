package com.itextpdf.kernel.crypto.securityhandler;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.commons.bouncycastle.asn1.IASN1InputStream;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Primitive;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
import com.itextpdf.commons.bouncycastle.cms.ICMSEnvelopedData;
import com.itextpdf.commons.bouncycastle.cms.IRecipientInformation;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfEncryptor;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.security.IExternalDecryptionProcess;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.security.AlgorithmParameterGenerator;
import java.security.AlgorithmParameters;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.SecureRandom;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.HashSet;
import java.util.Set;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
/* loaded from: classes12.dex */
final class EncryptionUtils {
    private static final String ENVELOPE_ENCRYPTION_ALGORITHM_JCA_NAME = "AES/CBC/PKCS5Padding";
    private static final String ENVELOPE_ENCRYPTION_ALGORITHM_OID = "2.16.840.1.101.3.4.1.42";
    private static final int ENVELOPE_ENCRYPTION_KEY_LENGTH = 256;
    private static final IBouncyCastleFactory BOUNCY_CASTLE_FACTORY = BouncyCastleFactoryCreator.getFactory();
    private static final Set<String> UNSUPPORTED_ALGORITHMS = new HashSet();

    EncryptionUtils() {
    }

    static {
        UNSUPPORTED_ALGORITHMS.add("1.2.840.10045.2.1");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] generateSeed(int seedLength) {
        try {
            KeyGenerator key = KeyGenerator.getInstance("AES");
            key.init(192, new SecureRandom());
            SecretKey sk = key.generateKey();
            byte[] seedBytes = new byte[seedLength];
            System.arraycopy(sk.getEncoded(), 0, seedBytes, 0, seedLength);
            return seedBytes;
        } catch (NoSuchAlgorithmException e) {
            return SecureRandom.getSeed(seedLength);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] fetchEnvelopedData(Key certificateKey, Certificate certificate, String certificateKeyProvider, IExternalDecryptionProcess externalDecryptionProcess, PdfArray recipients) {
        boolean foundRecipient = false;
        byte[] envelopedData = null;
        try {
            IX509CertificateHolder certHolder = BOUNCY_CASTLE_FACTORY.createX509CertificateHolder(certificate.getEncoded());
            if (externalDecryptionProcess == null) {
                for (int i = 0; i < recipients.size(); i++) {
                    PdfString recipient = recipients.getAsString(i);
                    try {
                        ICMSEnvelopedData data = BOUNCY_CASTLE_FACTORY.createCMSEnvelopedData(recipient.getValueBytes());
                        for (IRecipientInformation recipientInfo : data.getRecipientInfos().getRecipients()) {
                            if (recipientInfo.getRID().match(certHolder) && !foundRecipient) {
                                envelopedData = PdfEncryptor.getContent(recipientInfo, (PrivateKey) certificateKey, certificateKeyProvider);
                                foundRecipient = true;
                            }
                        }
                    } catch (Exception f) {
                        BouncyCastleFactoryCreator.getFactory().isEncryptionFeatureSupported(0, true);
                        throw new PdfException(KernelExceptionMessageConstant.PDF_DECRYPTION, (Throwable) f);
                    }
                }
            } else {
                for (int i2 = 0; i2 < recipients.size(); i2++) {
                    PdfString recipient2 = recipients.getAsString(i2);
                    try {
                        ICMSEnvelopedData data2 = BOUNCY_CASTLE_FACTORY.createCMSEnvelopedData(recipient2.getValueBytes());
                        IRecipientInformation recipientInfo2 = data2.getRecipientInfos().get(externalDecryptionProcess.getCmsRecipientId());
                        if (recipientInfo2 != null) {
                            foundRecipient = true;
                            envelopedData = recipientInfo2.getContent(externalDecryptionProcess.getCmsRecipient());
                        }
                    } catch (Exception f2) {
                        throw new PdfException(KernelExceptionMessageConstant.PDF_DECRYPTION, (Throwable) f2);
                    }
                }
            }
            if (!foundRecipient || envelopedData == null) {
                throw new PdfException(KernelExceptionMessageConstant.BAD_CERTIFICATE_AND_KEY);
            }
            return envelopedData;
        } catch (Exception f3) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_DECRYPTION, (Throwable) f3);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] cipherBytes(X509Certificate x509certificate, byte[] abyte0, IAlgorithmIdentifier algorithmIdentifier) throws GeneralSecurityException {
        String algorithm = algorithmIdentifier.getAlgorithm().getId();
        if (UNSUPPORTED_ALGORITHMS.contains(algorithm)) {
            throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.ALGORITHM_IS_NOT_SUPPORTED, algorithm));
        }
        return BOUNCY_CASTLE_FACTORY.createCipherBytes(x509certificate, abyte0, algorithmIdentifier);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static DERForRecipientParams calculateDERForRecipientParams(byte[] in) throws IOException, GeneralSecurityException {
        KeyGenerator keygenerator;
        Cipher cipher;
        DERForRecipientParams parameters = new DERForRecipientParams();
        AlgorithmParameterGenerator algorithmparametergenerator = AlgorithmParameterGenerator.getInstance(ENVELOPE_ENCRYPTION_ALGORITHM_OID);
        AlgorithmParameters algorithmparameters = algorithmparametergenerator.generateParameters();
        ByteArrayInputStream bytearrayinputstream = new ByteArrayInputStream(algorithmparameters.getEncoded("ASN.1"));
        IASN1InputStream asn1inputstream = BOUNCY_CASTLE_FACTORY.createASN1InputStream(bytearrayinputstream);
        try {
            IASN1Primitive derobject = asn1inputstream.readObject();
            if (asn1inputstream != null) {
                asn1inputstream.close();
            }
            if ("BC".equals(BOUNCY_CASTLE_FACTORY.getProviderName())) {
                keygenerator = KeyGenerator.getInstance(ENVELOPE_ENCRYPTION_ALGORITHM_OID);
            } else {
                keygenerator = KeyGenerator.getInstance(ENVELOPE_ENCRYPTION_ALGORITHM_OID, BOUNCY_CASTLE_FACTORY.getProvider());
            }
            keygenerator.init(256, BOUNCY_CASTLE_FACTORY.getSecureRandom());
            SecretKey secretkey = keygenerator.generateKey();
            if ("BC".equals(BOUNCY_CASTLE_FACTORY.getProviderName())) {
                cipher = Cipher.getInstance(ENVELOPE_ENCRYPTION_ALGORITHM_JCA_NAME);
            } else {
                cipher = Cipher.getInstance(ENVELOPE_ENCRYPTION_ALGORITHM_JCA_NAME, BOUNCY_CASTLE_FACTORY.getProvider());
            }
            cipher.init(1, secretkey, algorithmparameters);
            parameters.abyte0 = secretkey.getEncoded();
            parameters.abyte1 = cipher.doFinal(in);
            parameters.algorithmIdentifier = BOUNCY_CASTLE_FACTORY.createAlgorithmIdentifier(BOUNCY_CASTLE_FACTORY.createASN1ObjectIdentifier(ENVELOPE_ENCRYPTION_ALGORITHM_OID), derobject);
            return parameters;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                if (asn1inputstream != null) {
                    try {
                        asn1inputstream.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        }
    }

    /* loaded from: classes12.dex */
    static class DERForRecipientParams {
        byte[] abyte0;
        byte[] abyte1;
        IAlgorithmIdentifier algorithmIdentifier;

        DERForRecipientParams() {
        }
    }
}
