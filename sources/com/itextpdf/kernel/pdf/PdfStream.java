package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.utils.ICopyFilter;
import com.itextpdf.kernel.utils.NullCopyFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfStream extends PdfDictionary {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected int compressionLevel;
    private InputStream inputStream;
    private int length;
    private long offset;
    protected PdfOutputStream outputStream;

    public PdfStream(byte[] bytes, int compressionLevel) {
        this.length = -1;
        setState((short) 64);
        this.compressionLevel = compressionLevel;
        if (bytes != null && bytes.length > 0) {
            this.outputStream = new PdfOutputStream(new ByteArrayOutputStream(bytes.length));
            this.outputStream.writeBytes(bytes);
            return;
        }
        this.outputStream = new PdfOutputStream(new ByteArrayOutputStream());
    }

    public PdfStream(byte[] bytes) {
        this(bytes, Integer.MIN_VALUE);
    }

    public PdfStream(PdfDocument doc, InputStream inputStream, int compressionLevel) {
        this.length = -1;
        if (doc == null) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_CREATE_PDFSTREAM_BY_INPUT_STREAM_WITHOUT_PDF_DOCUMENT);
        }
        makeIndirect(doc);
        if (inputStream == null) {
            throw new IllegalArgumentException("The input stream in PdfStream constructor can not be null.");
        }
        this.inputStream = inputStream;
        this.compressionLevel = compressionLevel;
        put(PdfName.Length, new PdfNumber(-1).makeIndirect(doc));
    }

    public PdfStream(PdfDocument doc, InputStream inputStream) {
        this(doc, inputStream, Integer.MIN_VALUE);
    }

    public PdfStream(int compressionLevel) {
        this((byte[]) null, compressionLevel);
    }

    public PdfStream() {
        this((byte[]) null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfStream(OutputStream outputStream) {
        this.length = -1;
        this.outputStream = new PdfOutputStream(outputStream);
        this.compressionLevel = Integer.MIN_VALUE;
        setState((short) 64);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfStream(long offset, PdfDictionary keys) {
        this.length = -1;
        this.compressionLevel = Integer.MIN_VALUE;
        this.offset = offset;
        putAll(keys);
        PdfNumber length = getAsNumber(PdfName.Length);
        if (length == null) {
            this.length = 0;
        } else {
            this.length = length.intValue();
        }
    }

    public PdfOutputStream getOutputStream() {
        return this.outputStream;
    }

    public int getCompressionLevel() {
        return this.compressionLevel;
    }

    public void setCompressionLevel(int compressionLevel) {
        this.compressionLevel = compressionLevel;
    }

    @Override // com.itextpdf.kernel.pdf.PdfDictionary, com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 9;
    }

    public int getLength() {
        return this.length;
    }

    public byte[] getBytes() {
        return getBytes(true);
    }

    public byte[] getBytes(boolean decoded) {
        PdfReader reader;
        if (isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_OPERATE_WITH_FLUSHED_PDF_STREAM);
        }
        if (this.inputStream != null) {
            LoggerFactory.getLogger(PdfStream.class).warn("PdfStream was created by InputStream.getBytes() always returns null in this case");
            return null;
        } else if (this.outputStream != null && this.outputStream.getOutputStream() != null) {
            if (!(this.outputStream.getOutputStream() instanceof ByteArrayOutputStream)) {
                throw new AssertionError("Invalid OutputStream: ByteArrayByteArrayOutputStream expected");
            }
            try {
                this.outputStream.getOutputStream().flush();
                byte[] bytes = ((ByteArrayOutputStream) this.outputStream.getOutputStream()).toByteArray();
                return (decoded && containsKey(PdfName.Filter)) ? PdfReader.decodeBytes(bytes, this) : bytes;
            } catch (IOException ioe) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_GET_PDF_STREAM_BYTES, ioe, this);
            }
        } else if (getIndirectReference() == null || (reader = getIndirectReference().getReader()) == null) {
            return null;
        } else {
            try {
                return reader.readStreamBytes(this, decoded);
            } catch (IOException ioe2) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_GET_PDF_STREAM_BYTES, ioe2, this);
            }
        }
    }

    public void setData(byte[] bytes) {
        setData(bytes, false);
    }

    public void setData(byte[] bytes, boolean append) {
        if (isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_OPERATE_WITH_FLUSHED_PDF_STREAM);
        }
        if (this.inputStream != null) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_SET_DATA_TO_PDF_STREAM_WHICH_WAS_CREATED_BY_INPUT_STREAM);
        }
        boolean outputStreamIsUninitialized = this.outputStream == null;
        if (outputStreamIsUninitialized) {
            this.outputStream = new PdfOutputStream(new ByteArrayOutputStream());
        }
        if (append) {
            if ((outputStreamIsUninitialized && getIndirectReference() != null && getIndirectReference().getReader() != null) || (!outputStreamIsUninitialized && containsKey(PdfName.Filter))) {
                try {
                    byte[] oldBytes = getBytes();
                    this.outputStream.assignBytes(oldBytes, oldBytes.length);
                } catch (PdfException ex) {
                    throw new PdfException(KernelExceptionMessageConstant.CANNOT_READ_A_STREAM_IN_ORDER_TO_APPEND_NEW_BYTES, (Throwable) ex);
                }
            }
            if (bytes != null) {
                this.outputStream.writeBytes(bytes);
            }
        } else {
            PdfOutputStream pdfOutputStream = this.outputStream;
            if (bytes != null) {
                pdfOutputStream.assignBytes(bytes, bytes.length);
            } else {
                pdfOutputStream.reset();
            }
        }
        this.offset = 0L;
        remove(PdfName.Filter);
        remove(PdfName.DecodeParms);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfDictionary, com.itextpdf.kernel.pdf.PdfObject
    public PdfObject newInstance() {
        return new PdfStream();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long getOffset() {
        return this.offset;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateLength(int length) {
        this.length = length;
    }

    @Override // com.itextpdf.kernel.pdf.PdfDictionary, com.itextpdf.kernel.pdf.PdfObject
    protected void copyContent(PdfObject from, PdfDocument document) {
        copyContent(from, document, NullCopyFilter.getInstance());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfDictionary, com.itextpdf.kernel.pdf.PdfObject
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfStream stream = (PdfStream) from;
        if (this.inputStream != null) {
            throw new AssertionError("Try to copy the PdfStream that has been just created.");
        }
        byte[] bytes = stream.getBytes(false);
        try {
            this.outputStream.write(bytes);
        } catch (IOException ioe) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_COPY_OBJECT_CONTENT, ioe, stream);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void initOutputStream(OutputStream stream) {
        if (getOutputStream() == null && this.inputStream == null) {
            this.outputStream = new PdfOutputStream(stream != null ? stream : new ByteArrayOutputStream());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfDictionary
    public void releaseContent() {
        super.releaseContent();
        try {
            if (this.outputStream != null) {
                this.outputStream.close();
                this.outputStream = null;
            }
        } catch (IOException e) {
            throw new PdfException("I/O exception.", (Throwable) e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public InputStream getInputStream() {
        return this.inputStream;
    }
}
