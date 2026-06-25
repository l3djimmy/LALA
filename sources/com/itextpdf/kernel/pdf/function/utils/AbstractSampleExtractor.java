package com.itextpdf.kernel.pdf.function.utils;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import kotlin.UByte;
/* loaded from: classes12.dex */
public abstract class AbstractSampleExtractor {
    public abstract long extract(byte[] bArr, int i);

    public static AbstractSampleExtractor createExtractor(int bitsPerSample) {
        switch (bitsPerSample) {
            case 1:
            case 2:
            case 4:
                return new SampleBitsExtractor(bitsPerSample);
            case 8:
            case 16:
            case 24:
            case 32:
                return new SampleBytesExtractor(bitsPerSample);
            case 12:
                return new Sample12BitsExtractor();
            default:
                throw new IllegalArgumentException(KernelExceptionMessageConstant.PDF_TYPE0_FUNCTION_BITS_PER_SAMPLE_INVALID_VALUE);
        }
    }

    /* loaded from: classes12.dex */
    private static class SampleBitsExtractor extends AbstractSampleExtractor {
        private final int bitsPerSample;
        private final byte mask;

        public SampleBitsExtractor(int bitsPerSample) {
            this.bitsPerSample = bitsPerSample;
            this.mask = (byte) ((1 << bitsPerSample) - 1);
        }

        @Override // com.itextpdf.kernel.pdf.function.utils.AbstractSampleExtractor
        public long extract(byte[] samples, int position) {
            int bitPos = this.bitsPerSample * position;
            int bytePos = bitPos >> 3;
            int shift = (8 - (bitPos & 7)) - this.bitsPerSample;
            return (samples[bytePos] >> shift) & this.mask;
        }
    }

    /* loaded from: classes12.dex */
    private static final class SampleBytesExtractor extends AbstractSampleExtractor {
        private final int bytesPerSample;

        public SampleBytesExtractor(int bitsPerSample) {
            this.bytesPerSample = bitsPerSample >> 3;
        }

        @Override // com.itextpdf.kernel.pdf.function.utils.AbstractSampleExtractor
        public long extract(byte[] samples, int position) {
            int bytePos = this.bytesPerSample * position;
            int bytePos2 = bytePos + 1;
            long result = samples[bytePos] & 255;
            int i = 1;
            while (i < this.bytesPerSample) {
                result = (result << 8) | (samples[bytePos2] & 255);
                i++;
                bytePos2++;
            }
            return result;
        }
    }

    /* loaded from: classes12.dex */
    private static class Sample12BitsExtractor extends AbstractSampleExtractor {
        private Sample12BitsExtractor() {
        }

        @Override // com.itextpdf.kernel.pdf.function.utils.AbstractSampleExtractor
        public long extract(byte[] samples, int position) {
            int bitPos = position * 12;
            int bytePos = bitPos >> 3;
            if ((bitPos & 4) == 0) {
                return ((samples[bytePos] & UByte.MAX_VALUE) << 4) | ((samples[bytePos + 1] & 240) >> 4);
            }
            return ((samples[bytePos] & 15) << 8) | (samples[bytePos + 1] & UByte.MAX_VALUE);
        }
    }
}
