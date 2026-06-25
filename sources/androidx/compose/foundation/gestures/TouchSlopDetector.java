package androidx.compose.foundation.gestures;

import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.pointer.PointerInputChange;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: DragGestureDetector.kt */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0006\b\u0000\u0018\u00002\u00020\u0001B\u001b\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J#\u0010\u000b\u001a\u00020\u00052\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011J\u001d\u0010\u0012\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014J\u0006\u0010\u0015\u001a\u00020\u0016J\u0014\u0010\u0017\u001a\u00020\u000f*\u00020\u0005ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0019J\u0014\u0010\u001a\u001a\u00020\u000f*\u00020\u0005ø\u0001\u0000¢\u0006\u0004\b\u001b\u0010\u0019R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0016\u0010\t\u001a\u00020\u0005X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\n\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001c"}, d2 = {"Landroidx/compose/foundation/gestures/TouchSlopDetector;", "", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "initialPositionChange", "Landroidx/compose/ui/geometry/Offset;", "(Landroidx/compose/foundation/gestures/Orientation;JLkotlin/jvm/internal/DefaultConstructorMarker;)V", "getOrientation", "()Landroidx/compose/foundation/gestures/Orientation;", "totalPositionChange", "J", "addPointerInputChange", "dragEvent", "Landroidx/compose/ui/input/pointer/PointerInputChange;", "touchSlop", "", "addPointerInputChange-dBAh8RU", "(Landroidx/compose/ui/input/pointer/PointerInputChange;F)J", "calculatePostSlopOffset", "calculatePostSlopOffset-tuRUvjQ", "(F)J", "reset", "", "crossAxis", "crossAxis-k-4lQ0M", "(J)F", "mainAxis", "mainAxis-k-4lQ0M", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TouchSlopDetector {
    public static final int $stable = 8;
    private final Orientation orientation;
    private long totalPositionChange;

    public /* synthetic */ TouchSlopDetector(Orientation orientation, long j, DefaultConstructorMarker defaultConstructorMarker) {
        this(orientation, j);
    }

    private TouchSlopDetector(Orientation orientation, long initialPositionChange) {
        this.orientation = orientation;
        this.totalPositionChange = initialPositionChange;
    }

    public /* synthetic */ TouchSlopDetector(Orientation orientation, long j, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : orientation, (i & 2) != 0 ? Offset.Companion.m4064getZeroF1C5BW0() : j, null);
    }

    public final Orientation getOrientation() {
        return this.orientation;
    }

    /* renamed from: mainAxis-k-4lQ0M  reason: not valid java name */
    public final float m791mainAxisk4lQ0M(long $this$mainAxis_u2dk_u2d4lQ0M) {
        if (this.orientation == Orientation.Horizontal) {
            int bits$iv$iv$iv = (int) ($this$mainAxis_u2dk_u2d4lQ0M >> 32);
            return Float.intBitsToFloat(bits$iv$iv$iv);
        }
        int bits$iv$iv$iv2 = (int) (4294967295L & $this$mainAxis_u2dk_u2d4lQ0M);
        return Float.intBitsToFloat(bits$iv$iv$iv2);
    }

    /* renamed from: crossAxis-k-4lQ0M  reason: not valid java name */
    public final float m790crossAxisk4lQ0M(long $this$crossAxis_u2dk_u2d4lQ0M) {
        if (this.orientation == Orientation.Horizontal) {
            int bits$iv$iv$iv = (int) (4294967295L & $this$crossAxis_u2dk_u2d4lQ0M);
            return Float.intBitsToFloat(bits$iv$iv$iv);
        }
        int bits$iv$iv$iv2 = (int) ($this$crossAxis_u2dk_u2d4lQ0M >> 32);
        return Float.intBitsToFloat(bits$iv$iv$iv2);
    }

    /* renamed from: addPointerInputChange-dBAh8RU  reason: not valid java name */
    public final long m789addPointerInputChangedBAh8RU(PointerInputChange dragEvent, float touchSlop) {
        float inDirection;
        long currentPosition = dragEvent.m5512getPositionF1C5BW0();
        long previousPosition = dragEvent.m5513getPreviousPositionF1C5BW0();
        long positionChange = Offset.m4052minusMKHz9U(currentPosition, previousPosition);
        this.totalPositionChange = Offset.m4053plusMKHz9U(this.totalPositionChange, positionChange);
        Orientation orientation = this.orientation;
        long j = this.totalPositionChange;
        if (orientation == null) {
            inDirection = Offset.m4046getDistanceimpl(j);
        } else {
            inDirection = Math.abs(m791mainAxisk4lQ0M(j));
        }
        boolean hasCrossedSlop = inDirection >= touchSlop;
        if (hasCrossedSlop) {
            return m788calculatePostSlopOffsettuRUvjQ(touchSlop);
        }
        return Offset.Companion.m4063getUnspecifiedF1C5BW0();
    }

    public final void reset() {
        this.totalPositionChange = Offset.Companion.m4064getZeroF1C5BW0();
    }

    /* renamed from: calculatePostSlopOffset-tuRUvjQ  reason: not valid java name */
    private final long m788calculatePostSlopOffsettuRUvjQ(float touchSlop) {
        Orientation orientation = this.orientation;
        long j = this.totalPositionChange;
        if (orientation == null) {
            long touchSlopOffset = Offset.m4055timestuRUvjQ(Offset.m4043divtuRUvjQ(j, Offset.m4046getDistanceimpl(this.totalPositionChange)), touchSlop);
            return Offset.m4052minusMKHz9U(this.totalPositionChange, touchSlopOffset);
        }
        float finalMainAxisChange = m791mainAxisk4lQ0M(j) - (Math.signum(m791mainAxisk4lQ0M(this.totalPositionChange)) * touchSlop);
        float finalCrossAxisChange = m790crossAxisk4lQ0M(this.totalPositionChange);
        if (this.orientation == Orientation.Horizontal) {
            long v1$iv$iv = Float.floatToRawIntBits(finalMainAxisChange);
            long v2$iv$iv = Float.floatToRawIntBits(finalCrossAxisChange);
            return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
        }
        long v1$iv$iv2 = Float.floatToRawIntBits(finalCrossAxisChange);
        long v2$iv$iv2 = Float.floatToRawIntBits(finalMainAxisChange);
        return Offset.m4040constructorimpl((v1$iv$iv2 << 32) | (4294967295L & v2$iv$iv2));
    }
}
