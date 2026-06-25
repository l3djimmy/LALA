package com.itextpdf.kernel.colors;

import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs;
import com.itextpdf.kernel.pdf.function.IPdfFunction;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes12.dex */
public class DeviceN extends Color {
    public DeviceN(PdfSpecialCs.DeviceN cs) {
        this(cs, getDefaultColorants(cs.getNumberOfComponents()));
    }

    public DeviceN(PdfSpecialCs.DeviceN cs, float[] value) {
        super(cs, value);
    }

    public DeviceN(List<String> names, PdfColorSpace alternateCs, IPdfFunction tintTransform, float[] value) {
        this(new PdfSpecialCs.DeviceN(names, alternateCs, tintTransform), value);
    }

    private static float[] getDefaultColorants(int numOfColorants) {
        float[] colorants = new float[numOfColorants];
        Arrays.fill(colorants, 1.0f);
        return colorants;
    }
}
