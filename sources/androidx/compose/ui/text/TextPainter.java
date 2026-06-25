package androidx.compose.ui.text;

import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.graphics.drawscope.Fill;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextForegroundStyle;
import androidx.compose.ui.text.style.TextOverflow;
import kotlin.Metadata;
/* compiled from: TextPainter.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b¨\u0006\t"}, d2 = {"Landroidx/compose/ui/text/TextPainter;", "", "()V", "paint", "", "canvas", "Landroidx/compose/ui/graphics/Canvas;", "textLayoutResult", "Landroidx/compose/ui/text/TextLayoutResult;", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class TextPainter {
    public static final int $stable = 0;
    public static final TextPainter INSTANCE = new TextPainter();

    private TextPainter() {
    }

    public final void paint(Canvas canvas, TextLayoutResult textLayoutResult) {
        Canvas canvas2;
        long color;
        float alpha;
        boolean needClipping = textLayoutResult.getHasVisualOverflow() && !TextOverflow.m6799equalsimpl0(textLayoutResult.getLayoutInput().m6306getOverflowgIe3tQ8(), TextOverflow.Companion.m6812getVisiblegIe3tQ8());
        if (!needClipping) {
            canvas2 = canvas;
        } else {
            long arg0$iv = textLayoutResult.m6310getSizeYbymL2g();
            float width = (int) (arg0$iv >> 32);
            long arg0$iv2 = textLayoutResult.m6310getSizeYbymL2g();
            float height = (int) (arg0$iv2 & 4294967295L);
            long m4064getZeroF1C5BW0 = Offset.Companion.m4064getZeroF1C5BW0();
            long v1$iv$iv = Float.floatToRawIntBits(width);
            long v2$iv$iv = Float.floatToRawIntBits(height);
            Rect bounds = RectKt.m4088Recttz77jQw(m4064getZeroF1C5BW0, Size.m4108constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv)));
            canvas.save();
            canvas2 = canvas;
            Canvas.m4262clipRectmtrdDE$default(canvas2, bounds, 0, 2, null);
        }
        SpanStyle style = textLayoutResult.getLayoutInput().getStyle().getSpanStyle$ui_text_release();
        TextDecoration textDecoration = style.getTextDecoration();
        if (textDecoration == null) {
            textDecoration = TextDecoration.Companion.getNone();
        }
        TextDecoration textDecoration2 = textDecoration;
        Shadow shadow = style.getShadow();
        if (shadow == null) {
            shadow = Shadow.Companion.getNone();
        }
        Shadow shadow2 = shadow;
        Fill drawStyle = style.getDrawStyle();
        if (drawStyle == null) {
            drawStyle = Fill.INSTANCE;
        }
        DrawStyle drawStyle2 = drawStyle;
        try {
            Brush brush = style.getBrush();
            if (brush != null) {
                if (style.getTextForegroundStyle$ui_text_release() != TextForegroundStyle.Unspecified.INSTANCE) {
                    alpha = style.getTextForegroundStyle$ui_text_release().getAlpha();
                } else {
                    alpha = 1.0f;
                }
                textLayoutResult.getMultiParagraph().m6195painthn5TExg(canvas2, brush, (r16 & 4) != 0 ? Float.NaN : alpha, (r16 & 8) != 0 ? null : shadow2, (r16 & 16) != 0 ? null : textDecoration2, (r16 & 32) != 0 ? null : drawStyle2, (r16 & 64) != 0 ? DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU() : 0);
            } else {
                if (style.getTextForegroundStyle$ui_text_release() != TextForegroundStyle.Unspecified.INSTANCE) {
                    color = style.getTextForegroundStyle$ui_text_release().mo6643getColor0d7_KjU();
                } else {
                    color = Color.Companion.m4315getBlack0d7_KjU();
                }
                textLayoutResult.getMultiParagraph().m6193paintLG529CI(canvas, (r14 & 2) != 0 ? Color.Companion.m4325getUnspecified0d7_KjU() : color, (r14 & 4) != 0 ? null : shadow2, (r14 & 8) != 0 ? null : textDecoration2, (r14 & 16) == 0 ? drawStyle2 : null, (r14 & 32) != 0 ? DrawScope.Companion.m4842getDefaultBlendMode0nO6VwU() : 0);
            }
        } finally {
            if (needClipping) {
                canvas.restore();
            }
        }
    }
}
