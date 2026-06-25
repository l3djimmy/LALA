package androidx.compose.ui.unit;

import kotlin.Metadata;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: Dp.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 &2\u00020\u0001:\u0001&B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J$\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\u000e\u001a\u00020\tø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u001aHÖ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u001b\u0010\u001d\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u0000H\u0087\u0002ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001fJ\u001b\u0010 \u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u0000H\u0087\u0002ø\u0001\u0000¢\u0006\u0004\b!\u0010\u001fJ\u000f\u0010\"\u001a\u00020#H\u0017¢\u0006\u0004\b$\u0010%R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R \u0010\b\u001a\u00020\t8FX\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\f\u0012\u0004\b\n\u0010\u000b\u001a\u0004\b\f\u0010\rR \u0010\u000e\u001a\u00020\t8FX\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\f\u0012\u0004\b\u000f\u0010\u000b\u001a\u0004\b\u0010\u0010\r\u0088\u0001\u0002\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006'"}, d2 = {"Landroidx/compose/ui/unit/DpOffset;", "", "packedValue", "", "constructor-impl", "(J)J", "getPackedValue", "()J", "x", "Landroidx/compose/ui/unit/Dp;", "getX-D9Ej5fM$annotations", "()V", "getX-D9Ej5fM", "(J)F", "y", "getY-D9Ej5fM$annotations", "getY-D9Ej5fM", "copy", "copy-tPigGR8", "(JFF)J", "equals", "", "other", "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", "", "hashCode-impl", "(J)I", "minus", "minus-CB-Mgk4", "(JJ)J", "plus", "plus-CB-Mgk4", "toString", "", "toString-impl", "(J)Ljava/lang/String;", "Companion", "ui-unit_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class DpOffset {
    private final long packedValue;
    public static final Companion Companion = new Companion(null);
    private static final long Zero = m6929constructorimpl(0);
    private static final long Unspecified = m6929constructorimpl(androidx.compose.ui.geometry.InlineClassHelperKt.UnspecifiedPackedFloats);

    /* renamed from: box-impl  reason: not valid java name */
    public static final /* synthetic */ DpOffset m6928boximpl(long j) {
        return new DpOffset(j);
    }

    /* renamed from: constructor-impl  reason: not valid java name */
    public static long m6929constructorimpl(long j) {
        return j;
    }

    /* renamed from: equals-impl  reason: not valid java name */
    public static boolean m6932equalsimpl(long j, Object obj) {
        return (obj instanceof DpOffset) && j == ((DpOffset) obj).m6942unboximpl();
    }

    /* renamed from: equals-impl0  reason: not valid java name */
    public static final boolean m6933equalsimpl0(long j, long j2) {
        return j == j2;
    }

    /* renamed from: getX-D9Ej5fM$annotations  reason: not valid java name */
    public static /* synthetic */ void m6935getXD9Ej5fM$annotations() {
    }

    /* renamed from: getY-D9Ej5fM$annotations  reason: not valid java name */
    public static /* synthetic */ void m6937getYD9Ej5fM$annotations() {
    }

    /* renamed from: hashCode-impl  reason: not valid java name */
    public static int m6938hashCodeimpl(long j) {
        return Long.hashCode(j);
    }

    public boolean equals(Object obj) {
        return m6932equalsimpl(this.packedValue, obj);
    }

    public int hashCode() {
        return m6938hashCodeimpl(this.packedValue);
    }

    /* renamed from: unbox-impl  reason: not valid java name */
    public final /* synthetic */ long m6942unboximpl() {
        return this.packedValue;
    }

    private /* synthetic */ DpOffset(long packedValue) {
        this.packedValue = packedValue;
    }

    public final long getPackedValue() {
        return this.packedValue;
    }

    /* renamed from: getX-D9Ej5fM  reason: not valid java name */
    public static final float m6934getXD9Ej5fM(long arg0) {
        int bits$iv$iv = (int) (arg0 >> 32);
        float $this$dp$iv = Float.intBitsToFloat(bits$iv$iv);
        return Dp.m6873constructorimpl($this$dp$iv);
    }

    /* renamed from: getY-D9Ej5fM  reason: not valid java name */
    public static final float m6936getYD9Ej5fM(long arg0) {
        int bits$iv$iv = (int) (4294967295L & arg0);
        float $this$dp$iv = Float.intBitsToFloat(bits$iv$iv);
        return Dp.m6873constructorimpl($this$dp$iv);
    }

    /* renamed from: copy-tPigGR8  reason: not valid java name */
    public static final long m6930copytPigGR8(long arg0, float x, float y) {
        long v1$iv = Float.floatToRawIntBits(x);
        long v2$iv = Float.floatToRawIntBits(y);
        return m6929constructorimpl((v1$iv << 32) | (4294967295L & v2$iv));
    }

    /* renamed from: copy-tPigGR8$default  reason: not valid java name */
    public static /* synthetic */ long m6931copytPigGR8$default(long j, float f, float f2, int i, Object obj) {
        if ((i & 1) != 0) {
            f = m6934getXD9Ej5fM(j);
        }
        if ((i & 2) != 0) {
            f2 = m6936getYD9Ej5fM(j);
        }
        return m6930copytPigGR8(j, f, f2);
    }

    /* renamed from: minus-CB-Mgk4  reason: not valid java name */
    public static final long m6939minusCBMgk4(long arg0, long other) {
        float arg0$iv = m6934getXD9Ej5fM(arg0);
        float other$iv = m6934getXD9Ej5fM(other);
        float arg0$iv2 = Dp.m6873constructorimpl(arg0$iv - other$iv);
        float arg0$iv3 = m6936getYD9Ej5fM(arg0);
        float other$iv2 = m6936getYD9Ej5fM(other);
        float arg0$iv4 = Dp.m6873constructorimpl(arg0$iv3 - other$iv2);
        long v1$iv = Float.floatToRawIntBits(arg0$iv2);
        long v2$iv = Float.floatToRawIntBits(arg0$iv4);
        return m6929constructorimpl((v1$iv << 32) | (4294967295L & v2$iv));
    }

    /* renamed from: plus-CB-Mgk4  reason: not valid java name */
    public static final long m6940plusCBMgk4(long arg0, long other) {
        float arg0$iv = m6934getXD9Ej5fM(arg0);
        float other$iv = m6934getXD9Ej5fM(other);
        float arg0$iv2 = Dp.m6873constructorimpl(arg0$iv + other$iv);
        float arg0$iv3 = m6936getYD9Ej5fM(arg0);
        float other$iv2 = m6936getYD9Ej5fM(other);
        float arg0$iv4 = Dp.m6873constructorimpl(arg0$iv3 + other$iv2);
        long v1$iv = Float.floatToRawIntBits(arg0$iv2);
        long v2$iv = Float.floatToRawIntBits(arg0$iv4);
        return m6929constructorimpl((v1$iv << 32) | (4294967295L & v2$iv));
    }

    public String toString() {
        return m6941toStringimpl(this.packedValue);
    }

    /* renamed from: toString-impl  reason: not valid java name */
    public static String m6941toStringimpl(long arg0) {
        if (arg0 != androidx.compose.ui.geometry.InlineClassHelperKt.UnspecifiedPackedFloats) {
            return '(' + ((Object) Dp.m6884toStringimpl(m6934getXD9Ej5fM(arg0))) + ", " + ((Object) Dp.m6884toStringimpl(m6936getYD9Ej5fM(arg0))) + ')';
        }
        return "DpOffset.Unspecified";
    }

    /* compiled from: Dp.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0019\u0010\u0003\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0005\u0010\u0006R\u0019\u0010\b\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\t\u0010\u0006\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\n"}, d2 = {"Landroidx/compose/ui/unit/DpOffset$Companion;", "", "()V", "Unspecified", "Landroidx/compose/ui/unit/DpOffset;", "getUnspecified-RKDOV3M", "()J", "J", "Zero", "getZero-RKDOV3M", "ui-unit_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* renamed from: getZero-RKDOV3M  reason: not valid java name */
        public final long m6944getZeroRKDOV3M() {
            return DpOffset.Zero;
        }

        /* renamed from: getUnspecified-RKDOV3M  reason: not valid java name */
        public final long m6943getUnspecifiedRKDOV3M() {
            return DpOffset.Unspecified;
        }
    }
}
