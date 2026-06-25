package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.kernel.utils.ICopyFilter;
/* loaded from: classes12.dex */
public class PdfBoolean extends PdfPrimitiveObject {
    private boolean value;
    public static final PdfBoolean TRUE = new PdfBoolean(true, true);
    public static final PdfBoolean FALSE = new PdfBoolean(false, true);
    private static final byte[] True = ByteUtils.getIsoBytes("true");
    private static final byte[] False = ByteUtils.getIsoBytes("false");

    public PdfBoolean(boolean value) {
        this(value, false);
    }

    private PdfBoolean(boolean value, boolean directOnly) {
        super(directOnly);
        this.value = value;
    }

    private PdfBoolean() {
    }

    public boolean getValue() {
        return this.value;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 2;
    }

    public String toString() {
        return this.value ? "true" : "false";
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject
    protected void generateContent() {
        this.content = this.value ? True : False;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject newInstance() {
        return new PdfBoolean();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject, com.itextpdf.kernel.pdf.PdfObject
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfBoolean bool = (PdfBoolean) from;
        this.value = bool.value;
    }

    public boolean equals(Object obj) {
        return this == obj || (obj != null && getClass() == obj.getClass() && this.value == ((PdfBoolean) obj).value);
    }

    public int hashCode() {
        return this.value ? 1 : 0;
    }

    public static PdfBoolean valueOf(boolean value) {
        return value ? TRUE : FALSE;
    }
}
