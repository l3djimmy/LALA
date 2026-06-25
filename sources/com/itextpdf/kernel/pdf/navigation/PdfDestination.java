package com.itextpdf.kernel.pdf.navigation;

import com.itextpdf.kernel.pdf.IPdfNameTreeAccess;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfString;
/* loaded from: classes12.dex */
public abstract class PdfDestination extends PdfObjectWrapper<PdfObject> {
    public abstract PdfObject getDestinationPage(IPdfNameTreeAccess iPdfNameTreeAccess);

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfDestination(PdfObject pdfObject) {
        super(pdfObject);
    }

    public static PdfDestination makeDestination(PdfObject pdfObject) {
        if (pdfObject.getType() == 10) {
            return new PdfStringDestination((PdfString) pdfObject);
        }
        if (pdfObject.getType() == 6) {
            return new PdfNamedDestination((PdfName) pdfObject);
        }
        if (pdfObject.getType() == 1) {
            PdfArray destArray = (PdfArray) pdfObject;
            if (destArray.size() == 0) {
                throw new IllegalArgumentException();
            }
            PdfObject firstObj = destArray.get(0);
            if (firstObj.isNumber()) {
                return new PdfExplicitRemoteGoToDestination(destArray);
            }
            if (firstObj.isDictionary() && PdfName.Page.equals(((PdfDictionary) firstObj).getAsName(PdfName.Type))) {
                return new PdfExplicitDestination(destArray);
            }
            return new PdfStructureDestination(destArray);
        }
        throw new UnsupportedOperationException();
    }
}
