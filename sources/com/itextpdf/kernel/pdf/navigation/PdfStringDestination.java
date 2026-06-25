package com.itextpdf.kernel.pdf.navigation;

import com.itextpdf.kernel.pdf.IPdfNameTreeAccess;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public class PdfStringDestination extends PdfDestination {
    public PdfStringDestination(String string) {
        this(new PdfString(string));
    }

    public PdfStringDestination(PdfString pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.navigation.PdfDestination
    public PdfObject getDestinationPage(IPdfNameTreeAccess names) {
        PdfArray array = (PdfArray) names.getEntry((PdfString) getPdfObject());
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
