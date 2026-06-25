package androidx.compose.material.ripple;

import androidx.compose.animation.core.Animatable;
import androidx.compose.animation.core.AnimatableKt;
import androidx.compose.animation.core.AnimationVector1D;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.OffsetKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.ClipOp;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.drawscope.DrawContext;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawTransform;
import androidx.compose.ui.util.MathHelpersKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CompletableDeferred;
import kotlinx.coroutines.CompletableDeferredKt;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Job;
/* compiled from: RippleAnimation.kt */
@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\u000e\u0010 \u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u000e\u0010\"\u001a\u00020\u0018H\u0082@¢\u0006\u0002\u0010!J\u000e\u0010#\u001a\u00020\u0018H\u0082@¢\u0006\u0002\u0010!J\u0006\u0010$\u001a\u00020\u0018J\u001c\u0010%\u001a\u00020\u0018*\u00020&2\u0006\u0010'\u001a\u00020(ø\u0001\u0000¢\u0006\u0004\b)\u0010*R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R+\u0010\u000f\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u00078B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00180\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R+\u0010\u0019\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u00078B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u001c\u0010\u0015\u001a\u0004\b\u001a\u0010\u0011\"\u0004\b\u001b\u0010\u0013R\u0016\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001eR\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u0003X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006+"}, d2 = {"Landroidx/compose/material/ripple/RippleAnimation;", "", "origin", "Landroidx/compose/ui/geometry/Offset;", "radius", "", "bounded", "", "(Landroidx/compose/ui/geometry/Offset;FZLkotlin/jvm/internal/DefaultConstructorMarker;)V", "animatedAlpha", "Landroidx/compose/animation/core/Animatable;", "Landroidx/compose/animation/core/AnimationVector1D;", "animatedCenterPercent", "animatedRadiusPercent", "<set-?>", "finishRequested", "getFinishRequested", "()Z", "setFinishRequested", "(Z)V", "finishRequested$delegate", "Landroidx/compose/runtime/MutableState;", "finishSignalDeferred", "Lkotlinx/coroutines/CompletableDeferred;", "", "finishedFadingIn", "getFinishedFadingIn", "setFinishedFadingIn", "finishedFadingIn$delegate", "startRadius", "Ljava/lang/Float;", "targetCenter", "animate", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "fadeIn", "fadeOut", "finish", "draw", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", TypedValues.Custom.S_COLOR, "Landroidx/compose/ui/graphics/Color;", "draw-4WTKRHQ", "(Landroidx/compose/ui/graphics/drawscope/DrawScope;J)V", "material-ripple"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RippleAnimation {
    public static final int $stable = 8;
    private final Animatable<Float, AnimationVector1D> animatedAlpha;
    private final Animatable<Float, AnimationVector1D> animatedCenterPercent;
    private final Animatable<Float, AnimationVector1D> animatedRadiusPercent;
    private final boolean bounded;
    private final MutableState finishRequested$delegate;
    private final CompletableDeferred<Unit> finishSignalDeferred;
    private final MutableState finishedFadingIn$delegate;
    private Offset origin;
    private final float radius;
    private Float startRadius;
    private Offset targetCenter;

    public /* synthetic */ RippleAnimation(Offset offset, float f, boolean z, DefaultConstructorMarker defaultConstructorMarker) {
        this(offset, f, z);
    }

    private RippleAnimation(Offset origin, float radius, boolean bounded) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        this.origin = origin;
        this.radius = radius;
        this.bounded = bounded;
        this.animatedAlpha = AnimatableKt.Animatable$default(0.0f, 0.0f, 2, null);
        this.animatedRadiusPercent = AnimatableKt.Animatable$default(0.0f, 0.0f, 2, null);
        this.animatedCenterPercent = AnimatableKt.Animatable$default(0.0f, 0.0f, 2, null);
        this.finishSignalDeferred = CompletableDeferredKt.CompletableDeferred((Job) null);
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.finishedFadingIn$delegate = mutableStateOf$default;
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.finishRequested$delegate = mutableStateOf$default2;
    }

    private final boolean getFinishedFadingIn() {
        State $this$getValue$iv = this.finishedFadingIn$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    private final void setFinishedFadingIn(boolean z) {
        MutableState $this$setValue$iv = this.finishedFadingIn$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    private final boolean getFinishRequested() {
        State $this$getValue$iv = this.finishRequested$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    private final void setFinishRequested(boolean z) {
        MutableState $this$setValue$iv = this.finishRequested$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0031  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0039  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0060 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x006d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object animate(kotlin.coroutines.Continuation<? super kotlin.Unit> r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof androidx.compose.material.ripple.RippleAnimation$animate$1
            if (r0 == 0) goto L14
            r0 = r7
            androidx.compose.material.ripple.RippleAnimation$animate$1 r0 = (androidx.compose.material.ripple.RippleAnimation$animate$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.material.ripple.RippleAnimation$animate$1 r0 = new androidx.compose.material.ripple.RippleAnimation$animate$1
            r0.<init>(r6, r7)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 1
            switch(r3) {
                case 0: goto L41;
                case 1: goto L39;
                case 2: goto L31;
                case 3: goto L2d;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2d:
            kotlin.ResultKt.throwOnFailure(r1)
            goto L6e
        L31:
            java.lang.Object r3 = r0.L$0
            androidx.compose.material.ripple.RippleAnimation r3 = (androidx.compose.material.ripple.RippleAnimation) r3
            kotlin.ResultKt.throwOnFailure(r1)
            goto L61
        L39:
            java.lang.Object r3 = r0.L$0
            androidx.compose.material.ripple.RippleAnimation r3 = (androidx.compose.material.ripple.RippleAnimation) r3
            kotlin.ResultKt.throwOnFailure(r1)
            goto L50
        L41:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r6
            r0.L$0 = r3
            r0.label = r4
            java.lang.Object r5 = r3.fadeIn(r0)
            if (r5 != r2) goto L50
            return r2
        L50:
            r3.setFinishedFadingIn(r4)
            kotlinx.coroutines.CompletableDeferred<kotlin.Unit> r4 = r3.finishSignalDeferred
            r0.L$0 = r3
            r5 = 2
            r0.label = r5
            java.lang.Object r4 = r4.await(r0)
            if (r4 != r2) goto L61
            return r2
        L61:
            r4 = 0
            r0.L$0 = r4
            r4 = 3
            r0.label = r4
            java.lang.Object r3 = r3.fadeOut(r0)
            if (r3 != r2) goto L6e
            return r2
        L6e:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material.ripple.RippleAnimation.animate(kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object fadeIn(Continuation<? super Unit> continuation) {
        Object coroutineScope = CoroutineScopeKt.coroutineScope(new RippleAnimation$fadeIn$2(this, null), continuation);
        return coroutineScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? coroutineScope : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object fadeOut(Continuation<? super Unit> continuation) {
        Object coroutineScope = CoroutineScopeKt.coroutineScope(new RippleAnimation$fadeOut$2(this, null), continuation);
        return coroutineScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? coroutineScope : Unit.INSTANCE;
    }

    public final void finish() {
        setFinishRequested(true);
        this.finishSignalDeferred.complete(Unit.INSTANCE);
    }

    /* renamed from: draw-4WTKRHQ  reason: not valid java name */
    public final void m1789draw4WTKRHQ(DrawScope $this$draw_u2d4WTKRHQ, long color) {
        float floatValue;
        long modulatedColor;
        DrawContext $this$withTransform_u24lambda_u246$iv$iv;
        if (this.startRadius == null) {
            this.startRadius = Float.valueOf(RippleAnimationKt.m1791getRippleStartRadiusuvyYCjk($this$draw_u2d4WTKRHQ.mo4840getSizeNHjbRc()));
        }
        if (this.origin == null) {
            this.origin = Offset.m4037boximpl($this$draw_u2d4WTKRHQ.mo4839getCenterF1C5BW0());
        }
        if (this.targetCenter == null) {
            this.targetCenter = Offset.m4037boximpl(OffsetKt.Offset(Size.m4117getWidthimpl($this$draw_u2d4WTKRHQ.mo4840getSizeNHjbRc()) / 2.0f, Size.m4114getHeightimpl($this$draw_u2d4WTKRHQ.mo4840getSizeNHjbRc()) / 2.0f));
        }
        if (getFinishRequested() && !getFinishedFadingIn()) {
            floatValue = 1.0f;
        } else {
            floatValue = this.animatedAlpha.getValue().floatValue();
        }
        float alpha = floatValue;
        Float f = this.startRadius;
        Intrinsics.checkNotNull(f);
        float radius = MathHelpersKt.lerp(f.floatValue(), this.radius, this.animatedRadiusPercent.getValue().floatValue());
        Offset offset = this.origin;
        Intrinsics.checkNotNull(offset);
        float m4048getXimpl = Offset.m4048getXimpl(offset.m4058unboximpl());
        Offset offset2 = this.targetCenter;
        Intrinsics.checkNotNull(offset2);
        float lerp = MathHelpersKt.lerp(m4048getXimpl, Offset.m4048getXimpl(offset2.m4058unboximpl()), this.animatedCenterPercent.getValue().floatValue());
        Offset offset3 = this.origin;
        Intrinsics.checkNotNull(offset3);
        float m4049getYimpl = Offset.m4049getYimpl(offset3.m4058unboximpl());
        Offset offset4 = this.targetCenter;
        Intrinsics.checkNotNull(offset4);
        long centerOffset = OffsetKt.Offset(lerp, MathHelpersKt.lerp(m4049getYimpl, Offset.m4049getYimpl(offset4.m4058unboximpl()), this.animatedCenterPercent.getValue().floatValue()));
        modulatedColor = Color.m4287copywmQWz5c(color, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(color) : Color.m4291getAlphaimpl(color) * alpha, (r12 & 2) != 0 ? Color.m4295getRedimpl(color) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(color) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(color) : 0.0f);
        if (!this.bounded) {
            DrawScope.m4821drawCircleVaOC9Bg$default($this$draw_u2d4WTKRHQ, modulatedColor, radius, centerOffset, 0.0f, null, null, 0, 120, null);
            return;
        }
        float right$iv = Size.m4117getWidthimpl($this$draw_u2d4WTKRHQ.mo4840getSizeNHjbRc());
        float bottom$iv = Size.m4114getHeightimpl($this$draw_u2d4WTKRHQ.mo4840getSizeNHjbRc());
        int clipOp$iv = ClipOp.Companion.m4278getIntersectrtfAjoo();
        DrawContext $this$withTransform_u24lambda_u246$iv$iv2 = $this$draw_u2d4WTKRHQ.getDrawContext();
        long previousSize$iv$iv = $this$withTransform_u24lambda_u246$iv$iv2.mo4761getSizeNHjbRc();
        $this$withTransform_u24lambda_u246$iv$iv2.getCanvas().save();
        try {
            DrawTransform $this$clipRect_rOu3jXo_u24lambda_u244$iv = $this$withTransform_u24lambda_u246$iv$iv2.getTransform();
            $this$clipRect_rOu3jXo_u24lambda_u244$iv.mo4764clipRectN_I0leg(0.0f, 0.0f, right$iv, bottom$iv, clipOp$iv);
            try {
                DrawScope.m4821drawCircleVaOC9Bg$default($this$draw_u2d4WTKRHQ, modulatedColor, radius, centerOffset, 0.0f, null, null, 0, 120, null);
                $this$withTransform_u24lambda_u246$iv$iv2.getCanvas().restore();
                $this$withTransform_u24lambda_u246$iv$iv2.mo4762setSizeuvyYCjk(previousSize$iv$iv);
            } catch (Throwable th) {
                th = th;
                $this$withTransform_u24lambda_u246$iv$iv = $this$withTransform_u24lambda_u246$iv$iv2;
                $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
                $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            $this$withTransform_u24lambda_u246$iv$iv = $this$withTransform_u24lambda_u246$iv$iv2;
        }
    }
}
