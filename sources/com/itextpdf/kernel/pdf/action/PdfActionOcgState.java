package com.itextpdf.kernel.pdf.action;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfActionOcgState {
    private List<PdfDictionary> ocgs;
    private PdfName state;

    public PdfActionOcgState(PdfName state, List<PdfDictionary> ocgs) {
        this.state = state;
        this.ocgs = ocgs;
    }

    public PdfName getState() {
        return this.state;
    }

    public List<PdfDictionary> getOcgs() {
        return this.ocgs;
    }

    public List<PdfObject> getObjectList() {
        List<PdfObject> states = new ArrayList<>();
        states.add(this.state);
        states.addAll(this.ocgs);
        return states;
    }
}
