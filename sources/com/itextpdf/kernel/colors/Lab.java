package com.itextpdf.kernel.colors;

import com.itextpdf.kernel.pdf.colorspace.PdfCieBasedCs;
/* loaded from: classes12.dex */
public class Lab extends Color {
    public Lab(PdfCieBasedCs.Lab cs) {
        this(cs, new float[cs.getNumberOfComponents()]);
    }

    public Lab(PdfCieBasedCs.Lab cs, float[] value) {
        super(cs, value);
    }

    public Lab(float[] whitePoint, float[] value) {
        super(new PdfCieBasedCs.Lab(whitePoint), value);
    }

    public Lab(float[] whitePoint, float[] blackPoint, float[] range, float[] value) {
        this(new PdfCieBasedCs.Lab(whitePoint, blackPoint, range), value);
    }
}
