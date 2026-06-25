package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* compiled from: Size.kt */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u00012\u00020\u0002B\u0015\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J&\u0010\u0010\u001a\u00020\u0011*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0016ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000f\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0019"}, d2 = {"Landroidx/compose/foundation/layout/FillNode;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "direction", "Landroidx/compose/foundation/layout/Direction;", "fraction", "", "(Landroidx/compose/foundation/layout/Direction;F)V", "getDirection", "()Landroidx/compose/foundation/layout/Direction;", "setDirection", "(Landroidx/compose/foundation/layout/Direction;)V", "getFraction", "()F", "setFraction", "(F)V", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurable", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "foundation-layout_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class FillNode extends Modifier.Node implements LayoutModifierNode {
    private Direction direction;
    private float fraction;

    public final Direction getDirection() {
        return this.direction;
    }

    public final float getFraction() {
        return this.fraction;
    }

    public final void setDirection(Direction direction) {
        this.direction = direction;
    }

    public final void setFraction(float f) {
        this.fraction = f;
    }

    public FillNode(Direction direction, float fraction) {
        this.direction = direction;
        this.fraction = fraction;
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        int minWidth;
        int $this$fastCoerceAtLeast$iv$iv;
        int minHeight;
        int $this$fastCoerceAtLeast$iv$iv2;
        if (Constraints.m6822getHasBoundedWidthimpl(constraints) && this.direction != Direction.Vertical) {
            float $this$fastRoundToInt$iv = Constraints.m6826getMaxWidthimpl(constraints) * this.fraction;
            int $this$fastCoerceIn$iv = Math.round($this$fastRoundToInt$iv);
            int minimumValue$iv = Constraints.m6828getMinWidthimpl(constraints);
            int maximumValue$iv = Constraints.m6826getMaxWidthimpl(constraints);
            $this$fastCoerceAtLeast$iv$iv = $this$fastCoerceIn$iv;
            if ($this$fastCoerceAtLeast$iv$iv < minimumValue$iv) {
                $this$fastCoerceAtLeast$iv$iv = minimumValue$iv;
            }
            if ($this$fastCoerceAtLeast$iv$iv > maximumValue$iv) {
                $this$fastCoerceAtLeast$iv$iv = maximumValue$iv;
            }
            minWidth = $this$fastCoerceAtLeast$iv$iv;
        } else {
            minWidth = Constraints.m6828getMinWidthimpl(constraints);
            $this$fastCoerceAtLeast$iv$iv = Constraints.m6826getMaxWidthimpl(constraints);
        }
        if (Constraints.m6821getHasBoundedHeightimpl(constraints) && this.direction != Direction.Horizontal) {
            float $this$fastRoundToInt$iv2 = Constraints.m6825getMaxHeightimpl(constraints) * this.fraction;
            int $this$fastCoerceIn$iv2 = Math.round($this$fastRoundToInt$iv2);
            int minimumValue$iv2 = Constraints.m6827getMinHeightimpl(constraints);
            int maximumValue$iv2 = Constraints.m6825getMaxHeightimpl(constraints);
            $this$fastCoerceAtLeast$iv$iv2 = $this$fastCoerceIn$iv2;
            if ($this$fastCoerceAtLeast$iv$iv2 < minimumValue$iv2) {
                $this$fastCoerceAtLeast$iv$iv2 = minimumValue$iv2;
            }
            if ($this$fastCoerceAtLeast$iv$iv2 > maximumValue$iv2) {
                $this$fastCoerceAtLeast$iv$iv2 = maximumValue$iv2;
            }
            minHeight = $this$fastCoerceAtLeast$iv$iv2;
        } else {
            minHeight = Constraints.m6827getMinHeightimpl(constraints);
            $this$fastCoerceAtLeast$iv$iv2 = Constraints.m6825getMaxHeightimpl(constraints);
        }
        final Placeable placeable = measurable.mo5637measureBRTryo0(ConstraintsKt.Constraints(minWidth, $this$fastCoerceAtLeast$iv$iv, minHeight, $this$fastCoerceAtLeast$iv$iv2));
        return MeasureScope.layout$default($this$measure_u2d3p2s80s, placeable.getWidth(), placeable.getHeight(), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.FillNode$measure$1
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
}
