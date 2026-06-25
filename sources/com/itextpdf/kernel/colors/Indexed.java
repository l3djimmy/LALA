package com.itextpdf.kernel.colors;

import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
/* loaded from: classes12.dex */
public class Indexed extends Color {
    public Indexed(PdfColorSpace colorSpace) {
        this(colorSpace, 0);
    }

    public Indexed(PdfColorSpace colorSpace, int colorValue) {
        super(colorSpace, new float[]{colorValue});
    }
}
