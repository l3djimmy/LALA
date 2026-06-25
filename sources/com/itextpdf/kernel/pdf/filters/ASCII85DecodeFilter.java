package com.itextpdf.kernel.pdf.filters;

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
public class ASCII85DecodeFilter extends MemoryLimitsAwareFilter {
    public static byte[] ASCII85Decode(byte[] in) {
        return ASCII85DecodeInternal(in, new ByteArrayOutputStream());
    }

    @Override // com.itextpdf.kernel.pdf.filters.IFilterHandler
    public byte[] decode(byte[] b, PdfName filterName, PdfObject decodeParams, PdfDictionary streamDictionary) {
        ByteArrayOutputStream outputStream = enableMemoryLimitsAwareHandler(streamDictionary);
        return ASCII85DecodeInternal(b, outputStream);
    }

    private static byte[] ASCII85DecodeInternal(byte[] in, ByteArrayOutputStream out) {
        int ch;
        int state = 0;
        int[] chn = new int[5];
        for (int k = 0; k < in.length && (ch = in[k] & UByte.MAX_VALUE) != 126; k++) {
            if (!PdfTokenizer.isWhitespace(ch)) {
                if (ch == 122 && state == 0) {
                    out.write(0);
                    out.write(0);
                    out.write(0);
                    out.write(0);
                } else if (ch < 33 || ch > 117) {
                    throw new PdfException(KernelExceptionMessageConstant.ILLEGAL_CHARACTER_IN_ASCII85DECODE);
                } else {
                    chn[state] = ch - 33;
                    state++;
                    if (state == 5) {
                        state = 0;
                        int r = 0;
                        for (int j = 0; j < 5; j++) {
                            r = (r * 85) + chn[j];
                        }
                        int j2 = r >> 24;
                        out.write((byte) j2);
                        out.write((byte) (r >> 16));
                        out.write((byte) (r >> 8));
                        out.write((byte) r);
                    }
                }
            }
        }
        if (state == 2) {
            out.write((byte) (((((((((chn[0] * 85) * 85) * 85) * 85) + (((chn[1] * 85) * 85) * 85)) + 614125) + 7225) + 85) >> 24));
        } else if (state == 3) {
            int r2 = (chn[0] * 85 * 85 * 85 * 85) + (chn[1] * 85 * 85 * 85) + (chn[2] * 85 * 85) + 7225 + 85;
            out.write((byte) (r2 >> 24));
            out.write((byte) (r2 >> 16));
        } else if (state == 4) {
            int r3 = (chn[0] * 85 * 85 * 85 * 85) + (chn[1] * 85 * 85 * 85) + (chn[2] * 85 * 85) + (chn[3] * 85) + 85;
            out.write((byte) (r3 >> 24));
            out.write((byte) (r3 >> 16));
            out.write((byte) (r3 >> 8));
        }
        return out.toByteArray();
    }
}
