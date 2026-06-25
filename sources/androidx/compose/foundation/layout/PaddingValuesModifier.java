package androidx.compose.foundation.layout;

import androidx.compose.foundation.layout.internal.InlineClassHelperKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* compiled from: Padding.kt */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u00012\u00020\u0002B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005J&\u0010\t\u001a\u00020\n*\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\u0005\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0012"}, d2 = {"Landroidx/compose/foundation/layout/PaddingValuesModifier;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "paddingValues", "Landroidx/compose/foundation/layout/PaddingValues;", "(Landroidx/compose/foundation/layout/PaddingValues;)V", "getPaddingValues", "()Landroidx/compose/foundation/layout/PaddingValues;", "setPaddingValues", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurable", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "foundation-layout_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class PaddingValuesModifier extends Modifier.Node implements LayoutModifierNode {
    private PaddingValues paddingValues;

    public final PaddingValues getPaddingValues() {
        return this.paddingValues;
    }

    public final void setPaddingValues(PaddingValues paddingValues) {
        this.paddingValues = paddingValues;
    }

    public PaddingValuesModifier(PaddingValues paddingValues) {
        this.paddingValues = paddingValues;
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        float leftPadding = this.paddingValues.mo943calculateLeftPaddingu2uoSUM($this$measure_u2d3p2s80s.getLayoutDirection());
        float topPadding = this.paddingValues.mo945calculateTopPaddingD9Ej5fM();
        float rightPadding = this.paddingValues.mo944calculateRightPaddingu2uoSUM($this$measure_u2d3p2s80s.getLayoutDirection());
        float bottomPadding = this.paddingValues.mo942calculateBottomPaddingD9Ej5fM();
        int $this$dp$iv = Dp.m6872compareTo0680j_4(leftPadding, Dp.m6873constructorimpl(0));
        boolean z = $this$dp$iv >= 0;
        int $this$dp$iv2 = Dp.m6872compareTo0680j_4(topPadding, Dp.m6873constructorimpl(0));
        boolean z2 = z & ($this$dp$iv2 >= 0);
        int $this$dp$iv3 = Dp.m6872compareTo0680j_4(rightPadding, Dp.m6873constructorimpl(0));
        boolean z3 = z2 & ($this$dp$iv3 >= 0);
        int $this$dp$iv4 = Dp.m6872compareTo0680j_4(bottomPadding, Dp.m6873constructorimpl(0));
        boolean value$iv = z3 & ($this$dp$iv4 >= 0);
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("Padding must be non-negative");
        }
        final int roundedLeftPadding = $this$measure_u2d3p2s80s.mo638roundToPx0680j_4(leftPadding);
        int horizontal = roundedLeftPadding + $this$measure_u2d3p2s80s.mo638roundToPx0680j_4(rightPadding);
        final int roundedTopPadding = $this$measure_u2d3p2s80s.mo638roundToPx0680j_4(topPadding);
        int vertical = $this$measure_u2d3p2s80s.mo638roundToPx0680j_4(bottomPadding) + roundedTopPadding;
        final Placeable placeable = measurable.mo5637measureBRTryo0(ConstraintsKt.m6845offsetNN6EwU(constraints, -horizontal, -vertical));
        int width = ConstraintsKt.m6843constrainWidthK40F9xA(constraints, placeable.getWidth() + horizontal);
        int height = ConstraintsKt.m6842constrainHeightK40F9xA(constraints, placeable.getHeight() + vertical);
        return MeasureScope.layout$default($this$measure_u2d3p2s80s, width, height, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.PaddingValuesModifier$measure$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
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
                Placeable.PlacementScope.place$default($this$layout, Placeable.this, roundedLeftPadding, roundedTopPadding, 0.0f, 4, null);
            }
        }, 4, null);
    }
}
