package com.itextpdf.kernel.pdf;
/* loaded from: classes12.dex */
public class PdfAnnotationBorder extends PdfObjectWrapper<PdfArray> {
    public PdfAnnotationBorder(float hRadius, float vRadius, float width) {
        this(hRadius, vRadius, width, null);
    }

    public PdfAnnotationBorder(float hRadius, float vRadius, float width, PdfDashPattern dash) {
        super(new PdfArray(new float[]{hRadius, vRadius, width}));
        if (dash != null) {
            PdfArray dashArray = new PdfArray();
            getPdfObject().add(dashArray);
            if (dash.getDash() >= 0.0f) {
                dashArray.add(new PdfNumber(dash.getDash()));
            }
            if (dash.getGap() >= 0.0f) {
                dashArray.add(new PdfNumber(dash.getGap()));
            }
            if (dash.getPhase() >= 0.0f) {
                getPdfObject().add(new PdfNumber(dash.getPhase()));
            }
        }
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
