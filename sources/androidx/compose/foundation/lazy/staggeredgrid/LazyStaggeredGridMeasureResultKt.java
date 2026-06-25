package androidx.compose.foundation.lazy.staggeredgrid;

import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.lazy.layout.MutableIntervalList;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.unit.DensityKt;
import androidx.compose.ui.unit.IntSize;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlinx.coroutines.CoroutineScopeKt;
/* compiled from: LazyStaggeredGridMeasureResult.kt */
@Metadata(d1 = {"\u0000$\n\u0000\n\u0002\u0010\u0015\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0016\u0010\u000b\u001a\u0004\u0018\u00010\f*\u00020\b2\u0006\u0010\r\u001a\u00020\u0007H\u0000\u001a\f\u0010\u000e\u001a\u00020\u0007*\u00020\bH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0005\"\u0018\u0010\u0006\u001a\u00020\u0007*\u00020\b8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\n¨\u0006\u000f"}, d2 = {"EmptyArray", "", "EmptyLazyStaggeredGridLayoutInfo", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureResult;", "getEmptyLazyStaggeredGridLayoutInfo", "()Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureResult;", "singleAxisViewportSize", "", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridLayoutInfo;", "getSingleAxisViewportSize", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridLayoutInfo;)I", "findVisibleItem", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridItemInfo;", "itemIndex", "visibleItemsAverageSize", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyStaggeredGridMeasureResultKt {
    private static final int[] EmptyArray = new int[0];
    private static final LazyStaggeredGridMeasureResult EmptyLazyStaggeredGridLayoutInfo = new LazyStaggeredGridMeasureResult(EmptyArray, EmptyArray, 0.0f, new MeasureResult() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureResultKt$EmptyLazyStaggeredGridLayoutInfo$1
        private final Map<AlignmentLine, Integer> alignmentLines = MapsKt.emptyMap();
        private final int height;
        private final int width;

        public static /* synthetic */ void getAlignmentLines$annotations() {
        }

        @Override // androidx.compose.ui.layout.MeasureResult
        public int getWidth() {
            return this.width;
        }

        @Override // androidx.compose.ui.layout.MeasureResult
        public int getHeight() {
            return this.height;
        }

        @Override // androidx.compose.ui.layout.MeasureResult
        public Map<AlignmentLine, Integer> getAlignmentLines() {
            return this.alignmentLines;
        }

        @Override // androidx.compose.ui.layout.MeasureResult
        public void placeChildren() {
        }
    }, 0.0f, false, false, false, new LazyStaggeredGridSlots(EmptyArray, EmptyArray), new LazyStaggeredGridSpanProvider(new MutableIntervalList()), DensityKt.Density$default(1.0f, 0.0f, 2, null), 0, CollectionsKt.emptyList(), IntSize.Companion.m7049getZeroYbymL2g(), 0, 0, 0, 0, 0, CoroutineScopeKt.CoroutineScope(EmptyCoroutineContext.INSTANCE), null);

    public static final LazyStaggeredGridItemInfo findVisibleItem(LazyStaggeredGridLayoutInfo $this$findVisibleItem, final int itemIndex) {
        if ($this$findVisibleItem.getVisibleItemsInfo().isEmpty()) {
            return null;
        }
        int index = ((LazyStaggeredGridItemInfo) CollectionsKt.first((List<? extends Object>) $this$findVisibleItem.getVisibleItemsInfo())).getIndex();
        boolean z = false;
        if (itemIndex <= ((LazyStaggeredGridItemInfo) CollectionsKt.last((List<? extends Object>) $this$findVisibleItem.getVisibleItemsInfo())).getIndex() && index <= itemIndex) {
            z = true;
        }
        if (z) {
            int index2 = CollectionsKt.binarySearch$default($this$findVisibleItem.getVisibleItemsInfo(), 0, 0, new Function1<LazyStaggeredGridItemInfo, Integer>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureResultKt$findVisibleItem$index$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Integer invoke(LazyStaggeredGridItemInfo it) {
                    return Integer.valueOf(it.getIndex() - itemIndex);
                }
            }, 3, (Object) null);
            return (LazyStaggeredGridItemInfo) CollectionsKt.getOrNull($this$findVisibleItem.getVisibleItemsInfo(), index2);
        }
        return null;
    }

    public static final LazyStaggeredGridMeasureResult getEmptyLazyStaggeredGridLayoutInfo() {
        return EmptyLazyStaggeredGridLayoutInfo;
    }

    public static final int visibleItemsAverageSize(LazyStaggeredGridLayoutInfo $this$visibleItemsAverageSize) {
        List visibleItems;
        List $this$fastSumBy$iv;
        long arg0$iv;
        List visibleItems2 = $this$visibleItemsAverageSize.getVisibleItemsInfo();
        if (visibleItems2.isEmpty()) {
            return 0;
        }
        List $this$fastSumBy$iv2 = visibleItems2;
        int sum$iv = 0;
        int index$iv$iv = 0;
        int size = $this$fastSumBy$iv2.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastSumBy$iv2.get(index$iv$iv);
            LazyStaggeredGridItemInfo it = (LazyStaggeredGridItemInfo) item$iv$iv;
            if ($this$visibleItemsAverageSize.getOrientation() == Orientation.Vertical) {
                long arg0$iv2 = it.mo1200getSizeYbymL2g();
                visibleItems = visibleItems2;
                $this$fastSumBy$iv = $this$fastSumBy$iv2;
                arg0$iv = arg0$iv2 & 4294967295L;
            } else {
                visibleItems = visibleItems2;
                $this$fastSumBy$iv = $this$fastSumBy$iv2;
                long arg0$iv3 = it.mo1200getSizeYbymL2g();
                arg0$iv = arg0$iv3 >> 32;
            }
            sum$iv += (int) arg0$iv;
            index$iv$iv++;
            visibleItems2 = visibleItems;
            $this$fastSumBy$iv2 = $this$fastSumBy$iv;
        }
        return (sum$iv / visibleItems2.size()) + $this$visibleItemsAverageSize.getMainAxisItemSpacing();
    }

    public static final int getSingleAxisViewportSize(LazyStaggeredGridLayoutInfo $this$singleAxisViewportSize) {
        if ($this$singleAxisViewportSize.getOrientation() == Orientation.Vertical) {
            long arg0$iv = $this$singleAxisViewportSize.mo1202getViewportSizeYbymL2g();
            return (int) (4294967295L & arg0$iv);
        }
        long arg0$iv2 = $this$singleAxisViewportSize.mo1202getViewportSizeYbymL2g();
        return (int) (arg0$iv2 >> 32);
    }
}
