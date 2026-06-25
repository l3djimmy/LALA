package com.itextpdf.kernel.pdf.filters;

import com.itextpdf.kernel.pdf.MemoryLimitsAwareFilter;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import java.io.ByteArrayOutputStream;
/* loaded from: classes12.dex */
public class LZWDecodeFilter extends MemoryLimitsAwareFilter {
    public static byte[] LZWDecode(byte[] in) {
        return LZWDecodeInternal(in, new ByteArrayOutputStream());
    }

    @Override // com.itextpdf.kernel.pdf.filters.IFilterHandler
    public byte[] decode(byte[] b, PdfName filterName, PdfObject decodeParams, PdfDictionary streamDictionary) {
        ByteArrayOutputStream outputStream = enableMemoryLimitsAwareHandler(streamDictionary);
        return FlateDecodeFilter.decodePredictor(LZWDecodeInternal(b, outputStream), decodeParams);
    }

    private static byte[] LZWDecodeInternal(byte[] in, ByteArrayOutputStream out) {
        LZWDecoder lzw = new LZWDecoder();
        lzw.decode(in, out);
        return out.toByteArray();
    }
}
