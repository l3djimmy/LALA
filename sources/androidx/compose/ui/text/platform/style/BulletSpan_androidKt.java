package androidx.compose.ui.text.platform.style;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Shader;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RoundRectKt;
import androidx.compose.ui.graphics.AndroidPath;
import androidx.compose.ui.graphics.AndroidPathEffect_androidKt;
import androidx.compose.ui.graphics.AndroidPath_androidKt;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.Path;
import androidx.compose.ui.graphics.PathEffect;
import androidx.compose.ui.graphics.ShaderBrush;
import androidx.compose.ui.graphics.SolidColor;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.graphics.drawscope.Fill;
import androidx.compose.ui.graphics.drawscope.Stroke;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: BulletSpan.android.kt */
@Metadata(d1 = {"\u0000B\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\u001a4\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\u000bH\u0002\u001a>\u0010\f\u001a\u00020\u0001*\u00020\u00062\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\b2\u0006\u0010\u0010\u001a\u00020\u00112\f\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00010\u0012H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014\u001a\u0014\u0010\u0015\u001a\u00020\u0001*\u00020\u00062\u0006\u0010\u0016\u001a\u00020\u0017H\u0002\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0018"}, d2 = {"draw", "", "Landroidx/compose/ui/graphics/Outline;", "canvas", "Landroid/graphics/Canvas;", "paint", "Landroid/graphics/Paint;", "xStart", "", "yCenter", "dir", "", "setBrushAndDraw", "brush", "Landroidx/compose/ui/graphics/Brush;", "alpha", "size", "Landroidx/compose/ui/geometry/Size;", "Lkotlin/Function0;", "setBrushAndDraw-yzxVdVo", "(Landroid/graphics/Paint;Landroidx/compose/ui/graphics/Brush;FJLkotlin/jvm/functions/Function0;)V", "setDrawStyle", "value", "Landroidx/compose/ui/graphics/drawscope/DrawStyle;", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class BulletSpan_androidKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final void setDrawStyle(Paint $this$setDrawStyle, DrawStyle value) {
        if (!Intrinsics.areEqual(value, Fill.INSTANCE)) {
            if (value instanceof Stroke) {
                $this$setDrawStyle.setStyle(Paint.Style.STROKE);
                $this$setDrawStyle.setStrokeWidth(((Stroke) value).getWidth());
                $this$setDrawStyle.setStrokeMiter(((Stroke) value).getMiter());
                $this$setDrawStyle.setStrokeCap(DrawStyleSpan_androidKt.m6625toAndroidCapBeK7IIE(((Stroke) value).m4909getCapKaPHkGw()));
                $this$setDrawStyle.setStrokeJoin(DrawStyleSpan_androidKt.m6626toAndroidJoinWw9F2mQ(((Stroke) value).m4910getJoinLxFBmk8()));
                PathEffect pathEffect = ((Stroke) value).getPathEffect();
                $this$setDrawStyle.setPathEffect(pathEffect != null ? AndroidPathEffect_androidKt.asAndroidPathEffect(pathEffect) : null);
                return;
            }
            return;
        }
        $this$setDrawStyle.setStyle(Paint.Style.FILL);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void draw(Outline $this$draw, Canvas canvas, Paint paint, float xStart, float yCenter, int dir) {
        if ($this$draw instanceof Outline.Generic) {
            canvas.save();
            Rect this_$iv = $this$draw.getBounds();
            canvas.translate(xStart, yCenter - ((this_$iv.getBottom() - this_$iv.getTop()) / 2.0f));
            Path $this$asAndroidPath$iv = ((Outline.Generic) $this$draw).getPath();
            if ($this$asAndroidPath$iv instanceof AndroidPath) {
                canvas.drawPath(((AndroidPath) $this$asAndroidPath$iv).getInternalPath(), paint);
                canvas.restore();
                return;
            }
            throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
        } else if ($this$draw instanceof Outline.Rounded) {
            if (!RoundRectKt.isSimple(((Outline.Rounded) $this$draw).getRoundRect())) {
                Path $this$draw_u24lambda_u240 = AndroidPath_androidKt.Path();
                Path.addRoundRect$default($this$draw_u24lambda_u240, ((Outline.Rounded) $this$draw).getRoundRect(), null, 2, null);
                canvas.save();
                canvas.translate(xStart, yCenter - (((Outline.Rounded) $this$draw).getRoundRect().getHeight() / 2.0f));
                if ($this$draw_u24lambda_u240 instanceof AndroidPath) {
                    canvas.drawPath(((AndroidPath) $this$draw_u24lambda_u240).getInternalPath(), paint);
                    canvas.restore();
                    return;
                }
                throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
            }
            long arg0$iv = ((Outline.Rounded) $this$draw).getRoundRect().m4098getTopLeftCornerRadiuskKHJgLs();
            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
            float xRadius = Float.intBitsToFloat(bits$iv$iv$iv);
            canvas.drawRoundRect(xStart, yCenter - (((Outline.Rounded) $this$draw).getRoundRect().getHeight() / 2.0f), (dir * ((Outline.Rounded) $this$draw).getRoundRect().getWidth()) + xStart, (((Outline.Rounded) $this$draw).getRoundRect().getHeight() / 2.0f) + yCenter, xRadius, xRadius, paint);
        } else if ($this$draw instanceof Outline.Rectangle) {
            Rect this_$iv2 = ((Outline.Rectangle) $this$draw).getRect();
            Rect this_$iv3 = ((Outline.Rectangle) $this$draw).getRect();
            Rect this_$iv4 = ((Outline.Rectangle) $this$draw).getRect();
            canvas.drawRect(xStart, yCenter - ((this_$iv2.getBottom() - this_$iv2.getTop()) / 2.0f), (dir * (this_$iv3.getRight() - this_$iv3.getLeft())) + xStart, yCenter + ((this_$iv4.getBottom() - this_$iv4.getTop()) / 2.0f), paint);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setBrushAndDraw-yzxVdVo  reason: not valid java name */
    public static final void m6624setBrushAndDrawyzxVdVo(Paint $this$setBrushAndDraw_u2dyzxVdVo, Brush brush, float alpha, long size, Function0<Unit> function0) {
        Integer currentAlpha = null;
        if (brush == null) {
            if (!Float.isNaN(alpha)) {
                currentAlpha = Integer.valueOf($this$setBrushAndDraw_u2dyzxVdVo.getAlpha());
                currentAlpha.intValue();
                $this$setBrushAndDraw_u2dyzxVdVo.setAlpha((int) Math.rint(255.0f * alpha));
            }
            function0.invoke();
            if (currentAlpha != null) {
                int it = currentAlpha.intValue();
                $this$setBrushAndDraw_u2dyzxVdVo.setAlpha(it);
            }
        } else if (brush instanceof SolidColor) {
            int currentColor = $this$setBrushAndDraw_u2dyzxVdVo.getColor();
            if (!Float.isNaN(alpha)) {
                currentAlpha = Integer.valueOf($this$setBrushAndDraw_u2dyzxVdVo.getAlpha());
                currentAlpha.intValue();
                $this$setBrushAndDraw_u2dyzxVdVo.setAlpha((int) Math.rint(255.0f * alpha));
            }
            $this$setBrushAndDraw_u2dyzxVdVo.setColor(ColorKt.m4343toArgb8_81llA(((SolidColor) brush).m4624getValue0d7_KjU()));
            function0.invoke();
            $this$setBrushAndDraw_u2dyzxVdVo.setColor(currentColor);
            if (currentAlpha != null) {
                int it2 = currentAlpha.intValue();
                $this$setBrushAndDraw_u2dyzxVdVo.setAlpha(it2);
            }
        } else if (brush instanceof ShaderBrush) {
            Shader currentShader = $this$setBrushAndDraw_u2dyzxVdVo.getShader();
            if (!Float.isNaN(alpha)) {
                currentAlpha = Integer.valueOf($this$setBrushAndDraw_u2dyzxVdVo.getAlpha());
                currentAlpha.intValue();
                $this$setBrushAndDraw_u2dyzxVdVo.setAlpha((int) Math.rint(255.0f * alpha));
            }
            $this$setBrushAndDraw_u2dyzxVdVo.setShader(((ShaderBrush) brush).mo4258createShaderuvyYCjk(size));
            function0.invoke();
            $this$setBrushAndDraw_u2dyzxVdVo.setShader(currentShader);
            if (currentAlpha != null) {
                int it3 = currentAlpha.intValue();
                $this$setBrushAndDraw_u2dyzxVdVo.setAlpha(it3);
            }
        }
    }
}
