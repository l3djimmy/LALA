package com.itextpdf.kernel.pdf;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.utils.ICopyFilter;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
/* loaded from: classes12.dex */
public class PdfLiteral extends PdfPrimitiveObject {
    private long position;

    public PdfLiteral(byte[] content) {
        super(true);
        this.content = content;
    }

    public PdfLiteral(int size) {
        this(new byte[size]);
        Arrays.fill(this.content, (byte) 32);
    }

    public PdfLiteral(String content) {
        this(PdfEncodings.convertToBytes(content, (String) null));
    }

    private PdfLiteral() {
        this((byte[]) null);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 4;
    }

    public String toString() {
        if (this.content != null) {
            return new String(this.content, StandardCharsets.ISO_8859_1);
        }
        return "";
    }

    public long getPosition() {
        return this.position;
    }

    public void setPosition(long position) {
        this.position = position;
    }

    public int getBytesCount() {
        return this.content.length;
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject
    protected void generateContent() {
    }

    public boolean equals(Object o) {
        return this == o || (o != null && getClass() == o.getClass() && Arrays.equals(this.content, ((PdfLiteral) o).content));
    }

    public int hashCode() {
        if (this.content == null) {
            return 0;
        }
        return Arrays.hashCode(this.content);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject newInstance() {
        return new PdfLiteral();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject, com.itextpdf.kernel.pdf.PdfObject
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfLiteral literal = (PdfLiteral) from;
        this.content = literal.getInternalContent();
    }
}
