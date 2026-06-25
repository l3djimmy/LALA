package com.itextpdf.kernel.pdf;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.commons.bouncycastle.cms.AbstractCMSException;
import com.itextpdf.commons.bouncycastle.cms.IRecipient;
import com.itextpdf.commons.bouncycastle.cms.IRecipientInformation;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import java.io.IOException;
import java.io.OutputStream;
import java.security.PrivateKey;
import java.util.Map;
/* loaded from: classes12.dex */
public final class PdfEncryptor {
    private static final IBouncyCastleFactory BOUNCY_CASTLE_FACTORY = BouncyCastleFactoryCreator.getFactory();
    private IMetaInfo metaInfo;
    private EncryptionProperties properties;

    public static void encrypt(PdfReader reader, OutputStream os, EncryptionProperties properties, Map<String, String> newInfo) {
        new PdfEncryptor().setEncryptionProperties(properties).encrypt(reader, os, newInfo);
    }

    public static void encrypt(PdfReader reader, OutputStream os, EncryptionProperties properties) {
        encrypt(reader, os, properties, null);
    }

    public static String getPermissionsVerbose(int permissions) {
        StringBuilder buf = new StringBuilder("Allowed:");
        if ((permissions & EncryptionConstants.ALLOW_PRINTING) == 2052) {
            buf.append(" Printing");
        }
        if ((permissions & 8) == 8) {
            buf.append(" Modify contents");
        }
        if ((permissions & 16) == 16) {
            buf.append(" Copy");
        }
        if ((permissions & 32) == 32) {
            buf.append(" Modify annotations");
        }
        if ((permissions & 256) == 256) {
            buf.append(" Fill in");
        }
        if ((permissions & 512) == 512) {
            buf.append(" Screen readers");
        }
        if ((permissions & 1024) == 1024) {
            buf.append(" Assembly");
        }
        if ((permissions & 4) == 4) {
            buf.append(" Degraded printing");
        }
        return buf.toString();
    }

    public static boolean isPrintingAllowed(int permissions) {
        return (permissions & EncryptionConstants.ALLOW_PRINTING) == 2052;
    }

    public static boolean isModifyContentsAllowed(int permissions) {
        return (permissions & 8) == 8;
    }

    public static boolean isCopyAllowed(int permissions) {
        return (permissions & 16) == 16;
    }

    public static boolean isModifyAnnotationsAllowed(int permissions) {
        return (permissions & 32) == 32;
    }

    public static boolean isFillInAllowed(int permissions) {
        return (permissions & 256) == 256;
    }

    public static boolean isScreenReadersAllowed(int permissions) {
        return (permissions & 512) == 512;
    }

    public static boolean isAssemblyAllowed(int permissions) {
        return (permissions & 1024) == 1024;
    }

    public static boolean isDegradedPrintingAllowed(int permissions) {
        return (permissions & 4) == 4;
    }

    public static byte[] getContent(IRecipientInformation recipientInfo, PrivateKey certificateKey, String certificateKeyProvider) throws AbstractCMSException {
        IRecipient jceKeyRecipient;
        String algorithm = certificateKey.getAlgorithm();
        if (algorithm.contains("RSA")) {
            jceKeyRecipient = BOUNCY_CASTLE_FACTORY.createJceKeyTransEnvelopedRecipient(certificateKey).setProvider(certificateKeyProvider);
        } else if (algorithm.contains("EC")) {
            jceKeyRecipient = BOUNCY_CASTLE_FACTORY.createJceKeyAgreeEnvelopedRecipient(certificateKey).setProvider(certificateKeyProvider);
        } else {
            throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.ALGORITHM_IS_NOT_SUPPORTED, algorithm));
        }
        return recipientInfo.getContent(jceKeyRecipient);
    }

    public PdfEncryptor setEventCountingMetaInfo(IMetaInfo metaInfo) {
        this.metaInfo = metaInfo;
        return this;
    }

    public PdfEncryptor setEncryptionProperties(EncryptionProperties properties) {
        this.properties = properties;
        return this;
    }

    public void encrypt(PdfReader reader, OutputStream os, Map<String, String> newInfo) {
        WriterProperties writerProperties = new WriterProperties();
        writerProperties.encryptionProperties = this.properties;
        StampingProperties stampingProperties = new StampingProperties();
        stampingProperties.setEventCountingMetaInfo(this.metaInfo);
        try {
            PdfWriter writer = new PdfWriter(os, writerProperties);
            PdfDocument document = new PdfDocument(reader, writer, stampingProperties);
            try {
                document.getDocumentInfo().setMoreInfo(newInfo);
                document.close();
                writer.close();
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    try {
                        document.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
        } catch (IOException e) {
        }
    }

    public void encrypt(PdfReader reader, OutputStream os) {
        encrypt(reader, os, (Map<String, String>) null);
    }
}
