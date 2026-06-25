package androidx.compose.ui.graphics;

import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.UShort;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.ShortCompanionObject;
import kotlin.text.CharsKt;
import kotlin.text.Regex;
/* compiled from: Float16.kt */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\u0010\u0000\n\u0002\b\u0014\n\u0002\u0010\u0005\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u000f\b\u0081@\u0018\u0000 R2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001RB\u0011\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005B\u0011\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0006¢\u0006\u0004\b\u0004\u0010\u0007B\u000f\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\u0004\u0010\nJ\u0013\u0010\u0015\u001a\u00020\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010\nJ\u0013\u0010\u0017\u001a\u00020\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\nJ\u001b\u0010\u0019\u001a\u00020\f2\u0006\u0010\u001a\u001a\u00020\u0000H\u0096\u0002ø\u0001\u0000¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001a\u001a\u0004\u0018\u00010\u001fHÖ\u0003¢\u0006\u0004\b \u0010!J\u0013\u0010\"\u001a\u00020\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b#\u0010\nJ\u0010\u0010$\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b%\u0010\u000eJ\r\u0010&\u001a\u00020\u001e¢\u0006\u0004\b'\u0010(J\r\u0010)\u001a\u00020\u001e¢\u0006\u0004\b*\u0010(J\r\u0010+\u001a\u00020\u001e¢\u0006\u0004\b,\u0010(J\r\u0010-\u001a\u00020\u001e¢\u0006\u0004\b.\u0010(J\u0013\u0010/\u001a\u00020\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b0\u0010\nJ\r\u00101\u001a\u00020\f¢\u0006\u0004\b2\u0010\u000eJ\r\u00103\u001a\u000204¢\u0006\u0004\b5\u00106J\r\u00107\u001a\u00020\u0006¢\u0006\u0004\b8\u00109J\r\u0010:\u001a\u00020\u0003¢\u0006\u0004\b;\u0010<J\r\u0010=\u001a\u00020>¢\u0006\u0004\b?\u0010@J\r\u0010A\u001a\u00020\f¢\u0006\u0004\bB\u0010\u000eJ\r\u0010C\u001a\u00020D¢\u0006\u0004\bE\u0010FJ\r\u0010G\u001a\u00020\f¢\u0006\u0004\bH\u0010\u000eJ\r\u0010I\u001a\u00020\t¢\u0006\u0004\bJ\u0010\nJ\u000f\u0010K\u001a\u00020>H\u0016¢\u0006\u0004\bL\u0010@J\u0013\u0010M\u001a\u00020\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bN\u0010\nJ\u0018\u0010O\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u0000ø\u0001\u0000¢\u0006\u0004\bP\u0010QR\u0011\u0010\u000b\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0011\u001a\u00020\u00008Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0012\u0010\nR\u0011\u0010\u0013\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u000e\u0088\u0001\b\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006S"}, d2 = {"Landroidx/compose/ui/graphics/Float16;", "", "value", "", "constructor-impl", "(F)S", "", "(D)S", "halfValue", "", "(S)S", "exponent", "", "getExponent-impl", "(S)I", "getHalfValue", "()S", "sign", "getSign-slo4al4", "significand", "getSignificand-impl", "absoluteValue", "absoluteValue-slo4al4", "ceil", "ceil-slo4al4", "compareTo", "other", "compareTo-41bOqos", "(SS)I", "equals", "", "", "equals-impl", "(SLjava/lang/Object;)Z", "floor", "floor-slo4al4", "hashCode", "hashCode-impl", "isFinite", "isFinite-impl", "(S)Z", "isInfinite", "isInfinite-impl", "isNaN", "isNaN-impl", "isNormalized", "isNormalized-impl", "round", "round-slo4al4", "toBits", "toBits-impl", "toByte", "", "toByte-impl", "(S)B", "toDouble", "toDouble-impl", "(S)D", "toFloat", "toFloat-impl", "(S)F", "toHexString", "", "toHexString-impl", "(S)Ljava/lang/String;", "toInt", "toInt-impl", "toLong", "", "toLong-impl", "(S)J", "toRawBits", "toRawBits-impl", "toShort", "toShort-impl", "toString", "toString-impl", "trunc", "trunc-slo4al4", "withSign", "withSign-qCeQghg", "(SS)S", "Companion", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class Float16 implements Comparable<Float16> {
    public static final int MaxExponent = 15;
    public static final int MinExponent = -14;
    public static final int Size = 16;
    private final short halfValue;
    public static final Companion Companion = new Companion(null);
    private static final short Epsilon = m4397constructorimpl((short) 5120);
    private static final short LowestValue = m4397constructorimpl((short) -1025);
    private static final short MaxValue = m4397constructorimpl((short) 31743);
    private static final short MinNormal = m4397constructorimpl((short) 1024);
    private static final short MinValue = m4397constructorimpl((short) 1);
    private static final short NaN = m4397constructorimpl((short) 32256);
    private static final short NegativeInfinity = m4397constructorimpl((short) -1024);
    private static final short NegativeZero = m4397constructorimpl((short) ShortCompanionObject.MIN_VALUE);
    private static final short PositiveInfinity = m4397constructorimpl((short) 31744);
    private static final short PositiveZero = m4397constructorimpl((short) 0);

    /* renamed from: box-impl  reason: not valid java name */
    public static final /* synthetic */ Float16 m4392boximpl(short s) {
        return new Float16(s);
    }

    /* renamed from: constructor-impl  reason: not valid java name */
    public static short m4397constructorimpl(short s) {
        return s;
    }

    /* renamed from: equals-impl  reason: not valid java name */
    public static boolean m4398equalsimpl(short s, Object obj) {
        return (obj instanceof Float16) && s == ((Float16) obj).m4423unboximpl();
    }

    /* renamed from: equals-impl0  reason: not valid java name */
    public static final boolean m4399equalsimpl0(short s, short s2) {
        return s == s2;
    }

    /* renamed from: hashCode-impl  reason: not valid java name */
    public static int m4404hashCodeimpl(short s) {
        return Short.hashCode(s);
    }

    public boolean equals(Object obj) {
        return m4398equalsimpl(this.halfValue, obj);
    }

    public int hashCode() {
        return m4404hashCodeimpl(this.halfValue);
    }

    /* renamed from: unbox-impl  reason: not valid java name */
    public final /* synthetic */ short m4423unboximpl() {
        return this.halfValue;
    }

    @Override // java.lang.Comparable
    public /* bridge */ /* synthetic */ int compareTo(Float16 float16) {
        return m4422compareTo41bOqos(float16.m4423unboximpl());
    }

    private /* synthetic */ Float16(short halfValue) {
        this.halfValue = halfValue;
    }

    public final short getHalfValue() {
        return this.halfValue;
    }

    /* renamed from: constructor-impl  reason: not valid java name */
    public static short m4396constructorimpl(float value) {
        short s;
        int bits$iv = Float.floatToRawIntBits(value);
        int s$iv = bits$iv >>> 31;
        int e$iv = (bits$iv >>> 23) & 255;
        int m$iv = 8388607 & bits$iv;
        int outE$iv = 0;
        int outM$iv = 0;
        if (e$iv == 255) {
            outE$iv = 31;
            outM$iv = m$iv != 0 ? 512 : 0;
        } else {
            int e$iv2 = (e$iv - 127) + 15;
            if (e$iv2 >= 31) {
                outE$iv = 49;
            } else if (e$iv2 <= 0) {
                if (e$iv2 >= -10) {
                    int m$iv2 = (8388608 | m$iv) >> (1 - e$iv2);
                    if ((m$iv2 & 4096) != 0) {
                        m$iv2 += 8192;
                    }
                    outM$iv = m$iv2 >> 13;
                }
            } else {
                outE$iv = e$iv2;
                outM$iv = m$iv >> 13;
                if ((m$iv & 4096) != 0) {
                    int out$iv = (outE$iv << 10) | outM$iv;
                    s = (short) ((s$iv << 15) | (out$iv + 1));
                    return m4397constructorimpl(s);
                }
            }
        }
        int out$iv2 = s$iv << 15;
        s = (short) (out$iv2 | (outE$iv << 10) | outM$iv);
        return m4397constructorimpl(s);
    }

    /* renamed from: constructor-impl  reason: not valid java name */
    public static short m4395constructorimpl(double value) {
        return m4396constructorimpl((float) value);
    }

    /* renamed from: toByte-impl  reason: not valid java name */
    public static final byte m4411toByteimpl(short arg0) {
        return (byte) m4413toFloatimpl(arg0);
    }

    /* renamed from: toShort-impl  reason: not valid java name */
    public static final short m4418toShortimpl(short arg0) {
        return (short) m4413toFloatimpl(arg0);
    }

    /* renamed from: toInt-impl  reason: not valid java name */
    public static final int m4415toIntimpl(short arg0) {
        return (int) m4413toFloatimpl(arg0);
    }

    /* renamed from: toLong-impl  reason: not valid java name */
    public static final long m4416toLongimpl(short arg0) {
        return m4413toFloatimpl(arg0);
    }

    /* renamed from: toFloat-impl  reason: not valid java name */
    public static final float m4413toFloatimpl(short arg0) {
        int bits$iv = 65535 & arg0;
        int s$iv = 32768 & bits$iv;
        int e$iv = (bits$iv >>> 10) & 31;
        int m$iv = bits$iv & 1023;
        int outE$iv = 0;
        int outM$iv = 0;
        if (e$iv == 0) {
            if (m$iv != 0) {
                int bits$iv$iv = 1056964608 + m$iv;
                float o$iv = Float.intBitsToFloat(bits$iv$iv) - Float16Kt.Fp32DenormalFloat;
                return s$iv == 0 ? o$iv : -o$iv;
            }
        } else {
            outM$iv = m$iv << 13;
            if (e$iv == 31) {
                outE$iv = 255;
                if (outM$iv != 0) {
                    outM$iv |= 4194304;
                }
            } else {
                outE$iv = (e$iv - 15) + 127;
            }
        }
        int out$iv = (s$iv << 16) | (outE$iv << 23) | outM$iv;
        return Float.intBitsToFloat(out$iv);
    }

    /* renamed from: toDouble-impl  reason: not valid java name */
    public static final double m4412toDoubleimpl(short arg0) {
        return m4413toFloatimpl(arg0);
    }

    /* renamed from: toBits-impl  reason: not valid java name */
    public static final int m4410toBitsimpl(short arg0) {
        if (m4407isNaNimpl(arg0)) {
            return 32256;
        }
        return 65535 & arg0;
    }

    /* renamed from: toRawBits-impl  reason: not valid java name */
    public static final int m4417toRawBitsimpl(short arg0) {
        return 65535 & arg0;
    }

    /* renamed from: toString-impl  reason: not valid java name */
    public static String m4419toStringimpl(short arg0) {
        return String.valueOf(m4413toFloatimpl(arg0));
    }

    public String toString() {
        return m4419toStringimpl(this.halfValue);
    }

    /* renamed from: compareTo-41bOqos  reason: not valid java name */
    public int m4422compareTo41bOqos(short other) {
        return m4394compareTo41bOqos(this.halfValue, other);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: compareTo-41bOqos  reason: not valid java name */
    public static int m4394compareTo41bOqos(short arg0, short other) {
        int i;
        int i2;
        if (m4407isNaNimpl(arg0)) {
            return !m4407isNaNimpl(other) ? 1 : 0;
        }
        if (m4407isNaNimpl(other)) {
            return -1;
        }
        if ((arg0 & ShortCompanionObject.MIN_VALUE) != 0) {
            i = 32768 - (arg0 & UShort.MAX_VALUE);
        } else {
            i = arg0 & UShort.MAX_VALUE;
        }
        if ((other & ShortCompanionObject.MIN_VALUE) != 0) {
            i2 = 32768 - (65535 & other);
        } else {
            i2 = other & UShort.MAX_VALUE;
        }
        return Intrinsics.compare(i, i2);
    }

    /* renamed from: getSign-slo4al4  reason: not valid java name */
    public static final short m4402getSignslo4al4(short arg0) {
        int u;
        int v = arg0 & ShortCompanionObject.MAX_VALUE;
        if ((v > 31744) | (v == 0)) {
            u = v;
        } else {
            u = (32768 & arg0) | 15360;
        }
        return m4397constructorimpl((short) u);
    }

    /* renamed from: withSign-qCeQghg  reason: not valid java name */
    public static final short m4421withSignqCeQghg(short arg0, short sign) {
        return m4397constructorimpl((short) ((32768 & sign) | (arg0 & ShortCompanionObject.MAX_VALUE)));
    }

    /* renamed from: absoluteValue-slo4al4  reason: not valid java name */
    public static final short m4391absoluteValueslo4al4(short arg0) {
        return m4397constructorimpl((short) (arg0 & ShortCompanionObject.MAX_VALUE));
    }

    /* renamed from: round-slo4al4  reason: not valid java name */
    public static final short m4409roundslo4al4(short arg0) {
        int bits = arg0 & UShort.MAX_VALUE;
        int e = bits & 32767;
        int result = bits;
        if (e < 15360) {
            result = (result & 32768) | ((e < 14336 ? 0 : 65535) & 15360);
        } else if (e < 25600) {
            int e2 = 25 - (e >> 10);
            int mask = (1 << e2) - 1;
            result = (result + (1 << (e2 - 1))) & (~mask);
        }
        return m4397constructorimpl((short) result);
    }

    /* renamed from: ceil-slo4al4  reason: not valid java name */
    public static final short m4393ceilslo4al4(short arg0) {
        int bits = 65535 & arg0;
        int e = bits & 32767;
        int result = bits;
        if (e < 15360) {
            result = (result & 32768) | ((-((e == 0 ? 0 : 1) & (~(bits >> 15)))) & 15360);
        } else if (e < 25600) {
            int mask = (1 << (25 - (e >> 10))) - 1;
            result = (result + (mask & ((bits >> 15) - 1))) & (~mask);
        }
        return m4397constructorimpl((short) result);
    }

    /* renamed from: floor-slo4al4  reason: not valid java name */
    public static final short m4400floorslo4al4(short arg0) {
        int bits = arg0 & UShort.MAX_VALUE;
        int e = bits & 32767;
        int result = bits;
        if (e < 15360) {
            result = (result & 32768) | ((bits <= 32768 ? 0 : 65535) & 15360);
        } else if (e < 25600) {
            int mask = (1 << (25 - (e >> 10))) - 1;
            result = (result + ((-(bits >> 15)) & mask)) & (~mask);
        }
        return m4397constructorimpl((short) result);
    }

    /* renamed from: trunc-slo4al4  reason: not valid java name */
    public static final short m4420truncslo4al4(short arg0) {
        int bits = 65535 & arg0;
        int e = bits & 32767;
        int result = bits;
        if (e < 15360) {
            result &= 32768;
        } else if (e < 25600) {
            int mask = (1 << (25 - (e >> 10))) - 1;
            result &= ~mask;
        }
        return m4397constructorimpl((short) result);
    }

    /* renamed from: getExponent-impl  reason: not valid java name */
    public static final int m4401getExponentimpl(short arg0) {
        return ((arg0 >>> 10) & 31) - 15;
    }

    /* renamed from: getSignificand-impl  reason: not valid java name */
    public static final int m4403getSignificandimpl(short arg0) {
        return arg0 & 1023;
    }

    /* renamed from: isNaN-impl  reason: not valid java name */
    public static final boolean m4407isNaNimpl(short arg0) {
        return (arg0 & ShortCompanionObject.MAX_VALUE) > 31744;
    }

    /* renamed from: isInfinite-impl  reason: not valid java name */
    public static final boolean m4406isInfiniteimpl(short arg0) {
        return (arg0 & ShortCompanionObject.MAX_VALUE) == 31744;
    }

    /* renamed from: isFinite-impl  reason: not valid java name */
    public static final boolean m4405isFiniteimpl(short arg0) {
        return (arg0 & ShortCompanionObject.MAX_VALUE) != 31744;
    }

    /* renamed from: isNormalized-impl  reason: not valid java name */
    public static final boolean m4408isNormalizedimpl(short arg0) {
        int v = arg0 & 31744;
        return (v != 31744) & (v != 0);
    }

    /* renamed from: toHexString-impl  reason: not valid java name */
    public static final String m4414toHexStringimpl(short arg0) {
        StringBuilder o = new StringBuilder();
        int bits = 65535 & arg0;
        int s = bits >>> 15;
        int e = (bits >>> 10) & 31;
        int m = bits & 1023;
        if (e == 31) {
            if (m == 0) {
                if (s != 0) {
                    o.append('-');
                }
                o.append("Infinity");
            } else {
                o.append("NaN");
            }
        } else {
            if (s == 1) {
                o.append('-');
            }
            if (e == 0) {
                if (m == 0) {
                    o.append("0x0.0p0");
                } else {
                    o.append("0x0.");
                    String significand = Integer.toString(m, CharsKt.checkRadix(16));
                    Intrinsics.checkNotNullExpressionValue(significand, "toString(...)");
                    o.append(new Regex("0{2,}$").replaceFirst(significand, ""));
                    o.append("p-14");
                }
            } else {
                o.append("0x1.");
                String significand2 = Integer.toString(m, CharsKt.checkRadix(16));
                Intrinsics.checkNotNullExpressionValue(significand2, "toString(...)");
                o.append(new Regex("0{2,}$").replaceFirst(significand2, ""));
                o.append('p');
                o.append(String.valueOf(e - 15));
            }
        }
        return o.toString();
    }

    /* compiled from: Float16.kt */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0013\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0019\u0010\u0003\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0005\u0010\u0006R\u0019\u0010\b\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\t\u0010\u0006R\u000e\u0010\n\u001a\u00020\u000bX\u0086T¢\u0006\u0002\n\u0000R\u0019\u0010\f\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\r\u0010\u0006R\u000e\u0010\u000e\u001a\u00020\u000bX\u0086T¢\u0006\u0002\n\u0000R\u0019\u0010\u000f\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0010\u0010\u0006R\u0019\u0010\u0011\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0012\u0010\u0006R\u0019\u0010\u0013\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0014\u0010\u0006R\u0019\u0010\u0015\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0016\u0010\u0006R\u0019\u0010\u0017\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0018\u0010\u0006R\u0019\u0010\u0019\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u001a\u0010\u0006R\u0019\u0010\u001b\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u001c\u0010\u0006R\u000e\u0010\u001d\u001a\u00020\u000bX\u0086T¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001e"}, d2 = {"Landroidx/compose/ui/graphics/Float16$Companion;", "", "()V", "Epsilon", "Landroidx/compose/ui/graphics/Float16;", "getEpsilon-slo4al4", "()S", ExifInterface.LATITUDE_SOUTH, "LowestValue", "getLowestValue-slo4al4", "MaxExponent", "", "MaxValue", "getMaxValue-slo4al4", "MinExponent", "MinNormal", "getMinNormal-slo4al4", "MinValue", "getMinValue-slo4al4", "NaN", "getNaN-slo4al4", "NegativeInfinity", "getNegativeInfinity-slo4al4", "NegativeZero", "getNegativeZero-slo4al4", "PositiveInfinity", "getPositiveInfinity-slo4al4", "PositiveZero", "getPositiveZero-slo4al4", "Size", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* renamed from: getEpsilon-slo4al4  reason: not valid java name */
        public final short m4424getEpsilonslo4al4() {
            return Float16.Epsilon;
        }

        /* renamed from: getLowestValue-slo4al4  reason: not valid java name */
        public final short m4425getLowestValueslo4al4() {
            return Float16.LowestValue;
        }

        /* renamed from: getMaxValue-slo4al4  reason: not valid java name */
        public final short m4426getMaxValueslo4al4() {
            return Float16.MaxValue;
        }

        /* renamed from: getMinNormal-slo4al4  reason: not valid java name */
        public final short m4427getMinNormalslo4al4() {
            return Float16.MinNormal;
        }

        /* renamed from: getMinValue-slo4al4  reason: not valid java name */
        public final short m4428getMinValueslo4al4() {
            return Float16.MinValue;
        }

        /* renamed from: getNaN-slo4al4  reason: not valid java name */
        public final short m4429getNaNslo4al4() {
            return Float16.NaN;
        }

        /* renamed from: getNegativeInfinity-slo4al4  reason: not valid java name */
        public final short m4430getNegativeInfinityslo4al4() {
            return Float16.NegativeInfinity;
        }

        /* renamed from: getNegativeZero-slo4al4  reason: not valid java name */
        public final short m4431getNegativeZeroslo4al4() {
            return Float16.NegativeZero;
        }

        /* renamed from: getPositiveInfinity-slo4al4  reason: not valid java name */
        public final short m4432getPositiveInfinityslo4al4() {
            return Float16.PositiveInfinity;
        }

        /* renamed from: getPositiveZero-slo4al4  reason: not valid java name */
        public final short m4433getPositiveZeroslo4al4() {
            return Float16.PositiveZero;
        }
    }
}
