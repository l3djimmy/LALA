package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
/* loaded from: classes12.dex */
public final class NullCopyFilter implements ICopyFilter {
    private static final NullCopyFilter INSTANCE = new NullCopyFilter();

    private NullCopyFilter() {
    }

    public static NullCopyFilter getInstance() {
        return INSTANCE;
    }

    @Override // com.itextpdf.kernel.utils.ICopyFilter
    public boolean shouldProcess(PdfObject newParent, PdfName name, PdfObject value) {
        return true;
    }
}
