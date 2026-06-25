package androidx.compose.foundation.gestures;

import androidx.autofill.HintConstants;
import androidx.compose.animation.core.AnimationSpec;
import androidx.compose.animation.core.DecayAnimationSpec;
import androidx.compose.foundation.MutatePriority;
import androidx.compose.foundation.MutatorMutex;
import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.runtime.FloatState;
import androidx.compose.runtime.MutableFloatState;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.PrimitiveSnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.runtime.saveable.SaverKt;
import androidx.compose.runtime.saveable.SaverScope;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
/* compiled from: AnchoredDraggable.kt */
@Metadata(d1 = {"\u0000}\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u001e\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0016*\u0001\u0011\b\u0007\u0018\u0000 \u007f*\u0004\b\u0000\u0010\u00012\u00020\u0002:\u0001\u007fB\u001d\b\u0016\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005¢\u0006\u0002\u0010\u0006B2\b\u0017\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012!\u0010\u0007\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\f0\b¢\u0006\u0002\u0010\rBB\b\u0017\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u0005\u0012#\b\u0002\u0010\u0007\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\f0\b¢\u0006\u0002\u0010\u000eB\r\u0012\u0006\u0010\u0003\u001a\u00028\u0000¢\u0006\u0002\u0010\u000fJy\u0010_\u001a\u00020`2\u0006\u0010S\u001a\u00028\u00002\b\b\u0002\u0010a\u001a\u00020b2W\u0010c\u001aS\b\u0001\u0012\u0004\u0012\u00020e\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00028\u00000\u0005¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(f\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(S\u0012\n\u0012\b\u0012\u0004\u0012\u00020`0g\u0012\u0006\u0012\u0004\u0018\u00010\u00020d¢\u0006\u0002\bhH\u0086@¢\u0006\u0002\u0010iJ\\\u0010_\u001a\u00020`2\b\b\u0002\u0010a\u001a\u00020b2B\u0010c\u001a>\b\u0001\u0012\u0004\u0012\u00020e\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00028\u00000\u0005¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u0004\u0012\n\u0012\b\u0012\u0004\u0012\u00020`0g\u0012\u0006\u0012\u0004\u0018\u00010\u00020j¢\u0006\u0002\bhH\u0086@¢\u0006\u0002\u0010kJ\u000e\u0010l\u001a\u00020$2\u0006\u0010m\u001a\u00020$J\u0015\u0010n\u001a\u00020$2\u0006\u0010m\u001a\u00020$H\u0000¢\u0006\u0002\boJ\u001d\u0010C\u001a\u00020$2\u0006\u0010p\u001a\u00028\u00002\u0006\u0010q\u001a\u00028\u0000H\u0007¢\u0006\u0002\u0010rJ\u0006\u0010s\u001a\u00020$J\u001c\u0010t\u001a\u00020`2\f\u0010u\u001a\b\u0012\u0004\u0012\u00020$0LH\u0086@¢\u0006\u0002\u0010vJ\u0016\u0010t\u001a\u00020$2\u0006\u0010w\u001a\u00020$H\u0087@¢\u0006\u0002\u0010xJ\u0015\u0010y\u001a\u00020\f2\u0006\u0010S\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010zJ#\u0010{\u001a\u00020`2\f\u0010|\u001a\b\u0012\u0004\u0012\u00028\u00000\u00052\b\b\u0002\u0010}\u001a\u00028\u0000¢\u0006\u0002\u0010~R\u0016\u0010\u0010\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0012R7\u0010\u0004\u001a\b\u0012\u0004\u0012\u00028\u00000\u00052\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00000\u00058F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u0018\u0010\u0019\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R5\u0010\u0007\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\f0\bX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001dR+\u0010\u001e\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00028\u00008F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\"\u0010\u0019\u001a\u0004\b\u001f\u0010 \"\u0004\b!\u0010\u000fR8\u0010%\u001a\b\u0012\u0004\u0012\u00020$0#2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020$0#8\u0006@@X\u0087.¢\u0006\u0014\n\u0000\u0012\u0004\b&\u0010'\u001a\u0004\b(\u0010)\"\u0004\b*\u0010+R\u000e\u0010,\u001a\u00020-X\u0082\u0004¢\u0006\u0002\n\u0000R/\u0010.\u001a\u0004\u0018\u00018\u00002\b\u0010\u0013\u001a\u0004\u0018\u00018\u00008B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b1\u0010\u0019\u001a\u0004\b/\u0010 \"\u0004\b0\u0010\u000fR\u0011\u00102\u001a\u00020\f8F¢\u0006\u0006\u001a\u0004\b2\u00103R+\u00104\u001a\u00020$2\u0006\u0010\u0013\u001a\u00020$8F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b9\u0010:\u001a\u0004\b5\u00106\"\u0004\b7\u00108R+\u0010;\u001a\u00020$2\u0006\u0010\u0013\u001a\u00020$8F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b>\u0010:\u001a\u0004\b<\u00106\"\u0004\b=\u00108R5\u0010?\u001a\u001d\u0012\u0013\u0012\u00110$¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(@\u0012\u0004\u0012\u00020$0\bX\u0080.¢\u0006\u000e\n\u0000\u001a\u0004\bA\u0010\u001b\"\u0004\bB\u0010\u001dR!\u0010C\u001a\u00020$8GX\u0087\u0084\u0002¢\u0006\u0012\n\u0004\bF\u0010G\u0012\u0004\bD\u0010'\u001a\u0004\bE\u00106R+\u0010H\u001a\u00028\u00002\u0006\u0010\u0013\u001a\u00028\u00008F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\bK\u0010\u0019\u001a\u0004\bI\u0010 \"\u0004\bJ\u0010\u000fR8\u0010M\u001a\b\u0012\u0004\u0012\u00020$0L2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020$0L8\u0006@@X\u0087.¢\u0006\u0014\n\u0000\u0012\u0004\bN\u0010'\u001a\u0004\bO\u0010P\"\u0004\bQ\u0010RR\u001b\u0010S\u001a\u00028\u00008FX\u0086\u0084\u0002¢\u0006\f\n\u0004\bU\u0010G\u001a\u0004\bT\u0010 R\u001a\u0010V\u001a\u00020\f8@X\u0080\u0004¢\u0006\f\u0012\u0004\bW\u0010'\u001a\u0004\bX\u00103R \u0010Y\u001a\b\u0012\u0004\u0012\u00020$0ZX\u0080.¢\u0006\u000e\n\u0000\u001a\u0004\b[\u0010\\\"\u0004\b]\u0010^¨\u0006\u0080\u0001"}, d2 = {"Landroidx/compose/foundation/gestures/AnchoredDraggableState;", ExifInterface.GPS_DIRECTION_TRUE, "", "initialValue", "anchors", "Landroidx/compose/foundation/gestures/DraggableAnchors;", "(Ljava/lang/Object;Landroidx/compose/foundation/gestures/DraggableAnchors;)V", "confirmValueChange", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "newValue", "", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V", "(Ljava/lang/Object;Landroidx/compose/foundation/gestures/DraggableAnchors;Lkotlin/jvm/functions/Function1;)V", "(Ljava/lang/Object;)V", "anchoredDragScope", "androidx/compose/foundation/gestures/AnchoredDraggableState$anchoredDragScope$1", "Landroidx/compose/foundation/gestures/AnchoredDraggableState$anchoredDragScope$1;", "<set-?>", "getAnchors", "()Landroidx/compose/foundation/gestures/DraggableAnchors;", "setAnchors", "(Landroidx/compose/foundation/gestures/DraggableAnchors;)V", "anchors$delegate", "Landroidx/compose/runtime/MutableState;", "getConfirmValueChange$foundation_release", "()Lkotlin/jvm/functions/Function1;", "setConfirmValueChange$foundation_release", "(Lkotlin/jvm/functions/Function1;)V", "currentValue", "getCurrentValue", "()Ljava/lang/Object;", "setCurrentValue", "currentValue$delegate", "Landroidx/compose/animation/core/DecayAnimationSpec;", "", "decayAnimationSpec", "getDecayAnimationSpec$annotations", "()V", "getDecayAnimationSpec", "()Landroidx/compose/animation/core/DecayAnimationSpec;", "setDecayAnimationSpec$foundation_release", "(Landroidx/compose/animation/core/DecayAnimationSpec;)V", "dragMutex", "Landroidx/compose/foundation/MutatorMutex;", "dragTarget", "getDragTarget", "setDragTarget", "dragTarget$delegate", "isAnimationRunning", "()Z", "lastVelocity", "getLastVelocity", "()F", "setLastVelocity", "(F)V", "lastVelocity$delegate", "Landroidx/compose/runtime/MutableFloatState;", TypedValues.CycleType.S_WAVE_OFFSET, "getOffset", "setOffset", "offset$delegate", "positionalThreshold", "totalDistance", "getPositionalThreshold$foundation_release", "setPositionalThreshold$foundation_release", "progress", "getProgress$annotations", "getProgress", "progress$delegate", "Landroidx/compose/runtime/State;", "settledValue", "getSettledValue", "setSettledValue", "settledValue$delegate", "Landroidx/compose/animation/core/AnimationSpec;", "snapAnimationSpec", "getSnapAnimationSpec$annotations", "getSnapAnimationSpec", "()Landroidx/compose/animation/core/AnimationSpec;", "setSnapAnimationSpec$foundation_release", "(Landroidx/compose/animation/core/AnimationSpec;)V", "targetValue", "getTargetValue", "targetValue$delegate", "usePreModifierChangeBehavior", "getUsePreModifierChangeBehavior$foundation_release$annotations", "getUsePreModifierChangeBehavior$foundation_release", "velocityThreshold", "Lkotlin/Function0;", "getVelocityThreshold$foundation_release", "()Lkotlin/jvm/functions/Function0;", "setVelocityThreshold$foundation_release", "(Lkotlin/jvm/functions/Function0;)V", "anchoredDrag", "", "dragPriority", "Landroidx/compose/foundation/MutatePriority;", "block", "Lkotlin/Function4;", "Landroidx/compose/foundation/gestures/AnchoredDragScope;", "anchor", "Lkotlin/coroutines/Continuation;", "Lkotlin/ExtensionFunctionType;", "(Ljava/lang/Object;Landroidx/compose/foundation/MutatePriority;Lkotlin/jvm/functions/Function4;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lkotlin/Function3;", "(Landroidx/compose/foundation/MutatePriority;Lkotlin/jvm/functions/Function3;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "dispatchRawDelta", "delta", "newOffsetForDelta", "newOffsetForDelta$foundation_release", TypedValues.TransitionType.S_FROM, TypedValues.TransitionType.S_TO, "(Ljava/lang/Object;Ljava/lang/Object;)F", "requireOffset", "settle", "animationSpec", "(Landroidx/compose/animation/core/AnimationSpec;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "velocity", "(FLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "trySnapTo", "(Ljava/lang/Object;)Z", "updateAnchors", "newAnchors", "newTarget", "(Landroidx/compose/foundation/gestures/DraggableAnchors;Ljava/lang/Object;)V", "Companion", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AnchoredDraggableState<T> {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private final AnchoredDraggableState$anchoredDragScope$1 anchoredDragScope;
    private final MutableState anchors$delegate;
    private Function1<? super T, Boolean> confirmValueChange;
    private final MutableState currentValue$delegate;
    public DecayAnimationSpec<Float> decayAnimationSpec;
    private final MutatorMutex dragMutex;
    private final MutableState dragTarget$delegate;
    private final MutableFloatState lastVelocity$delegate;
    private final MutableFloatState offset$delegate;
    public Function1<? super Float, Float> positionalThreshold;
    private final State progress$delegate;
    private final MutableState settledValue$delegate;
    public AnimationSpec<Float> snapAnimationSpec;
    private final State targetValue$delegate;
    public Function0<Float> velocityThreshold;

    @Deprecated(level = DeprecationLevel.WARNING, message = "This constructor of AnchoredDraggableState has been deprecated. Please pass thresholds and animation specs to anchoredDraggableFlingBehavior(..) instead, which can be passed to Modifier.anchoredDraggable.")
    public static /* synthetic */ void getDecayAnimationSpec$annotations() {
    }

    @Deprecated(message = "Use the progress function to query the progress between two specified anchors.", replaceWith = @ReplaceWith(expression = "progress(state.settledValue, state.targetValue)", imports = {}))
    public static /* synthetic */ void getProgress$annotations() {
    }

    @Deprecated(level = DeprecationLevel.WARNING, message = "This constructor of AnchoredDraggableState has been deprecated. Please pass thresholds and animation specs to anchoredDraggableFlingBehavior(..) instead, which can be passed to Modifier.anchoredDraggable.")
    public static /* synthetic */ void getSnapAnimationSpec$annotations() {
    }

    public static /* synthetic */ void getUsePreModifierChangeBehavior$foundation_release$annotations() {
    }

    public AnchoredDraggableState(T t) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        MutableState mutableStateOf$default3;
        DefaultDraggableAnchors emptyDraggableAnchors;
        MutableState mutableStateOf$default4;
        this.confirmValueChange = new Function1<T, Boolean>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$confirmValueChange$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(T t2) {
                return true;
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(Object p1) {
                return invoke((AnchoredDraggableState$confirmValueChange$1<T>) p1);
            }
        };
        this.dragMutex = new MutatorMutex();
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(t, null, 2, null);
        this.currentValue$delegate = mutableStateOf$default;
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(t, null, 2, null);
        this.settledValue$delegate = mutableStateOf$default2;
        this.targetValue$delegate = SnapshotStateKt.derivedStateOf(new Function0<T>(this) { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$targetValue$2
            final /* synthetic */ AnchoredDraggableState<T> this$0;

            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
                this.this$0 = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final T invoke() {
                Object dragTarget;
                dragTarget = this.this$0.getDragTarget();
                T t2 = (T) dragTarget;
                if (t2 == null) {
                    AnchoredDraggableState $this$invoke_u24lambda_u240 = this.this$0;
                    float currentOffset = $this$invoke_u24lambda_u240.getOffset();
                    if (!Float.isNaN(currentOffset)) {
                        T closestAnchor = $this$invoke_u24lambda_u240.getAnchors().closestAnchor($this$invoke_u24lambda_u240.getOffset());
                        if (closestAnchor == null) {
                            closestAnchor = $this$invoke_u24lambda_u240.getCurrentValue();
                        }
                        return closestAnchor;
                    }
                    return $this$invoke_u24lambda_u240.getCurrentValue();
                }
                return t2;
            }
        });
        this.offset$delegate = PrimitiveSnapshotStateKt.mutableFloatStateOf(Float.NaN);
        this.progress$delegate = SnapshotStateKt.derivedStateOf(SnapshotStateKt.structuralEqualityPolicy(), new Function0<Float>(this) { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$progress$2
            final /* synthetic */ AnchoredDraggableState<T> this$0;

            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
                this.this$0 = this;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Float invoke() {
                float a = this.this$0.getAnchors().positionOf(this.this$0.getSettledValue());
                float b = this.this$0.getAnchors().positionOf(this.this$0.getTargetValue());
                float distance = Math.abs(b - a);
                float f = 1.0f;
                if (!Float.isNaN(distance) && distance > 1.0E-6f) {
                    float progress = (this.this$0.requireOffset() - a) / (b - a);
                    if (progress < 1.0E-6f) {
                        f = 0.0f;
                    } else if (progress <= 0.999999f) {
                        f = progress;
                    }
                }
                return Float.valueOf(f);
            }
        });
        this.lastVelocity$delegate = PrimitiveSnapshotStateKt.mutableFloatStateOf(0.0f);
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.dragTarget$delegate = mutableStateOf$default3;
        emptyDraggableAnchors = AnchoredDraggableKt.emptyDraggableAnchors();
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(emptyDraggableAnchors, null, 2, null);
        this.anchors$delegate = mutableStateOf$default4;
        this.anchoredDragScope = new AnchoredDraggableState$anchoredDragScope$1(this);
    }

    public AnchoredDraggableState(T t, DraggableAnchors<T> draggableAnchors) {
        this(t);
        setAnchors(draggableAnchors);
        trySnapTo(t);
    }

    @Deprecated(level = DeprecationLevel.WARNING, message = "confirmValueChange is deprecated without replacement. Rather than relying on a callback to veto state changes, the anchor set should not include disallowed anchors. See androidx.compose.foundation.samples.AnchoredDraggableDynamicAnchorsSample for an example of using dynamic anchors over confirmValueChange.")
    public AnchoredDraggableState(T t, Function1<? super T, Boolean> function1) {
        this(t);
        this.confirmValueChange = function1;
    }

    public /* synthetic */ AnchoredDraggableState(Object obj, DraggableAnchors draggableAnchors, AnonymousClass1 anonymousClass1, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(obj, draggableAnchors, (i & 4) != 0 ? new Function1<T, Boolean>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState.1
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(T t) {
                return true;
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(Object p1) {
                return invoke((AnonymousClass1) p1);
            }
        } : anonymousClass1);
    }

    @Deprecated(level = DeprecationLevel.WARNING, message = "confirmValueChange is deprecated without replacement. Rather than relying on a callback to veto state changes, the anchor set should not include disallowed anchors. See androidx.compose.foundation.samples.AnchoredDraggableDynamicAnchorsSample for an example of using dynamic anchors over confirmValueChange.")
    public AnchoredDraggableState(T t, DraggableAnchors<T> draggableAnchors, Function1<? super T, Boolean> function1) {
        this(t, function1);
        setAnchors(draggableAnchors);
        trySnapTo(t);
    }

    public final Function1<T, Boolean> getConfirmValueChange$foundation_release() {
        return (Function1<? super T, Boolean>) this.confirmValueChange;
    }

    public final void setConfirmValueChange$foundation_release(Function1<? super T, Boolean> function1) {
        this.confirmValueChange = function1;
    }

    public final Function1<Float, Float> getPositionalThreshold$foundation_release() {
        Function1 function1 = this.positionalThreshold;
        if (function1 != null) {
            return function1;
        }
        Intrinsics.throwUninitializedPropertyAccessException("positionalThreshold");
        return null;
    }

    public final void setPositionalThreshold$foundation_release(Function1<? super Float, Float> function1) {
        this.positionalThreshold = function1;
    }

    public final Function0<Float> getVelocityThreshold$foundation_release() {
        Function0<Float> function0 = this.velocityThreshold;
        if (function0 != null) {
            return function0;
        }
        Intrinsics.throwUninitializedPropertyAccessException("velocityThreshold");
        return null;
    }

    public final void setVelocityThreshold$foundation_release(Function0<Float> function0) {
        this.velocityThreshold = function0;
    }

    public final AnimationSpec<Float> getSnapAnimationSpec() {
        AnimationSpec<Float> animationSpec = this.snapAnimationSpec;
        if (animationSpec != null) {
            return animationSpec;
        }
        Intrinsics.throwUninitializedPropertyAccessException("snapAnimationSpec");
        return null;
    }

    public final void setSnapAnimationSpec$foundation_release(AnimationSpec<Float> animationSpec) {
        this.snapAnimationSpec = animationSpec;
    }

    public final DecayAnimationSpec<Float> getDecayAnimationSpec() {
        DecayAnimationSpec<Float> decayAnimationSpec = this.decayAnimationSpec;
        if (decayAnimationSpec != null) {
            return decayAnimationSpec;
        }
        Intrinsics.throwUninitializedPropertyAccessException("decayAnimationSpec");
        return null;
    }

    public final void setDecayAnimationSpec$foundation_release(DecayAnimationSpec<Float> decayAnimationSpec) {
        this.decayAnimationSpec = decayAnimationSpec;
    }

    public final boolean getUsePreModifierChangeBehavior$foundation_release() {
        return (this.positionalThreshold == null || this.velocityThreshold == null || this.snapAnimationSpec == null || this.decayAnimationSpec == null) ? false : true;
    }

    public final void setCurrentValue(T t) {
        MutableState $this$setValue$iv = this.currentValue$delegate;
        $this$setValue$iv.setValue(t);
    }

    public final T getCurrentValue() {
        State $this$getValue$iv = this.currentValue$delegate;
        return $this$getValue$iv.getValue();
    }

    public final void setSettledValue(T t) {
        MutableState $this$setValue$iv = this.settledValue$delegate;
        $this$setValue$iv.setValue(t);
    }

    public final T getSettledValue() {
        State $this$getValue$iv = this.settledValue$delegate;
        return $this$getValue$iv.getValue();
    }

    public final T getTargetValue() {
        State $this$getValue$iv = this.targetValue$delegate;
        return (T) $this$getValue$iv.getValue();
    }

    public final void setOffset(float f) {
        MutableFloatState $this$setValue$iv = this.offset$delegate;
        $this$setValue$iv.setFloatValue(f);
    }

    public final float getOffset() {
        FloatState $this$getValue$iv = this.offset$delegate;
        return $this$getValue$iv.getFloatValue();
    }

    public final float requireOffset() {
        boolean value$iv = !Float.isNaN(getOffset());
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("The offset was read before being initialized. Did you access the offset in a phase before layout, like effects or composition?");
        }
        return getOffset();
    }

    public final boolean isAnimationRunning() {
        return getDragTarget() != null;
    }

    public final float progress(T t, T t2) {
        float fromOffset = getAnchors().positionOf(t);
        float toOffset = getAnchors().positionOf(t2);
        float currentOffset = RangesKt.coerceIn(getOffset(), Math.min(fromOffset, toOffset), Math.max(fromOffset, toOffset));
        float fraction = (currentOffset - fromOffset) / (toOffset - fromOffset);
        if (Float.isNaN(fraction)) {
            return 1.0f;
        }
        if (fraction < 1.0E-6f) {
            return 0.0f;
        }
        if (fraction > 0.999999f) {
            return 1.0f;
        }
        return Math.abs(fraction);
    }

    public final float getProgress() {
        State $this$getValue$iv = this.progress$delegate;
        return ((Number) $this$getValue$iv.getValue()).floatValue();
    }

    public final void setLastVelocity(float f) {
        MutableFloatState $this$setValue$iv = this.lastVelocity$delegate;
        $this$setValue$iv.setFloatValue(f);
    }

    public final float getLastVelocity() {
        FloatState $this$getValue$iv = this.lastVelocity$delegate;
        return $this$getValue$iv.getFloatValue();
    }

    public final T getDragTarget() {
        State $this$getValue$iv = this.dragTarget$delegate;
        return $this$getValue$iv.getValue();
    }

    public final void setDragTarget(T t) {
        MutableState $this$setValue$iv = this.dragTarget$delegate;
        $this$setValue$iv.setValue(t);
    }

    private final void setAnchors(DraggableAnchors<T> draggableAnchors) {
        MutableState $this$setValue$iv = this.anchors$delegate;
        $this$setValue$iv.setValue(draggableAnchors);
    }

    public final DraggableAnchors<T> getAnchors() {
        State $this$getValue$iv = this.anchors$delegate;
        return (DraggableAnchors) $this$getValue$iv.getValue();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void updateAnchors$default(AnchoredDraggableState anchoredDraggableState, DraggableAnchors draggableAnchors, Object obj, int i, Object obj2) {
        if ((i & 2) != 0) {
            if (!Float.isNaN(anchoredDraggableState.getOffset())) {
                obj = draggableAnchors.closestAnchor(anchoredDraggableState.getOffset());
                if (obj == null) {
                    obj = anchoredDraggableState.getTargetValue();
                }
            } else {
                obj = anchoredDraggableState.getTargetValue();
            }
        }
        anchoredDraggableState.updateAnchors(draggableAnchors, obj);
    }

    public final void updateAnchors(DraggableAnchors<T> draggableAnchors, T t) {
        if (!Intrinsics.areEqual(getAnchors(), draggableAnchors)) {
            setAnchors(draggableAnchors);
            boolean snapSuccessful = trySnapTo(t);
            if (!snapSuccessful) {
                setDragTarget(t);
            }
        }
    }

    public final Object settle(AnimationSpec<Float> animationSpec, Continuation<? super Unit> continuation) {
        Object previousValue = getCurrentValue();
        Object targetValue = getAnchors().closestAnchor(requireOffset());
        if (targetValue != null && this.confirmValueChange.invoke(targetValue).booleanValue()) {
            Object animateTo = AnchoredDraggableKt.animateTo(this, targetValue, animationSpec, continuation);
            return animateTo == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? animateTo : Unit.INSTANCE;
        }
        Object animateTo2 = AnchoredDraggableKt.animateTo(this, previousValue, animationSpec, continuation);
        return animateTo2 == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? animateTo2 : Unit.INSTANCE;
    }

    @Deprecated(level = DeprecationLevel.WARNING, message = "settle does not accept a velocity anymore. Please use FlingBehavior#performFling instead. See AnchoredDraggableSamples.kt for example usages.")
    public final Object settle(float velocity, Continuation<? super Float> continuation) {
        Object targetValue;
        boolean value$iv = getUsePreModifierChangeBehavior$foundation_release();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("AnchoredDraggableState was configured through a constructor without providing positional and velocity threshold. This overload of settle has been deprecated. Please refer to AnchoredDraggableState#settle(animationSpec) for more information.");
        }
        Object previousValue = getCurrentValue();
        targetValue = AnchoredDraggableKt.computeTarget(getAnchors(), requireOffset(), velocity, getPositionalThreshold$foundation_release(), getVelocityThreshold$foundation_release());
        if (this.confirmValueChange.invoke(targetValue).booleanValue()) {
            return AnchoredDraggableKt.animateToWithDecay$default(this, targetValue, velocity, null, null, continuation, 12, null);
        }
        return AnchoredDraggableKt.animateToWithDecay$default(this, previousValue, velocity, null, null, continuation, 12, null);
    }

    public static /* synthetic */ Object anchoredDrag$default(AnchoredDraggableState anchoredDraggableState, MutatePriority mutatePriority, Function3 function3, Continuation continuation, int i, Object obj) {
        if ((i & 1) != 0) {
            mutatePriority = MutatePriority.Default;
        }
        return anchoredDraggableState.anchoredDrag(mutatePriority, function3, continuation);
    }

    public final Object anchoredDrag(MutatePriority dragPriority, Function3<? super AnchoredDragScope, ? super DraggableAnchors<T>, ? super Continuation<? super Unit>, ? extends Object> function3, Continuation<? super Unit> continuation) {
        Object mutate = this.dragMutex.mutate(dragPriority, new AnchoredDraggableState$anchoredDrag$2(this, function3, null), continuation);
        return mutate == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? mutate : Unit.INSTANCE;
    }

    public static /* synthetic */ Object anchoredDrag$default(AnchoredDraggableState anchoredDraggableState, Object obj, MutatePriority mutatePriority, Function4 function4, Continuation continuation, int i, Object obj2) {
        if ((i & 2) != 0) {
            mutatePriority = MutatePriority.Default;
        }
        return anchoredDraggableState.anchoredDrag(obj, mutatePriority, function4, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object anchoredDrag(T r9, androidx.compose.foundation.MutatePriority r10, kotlin.jvm.functions.Function4<? super androidx.compose.foundation.gestures.AnchoredDragScope, ? super androidx.compose.foundation.gestures.DraggableAnchors<T>, ? super T, ? super kotlin.coroutines.Continuation<? super kotlin.Unit>, ? extends java.lang.Object> r11, kotlin.coroutines.Continuation<? super kotlin.Unit> r12) {
        /*
            r8 = this;
            boolean r0 = r12 instanceof androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$3
            if (r0 == 0) goto L14
            r0 = r12
            androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$3 r0 = (androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$3) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$3 r0 = new androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$3
            r0.<init>(r8, r12)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 0
            switch(r3) {
                case 0: goto L38;
                case 1: goto L2e;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r10)
            throw r9
        L2e:
            java.lang.Object r9 = r0.L$0
            androidx.compose.foundation.gestures.AnchoredDraggableState r9 = (androidx.compose.foundation.gestures.AnchoredDraggableState) r9
            kotlin.ResultKt.throwOnFailure(r1)     // Catch: java.lang.Throwable -> L36
            goto L5d
        L36:
            r10 = move-exception
            goto L63
        L38:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r8
            androidx.compose.foundation.gestures.DraggableAnchors r5 = r3.getAnchors()
            boolean r5 = r5.hasPositionFor(r9)
            if (r5 == 0) goto L67
        L47:
            androidx.compose.foundation.MutatorMutex r5 = r3.dragMutex     // Catch: java.lang.Throwable -> L61
            androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$4 r6 = new androidx.compose.foundation.gestures.AnchoredDraggableState$anchoredDrag$4     // Catch: java.lang.Throwable -> L61
            r6.<init>(r3, r9, r11, r4)     // Catch: java.lang.Throwable -> L61
            kotlin.jvm.functions.Function1 r6 = (kotlin.jvm.functions.Function1) r6     // Catch: java.lang.Throwable -> L61
            r0.L$0 = r3     // Catch: java.lang.Throwable -> L61
            r7 = 1
            r0.label = r7     // Catch: java.lang.Throwable -> L61
            java.lang.Object r5 = r5.mutate(r10, r6, r0)     // Catch: java.lang.Throwable -> L61
            if (r5 != r2) goto L5c
            return r2
        L5c:
            r9 = r3
        L5d:
            r9.setDragTarget(r4)
            goto L7b
        L61:
            r10 = move-exception
            r9 = r3
        L63:
            r9.setDragTarget(r4)
            throw r10
        L67:
            kotlin.jvm.functions.Function1<? super T, java.lang.Boolean> r10 = r3.confirmValueChange
            java.lang.Object r10 = r10.invoke(r9)
            java.lang.Boolean r10 = (java.lang.Boolean) r10
            boolean r10 = r10.booleanValue()
            if (r10 == 0) goto L7b
            r3.setSettledValue(r9)
            r3.setCurrentValue(r9)
        L7b:
            kotlin.Unit r9 = kotlin.Unit.INSTANCE
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.AnchoredDraggableState.anchoredDrag(java.lang.Object, androidx.compose.foundation.MutatePriority, kotlin.jvm.functions.Function4, kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final float newOffsetForDelta$foundation_release(float delta) {
        return RangesKt.coerceIn((Float.isNaN(getOffset()) ? 0.0f : getOffset()) + delta, getAnchors().minPosition(), getAnchors().maxPosition());
    }

    public final float dispatchRawDelta(float delta) {
        float newOffset = newOffsetForDelta$foundation_release(delta);
        float consumedDelta = newOffset - requireOffset();
        AnchoredDragScope.dragTo$default(this.anchoredDragScope, newOffset, 0.0f, 2, null);
        return consumedDelta;
    }

    private final boolean trySnapTo(T t) {
        MutatorMutex this_$iv = this.dragMutex;
        boolean didLock$iv = this_$iv.tryLock();
        if (didLock$iv) {
            try {
                AnchoredDraggableState$anchoredDragScope$1 $this$trySnapTo_u24lambda_u243_u24lambda_u242 = this.anchoredDragScope;
                float targetOffset = getAnchors().positionOf(t);
                if (!Float.isNaN(targetOffset)) {
                    AnchoredDragScope.dragTo$default($this$trySnapTo_u24lambda_u243_u24lambda_u242, targetOffset, 0.0f, 2, null);
                    setDragTarget(null);
                }
                setCurrentValue(t);
                setSettledValue(t);
            } finally {
                this_$iv.unlock();
            }
        }
        return didLock$iv;
    }

    /* compiled from: AnchoredDraggable.kt */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\"\u0010\u0003\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00060\u0005\u0012\u0004\u0012\u0002H\u00060\u0004\"\b\b\u0001\u0010\u0006*\u00020\u0001J:\u0010\u0003\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00060\u0005\u0012\u0004\u0012\u0002H\u00060\u0004\"\b\b\u0001\u0010\u0006*\u00020\u00012\u0014\b\u0002\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u0002H\u0006\u0012\u0004\u0012\u00020\t0\bH\u0007J\u0087\u0001\u0010\u0003\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00060\u0005\u0012\u0004\u0012\u0002H\u00060\u0004\"\b\b\u0001\u0010\u0006*\u00020\u00012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000e2!\u0010\u000f\u001a\u001d\u0012\u0013\u0012\u00110\f¢\u0006\f\b\u0010\u0012\b\b\u0011\u0012\u0004\b\b(\u0012\u0012\u0004\u0012\u00020\f0\b2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\f0\u00142\u0014\b\u0002\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u0002H\u0006\u0012\u0004\u0012\u00020\t0\bH\u0007¨\u0006\u0015"}, d2 = {"Landroidx/compose/foundation/gestures/AnchoredDraggableState$Companion;", "", "()V", "Saver", "Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/foundation/gestures/AnchoredDraggableState;", ExifInterface.GPS_DIRECTION_TRUE, "confirmValueChange", "Lkotlin/Function1;", "", "snapAnimationSpec", "Landroidx/compose/animation/core/AnimationSpec;", "", "decayAnimationSpec", "Landroidx/compose/animation/core/DecayAnimationSpec;", "positionalThreshold", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "distance", "velocityThreshold", "Lkotlin/Function0;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final <T> Saver<AnchoredDraggableState<T>, T> Saver() {
            return SaverKt.Saver(new Function2<SaverScope, AnchoredDraggableState<T>, T>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$1
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, Object p2) {
                    return invoke(saverScope, (AnchoredDraggableState) ((AnchoredDraggableState) p2));
                }

                public final T invoke(SaverScope $this$Saver, AnchoredDraggableState<T> anchoredDraggableState) {
                    return anchoredDraggableState.getCurrentValue();
                }
            }, new Function1<T, AnchoredDraggableState<T>>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$2
                /* JADX WARN: Multi-variable type inference failed */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((AnchoredDraggableState$Companion$Saver$2<T>) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final AnchoredDraggableState<T> invoke(T t) {
                    return new AnchoredDraggableState<>(t);
                }
            });
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Saver Saver$default(Companion companion, Function1 function1, int i, Object obj) {
            if ((i & 1) != 0) {
                function1 = new Function1<T, Boolean>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$3
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(T t) {
                        return true;
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Boolean invoke(Object p1) {
                        return invoke((AnchoredDraggableState$Companion$Saver$3<T>) p1);
                    }
                };
            }
            return companion.Saver(function1);
        }

        @Deprecated(level = DeprecationLevel.WARNING, message = "confirmValueChange is deprecated without replacement. Rather than relying on a callback to veto state changes, the anchor set should not include disallowed anchors. See androidx.compose.foundation.samples.AnchoredDraggableDynamicAnchorsSample for an example of using dynamic anchors over confirmValueChange.")
        public final <T> Saver<AnchoredDraggableState<T>, T> Saver(final Function1<? super T, Boolean> function1) {
            return SaverKt.Saver(new Function2<SaverScope, AnchoredDraggableState<T>, T>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$4
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, Object p2) {
                    return invoke(saverScope, (AnchoredDraggableState) ((AnchoredDraggableState) p2));
                }

                public final T invoke(SaverScope $this$Saver, AnchoredDraggableState<T> anchoredDraggableState) {
                    return anchoredDraggableState.getCurrentValue();
                }
            }, new Function1<T, AnchoredDraggableState<T>>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$5
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                }

                /* JADX WARN: Multi-variable type inference failed */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((AnchoredDraggableState$Companion$Saver$5<T>) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final AnchoredDraggableState<T> invoke(T t) {
                    return new AnchoredDraggableState<>(t, function1);
                }
            });
        }

        public static /* synthetic */ Saver Saver$default(Companion companion, AnimationSpec animationSpec, DecayAnimationSpec decayAnimationSpec, Function1 function1, Function0 function0, Function1 function12, int i, Object obj) {
            AnchoredDraggableState$Companion$Saver$6 anchoredDraggableState$Companion$Saver$6;
            if ((i & 16) == 0) {
                anchoredDraggableState$Companion$Saver$6 = function12;
            } else {
                anchoredDraggableState$Companion$Saver$6 = new Function1<T, Boolean>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$6
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(T t) {
                        return true;
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Boolean invoke(Object p1) {
                        return invoke((AnchoredDraggableState$Companion$Saver$6<T>) p1);
                    }
                };
            }
            return companion.Saver(animationSpec, decayAnimationSpec, function1, function0, anchoredDraggableState$Companion$Saver$6);
        }

        @Deprecated(level = DeprecationLevel.WARNING, message = "This constructor of AnchoredDraggableState has been deprecated. Please pass thresholds and animation specs to anchoredDraggableFlingBehavior(..) instead, which can be passed to Modifier.anchoredDraggable.")
        public final <T> Saver<AnchoredDraggableState<T>, T> Saver(final AnimationSpec<Float> animationSpec, final DecayAnimationSpec<Float> decayAnimationSpec, final Function1<? super Float, Float> function1, final Function0<Float> function0, final Function1<? super T, Boolean> function12) {
            return SaverKt.Saver(new Function2<SaverScope, AnchoredDraggableState<T>, T>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$7
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, Object p2) {
                    return invoke(saverScope, (AnchoredDraggableState) ((AnchoredDraggableState) p2));
                }

                public final T invoke(SaverScope $this$Saver, AnchoredDraggableState<T> anchoredDraggableState) {
                    return anchoredDraggableState.getCurrentValue();
                }
            }, new Function1<T, AnchoredDraggableState<T>>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableState$Companion$Saver$8
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(1);
                }

                /* JADX WARN: Multi-variable type inference failed */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                    return invoke((AnchoredDraggableState$Companion$Saver$8<T>) p1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final AnchoredDraggableState<T> invoke(T t) {
                    return AnchoredDraggableKt.AnchoredDraggableState(t, function1, function0, animationSpec, decayAnimationSpec, function12);
                }
            });
        }
    }
}
