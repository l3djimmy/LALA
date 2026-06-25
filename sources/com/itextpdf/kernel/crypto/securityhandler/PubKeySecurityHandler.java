package com.itextpdf.kernel.crypto.securityhandler;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.commons.bouncycastle.asn1.IASN1InputStream;
import com.itextpdf.commons.bouncycastle.asn1.IASN1OutputStream;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Primitive;
import com.itextpdf.commons.bouncycastle.asn1.IDEROctetString;
import com.itextpdf.commons.bouncycastle.asn1.IDERSet;
import com.itextpdf.commons.bouncycastle.asn1.cms.IContentInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IEncryptedContentInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IEnvelopedData;
import com.itextpdf.commons.bouncycastle.asn1.cms.IIssuerAndSerialNumber;
import com.itextpdf.commons.bouncycastle.asn1.cms.IKeyTransRecipientInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IRecipientIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.x509.ITBSCertificate;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.kernel.crypto.CryptoUtil;
import com.itextpdf.kernel.crypto.securityhandler.EncryptionUtils;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfLiteral;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.security.IExternalDecryptionProcess;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public abstract class PubKeySecurityHandler extends SecurityHandler {
    private static final IBouncyCastleFactory BOUNCY_CASTLE_FACTORY = BouncyCastleFactoryCreator.getFactory();
    private static final int DEFAULT_KEY_LENGTH = 40;
    private static final int SEED_LENGTH = 20;
    private List<PublicKeyRecipient> recipients;
    private byte[] seed = EncryptionUtils.generateSeed(20);

    protected abstract String getDigestAlgorithm();

    protected abstract void initKey(byte[] bArr, int i);

    protected abstract void setPubSecSpecificHandlerDicEntries(PdfDictionary pdfDictionary, boolean z, boolean z2);

    /* JADX INFO: Access modifiers changed from: protected */
    public PubKeySecurityHandler() {
        this.recipients = null;
        this.recipients = new ArrayList();
    }

    protected byte[] computeGlobalKey(String messageDigestAlgorithm, boolean encryptMetadata) {
        try {
            MessageDigest md = MessageDigest.getInstance(messageDigestAlgorithm);
            md.update(getSeed());
            for (int i = 0; i < getRecipientsSize(); i++) {
                byte[] encodedRecipient = getEncodedRecipient(i);
                md.update(encodedRecipient);
            }
            if (!encryptMetadata) {
                md.update(new byte[]{-1, -1, -1, -1});
            }
            return md.digest();
        } catch (PdfException pdfException) {
            throw pdfException;
        } catch (Exception e) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_ENCRYPTION, (Throwable) e);
        }
    }

    protected static byte[] computeGlobalKeyOnReading(PdfDictionary encryptionDictionary, PrivateKey certificateKey, Certificate certificate, String certificateKeyProvider, IExternalDecryptionProcess externalDecryptionProcess, boolean encryptMetadata, String digestAlgorithm) {
        PdfArray recipients = encryptionDictionary.getAsArray(PdfName.Recipients);
        if (recipients == null) {
            recipients = encryptionDictionary.getAsDictionary(PdfName.CF).getAsDictionary(PdfName.DefaultCryptFilter).getAsArray(PdfName.Recipients);
        }
        byte[] envelopedData = EncryptionUtils.fetchEnvelopedData(certificateKey, certificate, certificateKeyProvider, externalDecryptionProcess, recipients);
        try {
            MessageDigest md = MessageDigest.getInstance(digestAlgorithm);
            md.update(envelopedData, 0, 20);
            for (int i = 0; i < recipients.size(); i++) {
                byte[] encodedRecipient = recipients.getAsString(i).getValueBytes();
                md.update(encodedRecipient);
            }
            if (!encryptMetadata) {
                md.update(new byte[]{-1, -1, -1, -1});
            }
            byte[] encryptionKey = md.digest();
            return encryptionKey;
        } catch (Exception f) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_DECRYPTION, (Throwable) f);
        }
    }

    protected void addAllRecipients(Certificate[] certs, int[] permissions) {
        if (certs != null) {
            for (int i = 0; i < certs.length; i++) {
                addRecipient(certs[i], permissions[i]);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfArray createRecipientsArray() {
        try {
            PdfArray recipients = getEncodedRecipients();
            return recipients;
        } catch (Exception e) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_ENCRYPTION, (Throwable) e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void initKeyAndFillDictionary(PdfDictionary encryptionDictionary, Certificate[] certs, int[] permissions, boolean encryptMetadata, boolean embeddedFilesOnly) {
        addAllRecipients(certs, permissions);
        int keyLength = getKeyLength(encryptionDictionary);
        String digestAlgorithm = getDigestAlgorithm();
        byte[] digest = computeGlobalKey(digestAlgorithm, encryptMetadata);
        initKey(digest, keyLength);
        setPubSecSpecificHandlerDicEntries(encryptionDictionary, encryptMetadata, embeddedFilesOnly);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void initKeyAndReadDictionary(PdfDictionary encryptionDictionary, Key certificateKey, Certificate certificate, String certificateKeyProvider, IExternalDecryptionProcess externalDecryptionProcess, boolean encryptMetadata) {
        String digestAlgorithm = getDigestAlgorithm();
        byte[] encryptionKey = computeGlobalKeyOnReading(encryptionDictionary, (PrivateKey) certificateKey, certificate, certificateKeyProvider, externalDecryptionProcess, encryptMetadata, digestAlgorithm);
        int keyLength = getKeyLength(encryptionDictionary);
        initKey(encryptionKey, keyLength);
    }

    private void addRecipient(Certificate cert, int permission) {
        this.recipients.add(new PublicKeyRecipient(cert, permission));
    }

    private byte[] getSeed() {
        byte[] clonedSeed = new byte[this.seed.length];
        System.arraycopy(this.seed, 0, clonedSeed, 0, this.seed.length);
        return clonedSeed;
    }

    private int getRecipientsSize() {
        return this.recipients.size();
    }

    private byte[] getEncodedRecipient(int index) throws IOException, GeneralSecurityException {
        PublicKeyRecipient recipient = this.recipients.get(index);
        byte[] cms = recipient.getCms();
        if (cms != null) {
            return cms;
        }
        Certificate certificate = recipient.getCertificate();
        int permission = ((recipient.getPermission() | (-3904)) & (-4)) + 1;
        byte[] pkcs7input = new byte[24];
        byte one = (byte) permission;
        byte two = (byte) (permission >> 8);
        byte three = (byte) (permission >> 16);
        byte four = (byte) (permission >> 24);
        System.arraycopy(this.seed, 0, pkcs7input, 0, 20);
        pkcs7input[20] = four;
        pkcs7input[21] = three;
        pkcs7input[22] = two;
        pkcs7input[23] = one;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        IASN1OutputStream k = CryptoUtil.createAsn1OutputStream(baos, BOUNCY_CASTLE_FACTORY.createASN1Encoding().getDer());
        try {
            IASN1Primitive obj = createDERForRecipient(pkcs7input, (X509Certificate) certificate);
            k.writeObject(obj);
            if (k != null) {
                k.close();
            }
            byte[] cms2 = baos.toByteArray();
            recipient.setCms(cms2);
            return cms2;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                if (k != null) {
                    try {
                        k.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        }
    }

    private PdfArray getEncodedRecipients() {
        PdfArray EncodedRecipients = new PdfArray();
        for (int i = 0; i < this.recipients.size(); i++) {
            try {
                byte[] cms = getEncodedRecipient(i);
                EncodedRecipients.add(new PdfLiteral(StreamUtil.createEscapedString(cms)));
            } catch (IOException | GeneralSecurityException e) {
                return null;
            }
        }
        return EncodedRecipients;
    }

    private IASN1Primitive createDERForRecipient(byte[] in, X509Certificate cert) throws IOException, GeneralSecurityException {
        EncryptionUtils.DERForRecipientParams parameters = EncryptionUtils.calculateDERForRecipientParams(in);
        IKeyTransRecipientInfo keytransrecipientinfo = computeRecipientInfo(cert, parameters.abyte0);
        IDEROctetString deroctetstring = BOUNCY_CASTLE_FACTORY.createDEROctetString(parameters.abyte1);
        IDERSet derset = BOUNCY_CASTLE_FACTORY.createDERSet(BOUNCY_CASTLE_FACTORY.createRecipientInfo(keytransrecipientinfo));
        IEncryptedContentInfo encryptedcontentinfo = BOUNCY_CASTLE_FACTORY.createEncryptedContentInfo(BOUNCY_CASTLE_FACTORY.createPKCSObjectIdentifiers().getData(), parameters.algorithmIdentifier, deroctetstring);
        IEnvelopedData env = BOUNCY_CASTLE_FACTORY.createEnvelopedData(BOUNCY_CASTLE_FACTORY.createNullOriginatorInfo(), derset, encryptedcontentinfo, BOUNCY_CASTLE_FACTORY.createNullASN1Set());
        IContentInfo contentinfo = BOUNCY_CASTLE_FACTORY.createContentInfo(BOUNCY_CASTLE_FACTORY.createPKCSObjectIdentifiers().getEnvelopedData(), env);
        return contentinfo.toASN1Primitive();
    }

    private IKeyTransRecipientInfo computeRecipientInfo(X509Certificate x509Certificate, byte[] abyte0) throws GeneralSecurityException, IOException {
        IASN1InputStream asn1InputStream = BOUNCY_CASTLE_FACTORY.createASN1InputStream(new ByteArrayInputStream(x509Certificate.getTBSCertificate()));
        try {
            ITBSCertificate tbsCertificate = BOUNCY_CASTLE_FACTORY.createTBSCertificate(asn1InputStream.readObject());
            if (asn1InputStream != null) {
                asn1InputStream.close();
            }
            IAlgorithmIdentifier algorithmIdentifier = tbsCertificate.getSubjectPublicKeyInfo().getAlgorithm();
            IIssuerAndSerialNumber issuerAndSerialNumber = BOUNCY_CASTLE_FACTORY.createIssuerAndSerialNumber(tbsCertificate.getIssuer(), tbsCertificate.getSerialNumber().getValue());
            byte[] cipheredBytes = EncryptionUtils.cipherBytes(x509Certificate, abyte0, algorithmIdentifier);
            IDEROctetString derOctetString = BOUNCY_CASTLE_FACTORY.createDEROctetString(cipheredBytes);
            IRecipientIdentifier recipId = BOUNCY_CASTLE_FACTORY.createRecipientIdentifier(issuerAndSerialNumber);
            return BOUNCY_CASTLE_FACTORY.createKeyTransRecipientInfo(recipId, algorithmIdentifier, derOctetString);
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                if (asn1InputStream != null) {
                    try {
                        asn1InputStream.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        }
    }

    private int getKeyLength(PdfDictionary encryptionDict) {
        Integer keyLength = encryptionDict.getAsInt(PdfName.Length);
        if (keyLength != null) {
            return keyLength.intValue();
        }
        return 40;
    }
}
