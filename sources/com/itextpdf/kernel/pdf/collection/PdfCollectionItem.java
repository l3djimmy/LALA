package com.itextpdf.kernel.pdf.collection;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDate;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public class PdfCollectionItem extends PdfObjectWrapper<PdfDictionary> {
    private PdfCollectionSchema schema;

    public PdfCollectionItem(PdfCollectionSchema schema) {
        super(new PdfDictionary());
        this.schema = schema;
    }

    public PdfCollectionItem addItem(String key, String value) {
        PdfCollectionField field = this.schema.getField(key);
        getPdfObject().put(new PdfName(key), field.getValue(value));
        return this;
    }

    public void addItem(String key, PdfDate date) {
        PdfCollectionField field = this.schema.getField(key);
        if (field.subType == 1) {
            getPdfObject().put(new PdfName(key), date.getPdfObject());
        }
    }

    public void addItem(String key, PdfNumber number) {
        PdfCollectionField field = this.schema.getField(key);
        if (field.subType == 2) {
            getPdfObject().put(new PdfName(key), number);
        }
    }

    public PdfCollectionItem setPrefix(String key, String prefix) {
        PdfName fieldName = new PdfName(key);
        PdfObject obj = getPdfObject().get(fieldName);
        if (obj == null) {
            throw new PdfException(KernelExceptionMessageConstant.YOU_MUST_SET_A_VALUE_BEFORE_ADDING_A_PREFIX);
        }
        PdfDictionary subItem = new PdfDictionary();
        subItem.put(PdfName.D, obj);
        subItem.put(PdfName.P, new PdfString(prefix));
        getPdfObject().put(fieldName, subItem);
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
