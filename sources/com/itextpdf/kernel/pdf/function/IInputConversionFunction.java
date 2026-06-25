package com.itextpdf.kernel.pdf.function;

import java.io.IOException;
@FunctionalInterface
/* loaded from: classes12.dex */
public interface IInputConversionFunction {
    double[] convert(byte[] bArr) throws IOException;
}
