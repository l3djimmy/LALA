package com.itextpdf.kernel.pdf.navigation;

import com.itextpdf.kernel.pdf.IPdfNameTreeAccess;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
/* loaded from: classes12.dex */
public class PdfNamedDestination extends PdfDestination {
    public PdfNamedDestination(String name) {
        this(new PdfName(name));
    }

    public PdfNamedDestination(PdfName pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.navigation.PdfDestination
    public PdfObject getDestinationPage(IPdfNameTreeAccess names) {
        PdfName name = (PdfName) getPdfObject();
        PdfArray array = (PdfArray) names.getEntry(name.getValue());
        if (array != null) {
            return array.get(0);
        }
        return null;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
