package com.itextpdf.kernel.pdf.function;

import java.io.IOException;
@FunctionalInterface
/* loaded from: classes12.dex */
public interface IOutputConversionFunction {
    byte[] convert(double[] dArr) throws IOException;
}
