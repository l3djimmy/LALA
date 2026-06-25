package com.itextpdf.kernel.pdf.navigation;

import com.itextpdf.kernel.pdf.IPdfNameTreeAccess;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfPage;
/* loaded from: classes12.dex */
public class PdfExplicitDestination extends PdfDestination {
    public PdfExplicitDestination() {
        this(new PdfArray());
    }

    public PdfExplicitDestination(PdfArray pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.navigation.PdfDestination
    public PdfObject getDestinationPage(IPdfNameTreeAccess names) {
        return ((PdfArray) getPdfObject()).get(0);
    }

    public static PdfExplicitDestination createXYZ(PdfPage page, float left, float top, float zoom) {
        return create(page, PdfName.XYZ, left, Float.NaN, Float.NaN, top, zoom);
    }

    public static PdfExplicitDestination createFit(PdfPage page) {
        return create(page, PdfName.Fit, Float.NaN, Float.NaN, Float.NaN, Float.NaN, Float.NaN);
    }

    public static PdfExplicitDestination createFitH(PdfPage page, float top) {
        return create(page, PdfName.FitH, Float.NaN, Float.NaN, Float.NaN, top, Float.NaN);
    }

    public static PdfExplicitDestination createFitV(PdfPage page, float left) {
        return create(page, PdfName.FitV, left, Float.NaN, Float.NaN, Float.NaN, Float.NaN);
    }

    public static PdfExplicitDestination createFitR(PdfPage page, float left, float bottom, float right, float top) {
        return create(page, PdfName.FitR, left, bottom, right, top, Float.NaN);
    }

    public static PdfExplicitDestination createFitB(PdfPage page) {
        return create(page, PdfName.FitB, Float.NaN, Float.NaN, Float.NaN, Float.NaN, Float.NaN);
    }

    public static PdfExplicitDestination createFitBH(PdfPage page, float top) {
        return create(page, PdfName.FitBH, Float.NaN, Float.NaN, Float.NaN, top, Float.NaN);
    }

    public static PdfExplicitDestination createFitBV(PdfPage page, float left) {
        return create(page, PdfName.FitBV, left, Float.NaN, Float.NaN, Float.NaN, Float.NaN);
    }

    public static PdfExplicitDestination create(PdfPage page, PdfName type, float left, float bottom, float right, float top, float zoom) {
        return new PdfExplicitDestination().add(page).add(type).add(left).add(bottom).add(right).add(top).add(zoom);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }

    private PdfExplicitDestination add(float value) {
        if (!Float.isNaN(value)) {
            ((PdfArray) getPdfObject()).add(new PdfNumber(value));
        }
        return this;
    }

    private PdfExplicitDestination add(int value) {
        ((PdfArray) getPdfObject()).add(new PdfNumber(value));
        return this;
    }

    private PdfExplicitDestination add(PdfPage page) {
        ((PdfArray) getPdfObject()).add(page.getPdfObject().getIndirectReference());
        return this;
    }

    private PdfExplicitDestination add(PdfName type) {
        ((PdfArray) getPdfObject()).add(type);
        return this;
    }
}
