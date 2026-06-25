package com.itextpdf.kernel.pdf.function;

import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.function.BaseInputOutPutConvertors;
import java.io.IOException;
/* loaded from: classes12.dex */
public interface IPdfFunction {
    double[] calculate(double[] dArr);

    byte[] calculateFromByteArray(byte[] bArr, int i, int i2, int i3, int i4) throws IOException;

    byte[] calculateFromByteArray(byte[] bArr, int i, int i2, int i3, int i4, BaseInputOutPutConvertors.IInputConversionFunction iInputConversionFunction, BaseInputOutPutConvertors.IOutputConversionFunction iOutputConversionFunction) throws IOException;

    boolean checkCompatibilityWithColorSpace(PdfColorSpace pdfColorSpace);

    double[] clipInput(double[] dArr);

    double[] clipOutput(double[] dArr);

    PdfObject getAsPdfObject();

    double[] getDomain();

    int getFunctionType();

    int getInputSize();

    int getOutputSize();

    double[] getRange();

    void setDomain(double[] dArr);

    void setRange(double[] dArr);
}
