package com.itextpdf.kernel.pdf.filters;

import com.itextpdf.io.source.ByteBuffer;
import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.MemoryLimitsAwareFilter;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import java.io.ByteArrayOutputStream;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class ASCIIHexDecodeFilter extends MemoryLimitsAwareFilter {
    public static byte[] ASCIIHexDecode(byte[] in) {
        return ASCIIHexDecodeInternal(in, new ByteArrayOutputStream());
    }

    @Override // com.itextpdf.kernel.pdf.filters.IFilterHandler
    public byte[] decode(byte[] b, PdfName filterName, PdfObject decodeParams, PdfDictionary streamDictionary) {
        ByteArrayOutputStream outputStream = enableMemoryLimitsAwareHandler(streamDictionary);
        return ASCIIHexDecodeInternal(b, outputStream);
    }

    private static byte[] ASCIIHexDecodeInternal(byte[] in, ByteArrayOutputStream out) {
        int ch;
        boolean first = true;
        int n1 = 0;
        for (int k = 0; k < in.length && (ch = in[k] & UByte.MAX_VALUE) != 62; k++) {
            if (!PdfTokenizer.isWhitespace(ch)) {
                int n = ByteBuffer.getHex(ch);
                if (n == -1) {
                    throw new PdfException(KernelExceptionMessageConstant.ILLEGAL_CHARACTER_IN_ASCIIHEXDECODE);
                }
                if (first) {
                    n1 = n;
                } else {
                    out.write((byte) ((n1 << 4) + n));
                }
                first = !first;
            }
        }
        if (!first) {
            out.write((byte) (n1 << 4));
        }
        return out.toByteArray();
    }
}
