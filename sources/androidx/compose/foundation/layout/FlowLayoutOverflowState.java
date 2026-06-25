package androidx.compose.foundation.layout;

import androidx.autofill.HintConstants;
import androidx.collection.IntIntPair;
import androidx.compose.foundation.layout.FlowLayoutBuildingBlocks;
import androidx.compose.foundation.layout.FlowLayoutOverflow;
import androidx.compose.ui.layout.IntrinsicMeasurable;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Constraints;
import com.itextpdf.kernel.xmp.PdfConst;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: FlowLayoutOverflow.kt */
@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000e\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0080\b\u0018\u00002\u00020\u0001B\u001f\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0002\u0010\u0007J\u000e\u0010*\u001a\u00020\u0003HÀ\u0003¢\u0006\u0002\b+J\u000e\u0010,\u001a\u00020\u0005HÀ\u0003¢\u0006\u0002\b-J\u000e\u0010.\u001a\u00020\u0005HÀ\u0003¢\u0006\u0002\b/J'\u00100\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001J'\u00101\u001a\u0004\u0018\u0001022\u0006\u00103\u001a\u00020\u00102\u0006\u00104\u001a\u00020\u00052\u0006\u00105\u001a\u00020\u0005H\u0000¢\u0006\u0002\b6J-\u00107\u001a\u0004\u0018\u00010\r2\u0006\u00103\u001a\u00020\u00102\u0006\u00104\u001a\u00020\u00052\u0006\u00105\u001a\u00020\u0005H\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0002\b8J\u0013\u00109\u001a\u00020\u00102\b\u0010:\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010;\u001a\u00020\u0005HÖ\u0001J6\u0010<\u001a\u00020=2\u0006\u0010>\u001a\u00020?2\b\u0010\u001f\u001a\u0004\u0018\u00010\t2\b\u0010\b\u001a\u0004\u0018\u00010\t2\u0006\u0010@\u001a\u00020AH\u0000ø\u0001\u0000¢\u0006\u0004\bB\u0010CJ\\\u0010<\u001a\u00020=2\u0006\u0010>\u001a\u00020?2\u0006\u0010@\u001a\u00020A28\u0010\u000e\u001a4\u0012\u0013\u0012\u00110\u0010¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(\u0013\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(D\u0012\u0006\u0012\u0004\u0018\u00010\t0\u000fH\u0000ø\u0001\u0000¢\u0006\u0004\bE\u0010FJ6\u0010<\u001a\u00020=2\b\u0010\u001f\u001a\u0004\u0018\u00010G2\b\u0010\b\u001a\u0004\u0018\u00010G2\u0006\u0010H\u001a\u00020\u00102\u0006\u0010@\u001a\u00020AH\u0000ø\u0001\u0000¢\u0006\u0004\bB\u0010IJ\t\u0010J\u001a\u00020%HÖ\u0001R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\f\u001a\u0004\u0018\u00010\rX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000RB\u0010\u000e\u001a6\u0012\u0013\u0012\u00110\u0010¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(\u0013\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(\u0014\u0012\u0006\u0012\u0004\u0018\u00010\t\u0018\u00010\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0015\u001a\u00020\u0005X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R\u001a\u0010\u001a\u001a\u00020\u0005X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u0017\"\u0004\b\u001c\u0010\u0019R\u0014\u0010\u0006\u001a\u00020\u0005X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0017R\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0017R\u0010\u0010\u001f\u001a\u0004\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010!\u001a\u0004\u0018\u00010\rX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u0014\u0010\"\u001a\u00020\u00058@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b#\u0010\u0017R\u0014\u0010$\u001a\u00020%X\u0080D¢\u0006\b\n\u0000\u001a\u0004\b&\u0010'R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b(\u0010)\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006K"}, d2 = {"Landroidx/compose/foundation/layout/FlowLayoutOverflowState;", "", PdfConst.Type, "Landroidx/compose/foundation/layout/FlowLayoutOverflow$OverflowType;", "minLinesToShowCollapse", "", "minCrossAxisSizeToShowCollapse", "(Landroidx/compose/foundation/layout/FlowLayoutOverflow$OverflowType;II)V", "collapseMeasurable", "Landroidx/compose/ui/layout/Measurable;", "collapsePlaceable", "Landroidx/compose/ui/layout/Placeable;", "collapseSize", "Landroidx/collection/IntIntPair;", "getOverflowMeasurable", "Lkotlin/Function2;", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "isExpandable", "noOfItemsShown", "itemCount", "getItemCount$foundation_layout_release", "()I", "setItemCount$foundation_layout_release", "(I)V", "itemShown", "getItemShown$foundation_layout_release", "setItemShown$foundation_layout_release", "getMinCrossAxisSizeToShowCollapse$foundation_layout_release", "getMinLinesToShowCollapse$foundation_layout_release", "seeMoreMeasurable", "seeMorePlaceable", "seeMoreSize", "shownItemCount", "getShownItemCount$foundation_layout_release", "shownItemLazyErrorMessage", "", "getShownItemLazyErrorMessage$foundation_layout_release", "()Ljava/lang/String;", "getType$foundation_layout_release", "()Landroidx/compose/foundation/layout/FlowLayoutOverflow$OverflowType;", "component1", "component1$foundation_layout_release", "component2", "component2$foundation_layout_release", "component3", "component3$foundation_layout_release", "copy", "ellipsisInfo", "Landroidx/compose/foundation/layout/FlowLayoutBuildingBlocks$WrapEllipsisInfo;", "hasNext", "lineIndex", "totalCrossAxisSize", "ellipsisInfo$foundation_layout_release", "ellipsisSize", "ellipsisSize-F35zm-w$foundation_layout_release", "equals", "other", "hashCode", "setOverflowMeasurables", "", "measurePolicy", "Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "setOverflowMeasurables--hBUhpc$foundation_layout_release", "(Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;Landroidx/compose/ui/layout/Measurable;Landroidx/compose/ui/layout/Measurable;J)V", "numberOfItemsShown", "setOverflowMeasurables-VKLhPVY$foundation_layout_release", "(Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;JLkotlin/jvm/functions/Function2;)V", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "isHorizontal", "(Landroidx/compose/ui/layout/IntrinsicMeasurable;Landroidx/compose/ui/layout/IntrinsicMeasurable;ZJ)V", "toString", "foundation-layout_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class FlowLayoutOverflowState {
    public static final int $stable = 8;
    private Measurable collapseMeasurable;
    private Placeable collapsePlaceable;
    private IntIntPair collapseSize;
    private Function2<? super Boolean, ? super Integer, ? extends Measurable> getOverflowMeasurable;
    private int itemCount;
    private final int minCrossAxisSizeToShowCollapse;
    private final int minLinesToShowCollapse;
    private Measurable seeMoreMeasurable;
    private Placeable seeMorePlaceable;
    private IntIntPair seeMoreSize;
    private final FlowLayoutOverflow.OverflowType type;
    private final String shownItemLazyErrorMessage = "Accessing shownItemCount before it is set. Are you calling this in the Composition phase, rather than in the draw phase? Consider our samples on how to use it during the draw phase or consider using ContextualFlowRow/ContextualFlowColumn which initializes this method in the composition phase.";
    private int itemShown = -1;

    /* compiled from: FlowLayoutOverflow.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[FlowLayoutOverflow.OverflowType.values().length];
            try {
                iArr[FlowLayoutOverflow.OverflowType.Visible.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[FlowLayoutOverflow.OverflowType.Clip.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[FlowLayoutOverflow.OverflowType.ExpandIndicator.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[FlowLayoutOverflow.OverflowType.ExpandOrCollapseIndicator.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public static /* synthetic */ FlowLayoutOverflowState copy$default(FlowLayoutOverflowState flowLayoutOverflowState, FlowLayoutOverflow.OverflowType overflowType, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            overflowType = flowLayoutOverflowState.type;
        }
        if ((i3 & 2) != 0) {
            i = flowLayoutOverflowState.minLinesToShowCollapse;
        }
        if ((i3 & 4) != 0) {
            i2 = flowLayoutOverflowState.minCrossAxisSizeToShowCollapse;
        }
        return flowLayoutOverflowState.copy(overflowType, i, i2);
    }

    public final FlowLayoutOverflow.OverflowType component1$foundation_layout_release() {
        return this.type;
    }

    public final int component2$foundation_layout_release() {
        return this.minLinesToShowCollapse;
    }

    public final int component3$foundation_layout_release() {
        return this.minCrossAxisSizeToShowCollapse;
    }

    public final FlowLayoutOverflowState copy(FlowLayoutOverflow.OverflowType overflowType, int i, int i2) {
        return new FlowLayoutOverflowState(overflowType, i, i2);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof FlowLayoutOverflowState) {
            FlowLayoutOverflowState flowLayoutOverflowState = (FlowLayoutOverflowState) obj;
            return this.type == flowLayoutOverflowState.type && this.minLinesToShowCollapse == flowLayoutOverflowState.minLinesToShowCollapse && this.minCrossAxisSizeToShowCollapse == flowLayoutOverflowState.minCrossAxisSizeToShowCollapse;
        }
        return false;
    }

    public int hashCode() {
        return (((this.type.hashCode() * 31) + Integer.hashCode(this.minLinesToShowCollapse)) * 31) + Integer.hashCode(this.minCrossAxisSizeToShowCollapse);
    }

    public String toString() {
        return "FlowLayoutOverflowState(type=" + this.type + ", minLinesToShowCollapse=" + this.minLinesToShowCollapse + ", minCrossAxisSizeToShowCollapse=" + this.minCrossAxisSizeToShowCollapse + ')';
    }

    public FlowLayoutOverflowState(FlowLayoutOverflow.OverflowType type, int minLinesToShowCollapse, int minCrossAxisSizeToShowCollapse) {
        this.type = type;
        this.minLinesToShowCollapse = minLinesToShowCollapse;
        this.minCrossAxisSizeToShowCollapse = minCrossAxisSizeToShowCollapse;
    }

    public final FlowLayoutOverflow.OverflowType getType$foundation_layout_release() {
        return this.type;
    }

    public final int getMinLinesToShowCollapse$foundation_layout_release() {
        return this.minLinesToShowCollapse;
    }

    public final int getMinCrossAxisSizeToShowCollapse$foundation_layout_release() {
        return this.minCrossAxisSizeToShowCollapse;
    }

    public final int getShownItemCount$foundation_layout_release() {
        if (this.itemShown == -1) {
            throw new IllegalStateException(this.shownItemLazyErrorMessage);
        }
        return this.itemShown;
    }

    public final String getShownItemLazyErrorMessage$foundation_layout_release() {
        return this.shownItemLazyErrorMessage;
    }

    public final int getItemShown$foundation_layout_release() {
        return this.itemShown;
    }

    public final void setItemShown$foundation_layout_release(int i) {
        this.itemShown = i;
    }

    public final int getItemCount$foundation_layout_release() {
        return this.itemCount;
    }

    public final void setItemCount$foundation_layout_release(int i) {
        this.itemCount = i;
    }

    /* renamed from: ellipsisSize-F35zm-w$foundation_layout_release  reason: not valid java name */
    public final IntIntPair m920ellipsisSizeF35zmw$foundation_layout_release(boolean hasNext, int lineIndex, int totalCrossAxisSize) {
        switch (WhenMappings.$EnumSwitchMapping$0[this.type.ordinal()]) {
            case 1:
            case 2:
                return null;
            case 3:
                if (hasNext) {
                    return this.seeMoreSize;
                }
                return null;
            case 4:
                if (hasNext) {
                    return this.seeMoreSize;
                }
                if (lineIndex + 1 < this.minLinesToShowCollapse || totalCrossAxisSize < this.minCrossAxisSizeToShowCollapse) {
                    return null;
                }
                return this.collapseSize;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    public final FlowLayoutBuildingBlocks.WrapEllipsisInfo ellipsisInfo$foundation_layout_release(boolean hasNext, int lineIndex, int totalCrossAxisSize) {
        Measurable measurable;
        IntIntPair ellipsisSize;
        Placeable placeable;
        Measurable measurable2;
        Measurable measurable3;
        switch (WhenMappings.$EnumSwitchMapping$0[this.type.ordinal()]) {
            case 1:
            case 2:
                return null;
            case 3:
            case 4:
                Measurable measurable4 = null;
                if (!hasNext) {
                    if (lineIndex >= this.minLinesToShowCollapse - 1 && totalCrossAxisSize >= this.minCrossAxisSizeToShowCollapse) {
                        Function2<? super Boolean, ? super Integer, ? extends Measurable> function2 = this.getOverflowMeasurable;
                        if (function2 == null || (measurable2 = function2.invoke(false, Integer.valueOf(getShownItemCount$foundation_layout_release()))) == null) {
                            measurable2 = this.collapseMeasurable;
                        }
                        measurable4 = measurable2;
                    }
                    IntIntPair ellipsisSize2 = this.collapseSize;
                    if (this.getOverflowMeasurable != null) {
                        measurable = measurable4;
                        ellipsisSize = ellipsisSize2;
                        placeable = null;
                    } else {
                        Placeable placeable2 = this.collapsePlaceable;
                        measurable = measurable4;
                        ellipsisSize = ellipsisSize2;
                        placeable = placeable2;
                    }
                } else {
                    Function2<? super Boolean, ? super Integer, ? extends Measurable> function22 = this.getOverflowMeasurable;
                    if (function22 == null || (measurable3 = function22.invoke(true, Integer.valueOf(getShownItemCount$foundation_layout_release()))) == null) {
                        measurable3 = this.seeMoreMeasurable;
                    }
                    ellipsisSize = this.seeMoreSize;
                    if (this.getOverflowMeasurable != null) {
                        measurable = measurable3;
                        placeable = null;
                    } else {
                        Placeable placeable3 = this.seeMorePlaceable;
                        measurable = measurable3;
                        placeable = placeable3;
                    }
                }
                if (measurable == null) {
                    return null;
                }
                Intrinsics.checkNotNull(ellipsisSize);
                return new FlowLayoutBuildingBlocks.WrapEllipsisInfo(measurable, placeable, ellipsisSize.m292unboximpl(), false, 8, null);
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    /* renamed from: setOverflowMeasurables--hBUhpc$foundation_layout_release  reason: not valid java name */
    public final void m922setOverflowMeasurableshBUhpc$foundation_layout_release(IntrinsicMeasurable seeMoreMeasurable, IntrinsicMeasurable collapseMeasurable, boolean isHorizontal, long constraints) {
        LayoutOrientation orientation = isHorizontal ? LayoutOrientation.Horizontal : LayoutOrientation.Vertical;
        long orientationIndependentConstraints = OrientationIndependentConstraints.m962constructorimpl(constraints, orientation);
        if (seeMoreMeasurable != null) {
            int mainAxisSize = FlowLayoutKt.mainAxisMin(seeMoreMeasurable, isHorizontal, Constraints.m6825getMaxHeightimpl(orientationIndependentConstraints));
            int crossAxisSize = FlowLayoutKt.crossAxisMin(seeMoreMeasurable, isHorizontal, mainAxisSize);
            this.seeMoreSize = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(mainAxisSize, crossAxisSize));
            this.seeMoreMeasurable = seeMoreMeasurable instanceof Measurable ? (Measurable) seeMoreMeasurable : null;
            this.seeMorePlaceable = null;
        }
        if (collapseMeasurable != null) {
            int mainAxisSize2 = FlowLayoutKt.mainAxisMin(collapseMeasurable, isHorizontal, Constraints.m6825getMaxHeightimpl(orientationIndependentConstraints));
            int crossAxisSize2 = FlowLayoutKt.crossAxisMin(collapseMeasurable, isHorizontal, mainAxisSize2);
            this.collapseSize = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(mainAxisSize2, crossAxisSize2));
            this.collapseMeasurable = collapseMeasurable instanceof Measurable ? (Measurable) collapseMeasurable : null;
            this.collapsePlaceable = null;
        }
    }

    /* renamed from: setOverflowMeasurables--hBUhpc$foundation_layout_release  reason: not valid java name */
    public final void m921setOverflowMeasurableshBUhpc$foundation_layout_release(final FlowLineMeasurePolicy measurePolicy, Measurable seeMoreMeasurable, Measurable collapseMeasurable, long constraints) {
        long orientationIndependentConstraints;
        boolean isHorizontal = measurePolicy.isHorizontal();
        LayoutOrientation orientation = isHorizontal ? LayoutOrientation.Horizontal : LayoutOrientation.Vertical;
        orientationIndependentConstraints = OrientationIndependentConstraints.m963copyyUG9Ft0(r2, (r12 & 1) != 0 ? Constraints.m6828getMinWidthimpl(r2) : 0, (r12 & 2) != 0 ? Constraints.m6826getMaxWidthimpl(r2) : 0, (r12 & 4) != 0 ? Constraints.m6827getMinHeightimpl(r2) : 0, (r12 & 8) != 0 ? Constraints.m6825getMaxHeightimpl(OrientationIndependentConstraints.m962constructorimpl(constraints, orientation)) : 0);
        long finalConstraints = OrientationIndependentConstraints.m975toBoxConstraintsOenEA2s(orientationIndependentConstraints, orientation);
        if (seeMoreMeasurable != null) {
            FlowLayoutKt.m918measureAndCacherqJ1uqs(seeMoreMeasurable, measurePolicy, finalConstraints, new Function1<Placeable, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutOverflowState$setOverflowMeasurables$3$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable placeable) {
                    invoke2(placeable);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable placeable) {
                    int mainAxisSize = 0;
                    int crossAxisSize = 0;
                    if (placeable != null) {
                        FlowLineMeasurePolicy $this$invoke_u24lambda_u241_u24lambda_u240 = measurePolicy;
                        mainAxisSize = $this$invoke_u24lambda_u241_u24lambda_u240.mainAxisSize(placeable);
                        crossAxisSize = $this$invoke_u24lambda_u241_u24lambda_u240.crossAxisSize(placeable);
                    }
                    FlowLayoutOverflowState.this.seeMoreSize = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(mainAxisSize, crossAxisSize));
                    FlowLayoutOverflowState.this.seeMorePlaceable = placeable;
                }
            });
            this.seeMoreMeasurable = seeMoreMeasurable;
        }
        if (collapseMeasurable != null) {
            FlowLayoutKt.m918measureAndCacherqJ1uqs(collapseMeasurable, measurePolicy, finalConstraints, new Function1<Placeable, Unit>() { // from class: androidx.compose.foundation.layout.FlowLayoutOverflowState$setOverflowMeasurables$4$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable placeable) {
                    invoke2(placeable);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable placeable) {
                    int mainAxisSize = 0;
                    int crossAxisSize = 0;
                    if (placeable != null) {
                        FlowLineMeasurePolicy $this$invoke_u24lambda_u241_u24lambda_u240 = measurePolicy;
                        mainAxisSize = $this$invoke_u24lambda_u241_u24lambda_u240.mainAxisSize(placeable);
                        crossAxisSize = $this$invoke_u24lambda_u241_u24lambda_u240.crossAxisSize(placeable);
                    }
                    FlowLayoutOverflowState.this.collapseSize = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(mainAxisSize, crossAxisSize));
                    FlowLayoutOverflowState.this.collapsePlaceable = placeable;
                }
            });
            this.collapseMeasurable = collapseMeasurable;
        }
    }

    /* renamed from: setOverflowMeasurables-VKLhPVY$foundation_layout_release  reason: not valid java name */
    public final void m923setOverflowMeasurablesVKLhPVY$foundation_layout_release(FlowLineMeasurePolicy measurePolicy, long constraints, Function2<? super Boolean, ? super Integer, ? extends Measurable> function2) {
        this.itemShown = 0;
        this.getOverflowMeasurable = function2;
        Measurable seeMoreMeasurable = function2.invoke(true, 0);
        Measurable collapseMeasurable = function2.invoke(false, 0);
        m921setOverflowMeasurableshBUhpc$foundation_layout_release(measurePolicy, seeMoreMeasurable, collapseMeasurable, constraints);
    }
}
