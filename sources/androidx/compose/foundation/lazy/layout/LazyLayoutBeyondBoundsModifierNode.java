package androidx.compose.foundation.lazy.layout;

import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsInfo;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.BeyondBoundsLayout;
import androidx.compose.ui.layout.BeyondBoundsLayoutKt;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.modifier.ModifierLocalMap;
import androidx.compose.ui.modifier.ModifierLocalModifierNode;
import androidx.compose.ui.modifier.ModifierLocalModifierNodeKt;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.node.LayoutModifierNodeKt;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.exifinterface.media.ExifInterface;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.RangesKt;
/* compiled from: LazyLayoutBeyondBoundsModifierLocal.kt */
@Metadata(d1 = {"\u0000x\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u0000 42\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u00014B%\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f¢\u0006\u0002\u0010\rJ\"\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0016H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018J=\u0010\u0019\u001a\u0004\u0018\u0001H\u001a\"\u0004\b\u0000\u0010\u001a2\u0006\u0010\u0015\u001a\u00020\u00162\u0019\u0010\u001b\u001a\u0015\u0012\u0004\u0012\u00020\u001d\u0012\u0006\u0012\u0004\u0018\u0001H\u001a0\u001c¢\u0006\u0002\b\u001eH\u0016ø\u0001\u0000¢\u0006\u0004\b\u001f\u0010 J&\u0010!\u001a\u00020\"2\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fJ\u001e\u0010#\u001a\u00020\n*\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0016H\u0002ø\u0001\u0000¢\u0006\u0004\b$\u0010%J\u0016\u0010&\u001a\u00020\n*\u00020\u0016H\u0002ø\u0001\u0000¢\u0006\u0004\b'\u0010(J\u0016\u0010)\u001a\u00020\n*\u00020\u0016H\u0002ø\u0001\u0000¢\u0006\u0004\b*\u0010(J&\u0010+\u001a\u00020,*\u00020-2\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u000201H\u0016ø\u0001\u0000¢\u0006\u0004\b2\u00103R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00020\u000f8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u00065"}, d2 = {"Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/modifier/ModifierLocalModifierNode;", "Landroidx/compose/ui/layout/BeyondBoundsLayout;", "Landroidx/compose/ui/node/LayoutModifierNode;", "state", "Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsState;", "beyondBoundsInfo", "Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo;", "reverseLayout", "", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsState;Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo;ZLandroidx/compose/foundation/gestures/Orientation;)V", "providedValues", "Landroidx/compose/ui/modifier/ModifierLocalMap;", "getProvidedValues", "()Landroidx/compose/ui/modifier/ModifierLocalMap;", "addNextInterval", "Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo$Interval;", "currentInterval", "direction", "Landroidx/compose/ui/layout/BeyondBoundsLayout$LayoutDirection;", "addNextInterval-FR3nfPY", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo$Interval;I)Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo$Interval;", "layout", ExifInterface.GPS_DIRECTION_TRUE, "block", "Lkotlin/Function1;", "Landroidx/compose/ui/layout/BeyondBoundsLayout$BeyondBoundsScope;", "Lkotlin/ExtensionFunctionType;", "layout-o7g1Pn8", "(ILkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "update", "", "hasMoreContent", "hasMoreContent-FR3nfPY", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsInfo$Interval;I)Z", "isForward", "isForward-4vf7U8o", "(I)Z", "isOppositeToOrientation", "isOppositeToOrientation-4vf7U8o", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurable", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "Companion", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyLayoutBeyondBoundsModifierNode extends Modifier.Node implements ModifierLocalModifierNode, BeyondBoundsLayout, LayoutModifierNode {
    private LazyLayoutBeyondBoundsInfo beyondBoundsInfo;
    private Orientation orientation;
    private boolean reverseLayout;
    private LazyLayoutBeyondBoundsState state;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private static final LazyLayoutBeyondBoundsModifierNode$Companion$emptyBeyondBoundsScope$1 emptyBeyondBoundsScope = new BeyondBoundsLayout.BeyondBoundsScope() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsModifierNode$Companion$emptyBeyondBoundsScope$1
        private final boolean hasMoreContent;

        @Override // androidx.compose.ui.layout.BeyondBoundsLayout.BeyondBoundsScope
        public boolean getHasMoreContent() {
            return this.hasMoreContent;
        }
    };

    /* compiled from: LazyLayoutBeyondBoundsModifierLocal.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[LayoutDirection.values().length];
            try {
                iArr[LayoutDirection.Ltr.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[LayoutDirection.Rtl.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public LazyLayoutBeyondBoundsModifierNode(LazyLayoutBeyondBoundsState state, LazyLayoutBeyondBoundsInfo beyondBoundsInfo, boolean reverseLayout, Orientation orientation) {
        this.state = state;
        this.beyondBoundsInfo = beyondBoundsInfo;
        this.reverseLayout = reverseLayout;
        this.orientation = orientation;
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        final Placeable placeable = measurable.mo5637measureBRTryo0(constraints);
        return MeasureScope.layout$default($this$measure_u2d3p2s80s, placeable.getWidth(), placeable.getHeight(), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsModifierNode$measure$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                invoke2(placementScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Placeable.PlacementScope $this$layout) {
                Placeable.PlacementScope.place$default($this$layout, Placeable.this, 0, 0, 0.0f, 4, null);
            }
        }, 4, null);
    }

    @Override // androidx.compose.ui.modifier.ModifierLocalModifierNode
    public ModifierLocalMap getProvidedValues() {
        return ModifierLocalModifierNodeKt.modifierLocalMapOf(TuplesKt.to(BeyondBoundsLayoutKt.getModifierLocalBeyondBoundsLayout(), this));
    }

    /* compiled from: LazyLayoutBeyondBoundsModifierLocal.kt */
    @Metadata(d1 = {"\u0000\u0013\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\b\u0003*\u0001\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0010\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0005¨\u0006\u0006"}, d2 = {"Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsModifierNode$Companion;", "", "()V", "emptyBeyondBoundsScope", "androidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsModifierNode$Companion$emptyBeyondBoundsScope$1", "Landroidx/compose/foundation/lazy/layout/LazyLayoutBeyondBoundsModifierNode$Companion$emptyBeyondBoundsScope$1;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    @Override // androidx.compose.ui.layout.BeyondBoundsLayout
    /* renamed from: layout-o7g1Pn8  reason: not valid java name */
    public <T> T mo1149layouto7g1Pn8(final int direction, Function1<? super BeyondBoundsLayout.BeyondBoundsScope, ? extends T> function1) {
        int startIndex;
        if (this.state.getItemCount() <= 0 || !this.state.getHasVisibleItems() || !isAttached()) {
            return function1.invoke(emptyBeyondBoundsScope);
        }
        boolean m1147isForward4vf7U8o = m1147isForward4vf7U8o(direction);
        LazyLayoutBeyondBoundsState lazyLayoutBeyondBoundsState = this.state;
        if (m1147isForward4vf7U8o) {
            startIndex = lazyLayoutBeyondBoundsState.getLastPlacedIndex();
        } else {
            startIndex = lazyLayoutBeyondBoundsState.getFirstPlacedIndex();
        }
        final Ref.ObjectRef interval = new Ref.ObjectRef();
        interval.element = (T) this.beyondBoundsInfo.addInterval(startIndex, startIndex);
        T t = null;
        int maxItemsToLayout = RangesKt.coerceAtMost(this.state.itemsPerViewport() * 2, this.state.getItemCount());
        int itemsCreatedSoFar = 0;
        while (t == null && m1146hasMoreContentFR3nfPY((LazyLayoutBeyondBoundsInfo.Interval) interval.element, direction) && itemsCreatedSoFar < maxItemsToLayout) {
            this.beyondBoundsInfo.removeInterval((LazyLayoutBeyondBoundsInfo.Interval) interval.element);
            interval.element = (T) m1145addNextIntervalFR3nfPY((LazyLayoutBeyondBoundsInfo.Interval) interval.element, direction);
            itemsCreatedSoFar++;
            LayoutModifierNodeKt.remeasureSync(this);
            t = function1.invoke(new BeyondBoundsLayout.BeyondBoundsScope() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsModifierNode$layout$2
                @Override // androidx.compose.ui.layout.BeyondBoundsLayout.BeyondBoundsScope
                public boolean getHasMoreContent() {
                    boolean m1146hasMoreContentFR3nfPY;
                    m1146hasMoreContentFR3nfPY = LazyLayoutBeyondBoundsModifierNode.this.m1146hasMoreContentFR3nfPY(interval.element, direction);
                    return m1146hasMoreContentFR3nfPY;
                }
            });
        }
        this.beyondBoundsInfo.removeInterval((LazyLayoutBeyondBoundsInfo.Interval) interval.element);
        LayoutModifierNodeKt.remeasureSync(this);
        return t;
    }

    /* renamed from: isForward-4vf7U8o  reason: not valid java name */
    private final boolean m1147isForward4vf7U8o(int $this$isForward_u2d4vf7U8o) {
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isForward_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5625getBeforehoxUOeE())) {
            return false;
        }
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isForward_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5624getAfterhoxUOeE())) {
            return true;
        }
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isForward_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5623getAbovehoxUOeE())) {
            return this.reverseLayout;
        }
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isForward_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5626getBelowhoxUOeE())) {
            return !this.reverseLayout;
        } else if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isForward_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5627getLefthoxUOeE())) {
            switch (WhenMappings.$EnumSwitchMapping$0[DelegatableNodeKt.requireLayoutDirection(this).ordinal()]) {
                case 1:
                    return this.reverseLayout;
                case 2:
                    return !this.reverseLayout;
                default:
                    throw new NoWhenBranchMatchedException();
            }
        } else if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isForward_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5628getRighthoxUOeE())) {
            switch (WhenMappings.$EnumSwitchMapping$0[DelegatableNodeKt.requireLayoutDirection(this).ordinal()]) {
                case 1:
                    return !this.reverseLayout;
                case 2:
                    return this.reverseLayout;
                default:
                    throw new NoWhenBranchMatchedException();
            }
        } else {
            LazyLayoutBeyondBoundsModifierLocalKt.access$unsupportedDirection();
            throw new KotlinNothingValueException();
        }
    }

    /* renamed from: addNextInterval-FR3nfPY  reason: not valid java name */
    private final LazyLayoutBeyondBoundsInfo.Interval m1145addNextIntervalFR3nfPY(LazyLayoutBeyondBoundsInfo.Interval currentInterval, int direction) {
        int start = currentInterval.getStart();
        int end = currentInterval.getEnd();
        if (m1147isForward4vf7U8o(direction)) {
            end++;
        } else {
            start--;
        }
        return this.beyondBoundsInfo.addInterval(start, end);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: hasMoreContent-FR3nfPY  reason: not valid java name */
    public final boolean m1146hasMoreContentFR3nfPY(LazyLayoutBeyondBoundsInfo.Interval $this$hasMoreContent_u2dFR3nfPY, int direction) {
        if (m1148isOppositeToOrientation4vf7U8o(direction)) {
            return false;
        }
        if (m1147isForward4vf7U8o(direction)) {
            if ($this$hasMoreContent_u2dFR3nfPY.getEnd() >= this.state.getItemCount() - 1) {
                return false;
            }
        } else if ($this$hasMoreContent_u2dFR3nfPY.getStart() <= 0) {
            return false;
        }
        return true;
    }

    /* renamed from: isOppositeToOrientation-4vf7U8o  reason: not valid java name */
    private final boolean m1148isOppositeToOrientation4vf7U8o(int $this$isOppositeToOrientation_u2d4vf7U8o) {
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isOppositeToOrientation_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5623getAbovehoxUOeE()) ? true : BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isOppositeToOrientation_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5626getBelowhoxUOeE())) {
            return this.orientation == Orientation.Horizontal;
        }
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isOppositeToOrientation_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5627getLefthoxUOeE()) ? true : BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isOppositeToOrientation_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5628getRighthoxUOeE())) {
            return this.orientation == Orientation.Vertical;
        }
        if (BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isOppositeToOrientation_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5625getBeforehoxUOeE()) ? true : BeyondBoundsLayout.LayoutDirection.m5619equalsimpl0($this$isOppositeToOrientation_u2d4vf7U8o, BeyondBoundsLayout.LayoutDirection.Companion.m5624getAfterhoxUOeE())) {
            return false;
        }
        LazyLayoutBeyondBoundsModifierLocalKt.access$unsupportedDirection();
        throw new KotlinNothingValueException();
    }

    public final void update(LazyLayoutBeyondBoundsState state, LazyLayoutBeyondBoundsInfo beyondBoundsInfo, boolean reverseLayout, Orientation orientation) {
        this.state = state;
        this.beyondBoundsInfo = beyondBoundsInfo;
        this.reverseLayout = reverseLayout;
        this.orientation = orientation;
    }
}
