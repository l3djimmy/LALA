package com.itextpdf.kernel.font;

import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfStream;
/* loaded from: classes12.dex */
interface IDocFontProgram {
    PdfStream getFontFile();

    PdfName getFontFileName();

    PdfName getSubtype();
}
