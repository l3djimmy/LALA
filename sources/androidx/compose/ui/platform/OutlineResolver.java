package androidx.compose.ui.platform;

import android.graphics.Outline;
import android.os.Build;
import androidx.compose.ui.geometry.CornerRadius;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RoundRect;
import androidx.compose.ui.geometry.RoundRectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.AndroidPath;
import androidx.compose.ui.graphics.AndroidPath_androidKt;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.Path;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: OutlineResolver.android.kt */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\b\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u000e\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020)J\u0018\u0010*\u001a\u00020\b2\u0006\u0010+\u001a\u00020\u001dø\u0001\u0000¢\u0006\u0004\b,\u0010-J:\u0010.\u001a\u00020\b2\b\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0006\u0010/\u001a\u00020\u001f2\u0006\u0010&\u001a\u00020\b2\u0006\u00100\u001a\u00020\u001f2\u0006\u00101\u001a\u00020\u001aø\u0001\u0000¢\u0006\u0004\b2\u00103J\b\u00104\u001a\u00020'H\u0002J\u0010\u00105\u001a\u00020'2\u0006\u00106\u001a\u00020\u000eH\u0002J\u0010\u00107\u001a\u00020'2\u0006\u00108\u001a\u000209H\u0002J\u0010\u0010:\u001a\u00020'2\u0006\u0010;\u001a\u00020#H\u0002J0\u0010<\u001a\u00020\b*\u0004\u0018\u00010#2\u0006\u0010=\u001a\u00020\u001d2\u0006\u00101\u001a\u00020\u001a2\u0006\u0010>\u001a\u00020\u001fH\u0002ø\u0001\u0000¢\u0006\u0004\b?\u0010@R\u0013\u0010\u0003\u001a\u0004\u0018\u00010\u00048F¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R\u001e\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u000e\u0010\f\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0013\u0010\u000f\u001a\u0004\u0018\u00010\u000e8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0014X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u0015\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u000bR\u000e\u0010\u0017\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0019\u001a\u00020\u001aX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001bR\u0016\u0010\u001c\u001a\u00020\u001dX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001bR\u000e\u0010\u001e\u001a\u00020\u001fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010!\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\"\u001a\u0004\u0018\u00010#X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010$\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006A"}, d2 = {"Landroidx/compose/ui/platform/OutlineResolver;", "", "()V", "androidOutline", "Landroid/graphics/Outline;", "getAndroidOutline", "()Landroid/graphics/Outline;", "<set-?>", "", "cacheIsDirty", "getCacheIsDirty$ui_release", "()Z", "cachedOutline", "cachedRrectPath", "Landroidx/compose/ui/graphics/Path;", "clipPath", "getClipPath", "()Landroidx/compose/ui/graphics/Path;", "isSupportedOutline", "outline", "Landroidx/compose/ui/graphics/Outline;", "outlineClipSupported", "getOutlineClipSupported", "outlineNeeded", "outlinePath", "rectSize", "Landroidx/compose/ui/geometry/Size;", "J", "rectTopLeft", "Landroidx/compose/ui/geometry/Offset;", "roundedCornerRadius", "", "tmpOpPath", "tmpPath", "tmpRoundRect", "Landroidx/compose/ui/geometry/RoundRect;", "tmpTouchPointPath", "usePathForClip", "clipToOutline", "", "canvas", "Landroidx/compose/ui/graphics/Canvas;", "isInOutline", "position", "isInOutline-k-4lQ0M", "(J)Z", "update", "alpha", "elevation", "size", "update-S_szKao", "(Landroidx/compose/ui/graphics/Outline;FZFJ)Z", "updateCache", "updateCacheWithPath", "composePath", "updateCacheWithRect", "rect", "Landroidx/compose/ui/geometry/Rect;", "updateCacheWithRoundRect", "roundRect", "isSameBounds", TypedValues.CycleType.S_WAVE_OFFSET, "radius", "isSameBounds-4L21HEs", "(Landroidx/compose/ui/geometry/RoundRect;JJF)Z", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class OutlineResolver {
    public static final int $stable = 8;
    private boolean cacheIsDirty;
    private final Outline cachedOutline;
    private Path cachedRrectPath;
    private boolean isSupportedOutline = true;
    private androidx.compose.ui.graphics.Outline outline;
    private boolean outlineNeeded;
    private Path outlinePath;
    private long rectSize;
    private long rectTopLeft;
    private float roundedCornerRadius;
    private Path tmpOpPath;
    private Path tmpPath;
    private RoundRect tmpRoundRect;
    private Path tmpTouchPointPath;
    private boolean usePathForClip;

    public OutlineResolver() {
        Outline $this$cachedOutline_u24lambda_u240 = new Outline();
        $this$cachedOutline_u24lambda_u240.setAlpha(1.0f);
        this.cachedOutline = $this$cachedOutline_u24lambda_u240;
        this.rectTopLeft = Offset.Companion.m4064getZeroF1C5BW0();
        this.rectSize = Size.Companion.m4126getZeroNHjbRc();
    }

    public final boolean getCacheIsDirty$ui_release() {
        return this.cacheIsDirty;
    }

    public final Outline getAndroidOutline() {
        updateCache();
        if (this.outlineNeeded && this.isSupportedOutline) {
            return this.cachedOutline;
        }
        return null;
    }

    public final boolean getOutlineClipSupported() {
        return !this.usePathForClip;
    }

    public final Path getClipPath() {
        updateCache();
        return this.outlinePath;
    }

    /* renamed from: update-S_szKao  reason: not valid java name */
    public final boolean m6078updateS_szKao(androidx.compose.ui.graphics.Outline outline, float alpha, boolean clipToOutline, float elevation, long size) {
        this.cachedOutline.setAlpha(alpha);
        boolean outlineChanged = !Intrinsics.areEqual(this.outline, outline);
        if (outlineChanged) {
            this.outline = outline;
            this.cacheIsDirty = true;
        }
        this.rectSize = size;
        boolean outlineNeeded = outline != null && (clipToOutline || elevation > 0.0f);
        if (this.outlineNeeded != outlineNeeded) {
            this.outlineNeeded = outlineNeeded;
            this.cacheIsDirty = true;
        }
        return outlineChanged;
    }

    /* renamed from: isInOutline-k-4lQ0M  reason: not valid java name */
    public final boolean m6077isInOutlinek4lQ0M(long position) {
        androidx.compose.ui.graphics.Outline outline;
        if (this.outlineNeeded && (outline = this.outline) != null) {
            int bits$iv$iv$iv = (int) (position >> 32);
            int bits$iv$iv$iv2 = (int) (4294967295L & position);
            return ShapeContainingUtilKt.isInOutline(outline, Float.intBitsToFloat(bits$iv$iv$iv), Float.intBitsToFloat(bits$iv$iv$iv2), this.tmpTouchPointPath, this.tmpOpPath);
        }
        return true;
    }

    public final void clipToOutline(Canvas canvas) {
        int i;
        Path targetPath = getClipPath();
        if (targetPath != null) {
            Canvas.m4260clipPathmtrdDE$default(canvas, targetPath, 0, 2, null);
        } else if (this.roundedCornerRadius > 0.0f) {
            Path roundRectClipPath = this.tmpPath;
            RoundRect roundRect = this.tmpRoundRect;
            if (roundRectClipPath == null || !m6076isSameBounds4L21HEs(roundRect, this.rectTopLeft, this.rectSize, this.roundedCornerRadius)) {
                long arg0$iv = this.rectTopLeft;
                int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
                long arg0$iv2 = this.rectTopLeft;
                int bits$iv$iv$iv2 = (int) (arg0$iv2 & 4294967295L);
                float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv2);
                long arg0$iv3 = this.rectTopLeft;
                int bits$iv$iv$iv3 = (int) (arg0$iv3 >> 32);
                float intBitsToFloat3 = Float.intBitsToFloat(bits$iv$iv$iv3);
                long arg0$iv4 = this.rectSize;
                int bits$iv$iv$iv4 = (int) (arg0$iv4 >> 32);
                float intBitsToFloat4 = intBitsToFloat3 + Float.intBitsToFloat(bits$iv$iv$iv4);
                long arg0$iv5 = this.rectTopLeft;
                int bits$iv$iv$iv5 = (int) (arg0$iv5 & 4294967295L);
                float intBitsToFloat5 = Float.intBitsToFloat(bits$iv$iv$iv5);
                long arg0$iv6 = this.rectSize;
                int bits$iv$iv$iv6 = (int) (arg0$iv6 & 4294967295L);
                float intBitsToFloat6 = intBitsToFloat5 + Float.intBitsToFloat(bits$iv$iv$iv6);
                float x$iv = this.roundedCornerRadius;
                long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                long v2$iv$iv = Float.floatToRawIntBits(x$iv);
                RoundRect roundRect2 = RoundRectKt.m4102RoundRectgG7oq9Y(intBitsToFloat, intBitsToFloat2, intBitsToFloat4, intBitsToFloat6, CornerRadius.m4002constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
                if (roundRectClipPath == null) {
                    roundRectClipPath = AndroidPath_androidKt.Path();
                } else {
                    roundRectClipPath.reset();
                    roundRectClipPath = roundRectClipPath;
                }
                i = 2;
                Path.addRoundRect$default(roundRectClipPath, roundRect2, null, 2, null);
                this.tmpRoundRect = roundRect2;
                this.tmpPath = roundRectClipPath;
            } else {
                i = 2;
            }
            Canvas.m4260clipPathmtrdDE$default(canvas, roundRectClipPath, 0, i, null);
        } else {
            long arg0$iv7 = this.rectTopLeft;
            int bits$iv$iv$iv7 = (int) (arg0$iv7 >> 32);
            float intBitsToFloat7 = Float.intBitsToFloat(bits$iv$iv$iv7);
            long arg0$iv8 = this.rectTopLeft;
            int bits$iv$iv$iv8 = (int) (arg0$iv8 & 4294967295L);
            float intBitsToFloat8 = Float.intBitsToFloat(bits$iv$iv$iv8);
            long arg0$iv9 = this.rectTopLeft;
            int bits$iv$iv$iv9 = (int) (arg0$iv9 >> 32);
            float intBitsToFloat9 = Float.intBitsToFloat(bits$iv$iv$iv9);
            long arg0$iv10 = this.rectSize;
            int bits$iv$iv$iv10 = (int) (arg0$iv10 >> 32);
            float intBitsToFloat10 = intBitsToFloat9 + Float.intBitsToFloat(bits$iv$iv$iv10);
            long arg0$iv11 = this.rectTopLeft;
            int bits$iv$iv$iv11 = (int) (arg0$iv11 & 4294967295L);
            float intBitsToFloat11 = Float.intBitsToFloat(bits$iv$iv$iv11);
            long arg0$iv12 = this.rectSize;
            int bits$iv$iv$iv12 = (int) (arg0$iv12 & 4294967295L);
            Canvas.m4261clipRectN_I0leg$default(canvas, intBitsToFloat7, intBitsToFloat8, intBitsToFloat10, intBitsToFloat11 + Float.intBitsToFloat(bits$iv$iv$iv12), 0, 16, null);
        }
    }

    private final void updateCache() {
        if (this.cacheIsDirty) {
            this.rectTopLeft = Offset.Companion.m4064getZeroF1C5BW0();
            this.roundedCornerRadius = 0.0f;
            this.outlinePath = null;
            this.cacheIsDirty = false;
            this.usePathForClip = false;
            androidx.compose.ui.graphics.Outline outline = this.outline;
            if (outline != null && this.outlineNeeded) {
                long arg0$iv = this.rectSize;
                int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                if (Float.intBitsToFloat(bits$iv$iv$iv) > 0.0f) {
                    long arg0$iv2 = this.rectSize;
                    int bits$iv$iv$iv2 = (int) (4294967295L & arg0$iv2);
                    if (Float.intBitsToFloat(bits$iv$iv$iv2) > 0.0f) {
                        this.isSupportedOutline = true;
                        if (!(outline instanceof Outline.Rectangle)) {
                            if (!(outline instanceof Outline.Rounded)) {
                                if (outline instanceof Outline.Generic) {
                                    updateCacheWithPath(((Outline.Generic) outline).getPath());
                                    return;
                                }
                                return;
                            }
                            updateCacheWithRoundRect(((Outline.Rounded) outline).getRoundRect());
                            return;
                        }
                        updateCacheWithRect(((Outline.Rectangle) outline).getRect());
                        return;
                    }
                }
            }
            this.cachedOutline.setEmpty();
        }
    }

    private final void updateCacheWithRect(Rect rect) {
        float x$iv = rect.getLeft();
        float y$iv = rect.getTop();
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        this.rectTopLeft = Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
        float width$iv = rect.getRight() - rect.getLeft();
        float height$iv = rect.getBottom() - rect.getTop();
        long v1$iv$iv2 = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv2 = Float.floatToRawIntBits(height$iv);
        this.rectSize = Size.m4108constructorimpl((v1$iv$iv2 << 32) | (v2$iv$iv2 & 4294967295L));
        android.graphics.Outline outline = this.cachedOutline;
        float $this$fastRoundToInt$iv = rect.getLeft();
        int round = Math.round($this$fastRoundToInt$iv);
        float $this$fastRoundToInt$iv2 = rect.getTop();
        int round2 = Math.round($this$fastRoundToInt$iv2);
        float $this$fastRoundToInt$iv3 = rect.getRight();
        int round3 = Math.round($this$fastRoundToInt$iv3);
        float $this$fastRoundToInt$iv4 = rect.getBottom();
        outline.setRect(round, round2, round3, Math.round($this$fastRoundToInt$iv4));
    }

    private final void updateCacheWithRoundRect(RoundRect roundRect) {
        long arg0$iv = roundRect.m4098getTopLeftCornerRadiuskKHJgLs();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        float radius = Float.intBitsToFloat(bits$iv$iv$iv);
        float x$iv = roundRect.getLeft();
        float y$iv = roundRect.getTop();
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        this.rectTopLeft = Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
        float width$iv = roundRect.getWidth();
        float height$iv = roundRect.getHeight();
        long v1$iv$iv2 = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv2 = Float.floatToRawIntBits(height$iv);
        this.rectSize = Size.m4108constructorimpl((v1$iv$iv2 << 32) | (4294967295L & v2$iv$iv2));
        if (RoundRectKt.isSimple(roundRect)) {
            android.graphics.Outline outline = this.cachedOutline;
            float $this$fastRoundToInt$iv = roundRect.getLeft();
            int round = Math.round($this$fastRoundToInt$iv);
            float $this$fastRoundToInt$iv2 = roundRect.getTop();
            int round2 = Math.round($this$fastRoundToInt$iv2);
            float $this$fastRoundToInt$iv3 = roundRect.getRight();
            int round3 = Math.round($this$fastRoundToInt$iv3);
            float $this$fastRoundToInt$iv4 = roundRect.getBottom();
            outline.setRoundRect(round, round2, round3, Math.round($this$fastRoundToInt$iv4), radius);
            this.roundedCornerRadius = radius;
            return;
        }
        Path it = this.cachedRrectPath;
        if (it == null) {
            it = AndroidPath_androidKt.Path();
            this.cachedRrectPath = it;
        }
        it.reset();
        Path.addRoundRect$default(it, roundRect, null, 2, null);
        updateCacheWithPath(it);
    }

    private final void updateCacheWithPath(Path composePath) {
        if (Build.VERSION.SDK_INT > 28 || composePath.isConvex()) {
            if (Build.VERSION.SDK_INT >= 30) {
                OutlineVerificationHelper.INSTANCE.setPath(this.cachedOutline, composePath);
            } else {
                android.graphics.Outline outline = this.cachedOutline;
                if (composePath instanceof AndroidPath) {
                    outline.setConvexPath(((AndroidPath) composePath).getInternalPath());
                } else {
                    throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
                }
            }
            this.usePathForClip = !this.cachedOutline.canClip();
        } else {
            this.isSupportedOutline = false;
            this.cachedOutline.setEmpty();
            this.usePathForClip = true;
        }
        this.outlinePath = composePath;
    }

    /* renamed from: isSameBounds-4L21HEs  reason: not valid java name */
    private final boolean m6076isSameBounds4L21HEs(RoundRect $this$isSameBounds_u2d4L21HEs, long offset, long size, float radius) {
        if ($this$isSameBounds_u2d4L21HEs == null || !RoundRectKt.isSimple($this$isSameBounds_u2d4L21HEs)) {
            return false;
        }
        int bits$iv$iv$iv = (int) (offset >> 32);
        if (!($this$isSameBounds_u2d4L21HEs.getLeft() == Float.intBitsToFloat(bits$iv$iv$iv))) {
            return false;
        }
        int bits$iv$iv$iv2 = (int) (offset & 4294967295L);
        if (!($this$isSameBounds_u2d4L21HEs.getTop() == Float.intBitsToFloat(bits$iv$iv$iv2))) {
            return false;
        }
        int bits$iv$iv$iv3 = (int) (offset >> 32);
        int bits$iv$iv$iv4 = (int) (size >> 32);
        if (!($this$isSameBounds_u2d4L21HEs.getRight() == Float.intBitsToFloat(bits$iv$iv$iv3) + Float.intBitsToFloat(bits$iv$iv$iv4))) {
            return false;
        }
        int bits$iv$iv$iv5 = (int) (offset & 4294967295L);
        int bits$iv$iv$iv6 = (int) (4294967295L & size);
        if (!($this$isSameBounds_u2d4L21HEs.getBottom() == Float.intBitsToFloat(bits$iv$iv$iv5) + Float.intBitsToFloat(bits$iv$iv$iv6))) {
            return false;
        }
        long arg0$iv = $this$isSameBounds_u2d4L21HEs.m4098getTopLeftCornerRadiuskKHJgLs();
        int bits$iv$iv$iv7 = (int) (arg0$iv >> 32);
        return (Float.intBitsToFloat(bits$iv$iv$iv7) > radius ? 1 : (Float.intBitsToFloat(bits$iv$iv$iv7) == radius ? 0 : -1)) == 0;
    }
}
