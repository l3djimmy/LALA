package androidx.compose.foundation.lazy.grid;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation;
import androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimator;
import androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.RangesKt;
/* compiled from: LazyGridMeasuredItem.kt */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b#\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002B\u0093\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\u0004\u0012\u0006\u0010\n\u001a\u00020\u0004\u0012\u0006\u0010\u000b\u001a\u00020\b\u0012\u0006\u0010\f\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\u0004\u0012\u0006\u0010\u000f\u001a\u00020\u0004\u0012\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011\u0012\u0006\u0010\u0013\u001a\u00020\u0014\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0006\u0012\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00000\u0017\u0012\u0006\u0010\u0018\u001a\u00020\u0019\u0012\u0006\u0010\u001a\u001a\u00020\u0004\u0012\u0006\u0010\u001b\u001a\u00020\u0004¢\u0006\u0002\u0010\u001cJ\u0016\u0010D\u001a\u00020E2\u0006\u0010F\u001a\u00020\u00042\u0006\u0010G\u001a\u00020\bJ\u001d\u0010H\u001a\u00020\u00142\u0006\u0010\u0003\u001a\u00020\u0004H\u0016ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bI\u0010JJ\u0012\u0010K\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0003\u001a\u00020\u0004H\u0016J\u0016\u0010L\u001a\u00020E2\u0006\u0010M\u001a\u00020N2\u0006\u0010O\u001a\u00020\bJ(\u0010P\u001a\u00020E2\u0006\u0010Q\u001a\u00020\u00042\u0006\u0010R\u001a\u00020\u00042\u0006\u0010S\u001a\u00020\u00042\u0006\u0010T\u001a\u00020\u0004H\u0016J6\u0010P\u001a\u00020E2\u0006\u0010Q\u001a\u00020\u00042\u0006\u0010R\u001a\u00020\u00042\u0006\u0010S\u001a\u00020\u00042\u0006\u0010T\u001a\u00020\u00042\u0006\u0010:\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u0004J\u000e\u0010U\u001a\u00020E2\u0006\u0010+\u001a\u00020\u0004J+\u0010V\u001a\u00020\u0014*\u00020\u00142\u0012\u0010W\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040XH\u0082\bø\u0001\u0000¢\u0006\u0004\bY\u0010ZR\u000e\u0010\u000f\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00000\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010\u001e\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u0004@RX\u0096\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u001c\u0010\u0018\u001a\u00020\u0019X\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010#\u001a\u0004\b!\u0010\"R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0011\u0010\t\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b&\u0010 R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b'\u0010 R\u0014\u0010\u0007\u001a\u00020\bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010(R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b)\u0010%R\u0014\u0010\u001a\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b*\u0010 R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010,\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b-\u0010 R\u0014\u0010.\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b/\u0010 R\u000e\u00100\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u00101\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u00102\u001a\u00020\bX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b3\u0010(\"\u0004\b4\u00105R&\u00106\u001a\u00020\u00142\u0006\u0010\u001d\u001a\u00020\u0014@RX\u0096\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010#\u001a\u0004\b7\u0010\"R\u0014\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u00108\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b9\u0010 R\u000e\u0010\u000b\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001e\u0010:\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u0004@RX\u0096\u000e¢\u0006\b\n\u0000\u001a\u0004\b;\u0010 R\u001c\u0010<\u001a\u00020=X\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010#\u001a\u0004\b>\u0010\"R\u0014\u0010\u001b\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b?\u0010 R\u0016\u0010\u0013\u001a\u00020\u0014X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010#R\u0018\u0010@\u001a\u00020\u0004*\u00020\u00148BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bA\u0010BR\u0018\u0010,\u001a\u00020\u0004*\u00020\u00128BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b-\u0010C\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006["}, d2 = {"Landroidx/compose/foundation/lazy/grid/LazyGridMeasuredItem;", "Landroidx/compose/foundation/lazy/grid/LazyGridItemInfo;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasuredItem;", "index", "", "key", "", "isVertical", "", "crossAxisSize", "mainAxisSpacing", "reverseLayout", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "beforeContentPadding", "afterContentPadding", "placeables", "", "Landroidx/compose/ui/layout/Placeable;", "visualOffset", "Landroidx/compose/ui/unit/IntOffset;", "contentType", "animator", "Landroidx/compose/foundation/lazy/layout/LazyLayoutItemAnimator;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "lane", "span", "(ILjava/lang/Object;ZIIZLandroidx/compose/ui/unit/LayoutDirection;IILjava/util/List;JLjava/lang/Object;Landroidx/compose/foundation/lazy/layout/LazyLayoutItemAnimator;JIILkotlin/jvm/internal/DefaultConstructorMarker;)V", "<set-?>", "column", "getColumn", "()I", "getConstraints-msEJaDk", "()J", "J", "getContentType", "()Ljava/lang/Object;", "getCrossAxisSize", "getIndex", "()Z", "getKey", "getLane", "mainAxisLayoutSize", "mainAxisSize", "getMainAxisSize", "mainAxisSizeWithSpacings", "getMainAxisSizeWithSpacings", "maxMainAxisOffset", "minMainAxisOffset", "nonScrollableItem", "getNonScrollableItem", "setNonScrollableItem", "(Z)V", TypedValues.CycleType.S_WAVE_OFFSET, "getOffset-nOcc-ac", "placeablesCount", "getPlaceablesCount", "row", "getRow", "size", "Landroidx/compose/ui/unit/IntSize;", "getSize-YbymL2g", "getSpan", "mainAxis", "getMainAxis--gyyYBs", "(J)I", "(Landroidx/compose/ui/layout/Placeable;)I", "applyScrollDelta", "", "delta", "updateAnimations", "getOffset", "getOffset-Bjo55l4", "(I)J", "getParentData", "place", "scope", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "isLookingAhead", "position", "mainAxisOffset", "crossAxisOffset", "layoutWidth", "layoutHeight", "updateMainAxisLayoutSize", "copy", "mainAxisMap", "Lkotlin/Function1;", "copy-4Tuh3kE", "(JLkotlin/jvm/functions/Function1;)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyGridMeasuredItem implements LazyGridItemInfo, LazyLayoutMeasuredItem {
    public static final int $stable = 8;
    private final int afterContentPadding;
    private final LazyLayoutItemAnimator<LazyGridMeasuredItem> animator;
    private final int beforeContentPadding;
    private int column;
    private final long constraints;
    private final Object contentType;
    private final int crossAxisSize;
    private final int index;
    private final boolean isVertical;
    private final Object key;
    private final int lane;
    private final LayoutDirection layoutDirection;
    private int mainAxisLayoutSize;
    private final int mainAxisSize;
    private final int mainAxisSizeWithSpacings;
    private int maxMainAxisOffset;
    private int minMainAxisOffset;
    private boolean nonScrollableItem;
    private long offset;
    private final List<Placeable> placeables;
    private final boolean reverseLayout;
    private int row;
    private final long size;
    private final int span;
    private final long visualOffset;

    public /* synthetic */ LazyGridMeasuredItem(int i, Object obj, boolean z, int i2, int i3, boolean z2, LayoutDirection layoutDirection, int i4, int i5, List list, long j, Object obj2, LazyLayoutItemAnimator lazyLayoutItemAnimator, long j2, int i6, int i7, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, obj, z, i2, i3, z2, layoutDirection, i4, i5, list, j, obj2, lazyLayoutItemAnimator, j2, i6, i7);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private LazyGridMeasuredItem(int index, Object key, boolean isVertical, int crossAxisSize, int mainAxisSpacing, boolean reverseLayout, LayoutDirection layoutDirection, int beforeContentPadding, int afterContentPadding, List<? extends Placeable> list, long visualOffset, Object contentType, LazyLayoutItemAnimator<LazyGridMeasuredItem> lazyLayoutItemAnimator, long constraints, int lane, int span) {
        long m7039constructorimpl;
        this.index = index;
        this.key = key;
        this.isVertical = isVertical;
        this.crossAxisSize = crossAxisSize;
        this.reverseLayout = reverseLayout;
        this.layoutDirection = layoutDirection;
        this.beforeContentPadding = beforeContentPadding;
        this.afterContentPadding = afterContentPadding;
        this.placeables = list;
        this.visualOffset = visualOffset;
        this.contentType = contentType;
        this.animator = lazyLayoutItemAnimator;
        this.constraints = constraints;
        this.lane = lane;
        this.span = span;
        this.mainAxisLayoutSize = Integer.MIN_VALUE;
        List $this$fastForEach$iv = this.placeables;
        int size = $this$fastForEach$iv.size();
        int maxMainAxis = 0;
        int index$iv = 0;
        while (index$iv < size) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            Placeable it = (Placeable) item$iv;
            maxMainAxis = Math.max(maxMainAxis, isVertical() ? it.getHeight() : it.getWidth());
            index$iv++;
            $this$fastForEach$iv = $this$fastForEach$iv;
        }
        this.mainAxisSize = maxMainAxis;
        this.mainAxisSizeWithSpacings = RangesKt.coerceAtLeast(maxMainAxis + mainAxisSpacing, 0);
        if (!isVertical()) {
            int width$iv = this.mainAxisSize;
            int height$iv = this.crossAxisSize;
            m7039constructorimpl = IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L));
        } else {
            int width$iv2 = this.crossAxisSize;
            int height$iv2 = this.mainAxisSize;
            m7039constructorimpl = IntSize.m7039constructorimpl((width$iv2 << 32) | (height$iv2 & 4294967295L));
        }
        this.size = m7039constructorimpl;
        this.offset = IntOffset.Companion.m7012getZeronOccac();
        this.row = -1;
        this.column = -1;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getIndex() {
        return this.index;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public Object getKey() {
        return this.key;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public boolean isVertical() {
        return this.isVertical;
    }

    public final int getCrossAxisSize() {
        return this.crossAxisSize;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo
    public Object getContentType() {
        return this.contentType;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    /* renamed from: getConstraints-msEJaDk */
    public long mo1106getConstraintsmsEJaDk() {
        return this.constraints;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getLane() {
        return this.lane;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getSpan() {
        return this.span;
    }

    public final int getMainAxisSize() {
        return this.mainAxisSize;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getMainAxisSizeWithSpacings() {
        return this.mainAxisSizeWithSpacings;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getPlaceablesCount() {
        return this.placeables.size();
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public Object getParentData(int index) {
        return this.placeables.get(index).getParentData();
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo
    /* renamed from: getSize-YbymL2g */
    public long mo1133getSizeYbymL2g() {
        return this.size;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo
    /* renamed from: getOffset-nOcc-ac */
    public long mo1132getOffsetnOccac() {
        return this.offset;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo
    public int getRow() {
        return this.row;
    }

    @Override // androidx.compose.foundation.lazy.grid.LazyGridItemInfo
    public int getColumn() {
        return this.column;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    /* renamed from: getOffset-Bjo55l4 */
    public long mo1107getOffsetBjo55l4(int index) {
        return mo1132getOffsetnOccac();
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public boolean getNonScrollableItem() {
        return this.nonScrollableItem;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public void setNonScrollableItem(boolean z) {
        this.nonScrollableItem = z;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public void position(int mainAxisOffset, int crossAxisOffset, int layoutWidth, int layoutHeight) {
        position(mainAxisOffset, crossAxisOffset, layoutWidth, layoutHeight, -1, -1);
    }

    public final void position(int mainAxisOffset, int crossAxisOffset, int layoutWidth, int layoutHeight, int row, int column) {
        int crossAxisOffset2;
        long m6995constructorimpl;
        this.mainAxisLayoutSize = isVertical() ? layoutHeight : layoutWidth;
        int crossAxisLayoutSize = isVertical() ? layoutWidth : layoutHeight;
        if (isVertical() && this.layoutDirection == LayoutDirection.Rtl) {
            crossAxisOffset2 = (crossAxisLayoutSize - crossAxisOffset) - this.crossAxisSize;
        } else {
            crossAxisOffset2 = crossAxisOffset;
        }
        if (isVertical()) {
            m6995constructorimpl = IntOffset.m6995constructorimpl((4294967295L & mainAxisOffset) | (crossAxisOffset2 << 32));
        } else {
            m6995constructorimpl = IntOffset.m6995constructorimpl((4294967295L & crossAxisOffset2) | (mainAxisOffset << 32));
        }
        this.offset = m6995constructorimpl;
        this.row = row;
        this.column = column;
        this.minMainAxisOffset = -this.beforeContentPadding;
        this.maxMainAxisOffset = this.mainAxisLayoutSize + this.afterContentPadding;
    }

    public final void updateMainAxisLayoutSize(int mainAxisLayoutSize) {
        this.mainAxisLayoutSize = mainAxisLayoutSize;
        this.maxMainAxisOffset = this.afterContentPadding + mainAxisLayoutSize;
    }

    public final void applyScrollDelta(int delta, boolean updateAnimations) {
        int it;
        int it2;
        int i;
        long j;
        int x$iv$iv;
        int y$iv$iv;
        LazyGridMeasuredItem lazyGridMeasuredItem = this;
        if (lazyGridMeasuredItem.getNonScrollableItem()) {
            return;
        }
        long $this$copy_u2d4Tuh3kE$iv = lazyGridMeasuredItem.mo1132getOffsetnOccac();
        if (isVertical()) {
            it = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
        } else {
            int it3 = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
            it = it3 + delta;
        }
        if (isVertical()) {
            int it4 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
            it2 = it4 + delta;
        } else {
            it2 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
        }
        long j2 = 4294967295L;
        lazyGridMeasuredItem.offset = IntOffset.m6995constructorimpl((it << 32) | (it2 & 4294967295L));
        if (updateAnimations) {
            int placeablesCount = lazyGridMeasuredItem.getPlaceablesCount();
            int i2 = 0;
            while (i2 < placeablesCount) {
                int index = i2;
                LazyLayoutItemAnimation animation = lazyGridMeasuredItem.animator.getAnimation(lazyGridMeasuredItem.getKey(), index);
                if (animation != null) {
                    long $this$copy_u2d4Tuh3kE$iv2 = animation.m1156getRawOffsetnOccac();
                    if (isVertical()) {
                        x$iv$iv = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv2);
                    } else {
                        int mainAxis = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv2);
                        x$iv$iv = Integer.valueOf(mainAxis + delta).intValue();
                    }
                    if (isVertical()) {
                        int mainAxis2 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv2);
                        y$iv$iv = Integer.valueOf(mainAxis2 + delta).intValue();
                    } else {
                        y$iv$iv = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv2);
                    }
                    j = j2;
                    i = placeablesCount;
                    animation.m1159setRawOffsetgyyYBs(IntOffset.m6995constructorimpl((y$iv$iv & j) | (x$iv$iv << 32)));
                } else {
                    i = placeablesCount;
                    j = j2;
                }
                i2++;
                lazyGridMeasuredItem = this;
                j2 = j;
                placeablesCount = i;
            }
        }
    }

    public final void place(Placeable.PlacementScope scope, boolean isLookingAhead) {
        Placeable.PlacementScope $this$place_u24lambda_u247;
        int i;
        int i2;
        GraphicsLayer layer;
        GraphicsLayer layer2;
        Placeable placeable;
        int mainAxisOffset;
        int y$iv$iv;
        long targetOffset;
        Placeable.PlacementScope $this$place_u24lambda_u2472 = scope;
        int i3 = 0;
        boolean value$iv = this.mainAxisLayoutSize != Integer.MIN_VALUE;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("position() should be called first");
        }
        int i4 = 0;
        for (int placeablesCount = getPlaceablesCount(); i4 < placeablesCount; placeablesCount = i2) {
            int index = i4;
            Placeable placeable2 = this.placeables.get(index);
            int minOffset = this.minMainAxisOffset - getMainAxisSize(placeable2);
            int maxOffset = this.maxMainAxisOffset;
            long offset = mo1132getOffsetnOccac();
            LazyLayoutItemAnimation animation = this.animator.getAnimation(getKey(), index);
            if (animation != null) {
                if (isLookingAhead) {
                    animation.m1158setLookaheadOffsetgyyYBs(offset);
                    $this$place_u24lambda_u247 = $this$place_u24lambda_u2472;
                    i = i3;
                    i2 = placeablesCount;
                } else {
                    i = i3;
                    i2 = placeablesCount;
                    if (!IntOffset.m7000equalsimpl0(animation.m1154getLookaheadOffsetnOccac(), LazyLayoutItemAnimation.Companion.m1160getNotInitializednOccac())) {
                        targetOffset = animation.m1154getLookaheadOffsetnOccac();
                    } else {
                        targetOffset = offset;
                    }
                    long animatedOffset = IntOffset.m7005plusqkQi6aY(targetOffset, animation.m1155getPlacementDeltanOccac());
                    $this$place_u24lambda_u247 = $this$place_u24lambda_u2472;
                    if ((m1139getMainAxisgyyYBs(offset) <= minOffset && m1139getMainAxisgyyYBs(animatedOffset) <= minOffset) || (m1139getMainAxisgyyYBs(offset) >= maxOffset && m1139getMainAxisgyyYBs(animatedOffset) >= maxOffset)) {
                        animation.cancelPlacementAnimation();
                    }
                    offset = animatedOffset;
                }
                layer = animation.getLayer();
            } else {
                $this$place_u24lambda_u247 = $this$place_u24lambda_u2472;
                i = i3;
                i2 = placeablesCount;
                layer = null;
            }
            if (!this.reverseLayout) {
                layer2 = layer;
                placeable = placeable2;
            } else {
                long $this$copy_u2d4Tuh3kE$iv = offset;
                if (isVertical()) {
                    mainAxisOffset = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                    layer2 = layer;
                } else {
                    int mainAxisOffset2 = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                    layer2 = layer;
                    mainAxisOffset = (this.mainAxisLayoutSize - mainAxisOffset2) - getMainAxisSize(placeable2);
                }
                if (isVertical()) {
                    int mainAxisOffset3 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                    int mainAxisOffset4 = this.mainAxisLayoutSize;
                    y$iv$iv = (mainAxisOffset4 - mainAxisOffset3) - getMainAxisSize(placeable2);
                } else {
                    y$iv$iv = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                }
                placeable = placeable2;
                offset = IntOffset.m6995constructorimpl((mainAxisOffset << 32) | (y$iv$iv & 4294967295L));
            }
            long offset2 = IntOffset.m7005plusqkQi6aY(offset, this.visualOffset);
            if (!isLookingAhead && animation != null) {
                animation.m1157setFinalOffsetgyyYBs(offset2);
            }
            if (!isVertical()) {
                $this$place_u24lambda_u2472 = $this$place_u24lambda_u247;
                Placeable placeable3 = placeable;
                if (layer2 != null) {
                    Placeable.PlacementScope.m5704placeRelativeWithLayeraW9wM$default($this$place_u24lambda_u2472, placeable3, offset2, layer2, 0.0f, 4, (Object) null);
                } else {
                    Placeable.PlacementScope.m5703placeRelativeWithLayeraW9wM$default($this$place_u24lambda_u2472, placeable3, offset2, 0.0f, (Function1) null, 6, (Object) null);
                }
            } else if (layer2 != null) {
                $this$place_u24lambda_u2472 = $this$place_u24lambda_u247;
                Placeable.PlacementScope.m5706placeWithLayeraW9wM$default($this$place_u24lambda_u2472, placeable, offset2, layer2, 0.0f, 4, (Object) null);
            } else {
                $this$place_u24lambda_u2472 = $this$place_u24lambda_u247;
                Placeable.PlacementScope.m5705placeWithLayeraW9wM$default($this$place_u24lambda_u2472, placeable, offset2, 0.0f, (Function1) null, 6, (Object) null);
            }
            i4++;
            i3 = i;
        }
    }

    /* renamed from: getMainAxis--gyyYBs  reason: not valid java name */
    private final int m1139getMainAxisgyyYBs(long $this$mainAxis) {
        return isVertical() ? IntOffset.m7002getYimpl($this$mainAxis) : IntOffset.m7001getXimpl($this$mainAxis);
    }

    private final int getMainAxisSize(Placeable $this$mainAxisSize) {
        return isVertical() ? $this$mainAxisSize.getHeight() : $this$mainAxisSize.getWidth();
    }

    /* renamed from: copy-4Tuh3kE  reason: not valid java name */
    private final long m1138copy4Tuh3kE(long $this$copy_u2d4Tuh3kE, Function1<? super Integer, Integer> function1) {
        int x$iv = isVertical() ? IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE) : function1.invoke(Integer.valueOf(IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE))).intValue();
        int y$iv = isVertical() ? function1.invoke(Integer.valueOf(IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE))).intValue() : IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE);
        return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }
}
