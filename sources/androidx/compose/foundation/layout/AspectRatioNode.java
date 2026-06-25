package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.IntrinsicMeasurable;
import androidx.compose.ui.layout.IntrinsicMeasureScope;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.IntSize;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* compiled from: AspectRatio.kt */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\b\u0002\u0018\u00002\u00020\u00012\u00020\u0002B\u0015\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u0016\u0010\u0010\u001a\u00020\u0011*\u00020\u0012H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014J\u001c\u0010\u0015\u001a\u00020\u0016*\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u0016H\u0016J\u001c\u0010\u001b\u001a\u00020\u0016*\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u0016H\u0016J&\u0010\u001d\u001a\u00020\u001e*\u00020\u001f2\u0006\u0010\u0018\u001a\u00020 2\u0006\u0010!\u001a\u00020\u0012H\u0016ø\u0001\u0000¢\u0006\u0004\b\"\u0010#J\u001c\u0010$\u001a\u00020\u0016*\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u0016H\u0016J\u001c\u0010%\u001a\u00020\u0016*\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u0016H\u0016J\u001e\u0010&\u001a\u00020\u0011*\u00020\u00122\u0006\u0010'\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b(\u0010)J\u001e\u0010*\u001a\u00020\u0011*\u00020\u00122\u0006\u0010'\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b+\u0010)J\u001e\u0010,\u001a\u00020\u0011*\u00020\u00122\u0006\u0010'\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b-\u0010)J\u001e\u0010.\u001a\u00020\u0011*\u00020\u00122\u0006\u0010'\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b/\u0010)R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000f\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u00060"}, d2 = {"Landroidx/compose/foundation/layout/AspectRatioNode;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "aspectRatio", "", "matchHeightConstraintsFirst", "", "(FZ)V", "getAspectRatio", "()F", "setAspectRatio", "(F)V", "getMatchHeightConstraintsFirst", "()Z", "setMatchHeightConstraintsFirst", "(Z)V", "findSize", "Landroidx/compose/ui/unit/IntSize;", "Landroidx/compose/ui/unit/Constraints;", "findSize-ToXhtMw", "(J)J", "maxIntrinsicHeight", "", "Landroidx/compose/ui/layout/IntrinsicMeasureScope;", "measurable", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "width", "maxIntrinsicWidth", "height", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "Landroidx/compose/ui/layout/Measurable;", "constraints", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "minIntrinsicHeight", "minIntrinsicWidth", "tryMaxHeight", "enforceConstraints", "tryMaxHeight-JN-0ABg", "(JZ)J", "tryMaxWidth", "tryMaxWidth-JN-0ABg", "tryMinHeight", "tryMinHeight-JN-0ABg", "tryMinWidth", "tryMinWidth-JN-0ABg", "foundation-layout_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class AspectRatioNode extends Modifier.Node implements LayoutModifierNode {
    private float aspectRatio;
    private boolean matchHeightConstraintsFirst;

    public final float getAspectRatio() {
        return this.aspectRatio;
    }

    public final void setAspectRatio(float f) {
        this.aspectRatio = f;
    }

    public final boolean getMatchHeightConstraintsFirst() {
        return this.matchHeightConstraintsFirst;
    }

    public final void setMatchHeightConstraintsFirst(boolean z) {
        this.matchHeightConstraintsFirst = z;
    }

    public AspectRatioNode(float aspectRatio, boolean matchHeightConstraintsFirst) {
        this.aspectRatio = aspectRatio;
        this.matchHeightConstraintsFirst = matchHeightConstraintsFirst;
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        long wrappedConstraints;
        long size = m892findSizeToXhtMw(constraints);
        if (!IntSize.m7042equalsimpl0(size, IntSize.Companion.m7049getZeroYbymL2g())) {
            wrappedConstraints = Constraints.Companion.m6836fixedJhjzzOo((int) (size >> 32), (int) (4294967295L & size));
        } else {
            wrappedConstraints = constraints;
        }
        final Placeable placeable = measurable.mo5637measureBRTryo0(wrappedConstraints);
        return MeasureScope.layout$default($this$measure_u2d3p2s80s, placeable.getWidth(), placeable.getHeight(), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.AspectRatioNode$measure$1
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
                Placeable.PlacementScope.placeRelative$default($this$layout, Placeable.this, 0, 0, 0.0f, 4, null);
            }
        }, 4, null);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicWidth(IntrinsicMeasureScope $this$minIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        if (height != Integer.MAX_VALUE) {
            float $this$fastRoundToInt$iv = height * this.aspectRatio;
            return Math.round($this$fastRoundToInt$iv);
        }
        return measurable.minIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicWidth(IntrinsicMeasureScope $this$maxIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        if (height != Integer.MAX_VALUE) {
            float $this$fastRoundToInt$iv = height * this.aspectRatio;
            return Math.round($this$fastRoundToInt$iv);
        }
        return measurable.maxIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicHeight(IntrinsicMeasureScope $this$minIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        if (width != Integer.MAX_VALUE) {
            float $this$fastRoundToInt$iv = width / this.aspectRatio;
            return Math.round($this$fastRoundToInt$iv);
        }
        return measurable.minIntrinsicHeight(width);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicHeight(IntrinsicMeasureScope $this$maxIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        if (width != Integer.MAX_VALUE) {
            float $this$fastRoundToInt$iv = width / this.aspectRatio;
            return Math.round($this$fastRoundToInt$iv);
        }
        return measurable.maxIntrinsicHeight(width);
    }

    /* renamed from: findSize-ToXhtMw  reason: not valid java name */
    private final long m892findSizeToXhtMw(long $this$findSize_u2dToXhtMw) {
        if (this.matchHeightConstraintsFirst) {
            long it = m893tryMaxHeightJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it;
            }
            long it2 = m894tryMaxWidthJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it2, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it2;
            }
            long it3 = m895tryMinHeightJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it3, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it3;
            }
            long it4 = m896tryMinWidthJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it4, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it4;
            }
            long it5 = m893tryMaxHeightJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it5, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it5;
            }
            long it6 = m894tryMaxWidthJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it6, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it6;
            }
            long it7 = m895tryMinHeightJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it7, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it7;
            }
            long it8 = m896tryMinWidthJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it8, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it8;
            }
        } else {
            long it9 = m894tryMaxWidthJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it9, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it9;
            }
            long it10 = m893tryMaxHeightJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it10, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it10;
            }
            long it11 = m896tryMinWidthJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it11, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it11;
            }
            long it12 = m895tryMinHeightJN0ABg($this$findSize_u2dToXhtMw, true);
            if (!IntSize.m7042equalsimpl0(it12, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it12;
            }
            long it13 = m894tryMaxWidthJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it13, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it13;
            }
            long it14 = m893tryMaxHeightJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it14, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it14;
            }
            long it15 = m896tryMinWidthJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it15, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it15;
            }
            long it16 = m895tryMinHeightJN0ABg($this$findSize_u2dToXhtMw, false);
            if (!IntSize.m7042equalsimpl0(it16, IntSize.Companion.m7049getZeroYbymL2g())) {
                return it16;
            }
        }
        return IntSize.Companion.m7049getZeroYbymL2g();
    }

    /* renamed from: tryMaxWidth-JN-0ABg  reason: not valid java name */
    private final long m894tryMaxWidthJN0ABg(long $this$tryMaxWidth_u2dJN_u2d0ABg, boolean enforceConstraints) {
        int maxWidth = Constraints.m6826getMaxWidthimpl($this$tryMaxWidth_u2dJN_u2d0ABg);
        if (maxWidth != Integer.MAX_VALUE) {
            float $this$fastRoundToInt$iv = maxWidth / this.aspectRatio;
            int height = Math.round($this$fastRoundToInt$iv);
            if (height > 0 && (!enforceConstraints || AspectRatioKt.m891isSatisfiedByNN6EwU($this$tryMaxWidth_u2dJN_u2d0ABg, maxWidth, height))) {
                return IntSize.m7039constructorimpl((maxWidth << 32) | (height & 4294967295L));
            }
        }
        return IntSize.Companion.m7049getZeroYbymL2g();
    }

    /* renamed from: tryMaxHeight-JN-0ABg  reason: not valid java name */
    private final long m893tryMaxHeightJN0ABg(long $this$tryMaxHeight_u2dJN_u2d0ABg, boolean enforceConstraints) {
        int maxHeight = Constraints.m6825getMaxHeightimpl($this$tryMaxHeight_u2dJN_u2d0ABg);
        if (maxHeight != Integer.MAX_VALUE) {
            float $this$fastRoundToInt$iv = maxHeight * this.aspectRatio;
            int width = Math.round($this$fastRoundToInt$iv);
            if (width > 0 && (!enforceConstraints || AspectRatioKt.m891isSatisfiedByNN6EwU($this$tryMaxHeight_u2dJN_u2d0ABg, width, maxHeight))) {
                return IntSize.m7039constructorimpl((width << 32) | (maxHeight & 4294967295L));
            }
        }
        return IntSize.Companion.m7049getZeroYbymL2g();
    }

    /* renamed from: tryMinWidth-JN-0ABg  reason: not valid java name */
    private final long m896tryMinWidthJN0ABg(long $this$tryMinWidth_u2dJN_u2d0ABg, boolean enforceConstraints) {
        int minWidth = Constraints.m6828getMinWidthimpl($this$tryMinWidth_u2dJN_u2d0ABg);
        float $this$fastRoundToInt$iv = minWidth / this.aspectRatio;
        int height = Math.round($this$fastRoundToInt$iv);
        if (height <= 0 || (enforceConstraints && !AspectRatioKt.m891isSatisfiedByNN6EwU($this$tryMinWidth_u2dJN_u2d0ABg, minWidth, height))) {
            return IntSize.Companion.m7049getZeroYbymL2g();
        }
        return IntSize.m7039constructorimpl((minWidth << 32) | (height & 4294967295L));
    }

    /* renamed from: tryMinHeight-JN-0ABg  reason: not valid java name */
    private final long m895tryMinHeightJN0ABg(long $this$tryMinHeight_u2dJN_u2d0ABg, boolean enforceConstraints) {
        int minHeight = Constraints.m6827getMinHeightimpl($this$tryMinHeight_u2dJN_u2d0ABg);
        float $this$fastRoundToInt$iv = minHeight * this.aspectRatio;
        int width = Math.round($this$fastRoundToInt$iv);
        if (width <= 0 || (enforceConstraints && !AspectRatioKt.m891isSatisfiedByNN6EwU($this$tryMinHeight_u2dJN_u2d0ABg, width, minHeight))) {
            return IntSize.Companion.m7049getZeroYbymL2g();
        }
        return IntSize.m7039constructorimpl((width << 32) | (minHeight & 4294967295L));
    }
}
