package com.itextpdf.io.source;

import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import java.io.IOException;
import java.io.OutputStream;
/* loaded from: classes12.dex */
public class OutputStream<T extends java.io.OutputStream> extends java.io.OutputStream {
    protected boolean closeStream;
    protected long currentPos;
    private Boolean localHighPrecision;
    private final ByteBuffer numBuffer;
    protected java.io.OutputStream outputStream;

    public static boolean getHighPrecision() {
        return ByteUtils.HighPrecision;
    }

    public static void setHighPrecision(boolean value) {
        ByteUtils.HighPrecision = value;
    }

    public boolean getLocalHighPrecision() {
        return this.localHighPrecision.booleanValue();
    }

    public void setLocalHighPrecision(boolean value) {
        this.localHighPrecision = Boolean.valueOf(value);
    }

    public OutputStream(java.io.OutputStream outputStream) {
        this.numBuffer = new ByteBuffer(32);
        this.outputStream = null;
        this.currentPos = 0L;
        this.closeStream = true;
        this.outputStream = outputStream;
    }

    protected OutputStream() {
        this.numBuffer = new ByteBuffer(32);
        this.outputStream = null;
        this.currentPos = 0L;
        this.closeStream = true;
    }

    public OutputStream(java.io.OutputStream outputStream, boolean localHighPrecision) {
        this.numBuffer = new ByteBuffer(32);
        this.outputStream = null;
        this.currentPos = 0L;
        this.closeStream = true;
        this.outputStream = outputStream;
        this.localHighPrecision = Boolean.valueOf(localHighPrecision);
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.outputStream.write(b);
        this.currentPos++;
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        this.outputStream.write(b);
        this.currentPos += b.length;
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        this.outputStream.write(b, off, len);
        this.currentPos += len;
    }

    public void writeByte(byte value) {
        try {
            write(value);
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_BYTE, (Throwable) e);
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.outputStream.flush();
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closeStream) {
            this.outputStream.close();
        }
    }

    public T writeLong(long value) {
        try {
            ByteUtils.getIsoBytes(value, this.numBuffer.reset());
            write(this.numBuffer.getInternalBuffer(), this.numBuffer.capacity() - this.numBuffer.size(), this.numBuffer.size());
            return this;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_INT_NUMBER, (Throwable) e);
        }
    }

    public T writeInteger(int value) {
        try {
            ByteUtils.getIsoBytes(value, this.numBuffer.reset());
            write(this.numBuffer.getInternalBuffer(), this.numBuffer.capacity() - this.numBuffer.size(), this.numBuffer.size());
            return this;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_INT_NUMBER, (Throwable) e);
        }
    }

    public T writeFloat(float value) {
        return writeFloat(value, this.localHighPrecision == null ? ByteUtils.HighPrecision : this.localHighPrecision.booleanValue());
    }

    public T writeFloat(float value, boolean highPrecision) {
        return writeDouble(value, highPrecision);
    }

    public T writeFloats(float[] value) {
        for (int i = 0; i < value.length; i++) {
            writeFloat(value[i]);
            if (i < value.length - 1) {
                writeSpace();
            }
        }
        return this;
    }

    public T writeDouble(double value) {
        return writeDouble(value, this.localHighPrecision == null ? ByteUtils.HighPrecision : this.localHighPrecision.booleanValue());
    }

    public T writeDouble(double value, boolean highPrecision) {
        try {
            ByteUtils.getIsoBytes(value, this.numBuffer.reset(), highPrecision);
            write(this.numBuffer.getInternalBuffer(), this.numBuffer.capacity() - this.numBuffer.size(), this.numBuffer.size());
            return this;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_FLOAT_NUMBER, (Throwable) e);
        }
    }

    public T writeByte(int value) {
        try {
            write(value);
            return this;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_BYTE, (Throwable) e);
        }
    }

    public T writeSpace() {
        return writeByte(32);
    }

    public T writeNewLine() {
        return writeByte(10);
    }

    public T writeString(String value) {
        return writeBytes(ByteUtils.getIsoBytes(value));
    }

    public T writeBytes(byte[] b) {
        try {
            write(b);
            return this;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_BYTES, (Throwable) e);
        }
    }

    public T writeBytes(byte[] b, int off, int len) {
        try {
            write(b, off, len);
            return this;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CANNOT_WRITE_BYTES, (Throwable) e);
        }
    }

    public long getCurrentPos() {
        return this.currentPos;
    }

    public java.io.OutputStream getOutputStream() {
        return this.outputStream;
    }

    public boolean isCloseStream() {
        return this.closeStream;
    }

    public void setCloseStream(boolean closeStream) {
        this.closeStream = closeStream;
    }

    public void assignBytes(byte[] bytes, int count) {
        if (this.outputStream instanceof ByteArrayOutputStream) {
            ((ByteArrayOutputStream) this.outputStream).assignBytes(bytes, count);
            this.currentPos = count;
            return;
        }
        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BYTES_CAN_BE_ASSIGNED_TO_BYTE_ARRAY_OUTPUT_STREAM_ONLY);
    }

    public void reset() {
        if (this.outputStream instanceof ByteArrayOutputStream) {
            ((ByteArrayOutputStream) this.outputStream).reset();
            this.currentPos = 0L;
            return;
        }
        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BYTES_CAN_BE_RESET_IN_BYTE_ARRAY_OUTPUT_STREAM_ONLY);
    }
}
