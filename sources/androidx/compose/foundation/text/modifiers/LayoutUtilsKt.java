package androidx.compose.foundation.text.modifiers;

import androidx.compose.foundation.text.TextDelegateKt;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.Constraints;
import kotlin.Metadata;
import kotlin.ranges.RangesKt;
/* compiled from: LayoutUtils.kt */
@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0007\u001a2\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000bH\u0000ø\u0001\u0000¢\u0006\u0004\b\f\u0010\r\u001a*\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\b\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\u00022\u0006\u0010\u0010\u001a\u00020\u000fH\u0000ø\u0001\u0000¢\u0006\u0004\b\u0011\u0010\u0012\u001a2\u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000bH\u0000ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u0015\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0016"}, d2 = {"isEllipsis", "", "Landroidx/compose/ui/text/style/TextOverflow;", "isEllipsis-MW5-ApA", "(I)Z", "finalConstraints", "Landroidx/compose/ui/unit/Constraints;", "constraints", "softWrap", "overflow", "maxIntrinsicWidth", "", "finalConstraints-tfFHcEY", "(JZIF)J", "finalMaxLines", "", "maxLinesIn", "finalMaxLines-xdlQI24", "(ZII)I", "finalMaxWidth", "finalMaxWidth-tfFHcEY", "(JZIF)I", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LayoutUtilsKt {
    /* renamed from: finalConstraints-tfFHcEY  reason: not valid java name */
    public static final long m1663finalConstraintstfFHcEY(long constraints, boolean softWrap, int overflow, float maxIntrinsicWidth) {
        return Constraints.Companion.m6835fitPrioritizingWidthZbe2FdA(0, m1665finalMaxWidthtfFHcEY(constraints, softWrap, overflow, maxIntrinsicWidth), 0, Constraints.m6825getMaxHeightimpl(constraints));
    }

    /* renamed from: finalMaxWidth-tfFHcEY  reason: not valid java name */
    public static final int m1665finalMaxWidthtfFHcEY(long constraints, boolean softWrap, int overflow, float maxIntrinsicWidth) {
        int maxWidth;
        boolean widthMatters = softWrap || m1666isEllipsisMW5ApA(overflow);
        if (widthMatters && Constraints.m6822getHasBoundedWidthimpl(constraints)) {
            maxWidth = Constraints.m6826getMaxWidthimpl(constraints);
        } else {
            maxWidth = Integer.MAX_VALUE;
        }
        if (Constraints.m6828getMinWidthimpl(constraints) == maxWidth) {
            return maxWidth;
        }
        return RangesKt.coerceIn(TextDelegateKt.ceilToIntPx(maxIntrinsicWidth), Constraints.m6828getMinWidthimpl(constraints), maxWidth);
    }

    /* renamed from: finalMaxLines-xdlQI24  reason: not valid java name */
    public static final int m1664finalMaxLinesxdlQI24(boolean softWrap, int overflow, int maxLinesIn) {
        boolean overwriteMaxLines = !softWrap && m1666isEllipsisMW5ApA(overflow);
        if (overwriteMaxLines) {
            return 1;
        }
        return RangesKt.coerceAtLeast(maxLinesIn, 1);
    }

    /* renamed from: isEllipsis-MW5-ApA  reason: not valid java name */
    public static final boolean m1666isEllipsisMW5ApA(int $this$isEllipsis) {
        return TextOverflow.m6799equalsimpl0($this$isEllipsis, TextOverflow.Companion.m6809getEllipsisgIe3tQ8()) || TextOverflow.m6799equalsimpl0($this$isEllipsis, TextOverflow.Companion.m6811getStartEllipsisgIe3tQ8()) || TextOverflow.m6799equalsimpl0($this$isEllipsis, TextOverflow.Companion.m6810getMiddleEllipsisgIe3tQ8());
    }
}
