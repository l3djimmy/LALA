package androidx.compose.foundation.lazy;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation;
import androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimator;
import androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.RangesKt;
/* compiled from: LazyListMeasuredItem.kt */
@Metadata(d1 = {"\u0000t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0010\u0015\n\u0002\b\r\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002B\u008f\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\u0006\u0010\b\u001a\u00020\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\u0006\u0010\u000e\u001a\u00020\u000f\u0012\u0006\u0010\u0010\u001a\u00020\t\u0012\u0006\u0010\u0011\u001a\u00020\u0004\u0012\u0006\u0010\u0012\u001a\u00020\u0004\u0012\u0006\u0010\u0013\u001a\u00020\u0004\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u0017\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00000\u001a\u0012\u0006\u0010\u001b\u001a\u00020\u001c¢\u0006\u0002\u0010\u001dJ\u0016\u0010E\u001a\u00020F2\u0006\u0010G\u001a\u00020\u00042\u0006\u0010H\u001a\u00020\tJ\u001d\u00106\u001a\u00020\u00152\u0006\u0010\u0003\u001a\u00020\u0004H\u0016ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bI\u0010JJ\u0012\u0010K\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u0003\u001a\u00020\u0004H\u0016J\u0016\u0010L\u001a\u00020F2\u0006\u0010M\u001a\u00020N2\u0006\u0010O\u001a\u00020\tJ\u001e\u0010P\u001a\u00020F2\u0006\u0010Q\u001a\u00020\u00042\u0006\u0010R\u001a\u00020\u00042\u0006\u0010S\u001a\u00020\u0004J(\u0010P\u001a\u00020F2\u0006\u0010Q\u001a\u00020\u00042\u0006\u0010T\u001a\u00020\u00042\u0006\u0010R\u001a\u00020\u00042\u0006\u0010S\u001a\u00020\u0004H\u0016J\u000e\u0010U\u001a\u00020F2\u0006\u0010+\u001a\u00020\u0004J+\u0010V\u001a\u00020\u0015*\u00020\u00152\u0012\u0010W\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00040XH\u0082\bø\u0001\u0000¢\u0006\u0004\bY\u0010ZR\u000e\u0010\u0012\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00000\u001aX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u001b\u001a\u00020\u001cX\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010 \u001a\u0004\b\u001e\u0010\u001fR\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u0017X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"R\u0011\u0010#\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b&\u0010%R\u0014\u0010\b\u001a\u00020\tX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010'R\u0014\u0010\u0016\u001a\u00020\u0017X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b(\u0010\"R\u0014\u0010)\u001a\u00020\u0004X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b*\u0010%R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010,\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b-\u0010%R\u000e\u0010.\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u00100\u001a\u00020\tX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b1\u0010'\"\u0004\b2\u00103R\u001e\u00105\u001a\u00020\u00042\u0006\u00104\u001a\u00020\u0004@RX\u0096\u000e¢\u0006\b\n\u0000\u001a\u0004\b6\u0010%R\u000e\u00107\u001a\u000208X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u00109\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b:\u0010%R\u000e\u0010\u0010\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010;\u001a\u00020\u0004X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b<\u0010%R\u000e\u0010\u0013\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010=\u001a\u00020\u0004X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b>\u0010%R\u0010\u0010\f\u001a\u0004\u0018\u00010\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0014\u001a\u00020\u0015X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010 R\u0018\u0010?\u001a\u00020\u0004*\u00020\u00158BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b@\u0010AR\u0018\u0010B\u001a\u00020\u0004*\u00020\u00078BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bC\u0010D\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006["}, d2 = {"Landroidx/compose/foundation/lazy/LazyListMeasuredItem;", "Landroidx/compose/foundation/lazy/LazyListItemInfo;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasuredItem;", "index", "", "placeables", "", "Landroidx/compose/ui/layout/Placeable;", "isVertical", "", "horizontalAlignment", "Landroidx/compose/ui/Alignment$Horizontal;", "verticalAlignment", "Landroidx/compose/ui/Alignment$Vertical;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "reverseLayout", "beforeContentPadding", "afterContentPadding", "spacing", "visualOffset", "Landroidx/compose/ui/unit/IntOffset;", "key", "", "contentType", "animator", "Landroidx/compose/foundation/lazy/layout/LazyLayoutItemAnimator;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "(ILjava/util/List;ZLandroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/ui/unit/LayoutDirection;ZIIIJLjava/lang/Object;Ljava/lang/Object;Landroidx/compose/foundation/lazy/layout/LazyLayoutItemAnimator;JLkotlin/jvm/internal/DefaultConstructorMarker;)V", "getConstraints-msEJaDk", "()J", "J", "getContentType", "()Ljava/lang/Object;", "crossAxisSize", "getCrossAxisSize", "()I", "getIndex", "()Z", "getKey", "lane", "getLane", "mainAxisLayoutSize", "mainAxisSizeWithSpacings", "getMainAxisSizeWithSpacings", "maxMainAxisOffset", "minMainAxisOffset", "nonScrollableItem", "getNonScrollableItem", "setNonScrollableItem", "(Z)V", "<set-?>", TypedValues.CycleType.S_WAVE_OFFSET, "getOffset", "placeableOffsets", "", "placeablesCount", "getPlaceablesCount", "size", "getSize", "span", "getSpan", "mainAxis", "getMainAxis--gyyYBs", "(J)I", "mainAxisSize", "getMainAxisSize", "(Landroidx/compose/ui/layout/Placeable;)I", "applyScrollDelta", "", "delta", "updateAnimations", "getOffset-Bjo55l4", "(I)J", "getParentData", "place", "scope", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "isLookingAhead", "position", "mainAxisOffset", "layoutWidth", "layoutHeight", "crossAxisOffset", "updateMainAxisLayoutSize", "copy", "mainAxisMap", "Lkotlin/Function1;", "copy-4Tuh3kE", "(JLkotlin/jvm/functions/Function1;)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyListMeasuredItem implements LazyListItemInfo, LazyLayoutMeasuredItem {
    public static final int $stable = 8;
    private final int afterContentPadding;
    private final LazyLayoutItemAnimator<LazyListMeasuredItem> animator;
    private final int beforeContentPadding;
    private final long constraints;
    private final Object contentType;
    private final int crossAxisSize;
    private final Alignment.Horizontal horizontalAlignment;
    private final int index;
    private final boolean isVertical;
    private final Object key;
    private final int lane;
    private final LayoutDirection layoutDirection;
    private int mainAxisLayoutSize;
    private final int mainAxisSizeWithSpacings;
    private int maxMainAxisOffset;
    private int minMainAxisOffset;
    private boolean nonScrollableItem;
    private int offset;
    private final int[] placeableOffsets;
    private final List<Placeable> placeables;
    private final boolean reverseLayout;
    private final int size;
    private final int spacing;
    private final int span;
    private final Alignment.Vertical verticalAlignment;
    private final long visualOffset;

    public /* synthetic */ LazyListMeasuredItem(int i, List list, boolean z, Alignment.Horizontal horizontal, Alignment.Vertical vertical, LayoutDirection layoutDirection, boolean z2, int i2, int i3, int i4, long j, Object obj, Object obj2, LazyLayoutItemAnimator lazyLayoutItemAnimator, long j2, DefaultConstructorMarker defaultConstructorMarker) {
        this(i, list, z, horizontal, vertical, layoutDirection, z2, i2, i3, i4, j, obj, obj2, lazyLayoutItemAnimator, j2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private LazyListMeasuredItem(int index, List<? extends Placeable> list, boolean isVertical, Alignment.Horizontal horizontalAlignment, Alignment.Vertical verticalAlignment, LayoutDirection layoutDirection, boolean reverseLayout, int beforeContentPadding, int afterContentPadding, int spacing, long visualOffset, Object key, Object contentType, LazyLayoutItemAnimator<LazyListMeasuredItem> lazyLayoutItemAnimator, long constraints) {
        this.index = index;
        this.placeables = list;
        this.isVertical = isVertical;
        this.horizontalAlignment = horizontalAlignment;
        this.verticalAlignment = verticalAlignment;
        this.layoutDirection = layoutDirection;
        this.reverseLayout = reverseLayout;
        this.beforeContentPadding = beforeContentPadding;
        this.afterContentPadding = afterContentPadding;
        this.spacing = spacing;
        this.visualOffset = visualOffset;
        this.key = key;
        this.contentType = contentType;
        this.animator = lazyLayoutItemAnimator;
        this.constraints = constraints;
        this.span = 1;
        this.mainAxisLayoutSize = Integer.MIN_VALUE;
        List $this$fastForEach$iv = this.placeables;
        int maxCrossAxis = $this$fastForEach$iv.size();
        int mainAxisSize = 0;
        int index$iv = 0;
        int maxCrossAxis2 = 0;
        while (index$iv < maxCrossAxis) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            Placeable it = (Placeable) item$iv;
            mainAxisSize += isVertical() ? it.getHeight() : it.getWidth();
            maxCrossAxis2 = Math.max(maxCrossAxis2, !isVertical() ? it.getHeight() : it.getWidth());
            index$iv++;
            $this$fastForEach$iv = $this$fastForEach$iv;
        }
        this.size = mainAxisSize;
        this.mainAxisSizeWithSpacings = RangesKt.coerceAtLeast(getSize() + this.spacing, 0);
        this.crossAxisSize = maxCrossAxis2;
        this.placeableOffsets = new int[this.placeables.size() * 2];
    }

    @Override // androidx.compose.foundation.lazy.LazyListItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getIndex() {
        return this.index;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public boolean isVertical() {
        return this.isVertical;
    }

    @Override // androidx.compose.foundation.lazy.LazyListItemInfo, androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public Object getKey() {
        return this.key;
    }

    @Override // androidx.compose.foundation.lazy.LazyListItemInfo
    public Object getContentType() {
        return this.contentType;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    /* renamed from: getConstraints-msEJaDk  reason: not valid java name */
    public long mo1106getConstraintsmsEJaDk() {
        return this.constraints;
    }

    @Override // androidx.compose.foundation.lazy.LazyListItemInfo
    public int getOffset() {
        return this.offset;
    }

    @Override // androidx.compose.foundation.lazy.LazyListItemInfo
    public int getSize() {
        return this.size;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getLane() {
        return this.lane;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getSpan() {
        return this.span;
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

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public int getPlaceablesCount() {
        return this.placeables.size();
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public Object getParentData(int index) {
        return this.placeables.get(index).getParentData();
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    public void position(int mainAxisOffset, int crossAxisOffset, int layoutWidth, int layoutHeight) {
        position(mainAxisOffset, layoutWidth, layoutHeight);
    }

    public final void position(int mainAxisOffset, int layoutWidth, int layoutHeight) {
        this.offset = mainAxisOffset;
        this.mainAxisLayoutSize = isVertical() ? layoutHeight : layoutWidth;
        List $this$fastForEachIndexed$iv = this.placeables;
        int size = $this$fastForEachIndexed$iv.size();
        int mainAxisOffset2 = mainAxisOffset;
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEachIndexed$iv.get(index$iv);
            Placeable placeable = (Placeable) item$iv;
            int index = index$iv;
            int indexInArray = index * 2;
            boolean isVertical = isVertical();
            int[] iArr = this.placeableOffsets;
            if (isVertical) {
                Alignment.Horizontal horizontal = this.horizontalAlignment;
                if (horizontal != null) {
                    int $i$f$requirePreconditionNotNull = placeable.getWidth();
                    iArr[indexInArray] = horizontal.align($i$f$requirePreconditionNotNull, layoutWidth, this.layoutDirection);
                    this.placeableOffsets[indexInArray + 1] = mainAxisOffset2;
                    mainAxisOffset2 += placeable.getHeight();
                } else {
                    InlineClassHelperKt.throwIllegalArgumentExceptionForNullCheck("null horizontalAlignment when isVertical == true");
                    throw new KotlinNothingValueException();
                }
            } else {
                iArr[indexInArray] = mainAxisOffset2;
                int[] iArr2 = this.placeableOffsets;
                int i = indexInArray + 1;
                Alignment.Vertical vertical = this.verticalAlignment;
                if (vertical != null) {
                    int $i$f$requirePreconditionNotNull2 = placeable.getHeight();
                    iArr2[i] = vertical.align($i$f$requirePreconditionNotNull2, layoutHeight);
                    mainAxisOffset2 += placeable.getWidth();
                } else {
                    InlineClassHelperKt.throwIllegalArgumentExceptionForNullCheck("null verticalAlignment when isVertical == false");
                    throw new KotlinNothingValueException();
                }
            }
        }
        this.minMainAxisOffset = -this.beforeContentPadding;
        this.maxMainAxisOffset = this.mainAxisLayoutSize + this.afterContentPadding;
    }

    public final void updateMainAxisLayoutSize(int mainAxisLayoutSize) {
        this.mainAxisLayoutSize = mainAxisLayoutSize;
        this.maxMainAxisOffset = this.afterContentPadding + mainAxisLayoutSize;
    }

    @Override // androidx.compose.foundation.lazy.layout.LazyLayoutMeasuredItem
    /* renamed from: getOffset-Bjo55l4  reason: not valid java name */
    public long mo1107getOffsetBjo55l4(int index) {
        int x$iv = this.placeableOffsets[index * 2];
        int y$iv = this.placeableOffsets[(index * 2) + 1];
        return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }

    public final void applyScrollDelta(int delta, boolean updateAnimations) {
        int i;
        long m6995constructorimpl;
        LazyListMeasuredItem lazyListMeasuredItem = this;
        if (lazyListMeasuredItem.getNonScrollableItem()) {
            return;
        }
        lazyListMeasuredItem.offset = lazyListMeasuredItem.getOffset() + delta;
        int length = lazyListMeasuredItem.placeableOffsets.length;
        int index = 0;
        for (int i2 = 0; i2 < length; i2++) {
            int index2 = i2;
            int oddEven = index2 & 1;
            if ((lazyListMeasuredItem.isVertical() && oddEven != 0) || (!lazyListMeasuredItem.isVertical() && oddEven == 0)) {
                int[] iArr = lazyListMeasuredItem.placeableOffsets;
                iArr[index2] = iArr[index2] + delta;
            }
        }
        if (updateAnimations) {
            int placeablesCount = lazyListMeasuredItem.getPlaceablesCount();
            while (index < placeablesCount) {
                LazyLayoutItemAnimation animation = lazyListMeasuredItem.animator.getAnimation(lazyListMeasuredItem.getKey(), index);
                if (animation != null) {
                    long $this$copy_u2d4Tuh3kE$iv = animation.m1156getRawOffsetnOccac();
                    if (isVertical()) {
                        int x$iv$iv = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                        int mainAxis = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                        int y$iv$iv = Integer.valueOf(mainAxis + delta).intValue();
                        i = placeablesCount;
                        m6995constructorimpl = IntOffset.m6995constructorimpl((y$iv$iv & 4294967295L) | (x$iv$iv << 32));
                    } else {
                        i = placeablesCount;
                        int mainAxis2 = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                        int x$iv$iv2 = Integer.valueOf(mainAxis2 + delta).intValue();
                        int y$iv$iv2 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                        m6995constructorimpl = IntOffset.m6995constructorimpl((x$iv$iv2 << 32) | (y$iv$iv2 & 4294967295L));
                    }
                    animation.m1159setRawOffsetgyyYBs(m6995constructorimpl);
                } else {
                    i = placeablesCount;
                }
                index++;
                lazyListMeasuredItem = this;
                placeablesCount = i;
            }
        }
    }

    public final void place(Placeable.PlacementScope scope, boolean isLookingAhead) {
        Placeable.PlacementScope $this$place_u24lambda_u2410;
        GraphicsLayer layer;
        GraphicsLayer layer2;
        Placeable placeable;
        Placeable.PlacementScope $this$place_u24lambda_u24102 = scope;
        boolean value$iv = this.mainAxisLayoutSize != Integer.MIN_VALUE;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("position() should be called first");
        }
        int placeablesCount = getPlaceablesCount();
        for (int i = 0; i < placeablesCount; i++) {
            int index = i;
            Placeable placeable2 = this.placeables.get(index);
            int minOffset = this.minMainAxisOffset - getMainAxisSize(placeable2);
            int maxOffset = this.maxMainAxisOffset;
            long targetOffset = mo1107getOffsetBjo55l4(index);
            LazyLayoutItemAnimation animation = this.animator.getAnimation(getKey(), index);
            if (animation != null) {
                if (isLookingAhead) {
                    animation.m1158setLookaheadOffsetgyyYBs(targetOffset);
                    $this$place_u24lambda_u2410 = $this$place_u24lambda_u24102;
                } else {
                    long targetOffset2 = !IntOffset.m7000equalsimpl0(animation.m1154getLookaheadOffsetnOccac(), LazyLayoutItemAnimation.Companion.m1160getNotInitializednOccac()) ? animation.m1154getLookaheadOffsetnOccac() : targetOffset;
                    long animatedOffset = IntOffset.m7005plusqkQi6aY(targetOffset2, animation.m1155getPlacementDeltanOccac());
                    $this$place_u24lambda_u2410 = $this$place_u24lambda_u24102;
                    if ((m1105getMainAxisgyyYBs(targetOffset2) <= minOffset && m1105getMainAxisgyyYBs(animatedOffset) <= minOffset) || (m1105getMainAxisgyyYBs(targetOffset2) >= maxOffset && m1105getMainAxisgyyYBs(animatedOffset) >= maxOffset)) {
                        animation.cancelPlacementAnimation();
                    }
                    targetOffset = animatedOffset;
                }
                layer = animation.getLayer();
            } else {
                $this$place_u24lambda_u2410 = $this$place_u24lambda_u24102;
                layer = null;
            }
            if (this.reverseLayout) {
                long $this$copy_u2d4Tuh3kE$iv = targetOffset;
                if (isVertical()) {
                    int x$iv$iv = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                    int mainAxisOffset = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                    layer2 = layer;
                    int y$iv$iv = (this.mainAxisLayoutSize - mainAxisOffset) - getMainAxisSize(placeable2);
                    targetOffset = IntOffset.m6995constructorimpl((y$iv$iv & 4294967295L) | (x$iv$iv << 32));
                    placeable = placeable2;
                } else {
                    layer2 = layer;
                    int mainAxisOffset2 = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE$iv);
                    int x$iv$iv2 = (this.mainAxisLayoutSize - mainAxisOffset2) - getMainAxisSize(placeable2);
                    int y$iv$iv2 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE$iv);
                    placeable = placeable2;
                    targetOffset = IntOffset.m6995constructorimpl((x$iv$iv2 << 32) | (y$iv$iv2 & 4294967295L));
                }
            } else {
                layer2 = layer;
                placeable = placeable2;
            }
            long offset = IntOffset.m7005plusqkQi6aY(targetOffset, this.visualOffset);
            if (!isLookingAhead && animation != null) {
                animation.m1157setFinalOffsetgyyYBs(offset);
            }
            if (!isVertical()) {
                Placeable placeable3 = placeable;
                $this$place_u24lambda_u24102 = $this$place_u24lambda_u2410;
                if (layer2 != null) {
                    Placeable.PlacementScope.m5704placeRelativeWithLayeraW9wM$default($this$place_u24lambda_u24102, placeable3, offset, layer2, 0.0f, 4, (Object) null);
                } else {
                    Placeable.PlacementScope.m5703placeRelativeWithLayeraW9wM$default($this$place_u24lambda_u24102, placeable3, offset, 0.0f, (Function1) null, 6, (Object) null);
                }
            } else if (layer2 != null) {
                $this$place_u24lambda_u24102 = $this$place_u24lambda_u2410;
                Placeable.PlacementScope.m5706placeWithLayeraW9wM$default($this$place_u24lambda_u24102, placeable, offset, layer2, 0.0f, 4, (Object) null);
            } else {
                $this$place_u24lambda_u24102 = $this$place_u24lambda_u2410;
                Placeable.PlacementScope.m5705placeWithLayeraW9wM$default($this$place_u24lambda_u24102, placeable, offset, 0.0f, (Function1) null, 6, (Object) null);
            }
        }
    }

    /* renamed from: getMainAxis--gyyYBs  reason: not valid java name */
    private final int m1105getMainAxisgyyYBs(long $this$mainAxis) {
        return isVertical() ? IntOffset.m7002getYimpl($this$mainAxis) : IntOffset.m7001getXimpl($this$mainAxis);
    }

    private final int getMainAxisSize(Placeable $this$mainAxisSize) {
        return isVertical() ? $this$mainAxisSize.getHeight() : $this$mainAxisSize.getWidth();
    }

    /* renamed from: copy-4Tuh3kE  reason: not valid java name */
    private final long m1104copy4Tuh3kE(long $this$copy_u2d4Tuh3kE, Function1<? super Integer, Integer> function1) {
        if (isVertical()) {
            int x$iv = IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE);
            int y$iv = function1.invoke(Integer.valueOf(IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE))).intValue();
            return IntOffset.m6995constructorimpl((4294967295L & y$iv) | (x$iv << 32));
        }
        int x$iv2 = function1.invoke(Integer.valueOf(IntOffset.m7001getXimpl($this$copy_u2d4Tuh3kE))).intValue();
        int y$iv2 = IntOffset.m7002getYimpl($this$copy_u2d4Tuh3kE);
        return IntOffset.m6995constructorimpl((4294967295L & y$iv2) | (x$iv2 << 32));
    }
}
