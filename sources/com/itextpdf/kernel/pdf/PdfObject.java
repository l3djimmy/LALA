package com.itextpdf.kernel.pdf;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.BadPasswordException;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.utils.ICopyFilter;
import com.itextpdf.kernel.utils.NullCopyFilter;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class PdfObject {
    public static final byte ARRAY = 1;
    public static final byte BOOLEAN = 2;
    public static final byte DICTIONARY = 3;
    protected static final short FLUSHED = 1;
    protected static final short FORBID_RELEASE = 128;
    protected static final short FREE = 2;
    public static final byte INDIRECT_REFERENCE = 5;
    public static final byte LITERAL = 4;
    protected static final short MODIFIED = 8;
    protected static final short MUST_BE_FLUSHED = 32;
    protected static final short MUST_BE_INDIRECT = 64;
    public static final byte NAME = 6;
    public static final byte NULL = 7;
    public static final byte NUMBER = 8;
    protected static final short ORIGINAL_OBJECT_STREAM = 16;
    protected static final short READING = 4;
    protected static final short READ_ONLY = 256;
    public static final byte STREAM = 9;
    public static final byte STRING = 10;
    protected static final short UNENCRYPTED = 512;
    protected PdfIndirectReference indirectReference = null;
    private short state;

    public abstract byte getType();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract PdfObject newInstance();

    public final void flush() {
        flush(true);
    }

    public final void flush(boolean canBeInObjStm) {
        if (isFlushed() || getIndirectReference() == null || getIndirectReference().isFree()) {
            return;
        }
        try {
            PdfDocument document = getIndirectReference().getDocument();
            if (document != null) {
                if (document.isAppendMode() && !isModified()) {
                    Logger logger = LoggerFactory.getLogger(PdfObject.class);
                    logger.info(IoLogMessageConstant.PDF_OBJECT_FLUSHING_NOT_PERFORMED);
                    return;
                }
                document.checkIsoConformance(this, IsoKey.PDF_OBJECT);
                document.flushObject(this, canBeInObjStm && getType() != 9 && getType() != 5 && getIndirectReference().getGenNumber() == 0);
            }
        } catch (IOException e) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_FLUSH_OBJECT, e, this);
        }
    }

    public PdfIndirectReference getIndirectReference() {
        return this.indirectReference;
    }

    public boolean isIndirect() {
        return this.indirectReference != null || checkState((short) 64);
    }

    public PdfObject makeIndirect(PdfDocument document, PdfIndirectReference reference) {
        if (document == null || this.indirectReference != null) {
            return this;
        }
        if (document.getWriter() == null) {
            throw new PdfException(KernelExceptionMessageConstant.THERE_IS_NO_ASSOCIATE_PDF_WRITER_FOR_MAKING_INDIRECTS);
        }
        if (reference == null) {
            this.indirectReference = document.createNextIndirectReference();
            this.indirectReference.setRefersTo(this);
        } else {
            reference.setState((short) 8);
            this.indirectReference = reference;
            this.indirectReference.setRefersTo(this);
        }
        setState(FORBID_RELEASE);
        clearState((short) 64);
        return this;
    }

    public PdfObject makeIndirect(PdfDocument document) {
        return makeIndirect(document, null);
    }

    public boolean isFlushed() {
        PdfIndirectReference indirectReference = getIndirectReference();
        return indirectReference != null && indirectReference.checkState((short) 1);
    }

    public boolean isModified() {
        PdfIndirectReference indirectReference = getIndirectReference();
        return indirectReference != null && indirectReference.checkState((short) 8);
    }

    /* renamed from: clone */
    public PdfObject m7331clone() {
        return clone(NullCopyFilter.getInstance());
    }

    public PdfObject clone(ICopyFilter filter) {
        PdfObject newObject = newInstance();
        if (this.indirectReference != null || checkState((short) 64)) {
            newObject.setState((short) 64);
        }
        newObject.copyContent(this, null, filter);
        return newObject;
    }

    public PdfObject copyTo(PdfDocument document) {
        return copyTo(document, true, NullCopyFilter.getInstance());
    }

    public PdfObject copyTo(PdfDocument document, boolean allowDuplicating) {
        return copyTo(document, allowDuplicating, NullCopyFilter.getInstance());
    }

    public PdfObject copyTo(PdfDocument document, ICopyFilter copyFilter) {
        return copyTo(document, true, copyFilter);
    }

    public PdfObject copyTo(PdfDocument document, boolean allowDuplicating, ICopyFilter copyFilter) {
        if (document == null) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_FOR_COPY_TO_CANNOT_BE_NULL);
        }
        if (this.indirectReference != null) {
            if (this.indirectReference.getWriter() != null || checkState((short) 64)) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_COPY_INDIRECT_OBJECT_FROM_THE_DOCUMENT_THAT_IS_BEING_WRITTEN);
            }
            if (!this.indirectReference.getReader().isOpenedWithFullPermission()) {
                throw new BadPasswordException(BadPasswordException.PdfReaderNotOpenedWithOwnerPassword);
            }
        }
        return processCopying(document, allowDuplicating, copyFilter);
    }

    public PdfObject setModified() {
        if (this.indirectReference != null) {
            this.indirectReference.setState((short) 8);
            setState(FORBID_RELEASE);
        }
        return this;
    }

    public boolean isReleaseForbidden() {
        return checkState(FORBID_RELEASE);
    }

    public void release() {
        if (isReleaseForbidden()) {
            Logger logger = LoggerFactory.getLogger(PdfObject.class);
            logger.warn(IoLogMessageConstant.FORBID_RELEASE_IS_SET);
        } else if (this.indirectReference != null && this.indirectReference.getReader() != null && !this.indirectReference.checkState((short) 1)) {
            this.indirectReference.refersTo = null;
            this.indirectReference = null;
            setState(READ_ONLY);
        }
    }

    public boolean isNull() {
        return getType() == 7;
    }

    public boolean isBoolean() {
        return getType() == 2;
    }

    public boolean isNumber() {
        return getType() == 8;
    }

    public boolean isString() {
        return getType() == 10;
    }

    public boolean isName() {
        return getType() == 6;
    }

    public boolean isArray() {
        return getType() == 1;
    }

    public boolean isDictionary() {
        return getType() == 3;
    }

    public boolean isStream() {
        return getType() == 9;
    }

    public boolean isIndirectReference() {
        return getType() == 5;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObject setIndirectReference(PdfIndirectReference indirectReference) {
        this.indirectReference = indirectReference;
        return this;
    }

    public boolean isLiteral() {
        return getType() == 4;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean checkState(short state) {
        return (this.state & state) == state;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObject setState(short state) {
        this.state = (short) (this.state | state);
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObject clearState(short state) {
        this.state = (short) (this.state & ((short) (~state)));
        return this;
    }

    protected void copyContent(PdfObject from, PdfDocument document) {
        copyContent(from, document, NullCopyFilter.getInstance());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter filter) {
        if (isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_COPY_FLUSHED_OBJECT, this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean equalContent(PdfObject obj1, PdfObject obj2) {
        PdfObject direct1 = (obj1 == null || !obj1.isIndirectReference()) ? obj1 : ((PdfIndirectReference) obj1).getRefersTo(true);
        PdfObject direct2 = (obj2 == null || !obj2.isIndirectReference()) ? obj2 : ((PdfIndirectReference) obj2).getRefersTo(true);
        return direct1 != null && direct1.equals(direct2);
    }

    PdfObject processCopying(PdfDocument documentTo, boolean allowDuplicating) {
        return processCopying(documentTo, allowDuplicating, NullCopyFilter.getInstance());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfObject processCopying(PdfDocument documentTo, boolean allowDuplicating, ICopyFilter filter) {
        if (documentTo != null) {
            PdfWriter writer = documentTo.getWriter();
            if (writer == null) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_COPY_TO_DOCUMENT_OPENED_IN_READING_MODE);
            }
            return writer.copyObject(this, documentTo, allowDuplicating, filter);
        }
        PdfObject obj = this;
        if (obj.isIndirectReference()) {
            PdfObject refTo = ((PdfIndirectReference) obj).getRefersTo();
            obj = refTo != null ? refTo : obj;
        }
        if (obj.isIndirect() && !allowDuplicating) {
            return obj;
        }
        return obj.m7331clone();
    }
}
