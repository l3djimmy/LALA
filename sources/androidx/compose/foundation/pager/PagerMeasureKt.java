package androidx.compose.foundation.pager;

import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.snapping.SnapPosition;
import androidx.compose.foundation.gestures.snapping.SnapPositionKt;
import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.lazy.layout.LazyLayoutMeasureScope;
import androidx.compose.foundation.lazy.layout.ObservableScopeInvalidator;
import androidx.compose.runtime.MutableState;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.ConstraintsKt;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: PagerMeasure.kt */
@Metadata(d1 = {"\u0000¬\u0001\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001aH\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\b2\u0006\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0006H\u0002\u001aH\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00040\b2\u0006\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00062\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00060\b2\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00040\u0015H\u0002\u001a@\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00040\b2\u0006\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00062\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00060\b2\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00040\u0015H\u0002\u001a\u0017\u0010\u0018\u001a\u00020\u00192\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u001c0\u001bH\u0082\b\u001a\u008c\u0001\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00040\u001e*\u00020\u001f2\f\u0010 \u001a\b\u0012\u0004\u0012\u00020\u00040\b2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020\u00040\b2\f\u0010\"\u001a\b\u0012\u0004\u0012\u00020\u00040\b2\u0006\u0010#\u001a\u00020\u00062\u0006\u0010$\u001a\u00020\u00062\u0006\u0010%\u001a\u00020\u00062\u0006\u0010&\u001a\u00020\u00062\u0006\u0010'\u001a\u00020\u00062\u0006\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+2\u0006\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020\u00062\u0006\u0010/\u001a\u00020\u0006H\u0002\u001aj\u0010\u0014\u001a\u00020\u0004*\u00020\u001f2\u0006\u00100\u001a\u00020\u00062\u0006\u00101\u001a\u0002022\u0006\u00103\u001a\u0002042\u0006\u00105\u001a\u0002062\u0006\u0010(\u001a\u00020)2\b\u00107\u001a\u0004\u0018\u0001082\b\u00109\u001a\u0004\u0018\u00010:2\u0006\u0010;\u001a\u00020<2\u0006\u0010*\u001a\u00020+2\u0006\u0010/\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b=\u0010>\u001añ\u0001\u0010?\u001a\u00020@*\u00020\u001f2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u00103\u001a\u0002042\u0006\u0010A\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u00062\u0006\u0010.\u001a\u00020\u00062\u0006\u0010B\u001a\u00020\u00062\u0006\u0010C\u001a\u00020\u00062\u0006\u0010D\u001a\u0002022\u0006\u0010(\u001a\u00020)2\b\u00109\u001a\u0004\u0018\u00010:2\b\u00107\u001a\u0004\u0018\u0001082\u0006\u0010*\u001a\u00020+2\u0006\u00105\u001a\u0002062\u0006\u0010/\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u00062\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00060\b2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010E\u001a\u00020F2\u0006\u0010G\u001a\u00020H2/\u0010I\u001a+\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0006\u0012\u0015\u0012\u0013\u0012\u0004\u0012\u00020K\u0012\u0004\u0012\u00020\u00190\u0015¢\u0006\u0002\bL\u0012\u0004\u0012\u00020M0JH\u0000ø\u0001\u0000¢\u0006\u0004\bN\u0010O\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006P"}, d2 = {"MaxPageOffset", "", "MinPageOffset", "calculateNewCurrentPage", "Landroidx/compose/foundation/pager/MeasuredPage;", "viewportSize", "", "visiblePagesInfo", "", "beforeContentPadding", "afterContentPadding", "itemSize", "snapPosition", "Landroidx/compose/foundation/gestures/snapping/SnapPosition;", "pageCount", "createPagesAfterList", "currentLastPage", "pagesCount", "beyondViewportPageCount", "pinnedPages", "getAndMeasure", "Lkotlin/Function1;", "createPagesBeforeList", "currentFirstPage", "debugLog", "", "generateMsg", "Lkotlin/Function0;", "", "calculatePagesOffsets", "", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;", "pages", "extraPagesBefore", "extraPagesAfter", "layoutWidth", "layoutHeight", "finalMainAxisOffset", "maxOffset", "pagesScrollOffset", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "reverseLayout", "", "density", "Landroidx/compose/ui/unit/Density;", "spaceBetweenPages", "pageAvailableSize", "index", "childConstraints", "Landroidx/compose/ui/unit/Constraints;", "pagerItemProvider", "Landroidx/compose/foundation/pager/PagerLazyLayoutItemProvider;", "visualPageOffset", "Landroidx/compose/ui/unit/IntOffset;", "horizontalAlignment", "Landroidx/compose/ui/Alignment$Horizontal;", "verticalAlignment", "Landroidx/compose/ui/Alignment$Vertical;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "getAndMeasure-SGf7dI0", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;IJLandroidx/compose/foundation/pager/PagerLazyLayoutItemProvider;JLandroidx/compose/foundation/gestures/Orientation;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/ui/unit/LayoutDirection;ZI)Landroidx/compose/foundation/pager/MeasuredPage;", "measurePager", "Landroidx/compose/foundation/pager/PagerMeasureResult;", "mainAxisAvailableSize", "currentPage", "currentPageOffset", "constraints", "placementScopeInvalidator", "Landroidx/compose/foundation/lazy/layout/ObservableScopeInvalidator;", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "layout", "Lkotlin/Function3;", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "Lkotlin/ExtensionFunctionType;", "Landroidx/compose/ui/layout/MeasureResult;", "measurePager-bmk8ZPk", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;ILandroidx/compose/foundation/pager/PagerLazyLayoutItemProvider;IIIIIIJLandroidx/compose/foundation/gestures/Orientation;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/ui/Alignment$Horizontal;ZJIILjava/util/List;Landroidx/compose/foundation/gestures/snapping/SnapPosition;Landroidx/compose/runtime/MutableState;Lkotlinx/coroutines/CoroutineScope;Lkotlin/jvm/functions/Function3;)Landroidx/compose/foundation/pager/PagerMeasureResult;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class PagerMeasureKt {
    public static final float MaxPageOffset = 0.5f;
    public static final float MinPageOffset = -0.5f;

    /* renamed from: measurePager-bmk8ZPk  reason: not valid java name */
    public static final PagerMeasureResult m1244measurePagerbmk8ZPk(final LazyLayoutMeasureScope $this$measurePager_u2dbmk8ZPk, int pageCount, final PagerLazyLayoutItemProvider pagerItemProvider, int mainAxisAvailableSize, int beforeContentPadding, int afterContentPadding, int spaceBetweenPages, int currentPage, int currentPageOffset, long constraints, final Orientation orientation, final Alignment.Vertical verticalAlignment, final Alignment.Horizontal horizontalAlignment, final boolean reverseLayout, final long visualPageOffset, final int pageAvailableSize, int beyondViewportPageCount, List<Integer> list, SnapPosition snapPosition, final MutableState<Unit> mutableState, CoroutineScope coroutineScope, Function3<? super Integer, ? super Integer, ? super Function1<? super Placeable.PlacementScope, Unit>, ? extends MeasureResult> function3) {
        int i;
        int i2;
        int currentFirstPageScrollOffset;
        int minOffset;
        int pageSizeWithSpacing;
        int index;
        int maxMainAxis;
        int pageSizeWithSpacing2;
        int minOffset2;
        int minOffset3;
        int maxOffset;
        int currentFirstPageScrollOffset2;
        int currentFirstPageScrollOffset3;
        int currentFirstPageScrollOffset4;
        MeasuredPage firstPage;
        List visiblePagesInfo;
        List visiblePagesInfo2;
        ArrayList arrayList;
        ArrayList arrayList2;
        float currentPageOffsetFraction;
        int i3;
        boolean z = true;
        boolean value$iv = beforeContentPadding >= 0;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("negative beforeContentPadding");
        }
        boolean value$iv2 = afterContentPadding >= 0;
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalArgumentException("negative afterContentPadding");
        }
        int pageSizeWithSpacing3 = RangesKt.coerceAtLeast(pageAvailableSize + spaceBetweenPages, 0);
        if (pageCount <= 0) {
            return new PagerMeasureResult(CollectionsKt.emptyList(), pageAvailableSize, spaceBetweenPages, afterContentPadding, orientation, -beforeContentPadding, mainAxisAvailableSize + afterContentPadding, false, beyondViewportPageCount, null, null, 0.0f, 0, false, snapPosition, function3.invoke(Integer.valueOf(Constraints.m6828getMinWidthimpl(constraints)), Integer.valueOf(Constraints.m6827getMinHeightimpl(constraints)), new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.pager.PagerMeasureKt$measurePager$4
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                    invoke2(placementScope);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable.PlacementScope $this$invoke) {
                }
            }), false, null, null, coroutineScope, 393216, null);
        }
        Orientation orientation2 = orientation;
        if (orientation2 == Orientation.Vertical) {
            i = Constraints.m6826getMaxWidthimpl(constraints);
        } else {
            i = pageAvailableSize;
        }
        if (orientation2 != Orientation.Vertical) {
            i2 = Constraints.m6825getMaxHeightimpl(constraints);
        } else {
            i2 = pageAvailableSize;
        }
        final long childConstraints = ConstraintsKt.Constraints$default(0, i, 0, i2, 5, null);
        int firstVisiblePage = currentPage;
        int firstVisiblePageOffset = currentPageOffset;
        while (firstVisiblePage > 0 && firstVisiblePageOffset > 0) {
            firstVisiblePage--;
            firstVisiblePageOffset -= pageSizeWithSpacing3;
        }
        int firstVisiblePageScrollOffset = firstVisiblePageOffset * (-1);
        int currentFirstPage = firstVisiblePage;
        int currentFirstPageScrollOffset5 = firstVisiblePageScrollOffset;
        if (currentFirstPage >= pageCount) {
            currentFirstPage = pageCount - 1;
            currentFirstPageScrollOffset5 = 0;
        }
        ArrayDeque visiblePages = new ArrayDeque();
        int minOffset4 = (-beforeContentPadding) + (spaceBetweenPages < 0 ? spaceBetweenPages : 0);
        int previous = currentFirstPageScrollOffset5 + minOffset4;
        int maxCrossAxis = 0;
        int currentFirstPage2 = currentFirstPage;
        while (previous < 0 && currentFirstPage2 > 0) {
            int currentFirstPageScrollOffset6 = previous;
            int currentFirstPageScrollOffset7 = currentFirstPage2 - 1;
            ArrayDeque visiblePages2 = visiblePages;
            MeasuredPage measuredPage = m1243getAndMeasureSGf7dI0($this$measurePager_u2dbmk8ZPk, currentFirstPageScrollOffset7, childConstraints, pagerItemProvider, visualPageOffset, orientation2, horizontalAlignment, verticalAlignment, $this$measurePager_u2dbmk8ZPk.getLayoutDirection(), reverseLayout, pageAvailableSize);
            visiblePages2.add(0, measuredPage);
            maxCrossAxis = Math.max(maxCrossAxis, measuredPage.getCrossAxisSize());
            currentFirstPage2 = currentFirstPageScrollOffset7;
            orientation2 = orientation;
            previous = currentFirstPageScrollOffset6 + pageSizeWithSpacing3;
            minOffset4 = minOffset4;
            visiblePages = visiblePages2;
        }
        ArrayDeque visiblePages3 = visiblePages;
        int maxCrossAxis2 = maxCrossAxis;
        int currentFirstPageScrollOffset8 = previous;
        int minOffset5 = minOffset4;
        if (currentFirstPageScrollOffset8 >= minOffset5) {
            currentFirstPageScrollOffset = currentFirstPageScrollOffset8;
        } else {
            currentFirstPageScrollOffset = minOffset5;
        }
        int currentFirstPageScrollOffset9 = currentFirstPageScrollOffset - minOffset5;
        int index2 = currentFirstPage2;
        int maxMainAxis2 = RangesKt.coerceAtLeast(mainAxisAvailableSize + afterContentPadding, 0);
        int currentMainAxisOffset = -currentFirstPageScrollOffset9;
        boolean remeasureNeeded = false;
        int pageSizeWithSpacing4 = 0;
        while (true) {
            minOffset = minOffset5;
            if (pageSizeWithSpacing4 >= visiblePages3.size()) {
                break;
            } else if (currentMainAxisOffset >= maxMainAxis2) {
                visiblePages3.remove(pageSizeWithSpacing4);
                remeasureNeeded = true;
                minOffset5 = minOffset;
            } else {
                index2++;
                currentMainAxisOffset += pageSizeWithSpacing3;
                pageSizeWithSpacing4++;
                minOffset5 = minOffset;
            }
        }
        int currentFirstPage3 = currentFirstPage2;
        int indexInVisibleItems = pageSizeWithSpacing3;
        int currentFirstPageScrollOffset10 = currentFirstPageScrollOffset9;
        int currentFirstPageScrollOffset11 = index2;
        boolean remeasureNeeded2 = remeasureNeeded;
        int maxCrossAxis3 = maxCrossAxis2;
        while (true) {
            if (currentFirstPageScrollOffset11 >= pageCount) {
                pageSizeWithSpacing = indexInVisibleItems;
                index = currentFirstPageScrollOffset11;
                maxMainAxis = maxMainAxis2;
                pageSizeWithSpacing2 = maxCrossAxis3;
                minOffset2 = minOffset;
                break;
            } else if (currentMainAxisOffset >= maxMainAxis2 && currentMainAxisOffset > 0 && !visiblePages3.isEmpty()) {
                pageSizeWithSpacing = indexInVisibleItems;
                index = currentFirstPageScrollOffset11;
                maxMainAxis = maxMainAxis2;
                pageSizeWithSpacing2 = maxCrossAxis3;
                minOffset2 = minOffset;
                break;
            } else {
                int pageSizeWithSpacing5 = indexInVisibleItems;
                int maxMainAxis3 = maxMainAxis2;
                int maxCrossAxis4 = maxCrossAxis3;
                int minOffset6 = minOffset;
                MeasuredPage measuredPage2 = m1243getAndMeasureSGf7dI0($this$measurePager_u2dbmk8ZPk, currentFirstPageScrollOffset11, childConstraints, pagerItemProvider, visualPageOffset, orientation, horizontalAlignment, verticalAlignment, $this$measurePager_u2dbmk8ZPk.getLayoutDirection(), reverseLayout, pageAvailableSize);
                int index3 = currentFirstPageScrollOffset11;
                if (index3 == pageCount - 1) {
                    i3 = pageAvailableSize;
                } else {
                    i3 = pageSizeWithSpacing5;
                }
                currentMainAxisOffset += i3;
                if (currentMainAxisOffset <= minOffset6 && index3 != pageCount - 1) {
                    currentFirstPageScrollOffset10 -= pageSizeWithSpacing5;
                    currentFirstPage3 = index3 + 1;
                    remeasureNeeded2 = true;
                } else {
                    maxCrossAxis4 = Math.max(maxCrossAxis4, measuredPage2.getCrossAxisSize());
                    visiblePages3.add(measuredPage2);
                }
                maxCrossAxis3 = maxCrossAxis4;
                currentFirstPageScrollOffset11 = index3 + 1;
                minOffset = minOffset6;
                maxMainAxis2 = maxMainAxis3;
                indexInVisibleItems = pageSizeWithSpacing5;
            }
        }
        int previousIndex = mainAxisAvailableSize;
        if (currentMainAxisOffset < previousIndex) {
            int toScrollBack = previousIndex - currentMainAxisOffset;
            currentMainAxisOffset += toScrollBack;
            int currentFirstPageScrollOffset12 = currentFirstPageScrollOffset10 - toScrollBack;
            while (currentFirstPageScrollOffset12 < beforeContentPadding && currentFirstPage3 > 0) {
                int maxOffset2 = previousIndex;
                int maxOffset3 = currentFirstPage3 - 1;
                MeasuredPage measuredPage3 = m1243getAndMeasureSGf7dI0($this$measurePager_u2dbmk8ZPk, maxOffset3, childConstraints, pagerItemProvider, visualPageOffset, orientation, horizontalAlignment, verticalAlignment, $this$measurePager_u2dbmk8ZPk.getLayoutDirection(), reverseLayout, pageAvailableSize);
                visiblePages3.add(0, measuredPage3);
                pageSizeWithSpacing2 = Math.max(pageSizeWithSpacing2, measuredPage3.getCrossAxisSize());
                currentFirstPage3 = maxOffset3;
                index = index;
                currentFirstPageScrollOffset12 += pageSizeWithSpacing;
                previousIndex = maxOffset2;
                minOffset2 = minOffset2;
            }
            minOffset3 = index;
            maxOffset = previousIndex;
            int currentFirstPageScrollOffset13 = currentFirstPageScrollOffset12;
            currentFirstPageScrollOffset2 = 0;
            if (currentFirstPageScrollOffset13 >= 0) {
                currentFirstPageScrollOffset3 = currentFirstPageScrollOffset13;
            } else {
                currentMainAxisOffset += currentFirstPageScrollOffset13;
                currentFirstPageScrollOffset3 = 0;
            }
        } else {
            minOffset3 = index;
            maxOffset = previousIndex;
            currentFirstPageScrollOffset2 = 0;
            currentFirstPageScrollOffset3 = currentFirstPageScrollOffset10;
        }
        int value$iv3 = currentFirstPageScrollOffset3 >= 0 ? 1 : currentFirstPageScrollOffset2;
        if (value$iv3 == 0) {
            InlineClassHelperKt.throwIllegalArgumentException("invalid currentFirstPageScrollOffset");
        }
        int visiblePagesScrollOffset = -currentFirstPageScrollOffset3;
        MeasuredPage firstPage2 = (MeasuredPage) visiblePages3.first();
        if (beforeContentPadding > 0 || spaceBetweenPages < 0) {
            int size = visiblePages3.size();
            for (int i4 = 0; i4 < size; i4++) {
                int size2 = pageSizeWithSpacing;
                if (currentFirstPageScrollOffset3 == 0 || size2 > currentFirstPageScrollOffset3 || i4 == CollectionsKt.getLastIndex(visiblePages3)) {
                    break;
                }
                currentFirstPageScrollOffset3 -= size2;
                firstPage2 = (MeasuredPage) visiblePages3.get(i4 + 1);
            }
            currentFirstPageScrollOffset4 = currentFirstPageScrollOffset3;
            firstPage = firstPage2;
        } else {
            currentFirstPageScrollOffset4 = currentFirstPageScrollOffset3;
            firstPage = firstPage2;
        }
        List $this$fastForEach$iv = createPagesBeforeList(currentFirstPage3, beyondViewportPageCount, list, new Function1<Integer, MeasuredPage>() { // from class: androidx.compose.foundation.pager.PagerMeasureKt$measurePager$extraPagesBefore$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ MeasuredPage invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final MeasuredPage invoke(int it) {
                MeasuredPage m1243getAndMeasureSGf7dI0;
                m1243getAndMeasureSGf7dI0 = PagerMeasureKt.m1243getAndMeasureSGf7dI0(LazyLayoutMeasureScope.this, it, childConstraints, pagerItemProvider, visualPageOffset, orientation, horizontalAlignment, verticalAlignment, LazyLayoutMeasureScope.this.getLayoutDirection(), reverseLayout, pageAvailableSize);
                return m1243getAndMeasureSGf7dI0;
            }
        });
        int index$iv = 0;
        int size3 = $this$fastForEach$iv.size();
        while (index$iv < size3) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            pageSizeWithSpacing2 = Math.max(pageSizeWithSpacing2, ((MeasuredPage) item$iv).getCrossAxisSize());
            index$iv++;
            visiblePages3 = visiblePages3;
        }
        ArrayDeque visiblePages4 = visiblePages3;
        List extraPagesAfter = createPagesAfterList(((MeasuredPage) visiblePages4.last()).getIndex(), pageCount, beyondViewportPageCount, list, new Function1<Integer, MeasuredPage>() { // from class: androidx.compose.foundation.pager.PagerMeasureKt$measurePager$extraPagesAfter$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ MeasuredPage invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final MeasuredPage invoke(int it) {
                MeasuredPage m1243getAndMeasureSGf7dI0;
                m1243getAndMeasureSGf7dI0 = PagerMeasureKt.m1243getAndMeasureSGf7dI0(LazyLayoutMeasureScope.this, it, childConstraints, pagerItemProvider, visualPageOffset, orientation, horizontalAlignment, verticalAlignment, LazyLayoutMeasureScope.this.getLayoutDirection(), reverseLayout, pageAvailableSize);
                return m1243getAndMeasureSGf7dI0;
            }
        });
        int size4 = extraPagesAfter.size();
        for (int index$iv2 = 0; index$iv2 < size4; index$iv2++) {
            Object item$iv2 = extraPagesAfter.get(index$iv2);
            pageSizeWithSpacing2 = Math.max(pageSizeWithSpacing2, ((MeasuredPage) item$iv2).getCrossAxisSize());
        }
        boolean noExtraPages = Intrinsics.areEqual(firstPage, visiblePages4.first()) && $this$fastForEach$iv.isEmpty() && extraPagesAfter.isEmpty();
        int layoutWidth = ConstraintsKt.m6843constrainWidthK40F9xA(constraints, orientation == Orientation.Vertical ? pageSizeWithSpacing2 : currentMainAxisOffset);
        int layoutHeight = ConstraintsKt.m6842constrainHeightK40F9xA(constraints, orientation == Orientation.Vertical ? currentMainAxisOffset : pageSizeWithSpacing2);
        int currentMainAxisOffset2 = currentMainAxisOffset;
        int maxOffset4 = maxOffset;
        final List calculatePagesOffsets = calculatePagesOffsets($this$measurePager_u2dbmk8ZPk, visiblePages4, $this$fastForEach$iv, extraPagesAfter, layoutWidth, layoutHeight, currentMainAxisOffset2, maxOffset4, visiblePagesScrollOffset, orientation, reverseLayout, $this$measurePager_u2dbmk8ZPk, spaceBetweenPages, pageAvailableSize);
        if (noExtraPages) {
            visiblePagesInfo = calculatePagesOffsets;
        } else {
            List $this$fastFilter$iv = calculatePagesOffsets;
            boolean z2 = false;
            List target$iv = new ArrayList($this$fastFilter$iv.size());
            int index$iv$iv = 0;
            int size5 = $this$fastFilter$iv.size();
            while (index$iv$iv < size5) {
                MeasuredPage measuredPage4 = $this$fastFilter$iv.get(index$iv$iv);
                MeasuredPage it = measuredPage4;
                List $this$fastFilter$iv2 = $this$fastFilter$iv;
                int index4 = it.getIndex();
                boolean z3 = z2;
                int $i$f$fastFilter = ((MeasuredPage) visiblePages4.first()).getIndex();
                if (index4 >= $i$f$fastFilter && it.getIndex() <= ((MeasuredPage) visiblePages4.last()).getIndex()) {
                    target$iv.add(measuredPage4);
                }
                index$iv$iv++;
                $this$fastFilter$iv = $this$fastFilter$iv2;
                z2 = z3;
            }
            visiblePagesInfo = target$iv;
        }
        if ($this$fastForEach$iv.isEmpty()) {
            arrayList = CollectionsKt.emptyList();
            visiblePagesInfo2 = visiblePagesInfo;
        } else {
            ArrayList target$iv2 = new ArrayList(calculatePagesOffsets.size());
            int index$iv$iv2 = 0;
            int size6 = calculatePagesOffsets.size();
            while (index$iv$iv2 < size6) {
                MeasuredPage it2 = calculatePagesOffsets.get(index$iv$iv2);
                int i5 = size6;
                List visiblePagesInfo3 = visiblePagesInfo;
                if (it2.getIndex() < ((MeasuredPage) visiblePages4.first()).getIndex()) {
                    target$iv2.add(it2);
                }
                index$iv$iv2++;
                size6 = i5;
                visiblePagesInfo = visiblePagesInfo3;
            }
            visiblePagesInfo2 = visiblePagesInfo;
            arrayList = target$iv2;
        }
        List positionedPagesBefore = arrayList;
        if (extraPagesAfter.isEmpty()) {
            arrayList2 = CollectionsKt.emptyList();
        } else {
            boolean z4 = false;
            ArrayList target$iv3 = new ArrayList(calculatePagesOffsets.size());
            int index$iv$iv3 = 0;
            int size7 = calculatePagesOffsets.size();
            while (index$iv$iv3 < size7) {
                MeasuredPage it3 = calculatePagesOffsets.get(index$iv$iv3);
                int i6 = size7;
                int index5 = it3.getIndex();
                boolean z5 = z4;
                int $i$f$fastFilter2 = ((MeasuredPage) visiblePages4.last()).getIndex();
                if (index5 > $i$f$fastFilter2) {
                    target$iv3.add(it3);
                }
                index$iv$iv3++;
                size7 = i6;
                z4 = z5;
            }
            arrayList2 = target$iv3;
        }
        List positionedPagesAfter = arrayList2;
        int layoutSize = mainAxisAvailableSize + beforeContentPadding + afterContentPadding;
        MeasuredPage firstPage3 = firstPage;
        int maxCrossAxis5 = pageSizeWithSpacing;
        List visiblePagesInfo4 = visiblePagesInfo2;
        MeasuredPage newCurrentPage = calculateNewCurrentPage(layoutSize, visiblePagesInfo4, beforeContentPadding, afterContentPadding, maxCrossAxis5, snapPosition, pageCount);
        int snapOffset = snapPosition.position(layoutSize, pageAvailableSize, beforeContentPadding, afterContentPadding, newCurrentPage != null ? newCurrentPage.getIndex() : 0, pageCount);
        int currentPagePositionOffset = newCurrentPage != null ? newCurrentPage.getOffset() : 0;
        if (maxCrossAxis5 == 0) {
            currentPageOffsetFraction = 0.0f;
        } else {
            currentPageOffsetFraction = RangesKt.coerceIn((snapOffset - currentPagePositionOffset) / maxCrossAxis5, -0.5f, 0.5f);
        }
        MeasureResult invoke = function3.invoke(Integer.valueOf(layoutWidth), Integer.valueOf(layoutHeight), new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.pager.PagerMeasureKt$measurePager$14
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
            public final void invoke2(Placeable.PlacementScope $this$invoke) {
                final List<MeasuredPage> list2 = calculatePagesOffsets;
                $this$invoke.withMotionFrameOfReferencePlacement(new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.pager.PagerMeasureKt$measurePager$14.1
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
                    public final void invoke2(Placeable.PlacementScope $this$withMotionFrameOfReferencePlacement) {
                        List $this$fastForEach$iv2 = list2;
                        int size8 = $this$fastForEach$iv2.size();
                        for (int index$iv3 = 0; index$iv3 < size8; index$iv3++) {
                            Object item$iv3 = $this$fastForEach$iv2.get(index$iv3);
                            MeasuredPage it4 = (MeasuredPage) item$iv3;
                            it4.place($this$withMotionFrameOfReferencePlacement);
                        }
                    }
                });
                ObservableScopeInvalidator.m1172attachToScopeimpl(mutableState);
            }
        });
        int pageSizeWithSpacing6 = -beforeContentPadding;
        int currentFirstPageScrollOffset14 = maxOffset4 + afterContentPadding;
        if (minOffset3 >= pageCount && currentMainAxisOffset2 <= maxOffset4) {
            z = false;
        }
        return new PagerMeasureResult(visiblePagesInfo4, pageAvailableSize, spaceBetweenPages, afterContentPadding, orientation, pageSizeWithSpacing6, currentFirstPageScrollOffset14, reverseLayout, beyondViewportPageCount, firstPage3, newCurrentPage, currentPageOffsetFraction, currentFirstPageScrollOffset4, z, snapPosition, invoke, remeasureNeeded2, positionedPagesBefore, positionedPagesAfter, coroutineScope);
    }

    private static final List<MeasuredPage> createPagesAfterList(int currentLastPage, int pagesCount, int beyondViewportPageCount, List<Integer> list, Function1<? super Integer, MeasuredPage> function1) {
        ArrayList arrayList = null;
        int end = Math.min(currentLastPage + beyondViewportPageCount, pagesCount - 1);
        int i = currentLastPage + 1;
        if (i <= end) {
            while (true) {
                if (arrayList == null) {
                    Object list2 = new ArrayList();
                    arrayList = (List) list2;
                }
                arrayList.add(function1.invoke(Integer.valueOf(i)));
                if (i == end) {
                    break;
                }
                i++;
            }
        }
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = list.get(index$iv);
            int pageIndex = ((Number) item$iv).intValue();
            boolean z = false;
            if (end + 1 <= pageIndex && pageIndex < pagesCount) {
                z = true;
            }
            if (z) {
                if (arrayList == null) {
                    Object list3 = new ArrayList();
                    arrayList = (List) list3;
                }
                arrayList.add(function1.invoke(Integer.valueOf(pageIndex)));
            }
        }
        return arrayList == null ? CollectionsKt.emptyList() : arrayList;
    }

    private static final List<MeasuredPage> createPagesBeforeList(int currentFirstPage, int beyondViewportPageCount, List<Integer> list, Function1<? super Integer, MeasuredPage> function1) {
        ArrayList arrayList = null;
        int start = Math.max(0, currentFirstPage - beyondViewportPageCount);
        int i = currentFirstPage - 1;
        if (start <= i) {
            while (true) {
                if (arrayList == null) {
                    Object list2 = new ArrayList();
                    arrayList = (List) list2;
                }
                arrayList.add(function1.invoke(Integer.valueOf(i)));
                if (i == start) {
                    break;
                }
                i--;
            }
        }
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = list.get(index$iv);
            int pageIndex = ((Number) item$iv).intValue();
            if (pageIndex < start) {
                if (arrayList == null) {
                    Object list3 = new ArrayList();
                    arrayList = (List) list3;
                }
                arrayList.add(function1.invoke(Integer.valueOf(pageIndex)));
            }
        }
        return arrayList == null ? CollectionsKt.emptyList() : arrayList;
    }

    private static final MeasuredPage calculateNewCurrentPage(int viewportSize, List<MeasuredPage> list, int beforeContentPadding, int afterContentPadding, int itemSize, SnapPosition snapPosition, int pageCount) {
        Object maxElem$iv;
        if (list.isEmpty()) {
            maxElem$iv = null;
        } else {
            maxElem$iv = list.get(0);
            MeasuredPage it = (MeasuredPage) maxElem$iv;
            float maxValue$iv = -Math.abs(SnapPositionKt.calculateDistanceToDesiredSnapPosition(viewportSize, beforeContentPadding, afterContentPadding, itemSize, it.getOffset(), it.getIndex(), snapPosition, pageCount));
            int i$iv = 1;
            int lastIndex = CollectionsKt.getLastIndex(list);
            if (1 <= lastIndex) {
                while (true) {
                    Object e$iv = list.get(i$iv);
                    MeasuredPage it2 = (MeasuredPage) e$iv;
                    float v$iv = -Math.abs(SnapPositionKt.calculateDistanceToDesiredSnapPosition(viewportSize, beforeContentPadding, afterContentPadding, itemSize, it2.getOffset(), it2.getIndex(), snapPosition, pageCount));
                    if (Float.compare(maxValue$iv, v$iv) < 0) {
                        maxElem$iv = e$iv;
                        maxValue$iv = v$iv;
                    }
                    if (i$iv == lastIndex) {
                        break;
                    }
                    i$iv++;
                }
            }
        }
        return (MeasuredPage) maxElem$iv;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: getAndMeasure-SGf7dI0  reason: not valid java name */
    public static final MeasuredPage m1243getAndMeasureSGf7dI0(LazyLayoutMeasureScope $this$getAndMeasure_u2dSGf7dI0, int index, long childConstraints, PagerLazyLayoutItemProvider pagerItemProvider, long visualPageOffset, Orientation orientation, Alignment.Horizontal horizontalAlignment, Alignment.Vertical verticalAlignment, LayoutDirection layoutDirection, boolean reverseLayout, int pageAvailableSize) {
        Object key = pagerItemProvider.getKey(index);
        List placeable = $this$getAndMeasure_u2dSGf7dI0.mo1167measure0kLqBqw(index, childConstraints);
        return new MeasuredPage(index, pageAvailableSize, placeable, visualPageOffset, key, orientation, horizontalAlignment, verticalAlignment, layoutDirection, reverseLayout, null);
    }

    private static final List<MeasuredPage> calculatePagesOffsets(LazyLayoutMeasureScope $this$calculatePagesOffsets, List<MeasuredPage> list, List<MeasuredPage> list2, List<MeasuredPage> list3, int layoutWidth, int layoutHeight, int finalMainAxisOffset, int maxOffset, int pagesScrollOffset, Orientation orientation, boolean reverseLayout, Density density, int spaceBetweenPages, int pageAvailableSize) {
        ArrayList positionedPages;
        int pagesCount;
        int i;
        int pageSizeWithSpacing = pageAvailableSize + spaceBetweenPages;
        int mainAxisLayoutSize = orientation == Orientation.Vertical ? layoutHeight : layoutWidth;
        boolean hasSpareSpace = finalMainAxisOffset < Math.min(mainAxisLayoutSize, maxOffset);
        if (hasSpareSpace) {
            boolean value$iv = pagesScrollOffset == 0;
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException("non-zero pagesScrollOffset=" + pagesScrollOffset);
            }
        }
        ArrayList positionedPages2 = new ArrayList(list.size() + list2.size() + list3.size());
        if (hasSpareSpace) {
            boolean value$iv2 = list2.isEmpty() && list3.isEmpty();
            if (!value$iv2) {
                InlineClassHelperKt.throwIllegalArgumentException("No extra pages");
            }
            int pagesCount2 = list.size();
            int[] sizes = new int[pagesCount2];
            for (int i2 = 0; i2 < pagesCount2; i2++) {
                sizes[i2] = pageAvailableSize;
            }
            int[] offsets = new int[pagesCount2];
            Arrangement.HorizontalOrVertical arrangement = Arrangement.Absolute.INSTANCE.m877spacedBy0680j_4($this$calculatePagesOffsets.mo641toDpu2uoSUM(spaceBetweenPages));
            if (orientation == Orientation.Vertical) {
                arrangement.arrange(density, mainAxisLayoutSize, sizes, offsets);
                positionedPages = positionedPages2;
                pagesCount = pagesCount2;
            } else {
                pagesCount = pagesCount2;
                positionedPages = positionedPages2;
                arrangement.arrange(density, mainAxisLayoutSize, sizes, LayoutDirection.Ltr, offsets);
            }
            IntRange reverseAwareOffsetIndices = ArraysKt.getIndices(offsets);
            if (reverseLayout) {
                reverseAwareOffsetIndices = RangesKt.reversed(reverseAwareOffsetIndices);
            }
            int index = reverseAwareOffsetIndices.getFirst();
            int last = reverseAwareOffsetIndices.getLast();
            int step = reverseAwareOffsetIndices.getStep();
            if ((step > 0 && index <= last) || (step < 0 && last <= index)) {
                while (true) {
                    int absoluteOffset = offsets[index];
                    int pagesCount3 = pagesCount;
                    MeasuredPage page = list.get(calculatePagesOffsets$reverseAware(index, reverseLayout, pagesCount));
                    if (reverseLayout) {
                        i = (mainAxisLayoutSize - absoluteOffset) - page.getSize();
                    } else {
                        i = absoluteOffset;
                    }
                    int relativeOffset = i;
                    page.position(relativeOffset, layoutWidth, layoutHeight);
                    positionedPages.add(page);
                    if (index == last) {
                        break;
                    }
                    index += step;
                    pagesCount = pagesCount3;
                }
            }
        } else {
            positionedPages = positionedPages2;
            int currentMainAxis = pagesScrollOffset;
            int size = list2.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = list2.get(index$iv);
                MeasuredPage it = (MeasuredPage) item$iv;
                currentMainAxis -= pageSizeWithSpacing;
                it.position(currentMainAxis, layoutWidth, layoutHeight);
                positionedPages.add(it);
            }
            int currentMainAxis2 = pagesScrollOffset;
            int size2 = list.size();
            for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
                Object item$iv2 = list.get(index$iv2);
                MeasuredPage it2 = (MeasuredPage) item$iv2;
                it2.position(currentMainAxis2, layoutWidth, layoutHeight);
                positionedPages.add(it2);
                currentMainAxis2 += pageSizeWithSpacing;
            }
            int size3 = list3.size();
            for (int index$iv3 = 0; index$iv3 < size3; index$iv3++) {
                Object item$iv3 = list3.get(index$iv3);
                MeasuredPage it3 = (MeasuredPage) item$iv3;
                it3.position(currentMainAxis2, layoutWidth, layoutHeight);
                positionedPages.add(it3);
                currentMainAxis2 += pageSizeWithSpacing;
            }
        }
        return positionedPages;
    }

    private static final int calculatePagesOffsets$reverseAware(int $this$calculatePagesOffsets_u24reverseAware, boolean $reverseLayout, int pagesCount) {
        return !$reverseLayout ? $this$calculatePagesOffsets_u24reverseAware : (pagesCount - $this$calculatePagesOffsets_u24reverseAware) - 1;
    }

    private static final void debugLog(Function0<String> function0) {
    }
}
