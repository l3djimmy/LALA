package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfObject;
/* loaded from: classes12.dex */
public abstract class PdfObjectWrapper<T extends PdfObject> {
    private T pdfObject;

    protected abstract boolean isWrappedObjectMustBeIndirect();

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObjectWrapper(T pdfObject) {
        this.pdfObject = null;
        this.pdfObject = pdfObject;
        if (isWrappedObjectMustBeIndirect()) {
            markObjectAsIndirect(this.pdfObject);
        }
    }

    public T getPdfObject() {
        return this.pdfObject;
    }

    public PdfObjectWrapper<T> makeIndirect(PdfDocument document, PdfIndirectReference reference) {
        getPdfObject().makeIndirect(document, reference);
        return this;
    }

    public PdfObjectWrapper<T> makeIndirect(PdfDocument document) {
        return makeIndirect(document, null);
    }

    public PdfObjectWrapper<T> setModified() {
        this.pdfObject.setModified();
        return this;
    }

    public void flush() {
        this.pdfObject.flush();
    }

    public boolean isFlushed() {
        return this.pdfObject.isFlushed();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setPdfObject(T pdfObject) {
        this.pdfObject = pdfObject;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setForbidRelease() {
        if (this.pdfObject != null) {
            this.pdfObject.setState((short) 128);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void unsetForbidRelease() {
        if (this.pdfObject != null) {
            this.pdfObject.clearState((short) 128);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void ensureUnderlyingObjectHasIndirectReference() {
        if (getPdfObject().getIndirectReference() == null) {
            throw new PdfException(KernelExceptionMessageConstant.TO_FLUSH_THIS_WRAPPER_UNDERLYING_OBJECT_MUST_BE_ADDED_TO_DOCUMENT);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void markObjectAsIndirect(PdfObject pdfObject) {
        if (pdfObject.getIndirectReference() == null) {
            pdfObject.setState((short) 64);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void ensureObjectIsAddedToDocument(PdfObject object) {
        if (object.getIndirectReference() == null) {
            throw new PdfException(KernelExceptionMessageConstant.OBJECT_MUST_BE_INDIRECT_TO_WORK_WITH_THIS_WRAPPER);
        }
    }
}
