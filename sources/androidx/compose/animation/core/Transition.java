package androidx.compose.animation.core;

import androidx.autofill.HintConstants;
import androidx.compose.animation.core.SeekableTransitionState;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DisposableEffectResult;
import androidx.compose.runtime.DisposableEffectScope;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.FloatState;
import androidx.compose.runtime.LongState;
import androidx.compose.runtime.MonotonicFrameClockKt;
import androidx.compose.runtime.MutableFloatState;
import androidx.compose.runtime.MutableLongState;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.PrimitiveSnapshotStateKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.SnapshotLongStateKt;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.layout.properties.Property;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.CoroutineStart;
/* compiled from: Transition.kt */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010 \n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0015\n\u0002\u0018\u0002\n\u0002\b \n\u0002\u0010\u0002\n\u0002\b\u000e\n\u0002\u0010\u0007\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u000e\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002:\b\u0085\u0001\u0086\u0001\u0087\u0001\u0088\u0001B!\b\u0011\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0002\u0010\u0007B\u0019\b\u0010\u0012\u0006\u0010\b\u001a\u00028\u0000\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0002\u0010\tB!\b\u0011\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\n\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0002\u0010\u000bB/\b\u0000\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004\u0012\f\u0010\f\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0000\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0002\u0010\rJ'\u0010S\u001a\u00020#2\u0018\u0010T\u001a\u0014\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0010R\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0000¢\u0006\u0002\bUJ\u0019\u0010V\u001a\u00020#2\n\u0010W\u001a\u0006\u0012\u0002\b\u00030\u0000H\u0000¢\u0006\u0002\bXJ\u0017\u0010Y\u001a\u00020Z2\u0006\u0010D\u001a\u00028\u0000H\u0001¢\u0006\u0004\b[\u0010\\J\b\u0010]\u001a\u00020\u0012H\u0002J\r\u0010^\u001a\u00020ZH\u0000¢\u0006\u0002\b_J\b\u0010`\u001a\u00020ZH\u0002J\r\u0010a\u001a\u00020ZH\u0000¢\u0006\u0002\bbJ\u001d\u0010c\u001a\u00020Z2\u0006\u0010d\u001a\u00020\u00122\u0006\u0010e\u001a\u00020#H\u0000¢\u0006\u0002\bfJ\u001d\u0010c\u001a\u00020Z2\u0006\u0010g\u001a\u00020\u00122\u0006\u0010h\u001a\u00020iH\u0000¢\u0006\u0002\bfJ\r\u0010j\u001a\u00020ZH\u0000¢\u0006\u0002\bkJ\u0015\u0010l\u001a\u00020Z2\u0006\u0010g\u001a\u00020\u0012H\u0000¢\u0006\u0002\bmJ'\u0010n\u001a\u00020Z2\u0018\u0010o\u001a\u0014\u0012\u0002\b\u0003\u0012\u0002\b\u00030pR\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0000¢\u0006\u0002\bqJ'\u0010n\u001a\u00020Z2\u0018\u0010T\u001a\u0014\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0010R\b\u0012\u0004\u0012\u00028\u00000\u0000H\u0000¢\u0006\u0002\bqJ\u0019\u0010r\u001a\u00020#2\n\u0010W\u001a\u0006\u0012\u0002\b\u00030\u0000H\u0000¢\u0006\u0002\bsJ\u0015\u0010t\u001a\u00020Z2\u0006\u0010u\u001a\u00020iH\u0000¢\u0006\u0002\bvJ\u0015\u0010w\u001a\u00020Z2\u0006\u00106\u001a\u00020\u0012H\u0000¢\u0006\u0002\bxJ\u0015\u0010y\u001a\u00020Z2\u0006\u0010z\u001a\u00020{H\u0000¢\u0006\u0002\b|J'\u0010}\u001a\u00020Z2\u0006\u0010\b\u001a\u00028\u00002\u0006\u0010D\u001a\u00028\u00002\u0006\u00106\u001a\u00020\u0012H\u0007¢\u0006\u0004\b~\u0010\u007fJ\t\u0010\u0080\u0001\u001a\u00020\u0006H\u0016J\u000f\u0010\u0081\u0001\u001a\u00020ZH\u0000¢\u0006\u0003\b\u0082\u0001J\u0019\u0010\u0083\u0001\u001a\u00020Z2\u0006\u0010D\u001a\u00028\u0000H\u0000¢\u0006\u0005\b\u0084\u0001\u0010GR&\u0010\u000e\u001a\u001a\u0012\u0016\u0012\u0014\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0010R\b\u0012\u0004\u0012\u00028\u00000\u00000\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R+\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0018\u0010\u0019\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u0018\u0010\u001a\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00000\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R)\u0010\u001b\u001a\u001a\u0012\u0016\u0012\u0014\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0010R\b\u0012\u0004\u0012\u00028\u00000\u00000\u001c8F¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001eR\u0011\u0010\u001f\u001a\u00028\u00008F¢\u0006\u0006\u001a\u0004\b \u0010!R\u001a\u0010\"\u001a\u00020#8GX\u0087\u0004¢\u0006\f\u0012\u0004\b$\u0010%\u001a\u0004\b&\u0010'R\u0011\u0010(\u001a\u00020#8F¢\u0006\u0006\u001a\u0004\b(\u0010'R+\u0010)\u001a\u00020#2\u0006\u0010\u0011\u001a\u00020#8G@AX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b,\u0010-\u001a\u0004\b)\u0010'\"\u0004\b*\u0010+R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b.\u0010/R\u001a\u00100\u001a\u00020\u0012X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b1\u0010\u0015\"\u0004\b2\u0010\u0017R\u0019\u0010\f\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u00008\u0007¢\u0006\b\n\u0000\u001a\u0004\b3\u00104R$\u00106\u001a\u00020\u00122\u0006\u00105\u001a\u00020\u00128G@GX\u0086\u000e¢\u0006\f\u001a\u0004\b7\u0010\u0015\"\u0004\b8\u0010\u0017R7\u0010:\u001a\b\u0012\u0004\u0012\u00028\u0000092\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00028\u0000098F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b?\u0010-\u001a\u0004\b;\u0010<\"\u0004\b=\u0010>R+\u0010@\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128@@@X\u0080\u008e\u0002¢\u0006\u0012\n\u0004\bC\u0010\u0019\u001a\u0004\bA\u0010\u0015\"\u0004\bB\u0010\u0017R+\u0010D\u001a\u00028\u00002\u0006\u0010\u0011\u001a\u00028\u00008F@@X\u0086\u008e\u0002¢\u0006\u0012\n\u0004\bH\u0010-\u001a\u0004\bE\u0010!\"\u0004\bF\u0010GR\u001b\u0010I\u001a\u00020\u00128FX\u0086\u0084\u0002¢\u0006\f\n\u0004\bK\u0010L\u001a\u0004\bJ\u0010\u0015R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u001b\u0010M\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00000\u001c8F¢\u0006\u0006\u001a\u0004\bN\u0010\u001eR+\u0010O\u001a\u00020#2\u0006\u0010\u0011\u001a\u00020#8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\bR\u0010-\u001a\u0004\bP\u0010'\"\u0004\bQ\u0010+¨\u0006\u0089\u0001"}, d2 = {"Landroidx/compose/animation/core/Transition;", ExifInterface.LATITUDE_SOUTH, "", "transitionState", "Landroidx/compose/animation/core/TransitionState;", "label", "", "(Landroidx/compose/animation/core/TransitionState;Ljava/lang/String;)V", "initialState", "(Ljava/lang/Object;Ljava/lang/String;)V", "Landroidx/compose/animation/core/MutableTransitionState;", "(Landroidx/compose/animation/core/MutableTransitionState;Ljava/lang/String;)V", "parentTransition", "(Landroidx/compose/animation/core/TransitionState;Landroidx/compose/animation/core/Transition;Ljava/lang/String;)V", "_animations", "Landroidx/compose/runtime/snapshots/SnapshotStateList;", "Landroidx/compose/animation/core/Transition$TransitionAnimationState;", "<set-?>", "", "_playTimeNanos", "get_playTimeNanos", "()J", "set_playTimeNanos", "(J)V", "_playTimeNanos$delegate", "Landroidx/compose/runtime/MutableLongState;", "_transitions", "animations", "", "getAnimations", "()Ljava/util/List;", "currentState", "getCurrentState", "()Ljava/lang/Object;", "hasInitialValueAnimations", "", "getHasInitialValueAnimations$annotations", "()V", "getHasInitialValueAnimations", "()Z", "isRunning", "isSeeking", "setSeeking$animation_core_release", "(Z)V", "isSeeking$delegate", "Landroidx/compose/runtime/MutableState;", "getLabel", "()Ljava/lang/String;", "lastSeekedTimeNanos", "getLastSeekedTimeNanos$animation_core_release", "setLastSeekedTimeNanos$animation_core_release", "getParentTransition", "()Landroidx/compose/animation/core/Transition;", "value", "playTimeNanos", "getPlayTimeNanos", "setPlayTimeNanos", "Landroidx/compose/animation/core/Transition$Segment;", "segment", "getSegment", "()Landroidx/compose/animation/core/Transition$Segment;", "setSegment", "(Landroidx/compose/animation/core/Transition$Segment;)V", "segment$delegate", "startTimeNanos", "getStartTimeNanos$animation_core_release", "setStartTimeNanos$animation_core_release", "startTimeNanos$delegate", "targetState", "getTargetState", "setTargetState$animation_core_release", "(Ljava/lang/Object;)V", "targetState$delegate", "totalDurationNanos", "getTotalDurationNanos", "totalDurationNanos$delegate", "Landroidx/compose/runtime/State;", "transitions", "getTransitions", "updateChildrenNeeded", "getUpdateChildrenNeeded", "setUpdateChildrenNeeded", "updateChildrenNeeded$delegate", "addAnimation", "animation", "addAnimation$animation_core_release", "addTransition", "transition", "addTransition$animation_core_release", "animateTo", "", "animateTo$animation_core_release", "(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)V", "calculateTotalDurationNanos", "clearInitialAnimations", "clearInitialAnimations$animation_core_release", "onChildAnimationUpdated", "onDisposed", "onDisposed$animation_core_release", "onFrame", "scaledPlayTimeNanos", "scaleToEnd", "onFrame$animation_core_release", "frameTimeNanos", "durationScale", "", "onTransitionEnd", "onTransitionEnd$animation_core_release", "onTransitionStart", "onTransitionStart$animation_core_release", "removeAnimation", "deferredAnimation", "Landroidx/compose/animation/core/Transition$DeferredAnimation;", "removeAnimation$animation_core_release", "removeTransition", "removeTransition$animation_core_release", "resetAnimationFraction", "fraction", "resetAnimationFraction$animation_core_release", "seekAnimations", "seekAnimations$animation_core_release", "setInitialAnimations", "animationState", "Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;", "setInitialAnimations$animation_core_release", "setPlaytimeAfterInitialAndTargetStateEstablished", "seek", "(Ljava/lang/Object;Ljava/lang/Object;J)V", "toString", "updateInitialValues", "updateInitialValues$animation_core_release", "updateTarget", "updateTarget$animation_core_release", "DeferredAnimation", "Segment", "SegmentImpl", "TransitionAnimationState", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class Transition<S> {
    public static final int $stable = 0;
    private final SnapshotStateList<Transition<S>.TransitionAnimationState<?, ?>> _animations;
    private final MutableLongState _playTimeNanos$delegate;
    private final SnapshotStateList<Transition<?>> _transitions;
    private final MutableState isSeeking$delegate;
    private final String label;
    private long lastSeekedTimeNanos;
    private final Transition<?> parentTransition;
    private final MutableState segment$delegate;
    private final MutableLongState startTimeNanos$delegate;
    private final MutableState targetState$delegate;
    private final State totalDurationNanos$delegate;
    private final TransitionState<S> transitionState;
    private final MutableState updateChildrenNeeded$delegate;

    public static /* synthetic */ void getHasInitialValueAnimations$annotations() {
    }

    public Transition(TransitionState<S> transitionState, Transition<?> transition, String label) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        MutableState mutableStateOf$default3;
        MutableState mutableStateOf$default4;
        this.transitionState = transitionState;
        this.parentTransition = transition;
        this.label = label;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(getCurrentState(), null, 2, null);
        this.targetState$delegate = mutableStateOf$default;
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(new SegmentImpl(getCurrentState(), getCurrentState()), null, 2, null);
        this.segment$delegate = mutableStateOf$default2;
        this._playTimeNanos$delegate = SnapshotLongStateKt.mutableLongStateOf(0L);
        this.startTimeNanos$delegate = SnapshotLongStateKt.mutableLongStateOf(Long.MIN_VALUE);
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.updateChildrenNeeded$delegate = mutableStateOf$default3;
        this._animations = SnapshotStateKt.mutableStateListOf();
        this._transitions = SnapshotStateKt.mutableStateListOf();
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.isSeeking$delegate = mutableStateOf$default4;
        this.totalDurationNanos$delegate = SnapshotStateKt.derivedStateOf(new Function0<Long>(this) { // from class: androidx.compose.animation.core.Transition$totalDurationNanos$2
            final /* synthetic */ Transition<S> this$0;

            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
                this.this$0 = this;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Long invoke() {
                long calculateTotalDurationNanos;
                calculateTotalDurationNanos = this.this$0.calculateTotalDurationNanos();
                return Long.valueOf(calculateTotalDurationNanos);
            }
        });
        this.transitionState.transitionConfigured$animation_core_release(this);
    }

    public /* synthetic */ Transition(TransitionState transitionState, Transition transition, String str, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(transitionState, transition, (i & 4) != 0 ? null : str);
    }

    public final Transition<?> getParentTransition() {
        return this.parentTransition;
    }

    public final String getLabel() {
        return this.label;
    }

    public /* synthetic */ Transition(TransitionState transitionState, String str, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(transitionState, (i & 2) != 0 ? null : str);
    }

    public Transition(TransitionState<S> transitionState, String label) {
        this(transitionState, null, label);
    }

    public Transition(S s, String label) {
        this(new MutableTransitionState(s), null, label);
    }

    public /* synthetic */ Transition(MutableTransitionState mutableTransitionState, String str, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(mutableTransitionState, (i & 2) != 0 ? null : str);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public Transition(MutableTransitionState<S> mutableTransitionState, String label) {
        this(mutableTransitionState, null, label);
        Intrinsics.checkNotNull(mutableTransitionState, "null cannot be cast to non-null type androidx.compose.animation.core.TransitionState<S of androidx.compose.animation.core.Transition>");
    }

    public final S getCurrentState() {
        return this.transitionState.getCurrentState();
    }

    public final S getTargetState() {
        State $this$getValue$iv = this.targetState$delegate;
        return (S) $this$getValue$iv.getValue();
    }

    public final void setTargetState$animation_core_release(S s) {
        MutableState $this$setValue$iv = this.targetState$delegate;
        $this$setValue$iv.setValue(s);
    }

    private final void setSegment(Segment<S> segment) {
        MutableState $this$setValue$iv = this.segment$delegate;
        $this$setValue$iv.setValue(segment);
    }

    public final Segment<S> getSegment() {
        State $this$getValue$iv = this.segment$delegate;
        return (Segment) $this$getValue$iv.getValue();
    }

    public final boolean isRunning() {
        return getStartTimeNanos$animation_core_release() != Long.MIN_VALUE;
    }

    private final long get_playTimeNanos() {
        LongState $this$getValue$iv = this._playTimeNanos$delegate;
        return $this$getValue$iv.getLongValue();
    }

    private final void set_playTimeNanos(long j) {
        MutableLongState $this$setValue$iv = this._playTimeNanos$delegate;
        $this$setValue$iv.setLongValue(j);
    }

    public final long getPlayTimeNanos() {
        Transition<?> transition = this.parentTransition;
        return transition != null ? transition.getPlayTimeNanos() : get_playTimeNanos();
    }

    public final void setPlayTimeNanos(long value) {
        if (this.parentTransition == null) {
            set_playTimeNanos(value);
        }
    }

    public final long getStartTimeNanos$animation_core_release() {
        LongState $this$getValue$iv = this.startTimeNanos$delegate;
        return $this$getValue$iv.getLongValue();
    }

    public final void setStartTimeNanos$animation_core_release(long j) {
        MutableLongState $this$setValue$iv = this.startTimeNanos$delegate;
        $this$setValue$iv.setLongValue(j);
    }

    private final boolean getUpdateChildrenNeeded() {
        State $this$getValue$iv = this.updateChildrenNeeded$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    private final void setUpdateChildrenNeeded(boolean z) {
        MutableState $this$setValue$iv = this.updateChildrenNeeded$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final List<Transition<?>> getTransitions() {
        return this._transitions;
    }

    public final List<Transition<S>.TransitionAnimationState<?, ?>> getAnimations() {
        return this._animations;
    }

    public final boolean isSeeking() {
        State $this$getValue$iv = this.isSeeking$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setSeeking$animation_core_release(boolean z) {
        MutableState $this$setValue$iv = this.isSeeking$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final long getLastSeekedTimeNanos$animation_core_release() {
        return this.lastSeekedTimeNanos;
    }

    public final void setLastSeekedTimeNanos$animation_core_release(long j) {
        this.lastSeekedTimeNanos = j;
    }

    public final boolean getHasInitialValueAnimations() {
        List $this$fastAny$iv;
        List $this$fastAny$iv2;
        List $this$fastAny$iv3 = this._animations;
        int index$iv$iv = 0;
        int size = $this$fastAny$iv3.size();
        while (true) {
            if (index$iv$iv < size) {
                Object item$iv$iv = $this$fastAny$iv3.get(index$iv$iv);
                TransitionAnimationState it = (TransitionAnimationState) item$iv$iv;
                TransitionAnimationState it2 = it.getInitialValueState$animation_core_release() != null ? 1 : null;
                if (it2 != null) {
                    $this$fastAny$iv = 1;
                    break;
                }
                index$iv$iv++;
            } else {
                $this$fastAny$iv = null;
                break;
            }
        }
        if ($this$fastAny$iv == null) {
            List $this$fastAny$iv4 = this._transitions;
            int index$iv$iv2 = 0;
            int size2 = $this$fastAny$iv4.size();
            while (true) {
                if (index$iv$iv2 < size2) {
                    Object item$iv$iv2 = $this$fastAny$iv4.get(index$iv$iv2);
                    Transition it3 = (Transition) item$iv$iv2;
                    if (it3.getHasInitialValueAnimations()) {
                        $this$fastAny$iv2 = 1;
                        break;
                    }
                    index$iv$iv2++;
                } else {
                    $this$fastAny$iv2 = null;
                    break;
                }
            }
            if ($this$fastAny$iv2 == null) {
                return false;
            }
        }
        return true;
    }

    public final long getTotalDurationNanos() {
        State $this$getValue$iv = this.totalDurationNanos$delegate;
        return ((Number) $this$getValue$iv.getValue()).longValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final long calculateTotalDurationNanos() {
        long maxDurationNanos = 0;
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            TransitionAnimationState it = (TransitionAnimationState) item$iv;
            maxDurationNanos = Math.max(maxDurationNanos, it.getDurationNanos$animation_core_release());
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it2 = (Transition) item$iv2;
            maxDurationNanos = Math.max(maxDurationNanos, it2.calculateTotalDurationNanos());
        }
        return maxDurationNanos;
    }

    public final void onFrame$animation_core_release(long frameTimeNanos, float durationScale) {
        long scaledPlayTimeNanos;
        if (getStartTimeNanos$animation_core_release() == Long.MIN_VALUE) {
            onTransitionStart$animation_core_release(frameTimeNanos);
        }
        long deltaT = frameTimeNanos - getStartTimeNanos$animation_core_release();
        if (durationScale == 0.0f) {
            scaledPlayTimeNanos = deltaT;
        } else {
            scaledPlayTimeNanos = MathKt.roundToLong(deltaT / durationScale);
        }
        setPlayTimeNanos(scaledPlayTimeNanos);
        onFrame$animation_core_release(scaledPlayTimeNanos, durationScale == 0.0f);
    }

    public final void onFrame$animation_core_release(long scaledPlayTimeNanos, boolean scaleToEnd) {
        if (getStartTimeNanos$animation_core_release() == Long.MIN_VALUE) {
            onTransitionStart$animation_core_release(scaledPlayTimeNanos);
        } else if (!this.transitionState.isRunning$animation_core_release()) {
            this.transitionState.setRunning$animation_core_release(true);
        }
        setUpdateChildrenNeeded(false);
        boolean allFinished = true;
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            TransitionAnimationState it = (TransitionAnimationState) item$iv;
            if (!it.isFinished$animation_core_release()) {
                it.onPlayTimeChanged$animation_core_release(scaledPlayTimeNanos, scaleToEnd);
            }
            if (!it.isFinished$animation_core_release()) {
                allFinished = false;
            }
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it2 = (Transition) item$iv2;
            if (!Intrinsics.areEqual(it2.getTargetState(), it2.getCurrentState())) {
                it2.onFrame$animation_core_release(scaledPlayTimeNanos, scaleToEnd);
            }
            if (!Intrinsics.areEqual(it2.getTargetState(), it2.getCurrentState())) {
                allFinished = false;
            }
        }
        if (allFinished) {
            onTransitionEnd$animation_core_release();
        }
    }

    public final void onTransitionStart$animation_core_release(long frameTimeNanos) {
        setStartTimeNanos$animation_core_release(frameTimeNanos);
        this.transitionState.setRunning$animation_core_release(true);
    }

    public final void onDisposed$animation_core_release() {
        onTransitionEnd$animation_core_release();
        this.transitionState.transitionRemoved$animation_core_release();
    }

    public final void onTransitionEnd$animation_core_release() {
        setStartTimeNanos$animation_core_release(Long.MIN_VALUE);
        if (this.transitionState instanceof MutableTransitionState) {
            this.transitionState.setCurrentState$animation_core_release(getTargetState());
        }
        setPlayTimeNanos(0L);
        this.transitionState.setRunning$animation_core_release(false);
        List $this$fastForEach$iv = this._transitions;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            Transition it = (Transition) item$iv;
            it.onTransitionEnd$animation_core_release();
        }
    }

    public final void seek(S s, S s2, long playTimeNanos) {
        setStartTimeNanos$animation_core_release(Long.MIN_VALUE);
        this.transitionState.setRunning$animation_core_release(false);
        if (!isSeeking() || !Intrinsics.areEqual(getCurrentState(), s) || !Intrinsics.areEqual(getTargetState(), s2)) {
            if (!Intrinsics.areEqual(getCurrentState(), s) && (this.transitionState instanceof MutableTransitionState)) {
                this.transitionState.setCurrentState$animation_core_release(s);
            }
            setTargetState$animation_core_release(s2);
            setSeeking$animation_core_release(true);
            setSegment(new SegmentImpl(s, s2));
        }
        List $this$fastForEach$iv = this._transitions;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            Transition it = (Transition) item$iv;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type androidx.compose.animation.core.Transition<kotlin.Any>");
            if (it.isSeeking()) {
                it.seek(it.getCurrentState(), it.getTargetState(), playTimeNanos);
            }
        }
        List $this$fastForEach$iv2 = this._animations;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            ((TransitionAnimationState) item$iv2).seekTo$animation_core_release(playTimeNanos);
        }
        this.lastSeekedTimeNanos = playTimeNanos;
    }

    public final boolean addTransition$animation_core_release(Transition<?> transition) {
        return this._transitions.add(transition);
    }

    public final boolean removeTransition$animation_core_release(Transition<?> transition) {
        return this._transitions.remove(transition);
    }

    public final boolean addAnimation$animation_core_release(Transition<S>.TransitionAnimationState<?, ?> transitionAnimationState) {
        return this._animations.add(transitionAnimationState);
    }

    public final void removeAnimation$animation_core_release(Transition<S>.TransitionAnimationState<?, ?> transitionAnimationState) {
        this._animations.remove(transitionAnimationState);
    }

    public final void updateTarget$animation_core_release(S s) {
        if (!Intrinsics.areEqual(getTargetState(), s)) {
            setSegment(new SegmentImpl(getTargetState(), s));
            if (!Intrinsics.areEqual(getCurrentState(), getTargetState())) {
                this.transitionState.setCurrentState$animation_core_release(getTargetState());
            }
            setTargetState$animation_core_release(s);
            if (!isRunning()) {
                setUpdateChildrenNeeded(true);
            }
            List $this$fastForEach$iv = this._animations;
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                TransitionAnimationState it = (TransitionAnimationState) item$iv;
                it.resetAnimation$animation_core_release();
            }
        }
    }

    public final void animateTo$animation_core_release(final S s, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(-1493585151);
        ComposerKt.sourceInformation($composer2, "C(animateTo):Transition.kt#pdpnli");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= ($changed & 8) == 0 ? $composer2.changed(s) : $composer2.changedInstance(s) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(this) ? 32 : 16;
        }
        if ($composer2.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1493585151, $dirty, -1, "androidx.compose.animation.core.Transition.animateTo (Transition.kt:1172)");
            }
            if (isSeeking()) {
                $composer2.startReplaceGroup(1824116347);
                $composer2.endReplaceGroup();
            } else {
                $composer2.startReplaceGroup(1822632563);
                ComposerKt.sourceInformation($composer2, "");
                updateTarget$animation_core_release(s);
                if (!Intrinsics.areEqual(s, getCurrentState()) || isRunning() || getUpdateChildrenNeeded()) {
                    $composer2.startReplaceGroup(1822863854);
                    ComposerKt.sourceInformation($composer2, "1180@49957L24,1181@50037L1011,1181@49998L1050");
                    ComposerKt.sourceInformationMarkerStart($composer2, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
                    ComposerKt.sourceInformationMarkerStart($composer2, -954203484, "CC(remember):Effects.kt#9igjgp");
                    Object it$iv$iv = $composer2.rememberedValue();
                    if (it$iv$iv == Composer.Companion.getEmpty()) {
                        Object value$iv$iv = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer2);
                        $composer2.updateRememberedValue(value$iv$iv);
                        it$iv$iv = value$iv$iv;
                    }
                    final CoroutineScope coroutineScope = (CoroutineScope) it$iv$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer2);
                    ComposerKt.sourceInformationMarkerEnd($composer2);
                    ComposerKt.sourceInformationMarkerStart($composer2, 335905018, "CC(remember):Transition.kt#9igjgp");
                    boolean invalid$iv = $composer2.changedInstance(coroutineScope) | (($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) == 32);
                    Object it$iv = $composer2.rememberedValue();
                    if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = (Function1) new Function1<DisposableEffectScope, DisposableEffectResult>() { // from class: androidx.compose.animation.core.Transition$animateTo$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(1);
                            }

                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* compiled from: Transition.kt */
                            @Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\u0003H\u008a@"}, d2 = {"<anonymous>", "", ExifInterface.LATITUDE_SOUTH, "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                            @DebugMetadata(c = "androidx.compose.animation.core.Transition$animateTo$1$1$1", f = "Transition.kt", i = {0, 0}, l = {1188}, m = "invokeSuspend", n = {"$this$launch", "durationScale"}, s = {"L$0", "F$0"})
                            /* renamed from: androidx.compose.animation.core.Transition$animateTo$1$1$1  reason: invalid class name */
                            /* loaded from: classes.dex */
                            public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                                float F$0;
                                private /* synthetic */ Object L$0;
                                int label;
                                final /* synthetic */ Transition<S> this$0;

                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                AnonymousClass1(Transition<S> transition, Continuation<? super AnonymousClass1> continuation) {
                                    super(2, continuation);
                                    this.this$0 = transition;
                                }

                                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                                    AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.this$0, continuation);
                                    anonymousClass1.L$0 = obj;
                                    return anonymousClass1;
                                }

                                @Override // kotlin.jvm.functions.Function2
                                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                                }

                                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                public final Object invokeSuspend(Object $result) {
                                    CoroutineScope $this$launch;
                                    final float durationScale;
                                    AnonymousClass1 anonymousClass1;
                                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                    switch (this.label) {
                                        case 0:
                                            ResultKt.throwOnFailure($result);
                                            CoroutineScope $this$launch2 = (CoroutineScope) this.L$0;
                                            $this$launch = $this$launch2;
                                            durationScale = SuspendAnimationKt.getDurationScale($this$launch2.getCoroutineContext());
                                            anonymousClass1 = this;
                                            break;
                                        case 1:
                                            durationScale = this.F$0;
                                            $this$launch = (CoroutineScope) this.L$0;
                                            ResultKt.throwOnFailure($result);
                                            anonymousClass1 = this;
                                            break;
                                        default:
                                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                    }
                                    while (CoroutineScopeKt.isActive($this$launch)) {
                                        final Transition<S> transition = anonymousClass1.this$0;
                                        anonymousClass1.L$0 = $this$launch;
                                        anonymousClass1.F$0 = durationScale;
                                        anonymousClass1.label = 1;
                                        if (MonotonicFrameClockKt.withFrameNanos(new Function1<Long, Unit>() { // from class: androidx.compose.animation.core.Transition.animateTo.1.1.1.1
                                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                            {
                                                super(1);
                                            }

                                            @Override // kotlin.jvm.functions.Function1
                                            public /* bridge */ /* synthetic */ Unit invoke(Long l) {
                                                invoke(l.longValue());
                                                return Unit.INSTANCE;
                                            }

                                            public final void invoke(long it) {
                                                if (!transition.isSeeking()) {
                                                    transition.onFrame$animation_core_release(it / 1, durationScale);
                                                }
                                            }
                                        }, anonymousClass1) == coroutine_suspended) {
                                            return coroutine_suspended;
                                        }
                                    }
                                    return Unit.INSTANCE;
                                }
                            }

                            @Override // kotlin.jvm.functions.Function1
                            public final DisposableEffectResult invoke(DisposableEffectScope $this$DisposableEffect) {
                                BuildersKt__Builders_commonKt.launch$default(CoroutineScope.this, null, CoroutineStart.UNDISPATCHED, new AnonymousClass1(this, null), 1, null);
                                return new DisposableEffectResult() { // from class: androidx.compose.animation.core.Transition$animateTo$1$1$invoke$$inlined$onDispose$1
                                    @Override // androidx.compose.runtime.DisposableEffectResult
                                    public void dispose() {
                                    }
                                };
                            }
                        };
                        $composer2.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer2);
                    EffectsKt.DisposableEffect(coroutineScope, this, (Function1) it$iv, $composer2, $dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS);
                    $composer2.endReplaceGroup();
                } else {
                    $composer2.startReplaceGroup(1824106427);
                    $composer2.endReplaceGroup();
                }
                $composer2.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>(this) { // from class: androidx.compose.animation.core.Transition$animateTo$2
                final /* synthetic */ Transition<S> $tmp1_rcvr;

                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                    this.$tmp1_rcvr = this;
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i) {
                    this.$tmp1_rcvr.animateTo$animation_core_release(s, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    public final void seekAnimations$animation_core_release(long playTimeNanos) {
        if (getStartTimeNanos$animation_core_release() == Long.MIN_VALUE) {
            setStartTimeNanos$animation_core_release(playTimeNanos);
        }
        setPlayTimeNanos(playTimeNanos);
        setUpdateChildrenNeeded(false);
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            ((TransitionAnimationState) item$iv).seekTo$animation_core_release(playTimeNanos);
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it = (Transition) item$iv2;
            if (!Intrinsics.areEqual(it.getTargetState(), it.getCurrentState())) {
                it.seekAnimations$animation_core_release(playTimeNanos);
            }
        }
    }

    public final void setInitialAnimations$animation_core_release(SeekableTransitionState.SeekingAnimationState animationState) {
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            TransitionAnimationState it = (TransitionAnimationState) item$iv;
            it.setInitialValueAnimation$animation_core_release(animationState);
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it2 = (Transition) item$iv2;
            it2.setInitialAnimations$animation_core_release(animationState);
        }
    }

    public final void resetAnimationFraction$animation_core_release(float fraction) {
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            TransitionAnimationState it = (TransitionAnimationState) item$iv;
            it.resetAnimationValue$animation_core_release(fraction);
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it2 = (Transition) item$iv2;
            it2.resetAnimationFraction$animation_core_release(fraction);
        }
    }

    public final void clearInitialAnimations$animation_core_release() {
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            TransitionAnimationState it = (TransitionAnimationState) item$iv;
            it.clearInitialAnimation$animation_core_release();
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it2 = (Transition) item$iv2;
            it2.clearInitialAnimations$animation_core_release();
        }
    }

    public final void updateInitialValues$animation_core_release() {
        List $this$fastForEach$iv = this._animations;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            TransitionAnimationState it = (TransitionAnimationState) item$iv;
            it.updateInitialValue$animation_core_release();
        }
        List $this$fastForEach$iv2 = this._transitions;
        int size2 = $this$fastForEach$iv2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = $this$fastForEach$iv2.get(index$iv2);
            Transition it2 = (Transition) item$iv2;
            it2.updateInitialValues$animation_core_release();
        }
    }

    public String toString() {
        List $this$fastFold$iv = getAnimations();
        String str = "Transition animation values: ";
        int size = $this$fastFold$iv.size();
        for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
            Object item$iv$iv = $this$fastFold$iv.get(index$iv$iv);
            TransitionAnimationState anim = (TransitionAnimationState) item$iv$iv;
            String acc = str;
            str = acc + anim + ", ";
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onChildAnimationUpdated() {
        setUpdateChildrenNeeded(true);
        if (isSeeking()) {
            long maxDurationNanos = 0;
            List $this$fastForEach$iv = this._animations;
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                TransitionAnimationState it = (TransitionAnimationState) item$iv;
                maxDurationNanos = Math.max(maxDurationNanos, it.getDurationNanos$animation_core_release());
                it.seekTo$animation_core_release(this.lastSeekedTimeNanos);
            }
            setUpdateChildrenNeeded(false);
        }
    }

    /* compiled from: Transition.kt */
    @Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\u0007\n\u0002\b\u0017\n\u0002\u0010\u0002\n\u0002\b\u001c\b\u0087\u0004\u0018\u0000*\u0004\b\u0001\u0010\u0001*\b\b\u0002\u0010\u0002*\u00020\u00032\b\u0012\u0004\u0012\u0002H\u00010\u0004B3\b\u0000\u0012\u0006\u0010\u0005\u001a\u00028\u0001\u0012\u0006\u0010\u0006\u001a\u00028\u0002\u0012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n¢\u0006\u0002\u0010\u000bJ\r\u0010O\u001a\u00020PH\u0000¢\u0006\u0002\bQJ\u001d\u0010R\u001a\u00020P2\u0006\u0010S\u001a\u00020\u001e2\u0006\u0010T\u001a\u00020.H\u0000¢\u0006\u0002\bUJ\r\u0010V\u001a\u00020PH\u0000¢\u0006\u0002\bWJ\u0015\u0010X\u001a\u00020P2\u0006\u0010Y\u001a\u000208H\u0000¢\u0006\u0002\bZJ\u0015\u0010[\u001a\u00020P2\u0006\u0010S\u001a\u00020\u001eH\u0000¢\u0006\u0002\b\\J\u0015\u0010]\u001a\u00020P2\u0006\u0010^\u001a\u00020(H\u0000¢\u0006\u0002\b_J\b\u0010`\u001a\u00020\nH\u0016J!\u0010a\u001a\u00020P2\b\b\u0002\u0010\u0005\u001a\u00028\u00012\b\b\u0002\u0010b\u001a\u00020.H\u0002¢\u0006\u0002\u0010cJ-\u0010d\u001a\u00020P2\u0006\u0010\u0005\u001a\u00028\u00012\u0006\u0010@\u001a\u00028\u00012\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00028\u00010\u0015H\u0000¢\u0006\u0004\be\u0010fJ\r\u0010g\u001a\u00020PH\u0000¢\u0006\u0002\bhJ%\u0010i\u001a\u00020P2\u0006\u0010@\u001a\u00028\u00012\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00028\u00010\u0015H\u0000¢\u0006\u0004\bj\u0010kRC\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\r2\u0012\u0010\f\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\r8F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R7\u0010\u0016\u001a\b\u0012\u0004\u0012\u00028\u00010\u00152\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00010\u00158F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u001b\u0010\u0014\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR\u0014\u0010\u001c\u001a\b\u0012\u0004\u0012\u00028\u00010\u001dX\u0082\u0004¢\u0006\u0002\n\u0000R+\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\f\u001a\u00020\u001e8@@@X\u0080\u008e\u0002¢\u0006\u0012\n\u0004\b$\u0010%\u001a\u0004\b \u0010!\"\u0004\b\"\u0010#R\u001c\u0010&\u001a\u0010\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u0002\u0018\u00010\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010'\u001a\u0004\u0018\u00010(X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b)\u0010*\"\u0004\b+\u0010,R\u0014\u0010-\u001a\b\u0012\u0004\u0012\u00028\u00010\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R+\u0010/\u001a\u00020.2\u0006\u0010\f\u001a\u00020.8@@@X\u0080\u008e\u0002¢\u0006\u0012\n\u0004\b4\u0010\u0014\u001a\u0004\b0\u00101\"\u0004\b2\u00103R\u000e\u00105\u001a\u00020.X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b6\u00107R+\u00109\u001a\u0002082\u0006\u0010\f\u001a\u0002088@@@X\u0080\u008e\u0002¢\u0006\u0012\n\u0004\b>\u0010?\u001a\u0004\b:\u0010;\"\u0004\b<\u0010=R+\u0010@\u001a\u00028\u00012\u0006\u0010\f\u001a\u00028\u00018B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\bE\u0010\u0014\u001a\u0004\bA\u0010B\"\u0004\bC\u0010DR\u001d\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\b¢\u0006\b\n\u0000\u001a\u0004\bF\u0010GR\u000e\u0010H\u001a\u00020.X\u0082\u000e¢\u0006\u0002\n\u0000R+\u0010I\u001a\u00028\u00012\u0006\u0010\f\u001a\u00028\u00018V@PX\u0096\u008e\u0002¢\u0006\u0012\n\u0004\bL\u0010\u0014\u001a\u0004\bJ\u0010B\"\u0004\bK\u0010DR\u0010\u0010M\u001a\u00028\u0002X\u0082\u000e¢\u0006\u0004\n\u0002\u0010N¨\u0006l"}, d2 = {"Landroidx/compose/animation/core/Transition$TransitionAnimationState;", ExifInterface.GPS_DIRECTION_TRUE, ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "Landroidx/compose/runtime/State;", "initialValue", "initialVelocityVector", "typeConverter", "Landroidx/compose/animation/core/TwoWayConverter;", "label", "", "(Landroidx/compose/animation/core/Transition;Ljava/lang/Object;Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/TwoWayConverter;Ljava/lang/String;)V", "<set-?>", "Landroidx/compose/animation/core/TargetBasedAnimation;", "animation", "getAnimation", "()Landroidx/compose/animation/core/TargetBasedAnimation;", "setAnimation", "(Landroidx/compose/animation/core/TargetBasedAnimation;)V", "animation$delegate", "Landroidx/compose/runtime/MutableState;", "Landroidx/compose/animation/core/FiniteAnimationSpec;", "animationSpec", "getAnimationSpec", "()Landroidx/compose/animation/core/FiniteAnimationSpec;", "setAnimationSpec", "(Landroidx/compose/animation/core/FiniteAnimationSpec;)V", "animationSpec$delegate", "defaultSpring", "Landroidx/compose/animation/core/SpringSpec;", "", "durationNanos", "getDurationNanos$animation_core_release", "()J", "setDurationNanos$animation_core_release", "(J)V", "durationNanos$delegate", "Landroidx/compose/runtime/MutableLongState;", "initialValueAnimation", "initialValueState", "Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;", "getInitialValueState$animation_core_release", "()Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;", "setInitialValueState$animation_core_release", "(Landroidx/compose/animation/core/SeekableTransitionState$SeekingAnimationState;)V", "interruptionSpec", "", "isFinished", "isFinished$animation_core_release", "()Z", "setFinished$animation_core_release", "(Z)V", "isFinished$delegate", "isSeeking", "getLabel", "()Ljava/lang/String;", "", "resetSnapValue", "getResetSnapValue$animation_core_release", "()F", "setResetSnapValue$animation_core_release", "(F)V", "resetSnapValue$delegate", "Landroidx/compose/runtime/MutableFloatState;", "targetValue", "getTargetValue", "()Ljava/lang/Object;", "setTargetValue", "(Ljava/lang/Object;)V", "targetValue$delegate", "getTypeConverter", "()Landroidx/compose/animation/core/TwoWayConverter;", "useOnlyInitialValue", "value", "getValue", "setValue$animation_core_release", "value$delegate", "velocityVector", "Landroidx/compose/animation/core/AnimationVector;", "clearInitialAnimation", "", "clearInitialAnimation$animation_core_release", "onPlayTimeChanged", "playTimeNanos", "scaleToEnd", "onPlayTimeChanged$animation_core_release", "resetAnimation", "resetAnimation$animation_core_release", "resetAnimationValue", "fraction", "resetAnimationValue$animation_core_release", "seekTo", "seekTo$animation_core_release", "setInitialValueAnimation", "animationState", "setInitialValueAnimation$animation_core_release", "toString", "updateAnimation", "isInterrupted", "(Ljava/lang/Object;Z)V", "updateInitialAndTargetValue", "updateInitialAndTargetValue$animation_core_release", "(Ljava/lang/Object;Ljava/lang/Object;Landroidx/compose/animation/core/FiniteAnimationSpec;)V", "updateInitialValue", "updateInitialValue$animation_core_release", "updateTargetValue", "updateTargetValue$animation_core_release", "(Ljava/lang/Object;Landroidx/compose/animation/core/FiniteAnimationSpec;)V", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public final class TransitionAnimationState<T, V extends AnimationVector> implements State<T> {
        private final MutableState animation$delegate;
        private final MutableState animationSpec$delegate;
        private final SpringSpec<T> defaultSpring;
        private final MutableLongState durationNanos$delegate;
        private TargetBasedAnimation<T, V> initialValueAnimation;
        private SeekableTransitionState.SeekingAnimationState initialValueState;
        private final FiniteAnimationSpec<T> interruptionSpec;
        private final MutableState isFinished$delegate;
        private boolean isSeeking;
        private final String label;
        private final MutableFloatState resetSnapValue$delegate;
        private final MutableState targetValue$delegate;
        private final TwoWayConverter<T, V> typeConverter;
        private boolean useOnlyInitialValue;
        private final MutableState value$delegate;
        private V velocityVector;

        public TransitionAnimationState(T t, V v, TwoWayConverter<T, V> twoWayConverter, String label) {
            MutableState mutableStateOf$default;
            MutableState mutableStateOf$default2;
            MutableState mutableStateOf$default3;
            MutableState mutableStateOf$default4;
            MutableState mutableStateOf$default5;
            Object visibilityThreshold;
            this.typeConverter = twoWayConverter;
            this.label = label;
            mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(t, null, 2, null);
            this.targetValue$delegate = mutableStateOf$default;
            this.defaultSpring = AnimationSpecKt.spring$default(0.0f, 0.0f, null, 7, null);
            mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(this.defaultSpring, null, 2, null);
            this.animationSpec$delegate = mutableStateOf$default2;
            mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(new TargetBasedAnimation(getAnimationSpec(), this.typeConverter, t, getTargetValue(), v), null, 2, null);
            this.animation$delegate = mutableStateOf$default3;
            mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
            this.isFinished$delegate = mutableStateOf$default4;
            this.resetSnapValue$delegate = PrimitiveSnapshotStateKt.mutableFloatStateOf(-1.0f);
            mutableStateOf$default5 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(t, null, 2, null);
            this.value$delegate = mutableStateOf$default5;
            this.velocityVector = v;
            this.durationNanos$delegate = SnapshotLongStateKt.mutableLongStateOf(getAnimation().getDurationNanos());
            Float f = VisibilityThresholdsKt.getVisibilityThresholdMap().get(this.typeConverter);
            if (f == null) {
                visibilityThreshold = null;
            } else {
                float it = f.floatValue();
                V invoke = this.typeConverter.getConvertToVector().invoke(t);
                int size$animation_core_release = invoke.getSize$animation_core_release();
                for (int id = 0; id < size$animation_core_release; id++) {
                    invoke.set$animation_core_release(id, it);
                }
                visibilityThreshold = this.typeConverter.getConvertFromVector().invoke(invoke);
            }
            this.interruptionSpec = AnimationSpecKt.spring$default(0.0f, 0.0f, visibilityThreshold, 3, null);
        }

        public final TwoWayConverter<T, V> getTypeConverter() {
            return this.typeConverter;
        }

        public final String getLabel() {
            return this.label;
        }

        private final T getTargetValue() {
            State $this$getValue$iv = this.targetValue$delegate;
            return $this$getValue$iv.getValue();
        }

        private final void setTargetValue(T t) {
            MutableState $this$setValue$iv = this.targetValue$delegate;
            $this$setValue$iv.setValue(t);
        }

        private final void setAnimationSpec(FiniteAnimationSpec<T> finiteAnimationSpec) {
            MutableState $this$setValue$iv = this.animationSpec$delegate;
            $this$setValue$iv.setValue(finiteAnimationSpec);
        }

        public final FiniteAnimationSpec<T> getAnimationSpec() {
            State $this$getValue$iv = this.animationSpec$delegate;
            return (FiniteAnimationSpec) $this$getValue$iv.getValue();
        }

        private final void setAnimation(TargetBasedAnimation<T, V> targetBasedAnimation) {
            MutableState $this$setValue$iv = this.animation$delegate;
            $this$setValue$iv.setValue(targetBasedAnimation);
        }

        public final TargetBasedAnimation<T, V> getAnimation() {
            State $this$getValue$iv = this.animation$delegate;
            return (TargetBasedAnimation) $this$getValue$iv.getValue();
        }

        public final SeekableTransitionState.SeekingAnimationState getInitialValueState$animation_core_release() {
            return this.initialValueState;
        }

        public final void setInitialValueState$animation_core_release(SeekableTransitionState.SeekingAnimationState seekingAnimationState) {
            this.initialValueState = seekingAnimationState;
        }

        public final boolean isFinished$animation_core_release() {
            State $this$getValue$iv = this.isFinished$delegate;
            return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
        }

        public final void setFinished$animation_core_release(boolean z) {
            MutableState $this$setValue$iv = this.isFinished$delegate;
            $this$setValue$iv.setValue(Boolean.valueOf(z));
        }

        public final float getResetSnapValue$animation_core_release() {
            FloatState $this$getValue$iv = this.resetSnapValue$delegate;
            return $this$getValue$iv.getFloatValue();
        }

        public final void setResetSnapValue$animation_core_release(float f) {
            MutableFloatState $this$setValue$iv = this.resetSnapValue$delegate;
            $this$setValue$iv.setFloatValue(f);
        }

        @Override // androidx.compose.runtime.State
        public T getValue() {
            State $this$getValue$iv = this.value$delegate;
            return $this$getValue$iv.getValue();
        }

        public void setValue$animation_core_release(T t) {
            MutableState $this$setValue$iv = this.value$delegate;
            $this$setValue$iv.setValue(t);
        }

        public final long getDurationNanos$animation_core_release() {
            LongState $this$getValue$iv = this.durationNanos$delegate;
            return $this$getValue$iv.getLongValue();
        }

        public final void setDurationNanos$animation_core_release(long j) {
            MutableLongState $this$setValue$iv = this.durationNanos$delegate;
            $this$setValue$iv.setLongValue(j);
        }

        public final void onPlayTimeChanged$animation_core_release(long playTimeNanos, boolean scaleToEnd) {
            long playTime = scaleToEnd ? getAnimation().getDurationNanos() : playTimeNanos;
            setValue$animation_core_release(getAnimation().getValueFromNanos(playTime));
            this.velocityVector = getAnimation().getVelocityVectorFromNanos(playTime);
            if (getAnimation().isFinishedFromNanos(playTime)) {
                setFinished$animation_core_release(true);
            }
        }

        public final void seekTo$animation_core_release(long playTimeNanos) {
            if (!(getResetSnapValue$animation_core_release() == -1.0f)) {
                return;
            }
            this.isSeeking = true;
            if (Intrinsics.areEqual(getAnimation().getTargetValue(), getAnimation().getInitialValue())) {
                setValue$animation_core_release(getAnimation().getTargetValue());
                return;
            }
            setValue$animation_core_release(getAnimation().getValueFromNanos(playTimeNanos));
            this.velocityVector = getAnimation().getVelocityVectorFromNanos(playTimeNanos);
        }

        public final void updateInitialValue$animation_core_release() {
            TargetBasedAnimation animation;
            SeekableTransitionState.SeekingAnimationState animState = this.initialValueState;
            if (animState == null || (animation = this.initialValueAnimation) == null) {
                return;
            }
            long initialPlayTimeNanos = MathKt.roundToLong(animState.getDurationNanos() * animState.getValue());
            T valueFromNanos = animation.getValueFromNanos(initialPlayTimeNanos);
            if (this.useOnlyInitialValue) {
                getAnimation().setMutableTargetValue$animation_core_release(valueFromNanos);
            }
            getAnimation().setMutableInitialValue$animation_core_release(valueFromNanos);
            setDurationNanos$animation_core_release(getAnimation().getDurationNanos());
            if ((getResetSnapValue$animation_core_release() == -2.0f) || this.useOnlyInitialValue) {
                setValue$animation_core_release(valueFromNanos);
            } else {
                seekTo$animation_core_release(Transition.this.getPlayTimeNanos());
            }
            if (initialPlayTimeNanos >= animState.getDurationNanos()) {
                this.initialValueState = null;
                this.initialValueAnimation = null;
                return;
            }
            animState.setComplete(false);
        }

        /* JADX WARN: Multi-variable type inference failed */
        static /* synthetic */ void updateAnimation$default(TransitionAnimationState transitionAnimationState, Object obj, boolean z, int i, Object obj2) {
            if ((i & 1) != 0) {
                obj = transitionAnimationState.getValue();
            }
            if ((i & 2) != 0) {
                z = false;
            }
            transitionAnimationState.updateAnimation(obj, z);
        }

        private final void updateAnimation(T t, boolean isInterrupted) {
            FiniteAnimationSpec<T> animationSpec;
            FiniteAnimationSpec<T> spec;
            TargetBasedAnimation<T, V> targetBasedAnimation = this.initialValueAnimation;
            if (Intrinsics.areEqual(targetBasedAnimation != null ? targetBasedAnimation.getTargetValue() : null, getTargetValue())) {
                setAnimation(new TargetBasedAnimation<>(this.interruptionSpec, this.typeConverter, t, t, AnimationVectorsKt.newInstance(this.velocityVector)));
                this.useOnlyInitialValue = true;
                setDurationNanos$animation_core_release(getAnimation().getDurationNanos());
                return;
            }
            if (isInterrupted && !this.isSeeking) {
                animationSpec = getAnimationSpec() instanceof SpringSpec ? getAnimationSpec() : this.interruptionSpec;
            } else {
                animationSpec = getAnimationSpec();
            }
            if (Transition.this.getPlayTimeNanos() <= 0) {
                spec = animationSpec;
            } else {
                spec = AnimationSpecKt.delayed(animationSpec, Transition.this.getPlayTimeNanos());
            }
            setAnimation(new TargetBasedAnimation<>(spec, this.typeConverter, t, getTargetValue(), this.velocityVector));
            setDurationNanos$animation_core_release(getAnimation().getDurationNanos());
            this.useOnlyInitialValue = false;
            Transition.this.onChildAnimationUpdated();
        }

        public final void resetAnimation$animation_core_release() {
            setResetSnapValue$animation_core_release(-2.0f);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final void resetAnimationValue$animation_core_release(float fraction) {
            Object animationValue;
            if (!(fraction == -4.0f)) {
                if (!(fraction == -5.0f)) {
                    setResetSnapValue$animation_core_release(fraction);
                    return;
                }
            }
            TargetBasedAnimation initAnim = this.initialValueAnimation;
            if (initAnim != null) {
                getAnimation().setMutableInitialValue$animation_core_release(initAnim.getTargetValue());
                this.initialValueState = null;
                this.initialValueAnimation = null;
            }
            if (fraction == -4.0f) {
                animationValue = getAnimation().getInitialValue();
            } else {
                animationValue = getAnimation().getTargetValue();
            }
            getAnimation().setMutableInitialValue$animation_core_release(animationValue);
            getAnimation().setMutableTargetValue$animation_core_release(animationValue);
            setValue$animation_core_release(animationValue);
            setDurationNanos$animation_core_release(getAnimation().getDurationNanos());
        }

        public final void setInitialValueAnimation$animation_core_release(SeekableTransitionState.SeekingAnimationState animationState) {
            if (!Intrinsics.areEqual(getAnimation().getTargetValue(), getAnimation().getInitialValue())) {
                this.initialValueAnimation = getAnimation();
                this.initialValueState = animationState;
            }
            setAnimation(new TargetBasedAnimation<>(this.interruptionSpec, this.typeConverter, getValue(), getValue(), AnimationVectorsKt.newInstance(this.velocityVector)));
            setDurationNanos$animation_core_release(getAnimation().getDurationNanos());
            this.useOnlyInitialValue = true;
        }

        public final void clearInitialAnimation$animation_core_release() {
            this.initialValueAnimation = null;
            this.initialValueState = null;
            this.useOnlyInitialValue = false;
        }

        public String toString() {
            return "current value: " + getValue() + ", target: " + getTargetValue() + ", spec: " + getAnimationSpec();
        }

        public final void updateTargetValue$animation_core_release(T t, FiniteAnimationSpec<T> finiteAnimationSpec) {
            if (this.useOnlyInitialValue) {
                TargetBasedAnimation<T, V> targetBasedAnimation = this.initialValueAnimation;
                if (Intrinsics.areEqual(t, targetBasedAnimation != null ? targetBasedAnimation.getTargetValue() : null)) {
                    return;
                }
            }
            if (Intrinsics.areEqual(getTargetValue(), t)) {
                if (getResetSnapValue$animation_core_release() == -1.0f) {
                    return;
                }
            }
            setTargetValue(t);
            setAnimationSpec(finiteAnimationSpec);
            updateAnimation((getResetSnapValue$animation_core_release() > (-3.0f) ? 1 : (getResetSnapValue$animation_core_release() == (-3.0f) ? 0 : -1)) == 0 ? t : getValue(), !isFinished$animation_core_release());
            setFinished$animation_core_release(getResetSnapValue$animation_core_release() == -3.0f);
            if (getResetSnapValue$animation_core_release() >= 0.0f) {
                long duration = getAnimation().getDurationNanos();
                setValue$animation_core_release(getAnimation().getValueFromNanos(((float) duration) * getResetSnapValue$animation_core_release()));
            } else {
                if (getResetSnapValue$animation_core_release() == -3.0f) {
                    setValue$animation_core_release(t);
                }
            }
            this.useOnlyInitialValue = false;
            setResetSnapValue$animation_core_release(-1.0f);
        }

        public final void updateInitialAndTargetValue$animation_core_release(T t, T t2, FiniteAnimationSpec<T> finiteAnimationSpec) {
            setTargetValue(t2);
            setAnimationSpec(finiteAnimationSpec);
            if (Intrinsics.areEqual(getAnimation().getInitialValue(), t) && Intrinsics.areEqual(getAnimation().getTargetValue(), t2)) {
                return;
            }
            updateAnimation$default(this, t, false, 2, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: Transition.kt */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u0015\u0012\u0006\u0010\u0003\u001a\u00028\u0001\u0012\u0006\u0010\u0004\u001a\u00028\u0001¢\u0006\u0002\u0010\u0005J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rH\u0096\u0002J\b\u0010\u000e\u001a\u00020\u000fH\u0016R\u0016\u0010\u0003\u001a\u00028\u0001X\u0096\u0004¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007R\u0016\u0010\u0004\u001a\u00028\u0001X\u0096\u0004¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\t\u0010\u0007¨\u0006\u0010"}, d2 = {"Landroidx/compose/animation/core/Transition$SegmentImpl;", ExifInterface.LATITUDE_SOUTH, "Landroidx/compose/animation/core/Transition$Segment;", "initialState", "targetState", "(Ljava/lang/Object;Ljava/lang/Object;)V", "getInitialState", "()Ljava/lang/Object;", "Ljava/lang/Object;", "getTargetState", "equals", "", "other", "", "hashCode", "", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class SegmentImpl<S> implements Segment<S> {
        private final S initialState;
        private final S targetState;

        public SegmentImpl(S s, S s2) {
            this.initialState = s;
            this.targetState = s2;
        }

        @Override // androidx.compose.animation.core.Transition.Segment
        public S getInitialState() {
            return this.initialState;
        }

        @Override // androidx.compose.animation.core.Transition.Segment
        public S getTargetState() {
            return this.targetState;
        }

        public boolean equals(Object other) {
            return (other instanceof Segment) && Intrinsics.areEqual(getInitialState(), ((Segment) other).getInitialState()) && Intrinsics.areEqual(getTargetState(), ((Segment) other).getTargetState());
        }

        public int hashCode() {
            S initialState = getInitialState();
            int hashCode = (initialState != null ? initialState.hashCode() : 0) * 31;
            S targetState = getTargetState();
            return hashCode + (targetState != null ? targetState.hashCode() : 0);
        }
    }

    /* compiled from: Transition.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0002\bf\u0018\u0000*\u0004\b\u0001\u0010\u00012\u00020\u0002J\u001a\u0010\b\u001a\u00020\t*\u00028\u00012\u0006\u0010\u0006\u001a\u00028\u0001H\u0096\u0004¢\u0006\u0002\u0010\nR\u0012\u0010\u0003\u001a\u00028\u0001X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00028\u0001X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\u0005ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u000bÀ\u0006\u0003"}, d2 = {"Landroidx/compose/animation/core/Transition$Segment;", ExifInterface.LATITUDE_SOUTH, "", "initialState", "getInitialState", "()Ljava/lang/Object;", "targetState", "getTargetState", "isTransitioningTo", "", "(Ljava/lang/Object;Ljava/lang/Object;)Z", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public interface Segment<S> {
        S getInitialState();

        S getTargetState();

        /* compiled from: Transition.kt */
        @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public static final class DefaultImpls {
            @Deprecated
            public static <S> boolean isTransitioningTo(Segment<S> segment, S s, S s2) {
                return Segment.super.isTransitioningTo(s, s2);
            }
        }

        default boolean isTransitioningTo(S s, S s2) {
            return Intrinsics.areEqual(s, getInitialState()) && Intrinsics.areEqual(s2, getTargetState());
        }
    }

    /* compiled from: Transition.kt */
    @Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0087\u0004\u0018\u0000*\u0004\b\u0001\u0010\u0001*\b\b\u0002\u0010\u0002*\u00020\u00032\u00020\u0004:\u0001&B#\b\u0000\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\tJT\u0010\u0018\u001a\b\u0012\u0004\u0012\u00028\u00010\u00192#\u0010\u001a\u001a\u001f\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u001c\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00010\u001d0\u001b¢\u0006\u0002\b\u001e2!\u0010\u001f\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b \u0012\b\b!\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00028\u00010\u001bJ\r\u0010#\u001a\u00020$H\u0000¢\u0006\u0002\b%R{\u0010\r\u001a*\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u0002\u0018\u00010\u000bR\u0018\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0000R\b\u0012\u0004\u0012\u00028\u00000\f2.\u0010\n\u001a*\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u0002\u0018\u00010\u000bR\u0018\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0000R\b\u0012\u0004\u0012\u00028\u00000\f8@@@X\u0080\u008e\u0002¢\u0006\u0012\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u001d\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006'"}, d2 = {"Landroidx/compose/animation/core/Transition$DeferredAnimation;", ExifInterface.GPS_DIRECTION_TRUE, ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "", "typeConverter", "Landroidx/compose/animation/core/TwoWayConverter;", "label", "", "(Landroidx/compose/animation/core/Transition;Landroidx/compose/animation/core/TwoWayConverter;Ljava/lang/String;)V", "<set-?>", "Landroidx/compose/animation/core/Transition$DeferredAnimation$DeferredAnimationData;", "Landroidx/compose/animation/core/Transition;", "data", "getData$animation_core_release", "()Landroidx/compose/animation/core/Transition$DeferredAnimation$DeferredAnimationData;", "setData$animation_core_release", "(Landroidx/compose/animation/core/Transition$DeferredAnimation$DeferredAnimationData;)V", "data$delegate", "Landroidx/compose/runtime/MutableState;", "getLabel", "()Ljava/lang/String;", "getTypeConverter", "()Landroidx/compose/animation/core/TwoWayConverter;", "animate", "Landroidx/compose/runtime/State;", "transitionSpec", "Lkotlin/Function1;", "Landroidx/compose/animation/core/Transition$Segment;", "Landroidx/compose/animation/core/FiniteAnimationSpec;", "Lkotlin/ExtensionFunctionType;", "targetValueByState", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "state", "setupSeeking", "", "setupSeeking$animation_core_release", "DeferredAnimationData", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public final class DeferredAnimation<T, V extends AnimationVector> {
        private final MutableState data$delegate;
        private final String label;
        private final TwoWayConverter<T, V> typeConverter;

        public DeferredAnimation(TwoWayConverter<T, V> twoWayConverter, String label) {
            MutableState mutableStateOf$default;
            this.typeConverter = twoWayConverter;
            this.label = label;
            mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
            this.data$delegate = mutableStateOf$default;
        }

        public final TwoWayConverter<T, V> getTypeConverter() {
            return this.typeConverter;
        }

        public final String getLabel() {
            return this.label;
        }

        public final Transition<S>.DeferredAnimationData<T, V>.DeferredAnimationData<T, V> getData$animation_core_release() {
            State $this$getValue$iv = this.data$delegate;
            return (DeferredAnimationData) $this$getValue$iv.getValue();
        }

        public final void setData$animation_core_release(Transition<S>.DeferredAnimationData<T, V>.DeferredAnimationData<T, V> deferredAnimationData) {
            MutableState $this$setValue$iv = this.data$delegate;
            $this$setValue$iv.setValue(deferredAnimationData);
        }

        /* compiled from: Transition.kt */
        @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0080\u0004\u0018\u0000*\u0004\b\u0003\u0010\u0001*\b\b\u0004\u0010\u0002*\u00020\u00032\b\u0012\u0004\u0012\u0002H\u00010\u0004Bk\u0012\u001c\u0010\u0005\u001a\u0018\u0012\u0004\u0012\u00028\u0003\u0012\u0004\u0012\u00028\u00040\u0006R\b\u0012\u0004\u0012\u00028\u00000\u0007\u0012#\u0010\b\u001a\u001f\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\n\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00030\u000b0\t¢\u0006\u0002\b\f\u0012!\u0010\r\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u000e\u0012\b\b\u000f\u0012\u0004\b\b(\u0010\u0012\u0004\u0012\u00028\u00030\t¢\u0006\u0002\u0010\u0011J\u0014\u0010\u001d\u001a\u00020\u001e2\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00000\nR'\u0010\u0005\u001a\u0018\u0012\u0004\u0012\u00028\u0003\u0012\u0004\u0012\u00028\u00040\u0006R\b\u0012\u0004\u0012\u00028\u00000\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R5\u0010\r\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u000e\u0012\b\b\u000f\u0012\u0004\b\b(\u0010\u0012\u0004\u0012\u00028\u00030\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R7\u0010\b\u001a\u001f\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\n\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00030\u000b0\t¢\u0006\u0002\b\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0015\"\u0004\b\u0019\u0010\u0017R\u0014\u0010\u001a\u001a\u00028\u00038VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u001c¨\u0006 "}, d2 = {"Landroidx/compose/animation/core/Transition$DeferredAnimation$DeferredAnimationData;", ExifInterface.GPS_DIRECTION_TRUE, ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "Landroidx/compose/runtime/State;", "animation", "Landroidx/compose/animation/core/Transition$TransitionAnimationState;", "Landroidx/compose/animation/core/Transition;", "transitionSpec", "Lkotlin/Function1;", "Landroidx/compose/animation/core/Transition$Segment;", "Landroidx/compose/animation/core/FiniteAnimationSpec;", "Lkotlin/ExtensionFunctionType;", "targetValueByState", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "state", "(Landroidx/compose/animation/core/Transition$DeferredAnimation;Landroidx/compose/animation/core/Transition$TransitionAnimationState;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V", "getAnimation", "()Landroidx/compose/animation/core/Transition$TransitionAnimationState;", "getTargetValueByState", "()Lkotlin/jvm/functions/Function1;", "setTargetValueByState", "(Lkotlin/jvm/functions/Function1;)V", "getTransitionSpec", "setTransitionSpec", "value", "getValue", "()Ljava/lang/Object;", "updateAnimationStates", "", "segment", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public final class DeferredAnimationData<T, V extends AnimationVector> implements State<T> {
            private final Transition<S>.TransitionAnimationState<T, V> animation;
            private Function1<? super S, ? extends T> targetValueByState;
            private Function1<? super Segment<S>, ? extends FiniteAnimationSpec<T>> transitionSpec;

            public DeferredAnimationData(Transition<S>.TransitionAnimationState<T, V> transitionAnimationState, Function1<? super Segment<S>, ? extends FiniteAnimationSpec<T>> function1, Function1<? super S, ? extends T> function12) {
                this.animation = transitionAnimationState;
                this.transitionSpec = function1;
                this.targetValueByState = function12;
            }

            public final Transition<S>.TransitionAnimationState<T, V> getAnimation() {
                return this.animation;
            }

            public final Function1<Segment<S>, FiniteAnimationSpec<T>> getTransitionSpec() {
                return (Function1<? super Segment<S>, ? extends FiniteAnimationSpec<T>>) this.transitionSpec;
            }

            public final void setTransitionSpec(Function1<? super Segment<S>, ? extends FiniteAnimationSpec<T>> function1) {
                this.transitionSpec = function1;
            }

            public final Function1<S, T> getTargetValueByState() {
                return (Function1<? super S, ? extends T>) this.targetValueByState;
            }

            public final void setTargetValueByState(Function1<? super S, ? extends T> function1) {
                this.targetValueByState = function1;
            }

            public final void updateAnimationStates(Segment<S> segment) {
                T invoke = this.targetValueByState.invoke(segment.getTargetState());
                if (Transition.this.isSeeking()) {
                    this.animation.updateInitialAndTargetValue$animation_core_release(this.targetValueByState.invoke(segment.getInitialState()), invoke, this.transitionSpec.invoke(segment));
                    return;
                }
                this.animation.updateTargetValue$animation_core_release(invoke, this.transitionSpec.invoke(segment));
            }

            @Override // androidx.compose.runtime.State
            public T getValue() {
                updateAnimationStates(Transition.this.getSegment());
                return this.animation.getValue();
            }
        }

        public final State<T> animate(Function1<? super Segment<S>, ? extends FiniteAnimationSpec<T>> function1, Function1<? super S, ? extends T> function12) {
            DeferredAnimationData $this$animate_u24lambda_u240 = getData$animation_core_release();
            if ($this$animate_u24lambda_u240 == null) {
                $this$animate_u24lambda_u240 = new DeferredAnimationData(new TransitionAnimationState(function12.invoke((S) Transition.this.getCurrentState()), AnimationStateKt.createZeroVectorFrom(this.typeConverter, function12.invoke((S) Transition.this.getCurrentState())), this.typeConverter, this.label), function1, function12);
                Transition<S> transition = Transition.this;
                setData$animation_core_release($this$animate_u24lambda_u240);
                transition.addAnimation$animation_core_release($this$animate_u24lambda_u240.getAnimation());
            }
            Transition<S> transition2 = Transition.this;
            DeferredAnimationData $this$animate_u24lambda_u241 = $this$animate_u24lambda_u240;
            $this$animate_u24lambda_u241.setTargetValueByState(function12);
            $this$animate_u24lambda_u241.setTransitionSpec(function1);
            $this$animate_u24lambda_u241.updateAnimationStates(transition2.getSegment());
            return $this$animate_u24lambda_u240;
        }

        public final void setupSeeking$animation_core_release() {
            DeferredAnimationData $this$setupSeeking_u24lambda_u242 = getData$animation_core_release();
            if ($this$setupSeeking_u24lambda_u242 != null) {
                Transition<S> transition = Transition.this;
                $this$setupSeeking_u24lambda_u242.getAnimation().updateInitialAndTargetValue$animation_core_release($this$setupSeeking_u24lambda_u242.getTargetValueByState().invoke(transition.getSegment().getInitialState()), $this$setupSeeking_u24lambda_u242.getTargetValueByState().invoke(transition.getSegment().getTargetState()), $this$setupSeeking_u24lambda_u242.getTransitionSpec().invoke(transition.getSegment()));
            }
        }
    }

    public final void removeAnimation$animation_core_release(Transition<S>.DeferredAnimation<?, ?> deferredAnimation) {
        TransitionAnimationState it;
        Transition<S>.DeferredAnimationData<?, V>.DeferredAnimationData<?, ?> data$animation_core_release = deferredAnimation.getData$animation_core_release();
        if (data$animation_core_release != null && (it = data$animation_core_release.getAnimation()) != null) {
            removeAnimation$animation_core_release(it);
        }
    }
}
