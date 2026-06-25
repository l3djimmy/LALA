package androidx.compose.foundation.lazy.grid;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.snapping.LazyGridSnapLayoutInfoProviderKt;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.RulerScope;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntSize;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: LazyGridMeasureResult.kt */
@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\u001d\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\f\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002BÒ\u0001\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\u0006\u0010\f\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\b\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0010\u001a\u00020\u0011\u0012\u0006\u0010\u0012\u001a\u00020\u0006\u00123\u0010\u0013\u001a/\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0017\u0012\u0016\u0012\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u001a0\u00190\u00180\u0014\u0012\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001c0\u0018\u0012\u0006\u0010\u001d\u001a\u00020\u0006\u0012\u0006\u0010\u001e\u001a\u00020\u0006\u0012\u0006\u0010\u001f\u001a\u00020\u0006\u0012\u0006\u0010 \u001a\u00020\b\u0012\u0006\u0010!\u001a\u00020\"\u0012\u0006\u0010#\u001a\u00020\u0006\u0012\u0006\u0010$\u001a\u00020\u0006¢\u0006\u0002\u0010%J\u0018\u0010Y\u001a\u0004\u0018\u00010\u00002\u0006\u0010Z\u001a\u00020\u00062\u0006\u0010[\u001a\u00020\bJ\t\u0010\\\u001a\u00020IH\u0096\u0001R\u0014\u0010#\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b&\u0010'R\u001e\u0010(\u001a\u000e\u0012\u0004\u0012\u00020*\u0012\u0004\u0012\u00020\u00060)X\u0096\u0005¢\u0006\u0006\u001a\u0004\b+\u0010,R\u0014\u0010-\u001a\u00020\u00068VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b.\u0010'R\u0011\u0010/\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\b0\u00101R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b2\u00101R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b3\u00104R\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b5\u00106R\u0011\u0010\u0010\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b7\u00108R\u0013\u0010\u0003\u001a\u0004\u0018\u00010\u0004¢\u0006\b\n\u0000\u001a\u0004\b9\u0010:R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b;\u0010'R\u0012\u0010<\u001a\u00020\u0006X\u0096\u0005¢\u0006\u0006\u001a\u0004\b=\u0010'R\u0014\u0010$\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b>\u0010'R\u0014\u0010?\u001a\u00020\u00068VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b@\u0010'R\u000e\u0010\u000b\u001a\u00020\u0002X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010!\u001a\u00020\"X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bA\u0010BR>\u0010\u0013\u001a/\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0017\u0012\u0016\u0012\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u001a0\u00190\u00180\u0014¢\u0006\b\n\u0000\u001a\u0004\bC\u0010DR\u0011\u0010\r\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\bE\u00101R\u0014\u0010 \u001a\u00020\bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bF\u00101R'\u0010G\u001a\u0015\u0012\u0004\u0012\u00020H\u0012\u0004\u0012\u00020I\u0018\u00010\u0014¢\u0006\u0002\bJ8VX\u0096\u0005¢\u0006\u0006\u001a\u0004\bK\u0010DR\u0011\u0010\f\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\bL\u00104R\u0011\u0010\u0012\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\bM\u0010'R\u0014\u0010\u001f\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bN\u0010'R\u0014\u0010\u001e\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bO\u0010'R\u001a\u0010P\u001a\u00020Q8VX\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\bR\u0010SR\u0014\u0010\u001d\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bT\u0010'R\u001a\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001c0\u0018X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bU\u0010VR\u0012\u0010W\u001a\u00020\u0006X\u0096\u0005¢\u0006\u0006\u001a\u0004\bX\u0010'\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006]"}, d2 = {"Landroidx/compose/foundation/lazy/grid/LazyGridMeasureResult;", "Landroidx/compose/foundation/lazy/grid/LazyGridLayoutInfo;", "Landroidx/compose/ui/layout/MeasureResult;", "firstVisibleLine", "Landroidx/compose/foundation/lazy/grid/LazyGridMeasuredLine;", "firstVisibleLineScrollOffset", "", "canScrollForward", "", "consumedScroll", "", "measureResult", "scrollBackAmount", "remeasureNeeded", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "density", "Landroidx/compose/ui/unit/Density;", "slotsPerLine", "prefetchInfoRetriever", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "line", "", "Lkotlin/Pair;", "Landroidx/compose/ui/unit/Constraints;", "visibleItemsInfo", "Landroidx/compose/foundation/lazy/grid/LazyGridMeasuredItem;", "viewportStartOffset", "viewportEndOffset", "totalItemsCount", "reverseLayout", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "afterContentPadding", "mainAxisItemSpacing", "(Landroidx/compose/foundation/lazy/grid/LazyGridMeasuredLine;IZFLandroidx/compose/ui/layout/MeasureResult;FZLkotlinx/coroutines/CoroutineScope;Landroidx/compose/ui/unit/Density;ILkotlin/jvm/functions/Function1;Ljava/util/List;IIIZLandroidx/compose/foundation/gestures/Orientation;II)V", "getAfterContentPadding", "()I", "alignmentLines", "", "Landroidx/compose/ui/layout/AlignmentLine;", "getAlignmentLines", "()Ljava/util/Map;", "beforeContentPadding", "getBeforeContentPadding", "canScrollBackward", "getCanScrollBackward", "()Z", "getCanScrollForward", "getConsumedScroll", "()F", "getCoroutineScope", "()Lkotlinx/coroutines/CoroutineScope;", "getDensity", "()Landroidx/compose/ui/unit/Density;", "getFirstVisibleLine", "()Landroidx/compose/foundation/lazy/grid/LazyGridMeasuredLine;", "getFirstVisibleLineScrollOffset", "height", "getHeight", "getMainAxisItemSpacing", "maxSpan", "getMaxSpan", "getOrientation", "()Landroidx/compose/foundation/gestures/Orientation;", "getPrefetchInfoRetriever", "()Lkotlin/jvm/functions/Function1;", "getRemeasureNeeded", "getReverseLayout", "rulers", "Landroidx/compose/ui/layout/RulerScope;", "", "Lkotlin/ExtensionFunctionType;", "getRulers", "getScrollBackAmount", "getSlotsPerLine", "getTotalItemsCount", "getViewportEndOffset", "viewportSize", "Landroidx/compose/ui/unit/IntSize;", "getViewportSize-YbymL2g", "()J", "getViewportStartOffset", "getVisibleItemsInfo", "()Ljava/util/List;", "width", "getWidth", "copyWithScrollDeltaWithoutRemeasure", "delta", "updateAnimations", "placeChildren", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyGridMeasureResult implements LazyGridLayoutInfo, MeasureResult {
    public static final int $stable = 8;
    private final int afterContentPadding;
    private final boolean canScrollForward;
    private final float consumedScroll;
    private final CoroutineScope coroutineScope;
    private final Density density;
    private final LazyGridMeasuredLine firstVisibleLine;
    private final int firstVisibleLineScrollOffset;
    private final int mainAxisItemSpacing;
    private final MeasureResult measureResult;
    private final Orientation orientation;
    private final Function1<Integer, List<Pair<Integer, Constraints>>> prefetchInfoRetriever;
    private final boolean remeasureNeeded;
    private final boolean reverseLayout;
    private final float scrollBackAmount;
    private final int slotsPerLine;
    private final int totalItemsCount;
    private final int viewportEndOffset;
    private final int viewportStartOffset;
    private final List<LazyGridMeasuredItem> visibleItemsInfo;

    @Override // androidx.compose.ui.layout.MeasureResult
    public Map<AlignmentLine, Integer> getAlignmentLines() {
        return this.measureResult.getAlignmentLines();
    }

    @Override // androidx.compose.ui.layout.MeasureResult
    public int getHeight() {
        return this.measureResult.getHeight();
    }

    @Override // androidx.compose.ui.layout.MeasureResult
    public Function1<RulerScope, Unit> getRulers() {
        return this.measureResult.getRulers();
    }

    @Override // androidx.compose.ui.layout.MeasureResult
    public int getWidth() {
        return this.measureResult.getWidth();
    }

    @Override // androidx.compose.ui.layout.MeasureResult
    public void placeChildren() {
        this.measureResult.placeChildren();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public LazyGridMeasureResult(LazyGridMeasuredLine firstVisibleLine, int firstVisibleLineScrollOffset, boolean canScrollForward, float consumedScroll, MeasureResult measureResult, float scrollBackAmount, boolean remeasureNeeded, CoroutineScope coroutineScope, Density density, int slotsPerLine, Function1<? super Integer, ? extends List<Pair<Integer, Constraints>>> function1, List<LazyGridMeasuredItem> list, int viewportStartOffset, int viewportEndOffset, int totalItemsCount, boolean reverseLayout, Orientation orientation, int afterContentPadding, int mainAxisItemSpacing) {
        this.firstVisibleLine = firstVisibleLine;
        this.firstVisibleLineScrollOffset = firstVisibleLineScrollOffset;
        this.canScrollForward = canScrollForward;
        this.consumedScroll = consumedScroll;
        this.measureResult = measureResult;
        this.scrollBackAmount = scrollBackAmount;
        this.remeasureNeeded = remeasureNeeded;
        this.coroutineScope = coroutineScope;
        this.density = density;
        this.slotsPerLine = slotsPerLine;
        this.prefetchInfoRetriever = function1;
        this.visibleItemsInfo = list;
        this.viewportStartOffset = viewportStartOffset;
        this.viewportEndOffset = viewportEndOffset;
        this.totalItemsCount = totalItemsCount;
        this.reverseLayout = reverseLayout;
        this.orientation = orientation;
        this.afterContentPadding = afterContentPadding;
        this.mainAxisItemSpacing = mainAxisItemSpacing;
    }

    public final LazyGridMeasuredLine getFirstVisibleLine() {
        return this.firstVisibleLine;
    }

    public final int getFirstVisibleLineScrollOffset() {
        return this.firstVisibleLineScrollOffset;
    }

    public final boolean getCanScrollForward() {
        return this.canScrollForward;
    }

    public final float getConsumedScroll() {
        return this.consumedScroll;
    }

    public final float getScrollBackAmount() {
        return this.scrollBackAmount;
    }

    public final boolean getRemeasureNeeded() {
        return this.remeasureNeeded;
    }

    public final CoroutineScope getCoroutineScope() {
        return this.coroutineScope;
    }

    public final Density getDensity() {
        return this.density;
    }

    public final int getSlotsPerLine() {
        return this.slotsPerLine;
    }

    public final Function1<Integer, List<Pair<Integer, Constraints>>> getPrefetchInfoRetriever() {
        return this.prefetchInfoRetriever;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public List<LazyGridMeasuredItem> getVisibleItemsInfo() {
        return this.visibleItemsInfo;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getViewportStartOffset() {
        return this.viewportStartOffset;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getViewportEndOffset() {
        return this.viewportEndOffset;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getTotalItemsCount() {
        return this.totalItemsCount;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public boolean getReverseLayout() {
        return this.reverseLayout;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public Orientation getOrientation() {
        return this.orientation;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getAfterContentPadding() {
        return this.afterContentPadding;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getMainAxisItemSpacing() {
        return this.mainAxisItemSpacing;
    }

    public final boolean getCanScrollBackward() {
        LazyGridMeasuredLine lazyGridMeasuredLine = this.firstVisibleLine;
        return ((lazyGridMeasuredLine != null ? lazyGridMeasuredLine.getIndex() : 0) == 0 && this.firstVisibleLineScrollOffset == 0) ? false : true;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    /* renamed from: getViewportSize-YbymL2g */
    public long mo1136getViewportSizeYbymL2g() {
        int width$iv = getWidth();
        int height$iv = getHeight();
        return IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L));
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getBeforeContentPadding() {
        return -getViewportStartOffset();
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridLayoutInfo
    public int getMaxSpan() {
        return this.slotsPerLine;
    }

    public final LazyGridMeasureResult copyWithScrollDeltaWithoutRemeasure(int delta, boolean updateAnimations) {
        int deltaToFirstItemChange;
        if (!this.remeasureNeeded && !getVisibleItemsInfo().isEmpty() && this.firstVisibleLine != null) {
            int mainAxisSizeWithSpacings = this.firstVisibleLine.getMainAxisSizeWithSpacings();
            int i = this.firstVisibleLineScrollOffset - delta;
            if (i >= 0 && i < mainAxisSizeWithSpacings) {
                LazyGridMeasuredItem first = (LazyGridMeasuredItem) CollectionsKt.first((List<? extends Object>) getVisibleItemsInfo());
                LazyGridMeasuredItem last = (LazyGridMeasuredItem) CollectionsKt.last((List<? extends Object>) getVisibleItemsInfo());
                if (!first.getNonScrollableItem() && !last.getNonScrollableItem()) {
                    if (delta >= 0) {
                        int deltaToFirstItemChange2 = getViewportStartOffset() - LazyGridSnapLayoutInfoProviderKt.offsetOnMainAxis(first, getOrientation());
                        int deltaToLastItemChange = getViewportEndOffset() - LazyGridSnapLayoutInfoProviderKt.offsetOnMainAxis(last, getOrientation());
                        deltaToFirstItemChange = Math.min(deltaToFirstItemChange2, deltaToLastItemChange) > delta ? 1 : 0;
                    } else {
                        int deltaToFirstItemChange3 = (LazyGridSnapLayoutInfoProviderKt.offsetOnMainAxis(first, getOrientation()) + first.getMainAxisSizeWithSpacings()) - getViewportStartOffset();
                        int deltaToLastItemChange2 = (LazyGridSnapLayoutInfoProviderKt.offsetOnMainAxis(last, getOrientation()) + last.getMainAxisSizeWithSpacings()) - getViewportEndOffset();
                        deltaToFirstItemChange = Math.min(deltaToFirstItemChange3, deltaToLastItemChange2) > (-delta) ? 1 : 0;
                    }
                    if (deltaToFirstItemChange != 0) {
                        List $this$fastForEach$iv = getVisibleItemsInfo();
                        int size = $this$fastForEach$iv.size();
                        for (int index$iv = 0; index$iv < size; index$iv++) {
                            Object item$iv = $this$fastForEach$iv.get(index$iv);
                            LazyGridMeasuredItem it = (LazyGridMeasuredItem) item$iv;
                            it.applyScrollDelta(delta, updateAnimations);
                        }
                        return new LazyGridMeasureResult(this.firstVisibleLine, this.firstVisibleLineScrollOffset - delta, this.canScrollForward || delta > 0, delta, this.measureResult, this.scrollBackAmount, this.remeasureNeeded, this.coroutineScope, this.density, this.slotsPerLine, this.prefetchInfoRetriever, getVisibleItemsInfo(), getViewportStartOffset(), getViewportEndOffset(), getTotalItemsCount(), getReverseLayout(), getOrientation(), getAfterContentPadding(), getMainAxisItemSpacing());
                    }
                    return null;
                }
                return null;
            }
        }
        return null;
    }
}
