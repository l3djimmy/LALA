package androidx.compose.foundation.gestures;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.gestures.DragEvent;
import androidx.compose.foundation.interaction.DragInteraction;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.input.pointer.PointerEventPass;
import androidx.compose.ui.input.pointer.PointerInputChange;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import androidx.compose.ui.input.pointer.SuspendingPointerInputModifierNode;
import androidx.compose.ui.input.pointer.util.VelocityTracker;
import androidx.compose.ui.input.pointer.util.VelocityTrackerKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.PointerInputModifierNode;
import androidx.compose.ui.unit.VelocityKt;
import androidx.core.app.NotificationCompat;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.channels.Channel;
import kotlinx.coroutines.channels.ChannelKt;
import kotlinx.coroutines.channels.ChannelResult;
/* compiled from: Draggable.kt */
@Metadata(d1 = {"\u0000\u009c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b \u0018\u00002\u00020\u00012\u00020\u0002B5\u0012\u0012\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\u0002\u0010\fJ\u0006\u0010\u001d\u001a\u00020\u001eJM\u0010\u001f\u001a\u00020\u001e2=\u0010 \u001a9\b\u0001\u0012\u001f\u0012\u001d\u0012\u0013\u0012\u00110\"¢\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(%\u0012\u0004\u0012\u00020\u001e0\u0004\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001e0&\u0012\u0006\u0012\u0004\u0018\u00010'0!H¦@¢\u0006\u0002\u0010(J\b\u0010)\u001a\u00020\u001cH\u0002J\b\u0010*\u001a\u00020\u001eH\u0016J\b\u0010+\u001a\u00020\u001eH\u0016J\u001a\u0010,\u001a\u00020\u001e2\u0006\u0010-\u001a\u00020.H&ø\u0001\u0000¢\u0006\u0004\b/\u00100J\u001a\u00101\u001a\u00020\u001e2\u0006\u00102\u001a\u000203H&ø\u0001\u0000¢\u0006\u0004\b4\u00100J*\u00105\u001a\u00020\u001e2\u0006\u00106\u001a\u0002072\u0006\u00108\u001a\u0002092\u0006\u0010:\u001a\u00020;H\u0016ø\u0001\u0000¢\u0006\u0004\b<\u0010=J\u000e\u0010>\u001a\u00020\u001eH\u0082@¢\u0006\u0002\u0010?J\u0016\u0010@\u001a\u00020\u001e2\u0006\u0010A\u001a\u00020BH\u0082@¢\u0006\u0002\u0010CJ\u0016\u0010D\u001a\u00020\u001e2\u0006\u0010A\u001a\u00020EH\u0082@¢\u0006\u0002\u0010FJ\b\u0010G\u001a\u00020\u0006H&J\b\u0010H\u001a\u00020\u001eH\u0002JH\u0010I\u001a\u00020\u001e2\u0014\b\u0002\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010J\u001a\u00020\u0006R\u001a\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R6\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00042\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004@BX\u0084\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0016\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006@BX\u0084\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\"\u0010\b\u001a\u0004\u0018\u00010\t2\b\u0010\u000e\u001a\u0004\u0018\u00010\t@BX\u0084\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u000e\u0010\u001a\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006K"}, d2 = {"Landroidx/compose/foundation/gestures/DragGestureNode;", "Landroidx/compose/ui/node/DelegatingNode;", "Landroidx/compose/ui/node/PointerInputModifierNode;", "canDrag", "Lkotlin/Function1;", "Landroidx/compose/ui/input/pointer/PointerInputChange;", "", "enabled", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "orientationLock", "Landroidx/compose/foundation/gestures/Orientation;", "(Lkotlin/jvm/functions/Function1;ZLandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/foundation/gestures/Orientation;)V", "_canDrag", "<set-?>", "getCanDrag", "()Lkotlin/jvm/functions/Function1;", "channel", "Lkotlinx/coroutines/channels/Channel;", "Landroidx/compose/foundation/gestures/DragEvent;", "dragInteraction", "Landroidx/compose/foundation/interaction/DragInteraction$Start;", "getEnabled", "()Z", "getInteractionSource", "()Landroidx/compose/foundation/interaction/MutableInteractionSource;", "isListeningForEvents", "pointerInputNode", "Landroidx/compose/ui/input/pointer/SuspendingPointerInputModifierNode;", "disposeInteractionSource", "", "drag", "forEachDelta", "Lkotlin/Function2;", "Landroidx/compose/foundation/gestures/DragEvent$DragDelta;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "dragDelta", "Lkotlin/coroutines/Continuation;", "", "(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "initializePointerInputNode", "onCancelPointerInput", "onDetach", "onDragStarted", "startedPosition", "Landroidx/compose/ui/geometry/Offset;", "onDragStarted-k-4lQ0M", "(J)V", "onDragStopped", "velocity", "Landroidx/compose/ui/unit/Velocity;", "onDragStopped-TH1AsA0", "onPointerEvent", "pointerEvent", "Landroidx/compose/ui/input/pointer/PointerEvent;", "pass", "Landroidx/compose/ui/input/pointer/PointerEventPass;", "bounds", "Landroidx/compose/ui/unit/IntSize;", "onPointerEvent-H0pRuoY", "(Landroidx/compose/ui/input/pointer/PointerEvent;Landroidx/compose/ui/input/pointer/PointerEventPass;J)V", "processDragCancel", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "processDragStart", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/foundation/gestures/DragEvent$DragStarted;", "(Landroidx/compose/foundation/gestures/DragEvent$DragStarted;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "processDragStop", "Landroidx/compose/foundation/gestures/DragEvent$DragStopped;", "(Landroidx/compose/foundation/gestures/DragEvent$DragStopped;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "startDragImmediately", "startListeningForEvents", "update", "shouldResetPointerInputHandling", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class DragGestureNode extends DelegatingNode implements PointerInputModifierNode {
    public static final int $stable = 8;
    private final Function1<PointerInputChange, Boolean> _canDrag = new Function1<PointerInputChange, Boolean>() { // from class: androidx.compose.foundation.gestures.DragGestureNode$_canDrag$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Boolean invoke(PointerInputChange it) {
            return DragGestureNode.this.getCanDrag().invoke(it);
        }
    };
    private Function1<? super PointerInputChange, Boolean> canDrag;
    private Channel<DragEvent> channel;
    private DragInteraction.Start dragInteraction;
    private boolean enabled;
    private MutableInteractionSource interactionSource;
    private boolean isListeningForEvents;
    private Orientation orientationLock;
    private SuspendingPointerInputModifierNode pointerInputNode;

    public abstract Object drag(Function2<? super Function1<? super DragEvent.DragDelta, Unit>, ? super Continuation<? super Unit>, ? extends Object> function2, Continuation<? super Unit> continuation);

    /* renamed from: onDragStarted-k-4lQ0M */
    public abstract void mo662onDragStartedk4lQ0M(long j);

    /* renamed from: onDragStopped-TH1AsA0 */
    public abstract void mo663onDragStoppedTH1AsA0(long j);

    public abstract boolean startDragImmediately();

    public DragGestureNode(Function1<? super PointerInputChange, Boolean> function1, boolean enabled, MutableInteractionSource interactionSource, Orientation orientationLock) {
        this.orientationLock = orientationLock;
        this.canDrag = function1;
        this.enabled = enabled;
        this.interactionSource = interactionSource;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final Function1<PointerInputChange, Boolean> getCanDrag() {
        return this.canDrag;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean getEnabled() {
        return this.enabled;
    }

    protected final MutableInteractionSource getInteractionSource() {
        return this.interactionSource;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void startListeningForEvents() {
        this.isListeningForEvents = true;
        BuildersKt__Builders_commonKt.launch$default(getCoroutineScope(), null, null, new DragGestureNode$startListeningForEvents$1(this, null), 3, null);
    }

    @Override // androidx.compose.ui.Modifier.Node
    public void onDetach() {
        this.isListeningForEvents = false;
        disposeInteractionSource();
    }

    @Override // androidx.compose.ui.node.PointerInputModifierNode
    /* renamed from: onPointerEvent-H0pRuoY */
    public void mo472onPointerEventH0pRuoY(PointerEvent pointerEvent, PointerEventPass pass, long bounds) {
        if (this.enabled && this.pointerInputNode == null) {
            this.pointerInputNode = (SuspendingPointerInputModifierNode) delegate(initializePointerInputNode());
        }
        SuspendingPointerInputModifierNode suspendingPointerInputModifierNode = this.pointerInputNode;
        if (suspendingPointerInputModifierNode != null) {
            suspendingPointerInputModifierNode.mo472onPointerEventH0pRuoY(pointerEvent, pass, bounds);
        }
    }

    private final SuspendingPointerInputModifierNode initializePointerInputNode() {
        return SuspendingPointerInputFilterKt.SuspendingPointerInputModifierNode(new PointerInputEventHandler() { // from class: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1
            @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
            public final Object invoke(final PointerInputScope $this$SuspendingPointerInputModifierNode, Continuation<? super Unit> continuation) {
                final VelocityTracker velocityTracker = new VelocityTracker();
                final DragGestureNode dragGestureNode = DragGestureNode.this;
                Function3 onDragStart = new Function3<PointerInputChange, PointerInputChange, Offset, Unit>() { // from class: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$onDragStart$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(3);
                    }

                    @Override // kotlin.jvm.functions.Function3
                    public /* bridge */ /* synthetic */ Unit invoke(PointerInputChange pointerInputChange, PointerInputChange pointerInputChange2, Offset offset) {
                        m711invoke0AR0LA0(pointerInputChange, pointerInputChange2, offset.m4058unboximpl());
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke-0AR0LA0  reason: not valid java name */
                    public final void m711invoke0AR0LA0(PointerInputChange down, PointerInputChange slopTriggerChange, long postSlopOffset) {
                        boolean z;
                        Channel channel;
                        Channel channel2;
                        if (DragGestureNode.this.getCanDrag().invoke(down).booleanValue()) {
                            z = DragGestureNode.this.isListeningForEvents;
                            if (!z) {
                                channel2 = DragGestureNode.this.channel;
                                if (channel2 == null) {
                                    DragGestureNode.this.channel = ChannelKt.Channel$default(Integer.MAX_VALUE, null, null, 6, null);
                                }
                                DragGestureNode.this.startListeningForEvents();
                            }
                            VelocityTrackerKt.addPointerInputChange(velocityTracker, down);
                            long dragStartedOffset = Offset.m4052minusMKHz9U(slopTriggerChange.m5512getPositionF1C5BW0(), postSlopOffset);
                            channel = DragGestureNode.this.channel;
                            if (channel != null) {
                                ChannelResult.m8852boximpl(channel.mo8838trySendJP2dKIU(new DragEvent.DragStarted(dragStartedOffset, null)));
                            }
                        }
                    }
                };
                final DragGestureNode dragGestureNode2 = DragGestureNode.this;
                Function1 onDragEnd = new Function1<PointerInputChange, Unit>() { // from class: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$onDragEnd$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(PointerInputChange pointerInputChange) {
                        invoke2(pointerInputChange);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(PointerInputChange upEvent) {
                        Channel channel;
                        long m721toValidVelocityTH1AsA0;
                        VelocityTrackerKt.addPointerInputChange(VelocityTracker.this, upEvent);
                        float maximumVelocity = $this$SuspendingPointerInputModifierNode.getViewConfiguration().getMaximumFlingVelocity();
                        long velocity = VelocityTracker.this.m5610calculateVelocityAH228Gc(VelocityKt.Velocity(maximumVelocity, maximumVelocity));
                        VelocityTracker.this.resetTracking();
                        channel = dragGestureNode2.channel;
                        if (channel != null) {
                            m721toValidVelocityTH1AsA0 = DraggableKt.m721toValidVelocityTH1AsA0(velocity);
                            ChannelResult.m8852boximpl(channel.mo8838trySendJP2dKIU(new DragEvent.DragStopped(m721toValidVelocityTH1AsA0, null)));
                        }
                    }
                };
                final DragGestureNode dragGestureNode3 = DragGestureNode.this;
                Function0 onDragCancel = new Function0<Unit>() { // from class: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$onDragCancel$1
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
                        Channel channel;
                        channel = DragGestureNode.this.channel;
                        if (channel != null) {
                            ChannelResult.m8852boximpl(channel.mo8838trySendJP2dKIU(DragEvent.DragCancelled.INSTANCE));
                        }
                    }
                };
                final DragGestureNode dragGestureNode4 = DragGestureNode.this;
                Function0 shouldAwaitTouchSlop = new Function0<Boolean>() { // from class: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$shouldAwaitTouchSlop$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Boolean invoke() {
                        return Boolean.valueOf(!DragGestureNode.this.startDragImmediately());
                    }
                };
                final DragGestureNode dragGestureNode5 = DragGestureNode.this;
                Function2 onDrag = new Function2<PointerInputChange, Offset, Unit>() { // from class: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$onDrag$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(2);
                    }

                    @Override // kotlin.jvm.functions.Function2
                    public /* bridge */ /* synthetic */ Unit invoke(PointerInputChange pointerInputChange, Offset offset) {
                        m710invokeUv8p0NA(pointerInputChange, offset.m4058unboximpl());
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke-Uv8p0NA  reason: not valid java name */
                    public final void m710invokeUv8p0NA(PointerInputChange change, long delta) {
                        Channel channel;
                        VelocityTrackerKt.addPointerInputChange(VelocityTracker.this, change);
                        channel = dragGestureNode5.channel;
                        if (channel != null) {
                            ChannelResult.m8852boximpl(channel.mo8838trySendJP2dKIU(new DragEvent.DragDelta(delta, null)));
                        }
                    }
                };
                Object coroutineScope = CoroutineScopeKt.coroutineScope(new AnonymousClass1(DragGestureNode.this, $this$SuspendingPointerInputModifierNode, onDragStart, onDragEnd, onDragCancel, shouldAwaitTouchSlop, onDrag, null), continuation);
                return coroutineScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? coroutineScope : Unit.INSTANCE;
            }

            /* compiled from: Draggable.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$1", f = "Draggable.kt", i = {0}, l = {512}, m = "invokeSuspend", n = {"$this$coroutineScope"}, s = {"L$0"})
            /* renamed from: androidx.compose.foundation.gestures.DragGestureNode$initializePointerInputNode$1$1  reason: invalid class name */
            /* loaded from: classes.dex */
            static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                final /* synthetic */ Function2<PointerInputChange, Offset, Unit> $onDrag;
                final /* synthetic */ Function0<Unit> $onDragCancel;
                final /* synthetic */ Function1<PointerInputChange, Unit> $onDragEnd;
                final /* synthetic */ Function3<PointerInputChange, PointerInputChange, Offset, Unit> $onDragStart;
                final /* synthetic */ Function0<Boolean> $shouldAwaitTouchSlop;
                final /* synthetic */ PointerInputScope $this_SuspendingPointerInputModifierNode;
                private /* synthetic */ Object L$0;
                int label;
                final /* synthetic */ DragGestureNode this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                AnonymousClass1(DragGestureNode dragGestureNode, PointerInputScope pointerInputScope, Function3<? super PointerInputChange, ? super PointerInputChange, ? super Offset, Unit> function3, Function1<? super PointerInputChange, Unit> function1, Function0<Unit> function0, Function0<Boolean> function02, Function2<? super PointerInputChange, ? super Offset, Unit> function2, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.this$0 = dragGestureNode;
                    this.$this_SuspendingPointerInputModifierNode = pointerInputScope;
                    this.$onDragStart = function3;
                    this.$onDragEnd = function1;
                    this.$onDragCancel = function0;
                    this.$shouldAwaitTouchSlop = function02;
                    this.$onDrag = function2;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.this$0, this.$this_SuspendingPointerInputModifierNode, this.$onDragStart, this.$onDragEnd, this.$onDragCancel, this.$shouldAwaitTouchSlop, this.$onDrag, continuation);
                    anonymousClass1.L$0 = obj;
                    return anonymousClass1;
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                /* JADX WARN: Multi-variable type inference failed */
                /* JADX WARN: Type inference failed for: r1v0, types: [int] */
                /* JADX WARN: Type inference failed for: r1v1, types: [kotlinx.coroutines.CoroutineScope] */
                /* JADX WARN: Type inference failed for: r1v4 */
                /* JADX WARN: Type inference failed for: r1v7 */
                /* JADX WARN: Type inference failed for: r1v8 */
                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object $result) {
                    Channel channel;
                    Orientation orientation;
                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                    ?? r1 = this.label;
                    try {
                        switch (r1) {
                            case 0:
                                ResultKt.throwOnFailure($result);
                                CoroutineScope $this$coroutineScope = (CoroutineScope) this.L$0;
                                orientation = this.this$0.orientationLock;
                                this.L$0 = $this$coroutineScope;
                                this.label = 1;
                                r1 = $this$coroutineScope;
                                if (DragGestureDetectorKt.detectDragGestures(this.$this_SuspendingPointerInputModifierNode, this.$onDragStart, this.$onDragEnd, this.$onDragCancel, this.$shouldAwaitTouchSlop, orientation, this.$onDrag, this) == coroutine_suspended) {
                                    return coroutine_suspended;
                                }
                                break;
                            case 1:
                                CoroutineScope coroutineScope = (CoroutineScope) this.L$0;
                                ResultKt.throwOnFailure($result);
                                r1 = coroutineScope;
                                break;
                            default:
                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                    } catch (CancellationException cancellation) {
                        channel = this.this$0.channel;
                        if (channel != null) {
                            ChannelResult.m8852boximpl(channel.mo8838trySendJP2dKIU(DragEvent.DragCancelled.INSTANCE));
                        }
                        if (!CoroutineScopeKt.isActive(r1)) {
                            throw cancellation;
                        }
                    }
                    return Unit.INSTANCE;
                }
            }
        });
    }

    @Override // androidx.compose.ui.node.PointerInputModifierNode
    public void onCancelPointerInput() {
        SuspendingPointerInputModifierNode suspendingPointerInputModifierNode = this.pointerInputNode;
        if (suspendingPointerInputModifierNode != null) {
            suspendingPointerInputModifierNode.onCancelPointerInput();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0079  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object processDragStart(androidx.compose.foundation.gestures.DragEvent.DragStarted r10, kotlin.coroutines.Continuation<? super kotlin.Unit> r11) {
        /*
            r9 = this;
            boolean r0 = r11 instanceof androidx.compose.foundation.gestures.DragGestureNode$processDragStart$1
            if (r0 == 0) goto L14
            r0 = r11
            androidx.compose.foundation.gestures.DragGestureNode$processDragStart$1 r0 = (androidx.compose.foundation.gestures.DragGestureNode$processDragStart$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.gestures.DragGestureNode$processDragStart$1 r0 = new androidx.compose.foundation.gestures.DragGestureNode$processDragStart$1
            r0.<init>(r9, r11)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L4a;
                case 1: goto L3d;
                case 2: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r10.<init>(r0)
            throw r10
        L2d:
            java.lang.Object r10 = r0.L$2
            androidx.compose.foundation.interaction.DragInteraction$Start r10 = (androidx.compose.foundation.interaction.DragInteraction.Start) r10
            java.lang.Object r2 = r0.L$1
            androidx.compose.foundation.gestures.DragEvent$DragStarted r2 = (androidx.compose.foundation.gestures.DragEvent.DragStarted) r2
            java.lang.Object r3 = r0.L$0
            androidx.compose.foundation.gestures.DragGestureNode r3 = (androidx.compose.foundation.gestures.DragGestureNode) r3
            kotlin.ResultKt.throwOnFailure(r1)
            goto L8e
        L3d:
            r10 = 0
            java.lang.Object r3 = r0.L$1
            androidx.compose.foundation.gestures.DragEvent$DragStarted r3 = (androidx.compose.foundation.gestures.DragEvent.DragStarted) r3
            java.lang.Object r4 = r0.L$0
            androidx.compose.foundation.gestures.DragGestureNode r4 = (androidx.compose.foundation.gestures.DragGestureNode) r4
            kotlin.ResultKt.throwOnFailure(r1)
            goto L6e
        L4a:
            kotlin.ResultKt.throwOnFailure(r1)
            r4 = r9
            r3 = r10
            androidx.compose.foundation.interaction.DragInteraction$Start r10 = r4.dragInteraction
            if (r10 == 0) goto L6f
            r5 = 0
            androidx.compose.foundation.interaction.MutableInteractionSource r6 = r4.interactionSource
            if (r6 == 0) goto L6f
            androidx.compose.foundation.interaction.DragInteraction$Cancel r7 = new androidx.compose.foundation.interaction.DragInteraction$Cancel
            r7.<init>(r10)
            androidx.compose.foundation.interaction.Interaction r7 = (androidx.compose.foundation.interaction.Interaction) r7
            r0.L$0 = r4
            r0.L$1 = r3
            r8 = 1
            r0.label = r8
            java.lang.Object r10 = r6.emit(r7, r0)
            if (r10 != r2) goto L6d
            return r2
        L6d:
            r10 = r5
        L6e:
        L6f:
            androidx.compose.foundation.interaction.DragInteraction$Start r10 = new androidx.compose.foundation.interaction.DragInteraction$Start
            r10.<init>()
            androidx.compose.foundation.interaction.MutableInteractionSource r5 = r4.interactionSource
            if (r5 == 0) goto L90
            r6 = r10
            androidx.compose.foundation.interaction.Interaction r6 = (androidx.compose.foundation.interaction.Interaction) r6
            r0.L$0 = r4
            r0.L$1 = r3
            r0.L$2 = r10
            r7 = 2
            r0.label = r7
            java.lang.Object r5 = r5.emit(r6, r0)
            if (r5 != r2) goto L8c
            return r2
        L8c:
            r2 = r3
            r3 = r4
        L8e:
            r4 = r3
            r3 = r2
        L90:
            r4.dragInteraction = r10
            long r5 = r3.m682getStartPointF1C5BW0()
            r4.mo662onDragStartedk4lQ0M(r5)
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.DragGestureNode.processDragStart(androidx.compose.foundation.gestures.DragEvent$DragStarted, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object processDragStop(androidx.compose.foundation.gestures.DragEvent.DragStopped r10, kotlin.coroutines.Continuation<? super kotlin.Unit> r11) {
        /*
            r9 = this;
            boolean r0 = r11 instanceof androidx.compose.foundation.gestures.DragGestureNode$processDragStop$1
            if (r0 == 0) goto L14
            r0 = r11
            androidx.compose.foundation.gestures.DragGestureNode$processDragStop$1 r0 = (androidx.compose.foundation.gestures.DragGestureNode$processDragStop$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.gestures.DragGestureNode$processDragStop$1 r0 = new androidx.compose.foundation.gestures.DragGestureNode$processDragStop$1
            r0.<init>(r9, r11)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L3a;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r10.<init>(r0)
            throw r10
        L2d:
            r10 = 0
            java.lang.Object r2 = r0.L$1
            androidx.compose.foundation.gestures.DragEvent$DragStopped r2 = (androidx.compose.foundation.gestures.DragEvent.DragStopped) r2
            java.lang.Object r3 = r0.L$0
            androidx.compose.foundation.gestures.DragGestureNode r3 = (androidx.compose.foundation.gestures.DragGestureNode) r3
            kotlin.ResultKt.throwOnFailure(r1)
            goto L5e
        L3a:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r9
            androidx.compose.foundation.interaction.DragInteraction$Start r4 = r3.dragInteraction
            if (r4 == 0) goto L66
            r5 = 0
            androidx.compose.foundation.interaction.MutableInteractionSource r6 = r3.interactionSource
            if (r6 == 0) goto L61
            androidx.compose.foundation.interaction.DragInteraction$Stop r7 = new androidx.compose.foundation.interaction.DragInteraction$Stop
            r7.<init>(r4)
            androidx.compose.foundation.interaction.Interaction r7 = (androidx.compose.foundation.interaction.Interaction) r7
            r0.L$0 = r3
            r0.L$1 = r10
            r8 = 1
            r0.label = r8
            java.lang.Object r4 = r6.emit(r7, r0)
            if (r4 != r2) goto L5c
            return r2
        L5c:
            r2 = r10
            r10 = r5
        L5e:
            r5 = r10
            r10 = r2
        L61:
            r2 = 0
            r3.dragInteraction = r2
        L66:
            long r4 = r10.m683getVelocity9UxMQ8M()
            r3.mo663onDragStoppedTH1AsA0(r4)
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.DragGestureNode.processDragStop(androidx.compose.foundation.gestures.DragEvent$DragStopped, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0036  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object processDragCancel(kotlin.coroutines.Continuation<? super kotlin.Unit> r10) {
        /*
            r9 = this;
            boolean r0 = r10 instanceof androidx.compose.foundation.gestures.DragGestureNode$processDragCancel$1
            if (r0 == 0) goto L14
            r0 = r10
            androidx.compose.foundation.gestures.DragGestureNode$processDragCancel$1 r0 = (androidx.compose.foundation.gestures.DragGestureNode$processDragCancel$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.gestures.DragGestureNode$processDragCancel$1 r0 = new androidx.compose.foundation.gestures.DragGestureNode$processDragCancel$1
            r0.<init>(r9, r10)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L36;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2d:
            r2 = 0
            java.lang.Object r3 = r0.L$0
            androidx.compose.foundation.gestures.DragGestureNode r3 = (androidx.compose.foundation.gestures.DragGestureNode) r3
            kotlin.ResultKt.throwOnFailure(r1)
            goto L57
        L36:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r9
            androidx.compose.foundation.interaction.DragInteraction$Start r4 = r3.dragInteraction
            if (r4 == 0) goto L5e
            r5 = 0
            androidx.compose.foundation.interaction.MutableInteractionSource r6 = r3.interactionSource
            if (r6 == 0) goto L59
            androidx.compose.foundation.interaction.DragInteraction$Cancel r7 = new androidx.compose.foundation.interaction.DragInteraction$Cancel
            r7.<init>(r4)
            androidx.compose.foundation.interaction.Interaction r7 = (androidx.compose.foundation.interaction.Interaction) r7
            r0.L$0 = r3
            r8 = 1
            r0.label = r8
            java.lang.Object r4 = r6.emit(r7, r0)
            if (r4 != r2) goto L56
            return r2
        L56:
            r2 = r5
        L57:
            r5 = r2
        L59:
            r2 = 0
            r3.dragInteraction = r2
        L5e:
            androidx.compose.ui.unit.Velocity$Companion r2 = androidx.compose.ui.unit.Velocity.Companion
            long r4 = r2.m7122getZero9UxMQ8M()
            r3.mo663onDragStoppedTH1AsA0(r4)
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.DragGestureNode.processDragCancel(kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final void disposeInteractionSource() {
        DragInteraction.Start interaction = this.dragInteraction;
        if (interaction != null) {
            MutableInteractionSource mutableInteractionSource = this.interactionSource;
            if (mutableInteractionSource != null) {
                mutableInteractionSource.tryEmit(new DragInteraction.Cancel(interaction));
            }
            this.dragInteraction = null;
        }
    }

    public static /* synthetic */ void update$default(DragGestureNode dragGestureNode, Function1 function1, boolean z, MutableInteractionSource mutableInteractionSource, Orientation orientation, boolean z2, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: update");
        }
        Function1<? super PointerInputChange, Boolean> function12 = function1;
        if ((i & 1) != 0) {
            function12 = dragGestureNode.canDrag;
        }
        if ((i & 2) != 0) {
            z = dragGestureNode.enabled;
        }
        if ((i & 4) != 0) {
            mutableInteractionSource = dragGestureNode.interactionSource;
        }
        if ((i & 8) != 0) {
            orientation = dragGestureNode.orientationLock;
        }
        dragGestureNode.update(function12, z, mutableInteractionSource, orientation, (i & 16) != 0 ? false : z2);
    }

    public final void update(Function1<? super PointerInputChange, Boolean> function1, boolean enabled, MutableInteractionSource interactionSource, Orientation orientationLock, boolean shouldResetPointerInputHandling) {
        SuspendingPointerInputModifierNode suspendingPointerInputModifierNode;
        boolean resetPointerInputHandling = shouldResetPointerInputHandling;
        this.canDrag = function1;
        if (this.enabled != enabled) {
            this.enabled = enabled;
            if (!enabled) {
                disposeInteractionSource();
                SuspendingPointerInputModifierNode it = this.pointerInputNode;
                if (it != null) {
                    undelegate(it);
                }
                this.pointerInputNode = null;
            }
            resetPointerInputHandling = true;
        }
        if (!Intrinsics.areEqual(this.interactionSource, interactionSource)) {
            disposeInteractionSource();
            this.interactionSource = interactionSource;
        }
        if (this.orientationLock != orientationLock) {
            this.orientationLock = orientationLock;
            resetPointerInputHandling = true;
        }
        if (!resetPointerInputHandling || (suspendingPointerInputModifierNode = this.pointerInputNode) == null) {
            return;
        }
        suspendingPointerInputModifierNode.resetPointerInputHandler();
    }
}
