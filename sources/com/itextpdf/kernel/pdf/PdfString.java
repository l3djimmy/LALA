package com.itextpdf.kernel.pdf;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.source.ByteBuffer;
import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.kernel.utils.ICopyFilter;
import java.nio.charset.StandardCharsets;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class PdfString extends PdfPrimitiveObject {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private int decryptInfoGen;
    private int decryptInfoNum;
    private PdfEncryption decryption;
    protected String encoding;
    protected boolean hexWriting;
    protected String value;

    public PdfString(String value, String encoding) {
        this.hexWriting = false;
        if (value == null) {
            throw new AssertionError();
        }
        this.value = value;
        this.encoding = encoding;
    }

    public PdfString(String value) {
        this(value, (String) null);
    }

    public PdfString(byte[] content) {
        this.hexWriting = false;
        if (content != null && content.length > 0) {
            StringBuilder str = new StringBuilder(content.length);
            for (byte b : content) {
                str.append((char) (b & UByte.MAX_VALUE));
            }
            this.value = str.toString();
            return;
        }
        this.value = "";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfString(byte[] content, boolean hexWriting) {
        super(content);
        this.hexWriting = false;
        this.hexWriting = hexWriting;
    }

    private PdfString() {
        this.hexWriting = false;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 10;
    }

    public boolean isHexWriting() {
        return this.hexWriting;
    }

    public PdfString setHexWriting(boolean hexWriting) {
        if (this.value == null) {
            generateValue();
        }
        this.content = null;
        this.hexWriting = hexWriting;
        return this;
    }

    public String getValue() {
        if (this.value == null) {
            generateValue();
        }
        return this.value;
    }

    public String getEncoding() {
        return this.encoding;
    }

    public String toUnicodeString() {
        if (this.encoding != null && this.encoding.length() != 0) {
            return getValue();
        }
        if (this.content == null) {
            generateContent();
        }
        byte[] b = decodeContent();
        if (b.length >= 2 && b[0] == -2 && b[1] == -1) {
            return PdfEncodings.convertToString(b, PdfEncodings.UNICODE_BIG);
        }
        if (b.length >= 3 && b[0] == -17 && b[1] == -69 && b[2] == -65) {
            return PdfEncodings.convertToString(b, PdfEncodings.UTF8);
        }
        return PdfEncodings.convertToString(b, PdfEncodings.PDF_DOC_ENCODING);
    }

    public byte[] getValueBytes() {
        if (this.value == null) {
            generateValue();
        }
        if (this.encoding != null && PdfEncodings.UNICODE_BIG.equals(this.encoding) && PdfEncodings.isPdfDocEncoding(this.value)) {
            return PdfEncodings.convertToBytes(this.value, PdfEncodings.PDF_DOC_ENCODING);
        }
        return PdfEncodings.convertToBytes(this.value, this.encoding);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        PdfString that = (PdfString) o;
        String v1 = getValue();
        String v2 = that.getValue();
        if (v1 != null && v1.equals(v2)) {
            String e1 = getEncoding();
            String e2 = that.getEncoding();
            if ((e1 == null && e2 == null) || (e1 != null && e1.equals(e2))) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        if (this.value == null) {
            return new String(decodeContent(), StandardCharsets.ISO_8859_1);
        }
        return getValue();
    }

    public int hashCode() {
        String v = getValue();
        String e = getEncoding();
        int result = v != null ? v.hashCode() : 0;
        return (result * 31) + (e != null ? e.hashCode() : 0);
    }

    public void markAsUnencryptedObject() {
        setState((short) 512);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setDecryption(int decryptInfoNum, int decryptInfoGen, PdfEncryption decryption) {
        this.decryptInfoNum = decryptInfoNum;
        this.decryptInfoGen = decryptInfoGen;
        this.decryption = decryption;
    }

    protected void generateValue() {
        if (this.content == null) {
            throw new AssertionError("No byte[] content to generate value");
        }
        this.value = PdfEncodings.convertToString(decodeContent(), null);
        if (this.decryption != null) {
            this.decryption = null;
            this.content = null;
        }
    }

    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject
    protected void generateContent() {
        this.content = encodeBytes(getValueBytes());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean encrypt(PdfEncryption encrypt) {
        if (!checkState((short) 512) && encrypt != this.decryption) {
            if (this.decryption != null) {
                generateValue();
            }
            if (encrypt != null && !encrypt.isEmbeddedFilesOnly()) {
                byte[] b = encrypt.encryptByteArray(getValueBytes());
                this.content = encodeBytes(b);
                return true;
            }
        }
        return false;
    }

    protected byte[] decodeContent() {
        byte[] decodedBytes = PdfTokenizer.decodeStringContent(this.content, this.hexWriting);
        if (this.decryption != null && !checkState((short) 512)) {
            this.decryption.setHashKeyForNextObject(this.decryptInfoNum, this.decryptInfoGen);
            return this.decryption.decryptByteArray(decodedBytes);
        }
        return decodedBytes;
    }

    protected byte[] encodeBytes(byte[] bytes) {
        if (this.hexWriting) {
            ByteBuffer buf = new ByteBuffer(bytes.length * 2);
            for (byte b : bytes) {
                buf.appendHex(b);
            }
            return buf.getInternalBuffer();
        }
        ByteBuffer buf2 = StreamUtil.createBufferedEscapedString(bytes);
        return buf2.toByteArray(1, buf2.size() - 2);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject newInstance() {
        return new PdfString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfPrimitiveObject, com.itextpdf.kernel.pdf.PdfObject
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfString string = (PdfString) from;
        this.value = string.value;
        this.hexWriting = string.hexWriting;
        this.decryption = string.decryption;
        this.decryptInfoNum = string.decryptInfoNum;
        this.decryptInfoGen = string.decryptInfoGen;
        this.encoding = string.encoding;
    }
}
