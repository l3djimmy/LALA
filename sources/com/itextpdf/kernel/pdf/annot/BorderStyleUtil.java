package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
/* loaded from: classes12.dex */
class BorderStyleUtil {
    private BorderStyleUtil() {
    }

    public static final PdfDictionary setStyle(PdfDictionary bs, PdfName style) {
        if (bs == null) {
            bs = new PdfDictionary();
        }
        bs.put(PdfName.S, style);
        return bs;
    }

    public static final PdfDictionary setDashPattern(PdfDictionary bs, PdfArray dashPattern) {
        if (bs == null) {
            bs = new PdfDictionary();
        }
        bs.put(PdfName.D, dashPattern);
        return bs;
    }
}
