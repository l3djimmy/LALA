package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import java.io.OutputStream;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class PdfObjectStream extends PdfStream {
    public static final int MAX_OBJ_STREAM_SIZE = 200;
    protected PdfOutputStream indexStream;
    protected PdfNumber size;

    public PdfObjectStream(PdfDocument doc) {
        this(doc, new ByteArrayOutputStream());
        this.indexStream = new PdfOutputStream(new ByteArrayOutputStream());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfObjectStream(PdfObjectStream prev) {
        this(prev.getIndirectReference().getDocument(), prev.getOutputStream().getOutputStream());
        this.indexStream = new PdfOutputStream(prev.indexStream.getOutputStream());
        ((ByteArrayOutputStream) this.outputStream.getOutputStream()).reset();
        ((ByteArrayOutputStream) this.indexStream.getOutputStream()).reset();
        prev.releaseContent(true);
    }

    private PdfObjectStream(PdfDocument doc, OutputStream outputStream) {
        super(outputStream);
        this.size = new PdfNumber(0);
        makeIndirect(doc, doc.getXref().createNewIndirectReference(doc));
        getOutputStream().document = doc;
        put(PdfName.Type, PdfName.ObjStm);
        put(PdfName.N, this.size);
        put(PdfName.First, new PdfNumber(0));
    }

    public void addObject(PdfObject object) {
        if (this.size.intValue() == 200) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_OBJECT_STREAM_REACH_MAX_SIZE);
        }
        PdfOutputStream outputStream = getOutputStream();
        this.indexStream.writeInteger(object.getIndirectReference().getObjNumber()).writeSpace().writeLong(outputStream.getCurrentPos()).writeSpace();
        outputStream.write(object);
        object.getIndirectReference().setObjStreamNumber(getIndirectReference().getObjNumber());
        object.getIndirectReference().setIndex(this.size.intValue());
        outputStream.writeSpace();
        this.size.increment();
        getAsNumber(PdfName.First).setValue(this.indexStream.getCurrentPos());
    }

    public int getSize() {
        return this.size.intValue();
    }

    public PdfOutputStream getIndexStream() {
        return this.indexStream;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfStream, com.itextpdf.kernel.pdf.PdfDictionary
    public void releaseContent() {
        releaseContent(false);
    }

    private void releaseContent(boolean close) {
        if (close) {
            this.outputStream = null;
            this.indexStream = null;
            super.releaseContent();
        }
    }
}
