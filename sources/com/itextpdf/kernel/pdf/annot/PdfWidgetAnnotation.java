package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.action.PdfAction;
/* loaded from: classes12.dex */
public class PdfWidgetAnnotation extends PdfAnnotation {
    public static final int HIDDEN = 1;
    public static final int HIDDEN_BUT_PRINTABLE = 3;
    public static final int VISIBLE = 4;
    public static final int VISIBLE_BUT_DOES_NOT_PRINT = 2;

    public PdfWidgetAnnotation(Rectangle rect) {
        super(rect);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfWidgetAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
    public PdfName getSubtype() {
        return PdfName.Widget;
    }

    public PdfWidgetAnnotation setParent(PdfObject parent) {
        return (PdfWidgetAnnotation) put(PdfName.Parent, parent);
    }

    public PdfWidgetAnnotation setHighlightMode(PdfName mode) {
        return (PdfWidgetAnnotation) put(PdfName.H, mode);
    }

    public PdfName getHighlightMode() {
        return getPdfObject().getAsName(PdfName.H);
    }

    public void releaseFormFieldFromWidgetAnnotation() {
        PdfDictionary annotationDictionary = getPdfObject();
        PdfDictionary parent = annotationDictionary.getAsDictionary(PdfName.Parent);
        if (parent != null) {
            PdfArray kids = parent.getAsArray(PdfName.Kids);
            kids.remove(annotationDictionary);
            if (kids.isEmpty()) {
                parent.remove(PdfName.Kids);
            }
        }
    }

    public PdfWidgetAnnotation setVisibility(int visibility) {
        switch (visibility) {
            case 1:
                getPdfObject().put(PdfName.F, new PdfNumber(6));
                break;
            case 2:
                break;
            case 3:
                getPdfObject().put(PdfName.F, new PdfNumber(36));
                break;
            default:
                getPdfObject().put(PdfName.F, new PdfNumber(4));
                break;
        }
        return this;
    }

    public PdfDictionary getAction() {
        return getPdfObject().getAsDictionary(PdfName.A);
    }

    public PdfWidgetAnnotation setAction(PdfAction action) {
        return (PdfWidgetAnnotation) put(PdfName.A, action.getPdfObject());
    }

    public PdfDictionary getAdditionalAction() {
        return getPdfObject().getAsDictionary(PdfName.AA);
    }

    public PdfWidgetAnnotation setAdditionalAction(PdfName key, PdfAction action) {
        PdfAction.setAdditionalAction(this, key, action);
        return this;
    }

    public PdfDictionary getAppearanceCharacteristics() {
        return getPdfObject().getAsDictionary(PdfName.MK);
    }

    public PdfWidgetAnnotation setAppearanceCharacteristics(PdfDictionary characteristics) {
        return (PdfWidgetAnnotation) put(PdfName.MK, characteristics);
    }

    public PdfDictionary getBorderStyle() {
        return getPdfObject().getAsDictionary(PdfName.BS);
    }

    public PdfWidgetAnnotation setBorderStyle(PdfDictionary borderStyle) {
        return (PdfWidgetAnnotation) put(PdfName.BS, borderStyle);
    }

    public PdfWidgetAnnotation setBorderStyle(PdfName style) {
        return setBorderStyle(BorderStyleUtil.setStyle(getBorderStyle(), style));
    }

    public PdfWidgetAnnotation setDashPattern(PdfArray dashPattern) {
        return setBorderStyle(BorderStyleUtil.setDashPattern(getBorderStyle(), dashPattern));
    }
}
