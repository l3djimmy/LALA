package androidx.compose.foundation.text.selection;

import androidx.compose.ui.geometry.Rect;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: SelectionMode.kt */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\"\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH ø\u0001\u0000¢\u0006\u0004\b\t\u0010\nJ*\u0010\u000b\u001a\u00020\f2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006H\u0000ø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0010J\u001e\u0010\u0011\u001a\u00020\f*\u00020\b2\u0006\u0010\u0012\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014j\u0002\b\u0015j\u0002\b\u0016\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0017"}, d2 = {"Landroidx/compose/foundation/text/selection/SelectionMode;", "", "(Ljava/lang/String;I)V", "compare", "", "position", "Landroidx/compose/ui/geometry/Offset;", "bounds", "Landroidx/compose/ui/geometry/Rect;", "compare-3MmeM6k$foundation_release", "(JLandroidx/compose/ui/geometry/Rect;)I", "isSelected", "", "start", "end", "isSelected-2x9bVx0$foundation_release", "(Landroidx/compose/ui/geometry/Rect;JJ)Z", "containsInclusive", TypedValues.CycleType.S_WAVE_OFFSET, "containsInclusive-Uv8p0NA", "(Landroidx/compose/ui/geometry/Rect;J)Z", "Vertical", "Horizontal", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public enum SelectionMode {
    Vertical { // from class: androidx.compose.foundation.text.selection.SelectionMode.Vertical
        @Override // androidx.compose.foundation.text.selection.SelectionMode
        /* renamed from: compare-3MmeM6k$foundation_release */
        public int mo1759compare3MmeM6k$foundation_release(long position, Rect bounds) {
            if (SelectionManagerKt.m1752containsInclusiveUv8p0NA(bounds, position)) {
                return 0;
            }
            int bits$iv$iv$iv = (int) (position & 4294967295L);
            if (Float.intBitsToFloat(bits$iv$iv$iv) < bounds.getTop()) {
                return -1;
            }
            int bits$iv$iv$iv2 = (int) (position >> 32);
            if (Float.intBitsToFloat(bits$iv$iv$iv2) >= bounds.getLeft()) {
                return 1;
            }
            int bits$iv$iv$iv3 = (int) (4294967295L & position);
            return Float.intBitsToFloat(bits$iv$iv$iv3) < bounds.getBottom() ? -1 : 1;
        }
    },
    Horizontal { // from class: androidx.compose.foundation.text.selection.SelectionMode.Horizontal
        @Override // androidx.compose.foundation.text.selection.SelectionMode
        /* renamed from: compare-3MmeM6k$foundation_release */
        public int mo1759compare3MmeM6k$foundation_release(long position, Rect bounds) {
            if (SelectionManagerKt.m1752containsInclusiveUv8p0NA(bounds, position)) {
                return 0;
            }
            int bits$iv$iv$iv = (int) (position >> 32);
            if (Float.intBitsToFloat(bits$iv$iv$iv) < bounds.getLeft()) {
                return -1;
            }
            int bits$iv$iv$iv2 = (int) (4294967295L & position);
            if (Float.intBitsToFloat(bits$iv$iv$iv2) >= bounds.getTop()) {
                return 1;
            }
            int bits$iv$iv$iv3 = (int) (position >> 32);
            return Float.intBitsToFloat(bits$iv$iv$iv3) < bounds.getRight() ? -1 : 1;
        }
    };
    
    private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

    /* synthetic */ SelectionMode(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public static EnumEntries<SelectionMode> getEntries() {
        return $ENTRIES;
    }

    /* renamed from: compare-3MmeM6k$foundation_release  reason: not valid java name */
    public abstract int mo1759compare3MmeM6k$foundation_release(long j, Rect rect);

    /* renamed from: isSelected-2x9bVx0$foundation_release  reason: not valid java name */
    public final boolean m1760isSelected2x9bVx0$foundation_release(Rect bounds, long start, long end) {
        if (m1758containsInclusiveUv8p0NA(bounds, start) || m1758containsInclusiveUv8p0NA(bounds, end)) {
            return true;
        }
        int compareStart = mo1759compare3MmeM6k$foundation_release(start, bounds);
        int compareEnd = mo1759compare3MmeM6k$foundation_release(end, bounds);
        return (compareEnd > 0) ^ (compareStart > 0);
    }

    /* renamed from: containsInclusive-Uv8p0NA  reason: not valid java name */
    private final boolean m1758containsInclusiveUv8p0NA(Rect $this$containsInclusive_u2dUv8p0NA, long offset) {
        float left = $this$containsInclusive_u2dUv8p0NA.getLeft();
        float right = $this$containsInclusive_u2dUv8p0NA.getRight();
        int bits$iv$iv$iv = (int) (offset >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
        if (left <= intBitsToFloat && intBitsToFloat <= right) {
            float top = $this$containsInclusive_u2dUv8p0NA.getTop();
            float bottom = $this$containsInclusive_u2dUv8p0NA.getBottom();
            int bits$iv$iv$iv2 = (int) (4294967295L & offset);
            float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv2);
            if (top <= intBitsToFloat2 && intBitsToFloat2 <= bottom) {
                return true;
            }
        }
        return false;
    }
}
