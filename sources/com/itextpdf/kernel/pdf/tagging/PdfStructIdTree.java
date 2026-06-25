package com.itextpdf.kernel.pdf.tagging;

import com.itextpdf.kernel.pdf.GenericNameTree;
import com.itextpdf.kernel.pdf.IsoKey;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfString;
import java.util.function.Consumer;
/* loaded from: classes12.dex */
public class PdfStructIdTree extends GenericNameTree {
    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfStructIdTree(PdfDocument pdfDoc) {
        super(pdfDoc);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static PdfStructIdTree readFromDictionary(PdfDocument pdfDoc, PdfDictionary dict) {
        PdfStructIdTree structIdTree = new PdfStructIdTree(pdfDoc);
        structIdTree.setItems(GenericNameTree.readTree(dict));
        return structIdTree;
    }

    public PdfStructElem getStructElemById(PdfString id) {
        PdfObject rawObj = getItems().get(id);
        if (rawObj instanceof PdfIndirectReference) {
            rawObj = ((PdfIndirectReference) rawObj).getRefersTo();
        }
        if (rawObj instanceof PdfDictionary) {
            return new PdfStructElem((PdfDictionary) rawObj);
        }
        return null;
    }

    public PdfStructElem getStructElemById(byte[] id) {
        return getStructElemById(new PdfString(id));
    }

    @Override // com.itextpdf.kernel.pdf.GenericNameTree
    public void addEntry(final PdfString key, PdfObject value) {
        super.addEntry(key, value, new Consumer() { // from class: com.itextpdf.kernel.pdf.tagging.PdfStructIdTree$$ExternalSyntheticLambda0
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                ((PdfDocument) obj).checkIsoConformance(PdfString.this, IsoKey.DUPLICATE_ID_ENTRY);
            }
        });
    }
}
