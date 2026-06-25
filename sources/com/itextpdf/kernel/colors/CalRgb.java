package com.itextpdf.kernel.colors;

import com.itextpdf.kernel.pdf.colorspace.PdfCieBasedCs;
/* loaded from: classes12.dex */
public class CalRgb extends Color {
    public CalRgb(PdfCieBasedCs.CalRgb cs) {
        this(cs, new float[cs.getNumberOfComponents()]);
    }

    public CalRgb(PdfCieBasedCs.CalRgb cs, float[] value) {
        super(cs, value);
    }

    public CalRgb(float[] whitePoint, float[] value) {
        super(new PdfCieBasedCs.CalRgb(whitePoint), value);
    }

    public CalRgb(float[] whitePoint, float[] blackPoint, float[] gamma, float[] matrix, float[] value) {
        this(new PdfCieBasedCs.CalRgb(whitePoint, blackPoint, gamma, matrix), value);
    }
}
