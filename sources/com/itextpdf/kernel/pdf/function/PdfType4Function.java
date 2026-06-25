package com.itextpdf.kernel.pdf.function;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
/* loaded from: classes12.dex */
public class PdfType4Function extends AbstractPdfFunction<PdfStream> {
    public PdfType4Function(PdfStream dict) {
        super(dict);
    }

    public PdfType4Function(double[] domain, double[] range, byte[] code) {
        super(new PdfStream(code), 4, domain, range);
    }

    public PdfType4Function(float[] domain, float[] range, byte[] code) {
        this(convertFloatArrayToDoubleArray(domain), convertFloatArrayToDoubleArray(range), code);
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public boolean checkCompatibilityWithColorSpace(PdfColorSpace alternateSpace) {
        return getInputSize() == 1 && getOutputSize() == alternateSpace.getNumberOfComponents();
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] calculate(double[] input) {
        throw new UnsupportedOperationException(KernelExceptionMessageConstant.TYPE4_EXECUTION_NOT_SUPPORTED);
    }
}
