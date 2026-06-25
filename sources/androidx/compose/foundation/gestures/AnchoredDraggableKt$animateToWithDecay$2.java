package androidx.compose.foundation.gestures;

import androidx.compose.animation.core.AnimationScope;
import androidx.compose.animation.core.AnimationSpec;
import androidx.compose.animation.core.AnimationState;
import androidx.compose.animation.core.AnimationStateKt;
import androidx.compose.animation.core.AnimationVector1D;
import androidx.compose.animation.core.DecayAnimationSpec;
import androidx.compose.animation.core.DecayAnimationSpecKt;
import androidx.compose.animation.core.SuspendAnimationKt;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Ref;
/* JADX INFO: Access modifiers changed from: package-private */
/* JADX INFO: Add missing generic type declarations: [T] */
/* compiled from: AnchoredDraggable.kt */
@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00052\u0006\u0010\u0006\u001a\u0002H\u0002H\u008a@"}, d2 = {"<anonymous>", "", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/foundation/gestures/AnchoredDragScope;", "anchors", "Landroidx/compose/foundation/gestures/DraggableAnchors;", "latestTarget"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.gestures.AnchoredDraggableKt$animateToWithDecay$2", f = "AnchoredDraggable.kt", i = {}, l = {1391, 1409, 1433}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
public final class AnchoredDraggableKt$animateToWithDecay$2<T> extends SuspendLambda implements Function4<AnchoredDragScope, DraggableAnchors<T>, T, Continuation<? super Unit>, Object> {
    final /* synthetic */ DecayAnimationSpec<Float> $decayAnimationSpec;
    final /* synthetic */ Ref.FloatRef $remainingVelocity;
    final /* synthetic */ AnimationSpec<Float> $snapAnimationSpec;
    final /* synthetic */ AnchoredDraggableState<T> $this_animateToWithDecay;
    final /* synthetic */ float $velocity;
    private /* synthetic */ Object L$0;
    /* synthetic */ Object L$1;
    /* synthetic */ Object L$2;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AnchoredDraggableKt$animateToWithDecay$2(AnchoredDraggableState<T> anchoredDraggableState, float f, AnimationSpec<Float> animationSpec, Ref.FloatRef floatRef, DecayAnimationSpec<Float> decayAnimationSpec, Continuation<? super AnchoredDraggableKt$animateToWithDecay$2> continuation) {
        super(4, continuation);
        this.$this_animateToWithDecay = anchoredDraggableState;
        this.$velocity = f;
        this.$snapAnimationSpec = animationSpec;
        this.$remainingVelocity = floatRef;
        this.$decayAnimationSpec = decayAnimationSpec;
    }

    public final Object invoke(AnchoredDragScope anchoredDragScope, DraggableAnchors<T> draggableAnchors, T t, Continuation<? super Unit> continuation) {
        AnchoredDraggableKt$animateToWithDecay$2 anchoredDraggableKt$animateToWithDecay$2 = new AnchoredDraggableKt$animateToWithDecay$2(this.$this_animateToWithDecay, this.$velocity, this.$snapAnimationSpec, this.$remainingVelocity, this.$decayAnimationSpec, continuation);
        anchoredDraggableKt$animateToWithDecay$2.L$0 = anchoredDragScope;
        anchoredDraggableKt$animateToWithDecay$2.L$1 = draggableAnchors;
        anchoredDraggableKt$animateToWithDecay$2.L$2 = t;
        return anchoredDraggableKt$animateToWithDecay$2.invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.jvm.functions.Function4
    public /* bridge */ /* synthetic */ Object invoke(AnchoredDragScope anchoredDragScope, Object obj, Object obj2, Continuation<? super Unit> continuation) {
        return invoke(anchoredDragScope, (DraggableAnchors<DraggableAnchors<T>>) obj, (DraggableAnchors<T>) obj2, continuation);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object animateTo;
        Object $result2;
        Object animateTo2;
        Object $result3;
        Object $result4;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                final AnchoredDragScope $this$anchoredDrag = (AnchoredDragScope) this.L$0;
                DraggableAnchors anchors = (DraggableAnchors) this.L$1;
                Object latestTarget = this.L$2;
                final float targetOffset = anchors.positionOf(latestTarget);
                if (!Float.isNaN(targetOffset)) {
                    final Ref.FloatRef prev = new Ref.FloatRef();
                    prev.element = Float.isNaN(this.$this_animateToWithDecay.getOffset()) ? 0.0f : this.$this_animateToWithDecay.getOffset();
                    boolean canDecayToTarget = false;
                    if (!(prev.element == targetOffset)) {
                        if (this.$velocity * (targetOffset - prev.element) >= 0.0f) {
                            if (!(this.$velocity == 0.0f)) {
                                float projectedDecayOffset = DecayAnimationSpecKt.calculateTargetValue(this.$decayAnimationSpec, prev.element, this.$velocity);
                                if (this.$velocity > 0.0f) {
                                    if (projectedDecayOffset >= targetOffset) {
                                        canDecayToTarget = true;
                                    }
                                } else if (projectedDecayOffset <= targetOffset) {
                                    canDecayToTarget = true;
                                }
                                if (!canDecayToTarget) {
                                    this.L$0 = null;
                                    this.L$1 = null;
                                    this.label = 3;
                                    animateTo2 = AnchoredDraggableKt.animateTo(this.$this_animateToWithDecay, this.$velocity, $this$anchoredDrag, anchors, latestTarget, this.$snapAnimationSpec, this);
                                    if (animateTo2 != coroutine_suspended) {
                                        $result3 = $result;
                                        this.$remainingVelocity.element = 0.0f;
                                        break;
                                    } else {
                                        return coroutine_suspended;
                                    }
                                } else {
                                    AnimationState AnimationState$default = AnimationStateKt.AnimationState$default(prev.element, this.$velocity, 0L, 0L, false, 28, null);
                                    DecayAnimationSpec<Float> decayAnimationSpec = this.$decayAnimationSpec;
                                    final Ref.FloatRef floatRef = this.$remainingVelocity;
                                    this.L$0 = null;
                                    this.L$1 = null;
                                    this.label = 2;
                                    if (SuspendAnimationKt.animateDecay$default(AnimationState$default, decayAnimationSpec, false, new Function1<AnimationScope<Float, AnimationVector1D>, Unit>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableKt$animateToWithDecay$2.3
                                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                        {
                                            super(1);
                                        }

                                        @Override // kotlin.jvm.functions.Function1
                                        public /* bridge */ /* synthetic */ Unit invoke(AnimationScope<Float, AnimationVector1D> animationScope) {
                                            invoke2(animationScope);
                                            return Unit.INSTANCE;
                                        }

                                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                                        public final void invoke2(AnimationScope<Float, AnimationVector1D> animationScope) {
                                            float finalValue;
                                            if ((animationScope.getValue().floatValue() < targetOffset && prev.element > targetOffset) || (animationScope.getValue().floatValue() > targetOffset && prev.element < targetOffset)) {
                                                finalValue = AnchoredDraggableKt.coerceToTarget(animationScope.getValue().floatValue(), targetOffset);
                                                $this$anchoredDrag.dragTo(finalValue, animationScope.getVelocity().floatValue());
                                                floatRef.element = Float.isNaN(animationScope.getVelocity().floatValue()) ? 0.0f : animationScope.getVelocity().floatValue();
                                                prev.element = finalValue;
                                                animationScope.cancelAnimation();
                                                return;
                                            }
                                            $this$anchoredDrag.dragTo(animationScope.getValue().floatValue(), animationScope.getVelocity().floatValue());
                                            floatRef.element = animationScope.getVelocity().floatValue();
                                            prev.element = animationScope.getValue().floatValue();
                                        }
                                    }, this, 2, null) != coroutine_suspended) {
                                        $result4 = $result;
                                        break;
                                    } else {
                                        return coroutine_suspended;
                                    }
                                }
                            }
                        }
                        this.L$0 = null;
                        this.L$1 = null;
                        this.label = 1;
                        animateTo = AnchoredDraggableKt.animateTo(this.$this_animateToWithDecay, this.$velocity, $this$anchoredDrag, anchors, latestTarget, this.$snapAnimationSpec, this);
                        if (animateTo != coroutine_suspended) {
                            $result2 = $result;
                            this.$remainingVelocity.element = 0.0f;
                            break;
                        } else {
                            return coroutine_suspended;
                        }
                    }
                }
                break;
            case 1:
                $result2 = $result;
                ResultKt.throwOnFailure($result2);
                this.$remainingVelocity.element = 0.0f;
                break;
            case 2:
                $result4 = $result;
                ResultKt.throwOnFailure($result4);
                break;
            case 3:
                $result3 = $result;
                ResultKt.throwOnFailure($result3);
                this.$remainingVelocity.element = 0.0f;
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        return Unit.INSTANCE;
    }
}
