package androidx.compose.foundation.lazy.staggeredgrid;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.lazy.layout.LazyLayoutMeasureScope;
import androidx.compose.ui.graphics.GraphicsContext;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: LazyStaggeredGridMeasure.kt */
@Metadata(d1 = {"\u0000®\u0001\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0015\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a\u0017\u0010\u0004\u001a\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007H\u0082\b\u001a5\u0010\t\u001a\u0002H\n\"\u0004\b\u0000\u0010\n2\u0006\u0010\u000b\u001a\u00020\f2\u0017\u0010\r\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H\n0\u000e¢\u0006\u0002\b\u000fH\u0082\b¢\u0006\u0002\u0010\u0010\u001aR\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012*\u00020\u00142\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00050\u000e2!\u0010\u0016\u001a\u001d\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u00010\u000e2\u0006\u0010\u001a\u001a\u00020\u0001H\u0082\b\u001aK\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u00130\u0012*\u00020\u00142\u0012\u0010\u001c\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00130\u001e0\u001d2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u00032\u0006\u0010\"\u001a\u00020\u00032\u0006\u0010#\u001a\u00020\u0003H\u0002¢\u0006\u0002\u0010$\u001a\u001d\u0010%\u001a\u00020\b*\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00130\u001e0\u001dH\u0002¢\u0006\u0002\u0010&\u001a\u001c\u0010'\u001a\u00020\u0005*\u00020\u00142\u0006\u0010(\u001a\u00020 2\u0006\u0010)\u001a\u00020\u0003H\u0002\u001a7\u0010*\u001a\u00020\u0005\"\u0004\b\u0000\u0010\n*\b\u0012\u0004\u0012\u0002H\n0\u00122\b\b\u0002\u0010+\u001a\u00020\u00012\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u0002H\n\u0012\u0004\u0012\u00020\u00050\u000eH\u0082\b\u001a\u001c\u0010-\u001a\u00020\u0003*\u00020\u00142\u0006\u0010.\u001a\u00020\u00032\u0006\u0010/\u001a\u00020\u0003H\u0002\u001a+\u00100\u001a\u00020\u0005*\u0002012\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00050\u000eH\u0082\bø\u0001\u0000¢\u0006\u0004\b2\u00103\u001a\f\u00104\u001a\u00020\u0003*\u00020 H\u0002\u001a2\u00105\u001a\u00020\u0003\"\u0004\b\u0000\u0010\n*\b\u0012\u0004\u0012\u0002H\n0\u001d2\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u0002H\n\u0012\u0004\u0012\u00020\u00030\u000eH\u0082\b¢\u0006\u0002\u00106\u001a\u0016\u00107\u001a\u00020\u0003*\u00020 2\b\b\u0002\u00108\u001a\u00020\u0003H\u0000\u001aG\u00109\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0012*\u00020\u00142\u0006\u0010:\u001a\u00020\u00032\u0006\u0010;\u001a\u00020\u00032\u0006\u0010<\u001a\u00020\u00012\u0018\u0010\u0015\u001a\u0014\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00050=H\u0082\b\u001a\u001e\u0010>\u001a\u00020\u0003*\u00020 2\u0006\u0010?\u001a\u000201H\u0002ø\u0001\u0000¢\u0006\u0004\b@\u0010A\u001a,\u0010B\u001a\u00020C*\u00020\u00142\u0006\u0010D\u001a\u00020\u00032\u0006\u0010E\u001a\u00020 2\u0006\u0010F\u001a\u00020 2\u0006\u0010G\u001a\u00020\u0001H\u0002\u001a¦\u0001\u0010H\u001a\u00020C*\u00020\f2\u0006\u0010I\u001a\u00020J2\f\u0010K\u001a\b\u0012\u0004\u0012\u00020\u00030\u00122\u0006\u0010L\u001a\u00020M2\u0006\u0010N\u001a\u00020O2\u0006\u0010P\u001a\u00020Q2\u0006\u0010R\u001a\u00020\u00012\u0006\u0010S\u001a\u00020\u00012\u0006\u0010T\u001a\u00020U2\u0006\u0010V\u001a\u00020\u00032\u0006\u0010W\u001a\u00020\u00032\u0006\u0010X\u001a\u00020\u00032\u0006\u0010Y\u001a\u00020\u00032\u0006\u0010Z\u001a\u00020[2\u0006\u0010\\\u001a\u00020\u00012\u0006\u0010<\u001a\u00020\u00012\b\u0010]\u001a\u0004\u0018\u00010^2\u0006\u0010_\u001a\u00020`H\u0000ø\u0001\u0000¢\u0006\u0004\ba\u0010b\u001a\u0014\u0010c\u001a\u00020\u0005*\u00020 2\u0006\u0010d\u001a\u00020\u0003H\u0002\u001a!\u0010e\u001a\u00020 *\u00020 2\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u000eH\u0082\b\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0003X\u0082T¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006f"}, d2 = {"DebugLoggingEnabled", "", "Unset", "", "debugLog", "", "message", "Lkotlin/Function0;", "", "withDebugLogging", ExifInterface.GPS_DIRECTION_TRUE, "scope", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;", "block", "Lkotlin/Function1;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "calculateExtraItems", "", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasuredItem;", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureContext;", "position", "filter", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "itemIndex", "beforeVisibleBounds", "calculateVisibleItems", "measuredItems", "", "Lkotlin/collections/ArrayDeque;", "itemScrollOffsets", "", "mainAxisLayoutSize", "minOffset", "maxOffset", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureContext;[Lkotlin/collections/ArrayDeque;[IIII)Ljava/util/List;", "debugRender", "([Lkotlin/collections/ArrayDeque;)Ljava/lang/String;", "ensureIndicesInRange", "indices", "itemCount", "fastForEach", "reverse", "action", "findPreviousItemIndex", "item", "lane", "forEach", "Landroidx/compose/foundation/lazy/staggeredgrid/SpanRange;", "forEach-nIS5qE8", "(JLkotlin/jvm/functions/Function1;)V", "indexOfMaxValue", "indexOfMinBy", "([Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)I", "indexOfMinValue", "minBound", "itemsRetainedForLookahead", "lastVisibleItemIndex", "itemsCount", "isLookingAhead", "Lkotlin/Function2;", "maxInRange", "indexRange", "maxInRange-jy6DScQ", "([IJ)I", "measure", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureResult;", "initialScrollDelta", "initialItemIndices", "initialItemOffsets", "canRestartMeasure", "measureStaggeredGrid", "state", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;", "pinnedItems", "itemProvider", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridItemProvider;", "resolvedSlots", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridSlots;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "isVertical", "reverseLayout", "contentOffset", "Landroidx/compose/ui/unit/IntOffset;", "mainAxisAvailableSize", "mainAxisSpacing", "beforeContentPadding", "afterContentPadding", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "isInLookaheadScope", "approachLayoutInfo", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridLayoutInfo;", "graphicsContext", "Landroidx/compose/ui/graphics/GraphicsContext;", "measureStaggeredGrid-C6celF4", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;Ljava/util/List;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridItemProvider;Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridSlots;JZZJIIIILkotlinx/coroutines/CoroutineScope;ZZLandroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridLayoutInfo;Landroidx/compose/ui/graphics/GraphicsContext;)Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureResult;", "offsetBy", "delta", "transform", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyStaggeredGridMeasureKt {
    private static final boolean DebugLoggingEnabled = false;
    private static final int Unset = Integer.MIN_VALUE;

    private static final <T> T withDebugLogging(LazyLayoutMeasureScope scope, Function1<? super LazyLayoutMeasureScope, ? extends T> function1) {
        return function1.invoke(scope);
    }

    private static final String debugRender(ArrayDeque<LazyStaggeredGridMeasuredItem>[] arrayDequeArr) {
        return "";
    }

    private static final void debugLog(Function0<String> function0) {
    }

    /* renamed from: measureStaggeredGrid-C6celF4  reason: not valid java name */
    public static final LazyStaggeredGridMeasureResult m1211measureStaggeredGridC6celF4(LazyLayoutMeasureScope $this$measureStaggeredGrid_u2dC6celF4, LazyStaggeredGridState state, List<Integer> list, LazyStaggeredGridItemProvider itemProvider, LazyStaggeredGridSlots resolvedSlots, long constraints, boolean isVertical, boolean reverseLayout, long contentOffset, int mainAxisAvailableSize, int mainAxisSpacing, int beforeContentPadding, int afterContentPadding, CoroutineScope coroutineScope, boolean isInLookaheadScope, boolean isLookingAhead, LazyStaggeredGridLayoutInfo approachLayoutInfo, GraphicsContext graphicsContext) {
        int[] initialItemIndices;
        int m1210maxInRangejy6DScQ;
        int[] initialItemOffsets;
        int i;
        LazyStaggeredGridMeasureContext context = new LazyStaggeredGridMeasureContext(state, list, itemProvider, resolvedSlots, constraints, isVertical, $this$measureStaggeredGrid_u2dC6celF4, mainAxisAvailableSize, contentOffset, beforeContentPadding, afterContentPadding, reverseLayout, mainAxisSpacing, coroutineScope, isInLookaheadScope, isLookingAhead, approachLayoutInfo, graphicsContext, null);
        int[] firstVisibleIndices = state.updateScrollPositionIfTheFirstItemWasMoved$foundation_release(itemProvider, state.getScrollPosition$foundation_release().getIndices());
        int[] firstVisibleOffsets = state.getScrollPosition$foundation_release().getScrollOffsets();
        if (firstVisibleIndices.length == context.getLaneCount()) {
            initialItemIndices = firstVisibleIndices;
        } else {
            context.getLaneInfo().reset();
            initialItemIndices = new int[context.getLaneCount()];
            int length = initialItemIndices.length;
            for (int lane = 0; lane < length; lane++) {
                if (lane < firstVisibleIndices.length && firstVisibleIndices[lane] != -1) {
                    m1210maxInRangejy6DScQ = firstVisibleIndices[lane];
                } else if (lane == 0) {
                    m1210maxInRangejy6DScQ = 0;
                } else {
                    m1210maxInRangejy6DScQ = m1210maxInRangejy6DScQ(initialItemIndices, SpanRange.m1221constructorimpl(0, lane)) + 1;
                }
                initialItemIndices[lane] = m1210maxInRangejy6DScQ;
                context.getLaneInfo().setLane(initialItemIndices[lane], lane);
            }
        }
        if (firstVisibleOffsets.length == context.getLaneCount()) {
            initialItemOffsets = firstVisibleOffsets;
        } else {
            initialItemOffsets = new int[context.getLaneCount()];
            int lane2 = 0;
            int length2 = initialItemOffsets.length;
            while (lane2 < length2) {
                if (lane2 < firstVisibleOffsets.length) {
                    i = firstVisibleOffsets[lane2];
                } else {
                    i = lane2 == 0 ? 0 : initialItemOffsets[lane2 - 1];
                }
                initialItemOffsets[lane2] = i;
                lane2++;
            }
        }
        float $this$fastRoundToInt$iv = state.scrollToBeConsumed$foundation_release(isLookingAhead);
        return measure(context, Math.round($this$fastRoundToInt$iv), initialItemIndices, initialItemOffsets, true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:355:0x098c, code lost:
        r5 = r1.get(r2);
        r35 = r5;
     */
    /* JADX WARN: Removed duplicated region for block: B:379:0x0a19  */
    /* JADX WARN: Removed duplicated region for block: B:400:0x0ace  */
    /* JADX WARN: Removed duplicated region for block: B:402:0x0ada A[LOOP:24: B:362:0x09c2->B:402:0x0ada, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:411:0x0b66  */
    /* JADX WARN: Removed duplicated region for block: B:431:0x0be4  */
    /* JADX WARN: Removed duplicated region for block: B:432:0x0be6  */
    /* JADX WARN: Removed duplicated region for block: B:459:0x0c8d  */
    /* JADX WARN: Removed duplicated region for block: B:462:0x0cb0  */
    /* JADX WARN: Removed duplicated region for block: B:465:0x0d1e  */
    /* JADX WARN: Removed duplicated region for block: B:482:0x0dad  */
    /* JADX WARN: Removed duplicated region for block: B:486:0x0db9  */
    /* JADX WARN: Removed duplicated region for block: B:495:0x0dd0  */
    /* JADX WARN: Removed duplicated region for block: B:617:0x0aec A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:631:0x0dcd A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureResult measure(final androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureContext r76, int r77, int[] r78, int[] r79, boolean r80) {
        /*
            Method dump skipped, instructions count: 4310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureKt.measure(androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureContext, int, int[], int[], boolean):androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureResult");
    }

    private static final boolean measure$lambda$43$hasSpaceBeforeFirst(int[] firstItemIndices, int[] firstItemOffsets, LazyStaggeredGridMeasureContext $this_measure) {
        int length = firstItemIndices.length;
        for (int lane = 0; lane < length; lane++) {
            int itemIndex = firstItemIndices[lane];
            int itemOffset = firstItemOffsets[lane];
            if (itemOffset < Math.max(-$this_measure.getMainAxisSpacing(), 0) && itemIndex > 0) {
                return true;
            }
        }
        return false;
    }

    private static final boolean measure$lambda$43$misalignedStart(int[] firstItemIndices, LazyStaggeredGridMeasureContext $this_measure, int[] firstItemOffsets, int referenceLane) {
        int lane = 0;
        int length = firstItemIndices.length;
        while (true) {
            boolean misalignedOffsets = false;
            if (lane < length) {
                if (findPreviousItemIndex($this_measure, firstItemIndices[lane], lane) == -1 && firstItemOffsets[lane] != firstItemOffsets[referenceLane]) {
                    misalignedOffsets = true;
                }
                if (misalignedOffsets) {
                    return true;
                }
                lane++;
            } else {
                int length2 = firstItemIndices.length;
                for (int lane2 = 0; lane2 < length2; lane2++) {
                    boolean moreItemsInOtherLanes = findPreviousItemIndex($this_measure, firstItemIndices[lane2], lane2) != -1 && firstItemOffsets[lane2] >= firstItemOffsets[referenceLane];
                    if (moreItemsInOtherLanes) {
                        return true;
                    }
                }
                int firstItemLane = $this_measure.getLaneInfo().getLane(0);
                return (firstItemLane == 0 || firstItemLane == -1 || firstItemLane == -2) ? false : true;
            }
        }
    }

    private static final List<LazyStaggeredGridMeasuredItem> calculateVisibleItems(LazyStaggeredGridMeasureContext $this$calculateVisibleItems, ArrayDeque<LazyStaggeredGridMeasuredItem>[] arrayDequeArr, int[] itemScrollOffsets, int mainAxisLayoutSize, int minOffset, int maxOffset) {
        boolean z;
        ArrayDeque[] arrayDequeArr2 = arrayDequeArr;
        int[] iArr = itemScrollOffsets;
        int i = 0;
        for (ArrayDeque it : arrayDequeArr2) {
            i += it.size();
        }
        ArrayList positionedItems = new ArrayList(i);
        while (true) {
            int length = arrayDequeArr.length;
            int i2 = 0;
            while (true) {
                if (i2 < length) {
                    if (!arrayDequeArr[i2].isEmpty()) {
                        z = true;
                        break;
                    }
                    i2++;
                } else {
                    z = false;
                    break;
                }
            }
            if (!z) {
                return positionedItems;
            }
            int result$iv = -1;
            int min$iv = Integer.MAX_VALUE;
            int length2 = arrayDequeArr.length;
            for (int i$iv = 0; i$iv < length2; i$iv++) {
                LazyStaggeredGridMeasuredItem firstOrNull = arrayDequeArr[i$iv].firstOrNull();
                int value$iv = firstOrNull != null ? firstOrNull.getIndex() : Integer.MAX_VALUE;
                if (min$iv > value$iv) {
                    min$iv = value$iv;
                    result$iv = i$iv;
                }
            }
            LazyStaggeredGridMeasuredItem item = arrayDequeArr2[result$iv].removeFirst();
            if (item.getLane() == result$iv) {
                long spanRange = SpanRange.m1221constructorimpl(item.getLane(), item.getSpan());
                int mainAxisOffset = m1210maxInRangejy6DScQ(iArr, spanRange);
                int crossAxisOffset = $this$calculateVisibleItems.getResolvedSlots().getPositions()[result$iv];
                int maxEdge = item.getMainAxisSize() + mainAxisOffset;
                if (maxEdge >= minOffset && mainAxisOffset <= maxOffset) {
                    item.position(mainAxisOffset, crossAxisOffset, mainAxisLayoutSize);
                    positionedItems.add(item);
                }
                int i3 = (int) (spanRange & 4294967295L);
                for (int i$iv2 = (int) (spanRange >> 32); i$iv2 < i3; i$iv2++) {
                    int lane = i$iv2;
                    itemScrollOffsets[lane] = mainAxisOffset + item.getMainAxisSizeWithSpacings();
                }
                arrayDequeArr2 = arrayDequeArr;
                iArr = itemScrollOffsets;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0139 A[LOOP:1: B:22:0x007a->B:60:0x0139, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0151 A[EDGE_INSN: B:71:0x0151->B:65:0x0151 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final java.util.List<androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasuredItem> itemsRetainedForLookahead(androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureContext r20, int r21, int r22, boolean r23, kotlin.jvm.functions.Function2<? super androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasuredItem, ? super java.lang.Integer, kotlin.Unit> r24) {
        /*
            Method dump skipped, instructions count: 338
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureKt.itemsRetainedForLookahead(androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridMeasureContext, int, int, boolean, kotlin.jvm.functions.Function2):java.util.List");
    }

    private static final List<LazyStaggeredGridMeasuredItem> calculateExtraItems(LazyStaggeredGridMeasureContext $this$calculateExtraItems, Function1<? super LazyStaggeredGridMeasuredItem, Unit> function1, Function1<? super Integer, Boolean> function12, boolean beforeVisibleBounds) {
        List $this$fastForEach$iv$iv;
        int $i$f$calculateExtraItems;
        Function1<? super Integer, Boolean> function13 = function12;
        int $i$f$calculateExtraItems2 = 0;
        ArrayList arrayList = null;
        List pinnedItems = $this$calculateExtraItems.getPinnedItems();
        int i = 0;
        if (beforeVisibleBounds) {
            int size = pinnedItems.size() - 1;
            if (size >= 0) {
                while (true) {
                    int index$iv$iv = size;
                    size--;
                    Object item$iv$iv = pinnedItems.get(index$iv$iv);
                    int index = ((Number) item$iv$iv).intValue();
                    if (function13.invoke(Integer.valueOf(index)).booleanValue()) {
                        $i$f$calculateExtraItems = $i$f$calculateExtraItems2;
                        ArrayList arrayList2 = arrayList;
                        long spanRange = $this$calculateExtraItems.m1206getSpanRangelOCCd4c($this$calculateExtraItems.getItemProvider(), index, i);
                        ArrayList arrayList3 = arrayList2 == null ? new ArrayList() : arrayList2;
                        LazyStaggeredGridMeasuredItem measuredItem = $this$calculateExtraItems.getMeasuredItemProvider().m1215getAndMeasurejy6DScQ(index, spanRange);
                        function1.invoke(measuredItem);
                        arrayList3.add(measuredItem);
                        arrayList = arrayList3;
                    } else {
                        $i$f$calculateExtraItems = $i$f$calculateExtraItems2;
                    }
                    if (size < 0) {
                        break;
                    }
                    $i$f$calculateExtraItems2 = $i$f$calculateExtraItems;
                    i = 0;
                }
            }
        } else {
            List $this$fastForEach$iv$iv2 = pinnedItems;
            int index$iv$iv2 = 0;
            int size2 = $this$fastForEach$iv$iv2.size();
            while (index$iv$iv2 < size2) {
                Object item$iv$iv2 = $this$fastForEach$iv$iv2.get(index$iv$iv2);
                int index2 = ((Number) item$iv$iv2).intValue();
                if (function13.invoke(Integer.valueOf(index2)).booleanValue()) {
                    $this$fastForEach$iv$iv = $this$fastForEach$iv$iv2;
                    long spanRange2 = $this$calculateExtraItems.m1206getSpanRangelOCCd4c($this$calculateExtraItems.getItemProvider(), index2, 0);
                    if (arrayList == null) {
                        Object result = new ArrayList();
                        arrayList = (List) result;
                    }
                    LazyStaggeredGridMeasuredItem measuredItem2 = $this$calculateExtraItems.getMeasuredItemProvider().m1215getAndMeasurejy6DScQ(index2, spanRange2);
                    function1.invoke(measuredItem2);
                    arrayList.add(measuredItem2);
                } else {
                    $this$fastForEach$iv$iv = $this$fastForEach$iv$iv2;
                }
                index$iv$iv2++;
                function13 = function12;
                $this$fastForEach$iv$iv2 = $this$fastForEach$iv$iv;
            }
        }
        return arrayList == null ? CollectionsKt.emptyList() : arrayList;
    }

    static /* synthetic */ void fastForEach$default(List $this$fastForEach_u24default, boolean reverse, Function1 action, int i, Object obj) {
        if ((i & 1) != 0) {
            reverse = false;
        }
        if (reverse) {
            int size = $this$fastForEach_u24default.size() - 1;
            if (size < 0) {
                return;
            }
            do {
                int index$iv = size;
                size--;
                Object item$iv = $this$fastForEach_u24default.get(index$iv);
                action.invoke(item$iv);
            } while (size >= 0);
            return;
        }
        int size2 = $this$fastForEach_u24default.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach_u24default.get(index$iv2);
            action.invoke(item$iv2);
        }
    }

    private static final <T> void fastForEach(List<? extends T> list, boolean reverse, Function1<? super T, Unit> function1) {
        if (reverse) {
            int size = list.size() - 1;
            if (size < 0) {
                return;
            }
            do {
                int index$iv = size;
                size--;
                Object item$iv = (T) list.get(index$iv);
                function1.invoke(item$iv);
            } while (size >= 0);
            return;
        }
        int size2 = list.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = (T) list.get(index$iv2);
            function1.invoke(item$iv2);
        }
    }

    /* renamed from: forEach-nIS5qE8  reason: not valid java name */
    private static final void m1209forEachnIS5qE8(long $this$forEach_u2dnIS5qE8, Function1<? super Integer, Unit> function1) {
        int i = (int) (4294967295L & $this$forEach_u2dnIS5qE8);
        for (int i2 = (int) ($this$forEach_u2dnIS5qE8 >> 32); i2 < i; i2++) {
            function1.invoke(Integer.valueOf(i2));
        }
    }

    private static final void offsetBy(int[] $this$offsetBy, int delta) {
        int length = $this$offsetBy.length;
        for (int i = 0; i < length; i++) {
            $this$offsetBy[i] = $this$offsetBy[i] + delta;
        }
    }

    /* renamed from: maxInRange-jy6DScQ  reason: not valid java name */
    private static final int m1210maxInRangejy6DScQ(int[] $this$maxInRange_u2djy6DScQ, long indexRange) {
        int max = Integer.MIN_VALUE;
        int i = (int) (4294967295L & indexRange);
        for (int i$iv = (int) (indexRange >> 32); i$iv < i; i$iv++) {
            int it = i$iv;
            max = Math.max(max, $this$maxInRange_u2djy6DScQ[it]);
        }
        return max;
    }

    public static /* synthetic */ int indexOfMinValue$default(int[] iArr, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = Integer.MIN_VALUE;
        }
        return indexOfMinValue(iArr, i);
    }

    public static final int indexOfMinValue(int[] $this$indexOfMinValue, int minBound) {
        int result = -1;
        int min = Integer.MAX_VALUE;
        int length = $this$indexOfMinValue.length;
        for (int i = 0; i < length; i++) {
            int i2 = minBound + 1;
            int i3 = $this$indexOfMinValue[i];
            boolean z = false;
            if (i2 <= i3 && i3 < min) {
                z = true;
            }
            if (z) {
                min = $this$indexOfMinValue[i];
                result = i;
            }
        }
        return result;
    }

    private static final <T> int indexOfMinBy(T[] tArr, Function1<? super T, Integer> function1) {
        int result = -1;
        int min = Integer.MAX_VALUE;
        int length = tArr.length;
        for (int i = 0; i < length; i++) {
            int value = function1.invoke(tArr[i]).intValue();
            if (min > value) {
                min = value;
                result = i;
            }
        }
        return result;
    }

    private static final int indexOfMaxValue(int[] $this$indexOfMaxValue) {
        int result = -1;
        int max = Integer.MIN_VALUE;
        int length = $this$indexOfMaxValue.length;
        for (int i = 0; i < length; i++) {
            if (max < $this$indexOfMaxValue[i]) {
                max = $this$indexOfMaxValue[i];
                result = i;
            }
        }
        return result;
    }

    private static final int[] transform(int[] $this$transform, Function1<? super Integer, Integer> function1) {
        int length = $this$transform.length;
        for (int i = 0; i < length; i++) {
            $this$transform[i] = function1.invoke(Integer.valueOf($this$transform[i])).intValue();
        }
        return $this$transform;
    }

    private static final void ensureIndicesInRange(LazyStaggeredGridMeasureContext $this$ensureIndicesInRange, int[] indices, int itemCount) {
        int length = indices.length - 1;
        if (length >= 0) {
            do {
                int i = length;
                length--;
                while (true) {
                    if (indices[i] < itemCount && $this$ensureIndicesInRange.getLaneInfo().assignedToLane(indices[i], i)) {
                        break;
                    }
                    indices[i] = findPreviousItemIndex($this$ensureIndicesInRange, indices[i], i);
                }
                if (indices[i] >= 0 && !$this$ensureIndicesInRange.isFullSpan($this$ensureIndicesInRange.getItemProvider(), indices[i])) {
                    $this$ensureIndicesInRange.getLaneInfo().setLane(indices[i], i);
                    continue;
                }
            } while (length >= 0);
        }
    }

    private static final int findPreviousItemIndex(LazyStaggeredGridMeasureContext $this$findPreviousItemIndex, int item, int lane) {
        return $this$findPreviousItemIndex.getLaneInfo().findPreviousItemIndex(item, lane);
    }
}
