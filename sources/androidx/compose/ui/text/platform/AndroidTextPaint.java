package androidx.compose.ui.text.platform;

import android.graphics.Paint;
import android.graphics.Shader;
import android.text.TextPaint;
import androidx.compose.runtime.State;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.AndroidPaint_androidKt;
import androidx.compose.ui.graphics.BlendMode;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.Paint;
import androidx.compose.ui.graphics.PaintingStyle;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.graphics.drawscope.Fill;
import androidx.compose.ui.graphics.drawscope.Stroke;
import androidx.compose.ui.text.platform.extensions.TextPaintExtensions_androidKt;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AndroidTextPaint.android.kt */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\r\b\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\b\u00109\u001a\u00020:H\u0002J,\u0010;\u001a\u00020:2\b\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010<\u001a\u00020\u001b2\b\b\u0002\u0010=\u001a\u00020\u0005ø\u0001\u0000¢\u0006\u0004\b>\u0010?J\u0018\u0010@\u001a\u00020:2\u0006\u0010A\u001a\u00020'ø\u0001\u0000¢\u0006\u0004\bB\u0010CJ\u0010\u0010D\u001a\u00020:2\b\u0010$\u001a\u0004\u0018\u00010%J\u0010\u0010E\u001a\u00020:2\b\u00100\u001a\u0004\u0018\u000101J\u0010\u0010F\u001a\u00020:2\b\u00107\u001a\u0004\u0018\u000108R\u0016\u0010\u0007\u001a\u00020\bX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\tR\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R*\u0010\r\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\b8F@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R&\u0010\u0012\u001a\u0004\u0018\u00010\u00138\u0000@\u0000X\u0081\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R,\u0010\u001a\u001a\u0004\u0018\u00010\u001b8\u0000@\u0000X\u0081\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0014\n\u0000\u0012\u0004\b\u001c\u0010\u0015\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 R\u0014\u0010!\u001a\u00020\u000b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\"\u0010#R\u0010\u0010$\u001a\u0004\u0018\u00010%X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010&\u001a\u0004\u0018\u00010'X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R*\u0010(\u001a\u0012\u0012\f\u0012\n\u0018\u00010*j\u0004\u0018\u0001`+\u0018\u00010)X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b,\u0010-\"\u0004\b.\u0010/R$\u00100\u001a\u0002018\u0000@\u0000X\u0081\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b2\u0010\u0015\u001a\u0004\b3\u00104\"\u0004\b5\u00106R\u000e\u00107\u001a\u000208X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006G"}, d2 = {"Landroidx/compose/ui/text/platform/AndroidTextPaint;", "Landroid/text/TextPaint;", "flags", "", "density", "", "(IF)V", "backingBlendMode", "Landroidx/compose/ui/graphics/BlendMode;", "I", "backingComposePaint", "Landroidx/compose/ui/graphics/Paint;", "value", "blendMode", "getBlendMode-0nO6VwU", "()I", "setBlendMode-s9anfk8", "(I)V", "brush", "Landroidx/compose/ui/graphics/Brush;", "getBrush$ui_text_release$annotations", "()V", "getBrush$ui_text_release", "()Landroidx/compose/ui/graphics/Brush;", "setBrush$ui_text_release", "(Landroidx/compose/ui/graphics/Brush;)V", "brushSize", "Landroidx/compose/ui/geometry/Size;", "getBrushSize-VsRJwc0$ui_text_release$annotations", "getBrushSize-VsRJwc0$ui_text_release", "()Landroidx/compose/ui/geometry/Size;", "setBrushSize-iaC8Vc4$ui_text_release", "(Landroidx/compose/ui/geometry/Size;)V", "composePaint", "getComposePaint", "()Landroidx/compose/ui/graphics/Paint;", "drawStyle", "Landroidx/compose/ui/graphics/drawscope/DrawStyle;", "lastColor", "Landroidx/compose/ui/graphics/Color;", "shaderState", "Landroidx/compose/runtime/State;", "Landroid/graphics/Shader;", "Landroidx/compose/ui/graphics/Shader;", "getShaderState$ui_text_release", "()Landroidx/compose/runtime/State;", "setShaderState$ui_text_release", "(Landroidx/compose/runtime/State;)V", "shadow", "Landroidx/compose/ui/graphics/Shadow;", "getShadow$ui_text_release$annotations", "getShadow$ui_text_release", "()Landroidx/compose/ui/graphics/Shadow;", "setShadow$ui_text_release", "(Landroidx/compose/ui/graphics/Shadow;)V", "textDecoration", "Landroidx/compose/ui/text/style/TextDecoration;", "clearShader", "", "setBrush", "size", "alpha", "setBrush-12SF9DM", "(Landroidx/compose/ui/graphics/Brush;JF)V", "setColor", TypedValues.Custom.S_COLOR, "setColor-8_81llA", "(J)V", "setDrawStyle", "setShadow", "setTextDecoration", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AndroidTextPaint extends TextPaint {
    public static final int $stable = 8;
    private int backingBlendMode;
    private Paint backingComposePaint;
    private Brush brush;
    private Size brushSize;
    private DrawStyle drawStyle;
    private Color lastColor;
    private State<? extends Shader> shaderState;
    private Shadow shadow;
    private TextDecoration textDecoration;

    public static /* synthetic */ void getBrush$ui_text_release$annotations() {
    }

    /* renamed from: getBrushSize-VsRJwc0$ui_text_release$annotations  reason: not valid java name */
    public static /* synthetic */ void m6600getBrushSizeVsRJwc0$ui_text_release$annotations() {
    }

    public static /* synthetic */ void getShadow$ui_text_release$annotations() {
    }

    public AndroidTextPaint(int flags, float density) {
        super(flags);
        this.density = density;
        this.textDecoration = TextDecoration.Companion.getNone();
        this.backingBlendMode = DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU();
        this.shadow = Shadow.Companion.getNone();
    }

    private final Paint getComposePaint() {
        Paint finalBackingComposePaint = this.backingComposePaint;
        if (finalBackingComposePaint != null) {
            return finalBackingComposePaint;
        }
        Paint it = AndroidPaint_androidKt.asComposePaint(this);
        this.backingComposePaint = it;
        return it;
    }

    public final Shadow getShadow$ui_text_release() {
        return this.shadow;
    }

    public final void setShadow$ui_text_release(Shadow shadow) {
        this.shadow = shadow;
    }

    public final Brush getBrush$ui_text_release() {
        return this.brush;
    }

    public final void setBrush$ui_text_release(Brush brush) {
        this.brush = brush;
    }

    public final State<Shader> getShaderState$ui_text_release() {
        return this.shaderState;
    }

    public final void setShaderState$ui_text_release(State<? extends Shader> state) {
        this.shaderState = state;
    }

    /* renamed from: getBrushSize-VsRJwc0$ui_text_release  reason: not valid java name */
    public final Size m6603getBrushSizeVsRJwc0$ui_text_release() {
        return this.brushSize;
    }

    /* renamed from: setBrushSize-iaC8Vc4$ui_text_release  reason: not valid java name */
    public final void m6606setBrushSizeiaC8Vc4$ui_text_release(Size size) {
        this.brushSize = size;
    }

    public final void setTextDecoration(TextDecoration textDecoration) {
        if (textDecoration != null && !Intrinsics.areEqual(this.textDecoration, textDecoration)) {
            this.textDecoration = textDecoration;
            setUnderlineText(this.textDecoration.contains(TextDecoration.Companion.getUnderline()));
            setStrikeThruText(this.textDecoration.contains(TextDecoration.Companion.getLineThrough()));
        }
    }

    public final void setShadow(Shadow shadow) {
        if (shadow != null && !Intrinsics.areEqual(this.shadow, shadow)) {
            this.shadow = shadow;
            if (Intrinsics.areEqual(this.shadow, Shadow.Companion.getNone())) {
                clearShadowLayer();
                return;
            }
            float correctBlurRadius = TextPaintExtensions_androidKt.correctBlurRadius(this.shadow.getBlurRadius());
            long arg0$iv = this.shadow.m4615getOffsetF1C5BW0();
            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
            float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
            long arg0$iv2 = this.shadow.m4615getOffsetF1C5BW0();
            int bits$iv$iv$iv2 = (int) (4294967295L & arg0$iv2);
            setShadowLayer(correctBlurRadius, intBitsToFloat, Float.intBitsToFloat(bits$iv$iv$iv2), ColorKt.m4343toArgb8_81llA(this.shadow.m4614getColor0d7_KjU()));
        }
    }

    /* renamed from: setColor-8_81llA  reason: not valid java name */
    public final void m6607setColor8_81llA(long color) {
        Color color2 = this.lastColor;
        if (!(color2 == null ? false : Color.m4290equalsimpl0(color2.m4299unboximpl(), color))) {
            if (color != 16) {
                this.lastColor = Color.m4279boximpl(color);
                setColor(ColorKt.m4343toArgb8_81llA(color));
                clearShader();
            }
        }
    }

    /* renamed from: setBrush-12SF9DM$default  reason: not valid java name */
    public static /* synthetic */ void m6601setBrush12SF9DM$default(AndroidTextPaint androidTextPaint, Brush brush, long j, float f, int i, Object obj) {
        if ((i & 4) != 0) {
            f = Float.NaN;
        }
        androidTextPaint.m6605setBrush12SF9DM(brush, j, f);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0036, code lost:
        if ((r0 == null ? false : androidx.compose.ui.geometry.Size.m4113equalsimpl0(r0.m4122unboximpl(), r8)) == false) goto L24;
     */
    /* renamed from: setBrush-12SF9DM  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void m6605setBrush12SF9DM(final androidx.compose.ui.graphics.Brush r7, final long r8, float r10) {
        /*
            r6 = this;
            if (r7 != 0) goto L8
            r6.clearShader()
            goto L77
        L8:
            boolean r0 = r7 instanceof androidx.compose.ui.graphics.SolidColor
            if (r0 == 0) goto L1b
            r0 = r7
            androidx.compose.ui.graphics.SolidColor r0 = (androidx.compose.ui.graphics.SolidColor) r0
            long r0 = r0.m4624getValue0d7_KjU()
            long r0 = androidx.compose.ui.text.style.TextDrawStyleKt.m6777modulateDxMtmZc(r0, r10)
            r6.m6607setColor8_81llA(r0)
            goto L77
        L1b:
            boolean r0 = r7 instanceof androidx.compose.ui.graphics.ShaderBrush
            if (r0 == 0) goto L77
            androidx.compose.ui.graphics.Brush r0 = r6.brush
            boolean r0 = kotlin.jvm.internal.Intrinsics.areEqual(r0, r7)
            r1 = 0
            if (r0 == 0) goto L38
            androidx.compose.ui.geometry.Size r0 = r6.brushSize
            if (r0 != 0) goto L2e
            r0 = r1
            goto L36
        L2e:
            long r2 = r0.m4122unboximpl()
            boolean r0 = androidx.compose.ui.geometry.Size.m4113equalsimpl0(r2, r8)
        L36:
            if (r0 != 0) goto L5b
        L38:
            r2 = r8
            r0 = 0
            r4 = 9205357640488583168(0x7fc000007fc00000, double:2.247117487993712E307)
            int r4 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r4 == 0) goto L44
            r1 = 1
        L44:
            if (r1 == 0) goto L5b
            r6.brush = r7
            androidx.compose.ui.geometry.Size r0 = androidx.compose.ui.geometry.Size.m4105boximpl(r8)
            r6.brushSize = r0
            androidx.compose.ui.text.platform.AndroidTextPaint$setBrush$1 r0 = new androidx.compose.ui.text.platform.AndroidTextPaint$setBrush$1
            r0.<init>()
            kotlin.jvm.functions.Function0 r0 = (kotlin.jvm.functions.Function0) r0
            androidx.compose.runtime.State r0 = androidx.compose.runtime.SnapshotStateKt.derivedStateOf(r0)
            r6.shaderState = r0
        L5b:
            androidx.compose.ui.graphics.Paint r0 = r6.getComposePaint()
            androidx.compose.runtime.State<? extends android.graphics.Shader> r1 = r6.shaderState
            r2 = 0
            if (r1 == 0) goto L6b
            java.lang.Object r1 = r1.getValue()
            android.graphics.Shader r1 = (android.graphics.Shader) r1
            goto L6c
        L6b:
            r1 = r2
        L6c:
            r0.setShader(r1)
            r6.lastColor = r2
            r0 = r6
            android.text.TextPaint r0 = (android.text.TextPaint) r0
            androidx.compose.ui.text.platform.AndroidTextPaint_androidKt.setAlpha(r0, r10)
        L77:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.platform.AndroidTextPaint.m6605setBrush12SF9DM(androidx.compose.ui.graphics.Brush, long, float):void");
    }

    public final void setDrawStyle(DrawStyle drawStyle) {
        if (drawStyle != null && !Intrinsics.areEqual(this.drawStyle, drawStyle)) {
            this.drawStyle = drawStyle;
            if (Intrinsics.areEqual(drawStyle, Fill.INSTANCE)) {
                setStyle(Paint.Style.FILL);
            } else if (drawStyle instanceof Stroke) {
                getComposePaint().mo4172setStylek9PVt8s(PaintingStyle.Companion.m4557getStrokeTiuSbCo());
                getComposePaint().setStrokeWidth(((Stroke) drawStyle).getWidth());
                getComposePaint().setStrokeMiterLimit(((Stroke) drawStyle).getMiter());
                getComposePaint().mo4171setStrokeJoinWw9F2mQ(((Stroke) drawStyle).m4910getJoinLxFBmk8());
                getComposePaint().mo4170setStrokeCapBeK7IIE(((Stroke) drawStyle).m4909getCapKaPHkGw());
                getComposePaint().setPathEffect(((Stroke) drawStyle).getPathEffect());
            }
        }
    }

    /* renamed from: getBlendMode-0nO6VwU  reason: not valid java name */
    public final int m6602getBlendMode0nO6VwU() {
        return this.backingBlendMode;
    }

    /* renamed from: setBlendMode-s9anfk8  reason: not valid java name */
    public final void m6604setBlendModes9anfk8(int value) {
        if (BlendMode.m4200equalsimpl0(value, this.backingBlendMode)) {
            return;
        }
        getComposePaint().mo4167setBlendModes9anfk8(value);
        this.backingBlendMode = value;
    }

    private final void clearShader() {
        this.shaderState = null;
        this.brush = null;
        this.brushSize = null;
        setShader(null);
    }
}
