package androidx.compose.foundation;

import android.content.Context;
import android.os.Build;
import android.widget.EdgeEffect;
import androidx.compose.foundation.gestures.ForEachGestureKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.geometry.SizeKt;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.input.pointer.AwaitPointerEventScope;
import androidx.compose.ui.input.pointer.PointerId;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import androidx.compose.ui.input.pointer.SuspendingPointerInputModifierNode;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntSize;
import com.itextpdf.kernel.xmp.PdfConst;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.math.MathKt;
/* compiled from: AndroidOverscroll.android.kt */
@Metadata(d1 = {"\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0007\n\u0002\b\u0011\b\u0000\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\b\u0010)\u001a\u00020%H\u0002J?\u0010*\u001a\u00020%2\u0006\u0010+\u001a\u00020,2\"\u0010-\u001a\u001e\b\u0001\u0012\u0004\u0012\u00020,\u0012\n\u0012\b\u0012\u0004\u0012\u00020,0/\u0012\u0006\u0012\u0004\u0018\u0001000.H\u0096@ø\u0001\u0000¢\u0006\u0004\b1\u00102J6\u00103\u001a\u00020\"2\u0006\u00104\u001a\u00020\"2\u0006\u00105\u001a\u0002062\u0012\u00107\u001a\u000e\u0012\u0004\u0012\u00020\"\u0012\u0004\u0012\u00020\"08H\u0016ø\u0001\u0000¢\u0006\u0004\b9\u0010:J\u0015\u0010;\u001a\u00020\"H\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b<\u0010=J\r\u0010>\u001a\u00020%H\u0000¢\u0006\u0002\b?J\u001a\u0010@\u001a\u00020A2\u0006\u0010B\u001a\u00020\"H\u0002ø\u0001\u0000¢\u0006\u0004\bC\u0010DJ\u001a\u0010E\u001a\u00020A2\u0006\u0010B\u001a\u00020\"H\u0002ø\u0001\u0000¢\u0006\u0004\bF\u0010DJ\u001a\u0010G\u001a\u00020A2\u0006\u0010B\u001a\u00020\"H\u0002ø\u0001\u0000¢\u0006\u0004\bH\u0010DJ\u001a\u0010I\u001a\u00020A2\u0006\u0010B\u001a\u00020\"H\u0002ø\u0001\u0000¢\u0006\u0004\bJ\u0010DJ\u001a\u0010K\u001a\u00020\u00112\u0006\u00104\u001a\u00020\"H\u0002ø\u0001\u0000¢\u0006\u0004\bL\u0010MJ\u001a\u0010N\u001a\u00020%2\u0006\u0010O\u001a\u00020\fH\u0000ø\u0001\u0000¢\u0006\u0004\bP\u0010QR\u0016\u0010\u000b\u001a\u00020\fX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\rR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\u0010\u001a\u00020\u00118\u0000@\u0000X\u0081\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u0014\u0010\u0018\u001a\u00020\u00118VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0015R\u0014\u0010\u0019\u001a\u00020\u001aX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001cR\u0016\u0010\u001d\u001a\u00020\u001eX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\rR\u000e\u0010\u001f\u001a\u00020 X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010!\u001a\u00020\"X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\rR\u001a\u0010#\u001a\b\u0012\u0004\u0012\u00020%0$X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b&\u0010'R\u000e\u0010(\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006R"}, d2 = {"Landroidx/compose/foundation/AndroidEdgeEffectOverscrollEffect;", "Landroidx/compose/foundation/OverscrollEffect;", "context", "Landroid/content/Context;", "density", "Landroidx/compose/ui/unit/Density;", "glowColor", "Landroidx/compose/ui/graphics/Color;", "glowDrawPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "(Landroid/content/Context;Landroidx/compose/ui/unit/Density;JLandroidx/compose/foundation/layout/PaddingValues;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "containerSize", "Landroidx/compose/ui/geometry/Size;", "J", "edgeEffectWrapper", "Landroidx/compose/foundation/EdgeEffectWrapper;", "invalidationEnabled", "", "getInvalidationEnabled$foundation_release$annotations", "()V", "getInvalidationEnabled$foundation_release", "()Z", "setInvalidationEnabled$foundation_release", "(Z)V", "isInProgress", "node", "Landroidx/compose/ui/node/DelegatableNode;", "getNode", "()Landroidx/compose/ui/node/DelegatableNode;", "pointerId", "Landroidx/compose/ui/input/pointer/PointerId;", "pointerInputNode", "Landroidx/compose/ui/input/pointer/SuspendingPointerInputModifierNode;", "pointerPosition", "Landroidx/compose/ui/geometry/Offset;", "redrawSignal", "Landroidx/compose/runtime/MutableState;", "", "getRedrawSignal$foundation_release", "()Landroidx/compose/runtime/MutableState;", "scrollCycleInProgress", "animateToReleaseIfNeeded", "applyToFling", "velocity", "Landroidx/compose/ui/unit/Velocity;", "performFling", "Lkotlin/Function2;", "Lkotlin/coroutines/Continuation;", "", "applyToFling-BMRW4eQ", "(JLkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "applyToScroll", "delta", PdfConst.Source, "Landroidx/compose/ui/input/nestedscroll/NestedScrollSource;", "performScroll", "Lkotlin/Function1;", "applyToScroll-Rhakbz0", "(JILkotlin/jvm/functions/Function1;)J", "displacement", "displacement-F1C5BW0$foundation_release", "()J", "invalidateOverscroll", "invalidateOverscroll$foundation_release", "pullBottom", "", "scroll", "pullBottom-k-4lQ0M", "(J)F", "pullLeft", "pullLeft-k-4lQ0M", "pullRight", "pullRight-k-4lQ0M", "pullTop", "pullTop-k-4lQ0M", "releaseOppositeOverscroll", "releaseOppositeOverscroll-k-4lQ0M", "(J)Z", "updateSize", "size", "updateSize-uvyYCjk$foundation_release", "(J)V", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AndroidEdgeEffectOverscrollEffect implements OverscrollEffect {
    public static final int $stable = 0;
    private long containerSize;
    private final Density density;
    private final EdgeEffectWrapper edgeEffectWrapper;
    private boolean invalidationEnabled;
    private final DelegatableNode node;
    private long pointerId;
    private final SuspendingPointerInputModifierNode pointerInputNode;
    private long pointerPosition;
    private final MutableState<Unit> redrawSignal;
    private boolean scrollCycleInProgress;

    public /* synthetic */ AndroidEdgeEffectOverscrollEffect(Context context, Density density, long j, PaddingValues paddingValues, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, density, j, paddingValues);
    }

    public static /* synthetic */ void getInvalidationEnabled$foundation_release$annotations() {
    }

    private AndroidEdgeEffectOverscrollEffect(Context context, Density density, long glowColor, PaddingValues glowDrawPadding) {
        GlowOverscrollNode glowOverscrollNode;
        this.density = density;
        this.pointerPosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
        this.edgeEffectWrapper = new EdgeEffectWrapper(context, ColorKt.m4343toArgb8_81llA(glowColor));
        this.redrawSignal = SnapshotStateKt.mutableStateOf(Unit.INSTANCE, SnapshotStateKt.neverEqualPolicy());
        this.invalidationEnabled = true;
        this.containerSize = Size.Companion.m4126getZeroNHjbRc();
        this.pointerId = PointerId.m5492constructorimpl(-1L);
        this.pointerInputNode = SuspendingPointerInputFilterKt.SuspendingPointerInputModifierNode(new PointerInputEventHandler() { // from class: androidx.compose.foundation.AndroidEdgeEffectOverscrollEffect$pointerInputNode$1

            /* compiled from: AndroidOverscroll.android.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/ui/input/pointer/AwaitPointerEventScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.foundation.AndroidEdgeEffectOverscrollEffect$pointerInputNode$1$1", f = "AndroidOverscroll.android.kt", i = {0, 1}, l = {783, 787}, m = "invokeSuspend", n = {"$this$awaitEachGesture", "$this$awaitEachGesture"}, s = {"L$0", "L$0"})
            /* renamed from: androidx.compose.foundation.AndroidEdgeEffectOverscrollEffect$pointerInputNode$1$1  reason: invalid class name */
            /* loaded from: classes.dex */
            static final class AnonymousClass1 extends RestrictedSuspendLambda implements Function2<AwaitPointerEventScope, Continuation<? super Unit>, Object> {
                private /* synthetic */ Object L$0;
                int label;
                final /* synthetic */ AndroidEdgeEffectOverscrollEffect this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                AnonymousClass1(AndroidEdgeEffectOverscrollEffect androidEdgeEffectOverscrollEffect, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.this$0 = androidEdgeEffectOverscrollEffect;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.this$0, continuation);
                    anonymousClass1.L$0 = obj;
                    return anonymousClass1;
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(AwaitPointerEventScope awaitPointerEventScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(awaitPointerEventScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                /* JADX WARN: Removed duplicated region for block: B:15:0x0075 A[RETURN] */
                /* JADX WARN: Removed duplicated region for block: B:16:0x0076  */
                /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0076 -> B:17:0x007d). Please submit an issue!!! */
                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final java.lang.Object invokeSuspend(java.lang.Object r21) {
                    /*
                        Method dump skipped, instructions count: 332
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.AndroidEdgeEffectOverscrollEffect$pointerInputNode$1.AnonymousClass1.invokeSuspend(java.lang.Object):java.lang.Object");
                }
            }

            @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
            public final Object invoke(PointerInputScope $this$SuspendingPointerInputModifierNode, Continuation<? super Unit> continuation) {
                Object awaitEachGesture = ForEachGestureKt.awaitEachGesture($this$SuspendingPointerInputModifierNode, new AnonymousClass1(AndroidEdgeEffectOverscrollEffect.this, null), continuation);
                return awaitEachGesture == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? awaitEachGesture : Unit.INSTANCE;
            }
        });
        if (Build.VERSION.SDK_INT >= 31) {
            glowOverscrollNode = new StretchOverscrollNode(this.pointerInputNode, this, this.edgeEffectWrapper);
        } else {
            glowOverscrollNode = new GlowOverscrollNode(this.pointerInputNode, this, this.edgeEffectWrapper, glowDrawPadding);
        }
        this.node = glowOverscrollNode;
    }

    public final MutableState<Unit> getRedrawSignal$foundation_release() {
        return this.redrawSignal;
    }

    public final boolean getInvalidationEnabled$foundation_release() {
        return this.invalidationEnabled;
    }

    public final void setInvalidationEnabled$foundation_release(boolean z) {
        this.invalidationEnabled = z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:104:0x02c7, code lost:
        if ((java.lang.Float.intBitsToFloat(r3) == r16) == false) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x02fb, code lost:
        if ((java.lang.Float.intBitsToFloat(r3) == r16) == false) goto L86;
     */
    @Override // androidx.compose.foundation.OverscrollEffect
    /* renamed from: applyToScroll-Rhakbz0  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public long mo481applyToScrollRhakbz0(long r32, int r34, kotlin.jvm.functions.Function1<? super androidx.compose.ui.geometry.Offset, androidx.compose.ui.geometry.Offset> r35) {
        /*
            Method dump skipped, instructions count: 985
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.AndroidEdgeEffectOverscrollEffect.mo481applyToScrollRhakbz0(long, int, kotlin.jvm.functions.Function1):long");
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01ec  */
    @Override // androidx.compose.foundation.OverscrollEffect
    /* renamed from: applyToFling-BMRW4eQ  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object mo480applyToFlingBMRW4eQ(long r25, kotlin.jvm.functions.Function2<? super androidx.compose.ui.unit.Velocity, ? super kotlin.coroutines.Continuation<? super androidx.compose.ui.unit.Velocity>, ? extends java.lang.Object> r27, kotlin.coroutines.Continuation<? super kotlin.Unit> r28) {
        /*
            Method dump skipped, instructions count: 536
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.AndroidEdgeEffectOverscrollEffect.mo480applyToFlingBMRW4eQ(long, kotlin.jvm.functions.Function2, kotlin.coroutines.Continuation):java.lang.Object");
    }

    @Override // androidx.compose.foundation.OverscrollEffect
    public boolean isInProgress() {
        EdgeEffectWrapper this_$iv = this.edgeEffectWrapper;
        EdgeEffect it = this_$iv.topEffect;
        if (it != null) {
            if (!(EdgeEffectCompat.INSTANCE.getDistanceCompat(it) == 0.0f)) {
                return true;
            }
        }
        EdgeEffect it2 = this_$iv.bottomEffect;
        if (it2 != null) {
            if (!(EdgeEffectCompat.INSTANCE.getDistanceCompat(it2) == 0.0f)) {
                return true;
            }
        }
        EdgeEffect it3 = this_$iv.leftEffect;
        if (it3 != null) {
            if (!(EdgeEffectCompat.INSTANCE.getDistanceCompat(it3) == 0.0f)) {
                return true;
            }
        }
        EdgeEffect it4 = this_$iv.rightEffect;
        if (it4 != null) {
            if (!(EdgeEffectCompat.INSTANCE.getDistanceCompat(it4) == 0.0f)) {
                return true;
            }
        }
        return false;
    }

    /* renamed from: updateSize-uvyYCjk$foundation_release  reason: not valid java name */
    public final void m483updateSizeuvyYCjk$foundation_release(long size) {
        boolean initialSetSize = Size.m4113equalsimpl0(this.containerSize, Size.Companion.m4126getZeroNHjbRc());
        boolean differentSize = !Size.m4113equalsimpl0(size, this.containerSize);
        this.containerSize = size;
        if (differentSize) {
            EdgeEffectWrapper edgeEffectWrapper = this.edgeEffectWrapper;
            int bits$iv$iv$iv = (int) (size >> 32);
            int width$iv = MathKt.roundToInt(Float.intBitsToFloat(bits$iv$iv$iv));
            int bits$iv$iv$iv2 = (int) (size & 4294967295L);
            int height$iv = MathKt.roundToInt(Float.intBitsToFloat(bits$iv$iv$iv2));
            edgeEffectWrapper.m556updateSizeozmzZPI(IntSize.m7039constructorimpl((width$iv << 32) | (4294967295L & height$iv)));
        }
        if (initialSetSize || !differentSize) {
            return;
        }
        animateToReleaseIfNeeded();
    }

    /* renamed from: displacement-F1C5BW0$foundation_release  reason: not valid java name */
    public final long m482displacementF1C5BW0$foundation_release() {
        long $this$isSpecified$iv = this.pointerPosition;
        long pointer = ((9223372034707292159L & $this$isSpecified$iv) > InlineClassHelperKt.UnspecifiedPackedFloats ? 1 : ((9223372034707292159L & $this$isSpecified$iv) == InlineClassHelperKt.UnspecifiedPackedFloats ? 0 : -1)) != 0 ? this.pointerPosition : SizeKt.m4127getCenteruvyYCjk(this.containerSize);
        long value$iv$iv = pointer;
        int bits$iv$iv$iv = (int) (value$iv$iv >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
        long arg0$iv = this.containerSize;
        int bits$iv$iv$iv2 = (int) (arg0$iv >> 32);
        float x = intBitsToFloat / Float.intBitsToFloat(bits$iv$iv$iv2);
        long value$iv$iv2 = pointer;
        int bits$iv$iv$iv3 = (int) (value$iv$iv2 & 4294967295L);
        float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv3);
        long arg0$iv2 = this.containerSize;
        int bits$iv$iv$iv4 = (int) (arg0$iv2 & 4294967295L);
        float y = intBitsToFloat2 / Float.intBitsToFloat(bits$iv$iv$iv4);
        long v1$iv$iv = Float.floatToRawIntBits(x);
        long v2$iv$iv = Float.floatToRawIntBits(y);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    @Override // androidx.compose.foundation.OverscrollEffect
    public DelegatableNode getNode() {
        return this.node;
    }

    public final void invalidateOverscroll$foundation_release() {
        if (this.invalidationEnabled) {
            this.redrawSignal.setValue(Unit.INSTANCE);
        }
    }

    private final void animateToReleaseIfNeeded() {
        boolean needsInvalidation = false;
        EdgeEffectWrapper this_$iv = this.edgeEffectWrapper;
        EdgeEffect it = this_$iv.topEffect;
        boolean z = true;
        if (it != null) {
            it.onRelease();
            needsInvalidation = !it.isFinished();
        }
        EdgeEffect it2 = this_$iv.bottomEffect;
        if (it2 != null) {
            it2.onRelease();
            needsInvalidation = !it2.isFinished() || needsInvalidation;
        }
        EdgeEffect it3 = this_$iv.leftEffect;
        if (it3 != null) {
            it3.onRelease();
            needsInvalidation = !it3.isFinished() || needsInvalidation;
        }
        EdgeEffect it4 = this_$iv.rightEffect;
        if (it4 != null) {
            it4.onRelease();
            if (it4.isFinished() && !needsInvalidation) {
                z = false;
            }
            needsInvalidation = z;
        }
        if (needsInvalidation) {
            invalidateOverscroll$foundation_release();
        }
    }

    /* renamed from: releaseOppositeOverscroll-k-4lQ0M  reason: not valid java name */
    private final boolean m479releaseOppositeOverscrollk4lQ0M(long delta) {
        boolean needsInvalidation = false;
        if (this.edgeEffectWrapper.isLeftAnimating()) {
            int bits$iv$iv$iv = (int) (delta >> 32);
            if (Float.intBitsToFloat(bits$iv$iv$iv) < 0.0f) {
                int bits$iv$iv$iv2 = (int) (delta >> 32);
                EdgeEffectCompat.INSTANCE.onReleaseWithOppositeDelta(this.edgeEffectWrapper.getOrCreateLeftEffect(), Float.intBitsToFloat(bits$iv$iv$iv2));
                needsInvalidation = this.edgeEffectWrapper.isLeftAnimating();
            }
        }
        boolean needsInvalidation2 = false;
        if (this.edgeEffectWrapper.isRightAnimating()) {
            int bits$iv$iv$iv3 = (int) (delta >> 32);
            if (Float.intBitsToFloat(bits$iv$iv$iv3) > 0.0f) {
                int bits$iv$iv$iv4 = (int) (delta >> 32);
                EdgeEffectCompat.INSTANCE.onReleaseWithOppositeDelta(this.edgeEffectWrapper.getOrCreateRightEffect(), Float.intBitsToFloat(bits$iv$iv$iv4));
                needsInvalidation = needsInvalidation || this.edgeEffectWrapper.isRightAnimating();
            }
        }
        if (this.edgeEffectWrapper.isTopAnimating()) {
            int bits$iv$iv$iv5 = (int) (delta & 4294967295L);
            if (Float.intBitsToFloat(bits$iv$iv$iv5) < 0.0f) {
                int bits$iv$iv$iv6 = (int) (delta & 4294967295L);
                EdgeEffectCompat.INSTANCE.onReleaseWithOppositeDelta(this.edgeEffectWrapper.getOrCreateTopEffect(), Float.intBitsToFloat(bits$iv$iv$iv6));
                needsInvalidation = needsInvalidation || this.edgeEffectWrapper.isTopAnimating();
            }
        }
        if (!this.edgeEffectWrapper.isBottomAnimating()) {
            return needsInvalidation;
        }
        int bits$iv$iv$iv7 = (int) (delta & 4294967295L);
        if (Float.intBitsToFloat(bits$iv$iv$iv7) <= 0.0f) {
            return needsInvalidation;
        }
        int bits$iv$iv$iv8 = (int) (4294967295L & delta);
        EdgeEffectCompat.INSTANCE.onReleaseWithOppositeDelta(this.edgeEffectWrapper.getOrCreateBottomEffect(), Float.intBitsToFloat(bits$iv$iv$iv8));
        if (needsInvalidation || this.edgeEffectWrapper.isBottomAnimating()) {
            needsInvalidation2 = true;
        }
        return needsInvalidation2;
    }

    /* renamed from: pullTop-k-4lQ0M  reason: not valid java name */
    private final float m478pullTopk4lQ0M(long scroll) {
        long arg0$iv = m482displacementF1C5BW0$foundation_release();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        float displacementX = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (scroll & 4294967295L);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv2);
        long arg0$iv2 = this.containerSize;
        int bits$iv$iv$iv3 = (int) (arg0$iv2 & 4294967295L);
        float pullY = intBitsToFloat / Float.intBitsToFloat(bits$iv$iv$iv3);
        EdgeEffect topEffect = this.edgeEffectWrapper.getOrCreateTopEffect();
        float onPullDistanceCompat = EdgeEffectCompat.INSTANCE.onPullDistanceCompat(topEffect, pullY, displacementX);
        long arg0$iv3 = this.containerSize;
        int bits$iv$iv$iv4 = (int) (arg0$iv3 & 4294967295L);
        float consumed = onPullDistanceCompat * Float.intBitsToFloat(bits$iv$iv$iv4);
        if (EdgeEffectCompat.INSTANCE.getDistanceCompat(topEffect) == 0.0f) {
            return consumed;
        }
        int bits$iv$iv$iv5 = (int) (4294967295L & scroll);
        return Float.intBitsToFloat(bits$iv$iv$iv5);
    }

    /* renamed from: pullBottom-k-4lQ0M  reason: not valid java name */
    private final float m475pullBottomk4lQ0M(long scroll) {
        long arg0$iv = m482displacementF1C5BW0$foundation_release();
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        float displacementX = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (scroll & 4294967295L);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv2);
        long arg0$iv2 = this.containerSize;
        int bits$iv$iv$iv3 = (int) (arg0$iv2 & 4294967295L);
        float pullY = intBitsToFloat / Float.intBitsToFloat(bits$iv$iv$iv3);
        EdgeEffect bottomEffect = this.edgeEffectWrapper.getOrCreateBottomEffect();
        long arg0$iv3 = this.containerSize;
        int bits$iv$iv$iv4 = (int) (arg0$iv3 & 4294967295L);
        float consumed = (-EdgeEffectCompat.INSTANCE.onPullDistanceCompat(bottomEffect, -pullY, 1.0f - displacementX)) * Float.intBitsToFloat(bits$iv$iv$iv4);
        if (EdgeEffectCompat.INSTANCE.getDistanceCompat(bottomEffect) == 0.0f) {
            return consumed;
        }
        int bits$iv$iv$iv5 = (int) (4294967295L & scroll);
        return Float.intBitsToFloat(bits$iv$iv$iv5);
    }

    /* renamed from: pullLeft-k-4lQ0M  reason: not valid java name */
    private final float m476pullLeftk4lQ0M(long scroll) {
        long arg0$iv = m482displacementF1C5BW0$foundation_release();
        int bits$iv$iv$iv = (int) (4294967295L & arg0$iv);
        float displacementY = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (scroll >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv2);
        long arg0$iv2 = this.containerSize;
        int bits$iv$iv$iv3 = (int) (arg0$iv2 >> 32);
        float pullX = intBitsToFloat / Float.intBitsToFloat(bits$iv$iv$iv3);
        EdgeEffect leftEffect = this.edgeEffectWrapper.getOrCreateLeftEffect();
        float onPullDistanceCompat = EdgeEffectCompat.INSTANCE.onPullDistanceCompat(leftEffect, pullX, 1.0f - displacementY);
        long arg0$iv3 = this.containerSize;
        int bits$iv$iv$iv4 = (int) (arg0$iv3 >> 32);
        float consumed = onPullDistanceCompat * Float.intBitsToFloat(bits$iv$iv$iv4);
        if (EdgeEffectCompat.INSTANCE.getDistanceCompat(leftEffect) == 0.0f) {
            return consumed;
        }
        int bits$iv$iv$iv5 = (int) (scroll >> 32);
        return Float.intBitsToFloat(bits$iv$iv$iv5);
    }

    /* renamed from: pullRight-k-4lQ0M  reason: not valid java name */
    private final float m477pullRightk4lQ0M(long scroll) {
        long arg0$iv = m482displacementF1C5BW0$foundation_release();
        int bits$iv$iv$iv = (int) (4294967295L & arg0$iv);
        float displacementY = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (scroll >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv2);
        long arg0$iv2 = this.containerSize;
        int bits$iv$iv$iv3 = (int) (arg0$iv2 >> 32);
        float pullX = intBitsToFloat / Float.intBitsToFloat(bits$iv$iv$iv3);
        EdgeEffect rightEffect = this.edgeEffectWrapper.getOrCreateRightEffect();
        long arg0$iv3 = this.containerSize;
        int bits$iv$iv$iv4 = (int) (arg0$iv3 >> 32);
        float consumed = (-EdgeEffectCompat.INSTANCE.onPullDistanceCompat(rightEffect, -pullX, displacementY)) * Float.intBitsToFloat(bits$iv$iv$iv4);
        if (EdgeEffectCompat.INSTANCE.getDistanceCompat(rightEffect) == 0.0f) {
            return consumed;
        }
        int bits$iv$iv$iv5 = (int) (scroll >> 32);
        return Float.intBitsToFloat(bits$iv$iv$iv5);
    }
}
