package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.kernel.utils.ICopyFilter;
import java.nio.charset.StandardCharsets;
/* loaded from: classes12.dex */
public class PdfNumber extends PdfPrimitiveObject {
    private boolean isDouble;
    private double value;

    public PdfNumber(double value) {
        setValue(value);
    }

    public PdfNumber(int value) {
        setValue(value);
    }

    public PdfNumber(byte[] content) {
        super(content);
        this.isDouble = true;
        this.value = Double.NaN;
    }

    private PdfNumber() {
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 8;
    }

    public double getValue() {
        if (Double.isNaN(this.value)) {
            generateValue();
        }
        return this.value;
    }

    public double doubleValue() {
        return getValue();
    }

    public float floatValue() {
        return (float) getValue();
    }

    public long longValue() {
        return (long) getValue();
    }

    public int intValue() {
        if (getValue() > 2.147483647E9d) {
            return Integer.MAX_VALUE;
        }
        return (int) getValue();
    }

    public void setValue(int value) {
        this.value = value;
        this.isDouble = false;
        this.content = null;
    }

    public void setValue(double value) {
        this.value = value;
        this.isDouble = true;
        this.content = null;
    }

    public void increment() {
        double d = this.value + 1.0d;
        this.value = d;
        setValue(d);
    }

    public void decrement() {
        double d = this.value - 1.0d;
        this.value = d;
        setValue(d);
    }

    public String toString() {
        if (this.content != null) {
            return new String(this.content, StandardCharsets.ISO_8859_1);
        }
        if (this.isDouble) {
            return new String(ByteUtils.getIsoBytes(getValue()), StandardCharsets.ISO_8859_1);
        }
        return new String(ByteUtils.getIsoBytes(intValue()), StandardCharsets.ISO_8859_1);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o != null && getClass() == o.getClass() && Double.compare(((PdfNumber) o).getValue(), getValue()) == 0) {
            return true;
        }
        return false;
    }

    public boolean hasDecimalPoint() {
        return toString().contains(".");
    }

    public int hashCode() {
        long hash = Double.doubleToLongBits(getValue());
        return (int) ((hash >>> 32) ^ hash);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    protected PdfObject newInstance() {
        return new PdfNumber();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isDoubleNumber() {
        return this.isDouble;
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject
    protected void generateContent() {
        boolean z = this.isDouble;
        double d = this.value;
        if (z) {
            this.content = ByteUtils.getIsoBytes(d);
        } else {
            this.content = ByteUtils.getIsoBytes((int) d);
        }
    }

    protected void generateValue() {
        try {
            this.value = Double.parseDouble(new String(this.content, StandardCharsets.ISO_8859_1));
        } catch (NumberFormatException e) {
            this.value = Double.NaN;
        }
        this.isDouble = true;
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject, com.itextpdf.kernel.pdf.PdfObject
    protected void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfNumber number = (PdfNumber) from;
        this.value = number.value;
        this.isDouble = number.isDouble;
    }
}
