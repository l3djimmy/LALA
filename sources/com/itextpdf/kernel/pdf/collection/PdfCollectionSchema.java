package com.itextpdf.kernel.pdf.collection;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
/* loaded from: classes12.dex */
public class PdfCollectionSchema extends PdfObjectWrapper<PdfDictionary> {
    public PdfCollectionSchema(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public PdfCollectionSchema() {
        this(new PdfDictionary());
    }

    public PdfCollectionSchema addField(String name, PdfCollectionField field) {
        getPdfObject().put(new PdfName(name), field.getPdfObject());
        return this;
    }

    public PdfCollectionField getField(String name) {
        return new PdfCollectionField(getPdfObject().getAsDictionary(new PdfName(name)));
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
