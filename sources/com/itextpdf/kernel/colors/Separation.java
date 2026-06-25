package com.itextpdf.kernel.colors;

import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs;
import com.itextpdf.kernel.pdf.function.IPdfFunction;
/* loaded from: classes12.dex */
public class Separation extends Color {
    public Separation(PdfSpecialCs.Separation cs) {
        this(cs, 1.0f);
    }

    public Separation(PdfSpecialCs.Separation cs, float value) {
        super(cs, new float[]{value});
    }

    public Separation(String name, PdfColorSpace alternateCs, IPdfFunction tintTransform, float value) {
        this(new PdfSpecialCs.Separation(name, alternateCs, tintTransform), value);
    }
}
