package com.itextpdf.kernel.pdf.collection;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfBoolean;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfCollectionSort extends PdfObjectWrapper<PdfDictionary> {
    public PdfCollectionSort(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public PdfCollectionSort(String key) {
        this(new PdfDictionary());
        getPdfObject().put(PdfName.S, new PdfName(key));
    }

    public PdfCollectionSort(String[] keys) {
        this(new PdfDictionary());
        getPdfObject().put(PdfName.S, new PdfArray((List<String>) Arrays.asList(keys), true));
    }

    public PdfCollectionSort setSortOrder(boolean ascending) {
        PdfObject obj = getPdfObject().get(PdfName.S);
        if (obj.isName()) {
            getPdfObject().put(PdfName.A, PdfBoolean.valueOf(ascending));
            return this;
        }
        throw new PdfException(KernelExceptionMessageConstant.YOU_HAVE_TO_DEFINE_A_BOOLEAN_ARRAY_FOR_THIS_COLLECTION_SORT_DICTIONARY);
    }

    public PdfCollectionSort setSortOrder(boolean[] ascending) {
        PdfObject obj = getPdfObject().get(PdfName.S);
        if (obj.isArray()) {
            if (((PdfArray) obj).size() != ascending.length) {
                throw new PdfException(KernelExceptionMessageConstant.NUMBER_OF_BOOLEANS_IN_THE_ARRAY_DOES_NOT_CORRESPOND_WITH_THE_NUMBER_OF_FIELDS);
            }
            getPdfObject().put(PdfName.A, new PdfArray(ascending));
            return this;
        }
        throw new PdfException(KernelExceptionMessageConstant.YOU_NEED_A_SINGLE_BOOLEAN_FOR_THIS_COLLECTION_SORT_DICTIONARY);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
