package androidx.compose.animation;

import androidx.compose.animation.core.Animatable;
import androidx.compose.animation.core.AnimationVector4D;
import androidx.compose.animation.core.VectorConvertersKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LayoutCoordinatesKt;
import androidx.compose.ui.layout.LookaheadScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.IntSizeKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineStart;
/* compiled from: AnimateBoundsModifier.kt */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0018\u0010&\u001a\u00020\b2\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020*H\u0002J \u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020\u00042\u0006\u0010.\u001a\u00020\u0016ø\u0001\u0000¢\u0006\u0004\b/\u00100J\u001a\u00101\u001a\u00020,2\u0006\u00102\u001a\u00020\u0004H\u0002ø\u0001\u0000¢\u0006\u0004\b3\u0010\u001aJ6\u00104\u001a\u00020,2\u0006\u00105\u001a\u0002062\u0006\u00107\u001a\u0002082\u0006\u0010'\u001a\u00020(2\u0006\u00109\u001a\u00020\u001f2\u0006\u0010:\u001a\u00020\u001f2\u0006\u0010)\u001a\u00020*J\u0018\u0010;\u001a\u00020,2\u0006\u0010.\u001a\u00020\u0016ø\u0001\u0000¢\u0006\u0004\b<\u0010\u001aR\u0016\u0010\u0003\u001a\u00020\u0004X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u001c\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t\u0018\u00010\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R/\u0010\u000b\u001a\u0004\u0018\u00010\b2\b\u0010\n\u001a\u0004\u0018\u00010\b8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0012\u001a\u0004\u0018\u00010\b8F¢\u0006\u0006\u001a\u0004\b\u0013\u0010\rR\u0016\u0010\u0014\u001a\u00020\u0004X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\"\u0010\u0015\u001a\u00020\u0016X\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\u0005\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR\u0016\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u001d\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u001e\u001a\u00020\u001f8F¢\u0006\u0006\u001a\u0004\b\u001e\u0010 R\u000e\u0010!\u001a\u00020\u001fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\"\u001a\u00020\u0004X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u0016\u0010#\u001a\u00020\u0016X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u0013\u0010$\u001a\u0004\u0018\u00010\b8F¢\u0006\u0006\u001a\u0004\b%\u0010\r\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006="}, d2 = {"Landroidx/compose/animation/BoundsTransformDeferredAnimation;", "", "()V", "additionalOffset", "Landroidx/compose/ui/geometry/Offset;", "J", "animatable", "Landroidx/compose/animation/core/Animatable;", "Landroidx/compose/ui/geometry/Rect;", "Landroidx/compose/animation/core/AnimationVector4D;", "<set-?>", "animatedValue", "getAnimatedValue", "()Landroidx/compose/ui/geometry/Rect;", "setAnimatedValue", "(Landroidx/compose/ui/geometry/Rect;)V", "animatedValue$delegate", "Landroidx/compose/runtime/MutableState;", "currentBounds", "getCurrentBounds", "currentPosition", "currentSize", "Landroidx/compose/ui/geometry/Size;", "getCurrentSize-NH-jbRc", "()J", "setCurrentSize-uvyYCjk", "(J)V", "directManipulationParents", "", "Landroidx/compose/ui/layout/LayoutCoordinates;", "isIdle", "", "()Z", "isPending", "targetOffset", "targetSize", "value", "getValue", "animate", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "boundsTransform", "Landroidx/compose/animation/BoundsTransform;", "updateCurrentBounds", "", "position", "size", "updateCurrentBounds-tz77jQw", "(JJ)V", "updateTargetOffset", TypedValues.CycleType.S_WAVE_OFFSET, "updateTargetOffset-k-4lQ0M", "updateTargetOffsetAndAnimate", "lookaheadScope", "Landroidx/compose/ui/layout/LookaheadScope;", "placementScope", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "directManipulationParentsDirty", "includeMotionFrameOfReference", "updateTargetSize", "updateTargetSize-uvyYCjk", "animation"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BoundsTransformDeferredAnimation {
    public static final int $stable = 8;
    private long additionalOffset;
    private Animatable<Rect, AnimationVector4D> animatable;
    private final MutableState animatedValue$delegate;
    private List<LayoutCoordinates> directManipulationParents;
    private boolean isPending;
    private long targetSize = Size.Companion.m4125getUnspecifiedNHjbRc();
    private long targetOffset = Offset.Companion.m4063getUnspecifiedF1C5BW0();
    private long currentPosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
    private long currentSize = Size.Companion.m4125getUnspecifiedNHjbRc();

    public BoundsTransformDeferredAnimation() {
        MutableState mutableStateOf$default;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.animatedValue$delegate = mutableStateOf$default;
        this.additionalOffset = Offset.Companion.m4064getZeroF1C5BW0();
    }

    /* renamed from: updateTargetSize-uvyYCjk  reason: not valid java name */
    public final void m339updateTargetSizeuvyYCjk(long size) {
        long $this$isSpecified$iv = this.targetSize;
        if (($this$isSpecified$iv != InlineClassHelperKt.UnspecifiedPackedFloats) && !IntSize.m7042equalsimpl0(IntSizeKt.m7052roundToIntSizeuvyYCjk(size), IntSizeKt.m7052roundToIntSizeuvyYCjk(this.targetSize))) {
            this.isPending = true;
        }
        this.targetSize = size;
        long $this$isUnspecified$iv = this.currentSize;
        if ($this$isUnspecified$iv == InlineClassHelperKt.UnspecifiedPackedFloats) {
            this.currentSize = size;
        }
    }

    /* renamed from: updateTargetOffset-k-4lQ0M  reason: not valid java name */
    private final void m335updateTargetOffsetk4lQ0M(long offset) {
        long $this$isSpecified$iv = this.targetOffset;
        if ((($this$isSpecified$iv & 9223372034707292159L) != InlineClassHelperKt.UnspecifiedPackedFloats) && !IntOffset.m7000equalsimpl0(IntOffsetKt.m7018roundk4lQ0M(offset), IntOffsetKt.m7018roundk4lQ0M(this.targetOffset))) {
            this.isPending = true;
        }
        this.targetOffset = offset;
        long $this$isUnspecified$iv = this.currentPosition;
        if ((9223372034707292159L & $this$isUnspecified$iv) == InlineClassHelperKt.UnspecifiedPackedFloats) {
            this.currentPosition = offset;
        }
    }

    /* renamed from: getCurrentSize-NH-jbRc  reason: not valid java name */
    public final long m336getCurrentSizeNHjbRc() {
        return this.currentSize;
    }

    /* renamed from: setCurrentSize-uvyYCjk  reason: not valid java name */
    public final void m337setCurrentSizeuvyYCjk(long j) {
        this.currentSize = j;
    }

    public final Rect getCurrentBounds() {
        long size = this.currentSize;
        long position = this.currentPosition;
        if ((9223372034707292159L & position) != InlineClassHelperKt.UnspecifiedPackedFloats) {
            if (size != InlineClassHelperKt.UnspecifiedPackedFloats) {
                return RectKt.m4088Recttz77jQw(position, size);
            }
        }
        return null;
    }

    /* renamed from: updateCurrentBounds-tz77jQw  reason: not valid java name */
    public final void m338updateCurrentBoundstz77jQw(long position, long size) {
        this.currentPosition = position;
        this.currentSize = size;
    }

    public final boolean isIdle() {
        if (this.isPending) {
            return false;
        }
        Animatable<Rect, AnimationVector4D> animatable = this.animatable;
        return !(animatable != null && animatable.isRunning());
    }

    private final Rect getAnimatedValue() {
        State $this$getValue$iv = this.animatedValue$delegate;
        return (Rect) $this$getValue$iv.getValue();
    }

    private final void setAnimatedValue(Rect rect) {
        MutableState $this$setValue$iv = this.animatedValue$delegate;
        $this$setValue$iv.setValue(rect);
    }

    public final Rect getValue() {
        if (isIdle()) {
            return null;
        }
        return getAnimatedValue();
    }

    public final void updateTargetOffsetAndAnimate(LookaheadScope lookaheadScope, Placeable.PlacementScope placementScope, CoroutineScope coroutineScope, boolean directManipulationParentsDirty, boolean includeMotionFrameOfReference, BoundsTransform boundsTransform) {
        long delta;
        LayoutCoordinates coordinates = placementScope.getCoordinates();
        if (coordinates != null) {
            LayoutCoordinates lookaheadScopeCoordinates = lookaheadScope.getLookaheadScopeCoordinates(placementScope);
            long delta2 = Offset.Companion.m4064getZeroF1C5BW0();
            if (!includeMotionFrameOfReference && directManipulationParentsDirty) {
                List parents = this.directManipulationParents;
                if (parents == null) {
                    parents = new ArrayList();
                }
                LayoutCoordinates currentCoords = coordinates;
                int index = 0;
                while (!Intrinsics.areEqual(lookaheadScope.toLookaheadCoordinates(currentCoords), lookaheadScopeCoordinates)) {
                    if (currentCoords.getIntroducesMotionFrameOfReference()) {
                        if (parents.size() == index) {
                            parents.add(currentCoords);
                            delta2 = Offset.m4053plusMKHz9U(delta2, LayoutCoordinatesKt.positionInParent(currentCoords));
                        } else if (!Intrinsics.areEqual(parents.get(index), currentCoords)) {
                            long delta3 = Offset.m4052minusMKHz9U(delta2, LayoutCoordinatesKt.positionInParent(parents.get(index)));
                            parents.set(index, currentCoords);
                            delta2 = Offset.m4053plusMKHz9U(delta3, LayoutCoordinatesKt.positionInParent(currentCoords));
                        }
                        index++;
                    }
                    LayoutCoordinates parentCoordinates = currentCoords.getParentCoordinates();
                    if (parentCoordinates == null) {
                        break;
                    }
                    currentCoords = parentCoordinates;
                }
                int i = parents.size() - 1;
                if (index <= i) {
                    while (true) {
                        delta2 = Offset.m4052minusMKHz9U(delta2, LayoutCoordinatesKt.positionInParent(parents.get(i)));
                        parents.remove(parents.size() - 1);
                        if (i == index) {
                            break;
                        }
                        i--;
                    }
                }
                this.directManipulationParents = parents;
                delta = delta2;
            } else {
                delta = delta2;
            }
            this.additionalOffset = Offset.m4053plusMKHz9U(this.additionalOffset, delta);
            long targetOffset = LookaheadScope.m5665localLookaheadPositionOfauaQtc$default(lookaheadScope, lookaheadScopeCoordinates, coordinates, 0L, includeMotionFrameOfReference, 2, null);
            m335updateTargetOffsetk4lQ0M(Offset.m4053plusMKHz9U(targetOffset, this.additionalOffset));
            Rect animate = animate(coroutineScope, boundsTransform);
            long arg0$iv = this.additionalOffset;
            setAnimatedValue(animate.m4085translatek4lQ0M(Offset.m4040constructorimpl(arg0$iv ^ (-9223372034707292160L))));
        }
    }

    private final Rect animate(CoroutineScope coroutineScope, BoundsTransform boundsTransform) {
        Rect value;
        long $this$isSpecified$iv = this.targetOffset;
        if ((9223372034707292159L & $this$isSpecified$iv) != InlineClassHelperKt.UnspecifiedPackedFloats) {
            long $this$isSpecified$iv2 = this.targetSize;
            if ($this$isSpecified$iv2 != InlineClassHelperKt.UnspecifiedPackedFloats) {
                Rect target = RectKt.m4088Recttz77jQw(this.targetOffset, this.targetSize);
                Animatable animatable = this.animatable;
                Animatable anim = animatable == null ? new Animatable(target, VectorConvertersKt.getVectorConverter(Rect.Companion), null, null, 12, null) : animatable;
                this.animatable = anim;
                if (this.isPending) {
                    this.isPending = false;
                    BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, CoroutineStart.UNDISPATCHED, new BoundsTransformDeferredAnimation$animate$1(anim, target, boundsTransform, this, null), 1, null);
                }
            }
        }
        Animatable<Rect, AnimationVector4D> animatable2 = this.animatable;
        return (animatable2 == null || (value = animatable2.getValue()) == null) ? Rect.Companion.getZero() : value;
    }
}
