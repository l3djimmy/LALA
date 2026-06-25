package androidx.compose.foundation.lazy.layout;

import androidx.collection.IntList;
import androidx.compose.ui.unit.IntOffset;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
/* compiled from: LazyLayoutStickyItems.kt */
@Metadata(d1 = {"\u0000D\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\u001a\u0017\u0010\u0007\u001a\u00020\b2\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\nH\u0082\b\u001ah\u0010\f\u001a\b\u0012\u0004\u0012\u0002H\u000e0\r\"\b\b\u0000\u0010\u000e*\u00020\u0004*\u0004\u0018\u00010\u000f2\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u0002H\u000e0\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00032\u0006\u0010\u0015\u001a\u00020\u00032\u0006\u0010\u0016\u001a\u00020\u00032\u0006\u0010\u0017\u001a\u00020\u00032\u0012\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u0002H\u000e0\u0019H\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u0018\u0010\u0002\u001a\u00020\u0003*\u00020\u00048BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u001a"}, d2 = {"Debug", "", "mainAxisOffset", "", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasuredItem;", "getMainAxisOffset", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasuredItem;)I", "debugLog", "", "generateMsg", "Lkotlin/Function0;", "", "applyStickyItems", "", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/foundation/lazy/layout/StickyItemsPlacement;", "positionedItems", "", "stickyItems", "Landroidx/collection/IntList;", "beforeContentPadding", "afterContentPadding", "layoutWidth", "layoutHeight", "getAndMeasure", "Lkotlin/Function1;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyLayoutStickyItemsKt {
    private static final boolean Debug = false;

    public static final /* synthetic */ int access$getMainAxisOffset(LazyLayoutMeasuredItem $receiver) {
        return getMainAxisOffset($receiver);
    }

    private static final void debugLog(Function0<String> function0) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int getMainAxisOffset(LazyLayoutMeasuredItem $this$mainAxisOffset) {
        long it = $this$mainAxisOffset.mo1107getOffsetBjo55l4(0);
        return $this$mainAxisOffset.isVertical() ? IntOffset.m7002getYimpl(it) : IntOffset.m7001getXimpl(it);
    }

    public static final <T extends LazyLayoutMeasuredItem> List<T> applyStickyItems(StickyItemsPlacement $this$applyStickyItems, List<T> list, IntList stickyItems, int beforeContentPadding, int afterContentPadding, int layoutWidth, int layoutHeight, Function1<? super Integer, ? extends T> function1) {
        List<T> list2 = list;
        if ($this$applyStickyItems != null && !list2.isEmpty()) {
            if (stickyItems._size != 0) {
                IntList stickingItems = $this$applyStickyItems.getStickingIndices(((LazyLayoutMeasuredItem) CollectionsKt.first((List<? extends Object>) list2)).getIndex(), ((LazyLayoutMeasuredItem) CollectionsKt.last((List<? extends Object>) list2)).getIndex(), stickyItems);
                List positionedStickingItems = new ArrayList();
                List target$iv = new ArrayList(list.size());
                int size = list.size();
                for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                    T t = list.get(index$iv$iv);
                    T it = t;
                    if (stickyItems.contains(it.getIndex())) {
                        target$iv.add(t);
                    }
                }
                List visibleStickyItems = target$iv;
                int[] content$iv = stickingItems.content;
                int i$iv = 0;
                for (int i = stickingItems._size; i$iv < i; i = i) {
                    int[] content$iv2 = content$iv;
                    int stickingIndex = content$iv2[i$iv];
                    int index$iv = 0;
                    Iterator<T> it2 = list.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            index$iv = -1;
                            break;
                        }
                        LazyLayoutMeasuredItem item$iv = it2.next();
                        LazyLayoutMeasuredItem it3 = item$iv;
                        if (it3.getIndex() == stickingIndex) {
                            break;
                        }
                        index$iv++;
                    }
                    int itemIndex = index$iv;
                    T invoke = itemIndex == -1 ? function1.invoke(Integer.valueOf(stickingIndex)) : list2.remove(itemIndex);
                    int i$iv2 = i$iv;
                    int i$iv3 = invoke.getMainAxisSizeWithSpacings();
                    T t2 = invoke;
                    int offset = $this$applyStickyItems.calculateStickingItemOffset(visibleStickyItems, stickingIndex, i$iv3, itemIndex == -1 ? Integer.MIN_VALUE : getMainAxisOffset(invoke), beforeContentPadding, afterContentPadding, layoutWidth, layoutHeight);
                    t2.setNonScrollableItem(true);
                    t2.position(offset, 0, layoutWidth, layoutHeight);
                    positionedStickingItems.add(t2);
                    i$iv = i$iv2 + 1;
                    list2 = list;
                    content$iv = content$iv2;
                }
                return positionedStickingItems;
            }
        }
        return CollectionsKt.emptyList();
    }
}
