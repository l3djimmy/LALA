package com.itextpdf.kernel.xmp.impl;

import com.itextpdf.io.font.PdfEncodings;
import java.io.UnsupportedEncodingException;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class Latin1Converter {
    private static final int STATE_START = 0;
    private static final int STATE_UTF8CHAR = 11;

    private Latin1Converter() {
    }

    public static ByteBuffer convert(ByteBuffer buffer) {
        if (PdfEncodings.UTF8.equals(buffer.getEncoding())) {
            byte[] readAheadBuffer = new byte[8];
            int state = 0;
            int expectedBytes = 0;
            ByteBuffer out = new ByteBuffer((buffer.length() * 4) / 3);
            int state2 = 0;
            int i = 0;
            while (i < buffer.length()) {
                int b = buffer.charAt(i);
                switch (state2) {
                    case 11:
                        if (expectedBytes > 0 && (b & 192) == 128) {
                            int readAhead = state + 1;
                            readAheadBuffer[state] = (byte) b;
                            expectedBytes--;
                            if (expectedBytes != 0) {
                                state = readAhead;
                                break;
                            } else {
                                out.append(readAheadBuffer, 0, readAhead);
                                state = 0;
                                state2 = 0;
                                break;
                            }
                        } else {
                            byte[] utf8 = convertToUTF8(readAheadBuffer[0]);
                            out.append(utf8);
                            i -= state;
                            state = 0;
                            state2 = 0;
                            break;
                        }
                    default:
                        if (b < 127) {
                            out.append((byte) b);
                            break;
                        } else if (b >= 192) {
                            expectedBytes = -1;
                            for (int test = b; expectedBytes < 8 && (test & 128) == 128; test <<= 1) {
                                expectedBytes++;
                            }
                            readAheadBuffer[state] = (byte) b;
                            state2 = 11;
                            state++;
                            break;
                        } else {
                            byte[] utf82 = convertToUTF8((byte) b);
                            out.append(utf82);
                            break;
                        }
                }
                i++;
            }
            if (state2 == 11) {
                for (int j = 0; j < state; j++) {
                    byte[] utf83 = convertToUTF8(readAheadBuffer[j]);
                    out.append(utf83);
                }
            }
            return out;
        }
        return buffer;
    }

    private static byte[] convertToUTF8(byte ch) {
        int c = ch & UByte.MAX_VALUE;
        if (c >= 128) {
            try {
                return (c == 129 || c == 141 || c == 143 || c == 144 || c == 157) ? new byte[]{32} : new String(new byte[]{ch}, "cp1252").getBytes(PdfEncodings.UTF8);
            } catch (UnsupportedEncodingException e) {
            }
        }
        return new byte[]{ch};
    }
}
