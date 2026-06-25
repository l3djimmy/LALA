package com.itextpdf.layout.properties;

import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
/* loaded from: classes12.dex */
public enum BlendMode {
    NORMAL(PdfExtGState.BM_NORMAL),
    MULTIPLY(PdfExtGState.BM_MULTIPLY),
    SCREEN(PdfExtGState.BM_SCREEN),
    OVERLAY(PdfExtGState.BM_OVERLAY),
    DARKEN(PdfExtGState.BM_DARKEN),
    LIGHTEN(PdfExtGState.BM_LIGHTEN),
    COLOR_DODGE(PdfExtGState.BM_COLOR_DODGE),
    COLOR_BURN(PdfExtGState.BM_COLOR_BURN),
    HARD_LIGHT(PdfExtGState.BM_HARD_LIGHT),
    SOFT_LIGHT(PdfExtGState.BM_SOFT_LIGHT),
    DIFFERENCE(PdfExtGState.BM_DIFFERENCE),
    EXCLUSION(PdfExtGState.BM_EXCLUSION),
    HUE(PdfExtGState.BM_HUE),
    SATURATION(PdfExtGState.BM_SATURATION),
    COLOR(PdfExtGState.BM_COLOR),
    LUMINOSITY(PdfExtGState.BM_LUMINOSITY);
    
    private final PdfName pdfRepresentation;

    BlendMode(PdfName pdfRepresentation) {
        this.pdfRepresentation = pdfRepresentation;
    }

    public PdfName getPdfRepresentation() {
        return this.pdfRepresentation;
    }
}
