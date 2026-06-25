package androidx.compose.ui.spatial;

import android.os.Trace;
import androidx.collection.IntObjectMap;
import androidx.collection.IntObjectMapKt;
import androidx.collection.MutableObjectList;
import androidx.collection.ObjectList;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.Actual_androidKt;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.geometry.MutableRect;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.graphics.Matrix;
import androidx.compose.ui.graphics.MatrixKt;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.MeasurePassDelegate;
import androidx.compose.ui.node.NodeCoordinator;
import androidx.compose.ui.node.OwnedLayer;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import androidx.compose.ui.unit.IntSize;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.TypeIntrinsics;
/* compiled from: RectManager.kt */
@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\b\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fJ\u0006\u0010 \u001a\u00020\u000bJ8\u0010!\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u00042\u0006\u0010#\u001a\u00020\u000f2\u0006\u0010$\u001a\u00020\u001d2\u0006\u0010%\u001a\u00020\u001d2\u0006\u0010&\u001a\u00020\u001d2\u0006\u0010'\u001a\u00020\u001dH\u0002J*\u0010(\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u00042\u0006\u0010)\u001a\u00020*2\u0006\u0010#\u001a\u00020\u000fH\u0002ø\u0001\u0000¢\u0006\u0004\b+\u0010,J\u0010\u0010-\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u0004H\u0002J\u0006\u0010.\u001a\u00020\u000bJ\u000e\u0010/\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u0004J\u001d\u00100\u001a\u00020\u000f2\u0006\u00101\u001a\u00020\u001d2\u0006\u00102\u001a\u00020\u001dH\u0000¢\u0006\u0002\b3J\u000e\u00104\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u0004J(\u00105\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u00042\u0006\u0010)\u001a\u00020*2\u0006\u0010#\u001a\u00020\u000fø\u0001\u0000¢\u0006\u0004\b6\u0010,J\u0016\u00107\u001a\u0004\u0018\u00010\u00012\f\u00108\u001a\b\u0012\u0004\u0012\u00020\u000b0\nJ:\u00109\u001a\u00020:2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010;\u001a\u00020\u00172\u0006\u0010<\u001a\u00020\u00172\u0006\u0010\u001e\u001a\u00020\u001f2\u0012\u00108\u001a\u000e\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u000b0=J:\u0010>\u001a\u00020:2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010;\u001a\u00020\u00172\u0006\u0010<\u001a\u00020\u00172\u0006\u0010\u001e\u001a\u00020\u001f2\u0012\u00108\u001a\u000e\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u000b0=J\u000e\u0010?\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00020\u0004J\u000e\u0010@\u001a\u00020\u000b2\u0006\u0010A\u001a\u00020\u000fJ\u0010\u0010B\u001a\u00020\u000b2\b\u0010C\u001a\u0004\u0018\u00010\u0001J(\u0010D\u001a\u00020\u000b2\u0006\u0010E\u001a\u00020*2\u0006\u0010F\u001a\u00020*2\u0006\u0010G\u001a\u00020Hø\u0001\u0000¢\u0006\u0004\bI\u0010JJ\u0014\u0010K\u001a\u00020\u000b*\u00020L2\u0006\u0010M\u001a\u00020\u0007H\u0002J\u0019\u0010N\u001a\u00020**\u00020\u0004H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bO\u0010PJ\u0019\u0010Q\u001a\u00020**\u00020LH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bR\u0010SR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0\n0\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u0001X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0012\u001a\u00020\u0013¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006T"}, d2 = {"Landroidx/compose/ui/spatial/RectManager;", "", "layoutNodes", "Landroidx/collection/IntObjectMap;", "Landroidx/compose/ui/node/LayoutNode;", "(Landroidx/collection/IntObjectMap;)V", "cachedRect", "Landroidx/compose/ui/geometry/MutableRect;", "callbacks", "Landroidx/collection/MutableObjectList;", "Lkotlin/Function0;", "", "dispatchLambda", "dispatchToken", "isDirty", "", "isFragmented", "isScreenOrWindowDirty", "rects", "Landroidx/compose/ui/spatial/RectList;", "getRects", "()Landroidx/compose/ui/spatial/RectList;", "scheduledDispatchDeadline", "", "throttledCallbacks", "Landroidx/compose/ui/spatial/ThrottledCallbacks;", "currentRectInfo", "Landroidx/compose/ui/spatial/RelativeLayoutBounds;", "id", "", "node", "Landroidx/compose/ui/node/DelegatableNode;", "dispatchCallbacks", "insertOrUpdate", "layoutNode", "firstPlacement", "l", "t", "r", "b", "insertOrUpdateTransformedNode", "position", "Landroidx/compose/ui/unit/IntOffset;", "insertOrUpdateTransformedNode-70tqf50", "(Landroidx/compose/ui/node/LayoutNode;JZ)V", "insertOrUpdateTransformedNodeSubhierarchy", "invalidate", "invalidateCallbacksFor", "isTargetDrawnFirst", "targetId", "otherId", "isTargetDrawnFirst$ui_release", "onLayoutLayerPositionalPropertiesChanged", "onLayoutPositionChanged", "onLayoutPositionChanged-70tqf50", "registerOnChangedCallback", "callback", "registerOnGlobalLayoutCallback", "Landroidx/compose/ui/node/DelegatableNode$RegistrationHandle;", "throttleMillis", "debounceMillis", "Lkotlin/Function1;", "registerOnRectChangedCallback", "remove", "scheduleDebounceCallback", "ensureSomethingScheduled", "unregisterOnChangedCallback", "token", "updateOffsets", "screenOffset", "windowOffset", "viewToWindowMatrix", "Landroidx/compose/ui/graphics/Matrix;", "updateOffsets-ucfNpQE", "(JJ[F)V", "boundingRectInRoot", "Landroidx/compose/ui/node/NodeCoordinator;", "rect", "outerToInnerOffset", "outerToInnerOffset-Bjo55l4", "(Landroidx/compose/ui/node/LayoutNode;)J", "positionInRoot", "positionInRoot-Bjo55l4", "(Landroidx/compose/ui/node/NodeCoordinator;)J", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RectManager {
    public static final int $stable = 8;
    private final MutableRect cachedRect;
    private final MutableObjectList<Function0<Unit>> callbacks;
    private final Function0<Unit> dispatchLambda;
    private Object dispatchToken;
    private boolean isDirty;
    private boolean isFragmented;
    private boolean isScreenOrWindowDirty;
    private final IntObjectMap<LayoutNode> layoutNodes;
    private final RectList rects;
    private long scheduledDispatchDeadline;
    private final ThrottledCallbacks throttledCallbacks;

    public RectManager() {
        this(null, 1, null);
    }

    public RectManager(IntObjectMap<LayoutNode> intObjectMap) {
        this.layoutNodes = intObjectMap;
        this.rects = new RectList();
        this.throttledCallbacks = new ThrottledCallbacks();
        this.callbacks = new MutableObjectList<>(0, 1, null);
        this.scheduledDispatchDeadline = -1L;
        this.dispatchLambda = new Function0<Unit>() { // from class: androidx.compose.ui.spatial.RectManager$dispatchLambda$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Unit invoke() {
                invoke2();
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2() {
                RectManager.this.dispatchToken = null;
                RectManager rectManager = RectManager.this;
                Trace.beginSection("OnPositionedDispatch");
                try {
                    rectManager.dispatchCallbacks();
                    Unit unit = Unit.INSTANCE;
                } finally {
                    Trace.endSection();
                }
            }
        };
        this.cachedRect = new MutableRect(0.0f, 0.0f, 0.0f, 0.0f);
    }

    public /* synthetic */ RectManager(IntObjectMap intObjectMap, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? IntObjectMapKt.intObjectMapOf() : intObjectMap);
    }

    public final RectList getRects() {
        return this.rects;
    }

    public final void invalidate() {
        this.isDirty = true;
    }

    /* renamed from: updateOffsets-ucfNpQE  reason: not valid java name */
    public final void m6128updateOffsetsucfNpQE(long screenOffset, long windowOffset, float[] viewToWindowMatrix) {
        int analysis;
        analysis = RectManagerKt.m6131analyzeComponents58bKbWc(viewToWindowMatrix);
        ThrottledCallbacks throttledCallbacks = this.throttledCallbacks;
        boolean z = true;
        int $this$hasNonTranslationComponents$iv = (analysis & 2) == 0 ? 1 : 0;
        if (!throttledCallbacks.m6144updateOffsetsbT0EZQs(screenOffset, windowOffset, $this$hasNonTranslationComponents$iv != 0 ? viewToWindowMatrix : null) && !this.isScreenOrWindowDirty) {
            z = false;
        }
        this.isScreenOrWindowDirty = z;
    }

    public final void dispatchCallbacks() {
        int i$iv;
        long currentTime = Actual_androidKt.currentTimeMillis();
        boolean isDispatchGlobalCallbacks = this.isDirty || this.isScreenOrWindowDirty;
        if (this.isDirty) {
            this.isDirty = false;
            ObjectList this_$iv = this.callbacks;
            Object[] content$iv = this_$iv.content;
            int i = this_$iv._size;
            for (int i$iv2 = 0; i$iv2 < i; i$iv2++) {
                Function0 it = (Function0) content$iv[i$iv2];
                it.invoke();
            }
            RectList this_$iv2 = this.rects;
            long[] items$iv = this_$iv2.items;
            int size$iv = this_$iv2.itemsSize;
            int i$iv3 = 0;
            while (i$iv3 < items$iv.length - 2 && i$iv3 < size$iv) {
                long meta$iv = items$iv[i$iv3 + 2];
                int $i$f$unpackMetaUpdated = ((int) (meta$iv >> 61)) & 1;
                if ($i$f$unpackMetaUpdated == 0) {
                    i$iv = i$iv3;
                } else {
                    long topLeft$iv = items$iv[i$iv3 + 0];
                    long bottomRight$iv = items$iv[i$iv3 + 1];
                    int $i$f$unpackMetaValue = ((int) meta$iv) & RectListKt.Lower26Bits;
                    i$iv = i$iv3;
                    this.throttledCallbacks.fireOnUpdatedRect($i$f$unpackMetaValue, topLeft$iv, bottomRight$iv, currentTime);
                }
                i$iv3 = i$iv + 3;
            }
            this.rects.clearUpdated();
        }
        if (this.isScreenOrWindowDirty) {
            this.isScreenOrWindowDirty = false;
            this.throttledCallbacks.fireOnRectChangedEntries(currentTime);
        }
        if (isDispatchGlobalCallbacks) {
            this.throttledCallbacks.fireGlobalChangeEntries(currentTime);
        }
        if (this.isFragmented) {
            this.isFragmented = false;
            this.rects.defragment();
        }
        this.throttledCallbacks.triggerDebounced(currentTime);
    }

    public final void scheduleDebounceCallback(boolean ensureSomethingScheduled) {
        boolean canExitEarly = (ensureSomethingScheduled && this.dispatchToken == null) ? false : true;
        long nextDeadline = this.throttledCallbacks.getMinDebounceDeadline();
        if (nextDeadline < 0 && canExitEarly) {
            return;
        }
        long currentScheduledDeadline = this.scheduledDispatchDeadline;
        if (currentScheduledDeadline == nextDeadline && canExitEarly) {
            return;
        }
        if (this.dispatchToken != null) {
            Actual_androidKt.removePost(this.dispatchToken);
        }
        long currentTime = Actual_androidKt.currentTimeMillis();
        long nextFrameIsh = 16 + currentTime;
        long deadline = Math.max(nextDeadline, nextFrameIsh);
        this.scheduledDispatchDeadline = deadline;
        long delay = deadline - currentTime;
        this.dispatchToken = Actual_androidKt.postDelayed(delay, this.dispatchLambda);
    }

    public final RelativeLayoutBounds currentRectInfo(int id, final DelegatableNode node) {
        final Ref.ObjectRef result = new Ref.ObjectRef();
        this.rects.withRect(id, new Function4<Integer, Integer, Integer, Integer, Unit>() { // from class: androidx.compose.ui.spatial.RectManager$currentRectInfo$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(4);
            }

            @Override // kotlin.jvm.functions.Function4
            public /* bridge */ /* synthetic */ Unit invoke(Integer num, Integer num2, Integer num3, Integer num4) {
                invoke(num.intValue(), num2.intValue(), num3.intValue(), num4.intValue());
                return Unit.INSTANCE;
            }

            /* JADX WARN: Type inference failed for: r2v1, types: [androidx.compose.ui.spatial.RelativeLayoutBounds, T] */
            public final void invoke(int l, int t, int r, int b) {
                ThrottledCallbacks throttledCallbacks;
                ThrottledCallbacks throttledCallbacks2;
                ThrottledCallbacks throttledCallbacks3;
                Ref.ObjectRef<RelativeLayoutBounds> objectRef = result;
                throttledCallbacks = this.throttledCallbacks;
                long m6140getWindowOffsetnOccac = throttledCallbacks.m6140getWindowOffsetnOccac();
                throttledCallbacks2 = this.throttledCallbacks;
                long m6138getScreenOffsetnOccac = throttledCallbacks2.m6138getScreenOffsetnOccac();
                throttledCallbacks3 = this.throttledCallbacks;
                objectRef.element = ThrottledCallbacksKt.m6146rectInfoForQMZNJw(node, (l << 32) | (t & 4294967295L), (r << 32) | (b & 4294967295L), m6140getWindowOffsetnOccac, m6138getScreenOffsetnOccac, throttledCallbacks3.m6139getViewToWindowMatrix3i98HWw());
            }
        });
        return (RelativeLayoutBounds) result.element;
    }

    public final Object registerOnChangedCallback(Function0<Unit> function0) {
        this.callbacks.add(function0);
        return function0;
    }

    public final DelegatableNode.RegistrationHandle registerOnRectChangedCallback(int id, long throttleMillis, long debounceMillis, DelegatableNode node, Function1<? super RelativeLayoutBounds, Unit> function1) {
        return this.throttledCallbacks.registerOnRectChanged(id, throttleMillis, debounceMillis, node, function1);
    }

    public final DelegatableNode.RegistrationHandle registerOnGlobalLayoutCallback(int id, long throttleMillis, long debounceMillis, DelegatableNode node, Function1<? super RelativeLayoutBounds, Unit> function1) {
        return this.throttledCallbacks.registerOnGlobalChange(id, throttleMillis, debounceMillis, node, function1);
    }

    public final void unregisterOnChangedCallback(Object token) {
        if ((TypeIntrinsics.isFunctionOfArity(token, 0) ? (Function0) token : null) == null) {
            return;
        }
        this.callbacks.remove(token);
    }

    public final void invalidateCallbacksFor(LayoutNode layoutNode) {
        this.isDirty = true;
        this.rects.markUpdated(layoutNode.getSemanticsId());
        scheduleDebounceCallback(true);
    }

    public final void onLayoutLayerPositionalPropertiesChanged(LayoutNode layoutNode) {
        boolean m6132isSetgyyYBs;
        if (ComposeUiFlags.isRectTrackingEnabled) {
            long outerToInnerOffset = m6125outerToInnerOffsetBjo55l4(layoutNode);
            m6132isSetgyyYBs = RectManagerKt.m6132isSetgyyYBs(outerToInnerOffset);
            if (m6132isSetgyyYBs) {
                layoutNode.m5820setOuterToInnerOffsetgyyYBs$ui_release(outerToInnerOffset);
                layoutNode.setOuterToInnerOffsetDirty$ui_release(false);
                MutableVector this_$iv$iv = layoutNode.get_children$ui_release();
                Object[] content$iv$iv = this_$iv$iv.content;
                int size$iv$iv = this_$iv$iv.getSize();
                for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                    LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
                    m6127onLayoutPositionChanged70tqf50(it, it.getOuterCoordinator$ui_release().mo5832getPositionnOccac(), false);
                }
                invalidateCallbacksFor(layoutNode);
                return;
            }
            insertOrUpdateTransformedNodeSubhierarchy(layoutNode);
        }
    }

    /* renamed from: onLayoutPositionChanged-70tqf50  reason: not valid java name */
    public final void m6127onLayoutPositionChanged70tqf50(LayoutNode layoutNode, long position, boolean firstPlacement) {
        boolean hasNonTranslationTransformations;
        long offset;
        boolean m6132isSetgyyYBs;
        boolean m6132isSetgyyYBs2;
        long parentOuterInnerOffset;
        boolean m6132isSetgyyYBs3;
        if (ComposeUiFlags.isRectTrackingEnabled) {
            MeasurePassDelegate delegate = layoutNode.getMeasurePassDelegate$ui_release();
            int width = delegate.getMeasuredWidth();
            int height = delegate.getMeasuredHeight();
            LayoutNode parent = layoutNode.getParent$ui_release();
            long lastOffset = layoutNode.m5812getOffsetFromRootnOccac$ui_release();
            long lastSize = layoutNode.m5811getLastSizeYbymL2g$ui_release();
            long offset2 = lastSize >> 32;
            int lastWidth = (int) offset2;
            int lastHeight = (int) (lastSize & 4294967295L);
            if (parent != null) {
                boolean parentOffsetDirty = parent.getOuterToInnerOffsetDirty$ui_release();
                long parentOffset = parent.m5812getOffsetFromRootnOccac$ui_release();
                long prevOuterToInnerOffset = parent.m5813getOuterToInnerOffsetnOccac$ui_release();
                m6132isSetgyyYBs2 = RectManagerKt.m6132isSetgyyYBs(parentOffset);
                if (m6132isSetgyyYBs2) {
                    if (parentOffsetDirty) {
                        long it = m6125outerToInnerOffsetBjo55l4(parent);
                        parent.m5820setOuterToInnerOffsetgyyYBs$ui_release(it);
                        parent.setOuterToInnerOffsetDirty$ui_release(false);
                        parentOuterInnerOffset = it;
                    } else {
                        parentOuterInnerOffset = prevOuterToInnerOffset;
                    }
                    m6132isSetgyyYBs3 = RectManagerKt.m6132isSetgyyYBs(parentOuterInnerOffset);
                    boolean hasNonTranslationTransformations2 = !m6132isSetgyyYBs3;
                    offset = IntOffset.m7005plusqkQi6aY(IntOffset.m7005plusqkQi6aY(parentOffset, parentOuterInnerOffset), position);
                    hasNonTranslationTransformations = hasNonTranslationTransformations2;
                } else {
                    hasNonTranslationTransformations = false;
                    offset = m6126positionInRootBjo55l4(layoutNode.getOuterCoordinator$ui_release());
                }
            } else {
                hasNonTranslationTransformations = false;
                offset = position;
            }
            if (!hasNonTranslationTransformations) {
                m6132isSetgyyYBs = RectManagerKt.m6132isSetgyyYBs(offset);
                if (m6132isSetgyyYBs) {
                    layoutNode.m5819setOffsetFromRootgyyYBs$ui_release(offset);
                    layoutNode.m5818setLastSizeozmzZPI$ui_release(IntSize.m7039constructorimpl((width << 32) | (height & 4294967295L)));
                    int l = IntOffset.m7001getXimpl(offset);
                    int t = IntOffset.m7002getYimpl(offset);
                    int r = l + width;
                    int b = t + height;
                    if (firstPlacement || !IntOffset.m7000equalsimpl0(offset, lastOffset) || lastWidth != width || lastHeight != height) {
                        insertOrUpdate(layoutNode, firstPlacement, l, t, r, b);
                        return;
                    }
                    return;
                }
            }
            m6124insertOrUpdateTransformedNode70tqf50(layoutNode, position, firstPlacement);
        }
    }

    private final void insertOrUpdateTransformedNodeSubhierarchy(LayoutNode layoutNode) {
        MutableVector this_$iv$iv = layoutNode.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            m6124insertOrUpdateTransformedNode70tqf50(it, it.getOuterCoordinator$ui_release().mo5832getPositionnOccac(), false);
            insertOrUpdateTransformedNodeSubhierarchy(it);
        }
    }

    /* renamed from: insertOrUpdateTransformedNode-70tqf50  reason: not valid java name */
    private final void m6124insertOrUpdateTransformedNode70tqf50(LayoutNode layoutNode, long position, boolean firstPlacement) {
        NodeCoordinator coord = layoutNode.getOuterCoordinator$ui_release();
        MeasurePassDelegate delegate = layoutNode.getMeasurePassDelegate$ui_release();
        int width = delegate.getMeasuredWidth();
        int height = delegate.getMeasuredHeight();
        MutableRect rect = this.cachedRect;
        rect.set(IntOffset.m7001getXimpl(position), IntOffset.m7002getYimpl(position), IntOffset.m7001getXimpl(position) + width, IntOffset.m7002getYimpl(position) + height);
        boundingRectInRoot(coord, rect);
        int l = (int) rect.getLeft();
        int t = (int) rect.getTop();
        int r = (int) rect.getRight();
        int b = (int) rect.getBottom();
        int id = layoutNode.getSemanticsId();
        if (firstPlacement || !this.rects.update(id, l, t, r, b)) {
            LayoutNode parent$ui_release = layoutNode.getParent$ui_release();
            int parentId = parent$ui_release != null ? parent$ui_release.getSemanticsId() : -1;
            this.rects.insert(id, l, t, r, b, (r20 & 32) != 0 ? -1 : parentId, (r20 & 64) != 0 ? false : false, (r20 & 128) != 0 ? false : false);
        }
        invalidate();
    }

    private final void insertOrUpdate(LayoutNode layoutNode, boolean firstPlacement, int l, int t, int r, int b) {
        int id = layoutNode.getSemanticsId();
        if (firstPlacement || !this.rects.move(id, l, t, r, b)) {
            LayoutNode parent$ui_release = layoutNode.getParent$ui_release();
            int parentId = parent$ui_release != null ? parent$ui_release.getSemanticsId() : -1;
            this.rects.insert(id, l, t, r, b, (r20 & 32) != 0 ? -1 : parentId, (r20 & 64) != 0 ? false : false, (r20 & 128) != 0 ? false : false);
        }
        invalidate();
    }

    /* renamed from: positionInRoot-Bjo55l4  reason: not valid java name */
    private final long m6126positionInRootBjo55l4(NodeCoordinator $this$positionInRoot_u2dBjo55l4) {
        int analysis;
        long position = Offset.Companion.m4064getZeroF1C5BW0();
        NodeCoordinator coordinator = $this$positionInRoot_u2dBjo55l4;
        while (coordinator != null) {
            OwnedLayer layer = coordinator.getLayer();
            position = IntOffsetKt.m7016plusNvtHpc(position, coordinator.mo5832getPositionnOccac());
            coordinator = coordinator.getWrappedBy$ui_release();
            if (layer != null) {
                float[] matrix = layer.mo5949getUnderlyingMatrixsQKQjiQ();
                analysis = RectManagerKt.m6131analyzeComponents58bKbWc(matrix);
                if (analysis == 3) {
                    continue;
                } else {
                    boolean hasNonTranslationComponents = (analysis & 2) == 0;
                    if (hasNonTranslationComponents) {
                        return IntOffset.Companion.m7011getMaxnOccac();
                    }
                    position = Matrix.m4525mapMKHz9U(matrix, position);
                }
            }
        }
        return IntOffsetKt.m7018roundk4lQ0M(position);
    }

    private final void boundingRectInRoot(NodeCoordinator $this$boundingRectInRoot, MutableRect rect) {
        NodeCoordinator coordinator = $this$boundingRectInRoot;
        while (coordinator != null) {
            OwnedLayer layer = coordinator.getLayer();
            long $this$toOffset_u2d_u2dgyyYBs$iv = coordinator.mo5832getPositionnOccac();
            float x$iv$iv = IntOffset.m7001getXimpl($this$toOffset_u2d_u2dgyyYBs$iv);
            float y$iv$iv = IntOffset.m7002getYimpl($this$toOffset_u2d_u2dgyyYBs$iv);
            long v1$iv$iv$iv = Float.floatToRawIntBits(x$iv$iv);
            long v2$iv$iv$iv = Float.floatToRawIntBits(y$iv$iv);
            rect.m4033translatek4lQ0M(Offset.m4040constructorimpl((v1$iv$iv$iv << 32) | (v2$iv$iv$iv & 4294967295L)));
            coordinator = coordinator.getWrappedBy$ui_release();
            if (layer != null) {
                float[] matrix = layer.mo5949getUnderlyingMatrixsQKQjiQ();
                if (!MatrixKt.m4544isIdentity58bKbWc(matrix)) {
                    Matrix.m4527mapimpl(matrix, rect);
                }
            }
        }
    }

    /* renamed from: outerToInnerOffset-Bjo55l4  reason: not valid java name */
    private final long m6125outerToInnerOffsetBjo55l4(LayoutNode $this$outerToInnerOffset_u2dBjo55l4) {
        int analysis;
        NodeCoordinator terminator = $this$outerToInnerOffset_u2dBjo55l4.getOuterCoordinator$ui_release();
        long position = Offset.Companion.m4064getZeroF1C5BW0();
        NodeCoordinator coordinator = $this$outerToInnerOffset_u2dBjo55l4.getInnerCoordinator$ui_release();
        while (coordinator != null && coordinator != terminator) {
            OwnedLayer layer = coordinator.getLayer();
            position = IntOffsetKt.m7016plusNvtHpc(position, coordinator.mo5832getPositionnOccac());
            coordinator = coordinator.getWrappedBy$ui_release();
            if (layer != null) {
                float[] matrix = layer.mo5949getUnderlyingMatrixsQKQjiQ();
                analysis = RectManagerKt.m6131analyzeComponents58bKbWc(matrix);
                int $this$isIdentity$iv = analysis == 3 ? 1 : 0;
                if ($this$isIdentity$iv != 0) {
                    continue;
                } else {
                    if ((analysis & 2) == 0) {
                        return IntOffset.Companion.m7011getMaxnOccac();
                    }
                    position = Matrix.m4525mapMKHz9U(matrix, position);
                }
            }
        }
        return IntOffsetKt.m7018roundk4lQ0M(position);
    }

    public final void remove(LayoutNode layoutNode) {
        this.rects.remove(layoutNode.getSemanticsId());
        invalidate();
        this.isFragmented = true;
    }

    public final boolean isTargetDrawnFirst$ui_release(int targetId, int otherId) {
        LayoutNode nodeB;
        LayoutNode nodeA = this.layoutNodes.get(targetId);
        if (nodeA == null || (nodeB = this.layoutNodes.get(otherId)) == null || nodeA.getDepth$ui_release() == 0 || nodeB.getDepth$ui_release() == 0) {
            return false;
        }
        while (nodeA.getDepth$ui_release() > nodeB.getDepth$ui_release()) {
            LayoutNode parent$ui_release = nodeA.getParent$ui_release();
            if (parent$ui_release == null) {
                return false;
            }
            nodeA = parent$ui_release;
        }
        if (nodeA == nodeB) {
            return false;
        }
        while (nodeB.getDepth$ui_release() > nodeA.getDepth$ui_release()) {
            LayoutNode parent$ui_release2 = nodeB.getParent$ui_release();
            if (parent$ui_release2 == null) {
                return false;
            }
            nodeB = parent$ui_release2;
        }
        if (nodeA == nodeB) {
            return false;
        }
        LayoutNode lastParentA = nodeA;
        LayoutNode lastParentB = nodeB;
        while (nodeA != nodeB) {
            lastParentA = nodeA;
            lastParentB = nodeB;
            LayoutNode parent$ui_release3 = nodeA.getParent$ui_release();
            if (parent$ui_release3 == null) {
                return false;
            }
            nodeA = parent$ui_release3;
            LayoutNode parent$ui_release4 = nodeB.getParent$ui_release();
            if (parent$ui_release4 == null) {
                return false;
            }
            nodeB = parent$ui_release4;
        }
        return (lastParentA.getMeasurePassDelegate$ui_release().getZIndex$ui_release() > lastParentB.getMeasurePassDelegate$ui_release().getZIndex$ui_release() ? 1 : (lastParentA.getMeasurePassDelegate$ui_release().getZIndex$ui_release() == lastParentB.getMeasurePassDelegate$ui_release().getZIndex$ui_release() ? 0 : -1)) == 0 ? lastParentA.getPlaceOrder$ui_release() < lastParentB.getPlaceOrder$ui_release() : lastParentA.getMeasurePassDelegate$ui_release().getZIndex$ui_release() < lastParentB.getMeasurePassDelegate$ui_release().getZIndex$ui_release();
    }
}
