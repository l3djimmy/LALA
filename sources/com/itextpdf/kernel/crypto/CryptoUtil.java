package com.itextpdf.kernel.crypto;

import com.itextpdf.bouncycastleconnector.BouncyCastleFactoryCreator;
import com.itextpdf.commons.bouncycastle.IBouncyCastleFactory;
import com.itextpdf.commons.bouncycastle.asn1.IASN1OutputStream;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
/* loaded from: classes12.dex */
public class CryptoUtil {
    private static final IBouncyCastleFactory BOUNCY_CASTLE_FACTORY = BouncyCastleFactoryCreator.getFactory();

    private CryptoUtil() {
    }

    public static Certificate readPublicCertificate(InputStream is) throws CertificateException {
        return CertificateFactory.getInstance("X.509").generateCertificate(is);
    }

    public static IASN1OutputStream createAsn1OutputStream(OutputStream outputStream, String asn1Encoding) {
        if (!BOUNCY_CASTLE_FACTORY.createASN1Encoding().getDer().equals(asn1Encoding) && !BOUNCY_CASTLE_FACTORY.createASN1Encoding().getBer().equals(asn1Encoding)) {
            throw new UnsupportedOperationException(MessageFormatUtil.format(KernelExceptionMessageConstant.UNSUPPORTED_ASN1_ENCODING, asn1Encoding));
        }
        return BOUNCY_CASTLE_FACTORY.createASN1OutputStream(outputStream, asn1Encoding);
    }
}
