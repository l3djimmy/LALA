package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec;
/* loaded from: classes12.dex */
public class PdfEncryptedPayload extends PdfObjectWrapper<PdfDictionary> {
    public PdfEncryptedPayload(String subtype) {
        this(new PdfDictionary());
        getPdfObject().put(PdfName.Type, PdfName.EncryptedPayload);
        setSubtype(subtype);
    }

    private PdfEncryptedPayload(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public static PdfEncryptedPayload extractFrom(PdfFileSpec fileSpec) {
        if (fileSpec != null && fileSpec.getPdfObject().isDictionary()) {
            return wrap(((PdfDictionary) fileSpec.getPdfObject()).getAsDictionary(PdfName.EP));
        }
        return null;
    }

    public static PdfEncryptedPayload wrap(PdfDictionary dictionary) {
        PdfName type = dictionary.getAsName(PdfName.Type);
        if (type != null && !type.equals(PdfName.EncryptedPayload)) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_SHALL_HAVE_TYPE_EQUALS_TO_ENCRYPTED_PAYLOAD_IF_PRESENT);
        }
        if (dictionary.getAsName(PdfName.Subtype) == null) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_SHALL_HAVE_SUBTYPE);
        }
        return new PdfEncryptedPayload(dictionary);
    }

    public PdfName getSubtype() {
        return getPdfObject().getAsName(PdfName.Subtype);
    }

    public PdfEncryptedPayload setSubtype(String subtype) {
        return setSubtype(new PdfName(subtype));
    }

    public PdfEncryptedPayload setSubtype(PdfName subtype) {
        setModified();
        getPdfObject().put(PdfName.Subtype, subtype);
        return this;
    }

    public PdfName getVersion() {
        return getPdfObject().getAsName(PdfName.Version);
    }

    public PdfEncryptedPayload setVersion(String version) {
        return setVersion(new PdfName(version));
    }

    public PdfEncryptedPayload setVersion(PdfName version) {
        setModified();
        getPdfObject().put(PdfName.Version, version);
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
