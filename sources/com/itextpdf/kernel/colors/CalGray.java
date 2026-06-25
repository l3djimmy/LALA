package com.itextpdf.kernel.colors;

import com.itextpdf.kernel.pdf.colorspace.PdfCieBasedCs;
/* loaded from: classes12.dex */
public class CalGray extends Color {
    public CalGray(PdfCieBasedCs.CalGray cs) {
        this(cs, 0.0f);
    }

    public CalGray(PdfCieBasedCs.CalGray cs, float value) {
        super(cs, new float[]{value});
    }

    public CalGray(float[] whitePoint, float value) {
        super(new PdfCieBasedCs.CalGray(whitePoint), new float[]{value});
    }

    public CalGray(float[] whitePoint, float[] blackPoint, float gamma, float value) {
        this(new PdfCieBasedCs.CalGray(whitePoint, blackPoint, gamma), value);
    }
}
