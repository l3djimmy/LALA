package androidx.compose.ui.graphics;

import androidx.compose.ui.graphics.colorspace.ColorSpace;
import androidx.compose.ui.graphics.colorspace.ColorSpaceKt;
import androidx.compose.ui.graphics.colorspace.ColorSpaces;
import androidx.compose.ui.graphics.colorspace.Connector;
import androidx.compose.ui.graphics.colorspace.Rgb;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
import okhttp3.internal.ws.WebSocketProtocol;
/* compiled from: Color.kt */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u001d\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 :2\u00020\u0001:\u0001:B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u001d\u001a\u00020\u0007H\u0087\n¢\u0006\u0004\b\u001e\u0010\u000bJ\u0010\u0010\u001f\u001a\u00020\u0007H\u0087\n¢\u0006\u0004\b \u0010\u000bJ\u0010\u0010!\u001a\u00020\u0007H\u0087\n¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010#\u001a\u00020\u0007H\u0087\n¢\u0006\u0004\b$\u0010\u000bJ\u0010\u0010%\u001a\u00020\u0010H\u0087\n¢\u0006\u0004\b&\u0010\u0013J\u001b\u0010'\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u0010ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b(\u0010)J=\u0010*\u001a\u00020\u00002\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\u0017\u001a\u00020\u00072\b\b\u0002\u0010\u0014\u001a\u00020\u00072\b\b\u0002\u0010\f\u001a\u00020\u0007H\u0007ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b+\u0010,J\u001a\u0010-\u001a\u00020.2\b\u0010/\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b0\u00101J\u0010\u00102\u001a\u000203HÖ\u0001¢\u0006\u0004\b4\u00105J\u000f\u00106\u001a\u000207H\u0016¢\u0006\u0004\b8\u00109R\u001a\u0010\u0006\u001a\u00020\u00078FX\u0087\u0004¢\u0006\f\u0012\u0004\b\b\u0010\t\u001a\u0004\b\n\u0010\u000bR\u001a\u0010\f\u001a\u00020\u00078FX\u0087\u0004¢\u0006\f\u0012\u0004\b\r\u0010\t\u001a\u0004\b\u000e\u0010\u000bR\u001a\u0010\u000f\u001a\u00020\u00108FX\u0087\u0004¢\u0006\f\u0012\u0004\b\u0011\u0010\t\u001a\u0004\b\u0012\u0010\u0013R\u001a\u0010\u0014\u001a\u00020\u00078FX\u0087\u0004¢\u0006\f\u0012\u0004\b\u0015\u0010\t\u001a\u0004\b\u0016\u0010\u000bR\u001a\u0010\u0017\u001a\u00020\u00078FX\u0087\u0004¢\u0006\f\u0012\u0004\b\u0018\u0010\t\u001a\u0004\b\u0019\u0010\u000bR\u0019\u0010\u0002\u001a\u00020\u0003ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u001c\u001a\u0004\b\u001a\u0010\u001b\u0088\u0001\u0002\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006;"}, d2 = {"Landroidx/compose/ui/graphics/Color;", "", "value", "Lkotlin/ULong;", "constructor-impl", "(J)J", "alpha", "", "getAlpha$annotations", "()V", "getAlpha-impl", "(J)F", "blue", "getBlue$annotations", "getBlue-impl", "colorSpace", "Landroidx/compose/ui/graphics/colorspace/ColorSpace;", "getColorSpace$annotations", "getColorSpace-impl", "(J)Landroidx/compose/ui/graphics/colorspace/ColorSpace;", "green", "getGreen$annotations", "getGreen-impl", "red", "getRed$annotations", "getRed-impl", "getValue-s-VKNKU", "()J", "J", "component1", "component1-impl", "component2", "component2-impl", "component3", "component3-impl", "component4", "component4-impl", "component5", "component5-impl", "convert", "convert-vNxB06k", "(JLandroidx/compose/ui/graphics/colorspace/ColorSpace;)J", "copy", "copy-wmQWz5c", "(JFFFF)J", "equals", "", "other", "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", "", "hashCode-impl", "(J)I", "toString", "", "toString-impl", "(J)Ljava/lang/String;", "Companion", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class Color {
    private final long value;
    public static final Companion Companion = new Companion(null);
    private static final long Black = ColorKt.Color(4278190080L);
    private static final long DarkGray = ColorKt.Color(4282664004L);
    private static final long Gray = ColorKt.Color(4287137928L);
    private static final long LightGray = ColorKt.Color(4291611852L);
    private static final long White = ColorKt.Color(4294967295L);
    private static final long Red = ColorKt.Color(4294901760L);
    private static final long Green = ColorKt.Color(4278255360L);
    private static final long Blue = ColorKt.Color(4278190335L);
    private static final long Yellow = ColorKt.Color(4294967040L);
    private static final long Cyan = ColorKt.Color(4278255615L);
    private static final long Magenta = ColorKt.Color(4294902015L);
    private static final long Transparent = ColorKt.Color(0);
    private static final long Unspecified = ColorKt.Color(0.0f, 0.0f, 0.0f, 0.0f, ColorSpaces.INSTANCE.getUnspecified$ui_graphics_release());

    /* renamed from: box-impl */
    public static final /* synthetic */ Color m4279boximpl(long j) {
        return new Color(j);
    }

    /* renamed from: constructor-impl */
    public static long m4285constructorimpl(long j) {
        return j;
    }

    /* renamed from: equals-impl */
    public static boolean m4289equalsimpl(long j, Object obj) {
        return (obj instanceof Color) && j == ((Color) obj).m4299unboximpl();
    }

    /* renamed from: equals-impl0 */
    public static final boolean m4290equalsimpl0(long j, long j2) {
        return ULong.m7522equalsimpl0(j, j2);
    }

    public static /* synthetic */ void getAlpha$annotations() {
    }

    public static /* synthetic */ void getBlue$annotations() {
    }

    public static /* synthetic */ void getColorSpace$annotations() {
    }

    public static /* synthetic */ void getGreen$annotations() {
    }

    public static /* synthetic */ void getRed$annotations() {
    }

    /* renamed from: hashCode-impl */
    public static int m4296hashCodeimpl(long j) {
        return ULong.m7527hashCodeimpl(j);
    }

    public boolean equals(Object obj) {
        return m4289equalsimpl(this.value, obj);
    }

    public int hashCode() {
        return m4296hashCodeimpl(this.value);
    }

    /* renamed from: unbox-impl */
    public final /* synthetic */ long m4299unboximpl() {
        return this.value;
    }

    private /* synthetic */ Color(long value) {
        this.value = value;
    }

    /* renamed from: getValue-s-VKNKU */
    public final long m4298getValuesVKNKU() {
        return this.value;
    }

    /* renamed from: getColorSpace-impl */
    public static final ColorSpace m4293getColorSpaceimpl(long arg0) {
        ColorSpaces this_$iv = ColorSpaces.INSTANCE;
        int id$iv = (int) ULong.m7515constructorimpl(63 & arg0);
        return this_$iv.getColorSpacesArray$ui_graphics_release()[id$iv];
    }

    /* renamed from: convert-vNxB06k */
    public static final long m4286convertvNxB06k(long arg0, ColorSpace colorSpace) {
        Connector connector = ColorSpaceKt.m4708connectYBCOT_4$default(m4293getColorSpaceimpl(arg0), colorSpace, 0, 2, null);
        return connector.mo4711transformToColorl2rxGTc$ui_graphics_release(arg0);
    }

    /* renamed from: getRed-impl */
    public static final float m4295getRedimpl(long arg0) {
        if (ULong.m7515constructorimpl(63 & arg0) == 0) {
            return ((float) UnsignedKt.ulongToDouble(ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 48) & 255))) / 255.0f;
        }
        short h$iv = (short) ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 48) & WebSocketProtocol.PAYLOAD_SHORT_MAX);
        int bits$iv = 65535 & h$iv;
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

    /* renamed from: getGreen-impl */
    public static final float m4294getGreenimpl(long arg0) {
        if (ULong.m7515constructorimpl(63 & arg0) == 0) {
            return ((float) UnsignedKt.ulongToDouble(ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 40) & 255))) / 255.0f;
        }
        short h$iv = (short) ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 32) & WebSocketProtocol.PAYLOAD_SHORT_MAX);
        int bits$iv = 65535 & h$iv;
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

    /* renamed from: getBlue-impl */
    public static final float m4292getBlueimpl(long arg0) {
        if (ULong.m7515constructorimpl(63 & arg0) == 0) {
            return ((float) UnsignedKt.ulongToDouble(ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 32) & 255))) / 255.0f;
        }
        short h$iv = (short) ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 16) & WebSocketProtocol.PAYLOAD_SHORT_MAX);
        int bits$iv = 65535 & h$iv;
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

    /* renamed from: getAlpha-impl */
    public static final float m4291getAlphaimpl(long arg0) {
        if (ULong.m7515constructorimpl(63 & arg0) == 0) {
            return ((float) UnsignedKt.ulongToDouble(ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 56) & 255))) / 255.0f;
        }
        return ((float) UnsignedKt.ulongToDouble(ULong.m7515constructorimpl(ULong.m7515constructorimpl(arg0 >>> 6) & 1023))) / 1023.0f;
    }

    /* renamed from: component1-impl */
    public static final float m4280component1impl(long arg0) {
        return m4295getRedimpl(arg0);
    }

    /* renamed from: component2-impl */
    public static final float m4281component2impl(long arg0) {
        return m4294getGreenimpl(arg0);
    }

    /* renamed from: component3-impl */
    public static final float m4282component3impl(long arg0) {
        return m4292getBlueimpl(arg0);
    }

    /* renamed from: component4-impl */
    public static final float m4283component4impl(long arg0) {
        return m4291getAlphaimpl(arg0);
    }

    /* renamed from: component5-impl */
    public static final ColorSpace m4284component5impl(long arg0) {
        return m4293getColorSpaceimpl(arg0);
    }

    /* renamed from: copy-wmQWz5c */
    public static final long m4287copywmQWz5c(long arg0, float alpha, float red, float green, float blue) {
        return ColorKt.Color(red, green, blue, alpha, m4293getColorSpaceimpl(arg0));
    }

    public String toString() {
        return m4297toStringimpl(this.value);
    }

    /* renamed from: toString-impl */
    public static String m4297toStringimpl(long arg0) {
        return "Color(" + m4295getRedimpl(arg0) + ", " + m4294getGreenimpl(arg0) + ", " + m4292getBlueimpl(arg0) + ", " + m4291getAlphaimpl(arg0) + ", " + m4293getColorSpaceimpl(arg0).getName() + ')';
    }

    /* compiled from: Color.kt */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b*\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\t\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J?\u0010-\u001a\u00020\u00042\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020/2\u0006\u00101\u001a\u00020/2\b\b\u0002\u00102\u001a\u00020/2\b\b\u0002\u00103\u001a\u000204ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b5\u00106J(\u00107\u001a\u00020/2\u0006\u00108\u001a\u0002092\u0006\u0010:\u001a\u00020/2\u0006\u0010;\u001a\u00020/2\u0006\u0010<\u001a\u00020/H\u0002J?\u0010=\u001a\u00020\u00042\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020/2\u0006\u0010>\u001a\u00020/2\b\b\u0002\u00102\u001a\u00020/2\b\b\u0002\u00103\u001a\u000204ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b?\u00106J(\u0010@\u001a\u00020/2\u0006\u00108\u001a\u0002092\u0006\u0010:\u001a\u00020/2\u0006\u0010;\u001a\u00020/2\u0006\u0010A\u001a\u00020/H\u0002R$\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u0005\u0010\u0002\u001a\u0004\b\u0006\u0010\u0007R$\u0010\t\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\n\u0010\u0002\u001a\u0004\b\u000b\u0010\u0007R$\u0010\f\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\r\u0010\u0002\u001a\u0004\b\u000e\u0010\u0007R$\u0010\u000f\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u0010\u0010\u0002\u001a\u0004\b\u0011\u0010\u0007R$\u0010\u0012\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u0013\u0010\u0002\u001a\u0004\b\u0014\u0010\u0007R$\u0010\u0015\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u0016\u0010\u0002\u001a\u0004\b\u0017\u0010\u0007R$\u0010\u0018\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u0019\u0010\u0002\u001a\u0004\b\u001a\u0010\u0007R$\u0010\u001b\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u001c\u0010\u0002\u001a\u0004\b\u001d\u0010\u0007R$\u0010\u001e\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u001f\u0010\u0002\u001a\u0004\b \u0010\u0007R$\u0010!\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\"\u0010\u0002\u001a\u0004\b#\u0010\u0007R$\u0010$\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b%\u0010\u0002\u001a\u0004\b&\u0010\u0007R$\u0010'\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b(\u0010\u0002\u001a\u0004\b)\u0010\u0007R$\u0010*\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b+\u0010\u0002\u001a\u0004\b,\u0010\u0007\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006B"}, d2 = {"Landroidx/compose/ui/graphics/Color$Companion;", "", "()V", "Black", "Landroidx/compose/ui/graphics/Color;", "getBlack-0d7_KjU$annotations", "getBlack-0d7_KjU", "()J", "J", "Blue", "getBlue-0d7_KjU$annotations", "getBlue-0d7_KjU", "Cyan", "getCyan-0d7_KjU$annotations", "getCyan-0d7_KjU", "DarkGray", "getDarkGray-0d7_KjU$annotations", "getDarkGray-0d7_KjU", "Gray", "getGray-0d7_KjU$annotations", "getGray-0d7_KjU", "Green", "getGreen-0d7_KjU$annotations", "getGreen-0d7_KjU", "LightGray", "getLightGray-0d7_KjU$annotations", "getLightGray-0d7_KjU", "Magenta", "getMagenta-0d7_KjU$annotations", "getMagenta-0d7_KjU", "Red", "getRed-0d7_KjU$annotations", "getRed-0d7_KjU", "Transparent", "getTransparent-0d7_KjU$annotations", "getTransparent-0d7_KjU", "Unspecified", "getUnspecified-0d7_KjU$annotations", "getUnspecified-0d7_KjU", "White", "getWhite-0d7_KjU$annotations", "getWhite-0d7_KjU", "Yellow", "getYellow-0d7_KjU$annotations", "getYellow-0d7_KjU", "hsl", "hue", "", "saturation", "lightness", "alpha", "colorSpace", "Landroidx/compose/ui/graphics/colorspace/Rgb;", "hsl-JlNiLsg", "(FFFFLandroidx/compose/ui/graphics/colorspace/Rgb;)J", "hslToRgbComponent", "n", "", "h", "s", "l", "hsv", "value", "hsv-JlNiLsg", "hsvToRgbComponent", "v", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* renamed from: getBlack-0d7_KjU$annotations */
        public static /* synthetic */ void m4300getBlack0d7_KjU$annotations() {
        }

        /* renamed from: getBlue-0d7_KjU$annotations */
        public static /* synthetic */ void m4301getBlue0d7_KjU$annotations() {
        }

        /* renamed from: getCyan-0d7_KjU$annotations */
        public static /* synthetic */ void m4302getCyan0d7_KjU$annotations() {
        }

        /* renamed from: getDarkGray-0d7_KjU$annotations */
        public static /* synthetic */ void m4303getDarkGray0d7_KjU$annotations() {
        }

        /* renamed from: getGray-0d7_KjU$annotations */
        public static /* synthetic */ void m4304getGray0d7_KjU$annotations() {
        }

        /* renamed from: getGreen-0d7_KjU$annotations */
        public static /* synthetic */ void m4305getGreen0d7_KjU$annotations() {
        }

        /* renamed from: getLightGray-0d7_KjU$annotations */
        public static /* synthetic */ void m4306getLightGray0d7_KjU$annotations() {
        }

        /* renamed from: getMagenta-0d7_KjU$annotations */
        public static /* synthetic */ void m4307getMagenta0d7_KjU$annotations() {
        }

        /* renamed from: getRed-0d7_KjU$annotations */
        public static /* synthetic */ void m4308getRed0d7_KjU$annotations() {
        }

        /* renamed from: getTransparent-0d7_KjU$annotations */
        public static /* synthetic */ void m4309getTransparent0d7_KjU$annotations() {
        }

        /* renamed from: getUnspecified-0d7_KjU$annotations */
        public static /* synthetic */ void m4310getUnspecified0d7_KjU$annotations() {
        }

        /* renamed from: getWhite-0d7_KjU$annotations */
        public static /* synthetic */ void m4311getWhite0d7_KjU$annotations() {
        }

        /* renamed from: getYellow-0d7_KjU$annotations */
        public static /* synthetic */ void m4312getYellow0d7_KjU$annotations() {
        }

        private Companion() {
        }

        /* renamed from: getBlack-0d7_KjU */
        public final long m4315getBlack0d7_KjU() {
            return Color.Black;
        }

        /* renamed from: getDarkGray-0d7_KjU */
        public final long m4318getDarkGray0d7_KjU() {
            return Color.DarkGray;
        }

        /* renamed from: getGray-0d7_KjU */
        public final long m4319getGray0d7_KjU() {
            return Color.Gray;
        }

        /* renamed from: getLightGray-0d7_KjU */
        public final long m4321getLightGray0d7_KjU() {
            return Color.LightGray;
        }

        /* renamed from: getWhite-0d7_KjU */
        public final long m4326getWhite0d7_KjU() {
            return Color.White;
        }

        /* renamed from: getRed-0d7_KjU */
        public final long m4323getRed0d7_KjU() {
            return Color.Red;
        }

        /* renamed from: getGreen-0d7_KjU */
        public final long m4320getGreen0d7_KjU() {
            return Color.Green;
        }

        /* renamed from: getBlue-0d7_KjU */
        public final long m4316getBlue0d7_KjU() {
            return Color.Blue;
        }

        /* renamed from: getYellow-0d7_KjU */
        public final long m4327getYellow0d7_KjU() {
            return Color.Yellow;
        }

        /* renamed from: getCyan-0d7_KjU */
        public final long m4317getCyan0d7_KjU() {
            return Color.Cyan;
        }

        /* renamed from: getMagenta-0d7_KjU */
        public final long m4322getMagenta0d7_KjU() {
            return Color.Magenta;
        }

        /* renamed from: getTransparent-0d7_KjU */
        public final long m4324getTransparent0d7_KjU() {
            return Color.Transparent;
        }

        /* renamed from: getUnspecified-0d7_KjU */
        public final long m4325getUnspecified0d7_KjU() {
            return Color.Unspecified;
        }

        /* renamed from: hsv-JlNiLsg$default */
        public static /* synthetic */ long m4314hsvJlNiLsg$default(Companion companion, float f, float f2, float f3, float f4, Rgb rgb, int i, Object obj) {
            float f5;
            Rgb rgb2;
            if ((i & 8) == 0) {
                f5 = f4;
            } else {
                f5 = 1.0f;
            }
            if ((i & 16) == 0) {
                rgb2 = rgb;
            } else {
                rgb2 = ColorSpaces.INSTANCE.getSrgb();
            }
            return companion.m4329hsvJlNiLsg(f, f2, f3, f5, rgb2);
        }

        /* renamed from: hsv-JlNiLsg */
        public final long m4329hsvJlNiLsg(float hue, float saturation, float value, float alpha, Rgb colorSpace) {
            boolean value$iv = false;
            if (0.0f <= hue && hue <= 360.0f) {
                if (0.0f <= saturation && saturation <= 1.0f) {
                    if (0.0f <= value && value <= 1.0f) {
                        value$iv = true;
                    }
                }
            }
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalArgumentException("HSV (" + hue + ", " + saturation + ", " + value + ") must be in range (0..360, 0..1, 0..1)");
            }
            float red = hsvToRgbComponent(5, hue, saturation, value);
            float green = hsvToRgbComponent(3, hue, saturation, value);
            float blue = hsvToRgbComponent(1, hue, saturation, value);
            return ColorKt.Color(red, green, blue, alpha, colorSpace);
        }

        private final float hsvToRgbComponent(int n, float h, float s, float v) {
            float k = (n + (h / 60.0f)) % 6.0f;
            return v - ((v * s) * Math.max(0.0f, Math.min(k, Math.min(4.0f - k, 1.0f))));
        }

        /* renamed from: hsl-JlNiLsg$default */
        public static /* synthetic */ long m4313hslJlNiLsg$default(Companion companion, float f, float f2, float f3, float f4, Rgb rgb, int i, Object obj) {
            float f5;
            Rgb rgb2;
            if ((i & 8) == 0) {
                f5 = f4;
            } else {
                f5 = 1.0f;
            }
            if ((i & 16) == 0) {
                rgb2 = rgb;
            } else {
                rgb2 = ColorSpaces.INSTANCE.getSrgb();
            }
            return companion.m4328hslJlNiLsg(f, f2, f3, f5, rgb2);
        }

        /* JADX WARN: Code restructure failed: missing block: B:52:0x002c, code lost:
            if ((0.0f <= r9 && r9 <= 1.0f) != false) goto L19;
         */
        /* renamed from: hsl-JlNiLsg */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final long m4328hslJlNiLsg(float r7, float r8, float r9, float r10, androidx.compose.ui.graphics.colorspace.Rgb r11) {
            /*
                r6 = this;
                r0 = 0
                int r1 = (r0 > r7 ? 1 : (r0 == r7 ? 0 : -1))
                r2 = 1
                r3 = 0
                if (r1 > 0) goto Lf
                r1 = 1135869952(0x43b40000, float:360.0)
                int r1 = (r7 > r1 ? 1 : (r7 == r1 ? 0 : -1))
                if (r1 > 0) goto Lf
                r1 = r2
                goto L10
            Lf:
                r1 = r3
            L10:
                if (r1 == 0) goto L2f
                int r1 = (r0 > r8 ? 1 : (r0 == r8 ? 0 : -1))
                r4 = 1065353216(0x3f800000, float:1.0)
                if (r1 > 0) goto L1e
                int r1 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
                if (r1 > 0) goto L1e
                r1 = r2
                goto L1f
            L1e:
                r1 = r3
            L1f:
                if (r1 == 0) goto L2f
                int r0 = (r0 > r9 ? 1 : (r0 == r9 ? 0 : -1))
                if (r0 > 0) goto L2b
                int r0 = (r9 > r4 ? 1 : (r9 == r4 ? 0 : -1))
                if (r0 > 0) goto L2b
                r0 = r2
                goto L2c
            L2b:
                r0 = r3
            L2c:
                if (r0 == 0) goto L2f
                goto L30
            L2f:
                r2 = r3
            L30:
                r0 = 0
                if (r2 != 0) goto L63
                r1 = 0
                java.lang.StringBuilder r4 = new java.lang.StringBuilder
                r4.<init>()
                java.lang.String r5 = "HSL ("
                java.lang.StringBuilder r4 = r4.append(r5)
                java.lang.StringBuilder r4 = r4.append(r7)
                java.lang.String r5 = ", "
                java.lang.StringBuilder r4 = r4.append(r5)
                java.lang.StringBuilder r4 = r4.append(r8)
                java.lang.StringBuilder r4 = r4.append(r5)
                java.lang.StringBuilder r4 = r4.append(r9)
                java.lang.String r5 = ") must be in range (0..360, 0..1, 0..1)"
                java.lang.StringBuilder r4 = r4.append(r5)
                java.lang.String r1 = r4.toString()
                androidx.compose.ui.graphics.InlineClassHelperKt.throwIllegalArgumentException(r1)
            L63:
                float r0 = r6.hslToRgbComponent(r3, r7, r8, r9)
                r1 = 8
                float r1 = r6.hslToRgbComponent(r1, r7, r8, r9)
                r2 = 4
                float r2 = r6.hslToRgbComponent(r2, r7, r8, r9)
                r3 = r11
                androidx.compose.ui.graphics.colorspace.ColorSpace r3 = (androidx.compose.ui.graphics.colorspace.ColorSpace) r3
                long r3 = androidx.compose.ui.graphics.ColorKt.Color(r0, r1, r2, r10, r3)
                return r3
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.Color.Companion.m4328hslJlNiLsg(float, float, float, float, androidx.compose.ui.graphics.colorspace.Rgb):long");
        }

        private final float hslToRgbComponent(int n, float h, float s, float l) {
            float k = (n + (h / 30.0f)) % 12.0f;
            float a = Math.min(l, 1.0f - l) * s;
            return l - (Math.max(-1.0f, Math.min(k - 3.0f, Math.min(9.0f - k, 1.0f))) * a);
        }
    }
}
