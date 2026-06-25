package com.itextpdf.kernel.pdf;

import java.util.Set;
/* loaded from: classes12.dex */
public interface IPdfNameTreeAccess {
    PdfObject getEntry(PdfString pdfString);

    PdfObject getEntry(String str);

    Set<PdfString> getKeys();
}
