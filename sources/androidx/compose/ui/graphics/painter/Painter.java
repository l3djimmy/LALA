package androidx.compose.ui.graphics.painter;

import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.AndroidPaint_androidKt;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.ColorFilter;
import androidx.compose.ui.graphics.Paint;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Painter.kt */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b&\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0003\u001a\u00020\u0004H\u0014J\u0012\u0010\u0017\u001a\u00020\u00152\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0014J\u0010\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u0012\u001a\u00020\u0013H\u0014J\u0010\u0010\u0019\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\u0004H\u0002J\u0012\u0010\u001a\u001a\u00020\n2\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0002J\u0010\u0010\u001b\u001a\u00020\n2\u0006\u0010\u001c\u001a\u00020\u0013H\u0002J\b\u0010\u001d\u001a\u00020\u0011H\u0002J2\u0010\u001e\u001a\u00020\n*\u00020\t2\u0006\u0010\u001f\u001a\u00020\r2\b\b\u0002\u0010\u0003\u001a\u00020\u00042\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006ø\u0001\u0000¢\u0006\u0004\b \u0010!J\f\u0010\"\u001a\u00020\n*\u00020\tH$R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u001f\u0010\u0007\u001a\u0013\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\b¢\u0006\u0002\b\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\f\u001a\u00020\rX¦\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000fR\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006#"}, d2 = {"Landroidx/compose/ui/graphics/painter/Painter;", "", "()V", "alpha", "", "colorFilter", "Landroidx/compose/ui/graphics/ColorFilter;", "drawLambda", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "", "Lkotlin/ExtensionFunctionType;", "intrinsicSize", "Landroidx/compose/ui/geometry/Size;", "getIntrinsicSize-NH-jbRc", "()J", "layerPaint", "Landroidx/compose/ui/graphics/Paint;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "useLayer", "", "applyAlpha", "applyColorFilter", "applyLayoutDirection", "configureAlpha", "configureColorFilter", "configureLayoutDirection", "rtl", "obtainPaint", "draw", "size", "draw-x_KDEd0", "(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFLandroidx/compose/ui/graphics/ColorFilter;)V", "onDraw", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public abstract class Painter {
    private ColorFilter colorFilter;
    private Paint layerPaint;
    private boolean useLayer;
    private float alpha = 1.0f;
    private LayoutDirection layoutDirection = LayoutDirection.Ltr;
    private final Function1<DrawScope, Unit> drawLambda = new Function1<DrawScope, Unit>() { // from class: androidx.compose.ui.graphics.painter.Painter$drawLambda$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(DrawScope drawScope) {
            invoke2(drawScope);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(DrawScope $this$null) {
            Painter.this.onDraw($this$null);
        }
    };

    /* renamed from: getIntrinsicSize-NH-jbRc */
    public abstract long mo4960getIntrinsicSizeNHjbRc();

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void onDraw(DrawScope drawScope);

    private final Paint obtainPaint() {
        Paint target = this.layerPaint;
        if (target == null) {
            Paint target2 = AndroidPaint_androidKt.Paint();
            this.layerPaint = target2;
            return target2;
        }
        return target;
    }

    private final void configureColorFilter(ColorFilter colorFilter) {
        if (!Intrinsics.areEqual(this.colorFilter, colorFilter)) {
            boolean consumedColorFilter = applyColorFilter(colorFilter);
            if (!consumedColorFilter) {
                if (colorFilter == null) {
                    Paint paint = this.layerPaint;
                    if (paint != null) {
                        paint.setColorFilter(null);
                    }
                    this.useLayer = false;
                } else {
                    obtainPaint().setColorFilter(colorFilter);
                    this.useLayer = true;
                }
            }
            this.colorFilter = colorFilter;
        }
    }

    private final void configureAlpha(float alpha) {
        if (!(this.alpha == alpha)) {
            boolean consumed = applyAlpha(alpha);
            if (!consumed) {
                if (alpha == 1.0f) {
                    Paint paint = this.layerPaint;
                    if (paint != null) {
                        paint.setAlpha(alpha);
                    }
                    this.useLayer = false;
                } else {
                    obtainPaint().setAlpha(alpha);
                    this.useLayer = true;
                }
            }
            this.alpha = alpha;
        }
    }

    private final void configureLayoutDirection(LayoutDirection rtl) {
        if (this.layoutDirection != rtl) {
            applyLayoutDirection(rtl);
            this.layoutDirection = rtl;
        }
    }

    protected boolean applyAlpha(float alpha) {
        return false;
    }

    protected boolean applyColorFilter(ColorFilter colorFilter) {
        return false;
    }

    protected boolean applyLayoutDirection(LayoutDirection layoutDirection) {
        return false;
    }

    /* renamed from: draw-x_KDEd0$default  reason: not valid java name */
    public static /* synthetic */ void m4965drawx_KDEd0$default(Painter painter, DrawScope drawScope, long j, float f, ColorFilter colorFilter, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: draw-x_KDEd0");
        }
        if ((i & 2) != 0) {
            f = 1.0f;
        }
        float f2 = f;
        if ((i & 4) != 0) {
            colorFilter = null;
        }
        painter.m4966drawx_KDEd0(drawScope, j, f2, colorFilter);
    }

    /* renamed from: draw-x_KDEd0  reason: not valid java name */
    public final void m4966drawx_KDEd0(DrawScope $this$draw_u2dx_KDEd0, long size, float alpha, ColorFilter colorFilter) {
        float right$iv;
        configureAlpha(alpha);
        configureColorFilter(colorFilter);
        configureLayoutDirection($this$draw_u2dx_KDEd0.getLayoutDirection());
        long arg0$iv = $this$draw_u2dx_KDEd0.mo4840getSizeNHjbRc();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        int bits$iv$iv$iv2 = (int) (size >> 32);
        float right$iv2 = Float.intBitsToFloat(bits$iv$iv$iv) - Float.intBitsToFloat(bits$iv$iv$iv2);
        long arg0$iv2 = $this$draw_u2dx_KDEd0.mo4840getSizeNHjbRc();
        int bits$iv$iv$iv3 = (int) (arg0$iv2 & 4294967295L);
        int bits$iv$iv$iv4 = (int) (size & 4294967295L);
        float bottom$iv = Float.intBitsToFloat(bits$iv$iv$iv3) - Float.intBitsToFloat(bits$iv$iv$iv4);
        $this$draw_u2dx_KDEd0.getDrawContext().getTransform().inset(0.0f, 0.0f, right$iv2, bottom$iv);
        if (alpha > 0.0f) {
            int bits$iv$iv$iv5 = (int) (size >> 32);
            try {
                if (Float.intBitsToFloat(bits$iv$iv$iv5) > 0.0f) {
                    right$iv = right$iv2;
                    int bits$iv$iv$iv6 = (int) (size & 4294967295L);
                    try {
                        if (Float.intBitsToFloat(bits$iv$iv$iv6) <= 0.0f) {
                            right$iv2 = right$iv;
                        } else if (this.useLayer) {
                            long m4064getZeroF1C5BW0 = Offset.Companion.m4064getZeroF1C5BW0();
                            int bits$iv$iv$iv7 = (int) (size >> 32);
                            float width$iv = Float.intBitsToFloat(bits$iv$iv$iv7);
                            long value$iv$iv = size & 4294967295L;
                            int bits$iv$iv$iv8 = (int) value$iv$iv;
                            float height$iv = Float.intBitsToFloat(bits$iv$iv$iv8);
                            long v1$iv$iv = Float.floatToRawIntBits(width$iv);
                            long v1$iv$iv2 = Float.floatToRawIntBits(height$iv);
                            long v2$iv$iv = (v1$iv$iv << 32) | (v1$iv$iv2 & 4294967295L);
                            Rect layerRect = RectKt.m4088Recttz77jQw(m4064getZeroF1C5BW0, Size.m4108constructorimpl(v2$iv$iv));
                            Canvas canvas = $this$draw_u2dx_KDEd0.getDrawContext().getCanvas();
                            Paint paint$iv = obtainPaint();
                            canvas.saveLayer(layerRect, paint$iv);
                            onDraw($this$draw_u2dx_KDEd0);
                            canvas.restore();
                            right$iv2 = right$iv;
                        } else {
                            onDraw($this$draw_u2dx_KDEd0);
                            right$iv2 = right$iv;
                        }
                    } catch (Throwable th) {
                        th = th;
                        $this$draw_u2dx_KDEd0.getDrawContext().getTransform().inset(-0.0f, -0.0f, -right$iv, -bottom$iv);
                        throw th;
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                right$iv = right$iv2;
            }
        }
        $this$draw_u2dx_KDEd0.getDrawContext().getTransform().inset(-0.0f, -0.0f, -right$iv2, -bottom$iv);
    }
}
