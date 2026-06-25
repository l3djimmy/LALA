package com.itextpdf.io.source;

import androidx.camera.video.AudioStats;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.DecimalFormatUtil;
import java.nio.charset.StandardCharsets;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class ByteUtils {
    static boolean HighPrecision = false;
    private static final byte[] bytes = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};
    private static final byte[] zero = {48};
    private static final byte[] one = {49};
    private static final byte[] negOne = {45, 49};

    public static byte[] getIsoBytes(String text) {
        if (text == null) {
            return null;
        }
        int len = text.length();
        byte[] b = new byte[len];
        for (int k = 0; k < len; k++) {
            b[k] = (byte) text.charAt(k);
        }
        return b;
    }

    public static byte[] getIsoBytes(byte pre, String text) {
        return getIsoBytes(pre, text, (byte) 0);
    }

    public static byte[] getIsoBytes(byte pre, String text, byte post) {
        if (text == null) {
            return null;
        }
        int len = text.length();
        int start = 0;
        if (pre != 0) {
            len++;
            start = 1;
        }
        if (post != 0) {
            len++;
        }
        byte[] b = new byte[len];
        if (pre != 0) {
            b[0] = pre;
        }
        if (post != 0) {
            b[len - 1] = post;
        }
        for (int k = 0; k < text.length(); k++) {
            b[k + start] = (byte) text.charAt(k);
        }
        return b;
    }

    public static byte[] getIsoBytes(int n) {
        return getIsoBytes(n, (ByteBuffer) null);
    }

    public static byte[] getIsoBytes(double d) {
        return getIsoBytes(d, (ByteBuffer) null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] getIsoBytes(int n, ByteBuffer buffer) {
        int i = 0;
        if (n < 0) {
            i = 1;
            n = -n;
        }
        int intLen = intSize(n);
        ByteBuffer buf = buffer == null ? new ByteBuffer(intLen + i) : buffer;
        for (int i2 = 0; i2 < intLen; i2++) {
            buf.prepend(bytes[n % 10]);
            n /= 10;
        }
        if (i != 0) {
            buf.prepend((byte) 45);
        }
        if (buffer == null) {
            return buf.getInternalBuffer();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] getIsoBytes(double d, ByteBuffer buffer) {
        return getIsoBytes(d, buffer, HighPrecision);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] getIsoBytes(double d, ByteBuffer buffer, boolean highPrecision) {
        long v;
        ByteBuffer buf;
        int intLen;
        byte[] result;
        double d2 = d;
        if (highPrecision) {
            if (Math.abs(d2) < 1.0E-6d) {
                if (buffer != null) {
                    buffer.prepend(zero);
                    return null;
                }
                return zero;
            }
            if (Double.isNaN(d2)) {
                Logger logger = LoggerFactory.getLogger(ByteUtils.class);
                logger.error(IoLogMessageConstant.ATTEMPT_PROCESS_NAN);
                d2 = AudioStats.AUDIO_AMPLITUDE_NONE;
            }
            byte[] result2 = DecimalFormatUtil.formatNumber(d2, "0.######").getBytes(StandardCharsets.ISO_8859_1);
            if (buffer != null) {
                buffer.prepend(result2);
                return null;
            }
            return result2;
        }
        int i = 0;
        if (Math.abs(d2) < 1.5E-5d) {
            if (buffer != null) {
                buffer.prepend(zero);
                return null;
            }
            return zero;
        }
        if (d2 < AudioStats.AUDIO_AMPLITUDE_NONE) {
            i = 1;
            d2 = -d2;
        }
        if (d2 < 1.0d) {
            double d3 = d2 + 5.0E-6d;
            if (d3 >= 1.0d) {
                if (i != 0) {
                    result = negOne;
                } else {
                    result = one;
                }
                if (buffer != null) {
                    buffer.prepend(result);
                    return null;
                }
                return result;
            }
            int v2 = (int) (100000.0d * d3);
            int len = 5;
            while (len > 0 && v2 % 10 == 0) {
                v2 /= 10;
                len--;
            }
            buf = buffer != null ? buffer : new ByteBuffer(i != 0 ? len + 3 : len + 2);
            for (int i2 = 0; i2 < len; i2++) {
                buf.prepend(bytes[v2 % 10]);
                v2 /= 10;
            }
            buf.prepend((byte) 46).prepend((byte) 48);
            if (i != 0) {
                buf.prepend((byte) 45);
            }
        } else if (d2 <= 32767.0d) {
            int v3 = (int) (100.0d * (d2 + 0.005d));
            if (v3 >= 1000000) {
                intLen = 5;
            } else if (v3 >= 100000) {
                intLen = 4;
            } else if (v3 >= 10000) {
                intLen = 3;
            } else if (v3 >= 1000) {
                intLen = 2;
            } else {
                intLen = 1;
            }
            int fracLen = 0;
            if (v3 % 100 != 0) {
                fracLen = 2;
                if (v3 % 10 != 0) {
                    fracLen = 2 + 1;
                } else {
                    v3 /= 10;
                }
            } else {
                v3 /= 100;
            }
            ByteBuffer buf2 = buffer != null ? buffer : new ByteBuffer(intLen + fracLen + i);
            for (int i3 = 0; i3 < fracLen - 1; i3++) {
                buf2.prepend(bytes[v3 % 10]);
                v3 /= 10;
            }
            if (fracLen > 0) {
                buf2.prepend((byte) 46);
            }
            for (int i4 = 0; i4 < intLen; i4++) {
                buf2.prepend(bytes[v3 % 10]);
                v3 /= 10;
            }
            if (i != 0) {
                buf2.prepend((byte) 45);
            }
            buf = buf2;
        } else {
            double d4 = d2 + 0.5d;
            if (d4 > 9.223372036854776E18d) {
                v = Long.MAX_VALUE;
            } else {
                if (Double.isNaN(d4)) {
                    Logger logger2 = LoggerFactory.getLogger(ByteUtils.class);
                    logger2.error(IoLogMessageConstant.ATTEMPT_PROCESS_NAN);
                    d4 = AudioStats.AUDIO_AMPLITUDE_NONE;
                }
                v = (long) d4;
            }
            int intLen2 = longSize(v);
            ByteBuffer buf3 = buffer == null ? new ByteBuffer(intLen2 + i) : buffer;
            for (int i5 = 0; i5 < intLen2; i5++) {
                buf3.prepend(bytes[(int) (v % 10)]);
                v /= 10;
            }
            if (i != 0) {
                buf3.prepend((byte) 45);
            }
            buf = buf3;
        }
        if (buffer == null) {
            return buf.getInternalBuffer();
        }
        return null;
    }

    private static int longSize(long l) {
        long m = 10;
        for (int i = 1; i < 19; i++) {
            if (l < m) {
                return i;
            }
            m *= 10;
        }
        return 19;
    }

    private static int intSize(int l) {
        long m = 10;
        for (int i = 1; i < 10; i++) {
            if (l < m) {
                return i;
            }
            m *= 10;
        }
        return 10;
    }
}
