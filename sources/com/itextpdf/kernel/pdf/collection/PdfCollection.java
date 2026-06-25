package com.itextpdf.kernel.pdf.collection;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public class PdfCollection extends PdfObjectWrapper<PdfDictionary> {
    public static final int DETAILS = 0;
    public static final int HIDDEN = 2;
    public static final int TILE = 1;

    public PdfCollection(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public PdfCollection() {
        this(new PdfDictionary());
    }

    public PdfCollection setSchema(PdfCollectionSchema schema) {
        getPdfObject().put(PdfName.Schema, schema.getPdfObject());
        return this;
    }

    public PdfCollectionSchema getSchema() {
        return new PdfCollectionSchema(getPdfObject().getAsDictionary(PdfName.Schema));
    }

    public PdfCollection setInitialDocument(String documentName) {
        getPdfObject().put(PdfName.D, new PdfString(documentName));
        return this;
    }

    public PdfString getInitialDocument() {
        return getPdfObject().getAsString(PdfName.D);
    }

    public PdfCollection setView(int viewType) {
        switch (viewType) {
            case 1:
                getPdfObject().put(PdfName.View, PdfName.T);
                break;
            case 2:
                getPdfObject().put(PdfName.View, PdfName.H);
                break;
            default:
                getPdfObject().put(PdfName.View, PdfName.D);
                break;
        }
        return this;
    }

    public boolean isViewDetails() {
        PdfName view = getPdfObject().getAsName(PdfName.View);
        return view == null || view.equals(PdfName.D);
    }

    public boolean isViewTile() {
        return PdfName.T.equals(getPdfObject().getAsName(PdfName.View));
    }

    public boolean isViewHidden() {
        return PdfName.H.equals(getPdfObject().getAsName(PdfName.View));
    }

    public PdfCollection setSort(PdfCollectionSort sort) {
        getPdfObject().put(PdfName.Sort, sort.getPdfObject());
        return this;
    }

    public PdfCollectionSort getSort() {
        return new PdfCollectionSort(getPdfObject().getAsDictionary(PdfName.Sort));
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
