package androidx.compose.foundation.gestures;

import androidx.compose.foundation.MutatePriority;
import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.nestedscroll.NestedScrollDispatcher;
import androidx.compose.ui.input.nestedscroll.NestedScrollSource;
import androidx.compose.ui.unit.Velocity;
import androidx.compose.ui.unit.VelocityKt;
import com.itextpdf.kernel.xmp.PdfConst;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Scrollable.kt */
@Metadata(d1 = {"\u0000\u0089\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u001a*\u0001\u0018\b\u0000\u0018\u00002\u00020\u0001BE\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\r\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000b0\u000f¢\u0006\u0002\u0010\u0010J\u001a\u0010%\u001a\u00020\u001e2\u0006\u0010&\u001a\u00020\u001eH\u0002ø\u0001\u0000¢\u0006\u0004\b'\u0010(J\u001b\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020*H\u0086@ø\u0001\u0000¢\u0006\u0004\b,\u0010-J\u0006\u0010.\u001a\u00020\u000bJ#\u0010/\u001a\u0002002\u0006\u00101\u001a\u00020*2\u0006\u00102\u001a\u00020\u000bH\u0086@ø\u0001\u0000¢\u0006\u0004\b3\u00104J\u0018\u00105\u001a\u00020\u001e2\u0006\u0010&\u001a\u00020\u001eø\u0001\u0000¢\u0006\u0004\b6\u0010(JA\u0010&\u001a\u0002002\b\b\u0002\u00107\u001a\u0002082'\u00109\u001a#\b\u0001\u0012\u0004\u0012\u00020;\u0012\n\u0012\b\u0012\u0004\u0012\u0002000<\u0012\u0006\u0012\u0004\u0018\u00010\u00010:¢\u0006\u0002\b=H\u0086@¢\u0006\u0002\u0010>J\u0010\u0010?\u001a\u00020\u000b2\u0006\u0010@\u001a\u00020AH\u0002J\u0006\u0010B\u001a\u00020\u000bJ8\u0010C\u001a\u00020\u000b2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\b\u001a\u00020\t2\b\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\f\u001a\u00020\rJ&\u0010D\u001a\u00020\u001e*\u00020\u001b2\u0006\u0010E\u001a\u00020\u001e2\u0006\u0010F\u001a\u00020\u0015H\u0002ø\u0001\u0000¢\u0006\u0004\bG\u0010HJ\u0014\u0010I\u001a\u00020\u001e*\u00020\u001eø\u0001\u0000¢\u0006\u0004\bJ\u0010(J\n\u0010I\u001a\u00020A*\u00020AJ\u0014\u0010K\u001a\u00020\u001e*\u00020\u001eø\u0001\u0000¢\u0006\u0004\bL\u0010(J\u0016\u0010M\u001a\u00020**\u00020*H\u0002ø\u0001\u0000¢\u0006\u0004\bN\u0010(J\u0014\u0010O\u001a\u00020A*\u00020\u001eø\u0001\u0000¢\u0006\u0004\bP\u0010QJ\u0016\u0010O\u001a\u00020A*\u00020*H\u0002ø\u0001\u0000¢\u0006\u0004\bR\u0010QJ\u0017\u0010S\u001a\u00020\u001e*\u00020Aø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bT\u0010UJ\u0017\u0010V\u001a\u00020**\u00020Aø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bW\u0010UJ\u001e\u0010C\u001a\u00020**\u00020*2\u0006\u0010X\u001a\u00020AH\u0002ø\u0001\u0000¢\u0006\u0004\bY\u0010ZR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u000b@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000b0\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0014\u001a\u00020\u0015X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0016R\u000e\u0010\f\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0017\u001a\u00020\u0018X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0019R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u000e\u0012\u0004\u0012\u00020\u001e\u0012\u0004\u0012\u00020\u001e0\u001dX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001f\u0010 \"\u0004\b!\u0010\"R\u0014\u0010#\u001a\u00020\u000b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b$\u0010\u0013\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006["}, d2 = {"Landroidx/compose/foundation/gestures/ScrollingLogic;", "", "scrollableState", "Landroidx/compose/foundation/gestures/ScrollableState;", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "reverseDirection", "", "nestedScrollDispatcher", "Landroidx/compose/ui/input/nestedscroll/NestedScrollDispatcher;", "isScrollableNodeAttached", "Lkotlin/Function0;", "(Landroidx/compose/foundation/gestures/ScrollableState;Landroidx/compose/foundation/OverscrollEffect;Landroidx/compose/foundation/gestures/FlingBehavior;Landroidx/compose/foundation/gestures/Orientation;ZLandroidx/compose/ui/input/nestedscroll/NestedScrollDispatcher;Lkotlin/jvm/functions/Function0;)V", "<set-?>", "isFlinging", "()Z", "latestScrollSource", "Landroidx/compose/ui/input/nestedscroll/NestedScrollSource;", "I", "nestedScrollScope", "androidx/compose/foundation/gestures/ScrollingLogic$nestedScrollScope$1", "Landroidx/compose/foundation/gestures/ScrollingLogic$nestedScrollScope$1;", "outerStateScope", "Landroidx/compose/foundation/gestures/ScrollScope;", "performScrollForOverscroll", "Lkotlin/Function1;", "Landroidx/compose/ui/geometry/Offset;", "getScrollableState", "()Landroidx/compose/foundation/gestures/ScrollableState;", "setScrollableState", "(Landroidx/compose/foundation/gestures/ScrollableState;)V", "shouldDispatchOverscroll", "getShouldDispatchOverscroll", "dispatchRawDelta", "scroll", "dispatchRawDelta-MK-Hz9U", "(J)J", "doFlingAnimation", "Landroidx/compose/ui/unit/Velocity;", "available", "doFlingAnimation-QWom1Mo", "(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "isVertical", "onScrollStopped", "", "initialVelocity", "isMouseWheel", "onScrollStopped-BMRW4eQ", "(JZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "performRawScroll", "performRawScroll-MK-Hz9U", "scrollPriority", "Landroidx/compose/foundation/MutatePriority;", "block", "Lkotlin/Function2;", "Landroidx/compose/foundation/gestures/NestedScrollScope;", "Lkotlin/coroutines/Continuation;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/foundation/MutatePriority;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "shouldCancelFling", "pixels", "", "shouldScrollImmediately", "update", "performScroll", "delta", PdfConst.Source, "performScroll-3eAAhYA", "(Landroidx/compose/foundation/gestures/ScrollScope;JI)J", "reverseIfNeeded", "reverseIfNeeded-MK-Hz9U", "singleAxisOffset", "singleAxisOffset-MK-Hz9U", "singleAxisVelocity", "singleAxisVelocity-AH228Gc", "toFloat", "toFloat-k-4lQ0M", "(J)F", "toFloat-TH1AsA0", "toOffset", "toOffset-tuRUvjQ", "(F)J", "toVelocity", "toVelocity-adjELrA", "newValue", "update-QWom1Mo", "(JF)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ScrollingLogic {
    public static final int $stable = 8;
    private FlingBehavior flingBehavior;
    private boolean isFlinging;
    private final Function0<Boolean> isScrollableNodeAttached;
    private NestedScrollDispatcher nestedScrollDispatcher;
    private Orientation orientation;
    private OverscrollEffect overscrollEffect;
    private boolean reverseDirection;
    private ScrollableState scrollableState;
    private int latestScrollSource = NestedScrollSource.Companion.m5405getUserInputWNlRxjI();
    private ScrollScope outerStateScope = ScrollableKt.access$getNoOpScrollScope$p();
    private final ScrollingLogic$nestedScrollScope$1 nestedScrollScope = new NestedScrollScope() { // from class: androidx.compose.foundation.gestures.ScrollingLogic$nestedScrollScope$1
        @Override // androidx.compose.foundation.gestures.NestedScrollScope
        /* renamed from: scrollBy-OzD1aCk */
        public long mo736scrollByOzD1aCk(long offset, int source) {
            ScrollScope $this$scrollBy_OzD1aCk_u24lambda_u240;
            long m773performScroll3eAAhYA;
            $this$scrollBy_OzD1aCk_u24lambda_u240 = ScrollingLogic.this.outerStateScope;
            m773performScroll3eAAhYA = ScrollingLogic.this.m773performScroll3eAAhYA($this$scrollBy_OzD1aCk_u24lambda_u240, offset, source);
            return m773performScroll3eAAhYA;
        }

        @Override // androidx.compose.foundation.gestures.NestedScrollScope
        /* renamed from: scrollByWithOverscroll-OzD1aCk */
        public long mo737scrollByWithOverscrollOzD1aCk(long offset, int source) {
            OverscrollEffect overscroll;
            ScrollScope $this$scrollByWithOverscroll_OzD1aCk_u24lambda_u241;
            long m773performScroll3eAAhYA;
            boolean shouldDispatchOverscroll;
            int i;
            Function1<? super Offset, Offset> function1;
            ScrollingLogic.this.latestScrollSource = source;
            overscroll = ScrollingLogic.this.overscrollEffect;
            if (overscroll != null) {
                shouldDispatchOverscroll = ScrollingLogic.this.getShouldDispatchOverscroll();
                if (shouldDispatchOverscroll) {
                    i = ScrollingLogic.this.latestScrollSource;
                    function1 = ScrollingLogic.this.performScrollForOverscroll;
                    return overscroll.mo481applyToScrollRhakbz0(offset, i, function1);
                }
            }
            $this$scrollByWithOverscroll_OzD1aCk_u24lambda_u241 = ScrollingLogic.this.outerStateScope;
            m773performScroll3eAAhYA = ScrollingLogic.this.m773performScroll3eAAhYA($this$scrollByWithOverscroll_OzD1aCk_u24lambda_u241, offset, source);
            return m773performScroll3eAAhYA;
        }
    };
    private final Function1<Offset, Offset> performScrollForOverscroll = new Function1<Offset, Offset>() { // from class: androidx.compose.foundation.gestures.ScrollingLogic$performScrollForOverscroll$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Offset invoke(Offset offset) {
            return Offset.m4037boximpl(m786invokeMKHz9U(offset.m4058unboximpl()));
        }

        /* renamed from: invoke-MK-Hz9U  reason: not valid java name */
        public final long m786invokeMKHz9U(long delta) {
            ScrollScope $this$invoke_MK_Hz9U_u24lambda_u240;
            int i;
            long m773performScroll3eAAhYA;
            $this$invoke_MK_Hz9U_u24lambda_u240 = ScrollingLogic.this.outerStateScope;
            ScrollingLogic scrollingLogic = ScrollingLogic.this;
            i = scrollingLogic.latestScrollSource;
            m773performScroll3eAAhYA = scrollingLogic.m773performScroll3eAAhYA($this$invoke_MK_Hz9U_u24lambda_u240, delta, i);
            return m773performScroll3eAAhYA;
        }
    };

    /* JADX WARN: Type inference failed for: r0v3, types: [androidx.compose.foundation.gestures.ScrollingLogic$nestedScrollScope$1] */
    public ScrollingLogic(ScrollableState scrollableState, OverscrollEffect overscrollEffect, FlingBehavior flingBehavior, Orientation orientation, boolean reverseDirection, NestedScrollDispatcher nestedScrollDispatcher, Function0<Boolean> function0) {
        this.scrollableState = scrollableState;
        this.overscrollEffect = overscrollEffect;
        this.flingBehavior = flingBehavior;
        this.orientation = orientation;
        this.reverseDirection = reverseDirection;
        this.nestedScrollDispatcher = nestedScrollDispatcher;
        this.isScrollableNodeAttached = function0;
    }

    public final ScrollableState getScrollableState() {
        return this.scrollableState;
    }

    public final void setScrollableState(ScrollableState scrollableState) {
        this.scrollableState = scrollableState;
    }

    public final boolean isFlinging() {
        return this.isFlinging;
    }

    /* renamed from: toOffset-tuRUvjQ  reason: not valid java name */
    public final long m783toOffsettuRUvjQ(float $this$toOffset_u2dtuRUvjQ) {
        if ($this$toOffset_u2dtuRUvjQ == 0.0f) {
            return Offset.Companion.m4064getZeroF1C5BW0();
        }
        if (this.orientation == Orientation.Horizontal) {
            long v1$iv$iv = Float.floatToRawIntBits($this$toOffset_u2dtuRUvjQ);
            long v2$iv$iv = Float.floatToRawIntBits(0.0f);
            return Offset.m4040constructorimpl((4294967295L & v2$iv$iv) | (v1$iv$iv << 32));
        }
        long v1$iv$iv2 = Float.floatToRawIntBits(0.0f);
        long v2$iv$iv2 = Float.floatToRawIntBits($this$toOffset_u2dtuRUvjQ);
        return Offset.m4040constructorimpl((4294967295L & v2$iv$iv2) | (v1$iv$iv2 << 32));
    }

    /* renamed from: singleAxisOffset-MK-Hz9U  reason: not valid java name */
    public final long m781singleAxisOffsetMKHz9U(long $this$singleAxisOffset_u2dMK_u2dHz9U) {
        return this.orientation == Orientation.Horizontal ? Offset.m4042copydBAh8RU$default($this$singleAxisOffset_u2dMK_u2dHz9U, 0.0f, 0.0f, 1, null) : Offset.m4042copydBAh8RU$default($this$singleAxisOffset_u2dMK_u2dHz9U, 0.0f, 0.0f, 2, null);
    }

    /* renamed from: toFloat-k-4lQ0M  reason: not valid java name */
    public final float m782toFloatk4lQ0M(long $this$toFloat_u2dk_u2d4lQ0M) {
        if (this.orientation == Orientation.Horizontal) {
            int bits$iv$iv$iv = (int) ($this$toFloat_u2dk_u2d4lQ0M >> 32);
            return Float.intBitsToFloat(bits$iv$iv$iv);
        }
        int bits$iv$iv$iv2 = (int) (4294967295L & $this$toFloat_u2dk_u2d4lQ0M);
        return Float.intBitsToFloat(bits$iv$iv$iv2);
    }

    /* renamed from: toVelocity-adjELrA  reason: not valid java name */
    public final long m784toVelocityadjELrA(float $this$toVelocity_u2dadjELrA) {
        if ($this$toVelocity_u2dadjELrA == 0.0f) {
            return Velocity.Companion.m7122getZero9UxMQ8M();
        }
        if (this.orientation == Orientation.Horizontal) {
            return VelocityKt.Velocity($this$toVelocity_u2dadjELrA, 0.0f);
        }
        return VelocityKt.Velocity(0.0f, $this$toVelocity_u2dadjELrA);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toFloat-TH1AsA0  reason: not valid java name */
    public final float m775toFloatTH1AsA0(long $this$toFloat_u2dTH1AsA0) {
        return this.orientation == Orientation.Horizontal ? Velocity.m7111getXimpl($this$toFloat_u2dTH1AsA0) : Velocity.m7112getYimpl($this$toFloat_u2dTH1AsA0);
    }

    /* renamed from: singleAxisVelocity-AH228Gc  reason: not valid java name */
    private final long m774singleAxisVelocityAH228Gc(long $this$singleAxisVelocity_u2dAH228Gc) {
        return this.orientation == Orientation.Horizontal ? Velocity.m7107copyOhffZ5M$default($this$singleAxisVelocity_u2dAH228Gc, 0.0f, 0.0f, 1, null) : Velocity.m7107copyOhffZ5M$default($this$singleAxisVelocity_u2dAH228Gc, 0.0f, 0.0f, 2, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: update-QWom1Mo  reason: not valid java name */
    public final long m776updateQWom1Mo(long $this$update_u2dQWom1Mo, float newValue) {
        return this.orientation == Orientation.Horizontal ? Velocity.m7107copyOhffZ5M$default($this$update_u2dQWom1Mo, newValue, 0.0f, 2, null) : Velocity.m7107copyOhffZ5M$default($this$update_u2dQWom1Mo, 0.0f, newValue, 1, null);
    }

    public final float reverseIfNeeded(float $this$reverseIfNeeded) {
        return this.reverseDirection ? (-1.0f) * $this$reverseIfNeeded : $this$reverseIfNeeded;
    }

    /* renamed from: reverseIfNeeded-MK-Hz9U  reason: not valid java name */
    public final long m780reverseIfNeededMKHz9U(long $this$reverseIfNeeded_u2dMK_u2dHz9U) {
        return this.reverseDirection ? Offset.m4055timestuRUvjQ($this$reverseIfNeeded_u2dMK_u2dHz9U, -1.0f) : $this$reverseIfNeeded_u2dMK_u2dHz9U;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: performScroll-3eAAhYA  reason: not valid java name */
    public final long m773performScroll3eAAhYA(ScrollScope $this$performScroll_u2d3eAAhYA, long delta, int source) {
        long consumedByPreScroll = this.nestedScrollDispatcher.m5389dispatchPreScrollOzD1aCk(delta, source);
        long scrollAvailableAfterPreScroll = Offset.m4052minusMKHz9U(delta, consumedByPreScroll);
        float singleAxisDeltaForSelfScroll = m782toFloatk4lQ0M(m780reverseIfNeededMKHz9U(m781singleAxisOffsetMKHz9U(scrollAvailableAfterPreScroll)));
        long consumedBySelfScroll = m780reverseIfNeededMKHz9U(m783toOffsettuRUvjQ($this$performScroll_u2d3eAAhYA.scrollBy(singleAxisDeltaForSelfScroll)));
        long deltaAvailableAfterScroll = Offset.m4052minusMKHz9U(scrollAvailableAfterPreScroll, consumedBySelfScroll);
        long consumedByPostScroll = this.nestedScrollDispatcher.m5387dispatchPostScrollDzOQY0M(consumedBySelfScroll, deltaAvailableAfterScroll, source);
        return Offset.m4053plusMKHz9U(Offset.m4053plusMKHz9U(consumedByPreScroll, consumedBySelfScroll), consumedByPostScroll);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean getShouldDispatchOverscroll() {
        return this.scrollableState.getCanScrollForward() || this.scrollableState.getCanScrollBackward();
    }

    /* renamed from: performRawScroll-MK-Hz9U  reason: not valid java name */
    public final long m779performRawScrollMKHz9U(long scroll) {
        if (this.scrollableState.isScrollInProgress()) {
            return Offset.Companion.m4064getZeroF1C5BW0();
        }
        return m772dispatchRawDeltaMKHz9U(scroll);
    }

    /* renamed from: dispatchRawDelta-MK-Hz9U  reason: not valid java name */
    private final long m772dispatchRawDeltaMKHz9U(long scroll) {
        return m783toOffsettuRUvjQ(reverseIfNeeded(this.scrollableState.dispatchRawDelta(reverseIfNeeded(m782toFloatk4lQ0M(scroll)))));
    }

    /* renamed from: onScrollStopped-BMRW4eQ  reason: not valid java name */
    public final Object m778onScrollStoppedBMRW4eQ(long initialVelocity, boolean isMouseWheel, Continuation<? super Unit> continuation) {
        if (isMouseWheel && !ScrollableKt.access$getShouldBeTriggeredByMouseWheel(this.flingBehavior)) {
            return Unit.INSTANCE;
        }
        long availableVelocity = m774singleAxisVelocityAH228Gc(initialVelocity);
        Function2 performFling = new ScrollingLogic$onScrollStopped$performFling$1(this, null);
        OverscrollEffect overscroll = this.overscrollEffect;
        if (overscroll != null && getShouldDispatchOverscroll()) {
            Object mo480applyToFlingBMRW4eQ = overscroll.mo480applyToFlingBMRW4eQ(availableVelocity, performFling, continuation);
            return mo480applyToFlingBMRW4eQ == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? mo480applyToFlingBMRW4eQ : Unit.INSTANCE;
        }
        Object invoke = performFling.invoke(Velocity.m7102boximpl(availableVelocity), continuation);
        return invoke == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? invoke : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean shouldCancelFling(float pixels) {
        return (pixels > 0.0f && !this.scrollableState.getCanScrollForward()) || (pixels < 0.0f && !this.scrollableState.getCanScrollBackward()) || !this.isScrollableNodeAttached.invoke().booleanValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0039  */
    /* renamed from: doFlingAnimation-QWom1Mo  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m777doFlingAnimationQWom1Mo(long r10, kotlin.coroutines.Continuation<? super androidx.compose.ui.unit.Velocity> r12) {
        /*
            r9 = this;
            boolean r0 = r12 instanceof androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$1
            if (r0 == 0) goto L14
            r0 = r12
            androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$1 r0 = (androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$1 r0 = new androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$1
            r0.<init>(r9, r12)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L39;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            r10.<init>(r11)
            throw r10
        L2d:
            java.lang.Object r10 = r0.L$1
            kotlin.jvm.internal.Ref$LongRef r10 = (kotlin.jvm.internal.Ref.LongRef) r10
            java.lang.Object r11 = r0.L$0
            androidx.compose.foundation.gestures.ScrollingLogic r11 = (androidx.compose.foundation.gestures.ScrollingLogic) r11
            kotlin.ResultKt.throwOnFailure(r1)
            goto L61
        L39:
            kotlin.ResultKt.throwOnFailure(r1)
            r4 = r9
            r6 = r10
            kotlin.jvm.internal.Ref$LongRef r5 = new kotlin.jvm.internal.Ref$LongRef
            r5.<init>()
            r5.element = r6
            r10 = 1
            r4.isFlinging = r10
            androidx.compose.foundation.MutatePriority r11 = androidx.compose.foundation.MutatePriority.Default
            androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$2 r3 = new androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$2
            r8 = 0
            r3.<init>(r4, r5, r6, r8)
            kotlin.jvm.functions.Function2 r3 = (kotlin.jvm.functions.Function2) r3
            r0.L$0 = r4
            r0.L$1 = r5
            r0.label = r10
            java.lang.Object r10 = r4.scroll(r11, r3, r0)
            if (r10 != r2) goto L5f
            return r2
        L5f:
            r11 = r4
            r10 = r5
        L61:
            r2 = 0
            r11.isFlinging = r2
            long r2 = r10.element
            androidx.compose.ui.unit.Velocity r2 = androidx.compose.ui.unit.Velocity.m7102boximpl(r2)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.ScrollingLogic.m777doFlingAnimationQWom1Mo(long, kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final boolean shouldScrollImmediately() {
        if (!this.scrollableState.isScrollInProgress()) {
            OverscrollEffect overscrollEffect = this.overscrollEffect;
            if (!(overscrollEffect != null ? overscrollEffect.isInProgress() : false)) {
                return false;
            }
        }
        return true;
    }

    public static /* synthetic */ Object scroll$default(ScrollingLogic scrollingLogic, MutatePriority mutatePriority, Function2 function2, Continuation continuation, int i, Object obj) {
        if ((i & 1) != 0) {
            mutatePriority = MutatePriority.Default;
        }
        return scrollingLogic.scroll(mutatePriority, function2, continuation);
    }

    public final Object scroll(MutatePriority scrollPriority, Function2<? super NestedScrollScope, ? super Continuation<? super Unit>, ? extends Object> function2, Continuation<? super Unit> continuation) {
        Object scroll = this.scrollableState.scroll(scrollPriority, new ScrollingLogic$scroll$2(this, function2, null), continuation);
        return scroll == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? scroll : Unit.INSTANCE;
    }

    public final boolean update(ScrollableState scrollableState, Orientation orientation, OverscrollEffect overscrollEffect, boolean reverseDirection, FlingBehavior flingBehavior, NestedScrollDispatcher nestedScrollDispatcher) {
        boolean resetPointerInputHandling = false;
        if (!Intrinsics.areEqual(this.scrollableState, scrollableState)) {
            this.scrollableState = scrollableState;
            resetPointerInputHandling = true;
        }
        this.overscrollEffect = overscrollEffect;
        if (this.orientation != orientation) {
            this.orientation = orientation;
            resetPointerInputHandling = true;
        }
        if (this.reverseDirection != reverseDirection) {
            this.reverseDirection = reverseDirection;
            resetPointerInputHandling = true;
        }
        this.flingBehavior = flingBehavior;
        this.nestedScrollDispatcher = nestedScrollDispatcher;
        return resetPointerInputHandling;
    }

    public final boolean isVertical() {
        return this.orientation == Orientation.Vertical;
    }
}
