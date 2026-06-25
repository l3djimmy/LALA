package androidx.compose.ui.geometry;

import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: RoundRect.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b!\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0087\b\u0018\u0000 >2\u00020\u0001:\u0001>BM\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\b¢\u0006\u0002\u0010\fJ\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÆ\u0003J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u0016\u0010!\u001a\u00020\bHÆ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\"\u0010\u0011J\u0016\u0010#\u001a\u00020\bHÆ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b$\u0010\u0011J\u0016\u0010%\u001a\u00020\bHÆ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b&\u0010\u0011J\u0016\u0010'\u001a\u00020\bHÆ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b(\u0010\u0011J\u001b\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0086\u0002ø\u0001\u0000¢\u0006\u0004\b-\u0010.Jc\u0010/\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\bHÆ\u0001ø\u0001\u0000¢\u0006\u0004\b0\u00101J\u0013\u00102\u001a\u00020*2\b\u00103\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00104\u001a\u000205HÖ\u0001J(\u00106\u001a\u00020\u00032\u0006\u00107\u001a\u00020\u00032\u0006\u00108\u001a\u00020\u00032\u0006\u00109\u001a\u00020\u00032\u0006\u0010:\u001a\u00020\u0003H\u0002J\b\u0010;\u001a\u00020\u0000H\u0002J\b\u0010<\u001a\u00020=H\u0016R\u0010\u0010\r\u001a\u0004\u0018\u00010\u0000X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0019\u0010\u000b\u001a\u00020\bø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0012\u001a\u0004\b\u0010\u0010\u0011R\u0019\u0010\n\u001a\u00020\bø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0012\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\u0014\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u000fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u000fR\u0019\u0010\u0007\u001a\u00020\bø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0012\u001a\u0004\b\u0019\u0010\u0011R\u0019\u0010\t\u001a\u00020\bø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0012\u001a\u0004\b\u001a\u0010\u0011R\u0011\u0010\u001b\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u000f\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006?"}, d2 = {"Landroidx/compose/ui/geometry/RoundRect;", "", "left", "", "top", "right", "bottom", "topLeftCornerRadius", "Landroidx/compose/ui/geometry/CornerRadius;", "topRightCornerRadius", "bottomRightCornerRadius", "bottomLeftCornerRadius", "(FFFFJJJJLkotlin/jvm/internal/DefaultConstructorMarker;)V", "_scaledRadiiRect", "getBottom", "()F", "getBottomLeftCornerRadius-kKHJgLs", "()J", "J", "getBottomRightCornerRadius-kKHJgLs", "height", "getHeight", "getLeft", "getRight", "getTop", "getTopLeftCornerRadius-kKHJgLs", "getTopRightCornerRadius-kKHJgLs", "width", "getWidth", "component1", "component2", "component3", "component4", "component5", "component5-kKHJgLs", "component6", "component6-kKHJgLs", "component7", "component7-kKHJgLs", "component8", "component8-kKHJgLs", "contains", "", "point", "Landroidx/compose/ui/geometry/Offset;", "contains-k-4lQ0M", "(J)Z", "copy", "copy-MDFrsts", "(FFFFJJJJ)Landroidx/compose/ui/geometry/RoundRect;", "equals", "other", "hashCode", "", "minRadius", "min", "radius1", "radius2", "limit", "scaledRadiiRect", "toString", "", "Companion", "ui-geometry"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RoundRect {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private static final RoundRect Zero = RoundRectKt.m4102RoundRectgG7oq9Y(0.0f, 0.0f, 0.0f, 0.0f, CornerRadius.Companion.m4020getZerokKHJgLs());
    private RoundRect _scaledRadiiRect;
    private final float bottom;
    private final long bottomLeftCornerRadius;
    private final long bottomRightCornerRadius;
    private final float left;
    private final float right;
    private final float top;
    private final long topLeftCornerRadius;
    private final long topRightCornerRadius;

    public /* synthetic */ RoundRect(float f, float f2, float f3, float f4, long j, long j2, long j3, long j4, DefaultConstructorMarker defaultConstructorMarker) {
        this(f, f2, f3, f4, j, j2, j3, j4);
    }

    /* renamed from: copy-MDFrsts$default  reason: not valid java name */
    public static /* synthetic */ RoundRect m4089copyMDFrsts$default(RoundRect roundRect, float f, float f2, float f3, float f4, long j, long j2, long j3, long j4, int i, Object obj) {
        if ((i & 1) != 0) {
            f = roundRect.left;
        }
        if ((i & 2) != 0) {
            f2 = roundRect.top;
        }
        if ((i & 4) != 0) {
            f3 = roundRect.right;
        }
        if ((i & 8) != 0) {
            f4 = roundRect.bottom;
        }
        if ((i & 16) != 0) {
            j = roundRect.topLeftCornerRadius;
        }
        if ((i & 32) != 0) {
            j2 = roundRect.topRightCornerRadius;
        }
        if ((i & 64) != 0) {
            j3 = roundRect.bottomRightCornerRadius;
        }
        if ((i & 128) != 0) {
            j4 = roundRect.bottomLeftCornerRadius;
        }
        long j5 = j4;
        long j6 = j3;
        long j7 = j2;
        long j8 = j;
        return roundRect.m4095copyMDFrsts(f, f2, f3, f4, j8, j7, j6, j5);
    }

    public final float component1() {
        return this.left;
    }

    public final float component2() {
        return this.top;
    }

    public final float component3() {
        return this.right;
    }

    public final float component4() {
        return this.bottom;
    }

    /* renamed from: component5-kKHJgLs  reason: not valid java name */
    public final long m4090component5kKHJgLs() {
        return this.topLeftCornerRadius;
    }

    /* renamed from: component6-kKHJgLs  reason: not valid java name */
    public final long m4091component6kKHJgLs() {
        return this.topRightCornerRadius;
    }

    /* renamed from: component7-kKHJgLs  reason: not valid java name */
    public final long m4092component7kKHJgLs() {
        return this.bottomRightCornerRadius;
    }

    /* renamed from: component8-kKHJgLs  reason: not valid java name */
    public final long m4093component8kKHJgLs() {
        return this.bottomLeftCornerRadius;
    }

    /* renamed from: copy-MDFrsts  reason: not valid java name */
    public final RoundRect m4095copyMDFrsts(float f, float f2, float f3, float f4, long j, long j2, long j3, long j4) {
        return new RoundRect(f, f2, f3, f4, j, j2, j3, j4, null);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof RoundRect) {
            RoundRect roundRect = (RoundRect) obj;
            return Float.compare(this.left, roundRect.left) == 0 && Float.compare(this.top, roundRect.top) == 0 && Float.compare(this.right, roundRect.right) == 0 && Float.compare(this.bottom, roundRect.bottom) == 0 && CornerRadius.m4007equalsimpl0(this.topLeftCornerRadius, roundRect.topLeftCornerRadius) && CornerRadius.m4007equalsimpl0(this.topRightCornerRadius, roundRect.topRightCornerRadius) && CornerRadius.m4007equalsimpl0(this.bottomRightCornerRadius, roundRect.bottomRightCornerRadius) && CornerRadius.m4007equalsimpl0(this.bottomLeftCornerRadius, roundRect.bottomLeftCornerRadius);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((((((Float.hashCode(this.left) * 31) + Float.hashCode(this.top)) * 31) + Float.hashCode(this.right)) * 31) + Float.hashCode(this.bottom)) * 31) + CornerRadius.m4010hashCodeimpl(this.topLeftCornerRadius)) * 31) + CornerRadius.m4010hashCodeimpl(this.topRightCornerRadius)) * 31) + CornerRadius.m4010hashCodeimpl(this.bottomRightCornerRadius)) * 31) + CornerRadius.m4010hashCodeimpl(this.bottomLeftCornerRadius);
    }

    private RoundRect(float left, float top, float right, float bottom, long topLeftCornerRadius, long topRightCornerRadius, long bottomRightCornerRadius, long bottomLeftCornerRadius) {
        this.left = left;
        this.top = top;
        this.right = right;
        this.bottom = bottom;
        this.topLeftCornerRadius = topLeftCornerRadius;
        this.topRightCornerRadius = topRightCornerRadius;
        this.bottomRightCornerRadius = bottomRightCornerRadius;
        this.bottomLeftCornerRadius = bottomLeftCornerRadius;
    }

    public /* synthetic */ RoundRect(float f, float f2, float f3, float f4, long j, long j2, long j3, long j4, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(f, f2, f3, f4, (i & 16) != 0 ? CornerRadius.Companion.m4020getZerokKHJgLs() : j, (i & 32) != 0 ? CornerRadius.Companion.m4020getZerokKHJgLs() : j2, (i & 64) != 0 ? CornerRadius.Companion.m4020getZerokKHJgLs() : j3, (i & 128) != 0 ? CornerRadius.Companion.m4020getZerokKHJgLs() : j4, null);
    }

    public final float getLeft() {
        return this.left;
    }

    public final float getTop() {
        return this.top;
    }

    public final float getRight() {
        return this.right;
    }

    public final float getBottom() {
        return this.bottom;
    }

    /* renamed from: getTopLeftCornerRadius-kKHJgLs  reason: not valid java name */
    public final long m4098getTopLeftCornerRadiuskKHJgLs() {
        return this.topLeftCornerRadius;
    }

    /* renamed from: getTopRightCornerRadius-kKHJgLs  reason: not valid java name */
    public final long m4099getTopRightCornerRadiuskKHJgLs() {
        return this.topRightCornerRadius;
    }

    /* renamed from: getBottomRightCornerRadius-kKHJgLs  reason: not valid java name */
    public final long m4097getBottomRightCornerRadiuskKHJgLs() {
        return this.bottomRightCornerRadius;
    }

    /* renamed from: getBottomLeftCornerRadius-kKHJgLs  reason: not valid java name */
    public final long m4096getBottomLeftCornerRadiuskKHJgLs() {
        return this.bottomLeftCornerRadius;
    }

    public final float getWidth() {
        return this.right - this.left;
    }

    public final float getHeight() {
        return this.bottom - this.top;
    }

    private final RoundRect scaledRadiiRect() {
        RoundRect roundRect = this._scaledRadiiRect;
        if (roundRect == null) {
            RoundRect $this$scaledRadiiRect_u24lambda_u240 = this;
            long arg0$iv = $this$scaledRadiiRect_u24lambda_u240.bottomLeftCornerRadius;
            int bits$iv$iv$iv = (int) (arg0$iv & 4294967295L);
            float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
            long arg0$iv2 = $this$scaledRadiiRect_u24lambda_u240.topLeftCornerRadius;
            int bits$iv$iv$iv2 = (int) (arg0$iv2 & 4294967295L);
            float scale = $this$scaledRadiiRect_u24lambda_u240.minRadius(1.0f, intBitsToFloat, Float.intBitsToFloat(bits$iv$iv$iv2), $this$scaledRadiiRect_u24lambda_u240.getHeight());
            long arg0$iv3 = $this$scaledRadiiRect_u24lambda_u240.topLeftCornerRadius;
            int bits$iv$iv$iv3 = (int) (arg0$iv3 >> 32);
            float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv3);
            long arg0$iv4 = $this$scaledRadiiRect_u24lambda_u240.topRightCornerRadius;
            int bits$iv$iv$iv4 = (int) (arg0$iv4 >> 32);
            float scale2 = $this$scaledRadiiRect_u24lambda_u240.minRadius(scale, intBitsToFloat2, Float.intBitsToFloat(bits$iv$iv$iv4), $this$scaledRadiiRect_u24lambda_u240.getWidth());
            long arg0$iv5 = $this$scaledRadiiRect_u24lambda_u240.topRightCornerRadius;
            int bits$iv$iv$iv5 = (int) (arg0$iv5 & 4294967295L);
            float intBitsToFloat3 = Float.intBitsToFloat(bits$iv$iv$iv5);
            long arg0$iv6 = $this$scaledRadiiRect_u24lambda_u240.bottomRightCornerRadius;
            int bits$iv$iv$iv6 = (int) (arg0$iv6 & 4294967295L);
            float scale3 = $this$scaledRadiiRect_u24lambda_u240.minRadius(scale2, intBitsToFloat3, Float.intBitsToFloat(bits$iv$iv$iv6), $this$scaledRadiiRect_u24lambda_u240.getHeight());
            long arg0$iv7 = $this$scaledRadiiRect_u24lambda_u240.bottomRightCornerRadius;
            int bits$iv$iv$iv7 = (int) (arg0$iv7 >> 32);
            float intBitsToFloat4 = Float.intBitsToFloat(bits$iv$iv$iv7);
            long arg0$iv8 = $this$scaledRadiiRect_u24lambda_u240.bottomLeftCornerRadius;
            int bits$iv$iv$iv8 = (int) (arg0$iv8 >> 32);
            float scale4 = $this$scaledRadiiRect_u24lambda_u240.minRadius(scale3, intBitsToFloat4, Float.intBitsToFloat(bits$iv$iv$iv8), $this$scaledRadiiRect_u24lambda_u240.getWidth());
            float f = $this$scaledRadiiRect_u24lambda_u240.left * scale4;
            float f2 = $this$scaledRadiiRect_u24lambda_u240.top * scale4;
            float f3 = $this$scaledRadiiRect_u24lambda_u240.right * scale4;
            float f4 = $this$scaledRadiiRect_u24lambda_u240.bottom * scale4;
            long arg0$iv9 = $this$scaledRadiiRect_u24lambda_u240.topLeftCornerRadius;
            int bits$iv$iv$iv9 = (int) (arg0$iv9 >> 32);
            float x$iv = Float.intBitsToFloat(bits$iv$iv$iv9) * scale4;
            long arg0$iv10 = $this$scaledRadiiRect_u24lambda_u240.topLeftCornerRadius;
            int bits$iv$iv$iv10 = (int) (arg0$iv10 & 4294967295L);
            float y$iv = Float.intBitsToFloat(bits$iv$iv$iv10) * scale4;
            long v1$iv$iv = Float.floatToRawIntBits(x$iv);
            long v2$iv$iv = Float.floatToRawIntBits(y$iv);
            long m4002constructorimpl = CornerRadius.m4002constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
            long arg0$iv11 = $this$scaledRadiiRect_u24lambda_u240.topRightCornerRadius;
            int bits$iv$iv$iv11 = (int) (arg0$iv11 >> 32);
            float x$iv2 = Float.intBitsToFloat(bits$iv$iv$iv11) * scale4;
            long arg0$iv12 = $this$scaledRadiiRect_u24lambda_u240.topRightCornerRadius;
            int bits$iv$iv$iv12 = (int) (arg0$iv12 & 4294967295L);
            float y$iv2 = Float.intBitsToFloat(bits$iv$iv$iv12) * scale4;
            long v1$iv$iv2 = Float.floatToRawIntBits(x$iv2);
            long v2$iv$iv2 = Float.floatToRawIntBits(y$iv2);
            long v2$iv$iv3 = CornerRadius.m4002constructorimpl((v1$iv$iv2 << 32) | (v2$iv$iv2 & 4294967295L));
            long arg0$iv13 = $this$scaledRadiiRect_u24lambda_u240.bottomRightCornerRadius;
            int bits$iv$iv$iv13 = (int) (arg0$iv13 >> 32);
            float x$iv3 = Float.intBitsToFloat(bits$iv$iv$iv13) * scale4;
            long arg0$iv14 = $this$scaledRadiiRect_u24lambda_u240.bottomRightCornerRadius;
            int bits$iv$iv$iv14 = (int) (arg0$iv14 & 4294967295L);
            float y$iv3 = Float.intBitsToFloat(bits$iv$iv$iv14) * scale4;
            long v1$iv$iv3 = Float.floatToRawIntBits(x$iv3);
            long v2$iv$iv4 = Float.floatToRawIntBits(y$iv3);
            long m4002constructorimpl2 = CornerRadius.m4002constructorimpl((v1$iv$iv3 << 32) | (v2$iv$iv4 & 4294967295L));
            long arg0$iv15 = $this$scaledRadiiRect_u24lambda_u240.bottomLeftCornerRadius;
            int bits$iv$iv$iv15 = (int) (arg0$iv15 >> 32);
            float x$iv4 = Float.intBitsToFloat(bits$iv$iv$iv15) * scale4;
            long arg0$iv16 = $this$scaledRadiiRect_u24lambda_u240.bottomLeftCornerRadius;
            int bits$iv$iv$iv16 = (int) (arg0$iv16 & 4294967295L);
            float y$iv4 = Float.intBitsToFloat(bits$iv$iv$iv16) * scale4;
            long v1$iv$iv4 = Float.floatToRawIntBits(x$iv4);
            long v2$iv$iv5 = Float.floatToRawIntBits(y$iv4);
            RoundRect it = new RoundRect(f, f2, f3, f4, m4002constructorimpl, v2$iv$iv3, m4002constructorimpl2, CornerRadius.m4002constructorimpl((v1$iv$iv4 << 32) | (v2$iv$iv5 & 4294967295L)), null);
            this._scaledRadiiRect = it;
            return it;
        }
        return roundRect;
    }

    private final float minRadius(float min, float radius1, float radius2, float limit) {
        float sum = radius1 + radius2;
        if (sum > limit) {
            if (!(sum == 0.0f)) {
                return Math.min(min, limit / sum);
            }
        }
        return min;
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0347  */
    /* JADX WARN: Removed duplicated region for block: B:42:? A[RETURN, SYNTHETIC] */
    /* renamed from: contains-k-4lQ0M  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean m4094containsk4lQ0M(long r24) {
        /*
            Method dump skipped, instructions count: 846
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.geometry.RoundRect.m4094containsk4lQ0M(long):boolean");
    }

    public String toString() {
        long tlRadius = this.topLeftCornerRadius;
        long trRadius = this.topRightCornerRadius;
        long brRadius = this.bottomRightCornerRadius;
        long blRadius = this.bottomLeftCornerRadius;
        String rect = GeometryUtilsKt.toStringAsFixed(this.left, 1) + ", " + GeometryUtilsKt.toStringAsFixed(this.top, 1) + ", " + GeometryUtilsKt.toStringAsFixed(this.right, 1) + ", " + GeometryUtilsKt.toStringAsFixed(this.bottom, 1);
        if (CornerRadius.m4007equalsimpl0(tlRadius, trRadius) && CornerRadius.m4007equalsimpl0(trRadius, brRadius) && CornerRadius.m4007equalsimpl0(brRadius, blRadius)) {
            int bits$iv$iv$iv = (int) (tlRadius >> 32);
            int bits$iv$iv$iv2 = (int) (tlRadius & 4294967295L);
            if (Float.intBitsToFloat(bits$iv$iv$iv) == Float.intBitsToFloat(bits$iv$iv$iv2)) {
                int bits$iv$iv$iv3 = (int) (tlRadius >> 32);
                return "RoundRect(rect=" + rect + ", radius=" + GeometryUtilsKt.toStringAsFixed(Float.intBitsToFloat(bits$iv$iv$iv3), 1) + ')';
            }
            int bits$iv$iv$iv4 = (int) (tlRadius >> 32);
            int bits$iv$iv$iv5 = (int) (tlRadius & 4294967295L);
            return "RoundRect(rect=" + rect + ", x=" + GeometryUtilsKt.toStringAsFixed(Float.intBitsToFloat(bits$iv$iv$iv4), 1) + ", y=" + GeometryUtilsKt.toStringAsFixed(Float.intBitsToFloat(bits$iv$iv$iv5), 1) + ')';
        }
        return "RoundRect(rect=" + rect + ", topLeft=" + ((Object) CornerRadius.m4016toStringimpl(tlRadius)) + ", topRight=" + ((Object) CornerRadius.m4016toStringimpl(trRadius)) + ", bottomRight=" + ((Object) CornerRadius.m4016toStringimpl(brRadius)) + ", bottomLeft=" + ((Object) CornerRadius.m4016toStringimpl(blRadius)) + ')';
    }

    /* compiled from: RoundRect.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u001c\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0005\u0010\u0002\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/compose/ui/geometry/RoundRect$Companion;", "", "()V", "Zero", "Landroidx/compose/ui/geometry/RoundRect;", "getZero$annotations", "getZero", "()Landroidx/compose/ui/geometry/RoundRect;", "ui-geometry"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        public static /* synthetic */ void getZero$annotations() {
        }

        private Companion() {
        }

        public final RoundRect getZero() {
            return RoundRect.Zero;
        }
    }

    public static final RoundRect getZero() {
        return Companion.getZero();
    }
}
