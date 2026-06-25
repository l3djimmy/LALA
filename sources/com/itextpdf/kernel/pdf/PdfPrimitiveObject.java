package com.itextpdf.kernel.pdf;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.utils.ICopyFilter;
import java.util.Arrays;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class PdfPrimitiveObject extends PdfObject {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected byte[] content;
    protected boolean directOnly;

    protected abstract void generateContent();

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPrimitiveObject() {
        this.content = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPrimitiveObject(boolean directOnly) {
        this.content = null;
        this.directOnly = directOnly;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPrimitiveObject(byte[] content) {
        this();
        if (content == null) {
            throw new AssertionError();
        }
        this.content = content;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final byte[] getInternalContent() {
        if (this.content == null) {
            generateContent();
        }
        return this.content;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean hasContent() {
        return this.content != null;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject makeIndirect(PdfDocument document, PdfIndirectReference reference) {
        if (!this.directOnly) {
            return super.makeIndirect(document, reference);
        }
        Logger logger = LoggerFactory.getLogger(PdfObject.class);
        logger.warn(IoLogMessageConstant.DIRECTONLY_OBJECT_CANNOT_BE_INDIRECT);
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject setIndirectReference(PdfIndirectReference indirectReference) {
        if (!this.directOnly) {
            super.setIndirectReference(indirectReference);
        } else {
            Logger logger = LoggerFactory.getLogger(PdfObject.class);
            logger.warn(IoLogMessageConstant.DIRECTONLY_OBJECT_CANNOT_BE_INDIRECT);
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfPrimitiveObject object = (PdfPrimitiveObject) from;
        if (object.content != null) {
            this.content = Arrays.copyOf(object.content, object.content.length);
        }
    }

    protected int compareContent(PdfPrimitiveObject o) {
        int i = 0;
        while (true) {
            int min = Math.min(this.content.length, o.content.length);
            byte[] bArr = this.content;
            if (i < min) {
                if (bArr[i] > o.content[i]) {
                    return 1;
                }
                if (this.content[i] >= o.content[i]) {
                    i++;
                } else {
                    return -1;
                }
            } else {
                int i2 = bArr.length;
                return Integer.compare(i2, o.content.length);
            }
        }
    }
}
