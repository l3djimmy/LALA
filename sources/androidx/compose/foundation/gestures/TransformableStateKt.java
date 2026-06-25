package androidx.compose.foundation.gestures;

import androidx.autofill.HintConstants;
import androidx.compose.animation.core.AnimationSpec;
import androidx.compose.animation.core.SpringSpec;
import androidx.compose.foundation.MutatePriority;
import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.geometry.Offset;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Ref;
/* compiled from: TransformableState.kt */
@Metadata(d1 = {"\u0000>\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0018\u0002\n\u0002\b\u0003\u001aS\u0010\u0002\u001a\u00020\u00032K\u0010\u0004\u001aG\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\u000b\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\f\u0012\u0004\u0012\u00020\r0\u0005\u001aZ\u0010\u000e\u001a\u00020\u00032K\u0010\u0004\u001aG\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\u000b\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\f\u0012\u0004\u0012\u00020\r0\u0005H\u0007¢\u0006\u0002\u0010\u000f\u001a_\u0010\u0010\u001a\u00020\r*\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u00062\u000e\b\u0002\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00060\u00152\u000e\b\u0002\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\n0\u00152\u000e\b\u0002\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00060\u0015H\u0086@ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0019\u001a/\u0010\u001a\u001a\u00020\r*\u00020\u00032\u0006\u0010\u001b\u001a\u00020\n2\u000e\b\u0002\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\n0\u0015H\u0086@ø\u0001\u0000¢\u0006\u0004\b\u001d\u0010\u001e\u001a*\u0010\u001f\u001a\u00020\r*\u00020\u00032\u0006\u0010 \u001a\u00020\u00062\u000e\b\u0002\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00060\u0015H\u0086@¢\u0006\u0002\u0010!\u001a*\u0010\"\u001a\u00020\r*\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u00062\u000e\b\u0002\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00060\u0015H\u0086@¢\u0006\u0002\u0010!\u001a\u001f\u0010#\u001a\u00020\r*\u00020\u00032\u0006\u0010\u001b\u001a\u00020\nH\u0086@ø\u0001\u0000¢\u0006\u0004\b$\u0010%\u001a\u001a\u0010&\u001a\u00020\r*\u00020\u00032\u0006\u0010 \u001a\u00020\u0006H\u0086@¢\u0006\u0002\u0010'\u001a\u001c\u0010(\u001a\u00020\r*\u00020\u00032\b\b\u0002\u0010)\u001a\u00020*H\u0086@¢\u0006\u0002\u0010+\u001a\u001a\u0010,\u001a\u00020\r*\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u0006H\u0086@¢\u0006\u0002\u0010'\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006-"}, d2 = {"ZeroAnimationVelocity", "Landroidx/compose/foundation/gestures/AnimationData;", "TransformableState", "Landroidx/compose/foundation/gestures/TransformableState;", "onTransformation", "Lkotlin/Function3;", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "zoomChange", "Landroidx/compose/ui/geometry/Offset;", "panChange", "rotationChange", "", "rememberTransformableState", "(Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/gestures/TransformableState;", "animateBy", "zoomFactor", "panOffset", "rotationDegrees", "zoomAnimationSpec", "Landroidx/compose/animation/core/AnimationSpec;", "panAnimationSpec", "rotationAnimationSpec", "animateBy-Su4bsnU", "(Landroidx/compose/foundation/gestures/TransformableState;FJFLandroidx/compose/animation/core/AnimationSpec;Landroidx/compose/animation/core/AnimationSpec;Landroidx/compose/animation/core/AnimationSpec;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "animatePanBy", TypedValues.CycleType.S_WAVE_OFFSET, "animationSpec", "animatePanBy-ubNVwUQ", "(Landroidx/compose/foundation/gestures/TransformableState;JLandroidx/compose/animation/core/AnimationSpec;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "animateRotateBy", "degrees", "(Landroidx/compose/foundation/gestures/TransformableState;FLandroidx/compose/animation/core/AnimationSpec;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "animateZoomBy", "panBy", "panBy-d-4ec7I", "(Landroidx/compose/foundation/gestures/TransformableState;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "rotateBy", "(Landroidx/compose/foundation/gestures/TransformableState;FLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "stopTransformation", "terminationPriority", "Landroidx/compose/foundation/MutatePriority;", "(Landroidx/compose/foundation/gestures/TransformableState;Landroidx/compose/foundation/MutatePriority;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "zoomBy", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TransformableStateKt {
    private static final AnimationData ZeroAnimationVelocity = new AnimationData(0.0f, Offset.Companion.m4064getZeroF1C5BW0(), 0.0f, null);

    public static final TransformableState TransformableState(Function3<? super Float, ? super Offset, ? super Float, Unit> function3) {
        return new DefaultTransformableState(function3);
    }

    public static final TransformableState rememberTransformableState(Function3<? super Float, ? super Offset, ? super Float, Unit> function3, Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, 1681419281, "C(rememberTransformableState)123@5672L38,124@5722L80:TransformableState.kt#8bwon0");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1681419281, $changed, -1, "androidx.compose.foundation.gestures.rememberTransformableState (TransformableState.kt:122)");
        }
        final State lambdaState = SnapshotStateKt.rememberUpdatedState(function3, $composer, $changed & 14);
        ComposerKt.sourceInformationMarkerStart($composer, -586901038, "CC(remember):TransformableState.kt#9igjgp");
        Object it$iv = $composer.rememberedValue();
        if (it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = TransformableState(new Function3<Float, Offset, Float, Unit>() { // from class: androidx.compose.foundation.gestures.TransformableStateKt$rememberTransformableState$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Unit invoke(Float f, Offset offset, Float f2) {
                    m803invoked4ec7I(f.floatValue(), offset.m4058unboximpl(), f2.floatValue());
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke-d-4ec7I  reason: not valid java name */
                public final void m803invoked4ec7I(float z, long p, float r) {
                    lambdaState.getValue().invoke(Float.valueOf(z), Offset.m4037boximpl(p), Float.valueOf(r));
                }
            });
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        TransformableState transformableState = (TransformableState) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return transformableState;
    }

    public static /* synthetic */ Object animateZoomBy$default(TransformableState transformableState, float f, AnimationSpec animationSpec, Continuation continuation, int i, Object obj) {
        if ((i & 2) != 0) {
            animationSpec = new SpringSpec(0.0f, 200.0f, null, 5, null);
        }
        return animateZoomBy(transformableState, f, animationSpec, continuation);
    }

    public static final Object animateZoomBy(TransformableState $this$animateZoomBy, float zoomFactor, AnimationSpec<Float> animationSpec, Continuation<? super Unit> continuation) {
        boolean value$iv = zoomFactor > 0.0f;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("zoom value should be greater than 0");
        }
        Ref.FloatRef previous = new Ref.FloatRef();
        previous.element = 1.0f;
        Object transform$default = TransformableState.transform$default($this$animateZoomBy, null, new TransformableStateKt$animateZoomBy$3(previous, zoomFactor, animationSpec, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    public static /* synthetic */ Object animateRotateBy$default(TransformableState transformableState, float f, AnimationSpec animationSpec, Continuation continuation, int i, Object obj) {
        if ((i & 2) != 0) {
            animationSpec = new SpringSpec(0.0f, 200.0f, null, 5, null);
        }
        return animateRotateBy(transformableState, f, animationSpec, continuation);
    }

    public static final Object animateRotateBy(TransformableState $this$animateRotateBy, float degrees, AnimationSpec<Float> animationSpec, Continuation<? super Unit> continuation) {
        Ref.FloatRef previous = new Ref.FloatRef();
        Object transform$default = TransformableState.transform$default($this$animateRotateBy, null, new TransformableStateKt$animateRotateBy$2(previous, degrees, animationSpec, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    /* renamed from: animatePanBy-ubNVwUQ$default  reason: not valid java name */
    public static /* synthetic */ Object m801animatePanByubNVwUQ$default(TransformableState transformableState, long j, AnimationSpec animationSpec, Continuation continuation, int i, Object obj) {
        if ((i & 2) != 0) {
            animationSpec = new SpringSpec(0.0f, 200.0f, null, 5, null);
        }
        return m800animatePanByubNVwUQ(transformableState, j, animationSpec, continuation);
    }

    /* renamed from: animatePanBy-ubNVwUQ  reason: not valid java name */
    public static final Object m800animatePanByubNVwUQ(TransformableState $this$animatePanBy_u2dubNVwUQ, long offset, AnimationSpec<Offset> animationSpec, Continuation<? super Unit> continuation) {
        Ref.LongRef previous = new Ref.LongRef();
        previous.element = Offset.Companion.m4064getZeroF1C5BW0();
        Object transform$default = TransformableState.transform$default($this$animatePanBy_u2dubNVwUQ, null, new TransformableStateKt$animatePanBy$2(previous, offset, animationSpec, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [T, androidx.compose.foundation.gestures.AnimationData] */
    /* renamed from: animateBy-Su4bsnU  reason: not valid java name */
    public static final Object m798animateBySu4bsnU(TransformableState $this$animateBy_u2dSu4bsnU, float zoomFactor, long panOffset, float rotationDegrees, AnimationSpec<Float> animationSpec, AnimationSpec<Offset> animationSpec2, AnimationSpec<Float> animationSpec3, Continuation<? super Unit> continuation) {
        boolean value$iv = zoomFactor > 0.0f;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("zoom value should be greater than 0");
        }
        Ref.ObjectRef previousState = new Ref.ObjectRef();
        previousState.element = new AnimationData(1.0f, Offset.Companion.m4064getZeroF1C5BW0(), 0.0f, null);
        AnimationData targetState = new AnimationData(zoomFactor, panOffset, rotationDegrees, null);
        DelegatingAnimationSpec animationSpec4 = new DelegatingAnimationSpec(animationSpec, animationSpec2, animationSpec3);
        Object transform$default = TransformableState.transform$default($this$animateBy_u2dSu4bsnU, null, new TransformableStateKt$animateBy$3(previousState, targetState, animationSpec4, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    public static final Object zoomBy(TransformableState $this$zoomBy, float zoomFactor, Continuation<? super Unit> continuation) {
        Object transform$default = TransformableState.transform$default($this$zoomBy, null, new TransformableStateKt$zoomBy$2(zoomFactor, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    public static final Object rotateBy(TransformableState $this$rotateBy, float degrees, Continuation<? super Unit> continuation) {
        Object transform$default = TransformableState.transform$default($this$rotateBy, null, new TransformableStateKt$rotateBy$2(degrees, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    /* renamed from: panBy-d-4ec7I  reason: not valid java name */
    public static final Object m802panByd4ec7I(TransformableState $this$panBy_u2dd_u2d4ec7I, long offset, Continuation<? super Unit> continuation) {
        Object transform$default = TransformableState.transform$default($this$panBy_u2dd_u2d4ec7I, null, new TransformableStateKt$panBy$2(offset, null), continuation, 1, null);
        return transform$default == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform$default : Unit.INSTANCE;
    }

    public static /* synthetic */ Object stopTransformation$default(TransformableState transformableState, MutatePriority mutatePriority, Continuation continuation, int i, Object obj) {
        if ((i & 1) != 0) {
            mutatePriority = MutatePriority.Default;
        }
        return stopTransformation(transformableState, mutatePriority, continuation);
    }

    public static final Object stopTransformation(TransformableState $this$stopTransformation, MutatePriority terminationPriority, Continuation<? super Unit> continuation) {
        Object transform = $this$stopTransformation.transform(terminationPriority, new TransformableStateKt$stopTransformation$2(null), continuation);
        return transform == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? transform : Unit.INSTANCE;
    }
}
