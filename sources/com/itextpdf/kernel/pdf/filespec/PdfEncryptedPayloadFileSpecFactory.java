package com.itextpdf.kernel.pdf.filespec;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfEncryptedPayload;
import com.itextpdf.kernel.pdf.PdfName;
import java.io.IOException;
import java.io.InputStream;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfEncryptedPayloadFileSpecFactory {
    public static PdfFileSpec create(PdfDocument doc, byte[] fileStore, PdfEncryptedPayload encryptedPayload, PdfName mimeType, PdfDictionary fileParameter) {
        return addEncryptedPayloadDictionary(PdfFileSpec.createEmbeddedFileSpec(doc, fileStore, generateDescription(encryptedPayload), generateFileDisplay(encryptedPayload), mimeType, fileParameter, PdfName.EncryptedPayload), encryptedPayload);
    }

    public static PdfFileSpec create(PdfDocument doc, byte[] fileStore, PdfEncryptedPayload encryptedPayload, PdfDictionary fileParameter) {
        return create(doc, fileStore, encryptedPayload, (PdfName) null, fileParameter);
    }

    public static PdfFileSpec create(PdfDocument doc, byte[] fileStore, PdfEncryptedPayload encryptedPayload) {
        return create(doc, fileStore, encryptedPayload, (PdfName) null, (PdfDictionary) null);
    }

    public static PdfFileSpec create(PdfDocument doc, String filePath, PdfEncryptedPayload encryptedPayload, PdfName mimeType, PdfDictionary fileParameter) throws IOException {
        return addEncryptedPayloadDictionary(PdfFileSpec.createEmbeddedFileSpec(doc, filePath, generateDescription(encryptedPayload), generateFileDisplay(encryptedPayload), mimeType, fileParameter, PdfName.EncryptedPayload), encryptedPayload);
    }

    public static PdfFileSpec create(PdfDocument doc, String filePath, PdfEncryptedPayload encryptedPayload, PdfName mimeType) throws IOException {
        return create(doc, filePath, encryptedPayload, mimeType, (PdfDictionary) null);
    }

    public static PdfFileSpec create(PdfDocument doc, String filePath, PdfEncryptedPayload encryptedPayload) throws IOException {
        return create(doc, filePath, encryptedPayload, (PdfName) null, (PdfDictionary) null);
    }

    public static PdfFileSpec create(PdfDocument doc, InputStream is, PdfEncryptedPayload encryptedPayload, PdfName mimeType, PdfDictionary fileParameter) {
        return addEncryptedPayloadDictionary(PdfFileSpec.createEmbeddedFileSpec(doc, is, generateDescription(encryptedPayload), generateFileDisplay(encryptedPayload), mimeType, fileParameter, PdfName.EncryptedPayload), encryptedPayload);
    }

    public static PdfFileSpec create(PdfDocument doc, InputStream is, PdfEncryptedPayload encryptedPayload, PdfName mimeType) {
        return create(doc, is, encryptedPayload, mimeType, (PdfDictionary) null);
    }

    public static PdfFileSpec create(PdfDocument doc, InputStream is, PdfEncryptedPayload encryptedPayload) {
        return create(doc, is, encryptedPayload, (PdfName) null, (PdfDictionary) null);
    }

    public static PdfFileSpec wrap(PdfDictionary dictionary) {
        if (!PdfName.EncryptedPayload.equals(dictionary.getAsName(PdfName.AFRelationship))) {
            LoggerFactory.getLogger(PdfEncryptedPayloadFileSpecFactory.class).error(IoLogMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_SHALL_HAVE_AFRELATIONSHIP_FILED_EQUAL_TO_ENCRYPTED_PAYLOAD);
        }
        PdfDictionary ef = dictionary.getAsDictionary(PdfName.EF);
        if (ef == null || (ef.getAsStream(PdfName.F) == null && ef.getAsStream(PdfName.UF) == null)) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_SHALL_HAVE_EF_DICTIONARY);
        }
        if (!PdfName.Filespec.equals(dictionary.getAsName(PdfName.Type))) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_SHALL_HAVE_TYPE_EQUAL_TO_FILESPEC);
        }
        if (!dictionary.isIndirect()) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_SHALL_BE_INDIRECT);
        }
        PdfFileSpec fileSpec = PdfFileSpec.wrapFileSpecObject(dictionary);
        if (PdfEncryptedPayload.extractFrom(fileSpec) == null) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_DOES_NOT_HAVE_ENCRYPTED_PAYLOAD_DICTIONARY);
        }
        return fileSpec;
    }

    public static String generateDescription(PdfEncryptedPayload ep) {
        String result = "This embedded file is encrypted using " + ep.getSubtype().getValue();
        PdfName version = ep.getVersion();
        if (version != null) {
            return result + " , version: " + version.getValue();
        }
        return result;
    }

    public static String generateFileDisplay(PdfEncryptedPayload ep) {
        return ep.getSubtype().getValue() + "Protected.pdf";
    }

    private static PdfFileSpec addEncryptedPayloadDictionary(PdfFileSpec fs, PdfEncryptedPayload ep) {
        ((PdfDictionary) fs.getPdfObject()).put(PdfName.EP, ep.getPdfObject());
        return fs;
    }
}
