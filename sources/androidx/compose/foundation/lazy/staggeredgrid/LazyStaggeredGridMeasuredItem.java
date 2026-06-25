package androidx.compose.foundation.lazy.staggeredgrid;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation;
import androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimator;
import androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.RangesKt;
/* compiled from: LazyStaggeredGridMeasure.kt */
@Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001d\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002Bs\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\u0004\u0012\u0006\u0010\r\u001a\u00020\u0004\u0012\u0006\u0010\u000e\u001a\u00020\u0004\u0012\u0006\u0010\u000f\u001a\u00020\u0004\u0012\u0006\u0010\u0010\u001a\u00020\u0004\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0006\u0012\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00000\u0013\u0012\u0006\u0010\u0014\u001a\u00020\u0015¢\u0006\u0002\u0010\u0016J\u0016\u0010@\u001a\u00020A2\u0006\u0010B\u001a\u00020\u00042\u0006\u0010C\u001a\u00020\u000bJ\u001d\u0010D\u001a\u0002032\u0006\u0010\u0003\u001a\u00020\u0004H\u0016ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bE\u0010FJ\u0012\u0010G\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0003\u001a\u00020\u0004H\u0016J\u001e\u0010H\u001a\u00020A2\u0006\u0010I\u001a\u00020J2\u0006\u0010K\u001a\u00020L2\u0006\u0010M\u001a\u00020\u000bJ\u001e\u0010N\u001a\u00020A2\u0006\u0010<\u001a\u00020\u00042\u0006\u0010O\u001a\u00020\u00042\u0006\u0010&\u001a\u00020\u0004J(\u0010N\u001a\u00020A2\u0006\u0010'\u001a\u00020\u00042\u0006\u0010P\u001a\u00020\u00042\u0006\u0010Q\u001a\u00020\u00042\u0006\u0010R\u001a\u00020\u0004H\u0016J\b\u0010S\u001a\u00020TH\u0016J\u000e\u0010U\u001a\u00020A2\u0006\u0010&\u001a\u00020\u0004J+\u0010V\u001a\u000203*\u0002032\u0012\u0010W\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040XH\u0082\bø\u0001\u0000¢\u0006\u0004\bY\u0010ZR\u000e\u0010\u0010\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00000\u0013X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u0014\u001a\u00020\u0015X\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0019\u001a\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0011\u0010\u001c\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010\u001eR\u0014\u0010\n\u001a\u00020\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010 R\u001a\u0010!\u001a\u00020\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010 \"\u0004\b\"\u0010#R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u001bR\u0014\u0010\r\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b%\u0010\u001eR\u000e\u0010&\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010'\u001a\u00020\u00048F¢\u0006\u0006\u001a\u0004\b(\u0010\u001eR\u0011\u0010)\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b*\u0010\u001eR\u0014\u0010+\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b,\u0010\u001eR\u000e\u0010-\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010/\u001a\u00020\u000bX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b0\u0010 \"\u0004\b1\u0010#R&\u00104\u001a\u0002032\u0006\u00102\u001a\u000203@RX\u0096\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0019\u001a\u0004\b5\u0010\u0018R\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u00106\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b7\u0010\u001eR\u001c\u00108\u001a\u000209X\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0019\u001a\u0004\b:\u0010\u0018R\u0014\u0010\u000e\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b;\u0010\u001eR\u0018\u0010<\u001a\u00020\u0004*\u0002038BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b=\u0010>R\u0019\u0010)\u001a\u00020\u0004*\u00020\t8Â\u0002X\u0082\u0004¢\u0006\u0006\u001a\u0004\b*\u0010?\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006["}, d2 = {"Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasuredItem;", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridItemInfo;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasuredItem;", "index", "", "key", "", "placeables", "", "Landroidx/compose/ui/layout/Placeable;", "isVertical", "", "spacing", "lane", "span", "beforeContentPadding", "afterContentPadding", "contentType", "animator", "Landroidx/compose/foundation/lazy/layout/LazyLayoutItemAnimator;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "(ILjava/lang/Object;Ljava/util/List;ZIIIIILjava/lang/Object;Landroidx/compose/foundation/lazy/layout/LazyLayoutItemAnimator;JLkotlin/jvm/internal/DefaultConstructorMarker;)V", "getConstraints-msEJaDk", "()J", "J", "getContentType", "()Ljava/lang/Object;", "crossAxisSize", "getCrossAxisSize", "()I", "getIndex", "()Z", "isVisible", "setVisible", "(Z)V", "getKey", "getLane", "mainAxisLayoutSize", "mainAxisOffset", "getMainAxisOffset", "mainAxisSize", "getMainAxisSize", "mainAxisSizeWithSpacings", "getMainAxisSizeWithSpacings", "maxMainAxisOffset", "minMainAxisOffset", "nonScrollableItem", "getNonScrollableItem", "setNonScrollableItem", "<set-?>", "Landroidx/compose/ui/unit/IntOffset;", TypedValues.CycleType.S_WAVE_OFFSET, "getOffset-nOcc-ac", "placeablesCount", "getPlaceablesCount", "size", "Landroidx/compose/ui/unit/IntSize;", "getSize-YbymL2g", "getSpan", "mainAxis", "getMainAxis--gyyYBs", "(J)I", "(Landroidx/compose/ui/layout/Placeable;)I", "applyScrollDelta", "", "delta", "updateAnimations", "getOffset", "getOffset-Bjo55l4", "(I)J", "getParentData", "place", "scope", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "context", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridMeasureContext;", "isLookingAhead", "position", "crossAxis", "crossAxisOffset", "layoutWidth", "layoutHeight", "toString", "", "updateMainAxisLayoutSize", "copy", "mainAxisMap", "Lkotlin/Function1;", "copy-4Tuh3kE", "(JLkotlin/jvm/functions/Function1;)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyStaggeredGridMeasuredItem implements LazyStaggeredGridItemInfo, LazyLayoutMeasuredItem {
    public static final int $stable = 8;
    private final int afterContentPadding;
    private final LazyLayoutItemAnimator<LazyStaggeredGridMeasuredItem> animator;
    private final int beforeContentPadding;
    private final long constraints;
    private final Object contentType;
    private final int crossAxisSize;
    private final int index;
    private final boolean isVertical;
    private boolean isVisible;
    private final Object key;
    private final int lane;
    private int mainAxisLayoutSize;
    private final int mainAxisSize;
    private final int mainAxisSizeWithSpacings;
    private int maxMainAxisOffset;
    private int minMainAxisOffset;
    private boolean nonScrollableItem;
    private long offset;
    private final List<Placeable> placeables;
    private final long size;
    private final int span;

    public /* synthetic */ LazyStaggeredGridMeasuredItem(int i, Object obj, List list, boolean z, int i2, int i3, int i4, int i5, int i6, Object obj2, LazyLayoutItemAnimator lazyLayoutItemAnimator, long j, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, obj, list, z, i2, i3, i4, i5, i6, obj2, lazyLayoutItemAnimator, j);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private LazyStaggeredGridMeasuredItem(int index, Object key, List<? extends Placeable> list, boolean isVertical, int spacing, int lane, int span, int beforeContentPadding, int afterContentPadding, Object contentType, LazyLayoutItemAnimator<LazyStaggeredGridMeasuredItem> lazyLayoutItemAnimator, long constraints) {
        long m7039constructorimpl;
        this.index = index;
        this.key = key;
        this.placeables = list;
        this.isVertical = isVertical;
        this.lane = lane;
        this.span = span;
        this.beforeContentPadding = beforeContentPadding;
        this.afterContentPadding = afterContentPadding;
        this.contentType = contentType;
        this.animator = lazyLayoutItemAnimator;
        this.constraints = constraints;
        this.isVisible = true;
        List $this$fastMaxOfOrDefault$iv = this.placeables;
        int defaultValue$iv = 0;
        if (!$this$fastMaxOfOrDefault$iv.isEmpty()) {
            Placeable placeable = $this$fastMaxOfOrDefault$iv.get(0);
            int maxValue$iv = isVertical() ? placeable.getHeight() : placeable.getWidth();
            int i$iv = 1;
            int lastIndex = CollectionsKt.getLastIndex($this$fastMaxOfOrDefault$iv);
            if (1 <= lastIndex) {
                int maxValue$iv2 = maxValue$iv;
                while (true) {
                    Placeable placeable2 = $this$fastMaxOfOrDefault$iv.get(i$iv);
                    int v$iv = isVertical() ? placeable2.getHeight() : placeable2.getWidth();
                    maxValue$iv2 = v$iv > maxValue$iv2 ? v$iv : maxValue$iv2;
                    if (i$iv == lastIndex) {
                        break;
                    }
                    i$iv++;
                }
                maxValue$iv = maxValue$iv2;
            }
            defaultValue$iv = maxValue$iv;
        }
        this.mainAxisSize = defaultValue$iv;
        this.mainAxisSizeWithSpacings = RangesKt.coerceAtLeast(this.mainAxisSize + spacing, 0);
        List $this$fastMaxOfOrDefault$iv2 = this.placeables;
        int defaultValue$iv2 = 0;
        if (!$this$fastMaxOfOrDefault$iv2.isEmpty()) {
            Placeable it = $this$fastMaxOfOrDefault$iv2.get(0);
            int maxValue$iv3 = isVertical() ? it.getWidth() : it.getHeight();
            int i$iv2 = 1;
            int lastIndex2 = CollectionsKt.getLastIndex($this$fastMaxOfOrDefault$iv2);
            if (1 <= lastIndex2) {
                while (true) {
                    Placeable it2 = $this$fastMaxOfOrDefault$iv2.get(i$iv2);
                    int v$iv2 = isVertical() ? it2.getWidth() : it2.getHeight();
                    maxValue$iv3 = v$iv2 > maxValue$iv3 ? v$iv2 : maxValue$iv3;
                    if (i$iv2 == lastIndex2) {
                        break;
                    }
                    i$iv2++;
                }
            }
            defaultValue$iv2 = maxValue$iv3;
        }
        this.crossAxisSize = defaultValue$iv2;
        this.mainAxisLayoutSize = -1;
        if (isVertical()) {
            int width$iv = this.crossAxisSize;
            int height$iv = this.mainAxisSize;
            m7039constructorimpl = IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L));
        } else {
            int width$iv2 = this.mainAxisSize;
            int height$iv2 = this.crossAxisSize;
            m7039constructorimpl = IntSize.m7039constructorimpl((height$iv2 & 4294967295L) | (width$iv2 << 32));
        }
        this.size = m7039constructorimpl;
        this.offset = IntOffset.Companion.m7012getZeronOccac();
    }

    @Override // androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getIndex() {
        return this.index;
    }

    @Override // androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public Object getKey() {
        return this.key;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public boolean isVertical() {
        return this.isVertical;
    }

    @Override // androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getLane() {
        return this.lane;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getSpan() {
        return this.span;
    }

    @Override // androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridItemInfo
    public Object getContentType() {
        return this.contentType;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    /* renamed from: getConstraints-msEJaDk */
    public long mo1106getConstraintsmsEJaDk() {
        return this.constraints;
    }

    public final boolean isVisible() {
        return this.isVisible;
    }

    public final void setVisible(boolean z) {
        this.isVisible = z;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getPlaceablesCount() {
        return this.placeables.size();
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public Object getParentData(int index) {
        return this.placeables.get(index).getParentData();
    }

    public final int getMainAxisSize() {
        return this.mainAxisSize;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getMainAxisSizeWithSpacings() {
        return this.mainAxisSizeWithSpacings;
    }

    public final int getCrossAxisSize() {
        return this.crossAxisSize;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public boolean getNonScrollableItem() {
        return this.nonScrollableItem;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public void setNonScrollableItem(boolean z) {
        this.nonScrollableItem = z;
    }

    @Override // androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridItemInfo
    /* renamed from: getSize-YbymL2g */
    public long mo1200getSizeYbymL2g() {
        return this.size;
    }

    @Override // androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridItemInfo
    /* renamed from: getOffset-nOcc-ac */
    public long mo1199getOffsetnOccac() {
        return this.offset;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    /* renamed from: getOffset-Bjo55l4 */
    public long mo1107getOffsetBjo55l4(int index) {
        return mo1199getOffsetnOccac();
    }

    public final void position(int mainAxis, int crossAxis, int mainAxisLayoutSize) {
        long m6995constructorimpl;
        this.mainAxisLayoutSize = mainAxisLayoutSize;
        this.minMainAxisOffset = -this.beforeContentPadding;
        this.maxMainAxisOffset = this.afterContentPadding + mainAxisLayoutSize;
        if (isVertical()) {
            m6995constructorimpl = IntOffset.m6995constructorimpl((4294967295L & mainAxis) | (crossAxis << 32));
        } else {
            m6995constructorimpl = IntOffset.m6995constructorimpl((4294967295L & crossAxis) | (mainAxis << 32));
        }
        this.offset = m6995constructorimpl;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public void position(int mainAxisOffset, int crossAxisOffset, int layoutWidth, int layoutHeight) {
        position(mainAxisOffset, crossAxisOffset, isVertical() ? layoutHeight : layoutWidth);
    }

    public final int getMainAxisOffset() {
        return !isVertical() ? IntOffset.m7001getXimpl(mo1199getOffsetnOccac()) : IntOffset.m7002getYimpl(mo1199getOffsetnOccac());
    }

    public final void place(Placeable.PlacementScope scope, LazyStaggeredGridMeasureContext context, boolean isLookingAhead) {
        int i;
        int i2;
        List $this$fastForEachIndexed$iv;
        int $i$f$fastForEachIndexed;
        GraphicsLayer layer;
        GraphicsLayer layer2;
        int mainAxisOffset;
        int y$iv$iv;
        LazyStaggeredGridMeasuredItem lazyStaggeredGridMeasuredItem = this;
        LazyStaggeredGridMeasureContext $this$place_u24lambda_u246 = context;
        int i3 = 0;
        boolean value$iv = lazyStaggeredGridMeasuredItem.mainAxisLayoutSize != -1;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("position() should be called first");
        }
        int i4 = 0;
        List $this$fastForEachIndexed$iv2 = lazyStaggeredGridMeasuredItem.placeables;
        int $i$f$fastForEachIndexed2 = 0;
        int size = $this$fastForEachIndexed$iv2.size();
        int index$iv = 0;
        while (index$iv < size) {
            Object item$iv = $this$fastForEachIndexed$iv2.get(index$iv);
            Placeable placeable = (Placeable) item$iv;
            int index = index$iv;
            int minOffset = lazyStaggeredGridMeasuredItem.minMainAxisOffset - (isVertical() ? placeable.getHeight() : placeable.getWidth());
            int maxOffset = lazyStaggeredGridMeasuredItem.maxMainAxisOffset;
            long offset = lazyStaggeredGridMeasuredItem.mo1199getOffsetnOccac();
            LazyStaggeredGridMeasureContext $this$place_u24lambda_u2462 = $this$place_u24lambda_u246;
            LazyLayoutItemAnimation animation = lazyStaggeredGridMeasuredItem.animator.getAnimation(lazyStaggeredGridMeasuredItem.getKey(), index);
            if (animation != null) {
                if (isLookingAhead) {
                    animation.m1158setLookaheadOffsetgyyYBs(offset);
                    i = i3;
                    i2 = i4;
                    $this$fastForEachIndexed$iv = $this$fastForEachIndexed$iv2;
                    $i$f$fastForEachIndexed = $i$f$fastForEachIndexed2;
                } else {
                    i = i3;
                    i2 = i4;
                    $this$fastForEachIndexed$iv = $this$fastForEachIndexed$iv2;
                    $i$f$fastForEachIndexed = $i$f$fastForEachIndexed2;
                    long targetOffset = !IntOffset.m7000equalsimpl0(animation.m1154getLookaheadOffsetnOccac(), LazyLayoutItemAnimation.Companion.m1160getNotInitializednOccac()) ? animation.m1154getLookaheadOffsetnOccac() : offset;
                    long animatedOffset = IntOffset.m7005plusqkQi6aY(targetOffset, animation.m1155getPlacementDeltanOccac());
                    if ((lazyStaggeredGridMeasuredItem.m1217getMainAxisgyyYBs(offset) <= minOffset && lazyStaggeredGridMeasuredItem.m1217getMainAxisgyyYBs(animatedOffset) <= minOffset) || (lazyStaggeredGridMeasuredItem.m1217getMainAxisgyyYBs(offset) >= maxOffset && lazyStaggeredGridMeasuredItem.m1217getMainAxisgyyYBs(animatedOffset) >= maxOffset)) {
                        animation.cancelPlacementAnimation();
                    }
                    offset = animatedOffset;
                }
                layer = animation.getLayer();
            } else {
                i = i3;
                i2 = i4;
                $this$fastForEachIndexed$iv = $this$fastForEachIndexed$iv2;
                $i$f$fastForEachIndexed = $i$f$fastForEachIndexed2;
                layer = null;
            }
            if ($this$place_u24lambda_u2462.getReverseLayout()) {
                long $this$copy_u2d4Tuh3kE$iv = offset;
                if (isVertical()) {
                    mainAxisOffset = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                    layer2 = layer;
                } else {
                    int mainAxisOffset2 = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                    layer2 = layer;
                    mainAxisOffset = (lazyStaggeredGridMeasuredItem.mainAxisLayoutSize - mainAxisOffset2) - (isVertical() ? placeable.getHeight() : placeable.getWidth());
                }
                if (isVertical()) {
                    int mainAxisOffset3 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                    int mainAxisOffset4 = lazyStaggeredGridMeasuredItem.mainAxisLayoutSize;
                    y$iv$iv = (mainAxisOffset4 - mainAxisOffset3) - (isVertical() ? placeable.getHeight() : placeable.getWidth());
                } else {
                    y$iv$iv = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                }
                int x$iv$iv = mainAxisOffset;
                offset = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            } else {
                layer2 = layer;
            }
            long offset2 = IntOffset.m7005plusqkQi6aY(offset, $this$place_u24lambda_u2462.m1204getContentOffsetnOccac());
            if (!isLookingAhead && animation != null) {
                animation.m1157setFinalOffsetgyyYBs(offset2);
            }
            if (layer2 != null) {
                Placeable.PlacementScope.m5704placeRelativeWithLayeraW9wM$default(scope, placeable, offset2, layer2, 0.0f, 4, (Object) null);
            } else {
                Placeable.PlacementScope.m5703placeRelativeWithLayeraW9wM$default(scope, placeable, offset2, 0.0f, (Function1) null, 6, (Object) null);
            }
            index$iv++;
            lazyStaggeredGridMeasuredItem = this;
            $this$place_u24lambda_u246 = $this$place_u24lambda_u2462;
            i3 = i;
            i4 = i2;
            $this$fastForEachIndexed$iv2 = $this$fastForEachIndexed$iv;
            $i$f$fastForEachIndexed2 = $i$f$fastForEachIndexed;
        }
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
        LazyStaggeredGridMeasuredItem lazyStaggeredGridMeasuredItem = this;
        if (lazyStaggeredGridMeasuredItem.getNonScrollableItem()) {
            return;
        }
        long $this$copy_u2d4Tuh3kE$iv = lazyStaggeredGridMeasuredItem.mo1199getOffsetnOccac();
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
        lazyStaggeredGridMeasuredItem.offset = IntOffset.m6995constructorimpl((it << 32) | (it2 & 4294967295L));
        if (updateAnimations) {
            int placeablesCount = lazyStaggeredGridMeasuredItem.getPlaceablesCount();
            int i2 = 0;
            while (i2 < placeablesCount) {
                int index = i2;
                LazyLayoutItemAnimation animation = lazyStaggeredGridMeasuredItem.animator.getAnimation(lazyStaggeredGridMeasuredItem.getKey(), index);
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
                lazyStaggeredGridMeasuredItem = this;
                j2 = j;
                placeablesCount = i;
            }
        }
    }

    /* renamed from: getMainAxis--gyyYBs  reason: not valid java name */
    private final int m1217getMainAxisgyyYBs(long $this$mainAxis) {
        return isVertical() ? IntOffset.m7002getYimpl($this$mainAxis) : IntOffset.m7001getXimpl($this$mainAxis);
    }

    private final int getMainAxisSize(Placeable $this$mainAxisSize) {
        return isVertical() ? $this$mainAxisSize.getHeight() : $this$mainAxisSize.getWidth();
    }

    /* renamed from: copy-4Tuh3kE  reason: not valid java name */
    private final long m1216copy4Tuh3kE(long $this$copy_u2d4Tuh3kE, Function1<? super Integer, Integer> function1) {
        int x$iv = isVertical() ? IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE) : function1.invoke(Integer.valueOf(IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE))).intValue();
        int y$iv = isVertical() ? function1.invoke(Integer.valueOf(IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE))).intValue() : IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE);
        return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }

    public String toString() {
        return super.toString();
    }
}
