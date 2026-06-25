package com.itextpdf.kernel.pdf.action;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfAnnotationAdditionalActions extends PdfObjectWrapper<PdfDictionary> {
    private static final PdfName[] Events = {PdfName.E, PdfName.X, PdfName.D, PdfName.U, PdfName.Fo, PdfName.Bl, PdfName.PO, PdfName.PC, PdfName.PV, PdfName.PI};

    public PdfAnnotationAdditionalActions(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public PdfAction getOnEnter() {
        return getPdfActionForEvent(PdfName.E);
    }

    public void setOnEnter(PdfAction action) {
        setPdfActionForEvent(PdfName.E, action);
    }

    public PdfAction getOnExit() {
        return getPdfActionForEvent(PdfName.X);
    }

    public void setOnExit(PdfAction action) {
        setPdfActionForEvent(PdfName.X, action);
    }

    public PdfAction getOnMouseDown() {
        return getPdfActionForEvent(PdfName.D);
    }

    public void setOnMouseDown(PdfAction action) {
        setPdfActionForEvent(PdfName.D, action);
    }

    public PdfAction getOnMouseUp() {
        return getPdfActionForEvent(PdfName.U);
    }

    public void setOnMouseUp(PdfAction action) {
        setPdfActionForEvent(PdfName.U, action);
    }

    public PdfAction getOnFocus() {
        return getPdfActionForEvent(PdfName.Fo);
    }

    public void setOnFocus(PdfAction action) {
        setPdfActionForEvent(PdfName.Fo, action);
    }

    public PdfAction getOnLostFocus() {
        return getPdfActionForEvent(PdfName.Bl);
    }

    public void setOnLostFocus(PdfAction action) {
        setPdfActionForEvent(PdfName.Bl, action);
    }

    public PdfAction getOnPageOpened() {
        return getPdfActionForEvent(PdfName.PO);
    }

    public void setOnPageOpened(PdfAction action) {
        setPdfActionForEvent(PdfName.PO, action);
    }

    public PdfAction getOnPageClosed() {
        return getPdfActionForEvent(PdfName.PC);
    }

    public void setOnPageClosed(PdfAction action) {
        setPdfActionForEvent(PdfName.PC, action);
    }

    public PdfAction getOnPageVisible() {
        return getPdfActionForEvent(PdfName.PV);
    }

    public void setOnPageVisible(PdfAction action) {
        setPdfActionForEvent(PdfName.PV, action);
    }

    public PdfAction getOnPageLostView() {
        return getPdfActionForEvent(PdfName.PI);
    }

    public void setOnPageLostView(PdfAction action) {
        setPdfActionForEvent(PdfName.PI, action);
    }

    public List<PdfAction> getAllKnownActions() {
        PdfName[] pdfNameArr;
        List<PdfAction> result = new ArrayList<>();
        for (PdfName event : Events) {
            PdfAction action = getPdfActionForEvent(event);
            if (action != null) {
                result.add(action);
            }
        }
        return result;
    }

    public PdfAction getPdfActionForEvent(PdfName eventName) {
        PdfObject action = getPdfObject().get(eventName);
        if (action == null || !action.isDictionary()) {
            return null;
        }
        return new PdfAction((PdfDictionary) action);
    }

    public void setPdfActionForEvent(PdfName event, PdfAction action) {
        if (action == null) {
            getPdfObject().remove(event);
        } else {
            getPdfObject().put(event, action.getPdfObject());
        }
        setModified();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }
}
