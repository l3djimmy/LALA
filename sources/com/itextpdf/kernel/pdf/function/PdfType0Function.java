package com.itextpdf.kernel.pdf.function;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.function.utils.AbstractSampleExtractor;
import java.util.Arrays;
import java.util.function.IntBinaryOperator;
/* loaded from: classes12.dex */
public class PdfType0Function extends AbstractPdfFunction<PdfStream> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private int bitsPerSample;
    private double[] decode;
    private long decodeLimit;
    private double[][] derivatives;
    private int[] encode;
    private String errorMessage;
    private boolean isValidated;
    private int order;
    private int outputDimension;
    private AbstractSampleExtractor sampleExtractor;
    private byte[] samples;
    private int[] size;

    public PdfType0Function(PdfStream pdfObject) {
        super(pdfObject);
        this.sampleExtractor = null;
        this.isValidated = false;
        this.errorMessage = null;
        this.derivatives = null;
        PdfArray sizeObj = pdfObject.getAsArray(PdfName.Size);
        if (super.getDomain() == null || super.getRange() == null || sizeObj == null) {
            setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_NOT_NULL_PARAMETERS);
            return;
        }
        this.size = sizeObj.toIntArray();
        PdfNumber orderObj = pdfObject.getAsNumber(PdfName.Order);
        this.order = orderObj == null ? 1 : orderObj.intValue();
        PdfArray encodeObj = pdfObject.getAsArray(PdfName.Encode);
        initializeEncoding(encodeObj);
        PdfArray decodeObj = pdfObject.getAsArray(PdfName.Decode);
        if (decodeObj == null) {
            this.decode = super.getRange();
        } else {
            this.decode = decodeObj.toDoubleArray();
        }
        this.outputDimension = super.getRange().length >> 1;
        PdfNumber bitsPerSampleObj = pdfObject.getAsNumber(PdfName.BitsPerSample);
        this.bitsPerSample = bitsPerSampleObj != null ? bitsPerSampleObj.intValue() : 0;
        this.decodeLimit = (1 << this.bitsPerSample) - 1;
        this.samples = pdfObject.getBytes(true);
        try {
            this.sampleExtractor = AbstractSampleExtractor.createExtractor(this.bitsPerSample);
        } catch (IllegalArgumentException e) {
            setErrorMessage(e.getMessage());
        }
    }

    public PdfType0Function(double[] domain, int[] size, double[] range, int order, int bitsPerSample, byte[] samples) {
        this(domain, size, range, order, null, null, bitsPerSample, samples);
    }

    public PdfType0Function(float[] domain, int[] size, float[] range, int order, int bitsPerSample, byte[] samples) {
        this(convertFloatArrayToDoubleArray(domain), size, convertFloatArrayToDoubleArray(range), order, bitsPerSample, samples);
    }

    public PdfType0Function(double[] domain, int[] size, double[] range, int order, int[] encode, double[] decode, int bitsPerSample, byte[] samples) {
        super(new PdfStream(samples), 0, domain, range);
        this.sampleExtractor = null;
        this.isValidated = false;
        this.errorMessage = null;
        this.derivatives = null;
        if (size != null) {
            this.size = Arrays.copyOf(size, size.length);
        }
        if (super.getDomain() == null || super.getRange() == null || size == null) {
            setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_NOT_NULL_PARAMETERS);
            return;
        }
        this.size = Arrays.copyOf(size, size.length);
        ((PdfStream) super.getPdfObject()).put(PdfName.Size, new PdfArray(size));
        this.order = order;
        ((PdfStream) super.getPdfObject()).put(PdfName.Order, new PdfNumber(order));
        initializeEncoding(encode);
        ((PdfStream) super.getPdfObject()).put(PdfName.Encode, new PdfArray(this.encode));
        if (decode == null) {
            this.decode = Arrays.copyOf(range, range.length);
        } else {
            this.decode = Arrays.copyOf(decode, decode.length);
        }
        ((PdfStream) super.getPdfObject()).put(PdfName.Decode, new PdfArray(this.decode));
        this.bitsPerSample = bitsPerSample;
        ((PdfStream) super.getPdfObject()).put(PdfName.BitsPerSample, new PdfNumber(bitsPerSample));
        this.outputDimension = super.getRange().length >> 1;
        this.decodeLimit = (1 << bitsPerSample) - 1;
        this.samples = Arrays.copyOf(samples, samples.length);
        try {
            this.sampleExtractor = AbstractSampleExtractor.createExtractor(bitsPerSample);
        } catch (IllegalArgumentException e) {
            setErrorMessage(e.getMessage());
        }
        if (isInvalid()) {
            throw new IllegalArgumentException(this.errorMessage);
        }
    }

    public int getOrder() {
        return this.order;
    }

    public void setOrder(int order) {
        this.order = order;
        ((PdfStream) getPdfObject()).put(PdfName.Order, new PdfNumber(order));
        this.isValidated = false;
    }

    public int[] getSize() {
        return this.size;
    }

    public void setSize(int[] size) {
        this.size = size;
        ((PdfStream) getPdfObject()).put(PdfName.Size, new PdfArray(size));
        this.isValidated = false;
    }

    public int[] getEncode() {
        return this.encode;
    }

    public void setEncode(int[] encode) {
        initializeEncoding(encode);
        ((PdfStream) getPdfObject()).put(PdfName.Encode, new PdfArray(encode));
        this.isValidated = false;
    }

    public double[] getDecode() {
        return this.decode;
    }

    public void setDecode(double[] decode) {
        this.decode = decode;
        ((PdfStream) getPdfObject()).put(PdfName.Decode, new PdfArray(decode));
        this.isValidated = false;
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public boolean checkCompatibilityWithColorSpace(PdfColorSpace alternateSpace) {
        return getInputSize() == 1 && getOutputSize() == alternateSpace.getNumberOfComponents();
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public void setDomain(double[] domain) {
        super.setDomain(domain);
        this.isValidated = false;
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public void setRange(double[] range) {
        super.setRange(range);
        this.isValidated = false;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] calculate(double[] input) {
        double[] result;
        if (isInvalid()) {
            throw new IllegalArgumentException(this.errorMessage);
        }
        double[] normal = normalize(input, getDomain());
        int[] floor = getFloor(normal, this.encode);
        if (this.order == 3 && this.size.length == 1 && this.encode[1] - this.encode[0] > 1) {
            result = interpolateByCubicSpline(normal[0], floor[0]);
        } else {
            result = interpolate(normal, floor);
        }
        return clip(result, getRange());
    }

    static double encode(double normal, int encodeMin, int encodeMax) {
        return encodeMin + ((encodeMax - encodeMin) * normal);
    }

    static int[] getFloor(double[] normal, int[] encode) {
        int[] result = new int[normal.length];
        for (int i = 0; i < normal.length; i++) {
            int j = i << 1;
            int floor = (int) encode(normal[i], encode[j], encode[j + 1]);
            result[i] = Math.min(Math.max(0, encode[j + 1] - 1), floor);
        }
        return result;
    }

    static int getSamplePosition(int[] sample, int[] size) {
        int position = sample[size.length - 1];
        for (int i = size.length - 2; i >= 0; i--) {
            position = sample[i] + (size[i] * position);
        }
        return position;
    }

    static double[] getFloorWeights(double[] normal, int[] encode) {
        double[] result = new double[normal.length];
        for (int i = 0; i < normal.length; i++) {
            result[i] = getFloorWeight(normal[i], encode[i * 2], encode[(i * 2) + 1]);
        }
        return result;
    }

    static double getFloorWeight(double normal, int encodeMin, int encodeMax) {
        double value = encode(normal, encodeMin, encodeMax);
        return value - Math.min(encodeMax - 1, (int) value);
    }

    static double[] specialSweepMethod(double[] f) {
        if (f.length <= 0) {
            throw new AssertionError();
        }
        double[] x = new double[f.length + 2];
        x[1] = 4.0d;
        for (int i = 1; i < f.length; i++) {
            x[0] = 1.0d / x[i];
            x[i + 1] = 4.0d - x[0];
            f[i] = f[i] - (x[0] * f[i - 1]);
        }
        x[f.length] = f[f.length - 1] / x[f.length];
        for (int i2 = f.length - 1; i2 > 0; i2--) {
            x[i2] = (f[i2 - 1] - x[i2 + 1]) / x[i2];
        }
        int i3 = x.length;
        x[i3 - 1] = 0.0d;
        x[0] = 0.0d;
        return x;
    }

    private void initializeEncoding(PdfArray encodeObj) {
        if (encodeObj == null) {
            this.encode = getDefaultEncoding();
            return;
        }
        this.encode = encodeObj.toIntArray();
        for (int i = 0; i < this.size.length; i++) {
            int j = i << 1;
            this.encode[j] = Math.max(0, this.encode[j]);
            this.encode[j + 1] = Math.min(this.size[i] - 1, this.encode[j + 1]);
        }
    }

    private void initializeEncoding(int[] encode) {
        if (encode == null) {
            this.encode = getDefaultEncoding();
            return;
        }
        this.encode = new int[encode.length];
        for (int i = 0; i < this.size.length; i++) {
            int j = i << 1;
            this.encode[j] = Math.max(0, encode[j]);
            this.encode[j + 1] = Math.min(this.size[i] - 1, encode[j + 1]);
        }
    }

    private int[] getDefaultEncoding() {
        int[] iArr;
        int[] result = new int[this.size.length << 1];
        int i = 0;
        for (int sizeItem : this.size) {
            int i2 = i + 1;
            result[i] = 0;
            i = i2 + 1;
            result[i2] = sizeItem - 1;
        }
        return result;
    }

    private double[] interpolate(double[] normal, int[] floor) {
        int floorPosition = getSamplePosition(floor, this.size);
        double[] x = getFloorWeights(normal, this.encode);
        int[] steps = getInputDimensionSteps();
        double[] result = new double[this.outputDimension];
        switch (this.order) {
            case 1:
                for (int dim = 0; dim < this.outputDimension; dim++) {
                    result[dim] = interpolateOrder1(x, floorPosition, steps, steps.length, dim);
                }
                return result;
            case 2:
            default:
                throw new PdfException(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_ORDER);
            case 3:
                for (int dim2 = 0; dim2 < this.outputDimension; dim2++) {
                    int length = steps.length;
                    int[] steps2 = steps;
                    int floorPosition2 = floorPosition;
                    double interpolateOrder3 = interpolateOrder3(x, floor, floorPosition2, steps2, length, dim2);
                    floorPosition = floorPosition2;
                    steps = steps2;
                    result[dim2] = interpolateOrder3;
                }
                return result;
        }
    }

    private double interpolateOrder1(double[] x, int floorPosition, int[] steps, int inDim, int outDim) {
        if (inDim == 0) {
            return getValue(outDim, floorPosition);
        }
        int inDim2 = inDim - 1;
        int step = steps[inDim2];
        int encodeIndex = inDim2 << 1;
        double value0 = interpolateOrder1(x, floorPosition, steps, inDim2, outDim);
        if (this.encode[encodeIndex] == this.encode[encodeIndex + 1]) {
            return value0;
        }
        int ceilPosition = floorPosition + step;
        double value1 = interpolateOrder1(x, ceilPosition, steps, inDim2, outDim);
        return calculateLinearInterpolationFormula(x[inDim2], value0, value1);
    }

    private double interpolateOrder3(double[] x, int[] floor, int floorPosition, int[] steps, int inDim, int outDim) {
        double value0;
        double value3;
        if (inDim == 0) {
            return getValue(outDim, floorPosition);
        }
        int inDim2 = inDim - 1;
        int step = steps[inDim2];
        int encodeIndex = inDim2 << 1;
        double value1 = interpolateOrder3(x, floor, floorPosition, steps, inDim2, outDim);
        if (this.encode[encodeIndex] == this.encode[encodeIndex + 1]) {
            return value1;
        }
        int ceilPosition = floorPosition + step;
        double value2 = interpolateOrder3(x, floor, ceilPosition, steps, inDim2, outDim);
        if (this.encode[encodeIndex + 1] - this.encode[encodeIndex] != 1) {
            if (floor[inDim2] > this.encode[encodeIndex]) {
                value0 = interpolateOrder3(x, floor, floorPosition - step, steps, inDim2, outDim);
            } else {
                value0 = (value1 * 2.0d) - value2;
            }
            if (floor[inDim2] < (this.encode[encodeIndex + 1] - this.encode[encodeIndex]) - 1) {
                value3 = interpolateOrder3(x, floor, ceilPosition + step, steps, inDim2, outDim);
            } else {
                value3 = (value2 * 2.0d) - value1;
            }
            double value32 = x[inDim2];
            double value12 = value0;
            double value02 = value3;
            return calculateCubicInterpolationFormula(value32, value12, value1, value2, value02);
        }
        return calculateLinearInterpolationFormula(x[inDim2], value1, value2);
    }

    private double[] interpolateByCubicSpline(double normal, int position) {
        if (this.derivatives == null) {
            calculateSecondDerivatives();
        }
        double x = getFloorWeight(normal, this.encode[0], this.encode[1]);
        return calculateCubicSplineFormula(x, position);
    }

    private double[] calculateCubicSplineFormula(double x, int position) {
        double[] result = new double[this.outputDimension];
        for (int dim = 0; dim < this.outputDimension; dim++) {
            result[dim] = calculateCubicSplineFormula(x, getValue(dim, position), getValue(dim, position + 1), this.derivatives[dim][position - this.encode[0]], this.derivatives[dim][(position - this.encode[0]) + 1]);
        }
        return result;
    }

    private void calculateSecondDerivatives() {
        this.derivatives = new double[this.outputDimension];
        for (int dim = 0; dim < this.outputDimension; dim++) {
            double[] f = new double[(this.encode[1] - this.encode[0]) - 1];
            for (int pos = this.encode[0]; pos < this.encode[1] - 1; pos++) {
                f[pos - this.encode[0]] = ((getValue(dim, pos) - (getValue(dim, pos + 1) * 2.0d)) + getValue(dim, pos + 2)) * 6.0d;
            }
            this.derivatives[dim] = specialSweepMethod(f);
        }
    }

    private double getValue(int dim, int pos) {
        return decode(this.sampleExtractor.extract(this.samples, (this.outputDimension * pos) + dim), dim);
    }

    private int[] getInputDimensionSteps() {
        int[] steps = new int[this.size.length];
        steps[0] = 1;
        for (int i = 1; i < steps.length; i++) {
            steps[i] = steps[i - 1] * this.size[i - 1];
        }
        return steps;
    }

    private double decode(long x, int dim) {
        int index = dim << 1;
        return this.decode[index] + (((this.decode[index + 1] - this.decode[index]) * x) / this.decodeLimit);
    }

    private void setErrorMessage(String message) {
        this.errorMessage = message;
        this.isValidated = true;
    }

    private boolean isInvalid() {
        int[] iArr;
        if (this.isValidated) {
            return this.errorMessage != null;
        } else if (super.getDomain() == null || super.getRange() == null || this.size == null) {
            setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_NOT_NULL_PARAMETERS);
            return true;
        } else if (this.order != 1 && this.order != 3) {
            setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_ORDER);
            return true;
        } else if (getDomain().length == 0 || getDomain().length % 2 == 1) {
            setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_DOMAIN);
            return true;
        } else if (getRange().length == 0 || getRange().length % 2 == 1) {
            setErrorMessage("Invalid encode array for PDF function of type 0");
            return true;
        } else {
            int inputDimension = getDomain().length >> 1;
            if (this.size == null || this.size.length != inputDimension) {
                setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_SIZE);
                return true;
            }
            for (int s : this.size) {
                if (s <= 0) {
                    setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_SIZE);
                    return true;
                }
            }
            if (this.encode.length != getDomain().length) {
                setErrorMessage("Invalid encode array for PDF function of type 0");
                return true;
            }
            for (int i = 0; i < this.encode.length; i += 2) {
                if (this.encode[i + 1] < this.encode[i]) {
                    setErrorMessage("Invalid encode array for PDF function of type 0");
                    return true;
                }
            }
            if (this.decode.length != getRange().length) {
                setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_DECODE);
                return true;
            }
            int samplesMinLength = (Arrays.stream(this.size).reduce(this.outputDimension * this.bitsPerSample, new IntBinaryOperator() { // from class: com.itextpdf.kernel.pdf.function.PdfType0Function$$ExternalSyntheticLambda0
                @Override // java.util.function.IntBinaryOperator
                public final int applyAsInt(int i2, int i3) {
                    return PdfType0Function.lambda$isInvalid$0(i2, i3);
                }
            }) + 7) / 8;
            if (this.samples == null || this.samples.length < samplesMinLength) {
                setErrorMessage(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_INVALID_SAMPLES);
                return true;
            }
            this.isValidated = true;
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ int lambda$isInvalid$0(int x, int y) {
        return x * y;
    }

    private static double calculateLinearInterpolationFormula(double x, double f0, double f1) {
        return ((1.0d - x) * f0) + (x * f1);
    }

    private static double calculateCubicInterpolationFormula(double x, double f0, double f1, double f2, double f3) {
        return (0.5d * x * ((f2 - f0) + ((((((2.0d * f0) - (5.0d * f1)) + (4.0d * f2)) - f3) + (((((f1 - f2) * 3.0d) + f3) - f0) * x)) * x))) + f1;
    }

    private static double calculateCubicSplineFormula(double x, double f0, double f1, double d0, double d1) {
        double y = 1.0d - x;
        return ((f1 * x) + (f0 * y)) - (((x * y) * (((y + 1.0d) * d0) + ((1.0d + x) * d1))) / 6.0d);
    }
}
