package com.itextpdf.kernel.pdf.function;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfType3Function extends AbstractPdfFunction<PdfDictionary> {
    private static final IPdfFunctionFactory DEFAULT_FUNCTION_FACTORY = new IPdfFunctionFactory() { // from class: com.itextpdf.kernel.pdf.function.PdfType3Function$$ExternalSyntheticLambda0
        @Override // com.itextpdf.kernel.pdf.function.IPdfFunctionFactory
        public final IPdfFunction create(PdfObject pdfObject) {
            IPdfFunction create;
            create = PdfFunctionFactory.create(pdfObject);
            return create;
        }
    };
    private double[] bounds;
    private double[] encode;
    private final IPdfFunctionFactory functionFactory;
    private List<IPdfFunction> functions;

    public PdfType3Function(PdfDictionary dict) {
        this(dict, DEFAULT_FUNCTION_FACTORY);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v2, types: [com.itextpdf.kernel.pdf.PdfObject] */
    public PdfType3Function(double[] domain, double[] range, List<AbstractPdfFunction<? extends PdfDictionary>> functions, double[] bounds, double[] encode) {
        super(new PdfDictionary(), 3, domain, range);
        this.functionFactory = DEFAULT_FUNCTION_FACTORY;
        PdfArray funcs = new PdfArray();
        for (AbstractPdfFunction<? extends PdfDictionary> func : functions) {
            funcs.add(func.getPdfObject());
        }
        ((PdfDictionary) super.getPdfObject()).put(PdfName.Functions, funcs);
        ((PdfDictionary) super.getPdfObject()).put(PdfName.Bounds, new PdfArray(bounds));
        ((PdfDictionary) super.getPdfObject()).put(PdfName.Encode, new PdfArray(encode));
    }

    public PdfType3Function(float[] domain, float[] range, List<AbstractPdfFunction<? extends PdfDictionary>> functions, float[] bounds, float[] encode) {
        this(convertFloatArrayToDoubleArray(domain), convertFloatArrayToDoubleArray(range), functions, convertFloatArrayToDoubleArray(bounds), convertFloatArrayToDoubleArray(encode));
    }

    PdfType3Function(PdfDictionary dict, IPdfFunctionFactory functionFactory) {
        super(dict);
        this.functionFactory = functionFactory;
        PdfArray functionsArray = dict.getAsArray(PdfName.Functions);
        this.functions = Collections.unmodifiableList(checkAndGetFunctions(functionsArray));
        if (super.getDomain().length < 2) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_DOMAIN);
        }
        PdfArray boundsArray = dict.getAsArray(PdfName.Bounds);
        this.bounds = checkAndGetBounds(boundsArray);
        PdfArray encodeArray = dict.getAsArray(PdfName.Encode);
        this.encode = checkAndGetEncode(encodeArray);
    }

    public Collection<IPdfFunction> getFunctions() {
        return this.functions;
    }

    public void setFunctions(Iterable<AbstractPdfFunction<? extends PdfDictionary>> value) {
        PdfArray pdfFunctions = new PdfArray();
        for (AbstractPdfFunction<? extends PdfDictionary> f : value) {
            pdfFunctions.add(((PdfDictionary) f.getPdfObject()).getIndirectReference());
        }
        ((PdfDictionary) getPdfObject()).put(PdfName.Functions, pdfFunctions);
    }

    public double[] getBounds() {
        return this.bounds;
    }

    public void setBounds(double[] value) {
        this.bounds = Arrays.copyOf(value, value.length);
    }

    public double[] getEncode() {
        return ((PdfDictionary) getPdfObject()).getAsArray(PdfName.Encode).toDoubleArray();
    }

    public void setEncode(double[] value) {
        ((PdfDictionary) getPdfObject()).put(PdfName.Encode, new PdfArray(value));
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public boolean checkCompatibilityWithColorSpace(PdfColorSpace alternateSpace) {
        return false;
    }

    @Override // com.itextpdf.kernel.pdf.function.AbstractPdfFunction, com.itextpdf.kernel.pdf.function.IPdfFunction
    public int getOutputSize() {
        return getRange() == null ? this.functions.get(0).getOutputSize() : getRange().length / 2;
    }

    @Override // com.itextpdf.kernel.pdf.function.IPdfFunction
    public double[] calculate(double[] input) {
        if (input == null || input.length != 1) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_INPUT_FOR_TYPE_3_FUNCTION);
        }
        double[] clipped = clipInput(input);
        double x = clipped[0];
        int subdomain = calculateSubdomain(x);
        double[] subdomainBorders = getSubdomainBorders(subdomain);
        double[] output = this.functions.get(subdomain).calculate(new double[]{mapValueFromActualRangeToExpected(x, subdomainBorders[0], subdomainBorders[1], this.encode[subdomain * 2], this.encode[(subdomain * 2) + 1])});
        return clipOutput(output);
    }

    private int calculateSubdomain(double inputValue) {
        double inputValue2;
        if (this.bounds.length <= 0) {
            inputValue2 = inputValue;
        } else {
            inputValue2 = inputValue;
            if (areThreeDoubleEqual(this.bounds[0], getDomain()[0], inputValue2)) {
                return 0;
            }
            if (areThreeDoubleEqual(this.bounds[this.bounds.length - 1], getDomain()[1], inputValue2)) {
                return this.bounds.length;
            }
        }
        int i = 0;
        while (true) {
            int length = this.bounds.length;
            double[] dArr = this.bounds;
            if (i < length) {
                if (inputValue2 >= dArr[i]) {
                    i++;
                } else {
                    return i;
                }
            } else {
                int i2 = dArr.length;
                return i2;
            }
        }
    }

    private double[] getSubdomainBorders(int subdomain) {
        if (this.bounds.length == 0) {
            return getDomain();
        }
        if (subdomain == 0) {
            return new double[]{getDomain()[0], this.bounds[0]};
        }
        int length = this.bounds.length;
        double[] dArr = this.bounds;
        if (subdomain == length) {
            return new double[]{dArr[this.bounds.length - 1], getDomain()[1]};
        }
        return new double[]{dArr[subdomain - 1], this.bounds[subdomain]};
    }

    private List<IPdfFunction> checkAndGetFunctions(PdfArray functionsArray) {
        if (functionsArray == null || functionsArray.size() == 0) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_NULL_FUNCTIONS);
        }
        Integer tempOutputSize = null;
        if (getRange() != null) {
            tempOutputSize = Integer.valueOf(getOutputSize());
        }
        List<IPdfFunction> tempFunctions = new ArrayList<>();
        Iterator<PdfObject> it = functionsArray.iterator();
        while (it.hasNext()) {
            PdfObject funcObj = it.next();
            if (funcObj instanceof PdfDictionary) {
                PdfDictionary funcDict = (PdfDictionary) funcObj;
                IPdfFunction tempFunc = this.functionFactory.create(funcDict);
                if (tempOutputSize == null) {
                    tempOutputSize = Integer.valueOf(tempFunc.getOutputSize());
                }
                if (tempOutputSize.intValue() != tempFunc.getOutputSize()) {
                    throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_FUNCTIONS_OUTPUT);
                }
                if (tempFunc.getInputSize() != 1) {
                    throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_FUNCTIONS_INPUT);
                }
                tempFunctions.add(tempFunc);
            }
        }
        return tempFunctions;
    }

    private double[] checkAndGetBounds(PdfArray boundsArray) {
        if (boundsArray == null || boundsArray.size() != this.functions.size() - 1) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_NULL_BOUNDS);
        }
        double[] bounds = boundsArray.toDoubleArray();
        boolean areBoundsInvalid = false;
        int i = 0;
        while (i < bounds.length) {
            boolean z = false;
            boolean areBoundsInvalid2 = areBoundsInvalid | (i != 0 ? bounds[i] <= getDomain()[0] : bounds[i] < getDomain()[0]) | (i != bounds.length - 1 ? getDomain()[1] <= bounds[i] : getDomain()[1] < bounds[i]);
            if (i != 0 && bounds[i] <= bounds[i - 1]) {
                z = true;
            }
            areBoundsInvalid = areBoundsInvalid2 | z;
            i++;
        }
        if (areBoundsInvalid) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_BOUNDS);
        }
        return bounds;
    }

    private double[] checkAndGetEncode(PdfArray encodeArray) {
        if (encodeArray == null || encodeArray.size() < this.functions.size() * 2) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_TYPE_3_FUNCTION_NULL_ENCODE);
        }
        return encodeArray.toDoubleArray();
    }

    private static double mapValueFromActualRangeToExpected(double value, double aStart, double aEnd, double eStart, double eEnd) {
        double actualRangeLength = aEnd - aStart;
        if (actualRangeLength == AudioStats.AUDIO_AMPLITUDE_NONE) {
            return eStart;
        }
        double expectedRangeLength = eEnd - eStart;
        double x = value - aStart;
        double y = (expectedRangeLength / actualRangeLength) * x;
        return eStart + y;
    }

    private static boolean areThreeDoubleEqual(double first, double second, double third) {
        return Double.compare(first, second) == 0 && Double.compare(second, third) == 0;
    }
}
