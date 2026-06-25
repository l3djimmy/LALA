package androidx.compose.foundation.lazy;

import java.util.List;
import kotlin.Metadata;
/* compiled from: LazyListLayoutInfo.kt */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000¨\u0006\u0003"}, d2 = {"visibleItemsAverageSize", "", "Landroidx/compose/foundation/lazy/LazyListLayoutInfo;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyListLayoutInfoKt {
    public static final int visibleItemsAverageSize(LazyListLayoutInfo $this$visibleItemsAverageSize) {
        List visibleItems = $this$visibleItemsAverageSize.getVisibleItemsInfo();
        int sum$iv = 0;
        int size = visibleItems.size();
        for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
            Object item$iv$iv = visibleItems.get(index$iv$iv);
            LazyListItemInfo it = (LazyListItemInfo) item$iv$iv;
            sum$iv += it.getSize();
        }
        return (sum$iv / visibleItems.size()) + $this$visibleItemsAverageSize.getMainAxisItemSpacing();
    }
}
