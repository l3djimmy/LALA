package com.itextpdf.kernel.pdf.filters;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import java.io.ByteArrayOutputStream;
/* loaded from: classes12.dex */
public class FlateDecodeStrictFilter extends FlateDecodeFilter {
    @Override // com.itextpdf.kernel.pdf.filters.FlateDecodeFilter, com.itextpdf.kernel.pdf.filters.IFilterHandler
    public byte[] decode(byte[] b, PdfName filterName, PdfObject decodeParams, PdfDictionary streamDictionary) {
        ByteArrayOutputStream outputStream = enableMemoryLimitsAwareHandler(streamDictionary);
        byte[] res = flateDecode(b, outputStream);
        byte[] b2 = decodePredictor(res, decodeParams);
        return b2;
    }

    private static byte[] flateDecode(byte[] in, ByteArrayOutputStream out) {
        return flateDecodeInternal(in, true, out);
    }
}
