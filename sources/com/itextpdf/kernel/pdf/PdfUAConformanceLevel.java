package com.itextpdf.kernel.pdf;
/* loaded from: classes12.dex */
public class PdfUAConformanceLevel implements IConformanceLevel {
    public static final PdfUAConformanceLevel PDFUA_1 = new PdfUAConformanceLevel(1);
    private final int version;

    private PdfUAConformanceLevel(int version) {
        this.version = version;
    }

    public int getVersion() {
        return this.version;
    }
}
