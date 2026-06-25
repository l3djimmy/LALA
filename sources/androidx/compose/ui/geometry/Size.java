package androidx.compose.ui.geometry;

import androidx.collection.SieveCacheKt;
import kotlin.Metadata;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: Size.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u001b\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0087@\u0018\u0000 42\u00020\u0001:\u00014B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0017\u001a\u00020\u0007H\u0087\n¢\u0006\u0004\b\u0018\u0010\u000bJ\u0010\u0010\u0019\u001a\u00020\u0007H\u0087\n¢\u0006\u0004\b\u001a\u0010\u000bJ'\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0014\u001a\u00020\u00072\b\b\u0002\u0010\u0006\u001a\u00020\u0007ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u001e\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0007H\u0087\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b \u0010!J\u001a\u0010\"\u001a\u00020#2\b\u0010$\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020(HÖ\u0001¢\u0006\u0004\b)\u0010*J\u000f\u0010+\u001a\u00020#H\u0007¢\u0006\u0004\b,\u0010-J\u001e\u0010.\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0007H\u0087\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b/\u0010!J\u000f\u00100\u001a\u000201H\u0016¢\u0006\u0004\b2\u00103R\u001b\u0010\u0006\u001a\u00020\u00078Æ\u0002X\u0087\u0004¢\u0006\f\u0012\u0004\b\b\u0010\t\u001a\u0004\b\n\u0010\u000bR\u001a\u0010\f\u001a\u00020\u00078FX\u0087\u0004¢\u0006\f\u0012\u0004\b\r\u0010\t\u001a\u0004\b\u000e\u0010\u000bR\u001a\u0010\u000f\u001a\u00020\u00078FX\u0087\u0004¢\u0006\f\u0012\u0004\b\u0010\u0010\t\u001a\u0004\b\u0011\u0010\u000bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u001b\u0010\u0014\u001a\u00020\u00078Æ\u0002X\u0087\u0004¢\u0006\f\u0012\u0004\b\u0015\u0010\t\u001a\u0004\b\u0016\u0010\u000b\u0088\u0001\u0002\u0082\u0002\u000b\n\u0002\b!\n\u0005\b¡\u001e0\u0001¨\u00065"}, d2 = {"Landroidx/compose/ui/geometry/Size;", "", "packedValue", "", "constructor-impl", "(J)J", "height", "", "getHeight$annotations", "()V", "getHeight-impl", "(J)F", "maxDimension", "getMaxDimension$annotations", "getMaxDimension-impl", "minDimension", "getMinDimension$annotations", "getMinDimension-impl", "getPackedValue", "()J", "width", "getWidth$annotations", "getWidth-impl", "component1", "component1-impl", "component2", "component2-impl", "copy", "copy-xjbvk4A", "(JFF)J", "div", "operand", "div-7Ah8Wj8", "(JF)J", "equals", "", "other", "equals-impl", "(JLjava/lang/Object;)Z", "hashCode", "", "hashCode-impl", "(J)I", "isEmpty", "isEmpty-impl", "(J)Z", "times", "times-7Ah8Wj8", "toString", "", "toString-impl", "(J)Ljava/lang/String;", "Companion", "ui-geometry"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class Size {
    private final long packedValue;
    public static final Companion Companion = new Companion(null);
    private static final long Zero = m4108constructorimpl(0);
    private static final long Unspecified = m4108constructorimpl(InlineClassHelperKt.UnspecifiedPackedFloats);

    /* renamed from: box-impl  reason: not valid java name */
    public static final /* synthetic */ Size m4105boximpl(long j) {
        return new Size(j);
    }

    /* renamed from: constructor-impl  reason: not valid java name */
    public static long m4108constructorimpl(long j) {
        return j;
    }

    /* renamed from: equals-impl  reason: not valid java name */
    public static boolean m4112equalsimpl(long j, Object obj) {
        return (obj instanceof Size) && j == ((Size) obj).m4122unboximpl();
    }

    /* renamed from: equals-impl0  reason: not valid java name */
    public static final boolean m4113equalsimpl0(long j, long j2) {
        return j == j2;
    }

    public static /* synthetic */ void getHeight$annotations() {
    }

    public static /* synthetic */ void getMaxDimension$annotations() {
    }

    public static /* synthetic */ void getMinDimension$annotations() {
    }

    public static /* synthetic */ void getWidth$annotations() {
    }

    /* renamed from: hashCode-impl  reason: not valid java name */
    public static int m4118hashCodeimpl(long j) {
        return Long.hashCode(j);
    }

    public boolean equals(Object obj) {
        return m4112equalsimpl(this.packedValue, obj);
    }

    public int hashCode() {
        return m4118hashCodeimpl(this.packedValue);
    }

    /* renamed from: unbox-impl  reason: not valid java name */
    public final /* synthetic */ long m4122unboximpl() {
        return this.packedValue;
    }

    private /* synthetic */ Size(long packedValue) {
        this.packedValue = packedValue;
    }

    public final long getPackedValue() {
        return this.packedValue;
    }

    /* renamed from: getWidth-impl  reason: not valid java name */
    public static final float m4117getWidthimpl(long arg0) {
        int bits$iv$iv = (int) (arg0 >> 32);
        return Float.intBitsToFloat(bits$iv$iv);
    }

    /* renamed from: getHeight-impl  reason: not valid java name */
    public static final float m4114getHeightimpl(long arg0) {
        int bits$iv$iv = (int) (4294967295L & arg0);
        return Float.intBitsToFloat(bits$iv$iv);
    }

    /* renamed from: component1-impl  reason: not valid java name */
    public static final float m4106component1impl(long arg0) {
        int bits$iv$iv$iv = (int) (arg0 >> 32);
        return Float.intBitsToFloat(bits$iv$iv$iv);
    }

    /* renamed from: component2-impl  reason: not valid java name */
    public static final float m4107component2impl(long arg0) {
        int bits$iv$iv$iv = (int) (4294967295L & arg0);
        return Float.intBitsToFloat(bits$iv$iv$iv);
    }

    /* renamed from: copy-xjbvk4A$default  reason: not valid java name */
    public static /* synthetic */ long m4110copyxjbvk4A$default(long value$iv, float f, float f2, int i, Object obj) {
        if ((i & 1) != 0) {
            int bits$iv$iv = (int) (value$iv >> 32);
            f = Float.intBitsToFloat(bits$iv$iv);
        }
        if ((i & 2) != 0) {
            int bits$iv$iv2 = (int) (4294967295L & value$iv);
            f2 = Float.intBitsToFloat(bits$iv$iv2);
        }
        return m4109copyxjbvk4A(value$iv, f, f2);
    }

    /* renamed from: copy-xjbvk4A  reason: not valid java name */
    public static final long m4109copyxjbvk4A(long arg0, float width, float height) {
        long v1$iv = Float.floatToRawIntBits(width);
        long v2$iv = Float.floatToRawIntBits(height);
        return m4108constructorimpl((v1$iv << 32) | (4294967295L & v2$iv));
    }

    /* compiled from: Size.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R$\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\u0005\u0010\u0002\u001a\u0004\b\u0006\u0010\u0007R$\u0010\t\u001a\u00020\u00048\u0006X\u0087\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u0012\u0004\b\n\u0010\u0002\u001a\u0004\b\u000b\u0010\u0007\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\f"}, d2 = {"Landroidx/compose/ui/geometry/Size$Companion;", "", "()V", "Unspecified", "Landroidx/compose/ui/geometry/Size;", "getUnspecified-NH-jbRc$annotations", "getUnspecified-NH-jbRc", "()J", "J", "Zero", "getZero-NH-jbRc$annotations", "getZero-NH-jbRc", "ui-geometry"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* renamed from: getUnspecified-NH-jbRc$annotations  reason: not valid java name */
        public static /* synthetic */ void m4123getUnspecifiedNHjbRc$annotations() {
        }

        /* renamed from: getZero-NH-jbRc$annotations  reason: not valid java name */
        public static /* synthetic */ void m4124getZeroNHjbRc$annotations() {
        }

        private Companion() {
        }

        /* renamed from: getZero-NH-jbRc  reason: not valid java name */
        public final long m4126getZeroNHjbRc() {
            return Size.Zero;
        }

        /* renamed from: getUnspecified-NH-jbRc  reason: not valid java name */
        public final long m4125getUnspecifiedNHjbRc() {
            return Size.Unspecified;
        }
    }

    /* renamed from: isEmpty-impl  reason: not valid java name */
    public static final boolean m4119isEmptyimpl(long arg0) {
        long v = (~((((-9223372034707292160L) & arg0) >>> 31) * (-1))) & arg0;
        long w = (v >>> 32) & 4294967295L & v;
        return (w == 0) | (arg0 == InlineClassHelperKt.UnspecifiedPackedFloats);
    }

    /* renamed from: times-7Ah8Wj8  reason: not valid java name */
    public static final long m4120times7Ah8Wj8(long arg0, float operand) {
        int bits$iv$iv = (int) (arg0 >> 32);
        float val1$iv = Float.intBitsToFloat(bits$iv$iv) * operand;
        int bits$iv$iv2 = (int) (arg0 & 4294967295L);
        float val2$iv = Float.intBitsToFloat(bits$iv$iv2) * operand;
        long v1$iv = Float.floatToRawIntBits(val1$iv);
        long v2$iv = Float.floatToRawIntBits(val2$iv);
        return m4108constructorimpl((v1$iv << 32) | (4294967295L & v2$iv));
    }

    /* renamed from: div-7Ah8Wj8  reason: not valid java name */
    public static final long m4111div7Ah8Wj8(long arg0, float operand) {
        int bits$iv$iv = (int) (arg0 >> 32);
        float val1$iv = Float.intBitsToFloat(bits$iv$iv) / operand;
        int bits$iv$iv2 = (int) (arg0 & 4294967295L);
        float val2$iv = Float.intBitsToFloat(bits$iv$iv2) / operand;
        long v1$iv = Float.floatToRawIntBits(val1$iv);
        long v2$iv = Float.floatToRawIntBits(val2$iv);
        return m4108constructorimpl((v1$iv << 32) | (4294967295L & v2$iv));
    }

    /* renamed from: getMinDimension-impl  reason: not valid java name */
    public static final float m4116getMinDimensionimpl(long arg0) {
        int bits$iv$iv = (int) ((arg0 >> 32) & SieveCacheKt.NodeLinkMask);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv);
        int bits$iv$iv2 = (int) (arg0 & SieveCacheKt.NodeLinkMask);
        return Math.min(intBitsToFloat, Float.intBitsToFloat(bits$iv$iv2));
    }

    /* renamed from: getMaxDimension-impl  reason: not valid java name */
    public static final float m4115getMaxDimensionimpl(long arg0) {
        int bits$iv$iv = (int) ((arg0 >> 32) & SieveCacheKt.NodeLinkMask);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv);
        int bits$iv$iv2 = (int) (arg0 & SieveCacheKt.NodeLinkMask);
        return Math.max(intBitsToFloat, Float.intBitsToFloat(bits$iv$iv2));
    }

    public String toString() {
        return m4121toStringimpl(this.packedValue);
    }

    /* renamed from: toString-impl  reason: not valid java name */
    public static String m4121toStringimpl(long arg0) {
        if (!(arg0 != InlineClassHelperKt.UnspecifiedPackedFloats)) {
            return "Size.Unspecified";
        }
        int bits$iv$iv$iv = (int) (arg0 >> 32);
        int bits$iv$iv$iv2 = (int) (4294967295L & arg0);
        return "Size(" + GeometryUtilsKt.toStringAsFixed(Float.intBitsToFloat(bits$iv$iv$iv), 1) + ", " + GeometryUtilsKt.toStringAsFixed(Float.intBitsToFloat(bits$iv$iv$iv2), 1) + ')';
    }
}
