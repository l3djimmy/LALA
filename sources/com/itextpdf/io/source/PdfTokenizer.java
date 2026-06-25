package com.itextpdf.io.source;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.layout.properties.Property;
import java.io.Closeable;
import java.io.IOException;
import java.util.Arrays;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfTokenizer implements Closeable {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final RandomAccessFileOrArray file;
    protected int generation;
    protected boolean hexString;
    protected int reference;
    protected TokenType type;
    public static final boolean[] delims = {true, true, false, false, false, false, false, false, false, false, true, true, false, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, true, false, false, true, true, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
    public static final byte[] Obj = ByteUtils.getIsoBytes("obj");
    public static final byte[] R = ByteUtils.getIsoBytes("R");
    public static final byte[] Xref = ByteUtils.getIsoBytes("xref");
    public static final byte[] Startxref = ByteUtils.getIsoBytes("startxref");
    public static final byte[] Stream = ByteUtils.getIsoBytes("stream");
    public static final byte[] Trailer = ByteUtils.getIsoBytes("trailer");
    public static final byte[] N = ByteUtils.getIsoBytes("n");
    public static final byte[] F = ByteUtils.getIsoBytes("f");
    public static final byte[] Null = ByteUtils.getIsoBytes("null");
    public static final byte[] True = ByteUtils.getIsoBytes("true");
    public static final byte[] False = ByteUtils.getIsoBytes("false");
    private boolean closeStream = true;
    protected ByteBuffer outBuf = new ByteBuffer();

    /* loaded from: classes12.dex */
    public enum TokenType {
        Number,
        String,
        Name,
        Comment,
        StartArray,
        EndArray,
        StartDic,
        EndDic,
        Ref,
        Obj,
        EndObj,
        Other,
        EndOfFile
    }

    public PdfTokenizer(RandomAccessFileOrArray file) {
        this.file = file;
    }

    public void seek(long pos) {
        this.file.seek(pos);
    }

    public void readFully(byte[] bytes) throws IOException {
        this.file.readFully(bytes);
    }

    public long getPosition() {
        return this.file.getPosition();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closeStream) {
            this.file.close();
        }
    }

    public long length() {
        return this.file.length();
    }

    public int read() throws IOException {
        return this.file.read();
    }

    public String readString(int ch) throws IOException {
        int ch2;
        StringBuilder buf = new StringBuilder();
        while (true) {
            int size = ch - 1;
            if (ch <= 0 || (ch2 = read()) == -1) {
                break;
            }
            buf.append((char) ch2);
            ch = size;
        }
        return buf.toString();
    }

    public TokenType getTokenType() {
        return this.type;
    }

    public byte[] getByteContent() {
        return this.outBuf.toByteArray();
    }

    public String getStringValue() {
        return new String(this.outBuf.getInternalBuffer(), 0, this.outBuf.size());
    }

    public byte[] getDecodedStringContent() {
        return decodeStringContent(this.outBuf.getInternalBuffer(), 0, this.outBuf.size() - 1, isHexString());
    }

    public boolean tokenValueEqualsTo(byte[] cmp) {
        int size;
        if (cmp == null || this.outBuf.size() != (size = cmp.length)) {
            return false;
        }
        for (int i = 0; i < size; i++) {
            if (cmp[i] != this.outBuf.getInternalBuffer()[i]) {
                return false;
            }
        }
        return true;
    }

    public int getObjNr() {
        return this.reference;
    }

    public int getGenNr() {
        return this.generation;
    }

    public void backOnePosition(int ch) {
        if (ch != -1) {
            this.file.pushBack((byte) ch);
        }
    }

    public int getHeaderOffset() throws IOException {
        String str = readString(1024);
        int idx = str.indexOf("%PDF-");
        if (idx < 0 && (idx = str.indexOf("%FDF-")) < 0) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.PDF_HEADER_NOT_FOUND, this);
        }
        return idx;
    }

    public String checkPdfHeader() throws IOException {
        this.file.seek(0L);
        String str = readString(1024);
        int idx = str.indexOf("%PDF-");
        if (idx != 0) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.PDF_HEADER_NOT_FOUND, this);
        }
        return str.substring(idx + 1, idx + 8);
    }

    public void checkFdfHeader() throws IOException {
        this.file.seek(0L);
        String str = readString(1024);
        int idx = str.indexOf("%FDF-");
        if (idx != 0) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.FDF_STARTXREF_NOT_FOUND, this);
        }
    }

    public long getStartxref() throws IOException {
        long fileLength = this.file.length();
        long pos = fileLength - 1024;
        if (pos < 1) {
            pos = 1;
        }
        while (pos > 0) {
            this.file.seek(pos);
            String str = readString(1024);
            int idx = str.lastIndexOf("startxref");
            if (idx >= 0) {
                return idx + pos;
            }
            pos = (pos - 1024) + 9;
        }
        throw new com.itextpdf.io.exceptions.IOException("PDF startxref not found.", this);
    }

    public long getNextEof() throws IOException {
        String str;
        do {
            long currentPosition = this.file.getPosition();
            str = readString(128);
            long eofPosition = str.indexOf("%%EOF");
            if (eofPosition >= 0) {
                return currentPosition + eofPosition + 6;
            }
        } while (!str.isEmpty());
        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.PDF_EOF_NOT_FOUND, this);
    }

    public void nextValidToken() throws IOException {
        int level = 0;
        byte[] n1 = null;
        byte[] n2 = null;
        long ptr = 0;
        while (nextToken()) {
            if (this.type != TokenType.Comment) {
                switch (level) {
                    case 0:
                        if (this.type != TokenType.Number) {
                            return;
                        }
                        ptr = this.file.getPosition();
                        n1 = getByteContent();
                        level++;
                        continue;
                    case 1:
                        if (this.type != TokenType.Number) {
                            this.file.seek(ptr);
                            this.type = TokenType.Number;
                            this.outBuf.reset().append(n1);
                            return;
                        }
                        n2 = getByteContent();
                        level++;
                        continue;
                    case 2:
                        if (this.type == TokenType.Other) {
                            if (tokenValueEqualsTo(R)) {
                                if (n2 == null) {
                                    throw new AssertionError();
                                }
                                this.type = TokenType.Ref;
                                try {
                                    this.reference = Integer.parseInt(new String(n1));
                                    this.generation = Integer.parseInt(new String(n2));
                                    return;
                                } catch (Exception e) {
                                    Logger logger = LoggerFactory.getLogger(PdfTokenizer.class);
                                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.INVALID_INDIRECT_REFERENCE, new String(n1), new String(n2)));
                                    this.reference = -1;
                                    this.generation = 0;
                                    return;
                                }
                            } else if (tokenValueEqualsTo(Obj)) {
                                if (n2 == null) {
                                    throw new AssertionError();
                                }
                                this.type = TokenType.Obj;
                                this.reference = Integer.parseInt(new String(n1));
                                this.generation = Integer.parseInt(new String(n2));
                                return;
                            }
                        }
                        this.file.seek(ptr);
                        this.type = TokenType.Number;
                        this.outBuf.reset().append(n1);
                        return;
                }
            }
        }
        if (level == 1) {
            this.type = TokenType.Number;
            this.outBuf.reset().append(n1);
        }
    }

    public boolean nextToken() throws IOException {
        int ch;
        int ch2;
        int ch3;
        this.outBuf.reset();
        do {
            ch = this.file.read();
            if (ch == -1) {
                break;
            }
        } while (isWhitespace(ch));
        if (ch == -1) {
            this.type = TokenType.EndOfFile;
            return false;
        }
        switch (ch) {
            case 37:
                this.type = TokenType.Comment;
                do {
                    ch2 = this.file.read();
                    if (ch2 != -1 && ch2 != 13) {
                    }
                } while (ch2 != 10);
                break;
            case 40:
                this.type = TokenType.String;
                this.hexString = false;
                int nesting = 0;
                while (true) {
                    ch3 = this.file.read();
                    if (ch3 != -1) {
                        if (ch3 == 40) {
                            nesting++;
                        } else if (ch3 == 41) {
                            nesting--;
                            if (nesting == -1) {
                            }
                        } else if (ch3 == 92) {
                            this.outBuf.append(92);
                            ch3 = this.file.read();
                            if (ch3 < 0) {
                            }
                        } else {
                            continue;
                        }
                        this.outBuf.append(ch3);
                    }
                }
                if (ch3 == -1) {
                    throwError(IoExceptionMessageConstant.ERROR_READING_STRING, new Object[0]);
                    break;
                }
                break;
            case 47:
                this.type = TokenType.Name;
                while (true) {
                    int ch4 = this.file.read();
                    if (!delims[ch4 + 1]) {
                        this.outBuf.append(ch4);
                    } else {
                        backOnePosition(ch4);
                        break;
                    }
                }
            case 60:
                int v1 = this.file.read();
                if (v1 == 60) {
                    this.type = TokenType.StartDic;
                    break;
                } else {
                    this.type = TokenType.String;
                    this.hexString = true;
                    int v2 = 0;
                    while (true) {
                        if (isWhitespace(v1)) {
                            v1 = this.file.read();
                        } else if (v1 != 62) {
                            this.outBuf.append(v1);
                            v1 = ByteBuffer.getHex(v1);
                            if (v1 >= 0) {
                                v2 = this.file.read();
                                while (isWhitespace(v2)) {
                                    v2 = this.file.read();
                                }
                                if (v2 != 62) {
                                    this.outBuf.append(v2);
                                    v2 = ByteBuffer.getHex(v2);
                                    if (v2 >= 0) {
                                        v1 = this.file.read();
                                    }
                                }
                            }
                        }
                    }
                    if (v1 < 0 || v2 < 0) {
                        throwError(IoExceptionMessageConstant.ERROR_READING_STRING, new Object[0]);
                        break;
                    }
                }
            case 62:
                if (this.file.read() != 62) {
                    throwError(IoExceptionMessageConstant.GT_NOT_EXPECTED, new Object[0]);
                }
                this.type = TokenType.EndDic;
                break;
            case Property.FONT_PROVIDER /* 91 */:
                this.type = TokenType.StartArray;
                break;
            case Property.TABLE_LAYOUT /* 93 */:
                this.type = TokenType.EndArray;
                break;
            default:
                if (ch == 45 || ch == 43 || ch == 46 || (ch >= 48 && ch <= 57)) {
                    this.type = TokenType.Number;
                    boolean isReal = false;
                    int numberOfMinuses = 0;
                    if (ch == 45) {
                        do {
                            numberOfMinuses++;
                            ch = this.file.read();
                        } while (ch == 45);
                        this.outBuf.append(45);
                    } else {
                        this.outBuf.append(ch);
                        ch = this.file.read();
                    }
                    while (ch >= 48 && ch <= 57) {
                        this.outBuf.append(ch);
                        ch = this.file.read();
                    }
                    if (ch == 46) {
                        isReal = true;
                        this.outBuf.append(ch);
                        ch = this.file.read();
                        int numberOfMinusesAfterDot = 0;
                        if (ch == 45) {
                            numberOfMinusesAfterDot = 0 + 1;
                            ch = this.file.read();
                        }
                        while (ch >= 48 && ch <= 57) {
                            if (numberOfMinusesAfterDot == 0) {
                                this.outBuf.append(ch);
                            }
                            ch = this.file.read();
                        }
                    }
                    if (numberOfMinuses > 1 && !isReal) {
                        this.outBuf.reset();
                        this.outBuf.append(48);
                    }
                } else {
                    this.type = TokenType.Other;
                    do {
                        this.outBuf.append(ch);
                        ch = this.file.read();
                    } while (!delims[ch + 1]);
                }
                if (ch != -1) {
                    backOnePosition(ch);
                    break;
                }
                break;
        }
        return true;
    }

    public long getLongValue() {
        return Long.parseLong(getStringValue());
    }

    public int getIntValue() {
        return Integer.parseInt(getStringValue());
    }

    public boolean isHexString() {
        return this.hexString;
    }

    public boolean isCloseStream() {
        return this.closeStream;
    }

    public void setCloseStream(boolean closeStream) {
        this.closeStream = closeStream;
    }

    public RandomAccessFileOrArray getSafeFile() {
        return this.file.createView();
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected static byte[] decodeStringContent(byte[] content, int from, int to, boolean hexWriting) {
        ByteBuffer buffer = new ByteBuffer((to - from) + 1);
        if (hexWriting) {
            int v1 = from;
            while (true) {
                if (v1 > to) {
                    break;
                }
                int i = v1 + 1;
                int v12 = ByteBuffer.getHex(content[v1]);
                if (i > to) {
                    buffer.append(v12 << 4);
                    break;
                }
                int i2 = i + 1;
                int v2 = content[i];
                buffer.append((v12 << 4) + ByteBuffer.getHex(v2));
                v1 = i2;
            }
        } else {
            int ch = from;
            while (ch <= to) {
                int i3 = ch + 1;
                int ch2 = content[ch];
                if (ch2 == 92) {
                    boolean lineBreak = false;
                    int octal = i3 + 1;
                    ch2 = content[i3];
                    switch (ch2) {
                        case 10:
                            lineBreak = true;
                            break;
                        case 13:
                            lineBreak = true;
                            if (octal <= to) {
                                int i4 = octal + 1;
                                if (content[octal] == 10) {
                                    octal = i4;
                                    break;
                                } else {
                                    octal = i4 - 1;
                                    break;
                                }
                            }
                            break;
                        case 40:
                        case 41:
                        case Property.OPACITY /* 92 */:
                            break;
                        case Property.FONT_SET /* 98 */:
                            ch2 = 8;
                            break;
                        case 102:
                            ch2 = 12;
                            break;
                        case Property.BORDER_TOP_LEFT_RADIUS /* 110 */:
                            ch2 = 10;
                            break;
                        case Property.BORDER_COLLAPSE /* 114 */:
                            ch2 = 13;
                            break;
                        case Property.VERTICAL_BORDER_SPACING /* 116 */:
                            ch2 = 9;
                            break;
                        default:
                            if (ch2 >= 48 && ch2 <= 55) {
                                int octal2 = ch2 - 48;
                                if (octal > to) {
                                    ch2 = octal2;
                                    break;
                                } else {
                                    int i5 = octal + 1;
                                    int ch3 = content[octal];
                                    if (ch3 >= 48 && ch3 <= 55) {
                                        int octal3 = ((octal2 << 3) + ch3) - 48;
                                        if (i5 > to) {
                                            ch2 = octal3;
                                            octal = i5;
                                            break;
                                        } else {
                                            int i6 = i5 + 1;
                                            int ch4 = content[i5];
                                            if (ch4 < 48 || ch4 > 55) {
                                                ch2 = octal3;
                                                octal = i6 - 1;
                                                break;
                                            } else {
                                                ch2 = (((octal3 << 3) + ch4) - 48) & 255;
                                                octal = i6;
                                                break;
                                            }
                                        }
                                    } else {
                                        ch2 = octal2;
                                        octal = i5 - 1;
                                        break;
                                    }
                                }
                            }
                            break;
                    }
                    if (lineBreak) {
                        ch = octal;
                    } else {
                        i3 = octal;
                    }
                } else if (ch2 == 13) {
                    ch2 = 10;
                    ch2 = 10;
                    ch2 = 10;
                    if (i3 <= to) {
                        int i7 = i3 + 1;
                        i3 = content[i3] != 10 ? i7 - 1 : i7;
                    }
                }
                buffer.append(ch2);
                ch = i3;
            }
        }
        return buffer.toByteArray();
    }

    public static byte[] decodeStringContent(byte[] content, boolean hexWriting) {
        return decodeStringContent(content, 0, content.length - 1, hexWriting);
    }

    public static boolean isWhitespace(int ch) {
        return isWhitespace(ch, true);
    }

    protected static boolean isWhitespace(int ch, boolean isWhitespace) {
        return (isWhitespace && ch == 0) || ch == 9 || ch == 10 || ch == 12 || ch == 13 || ch == 32;
    }

    protected static boolean isDelimiter(int ch) {
        return ch == 40 || ch == 41 || ch == 60 || ch == 62 || ch == 91 || ch == 93 || ch == 47 || ch == 37;
    }

    protected static boolean isDelimiterWhitespace(int ch) {
        return delims[ch + 1];
    }

    public void throwError(String error, Object... messageParams) {
        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.ERROR_AT_FILE_POINTER, (Throwable) new com.itextpdf.io.exceptions.IOException(error).setMessageParams(messageParams)).setMessageParams(Long.valueOf(this.file.getPosition()));
    }

    public static boolean checkTrailer(ByteBuffer line) {
        if (Trailer.length > line.size()) {
            return false;
        }
        for (int i = 0; i < Trailer.length; i++) {
            if (Trailer[i] != line.get(i)) {
                return false;
            }
        }
        return true;
    }

    public boolean readLineSegment(ByteBuffer buffer) throws IOException {
        return readLineSegment(buffer, true);
    }

    public boolean readLineSegment(ByteBuffer buffer, boolean isNullWhitespace) throws IOException {
        int read;
        int c;
        boolean eol = false;
        do {
            read = read();
            c = read;
        } while (isWhitespace(read, isNullWhitespace));
        boolean prevWasWhitespace = false;
        while (!eol) {
            switch (c) {
                case -1:
                case 10:
                    eol = true;
                    break;
                case 9:
                case 12:
                case 32:
                    if (!prevWasWhitespace) {
                        prevWasWhitespace = true;
                        buffer.append((byte) c);
                        break;
                    }
                    break;
                case 13:
                    eol = true;
                    long cur = getPosition();
                    if (read() != 10) {
                        seek(cur);
                        break;
                    }
                    break;
                default:
                    prevWasWhitespace = false;
                    buffer.append((byte) c);
                    break;
            }
            if (eol || buffer.size() == buffer.capacity()) {
                eol = true;
            } else {
                c = read();
            }
        }
        if (buffer.size() == buffer.capacity()) {
            boolean eol2 = false;
            while (!eol2) {
                int read2 = read();
                c = read2;
                switch (read2) {
                    case -1:
                    case 10:
                        eol2 = true;
                        break;
                    case 13:
                        eol2 = true;
                        long cur2 = getPosition();
                        if (read() == 10) {
                            break;
                        } else {
                            seek(cur2);
                            break;
                        }
                }
            }
        }
        return (c == -1 && buffer.isEmpty()) ? false : true;
    }

    public static int[] checkObjectStart(PdfTokenizer lineTokenizer) {
        try {
            lineTokenizer.seek(0L);
            if (lineTokenizer.nextToken() && lineTokenizer.getTokenType() == TokenType.Number) {
                int num = lineTokenizer.getIntValue();
                if (lineTokenizer.nextToken() && lineTokenizer.getTokenType() == TokenType.Number) {
                    int gen = lineTokenizer.getIntValue();
                    if (lineTokenizer.nextToken() && Arrays.equals(Obj, lineTokenizer.getByteContent())) {
                        return new int[]{num, gen};
                    }
                    return null;
                }
                return null;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }
}
