package com.itextpdf.kernel.pdf.function;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
/* loaded from: classes12.dex */
public class PdfType2Function extends AbstractPdfFunction<PdfDictionary> {
    private double[] c0;
    private double[] c1;
    private double n;

    public PdfType2Function(PdfDictionary dict) {
        super(dict);
        PdfNumber nObj = dict.getAsNumber(PdfName.N);
        if (nObj == null) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_2_FUNCTION_N);
        }
        this.n = nObj.doubleValue();
        if (super.getDomain().length < 2) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_2_FUNCTION_DOMAIN);
        }
        if (this.n != Math.floor(this.n) && super.getDomain()[0] < AudioStats.AUDIO_AMPLITUDE_NONE) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_2_FUNCTION_N_NOT_INTEGER);
        }
        if (this.n < AudioStats.AUDIO_AMPLITUDE_NONE && super.clipInput(new double[]{AudioStats.AUDIO_AMPLITUDE_NONE})[0] == AudioStats.AUDIO_AMPLITUDE_NONE) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_2_FUNCTION_N_NEGATIVE);
        }
        PdfArray c0Obj = dict.getAsArray(PdfName.C0);
        PdfArray c1Obj = dict.getAsArray(PdfName.C1);
        PdfArray rangeObj = dict.getAsArray(PdfName.Range);
        this.c0 = initializeCArray(c0Obj, c1Obj, rangeObj, AudioStats.AUDIO_AMPLITUDE_NONE);
        this.c1 = initializeCArray(c1Obj, c0Obj, rangeObj, 1.0d);
        if (this.c0.length != this.c1.length || (super.getRange() != null && this.c0.length != super.getRange().length / 2)) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_2_FUNCTION_OUTPUT_SIZE);
        }
    }

    public PdfType2Function(double[] domain, double[] range, double[] c0, double[] c1, double n) {
        super(new PdfDictionary(), 2, domain, range);
        setC0(c0);
        setC1(c1);
        setN(n);
    }

    public PdfType2Function(float[] domain, float[] range, float[] c0, float[] c1, double n) {
        this(convertFloatArrayToDoubleArray(domain), convertFloatArrayToDoubleArray(range), convertFloatArrayToDoubleArray(c0), convertFloatArrayToDoubleArray(c1), n);
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] calculate(double[] input) {
        if (input == null || input.length != 1) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_INPUT_FOR_TYPE_2_FUNCTION);
        }
        double[] clipped = clipInput(input);
        double x = clipped[0];
        int outputSize = getOutputSize();
        double[] output = new double[outputSize];
        for (int i = 0; i < outputSize; i++) {
            output[i] = this.c0[i] + (Math.pow(x, this.n) * (this.c1[i] - this.c0[i]));
        }
        return clipOutput(output);
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public final int getOutputSize() {
        return getRange() == null ? this.c0.length : getRange().length / 2;
    }

    public final double[] getC0() {
        return this.c0;
    }

    public final void setC0(double[] value) {
        ((PdfDictionary) getPdfObject()).put(PdfName.C0, new PdfArray(value));
        this.c0 = value;
    }

    public final double[] getC1() {
        return this.c1;
    }

    public final void setC1(double[] value) {
        ((PdfDictionary) getPdfObject()).put(PdfName.C1, new PdfArray(value));
        this.c1 = value;
    }

    public final double getN() {
        return this.n;
    }

    public final void setN(double value) {
        ((PdfDictionary) getPdfObject()).put(PdfName.N, new PdfNumber(value));
        this.n = value;
    }

    private static double[] initializeCArray(PdfArray c, PdfArray otherC, PdfArray range, double defaultValue) {
        double[] result;
        if (c != null) {
            return c.toDoubleArray();
        }
        if (otherC == null) {
            if (range == null) {
                result = new double[1];
            } else {
                result = new double[range.size() / 2];
            }
        } else {
            result = new double[otherC.size()];
        }
        for (int i = 0; i < result.length; i++) {
            result[i] = defaultValue;
        }
        return result;
    }
}
