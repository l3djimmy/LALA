package androidx.compose.foundation.text;

import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.IntOffset;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: BasicText.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u0001B+\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0016\u0010\u0005\u001a\u0012\u0012\u000e\u0012\f\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u00060\u0003¢\u0006\u0002\u0010\bJ,\u0010\t\u001a\u00020\n*\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u00062\u0006\u0010\u000e\u001a\u00020\u000fH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011R\u001e\u0010\u0005\u001a\u0012\u0012\u000e\u0012\f\u0012\u0006\u0012\u0004\u0018\u00010\u0007\u0018\u00010\u00060\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0012"}, d2 = {"Landroidx/compose/foundation/text/TextMeasurePolicy;", "Landroidx/compose/ui/layout/MeasurePolicy;", "shouldMeasureLinks", "Lkotlin/Function0;", "", "placements", "", "Landroidx/compose/ui/geometry/Rect;", "(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "measurables", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Ljava/util/List;J)Landroidx/compose/ui/layout/MeasureResult;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextMeasurePolicy implements MeasurePolicy {
    private final Function0<List<Rect>> placements;
    private final Function0<Boolean> shouldMeasureLinks;

    /* JADX WARN: Multi-variable type inference failed */
    public TextMeasurePolicy(Function0<Boolean> function0, Function0<? extends List<Rect>> function02) {
        this.shouldMeasureLinks = function0;
        this.placements = function02;
    }

    @Override // androidx.compose.ui.layout.MeasurePolicy
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo300measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, List<? extends Measurable> list, long constraints) {
        final ArrayList inlineContentToPlace;
        final List linksToPlace;
        List inlineContentMeasurables;
        List $this$fastMapIndexedNotNull$iv;
        boolean z;
        ArrayList target$iv;
        List $this$fastForEachIndexed$iv$iv;
        Pair pair;
        List target$iv2 = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
            Measurable measurable = list.get(index$iv$iv);
            Measurable it = measurable;
            if (!(it.getParentData() instanceof TextRangeLayoutModifier)) {
                target$iv2.add(measurable);
            }
        }
        List inlineContentMeasurables2 = target$iv2;
        List $this$fastMapIndexedNotNull$iv2 = this.placements.invoke();
        if ($this$fastMapIndexedNotNull$iv2 != null) {
            boolean z2 = false;
            ArrayList target$iv3 = new ArrayList($this$fastMapIndexedNotNull$iv2.size());
            List $this$fastForEachIndexed$iv$iv2 = $this$fastMapIndexedNotNull$iv2;
            int index$iv$iv2 = 0;
            int size2 = $this$fastForEachIndexed$iv$iv2.size();
            while (index$iv$iv2 < size2) {
                Object item$iv$iv = $this$fastForEachIndexed$iv$iv2.get(index$iv$iv2);
                int index$iv = index$iv$iv2;
                Rect rect = (Rect) item$iv$iv;
                if (rect != null) {
                    inlineContentMeasurables = inlineContentMeasurables2;
                    $this$fastMapIndexedNotNull$iv = $this$fastMapIndexedNotNull$iv2;
                    z = z2;
                    target$iv = target$iv3;
                    Placeable mo5637measureBRTryo0 = ((Measurable) inlineContentMeasurables2.get(index$iv)).mo5637measureBRTryo0(ConstraintsKt.Constraints$default(0, (int) Math.floor(rect.getRight() - rect.getLeft()), 0, (int) Math.floor(rect.getBottom() - rect.getTop()), 5, null));
                    float $this$fastRoundToInt$iv = rect.getLeft();
                    int x$iv = Math.round($this$fastRoundToInt$iv);
                    float $this$fastRoundToInt$iv2 = rect.getTop();
                    int y$iv = Math.round($this$fastRoundToInt$iv2);
                    $this$fastForEachIndexed$iv$iv = $this$fastForEachIndexed$iv$iv2;
                    pair = new Pair(mo5637measureBRTryo0, IntOffset.m6992boximpl(IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L))));
                } else {
                    inlineContentMeasurables = inlineContentMeasurables2;
                    $this$fastMapIndexedNotNull$iv = $this$fastMapIndexedNotNull$iv2;
                    z = z2;
                    target$iv = target$iv3;
                    $this$fastForEachIndexed$iv$iv = $this$fastForEachIndexed$iv$iv2;
                    pair = null;
                }
                if (pair != null) {
                    target$iv.add(pair);
                }
                index$iv$iv2++;
                z2 = z;
                inlineContentMeasurables2 = inlineContentMeasurables;
                target$iv3 = target$iv;
                $this$fastForEachIndexed$iv$iv2 = $this$fastForEachIndexed$iv$iv;
                $this$fastMapIndexedNotNull$iv2 = $this$fastMapIndexedNotNull$iv;
            }
            inlineContentToPlace = target$iv3;
        } else {
            inlineContentToPlace = null;
        }
        List target$iv4 = new ArrayList(list.size());
        int size3 = list.size();
        for (int index$iv$iv3 = 0; index$iv$iv3 < size3; index$iv$iv3++) {
            Measurable measurable2 = list.get(index$iv$iv3);
            Measurable it2 = measurable2;
            if (it2.getParentData() instanceof TextRangeLayoutModifier) {
                target$iv4.add(measurable2);
            }
        }
        List linksMeasurables = target$iv4;
        linksToPlace = BasicTextKt.measureWithTextRangeMeasureConstraints(linksMeasurables, this.shouldMeasureLinks);
        return MeasureScope.layout$default($this$measure_u2d3p2s80s, Constraints.m6826getMaxWidthimpl(constraints), Constraints.m6825getMaxHeightimpl(constraints), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.text.TextMeasurePolicy$measure$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
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
                List $this$fastForEach$iv = inlineContentToPlace;
                if ($this$fastForEach$iv != null) {
                    int size4 = $this$fastForEach$iv.size();
                    for (int index$iv2 = 0; index$iv2 < size4; index$iv2++) {
                        Object item$iv = $this$fastForEach$iv.get(index$iv2);
                        Pair<Placeable, IntOffset> pair2 = (Pair) item$iv;
                        Placeable placeable = pair2.component1();
                        long position = pair2.component2().m7010unboximpl();
                        Placeable.PlacementScope.m5701place70tqf50$default($this$layout, placeable, position, 0.0f, 2, null);
                    }
                }
                List $this$fastForEach$iv2 = linksToPlace;
                if ($this$fastForEach$iv2 == null) {
                    return;
                }
                int size5 = $this$fastForEach$iv2.size();
                for (int index$iv3 = 0; index$iv3 < size5; index$iv3++) {
                    Object item$iv2 = $this$fastForEach$iv2.get(index$iv3);
                    Pair<Placeable, Function0<IntOffset>> pair3 = (Pair) item$iv2;
                    Placeable placeable2 = pair3.component1();
                    Function0 measureResult = pair3.component2();
                    Placeable.PlacementScope.m5701place70tqf50$default($this$layout, placeable2, measureResult != null ? measureResult.invoke().m7010unboximpl() : IntOffset.Companion.m7012getZeronOccac(), 0.0f, 2, null);
                }
            }
        }, 4, null);
    }
}
