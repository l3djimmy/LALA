package androidx.compose.ui.graphics;

import androidx.autofill.HintConstants;
import androidx.compose.ui.geometry.CornerRadius;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RoundRect;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.graphics.drawscope.Fill;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
/* compiled from: Outline.kt */
@Metadata(d1 = {"\u0000|\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004\u001a\u001a\u0010\u0005\u001a\u00020\u0001*\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\b\u001aN\u0010\u0005\u001a\u00020\u0001*\u00020\t2\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u000b2\b\b\u0003\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u0013ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u0015\u001aN\u0010\u0005\u001a\u00020\u0001*\u00020\t2\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0016\u001a\u00020\u00172\b\b\u0003\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u0013ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0019\u001a\u009f\u0001\u0010\u001a\u001a\u00020\u0001*\u00020\t2\u0006\u0010\u0003\u001a\u00020\u00042,\u0010\u001b\u001a(\u0012\u0004\u0012\u00020\t\u0012\u0013\u0012\u00110\u001d¢\u0006\f\b\u001e\u0012\b\b\u001f\u0012\u0004\b\b( \u0012\u0004\u0012\u00020\u00010\u001c¢\u0006\u0002\b!2,\u0010\"\u001a(\u0012\u0004\u0012\u00020\t\u0012\u0013\u0012\u00110#¢\u0006\f\b\u001e\u0012\b\b\u001f\u0012\u0004\b\b($\u0012\u0004\u0012\u00020\u00010\u001c¢\u0006\u0002\b!2,\u0010%\u001a(\u0012\u0004\u0012\u00020\t\u0012\u0013\u0012\u00110\u0002¢\u0006\f\b\u001e\u0012\b\b\u001f\u0012\u0004\b\b(&\u0012\u0004\u0012\u00020\u00010\u001c¢\u0006\u0002\b!H\u0082\b\u001a\f\u0010'\u001a\u00020(*\u00020#H\u0002\u001a\u0011\u0010)\u001a\u00020**\u00020\u001dH\u0002¢\u0006\u0002\u0010+\u001a\u0011\u0010)\u001a\u00020**\u00020#H\u0002¢\u0006\u0002\u0010,\u001a\u0011\u0010-\u001a\u00020.*\u00020\u001dH\u0002¢\u0006\u0002\u0010+\u001a\u0011\u0010-\u001a\u00020.*\u00020#H\u0002¢\u0006\u0002\u0010,\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006/"}, d2 = {"addOutline", "", "Landroidx/compose/ui/graphics/Path;", "outline", "Landroidx/compose/ui/graphics/Outline;", "drawOutline", "Landroidx/compose/ui/graphics/Canvas;", "paint", "Landroidx/compose/ui/graphics/Paint;", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "brush", "Landroidx/compose/ui/graphics/Brush;", "alpha", "", "style", "Landroidx/compose/ui/graphics/drawscope/DrawStyle;", "colorFilter", "Landroidx/compose/ui/graphics/ColorFilter;", "blendMode", "Landroidx/compose/ui/graphics/BlendMode;", "drawOutline-hn5TExg", "(Landroidx/compose/ui/graphics/drawscope/DrawScope;Landroidx/compose/ui/graphics/Outline;Landroidx/compose/ui/graphics/Brush;FLandroidx/compose/ui/graphics/drawscope/DrawStyle;Landroidx/compose/ui/graphics/ColorFilter;I)V", TypedValues.Custom.S_COLOR, "Landroidx/compose/ui/graphics/Color;", "drawOutline-wDX37Ww", "(Landroidx/compose/ui/graphics/drawscope/DrawScope;Landroidx/compose/ui/graphics/Outline;JFLandroidx/compose/ui/graphics/drawscope/DrawStyle;Landroidx/compose/ui/graphics/ColorFilter;I)V", "drawOutlineHelper", "drawRectBlock", "Lkotlin/Function2;", "Landroidx/compose/ui/geometry/Rect;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "rect", "Lkotlin/ExtensionFunctionType;", "drawRoundedRectBlock", "Landroidx/compose/ui/geometry/RoundRect;", "rrect", "drawPathBlock", "path", "hasSameCornerRadius", "", "size", "Landroidx/compose/ui/geometry/Size;", "(Landroidx/compose/ui/geometry/Rect;)J", "(Landroidx/compose/ui/geometry/RoundRect;)J", "topLeft", "Landroidx/compose/ui/geometry/Offset;", "ui-graphics_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class OutlineKt {
    public static final void addOutline(Path $this$addOutline, Outline outline) {
        if (!(outline instanceof Outline.Rectangle)) {
            if (!(outline instanceof Outline.Rounded)) {
                if (!(outline instanceof Outline.Generic)) {
                    throw new NoWhenBranchMatchedException();
                }
                Path.m4559addPathUv8p0NA$default($this$addOutline, ((Outline.Generic) outline).getPath(), 0L, 2, null);
                return;
            }
            Path.addRoundRect$default($this$addOutline, ((Outline.Rounded) outline).getRoundRect(), null, 2, null);
            return;
        }
        Path.addRect$default($this$addOutline, ((Outline.Rectangle) outline).getRect(), null, 2, null);
    }

    /* renamed from: drawOutline-wDX37Ww$default */
    public static /* synthetic */ void m4548drawOutlinewDX37Ww$default(DrawScope drawScope, Outline outline, long j, float f, DrawStyle drawStyle, ColorFilter colorFilter, int i, int i2, Object obj) {
        m4547drawOutlinewDX37Ww(drawScope, outline, j, (i2 & 4) != 0 ? 1.0f : f, (i2 & 8) != 0 ? Fill.INSTANCE : drawStyle, (i2 & 16) != 0 ? null : colorFilter, (i2 & 32) != 0 ? DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU() : i);
    }

    /* renamed from: drawOutline-wDX37Ww */
    public static final void m4547drawOutlinewDX37Ww(DrawScope $this$drawOutline_u2dwDX37Ww, Outline outline, long color, float alpha, DrawStyle style, ColorFilter colorFilter, int blendMode) {
        if (outline instanceof Outline.Rectangle) {
            Rect rect = ((Outline.Rectangle) outline).getRect();
            $this$drawOutline_u2dwDX37Ww.mo4753drawRectnJ9OG0(color, topLeft(rect), size(rect), alpha, style, colorFilter, blendMode);
        } else if (outline instanceof Outline.Rounded) {
            Path path$iv = ((Outline.Rounded) outline).getRoundRectPath$ui_graphics_release();
            if (path$iv != null) {
                $this$drawOutline_u2dwDX37Ww.mo4749drawPathLG529CI(path$iv, color, alpha, style, colorFilter, blendMode);
                return;
            }
            RoundRect rrect = ((Outline.Rounded) outline).getRoundRect();
            long arg0$iv = rrect.m4096getBottomLeftCornerRadiuskKHJgLs();
            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
            float radius = Float.intBitsToFloat(bits$iv$iv$iv);
            long j = topLeft(rrect);
            long size = size(rrect);
            long v1$iv$iv = Float.floatToRawIntBits(radius);
            long v2$iv$iv = Float.floatToRawIntBits(radius);
            $this$drawOutline_u2dwDX37Ww.mo4755drawRoundRectuAw5IA(color, j, size, CornerRadius.m4002constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)), style, alpha, colorFilter, blendMode);
        } else if (outline instanceof Outline.Generic) {
            Path path = ((Outline.Generic) outline).getPath();
            $this$drawOutline_u2dwDX37Ww.mo4749drawPathLG529CI(path, color, alpha, style, colorFilter, blendMode);
        } else {
            throw new NoWhenBranchMatchedException();
        }
    }

    /* renamed from: drawOutline-hn5TExg$default */
    public static /* synthetic */ void m4546drawOutlinehn5TExg$default(DrawScope drawScope, Outline outline, Brush brush, float f, DrawStyle drawStyle, ColorFilter colorFilter, int i, int i2, Object obj) {
        m4545drawOutlinehn5TExg(drawScope, outline, brush, (i2 & 4) != 0 ? 1.0f : f, (i2 & 8) != 0 ? Fill.INSTANCE : drawStyle, (i2 & 16) != 0 ? null : colorFilter, (i2 & 32) != 0 ? DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU() : i);
    }

    /* renamed from: drawOutline-hn5TExg */
    public static final void m4545drawOutlinehn5TExg(DrawScope $this$drawOutline_u2dhn5TExg, Outline outline, Brush brush, float alpha, DrawStyle style, ColorFilter colorFilter, int blendMode) {
        if (outline instanceof Outline.Rectangle) {
            Rect rect = ((Outline.Rectangle) outline).getRect();
            $this$drawOutline_u2dhn5TExg.mo4752drawRectAsUm42w(brush, topLeft(rect), size(rect), alpha, style, colorFilter, blendMode);
        } else if (outline instanceof Outline.Rounded) {
            Path path$iv = ((Outline.Rounded) outline).getRoundRectPath$ui_graphics_release();
            if (path$iv != null) {
                $this$drawOutline_u2dhn5TExg.mo4748drawPathGBMwjPU(path$iv, brush, alpha, style, colorFilter, blendMode);
                return;
            }
            RoundRect rrect = ((Outline.Rounded) outline).getRoundRect();
            long arg0$iv = rrect.m4096getBottomLeftCornerRadiuskKHJgLs();
            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
            float radius = Float.intBitsToFloat(bits$iv$iv$iv);
            long j = topLeft(rrect);
            long size = size(rrect);
            long v1$iv$iv = Float.floatToRawIntBits(radius);
            long v2$iv$iv = Float.floatToRawIntBits(radius);
            $this$drawOutline_u2dhn5TExg.mo4754drawRoundRectZuiqVtQ(brush, j, size, CornerRadius.m4002constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)), alpha, style, colorFilter, blendMode);
        } else if (outline instanceof Outline.Generic) {
            Path path = ((Outline.Generic) outline).getPath();
            $this$drawOutline_u2dhn5TExg.mo4748drawPathGBMwjPU(path, brush, alpha, style, colorFilter, blendMode);
        } else {
            throw new NoWhenBranchMatchedException();
        }
    }

    private static final long topLeft(Rect $this$topLeft) {
        float x$iv = $this$topLeft.getLeft();
        float y$iv = $this$topLeft.getTop();
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    private static final long size(Rect $this$size) {
        float width$iv = $this$size.getRight() - $this$size.getLeft();
        float height$iv = $this$size.getBottom() - $this$size.getTop();
        long v1$iv$iv = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv = Float.floatToRawIntBits(height$iv);
        return Size.m4108constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    private static final long topLeft(RoundRect $this$topLeft) {
        float x$iv = $this$topLeft.getLeft();
        float y$iv = $this$topLeft.getTop();
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    private static final long size(RoundRect $this$size) {
        float width$iv = $this$size.getWidth();
        float height$iv = $this$size.getHeight();
        long v1$iv$iv = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv = Float.floatToRawIntBits(height$iv);
        return Size.m4108constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    private static final void drawOutlineHelper(DrawScope $this$drawOutlineHelper, Outline outline, Function2<? super DrawScope, ? super Rect, Unit> function2, Function2<? super DrawScope, ? super RoundRect, Unit> function22, Function2<? super DrawScope, ? super Path, Unit> function23) {
        if (!(outline instanceof Outline.Rectangle)) {
            if (outline instanceof Outline.Rounded) {
                Path path = ((Outline.Rounded) outline).getRoundRectPath$ui_graphics_release();
                if (path != null) {
                    function23.invoke($this$drawOutlineHelper, path);
                    return;
                } else {
                    function22.invoke($this$drawOutlineHelper, ((Outline.Rounded) outline).getRoundRect());
                    return;
                }
            } else if (!(outline instanceof Outline.Generic)) {
                throw new NoWhenBranchMatchedException();
            } else {
                function23.invoke($this$drawOutlineHelper, ((Outline.Generic) outline).getPath());
                return;
            }
        }
        function2.invoke($this$drawOutlineHelper, ((Outline.Rectangle) outline).getRect());
    }

    public static final void drawOutline(Canvas $this$drawOutline, Outline outline, Paint paint) {
        if (outline instanceof Outline.Rectangle) {
            $this$drawOutline.drawRect(((Outline.Rectangle) outline).getRect(), paint);
        } else if (outline instanceof Outline.Rounded) {
            Path path = ((Outline.Rounded) outline).getRoundRectPath$ui_graphics_release();
            if (path != null) {
                $this$drawOutline.drawPath(path, paint);
                return;
            }
            float left = ((Outline.Rounded) outline).getRoundRect().getLeft();
            float top = ((Outline.Rounded) outline).getRoundRect().getTop();
            float right = ((Outline.Rounded) outline).getRoundRect().getRight();
            float bottom = ((Outline.Rounded) outline).getRoundRect().getBottom();
            long arg0$iv = ((Outline.Rounded) outline).getRoundRect().m4096getBottomLeftCornerRadiuskKHJgLs();
            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
            float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
            long arg0$iv2 = ((Outline.Rounded) outline).getRoundRect().m4096getBottomLeftCornerRadiuskKHJgLs();
            int bits$iv$iv$iv2 = (int) (arg0$iv2 & 4294967295L);
            $this$drawOutline.drawRoundRect(left, top, right, bottom, intBitsToFloat, Float.intBitsToFloat(bits$iv$iv$iv2), paint);
        } else if (outline instanceof Outline.Generic) {
            $this$drawOutline.drawPath(((Outline.Generic) outline).getPath(), paint);
        } else {
            throw new NoWhenBranchMatchedException();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:64:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0114 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final boolean hasSameCornerRadius(androidx.compose.ui.geometry.RoundRect r14) {
        /*
            Method dump skipped, instructions count: 281
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.OutlineKt.hasSameCornerRadius(androidx.compose.ui.geometry.RoundRect):boolean");
    }
}
