package com.itextpdf.kernel.pdf.function;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import kotlin.UByte;
/* loaded from: classes12.dex */
public final class BaseInputOutPutConvertors {

    @FunctionalInterface
    /* loaded from: classes12.dex */
    public interface IInputConversionFunction {
        double[] convert(byte[] bArr, int i, int i2);
    }

    @FunctionalInterface
    /* loaded from: classes12.dex */
    public interface IOutputConversionFunction {
        byte[] convert(double[] dArr);
    }

    private BaseInputOutPutConvertors() {
    }

    public static IInputConversionFunction getInputConvertor(int wordSize, double scaleFactor) {
        return getByteBasedInputConvertor(wordSize, ((1 << (wordSize * 8)) * scaleFactor) - 1.0d);
    }

    public static IOutputConversionFunction getOutputConvertor(int wordSize, double scaleFactor) {
        return getByteBasedOutputConvertor(wordSize, ((1 << (wordSize * 8)) * scaleFactor) - 1.0d);
    }

    private static IInputConversionFunction getByteBasedInputConvertor(final int wordSize, final double scale) {
        return new IInputConversionFunction() { // from class: com.itextpdf.kernel.pdf.function.BaseInputOutPutConvertors$$ExternalSyntheticLambda1
            @Override // com.itextpdf.kernel.pdf.function.BaseInputOutPutConvertors.IInputConversionFunction
            public final double[] convert(byte[] bArr, int i, int i2) {
                return BaseInputOutPutConvertors.lambda$getByteBasedInputConvertor$0(wordSize, scale, bArr, i, i2);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ double[] lambda$getByteBasedInputConvertor$0(int wordSize, double scale, byte[] input, int o, int l) {
        if (o + l > input.length) {
            throw new IllegalArgumentException(KernelExceptionMessageConstant.INVALID_LENGTH);
        }
        if (l % wordSize != 0) {
            throw new IllegalArgumentException(MessageFormatUtil.format(KernelExceptionMessageConstant.INVALID_LENGTH_FOR_WORDSIZE, Integer.valueOf(wordSize)));
        }
        double[] out = new double[l / wordSize];
        int inIndex = o;
        int outIndex = 0;
        while (inIndex < l + o) {
            int val = 0;
            for (int wordIndex = 0; wordIndex < wordSize; wordIndex++) {
                val = (val << 8) + (input[inIndex + wordIndex] & UByte.MAX_VALUE);
                inIndex++;
            }
            out[outIndex] = val / scale;
            outIndex++;
        }
        return out;
    }

    private static IOutputConversionFunction getByteBasedOutputConvertor(final int wordSize, final double scale) {
        return new IOutputConversionFunction() { // from class: com.itextpdf.kernel.pdf.function.BaseInputOutPutConvertors$$ExternalSyntheticLambda0
            @Override // com.itextpdf.kernel.pdf.function.BaseInputOutPutConvertors.IOutputConversionFunction
            public final byte[] convert(double[] dArr) {
                return BaseInputOutPutConvertors.lambda$getByteBasedOutputConvertor$1(wordSize, scale, dArr);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ byte[] lambda$getByteBasedOutputConvertor$1(int wordSize, double scale, double[] input) {
        byte[] out = new byte[input.length * wordSize];
        int outIndex = 0;
        for (int inIndex = 0; inIndex < input.length && outIndex < out.length; inIndex++) {
            int val = (int) (input[inIndex] * scale);
            int wordIndex = 0;
            while (wordIndex < wordSize) {
                out[outIndex] = (byte) (val >>> (wordIndex * 8));
                wordIndex++;
                outIndex++;
            }
        }
        return out;
    }
}
