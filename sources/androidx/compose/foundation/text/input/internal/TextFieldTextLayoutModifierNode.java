package androidx.compose.foundation.text.input.internal;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.text.KeyboardOptions;
import androidx.compose.foundation.text.TextDelegateKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.AlignmentLineKt;
import androidx.compose.ui.layout.HorizontalAlignmentLine;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNode;
import androidx.compose.ui.node.CompositionLocalConsumerModifierNodeKt;
import androidx.compose.ui.node.GlobalPositionAwareModifierNode;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TextFieldTextLayoutModifier.kt */
@Metadata(d1 = {"\u0000\u0088\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004Be\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u00126\u0010\r\u001a2\u0012\u0004\u0012\u00020\u000f\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u0010¢\u0006\f\b\u0012\u0012\b\b\u0013\u0012\u0004\b\b(\u0014\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u000e¢\u0006\u0002\b\u0016\u0012\u0006\u0010\u0017\u001a\u00020\u0018¢\u0006\u0002\u0010\u0019J\u0010\u0010 \u001a\u00020\u00152\u0006\u0010!\u001a\u00020\"H\u0016Jf\u0010#\u001a\u00020\u00152\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f26\u0010\r\u001a2\u0012\u0004\u0012\u00020\u000f\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u0010¢\u0006\f\b\u0012\u0012\b\b\u0013\u0012\u0004\b\b(\u0014\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u000e¢\u0006\u0002\b\u00162\u0006\u0010\u0017\u001a\u00020\u0018J&\u0010$\u001a\u00020%*\u00020&2\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020*H\u0016ø\u0001\u0000¢\u0006\u0004\b+\u0010,R\"\u0010\u001a\u001a\u0010\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u001d\u0018\u00010\u001bX\u0082\u000e¢\u0006\b\n\u0000\u0012\u0004\b\u001e\u0010\u001fR\u000e\u0010\u000b\u001a\u00020\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006-"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldTextLayoutModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/node/GlobalPositionAwareModifierNode;", "Landroidx/compose/ui/node/CompositionLocalConsumerModifierNode;", "textLayoutState", "Landroidx/compose/foundation/text/input/internal/TextLayoutState;", "textFieldState", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "singleLine", "", "onTextLayout", "Lkotlin/Function2;", "Landroidx/compose/ui/unit/Density;", "Lkotlin/Function0;", "Landroidx/compose/ui/text/TextLayoutResult;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "getResult", "", "Lkotlin/ExtensionFunctionType;", "keyboardOptions", "Landroidx/compose/foundation/text/KeyboardOptions;", "(Landroidx/compose/foundation/text/input/internal/TextLayoutState;Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/ui/text/TextStyle;ZLkotlin/jvm/functions/Function2;Landroidx/compose/foundation/text/KeyboardOptions;)V", "baselineCache", "", "Landroidx/compose/ui/layout/AlignmentLine;", "", "getBaselineCache$annotations", "()V", "onGloballyPositioned", "coordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "updateNode", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurable", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldTextLayoutModifierNode extends Modifier.Node implements LayoutModifierNode, GlobalPositionAwareModifierNode, CompositionLocalConsumerModifierNode {
    public static final int $stable = 8;
    private Map<AlignmentLine, Integer> baselineCache;
    private boolean singleLine;
    private TextLayoutState textLayoutState;

    private static /* synthetic */ void getBaselineCache$annotations() {
    }

    public TextFieldTextLayoutModifierNode(TextLayoutState textLayoutState, TransformedTextFieldState textFieldState, TextStyle textStyle, boolean singleLine, Function2<? super Density, ? super Function0<TextLayoutResult>, Unit> function2, KeyboardOptions keyboardOptions) {
        this.textLayoutState = textLayoutState;
        this.singleLine = singleLine;
        this.textLayoutState.setOnTextLayout(function2);
        this.textLayoutState.updateNonMeasureInputs(textFieldState, textStyle, this.singleLine, !this.singleLine, keyboardOptions);
    }

    public final void updateNode(TextLayoutState textLayoutState, TransformedTextFieldState textFieldState, TextStyle textStyle, boolean singleLine, Function2<? super Density, ? super Function0<TextLayoutResult>, Unit> function2, KeyboardOptions keyboardOptions) {
        this.textLayoutState = textLayoutState;
        this.textLayoutState.setOnTextLayout(function2);
        this.singleLine = singleLine;
        this.textLayoutState.updateNonMeasureInputs(textFieldState, textStyle, singleLine, !singleLine, keyboardOptions);
    }

    @Override // androidx.compose.ui.node.GlobalPositionAwareModifierNode
    public void onGloballyPositioned(LayoutCoordinates coordinates) {
        this.textLayoutState.setTextLayoutNodeCoordinates(coordinates);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, Measurable measurable, long constraints) {
        float m6873constructorimpl;
        TextLayoutResult result = this.textLayoutState.m1569layoutWithNewMeasureInputshBUhpc($this$measure_u2d3p2s80s, $this$measure_u2d3p2s80s.getLayoutDirection(), (FontFamily.Resolver) CompositionLocalConsumerModifierNodeKt.currentValueOf(this, CompositionLocalsKt.getLocalFontFamilyResolver()), constraints);
        Constraints.Companion companion = Constraints.Companion;
        long arg0$iv = result.m6310getSizeYbymL2g();
        long arg0$iv2 = result.m6310getSizeYbymL2g();
        long arg0$iv3 = result.m6310getSizeYbymL2g();
        int $i$f$unpackInt2 = (int) (arg0$iv3 & 4294967295L);
        long arg0$iv4 = result.m6310getSizeYbymL2g();
        final Placeable placeable = measurable.mo5637measureBRTryo0(companion.m6835fitPrioritizingWidthZbe2FdA((int) (arg0$iv >> 32), (int) (arg0$iv2 >> 32), $i$f$unpackInt2, (int) (arg0$iv4 & 4294967295L)));
        TextLayoutState textLayoutState = this.textLayoutState;
        if (this.singleLine) {
            m6873constructorimpl = $this$measure_u2d3p2s80s.mo641toDpu2uoSUM(TextDelegateKt.ceilToIntPx(result.getLineBottom(0)));
        } else {
            m6873constructorimpl = Dp.m6873constructorimpl(0);
        }
        textLayoutState.m1570setMinHeightForSingleLineField0680j_4(m6873constructorimpl);
        Map cache = this.baselineCache;
        if (cache == null) {
            cache = new LinkedHashMap(2);
        }
        HorizontalAlignmentLine firstBaseline = AlignmentLineKt.getFirstBaseline();
        float $this$fastRoundToInt$iv = result.getFirstBaseline();
        cache.put(firstBaseline, Integer.valueOf(Math.round($this$fastRoundToInt$iv)));
        HorizontalAlignmentLine lastBaseline = AlignmentLineKt.getLastBaseline();
        float $this$fastRoundToInt$iv2 = result.getLastBaseline();
        cache.put(lastBaseline, Integer.valueOf(Math.round($this$fastRoundToInt$iv2)));
        this.baselineCache = cache;
        long arg0$iv5 = result.m6310getSizeYbymL2g();
        long arg0$iv6 = result.m6310getSizeYbymL2g();
        Map<AlignmentLine, Integer> map = this.baselineCache;
        Intrinsics.checkNotNull(map);
        return $this$measure_u2d3p2s80s.layout((int) (arg0$iv5 >> 32), (int) (arg0$iv6 & 4294967295L), map, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldTextLayoutModifierNode$measure$1
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
        });
    }
}
