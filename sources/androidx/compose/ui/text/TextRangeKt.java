package androidx.compose.ui.text;

import androidx.compose.ui.text.internal.InlineClassHelperKt;
import kotlin.Metadata;
/* compiled from: TextRange.kt */
@Metadata(d1 = {"\u0000$\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\u0010\r\n\u0002\b\u0004\u001a\u0013\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004\u001a\u001b\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0002\u0010\u0007\u001a\u0018\u0010\b\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0003H\u0002\u001a$\u0010\n\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u000b\u001a\u00020\u00032\u0006\u0010\f\u001a\u00020\u0003ø\u0001\u0000¢\u0006\u0004\b\r\u0010\u000e\u001a\u001c\u0010\u000f\u001a\u00020\u0010*\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0001ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0015"}, d2 = {"TextRange", "Landroidx/compose/ui/text/TextRange;", "index", "", "(I)J", "start", "end", "(II)J", "packWithCheck", "", "coerceIn", "minimumValue", "maximumValue", "coerceIn-8ffj60Q", "(JII)J", "substring", "", "", "range", "substring-FDrldGo", "(Ljava/lang/CharSequence;J)Ljava/lang/String;", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class TextRangeKt {
    /* renamed from: substring-FDrldGo  reason: not valid java name */
    public static final String m6346substringFDrldGo(CharSequence $this$substring_u2dFDrldGo, long range) {
        return $this$substring_u2dFDrldGo.subSequence(TextRange.m6337getMinimpl(range), TextRange.m6336getMaximpl(range)).toString();
    }

    public static final long TextRange(int start, int end) {
        return TextRange.m6328constructorimpl(packWithCheck(start, end));
    }

    public static final long TextRange(int index) {
        return TextRange(index, index);
    }

    /* renamed from: coerceIn-8ffj60Q  reason: not valid java name */
    public static final long m6345coerceIn8ffj60Q(long $this$coerceIn_u2d8ffj60Q, int minimumValue, int maximumValue) {
        int $this$fastCoerceIn$iv = TextRange.m6339getStartimpl($this$coerceIn_u2d8ffj60Q);
        int $this$fastCoerceAtLeast$iv$iv = $this$fastCoerceIn$iv;
        if ($this$fastCoerceAtLeast$iv$iv < minimumValue) {
            $this$fastCoerceAtLeast$iv$iv = minimumValue;
        }
        if ($this$fastCoerceAtLeast$iv$iv > maximumValue) {
            $this$fastCoerceAtLeast$iv$iv = maximumValue;
        }
        int $this$fastCoerceIn$iv2 = TextRange.m6334getEndimpl($this$coerceIn_u2d8ffj60Q);
        int $this$fastCoerceAtLeast$iv$iv2 = $this$fastCoerceIn$iv2;
        if ($this$fastCoerceAtLeast$iv$iv2 < minimumValue) {
            $this$fastCoerceAtLeast$iv$iv2 = minimumValue;
        }
        if ($this$fastCoerceAtLeast$iv$iv2 > maximumValue) {
            $this$fastCoerceAtLeast$iv$iv2 = maximumValue;
        }
        if ($this$fastCoerceAtLeast$iv$iv != TextRange.m6339getStartimpl($this$coerceIn_u2d8ffj60Q) || $this$fastCoerceAtLeast$iv$iv2 != TextRange.m6334getEndimpl($this$coerceIn_u2d8ffj60Q)) {
            return TextRange($this$fastCoerceAtLeast$iv$iv, $this$fastCoerceAtLeast$iv$iv2);
        }
        return $this$coerceIn_u2d8ffj60Q;
    }

    private static final long packWithCheck(int start, int end) {
        boolean value$iv = start >= 0 && end >= 0;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("start and end cannot be negative. [start: " + start + ", end: " + end + ']');
        }
        return (start << 32) | (end & 4294967295L);
    }
}
