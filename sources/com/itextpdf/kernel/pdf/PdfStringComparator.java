package com.itextpdf.kernel.pdf;

import java.util.Comparator;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class PdfStringComparator implements Comparator<PdfString> {
    @Override // java.util.Comparator
    public int compare(PdfString o1, PdfString o2) {
        return o1.getValue().compareTo(o2.getValue());
    }
}
