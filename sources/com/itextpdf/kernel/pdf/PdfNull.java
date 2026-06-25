package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.kernel.utils.ICopyFilter;
/* loaded from: classes12.dex */
public class PdfNull extends PdfPrimitiveObject {
    public static final PdfNull PDF_NULL = new PdfNull(true);
    private static final byte[] NullContent = ByteUtils.getIsoBytes("null");

    public PdfNull() {
    }

    private PdfNull(boolean directOnly) {
        super(directOnly);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 7;
    }

    public String toString() {
        return "null";
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject
    protected void generateContent() {
        this.content = NullContent;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    protected PdfObject newInstance() {
        return new PdfNull();
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject, com.itextpdf.kernel.pdf.PdfObject
    protected void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
    }

    public boolean equals(Object obj) {
        return this == obj || (obj != null && getClass() == obj.getClass());
    }

    public int hashCode() {
        return 0;
    }
}
