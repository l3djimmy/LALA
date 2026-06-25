package androidx.camera.core.impl.utils;

import java.io.ByteArrayInputStream;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteOrder;
/* loaded from: classes.dex */
final class ByteOrderedDataInputStream extends InputStream implements DataInput {
    private ByteOrder mByteOrder;
    private final DataInputStream mDataInputStream;
    final int mLength;
    int mPosition;
    private static final ByteOrder LITTLE_ENDIAN = ByteOrder.LITTLE_ENDIAN;
    private static final ByteOrder BIG_ENDIAN = ByteOrder.BIG_ENDIAN;

    ByteOrderedDataInputStream(InputStream in) throws IOException {
        this(in, ByteOrder.BIG_ENDIAN);
    }

    ByteOrderedDataInputStream(InputStream in, ByteOrder byteOrder) throws IOException {
        this.mByteOrder = ByteOrder.BIG_ENDIAN;
        this.mDataInputStream = new DataInputStream(in);
        this.mLength = this.mDataInputStream.available();
        this.mPosition = 0;
        this.mDataInputStream.mark(this.mLength);
        this.mByteOrder = byteOrder;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ByteOrderedDataInputStream(byte[] bytes) throws IOException {
        this(new ByteArrayInputStream(bytes));
    }

    public void setByteOrder(ByteOrder byteOrder) {
        this.mByteOrder = byteOrder;
    }

    public void seek(long byteCount) throws IOException {
        if (this.mPosition > byteCount) {
            this.mPosition = 0;
            this.mDataInputStream.reset();
            this.mDataInputStream.mark(this.mLength);
        } else {
            byteCount -= this.mPosition;
        }
        if (skipBytes((int) byteCount) != ((int) byteCount)) {
            throw new IOException("Couldn't seek up to the byteCount");
        }
    }

    public int peek() {
        return this.mPosition;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.mDataInputStream.available();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        this.mPosition++;
        return this.mDataInputStream.read();
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int bytesRead = this.mDataInputStream.read(b, off, len);
        this.mPosition += bytesRead;
        return bytesRead;
    }

    @Override // java.io.DataInput
    public int readUnsignedByte() throws IOException {
        this.mPosition++;
        return this.mDataInputStream.readUnsignedByte();
    }

    @Override // java.io.DataInput
    public String readLine() {
        throw new UnsupportedOperationException("readLine() not implemented.");
    }

    @Override // java.io.DataInput
    public boolean readBoolean() throws IOException {
        this.mPosition++;
        return this.mDataInputStream.readBoolean();
    }

    @Override // java.io.DataInput
    public char readChar() throws IOException {
        this.mPosition += 2;
        return this.mDataInputStream.readChar();
    }

    @Override // java.io.DataInput
    public String readUTF() throws IOException {
        this.mPosition += 2;
        return this.mDataInputStream.readUTF();
    }

    @Override // java.io.DataInput
    public void readFully(byte[] buffer, int offset, int length) throws IOException {
        this.mPosition += length;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        if (this.mDataInputStream.read(buffer, offset, length) != length) {
            throw new IOException("Couldn't read up to the length of buffer");
        }
    }

    @Override // java.io.DataInput
    public void readFully(byte[] buffer) throws IOException {
        this.mPosition += buffer.length;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        if (this.mDataInputStream.read(buffer, 0, buffer.length) != buffer.length) {
            throw new IOException("Couldn't read up to the length of buffer");
        }
    }

    @Override // java.io.DataInput
    public byte readByte() throws IOException {
        this.mPosition++;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        int ch = this.mDataInputStream.read();
        if (ch < 0) {
            throw new EOFException();
        }
        return (byte) ch;
    }

    @Override // java.io.DataInput
    public short readShort() throws IOException {
        this.mPosition += 2;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        int ch1 = this.mDataInputStream.read();
        int ch2 = this.mDataInputStream.read();
        if ((ch1 | ch2) < 0) {
            throw new EOFException();
        }
        if (this.mByteOrder == LITTLE_ENDIAN) {
            return (short) ((ch2 << 8) + ch1);
        }
        if (this.mByteOrder == BIG_ENDIAN) {
            return (short) ((ch1 << 8) + ch2);
        }
        throw new IOException("Invalid byte order: " + this.mByteOrder);
    }

    @Override // java.io.DataInput
    public int readInt() throws IOException {
        this.mPosition += 4;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        int ch1 = this.mDataInputStream.read();
        int ch2 = this.mDataInputStream.read();
        int ch3 = this.mDataInputStream.read();
        int ch4 = this.mDataInputStream.read();
        if ((ch1 | ch2 | ch3 | ch4) < 0) {
            throw new EOFException();
        }
        if (this.mByteOrder == LITTLE_ENDIAN) {
            return (ch4 << 24) + (ch3 << 16) + (ch2 << 8) + ch1;
        }
        if (this.mByteOrder == BIG_ENDIAN) {
            return (ch1 << 24) + (ch2 << 16) + (ch3 << 8) + ch4;
        }
        throw new IOException("Invalid byte order: " + this.mByteOrder);
    }

    @Override // java.io.DataInput
    public int skipBytes(int byteCount) throws IOException {
        int totalSkip = Math.min(byteCount, this.mLength - this.mPosition);
        int skipped = 0;
        while (skipped < totalSkip) {
            skipped += this.mDataInputStream.skipBytes(totalSkip - skipped);
        }
        this.mPosition += skipped;
        return skipped;
    }

    @Override // java.io.DataInput
    public int readUnsignedShort() throws IOException {
        this.mPosition += 2;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        int ch1 = this.mDataInputStream.read();
        int ch2 = this.mDataInputStream.read();
        if ((ch1 | ch2) < 0) {
            throw new EOFException();
        }
        if (this.mByteOrder == LITTLE_ENDIAN) {
            return (ch2 << 8) + ch1;
        }
        if (this.mByteOrder == BIG_ENDIAN) {
            return (ch1 << 8) + ch2;
        }
        throw new IOException("Invalid byte order: " + this.mByteOrder);
    }

    public long readUnsignedInt() throws IOException {
        return readInt() & 4294967295L;
    }

    @Override // java.io.DataInput
    public long readLong() throws IOException {
        this.mPosition += 8;
        if (this.mPosition > this.mLength) {
            throw new EOFException();
        }
        int ch1 = this.mDataInputStream.read();
        int ch2 = this.mDataInputStream.read();
        int ch3 = this.mDataInputStream.read();
        int ch4 = this.mDataInputStream.read();
        int ch5 = this.mDataInputStream.read();
        int ch6 = this.mDataInputStream.read();
        int ch7 = this.mDataInputStream.read();
        int ch8 = this.mDataInputStream.read();
        if ((ch1 | ch2 | ch3 | ch4 | ch5 | ch6 | ch7 | ch8) < 0) {
            throw new EOFException();
        }
        if (this.mByteOrder != LITTLE_ENDIAN) {
            if (this.mByteOrder == BIG_ENDIAN) {
                return (ch1 << 56) + (ch2 << 48) + (ch3 << 40) + (ch4 << 32) + (ch5 << 24) + (ch6 << 16) + (ch7 << 8) + ch8;
            }
            throw new IOException("Invalid byte order: " + this.mByteOrder);
        }
        return (ch8 << 56) + (ch7 << 48) + (ch6 << 40) + (ch5 << 32) + (ch4 << 24) + (ch3 << 16) + (ch2 << 8) + ch1;
    }

    @Override // java.io.DataInput
    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    @Override // java.io.DataInput
    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    @Override // java.io.InputStream
    public void mark(int readlimit) {
        synchronized (this.mDataInputStream) {
            this.mDataInputStream.mark(readlimit);
        }
    }

    public int getLength() {
        return this.mLength;
    }
}
