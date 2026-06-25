package com.itextpdf.kernel.pdf.function;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.function.BaseInputOutPutConvertors;
import java.io.IOException;
import java.util.Arrays;
/* loaded from: classes12.dex */
public abstract class AbstractPdfFunction<T extends PdfDictionary> extends PdfObjectWrapper<T> implements IPdfFunction {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private double[] domain;
    private final int functionType;
    private double[] range;

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractPdfFunction(T pdfObject, int functionType, double[] domain, double[] range) {
        super(pdfObject);
        this.functionType = functionType;
        if (domain != null) {
            this.domain = Arrays.copyOf(domain, domain.length);
            pdfObject.put(PdfName.Domain, new PdfArray(domain));
        }
        if (range != null) {
            this.range = Arrays.copyOf(range, range.length);
            pdfObject.put(PdfName.Range, new PdfArray(range));
        }
        pdfObject.put(PdfName.FunctionType, new PdfNumber(functionType));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractPdfFunction(T pdfObject) {
        super(pdfObject);
        PdfNumber functionTypeObj = pdfObject.getAsNumber(PdfName.FunctionType);
        this.functionType = functionTypeObj == null ? -1 : functionTypeObj.intValue();
        PdfArray domainObj = pdfObject.getAsArray(PdfName.Domain);
        this.domain = domainObj == null ? null : domainObj.toDoubleArray();
        PdfArray rangeObj = pdfObject.getAsArray(PdfName.Range);
        this.range = rangeObj != null ? rangeObj.toDoubleArray() : null;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public int getFunctionType() {
        return this.functionType;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public boolean checkCompatibilityWithColorSpace(PdfColorSpace alternateSpace) {
        return getOutputSize() == alternateSpace.getNumberOfComponents();
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public int getInputSize() {
        return ((PdfDictionary) getPdfObject()).getAsArray(PdfName.Domain).size() / 2;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public int getOutputSize() {
        if (this.range == null) {
            return 0;
        }
        return this.range.length / 2;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] getDomain() {
        if (this.domain == null) {
            return null;
        }
        return Arrays.copyOf(this.domain, this.domain.length);
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public void setDomain(double[] value) {
        this.domain = Arrays.copyOf(value, value.length);
        ((PdfDictionary) getPdfObject()).put(PdfName.Domain, new PdfArray(this.domain));
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] getRange() {
        if (this.range != null) {
            return Arrays.copyOf(this.range, this.range.length);
        }
        return null;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public void setRange(double[] value) {
        if (value == null) {
            ((PdfDictionary) getPdfObject()).remove(PdfName.Range);
            return;
        }
        this.range = Arrays.copyOf(value, value.length);
        ((PdfDictionary) getPdfObject()).put(PdfName.Range, new PdfArray(this.range));
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public byte[] calculateFromByteArray(byte[] bytes, int offset, int length, int wordSizeInputLength, int wordSizeOutputLength) throws IOException {
        return calculateFromByteArray(bytes, offset, length, wordSizeInputLength, wordSizeOutputLength, null, null);
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public byte[] calculateFromByteArray(byte[] bytes, int offset, int length, int wordSizeInputLength, int wordSizeOutputLength, BaseInputOutPutConvertors.IInputConversionFunction inputConvertor, BaseInputOutPutConvertors.IOutputConversionFunction outputConvertor) throws IOException {
        int bytesPerInputWord = (int) Math.ceil(wordSizeInputLength / 8.0d);
        int bytesPerOutputWord = (int) Math.ceil(wordSizeOutputLength / 8.0d);
        int inputSize = getInputSize();
        int outputSize = getOutputSize();
        BaseInputOutPutConvertors.IInputConversionFunction actualInputConvertor = inputConvertor;
        if (actualInputConvertor == null) {
            actualInputConvertor = BaseInputOutPutConvertors.getInputConvertor(bytesPerInputWord, 1.0d);
        }
        BaseInputOutPutConvertors.IOutputConversionFunction actualOutputConvertor = outputConvertor;
        if (actualOutputConvertor == null) {
            actualOutputConvertor = BaseInputOutPutConvertors.getOutputConvertor(bytesPerOutputWord, 1.0d);
        }
        double[] inValues = actualInputConvertor.convert(bytes, offset, length);
        double[] outValues = new double[(inValues.length / inputSize) * outputSize];
        int outIndex = 0;
        int i = 0;
        while (i < inValues.length) {
            double[] singleRes = calculate(Arrays.copyOfRange(inValues, i, i + inputSize));
            System.arraycopy(singleRes, 0, outValues, outIndex, singleRes.length);
            outIndex += singleRes.length;
            i += inputSize;
            bytesPerInputWord = bytesPerInputWord;
        }
        return actualOutputConvertor.convert(outValues);
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] clipInput(double[] input) {
        if (input.length * 2 != this.domain.length) {
            throw new IllegalArgumentException(KernelExceptionMessageConstant.INPUT_NOT_MULTIPLE_OF_DOMAIN_SIZE);
        }
        return clip(input, this.domain);
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] clipOutput(double[] input) {
        if (this.range == null) {
            return input;
        }
        if (input.length * 2 != this.range.length) {
            throw new IllegalArgumentException(KernelExceptionMessageConstant.INPUT_NOT_MULTIPLE_OF_RANGE_SIZE);
        }
        return clip(input, this.range);
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public PdfObject getAsPdfObject() {
        return super.getPdfObject();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static double[] clip(double[] values, double[] limits) {
        if (values.length * 2 != limits.length) {
            throw new AssertionError();
        }
        double[] result = new double[values.length];
        int j = 0;
        for (int i = 0; i < values.length; i++) {
            int j2 = j + 1;
            double lowerBound = limits[j];
            j = j2 + 1;
            double upperBound = limits[j2];
            result[i] = Math.min(Math.max(lowerBound, values[i]), upperBound);
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static double[] normalize(double[] values, double[] limits) {
        if (values.length * 2 != limits.length) {
            throw new AssertionError();
        }
        double[] normal = new double[values.length];
        int j = 0;
        for (int i = 0; i < values.length; i++) {
            int j2 = j + 1;
            double lowerBound = limits[j];
            j = j2 + 1;
            double upperBound = Math.max(Double.MIN_VALUE + lowerBound, limits[j2]);
            normal[i] = Math.min(Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, (values[i] - lowerBound) / (upperBound - lowerBound)), 1.0d);
        }
        return normal;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static double[] convertFloatArrayToDoubleArray(float[] array) {
        if (array == null) {
            return null;
        }
        double[] arrayDouble = new double[array.length];
        for (int i = 0; i < array.length; i++) {
            arrayDouble[i] = array[i];
        }
        return arrayDouble;
    }
}
