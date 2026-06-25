package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec;
/* loaded from: classes12.dex */
public class PdfFileAttachmentAnnotation extends PdfMarkupAnnotation {
    public PdfFileAttachmentAnnotation(Rectangle rect) {
        super(rect);
    }

    public PdfFileAttachmentAnnotation(Rectangle rect, PdfFileSpec file) {
        this(rect);
        put(PdfName.FS, file.getPdfObject());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfFileAttachmentAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.FileAttachment;
    }

    public PdfObject getFileSpecObject() {
        return getPdfObject().get(PdfName.FS);
    }

    public PdfName getIconName() {
        return getPdfObject().getAsName(PdfName.Name);
    }

    public PdfFileAttachmentAnnotation setIconName(PdfName name) {
        return (PdfFileAttachmentAnnotation) put(PdfName.Name, name);
    }
}
