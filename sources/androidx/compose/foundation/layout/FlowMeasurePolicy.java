package androidx.compose.foundation.layout;

import androidx.collection.IntIntPair;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.FlowLayoutBuildingBlocks;
import androidx.compose.foundation.layout.FlowLayoutOverflow;
import androidx.compose.ui.layout.IntrinsicMeasurable;
import androidx.compose.ui.layout.IntrinsicMeasureScope;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.MultiContentMeasurePolicy;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Dp;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: FlowLayout.kt */
@Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0082\b\u0018\u00002\u00020\u00012\u00020\u0002BM\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0006\u0010\r\u001a\u00020\n\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\u0006\u0010\u0011\u001a\u00020\u0012¢\u0006\u0002\u0010\u0013J\t\u0010\u001c\u001a\u00020\u0004HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001e\u001a\u00020\bHÆ\u0003J\u0016\u0010\u001f\u001a\u00020\nHÂ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b \u0010!J\t\u0010\"\u001a\u00020\fHÆ\u0003J\u0016\u0010#\u001a\u00020\nHÂ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b$\u0010!J\t\u0010%\u001a\u00020\u000fHÂ\u0003J\t\u0010&\u001a\u00020\u000fHÂ\u0003J\t\u0010'\u001a\u00020\u0012HÂ\u0003Jm\u0010(\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00042\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\n2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u000f2\b\b\u0002\u0010\u0011\u001a\u00020\u0012HÆ\u0001ø\u0001\u0000¢\u0006\u0004\b)\u0010*J\u0013\u0010+\u001a\u00020\u00042\b\u0010,\u001a\u0004\u0018\u00010-HÖ\u0003J\t\u0010.\u001a\u00020\u000fHÖ\u0001JD\u0010/\u001a\u00020\u000f2\f\u00100\u001a\b\u0012\u0004\u0012\u000202012\u0006\u00103\u001a\u00020\u000f2\u0006\u0010\t\u001a\u00020\u000f2\u0006\u00104\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0012J$\u00105\u001a\u00020\u000f2\f\u00100\u001a\b\u0012\u0004\u0012\u000202012\u0006\u00106\u001a\u00020\u000f2\u0006\u00107\u001a\u00020\u000fJD\u00108\u001a\u00020\u000f2\f\u00100\u001a\b\u0012\u0004\u0012\u000202012\u0006\u00109\u001a\u00020\u000f2\u0006\u0010\t\u001a\u00020\u000f2\u0006\u00104\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0012J\t\u0010:\u001a\u00020;HÖ\u0001J(\u0010<\u001a\u00020\u000f*\u00020=2\u0012\u00100\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020201012\u0006\u0010>\u001a\u00020\u000fH\u0016J(\u0010?\u001a\u00020\u000f*\u00020=2\u0012\u00100\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020201012\u0006\u00106\u001a\u00020\u000fH\u0016J\u0012\u0010@\u001a\u00020\u000f*\u0002022\u0006\u0010A\u001a\u00020\u000fJ2\u0010B\u001a\u00020C*\u00020D2\u0012\u00100\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020E01012\u0006\u0010F\u001a\u00020GH\u0016ø\u0001\u0000¢\u0006\u0004\bH\u0010IJ\u0012\u0010J\u001a\u00020\u000f*\u0002022\u0006\u0010A\u001a\u00020\u000fJ(\u0010K\u001a\u00020\u000f*\u00020=2\u0012\u00100\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020201012\u0006\u0010>\u001a\u00020\u000fH\u0016J(\u0010L\u001a\u00020\u000f*\u00020=2\u0012\u00100\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020201012\u0006\u00106\u001a\u00020\u000fH\u0016J\u0012\u0010M\u001a\u00020\u000f*\u0002022\u0006\u0010A\u001a\u00020\u000fR\u0014\u0010\u000b\u001a\u00020\fX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0016\u0010\r\u001a\u00020\nX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0016R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0003\u0010\u0019R\u0016\u0010\t\u001a\u00020\nX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0016R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u00020\bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001b\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006N"}, d2 = {"Landroidx/compose/foundation/layout/FlowMeasurePolicy;", "Landroidx/compose/ui/layout/MultiContentMeasurePolicy;", "Landroidx/compose/foundation/layout/FlowLineMeasurePolicy;", "isHorizontal", "", "horizontalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "verticalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "mainAxisSpacing", "Landroidx/compose/ui/unit/Dp;", "crossAxisAlignment", "Landroidx/compose/foundation/layout/CrossAxisAlignment;", "crossAxisArrangementSpacing", "maxItemsInMainAxis", "", "maxLines", "overflow", "Landroidx/compose/foundation/layout/FlowLayoutOverflowState;", "(ZLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;FLandroidx/compose/foundation/layout/CrossAxisAlignment;FIILandroidx/compose/foundation/layout/FlowLayoutOverflowState;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "getCrossAxisAlignment", "()Landroidx/compose/foundation/layout/CrossAxisAlignment;", "F", "getHorizontalArrangement", "()Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "()Z", "getVerticalArrangement", "()Landroidx/compose/foundation/layout/Arrangement$Vertical;", "component1", "component2", "component3", "component4", "component4-D9Ej5fM", "()F", "component5", "component6", "component6-D9Ej5fM", "component7", "component8", "component9", "copy", "copy-QuyCDyQ", "(ZLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;FLandroidx/compose/foundation/layout/CrossAxisAlignment;FIILandroidx/compose/foundation/layout/FlowLayoutOverflowState;)Landroidx/compose/foundation/layout/FlowMeasurePolicy;", "equals", "other", "", "hashCode", "intrinsicCrossAxisSize", "measurables", "", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "mainAxisAvailable", "crossAxisSpacing", "maxIntrinsicMainAxisSize", "height", "arrangementSpacing", "minIntrinsicMainAxisSize", "crossAxisAvailable", "toString", "", "maxIntrinsicHeight", "Landroidx/compose/ui/layout/IntrinsicMeasureScope;", "width", "maxIntrinsicWidth", "maxMainAxisIntrinsicItemSize", "size", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Ljava/util/List;J)Landroidx/compose/ui/layout/MeasureResult;", "minCrossAxisIntrinsicItemSize", "minIntrinsicHeight", "minIntrinsicWidth", "minMainAxisIntrinsicItemSize", "foundation-layout_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class FlowMeasurePolicy implements MultiContentMeasurePolicy, FlowLineMeasurePolicy {
    private final CrossAxisAlignment crossAxisAlignment;
    private final float crossAxisArrangementSpacing;
    private final Arrangement.Horizontal horizontalArrangement;
    private final boolean isHorizontal;
    private final float mainAxisSpacing;
    private final int maxItemsInMainAxis;
    private final int maxLines;
    private final FlowLayoutOverflowState overflow;
    private final Arrangement.Vertical verticalArrangement;

    public /* synthetic */ FlowMeasurePolicy(boolean z, Arrangement.Horizontal horizontal, Arrangement.Vertical vertical, float f, CrossAxisAlignment crossAxisAlignment, float f2, int i, int i2, FlowLayoutOverflowState flowLayoutOverflowState, DefaultConstructorMarker defaultConstructorMarker) {
        this(z, horizontal, vertical, f, crossAxisAlignment, f2, i, i2, flowLayoutOverflowState);
    }

    /* renamed from: component4-D9Ej5fM  reason: not valid java name */
    private final float m936component4D9Ej5fM() {
        return this.mainAxisSpacing;
    }

    /* renamed from: component6-D9Ej5fM  reason: not valid java name */
    private final float m937component6D9Ej5fM() {
        return this.crossAxisArrangementSpacing;
    }

    private final int component7() {
        return this.maxItemsInMainAxis;
    }

    private final int component8() {
        return this.maxLines;
    }

    private final FlowLayoutOverflowState component9() {
        return this.overflow;
    }

    /* renamed from: copy-QuyCDyQ$default  reason: not valid java name */
    public static /* synthetic */ FlowMeasurePolicy m938copyQuyCDyQ$default(FlowMeasurePolicy flowMeasurePolicy, boolean z, Arrangement.Horizontal horizontal, Arrangement.Vertical vertical, float f, CrossAxisAlignment crossAxisAlignment, float f2, int i, int i2, FlowLayoutOverflowState flowLayoutOverflowState, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            z = flowMeasurePolicy.isHorizontal;
        }
        if ((i3 & 2) != 0) {
            horizontal = flowMeasurePolicy.horizontalArrangement;
        }
        if ((i3 & 4) != 0) {
            vertical = flowMeasurePolicy.verticalArrangement;
        }
        if ((i3 & 8) != 0) {
            f = flowMeasurePolicy.mainAxisSpacing;
        }
        if ((i3 & 16) != 0) {
            crossAxisAlignment = flowMeasurePolicy.crossAxisAlignment;
        }
        if ((i3 & 32) != 0) {
            f2 = flowMeasurePolicy.crossAxisArrangementSpacing;
        }
        if ((i3 & 64) != 0) {
            i = flowMeasurePolicy.maxItemsInMainAxis;
        }
        if ((i3 & 128) != 0) {
            i2 = flowMeasurePolicy.maxLines;
        }
        if ((i3 & 256) != 0) {
            flowLayoutOverflowState = flowMeasurePolicy.overflow;
        }
        int i4 = i2;
        FlowLayoutOverflowState flowLayoutOverflowState2 = flowLayoutOverflowState;
        float f3 = f2;
        int i5 = i;
        CrossAxisAlignment crossAxisAlignment2 = crossAxisAlignment;
        Arrangement.Vertical vertical2 = vertical;
        return flowMeasurePolicy.m939copyQuyCDyQ(z, horizontal, vertical2, f, crossAxisAlignment2, f3, i5, i4, flowLayoutOverflowState2);
    }

    public final boolean component1() {
        return this.isHorizontal;
    }

    public final Arrangement.Horizontal component2() {
        return this.horizontalArrangement;
    }

    public final Arrangement.Vertical component3() {
        return this.verticalArrangement;
    }

    public final CrossAxisAlignment component5() {
        return this.crossAxisAlignment;
    }

    /* renamed from: copy-QuyCDyQ  reason: not valid java name */
    public final FlowMeasurePolicy m939copyQuyCDyQ(boolean z, Arrangement.Horizontal horizontal, Arrangement.Vertical vertical, float f, CrossAxisAlignment crossAxisAlignment, float f2, int i, int i2, FlowLayoutOverflowState flowLayoutOverflowState) {
        return new FlowMeasurePolicy(z, horizontal, vertical, f, crossAxisAlignment, f2, i, i2, flowLayoutOverflowState, null);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof FlowMeasurePolicy) {
            FlowMeasurePolicy flowMeasurePolicy = (FlowMeasurePolicy) obj;
            return this.isHorizontal == flowMeasurePolicy.isHorizontal && Intrinsics.areEqual(this.horizontalArrangement, flowMeasurePolicy.horizontalArrangement) && Intrinsics.areEqual(this.verticalArrangement, flowMeasurePolicy.verticalArrangement) && Dp.m6878equalsimpl0(this.mainAxisSpacing, flowMeasurePolicy.mainAxisSpacing) && Intrinsics.areEqual(this.crossAxisAlignment, flowMeasurePolicy.crossAxisAlignment) && Dp.m6878equalsimpl0(this.crossAxisArrangementSpacing, flowMeasurePolicy.crossAxisArrangementSpacing) && this.maxItemsInMainAxis == flowMeasurePolicy.maxItemsInMainAxis && this.maxLines == flowMeasurePolicy.maxLines && Intrinsics.areEqual(this.overflow, flowMeasurePolicy.overflow);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((((((((Boolean.hashCode(this.isHorizontal) * 31) + this.horizontalArrangement.hashCode()) * 31) + this.verticalArrangement.hashCode()) * 31) + Dp.m6879hashCodeimpl(this.mainAxisSpacing)) * 31) + this.crossAxisAlignment.hashCode()) * 31) + Dp.m6879hashCodeimpl(this.crossAxisArrangementSpacing)) * 31) + Integer.hashCode(this.maxItemsInMainAxis)) * 31) + Integer.hashCode(this.maxLines)) * 31) + this.overflow.hashCode();
    }

    public String toString() {
        return "FlowMeasurePolicy(isHorizontal=" + this.isHorizontal + ", horizontalArrangement=" + this.horizontalArrangement + ", verticalArrangement=" + this.verticalArrangement + ", mainAxisSpacing=" + ((Object) Dp.m6884toStringimpl(this.mainAxisSpacing)) + ", crossAxisAlignment=" + this.crossAxisAlignment + ", crossAxisArrangementSpacing=" + ((Object) Dp.m6884toStringimpl(this.crossAxisArrangementSpacing)) + ", maxItemsInMainAxis=" + this.maxItemsInMainAxis + ", maxLines=" + this.maxLines + ", overflow=" + this.overflow + ')';
    }

    private FlowMeasurePolicy(boolean isHorizontal, Arrangement.Horizontal horizontalArrangement, Arrangement.Vertical verticalArrangement, float mainAxisSpacing, CrossAxisAlignment crossAxisAlignment, float crossAxisArrangementSpacing, int maxItemsInMainAxis, int maxLines, FlowLayoutOverflowState overflow) {
        this.isHorizontal = isHorizontal;
        this.horizontalArrangement = horizontalArrangement;
        this.verticalArrangement = verticalArrangement;
        this.mainAxisSpacing = mainAxisSpacing;
        this.crossAxisAlignment = crossAxisAlignment;
        this.crossAxisArrangementSpacing = crossAxisArrangementSpacing;
        this.maxItemsInMainAxis = maxItemsInMainAxis;
        this.maxLines = maxLines;
        this.overflow = overflow;
    }

    @Override // androidx.compose.foundation.layout.FlowLineMeasurePolicy
    public boolean isHorizontal() {
        return this.isHorizontal;
    }

    @Override // androidx.compose.foundation.layout.FlowLineMeasurePolicy
    public Arrangement.Horizontal getHorizontalArrangement() {
        return this.horizontalArrangement;
    }

    @Override // androidx.compose.foundation.layout.FlowLineMeasurePolicy
    public Arrangement.Vertical getVerticalArrangement() {
        return this.verticalArrangement;
    }

    @Override // androidx.compose.foundation.layout.FlowLineMeasurePolicy
    public CrossAxisAlignment getCrossAxisAlignment() {
        return this.crossAxisAlignment;
    }

    @Override // androidx.compose.ui.layout.MultiContentMeasurePolicy
    /* renamed from: measure-3p2s80s  reason: not valid java name */
    public MeasureResult mo940measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, List<? extends List<? extends Measurable>> list, long constraints) {
        LayoutOrientation layoutOrientation;
        if (this.maxLines == 0 || this.maxItemsInMainAxis == 0 || list.isEmpty() || (Constraints.m6825getMaxHeightimpl(constraints) == 0 && this.overflow.getType$foundation_layout_release() != FlowLayoutOverflow.OverflowType.Visible)) {
            return MeasureScope.layout$default($this$measure_u2d3p2s80s, 0, 0, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.FlowMeasurePolicy$measure$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                    invoke2(placementScope);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable.PlacementScope $this$layout) {
                }
            }, 4, null);
        }
        List list2 = (List) CollectionsKt.first((List<? extends Object>) list);
        if (!list2.isEmpty()) {
            List list3 = (List) CollectionsKt.getOrNull(list, 1);
            Measurable seeMoreMeasurable = list3 != null ? (Measurable) CollectionsKt.firstOrNull((List<? extends Object>) list3) : null;
            List list4 = (List) CollectionsKt.getOrNull(list, 2);
            Measurable collapseMeasurable = list4 != null ? (Measurable) CollectionsKt.firstOrNull((List<? extends Object>) list4) : null;
            this.overflow.setItemCount$foundation_layout_release(list2.size());
            this.overflow.m921setOverflowMeasurableshBUhpc$foundation_layout_release(this, seeMoreMeasurable, collapseMeasurable, constraints);
            FlowMeasurePolicy flowMeasurePolicy = this;
            Iterator it = list2.iterator();
            float f = this.mainAxisSpacing;
            float f2 = this.crossAxisArrangementSpacing;
            if (isHorizontal()) {
                layoutOrientation = LayoutOrientation.Horizontal;
            } else {
                layoutOrientation = LayoutOrientation.Vertical;
            }
            return FlowLayoutKt.m917breakDownItemsdi9J0FM($this$measure_u2d3p2s80s, flowMeasurePolicy, it, f, f2, OrientationIndependentConstraints.m962constructorimpl(constraints, layoutOrientation), this.maxItemsInMainAxis, this.maxLines, this.overflow);
        }
        return MeasureScope.layout$default($this$measure_u2d3p2s80s, 0, 0, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.FlowMeasurePolicy$measure$2
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                invoke2(placementScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Placeable.PlacementScope $this$layout) {
            }
        }, 4, null);
    }

    @Override // androidx.compose.ui.layout.MultiContentMeasurePolicy
    public int minIntrinsicWidth(IntrinsicMeasureScope $this$minIntrinsicWidth, List<? extends List<? extends IntrinsicMeasurable>> list, int height) {
        FlowLayoutOverflowState flowLayoutOverflowState = this.overflow;
        List list2 = (List) CollectionsKt.getOrNull(list, 1);
        IntrinsicMeasurable intrinsicMeasurable = list2 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list2) : null;
        List list3 = (List) CollectionsKt.getOrNull(list, 2);
        flowLayoutOverflowState.m922setOverflowMeasurableshBUhpc$foundation_layout_release(intrinsicMeasurable, list3 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list3) : null, isHorizontal(), ConstraintsKt.Constraints$default(0, 0, 0, height, 7, null));
        if (isHorizontal()) {
            List<? extends IntrinsicMeasurable> list4 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
            if (list4 == null) {
                list4 = CollectionsKt.emptyList();
            }
            return minIntrinsicMainAxisSize(list4, height, $this$minIntrinsicWidth.mo638roundToPx0680j_4(this.mainAxisSpacing), $this$minIntrinsicWidth.mo638roundToPx0680j_4(this.crossAxisArrangementSpacing), this.maxItemsInMainAxis, this.maxLines, this.overflow);
        }
        List<? extends IntrinsicMeasurable> list5 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
        if (list5 == null) {
            list5 = CollectionsKt.emptyList();
        }
        return intrinsicCrossAxisSize(list5, height, $this$minIntrinsicWidth.mo638roundToPx0680j_4(this.mainAxisSpacing), $this$minIntrinsicWidth.mo638roundToPx0680j_4(this.crossAxisArrangementSpacing), this.maxItemsInMainAxis, this.maxLines, this.overflow);
    }

    @Override // androidx.compose.ui.layout.MultiContentMeasurePolicy
    public int minIntrinsicHeight(IntrinsicMeasureScope $this$minIntrinsicHeight, List<? extends List<? extends IntrinsicMeasurable>> list, int width) {
        FlowLayoutOverflowState flowLayoutOverflowState = this.overflow;
        List list2 = (List) CollectionsKt.getOrNull(list, 1);
        IntrinsicMeasurable intrinsicMeasurable = list2 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list2) : null;
        List list3 = (List) CollectionsKt.getOrNull(list, 2);
        flowLayoutOverflowState.m922setOverflowMeasurableshBUhpc$foundation_layout_release(intrinsicMeasurable, list3 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list3) : null, isHorizontal(), ConstraintsKt.Constraints$default(0, width, 0, 0, 13, null));
        if (isHorizontal()) {
            List<? extends IntrinsicMeasurable> list4 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
            if (list4 == null) {
                list4 = CollectionsKt.emptyList();
            }
            return intrinsicCrossAxisSize(list4, width, $this$minIntrinsicHeight.mo638roundToPx0680j_4(this.mainAxisSpacing), $this$minIntrinsicHeight.mo638roundToPx0680j_4(this.crossAxisArrangementSpacing), this.maxItemsInMainAxis, this.maxLines, this.overflow);
        }
        List<? extends IntrinsicMeasurable> list5 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
        if (list5 == null) {
            list5 = CollectionsKt.emptyList();
        }
        return minIntrinsicMainAxisSize(list5, width, $this$minIntrinsicHeight.mo638roundToPx0680j_4(this.mainAxisSpacing), $this$minIntrinsicHeight.mo638roundToPx0680j_4(this.crossAxisArrangementSpacing), this.maxItemsInMainAxis, this.maxLines, this.overflow);
    }

    @Override // androidx.compose.ui.layout.MultiContentMeasurePolicy
    public int maxIntrinsicHeight(IntrinsicMeasureScope $this$maxIntrinsicHeight, List<? extends List<? extends IntrinsicMeasurable>> list, int width) {
        FlowLayoutOverflowState flowLayoutOverflowState = this.overflow;
        List list2 = (List) CollectionsKt.getOrNull(list, 1);
        IntrinsicMeasurable intrinsicMeasurable = list2 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list2) : null;
        List list3 = (List) CollectionsKt.getOrNull(list, 2);
        flowLayoutOverflowState.m922setOverflowMeasurableshBUhpc$foundation_layout_release(intrinsicMeasurable, list3 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list3) : null, isHorizontal(), ConstraintsKt.Constraints$default(0, width, 0, 0, 13, null));
        if (isHorizontal()) {
            List<? extends IntrinsicMeasurable> list4 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
            if (list4 == null) {
                list4 = CollectionsKt.emptyList();
            }
            return intrinsicCrossAxisSize(list4, width, $this$maxIntrinsicHeight.mo638roundToPx0680j_4(this.mainAxisSpacing), $this$maxIntrinsicHeight.mo638roundToPx0680j_4(this.crossAxisArrangementSpacing), this.maxItemsInMainAxis, this.maxLines, this.overflow);
        }
        List<? extends IntrinsicMeasurable> list5 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
        if (list5 == null) {
            list5 = CollectionsKt.emptyList();
        }
        return maxIntrinsicMainAxisSize(list5, width, $this$maxIntrinsicHeight.mo638roundToPx0680j_4(this.mainAxisSpacing));
    }

    @Override // androidx.compose.ui.layout.MultiContentMeasurePolicy
    public int maxIntrinsicWidth(IntrinsicMeasureScope $this$maxIntrinsicWidth, List<? extends List<? extends IntrinsicMeasurable>> list, int height) {
        FlowLayoutOverflowState flowLayoutOverflowState = this.overflow;
        List list2 = (List) CollectionsKt.getOrNull(list, 1);
        IntrinsicMeasurable intrinsicMeasurable = list2 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list2) : null;
        List list3 = (List) CollectionsKt.getOrNull(list, 2);
        flowLayoutOverflowState.m922setOverflowMeasurableshBUhpc$foundation_layout_release(intrinsicMeasurable, list3 != null ? (IntrinsicMeasurable) CollectionsKt.firstOrNull((List<? extends Object>) list3) : null, isHorizontal(), ConstraintsKt.Constraints$default(0, 0, 0, height, 7, null));
        if (!isHorizontal()) {
            List<? extends IntrinsicMeasurable> list4 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
            if (list4 == null) {
                list4 = CollectionsKt.emptyList();
            }
            return intrinsicCrossAxisSize(list4, height, $this$maxIntrinsicWidth.mo638roundToPx0680j_4(this.mainAxisSpacing), $this$maxIntrinsicWidth.mo638roundToPx0680j_4(this.crossAxisArrangementSpacing), this.maxItemsInMainAxis, this.maxLines, this.overflow);
        }
        List<? extends IntrinsicMeasurable> list5 = (List) CollectionsKt.firstOrNull((List<? extends Object>) list);
        if (list5 == null) {
            list5 = CollectionsKt.emptyList();
        }
        return maxIntrinsicMainAxisSize(list5, height, $this$maxIntrinsicWidth.mo638roundToPx0680j_4(this.mainAxisSpacing));
    }

    /* JADX WARN: Code restructure failed: missing block: B:70:0x016b, code lost:
        r3 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x016c, code lost:
        return r3;
     */
    /* JADX WARN: Type inference failed for: r0v4, types: [kotlin.collections.IntIterator] */
    /* JADX WARN: Type inference failed for: r3v2, types: [kotlin.collections.IntIterator] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int minIntrinsicMainAxisSize(java.util.List<? extends androidx.compose.ui.layout.IntrinsicMeasurable> r23, int r24, int r25, int r26, int r27, int r28, androidx.compose.foundation.layout.FlowLayoutOverflowState r29) {
        /*
            Method dump skipped, instructions count: 377
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.layout.FlowMeasurePolicy.minIntrinsicMainAxisSize(java.util.List, int, int, int, int, int, androidx.compose.foundation.layout.FlowLayoutOverflowState):int");
    }

    public final int maxIntrinsicMainAxisSize(List<? extends IntrinsicMeasurable> list, int height, int arrangementSpacing) {
        FlowMeasurePolicy flowMeasurePolicy = this;
        int maxItemsInMainAxis$iv = flowMeasurePolicy.maxItemsInMainAxis;
        int fixedSpace$iv = 0;
        int currentFixedSpace$iv = 0;
        int lastBreak$iv = 0;
        int index$iv$iv = 0;
        int size = list.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = list.get(index$iv$iv);
            IntrinsicMeasurable child$iv = (IntrinsicMeasurable) item$iv$iv;
            int index$iv = index$iv$iv;
            int size$iv = flowMeasurePolicy.maxMainAxisIntrinsicItemSize(child$iv, height) + arrangementSpacing;
            if ((index$iv + 1) - lastBreak$iv == maxItemsInMainAxis$iv || index$iv + 1 == list.size()) {
                fixedSpace$iv = Math.max(fixedSpace$iv, (currentFixedSpace$iv + size$iv) - arrangementSpacing);
                currentFixedSpace$iv = 0;
                lastBreak$iv = index$iv;
            } else {
                currentFixedSpace$iv += size$iv;
            }
            index$iv$iv++;
            flowMeasurePolicy = this;
        }
        return fixedSpace$iv;
    }

    public final int intrinsicCrossAxisSize(List<? extends IntrinsicMeasurable> list, int mainAxisAvailable, int mainAxisSpacing, int crossAxisSpacing, int maxItemsInMainAxis, int maxLines, FlowLayoutOverflowState overflow) {
        long m284constructorimpl;
        IntIntPair m281boximpl;
        FlowMeasurePolicy flowMeasurePolicy = this;
        List<? extends IntrinsicMeasurable> list2 = list;
        if (list2.isEmpty()) {
            m284constructorimpl = IntIntPair.m284constructorimpl(0, 0);
        } else {
            FlowLayoutBuildingBlocks buildingBlocks$iv = new FlowLayoutBuildingBlocks(maxItemsInMainAxis, overflow, OrientationIndependentConstraints.m960constructorimpl(0, mainAxisAvailable, 0, Integer.MAX_VALUE), maxLines, mainAxisSpacing, crossAxisSpacing, null);
            IntrinsicMeasurable nextChild$iv = (IntrinsicMeasurable) CollectionsKt.getOrNull(list2, 0);
            int nextCrossAxisSize$iv = nextChild$iv != null ? flowMeasurePolicy.minCrossAxisIntrinsicItemSize(nextChild$iv, mainAxisAvailable) : 0;
            int nextMainAxisSize$iv = nextChild$iv != null ? flowMeasurePolicy.minMainAxisIntrinsicItemSize(nextChild$iv, nextCrossAxisSize$iv) : 0;
            int childCrossAxisSize$iv = nextMainAxisSize$iv;
            int nextCrossAxisSize$iv2 = nextCrossAxisSize$iv;
            if (!buildingBlocks$iv.m915getWrapInfoOpUlnko(list2.size() > 1, 0, IntIntPair.m284constructorimpl(mainAxisAvailable, Integer.MAX_VALUE), nextChild$iv == null ? null : IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(nextMainAxisSize$iv, nextCrossAxisSize$iv)), 0, 0, 0, false, false).isLastItemInContainer()) {
                int size = list2.size();
                int nextCrossAxisSize$iv3 = nextCrossAxisSize$iv2;
                int lastBreak$iv = 0;
                int nextMainAxisSize$iv2 = 0;
                int currentCrossAxisSize$iv = 0;
                int totalCrossAxisSize$iv = 0;
                int lineIndex$iv = 0;
                int noOfItemsShown$iv = 0;
                int currentCrossAxisSize$iv2 = mainAxisAvailable;
                while (true) {
                    if (lineIndex$iv >= size) {
                        break;
                    }
                    int childCrossAxisSize$iv2 = nextCrossAxisSize$iv3;
                    int childMainAxisSize$iv = childCrossAxisSize$iv;
                    int remaining$iv = currentCrossAxisSize$iv2 - childMainAxisSize$iv;
                    int noOfItemsShown$iv2 = lineIndex$iv + 1;
                    int index$iv = lineIndex$iv;
                    int index$iv2 = totalCrossAxisSize$iv;
                    int lineIndex$iv2 = currentCrossAxisSize$iv;
                    int currentCrossAxisSize$iv3 = Math.max(nextMainAxisSize$iv2, childCrossAxisSize$iv2);
                    int currentCrossAxisSize$iv4 = index$iv + 1;
                    IntrinsicMeasurable nextChild$iv2 = (IntrinsicMeasurable) CollectionsKt.getOrNull(list2, currentCrossAxisSize$iv4);
                    int size2 = nextChild$iv2 != null ? flowMeasurePolicy.minCrossAxisIntrinsicItemSize(nextChild$iv2, mainAxisAvailable) : 0;
                    int nextMainAxisSize$iv3 = nextChild$iv2 != null ? flowMeasurePolicy.minMainAxisIntrinsicItemSize(nextChild$iv2, size2) + mainAxisSpacing : 0;
                    boolean z = index$iv + 2 < list2.size();
                    int i = (index$iv + 1) - lastBreak$iv;
                    long m284constructorimpl2 = IntIntPair.m284constructorimpl(remaining$iv, Integer.MAX_VALUE);
                    if (nextChild$iv2 == null) {
                        m281boximpl = null;
                    } else {
                        m281boximpl = IntIntPair.m281boximpl(IntIntPair.m284constructorimpl(nextMainAxisSize$iv3, size2));
                    }
                    int remaining$iv2 = size;
                    FlowLayoutBuildingBlocks.WrapInfo wrapInfo$iv = buildingBlocks$iv.m915getWrapInfoOpUlnko(z, i, m284constructorimpl2, m281boximpl, index$iv2, lineIndex$iv2, currentCrossAxisSize$iv3, false, false);
                    if (!wrapInfo$iv.isLastItemInLine()) {
                        childCrossAxisSize$iv = nextMainAxisSize$iv3;
                        nextMainAxisSize$iv2 = currentCrossAxisSize$iv3;
                        currentCrossAxisSize$iv2 = remaining$iv;
                        currentCrossAxisSize$iv = lineIndex$iv2;
                        totalCrossAxisSize$iv = index$iv2;
                    } else {
                        int totalCrossAxisSize$iv2 = lineIndex$iv2 + currentCrossAxisSize$iv3 + crossAxisSpacing;
                        int lineIndex$iv3 = (index$iv + 1) - lastBreak$iv;
                        FlowLayoutBuildingBlocks.WrapEllipsisInfo ellipsisWrapInfo$iv = buildingBlocks$iv.getWrapEllipsisInfo(wrapInfo$iv, nextChild$iv2 != null, index$iv2, totalCrossAxisSize$iv2, remaining$iv, lineIndex$iv3);
                        lastBreak$iv = index$iv + 1;
                        int nextMainAxisSize$iv4 = nextMainAxisSize$iv3 - mainAxisSpacing;
                        totalCrossAxisSize$iv = index$iv2 + 1;
                        if (!wrapInfo$iv.isLastItemInContainer()) {
                            childCrossAxisSize$iv = nextMainAxisSize$iv4;
                            nextMainAxisSize$iv2 = 0;
                            currentCrossAxisSize$iv = totalCrossAxisSize$iv2;
                            currentCrossAxisSize$iv2 = mainAxisAvailable;
                        } else {
                            if (ellipsisWrapInfo$iv != null) {
                                long it$iv = ellipsisWrapInfo$iv.m916getEllipsisSizeOO21N7I();
                                if (!ellipsisWrapInfo$iv.getPlaceEllipsisOnLastContentLine()) {
                                    totalCrossAxisSize$iv2 += IntIntPair.m289getSecondimpl(it$iv) + crossAxisSpacing;
                                }
                            }
                            currentCrossAxisSize$iv = totalCrossAxisSize$iv2;
                            noOfItemsShown$iv = noOfItemsShown$iv2;
                        }
                    }
                    lineIndex$iv = index$iv + 1;
                    size = remaining$iv2;
                    noOfItemsShown$iv = noOfItemsShown$iv2;
                    list2 = list;
                    nextCrossAxisSize$iv3 = size2;
                    flowMeasurePolicy = this;
                }
                int totalCrossAxisSize$iv3 = currentCrossAxisSize$iv - crossAxisSpacing;
                m284constructorimpl = IntIntPair.m284constructorimpl(totalCrossAxisSize$iv3, noOfItemsShown$iv);
            } else {
                IntIntPair m920ellipsisSizeF35zmw$foundation_layout_release = overflow.m920ellipsisSizeF35zmw$foundation_layout_release(nextChild$iv != null, 0, 0);
                int size$iv = m920ellipsisSizeF35zmw$foundation_layout_release != null ? IntIntPair.m289getSecondimpl(m920ellipsisSizeF35zmw$foundation_layout_release.m292unboximpl()) : 0;
                m284constructorimpl = IntIntPair.m284constructorimpl(size$iv, 0);
            }
        }
        return IntIntPair.m288getFirstimpl(m284constructorimpl);
    }

    public final int maxMainAxisIntrinsicItemSize(IntrinsicMeasurable $this$maxMainAxisIntrinsicItemSize, int size) {
        return isHorizontal() ? $this$maxMainAxisIntrinsicItemSize.maxIntrinsicWidth(size) : $this$maxMainAxisIntrinsicItemSize.maxIntrinsicHeight(size);
    }

    public final int minCrossAxisIntrinsicItemSize(IntrinsicMeasurable $this$minCrossAxisIntrinsicItemSize, int size) {
        return isHorizontal() ? $this$minCrossAxisIntrinsicItemSize.minIntrinsicHeight(size) : $this$minCrossAxisIntrinsicItemSize.minIntrinsicWidth(size);
    }

    public final int minMainAxisIntrinsicItemSize(IntrinsicMeasurable $this$minMainAxisIntrinsicItemSize, int size) {
        return isHorizontal() ? $this$minMainAxisIntrinsicItemSize.minIntrinsicWidth(size) : $this$minMainAxisIntrinsicItemSize.minIntrinsicHeight(size);
    }
}
