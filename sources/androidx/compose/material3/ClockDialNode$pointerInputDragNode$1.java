package androidx.compose.material3;

import androidx.compose.foundation.gestures.DragGestureDetectorKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.pointer.PointerInputChange;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.unit.IntOffset;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: TimePicker.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/ui/input/pointer/PointerInputScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.material3.ClockDialNode$pointerInputDragNode$1", f = "TimePicker.kt", i = {}, l = {1456}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes11.dex */
public final class ClockDialNode$pointerInputDragNode$1 extends SuspendLambda implements Function2<PointerInputScope, Continuation<? super Unit>, Object> {
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ ClockDialNode this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ClockDialNode$pointerInputDragNode$1(ClockDialNode clockDialNode, Continuation<? super ClockDialNode$pointerInputDragNode$1> continuation) {
        super(2, continuation);
        this.this$0 = clockDialNode;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        ClockDialNode$pointerInputDragNode$1 clockDialNode$pointerInputDragNode$1 = new ClockDialNode$pointerInputDragNode$1(this.this$0, continuation);
        clockDialNode$pointerInputDragNode$1.L$0 = obj;
        return clockDialNode$pointerInputDragNode$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(PointerInputScope pointerInputScope, Continuation<? super Unit> continuation) {
        return ((ClockDialNode$pointerInputDragNode$1) create(pointerInputScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                PointerInputScope $this$SuspendingPointerInputModifierNode = (PointerInputScope) this.L$0;
                final ClockDialNode clockDialNode = this.this$0;
                final ClockDialNode clockDialNode2 = this.this$0;
                this.label = 1;
                if (DragGestureDetectorKt.detectDragGestures$default($this$SuspendingPointerInputModifierNode, null, new Function0<Unit>() { // from class: androidx.compose.material3.ClockDialNode$pointerInputDragNode$1.1
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Unit invoke() {
                        invoke2();
                        return Unit.INSTANCE;
                    }

                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* compiled from: TimePicker.kt */
                    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
                    @DebugMetadata(c = "androidx.compose.material3.ClockDialNode$pointerInputDragNode$1$1$1", f = "TimePicker.kt", i = {}, l = {1462}, m = "invokeSuspend", n = {}, s = {})
                    /* renamed from: androidx.compose.material3.ClockDialNode$pointerInputDragNode$1$1$1  reason: invalid class name and collision with other inner class name */
                    /* loaded from: classes11.dex */
                    public static final class C00321 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                        int label;
                        final /* synthetic */ ClockDialNode this$0;

                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        C00321(ClockDialNode clockDialNode, Continuation<? super C00321> continuation) {
                            super(2, continuation);
                            this.this$0 = clockDialNode;
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                            return new C00321(this.this$0, continuation);
                        }

                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                            return ((C00321) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Object invokeSuspend(Object $result) {
                            boolean z;
                            AnalogTimePickerState analogTimePickerState;
                            AnalogTimePickerState analogTimePickerState2;
                            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                            switch (this.label) {
                                case 0:
                                    ResultKt.throwOnFailure($result);
                                    z = this.this$0.autoSwitchToMinute;
                                    if (z) {
                                        analogTimePickerState2 = this.this$0.state;
                                        analogTimePickerState2.mo1810setSelection6_8s6DQ(TimePickerSelectionMode.Companion.m2802getMinuteyecRtBI());
                                    }
                                    analogTimePickerState = this.this$0.state;
                                    this.label = 1;
                                    if (analogTimePickerState.onGestureEnd(this) != coroutine_suspended) {
                                        break;
                                    } else {
                                        return coroutine_suspended;
                                    }
                                case 1:
                                    ResultKt.throwOnFailure($result);
                                    break;
                                default:
                                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            return Unit.INSTANCE;
                        }
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2() {
                        BuildersKt__Builders_commonKt.launch$default(ClockDialNode.this.getCoroutineScope(), null, null, new C00321(ClockDialNode.this, null), 3, null);
                    }
                }, null, new Function2<PointerInputChange, Offset, Unit>() { // from class: androidx.compose.material3.ClockDialNode$pointerInputDragNode$1.2
                    {
                        super(2);
                    }

                    @Override // kotlin.jvm.functions.Function2
                    public /* bridge */ /* synthetic */ Unit invoke(PointerInputChange pointerInputChange, Offset offset) {
                        m1933invokeUv8p0NA(pointerInputChange, offset.m4058unboximpl());
                        return Unit.INSTANCE;
                    }

                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* compiled from: TimePicker.kt */
                    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
                    @DebugMetadata(c = "androidx.compose.material3.ClockDialNode$pointerInputDragNode$1$2$1", f = "TimePicker.kt", i = {}, l = {1469}, m = "invokeSuspend", n = {}, s = {})
                    /* renamed from: androidx.compose.material3.ClockDialNode$pointerInputDragNode$1$2$1  reason: invalid class name */
                    /* loaded from: classes11.dex */
                    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                        final /* synthetic */ long $dragAmount;
                        int label;
                        final /* synthetic */ ClockDialNode this$0;

                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        AnonymousClass1(ClockDialNode clockDialNode, long j, Continuation<? super AnonymousClass1> continuation) {
                            super(2, continuation);
                            this.this$0 = clockDialNode;
                            this.$dragAmount = j;
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                            return new AnonymousClass1(this.this$0, this.$dragAmount, continuation);
                        }

                        @Override // kotlin.jvm.functions.Function2
                        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                        }

                        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                        public final Object invokeSuspend(Object $result) {
                            float f;
                            float f2;
                            AnalogTimePickerState analogTimePickerState;
                            float f3;
                            long j;
                            float f4;
                            long j2;
                            float atan;
                            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                            switch (this.label) {
                                case 0:
                                    ResultKt.throwOnFailure($result);
                                    ClockDialNode clockDialNode = this.this$0;
                                    f = clockDialNode.offsetX;
                                    clockDialNode.offsetX = f + Offset.m4048getXimpl(this.$dragAmount);
                                    ClockDialNode clockDialNode2 = this.this$0;
                                    f2 = clockDialNode2.offsetY;
                                    clockDialNode2.offsetY = f2 + Offset.m4049getYimpl(this.$dragAmount);
                                    analogTimePickerState = this.this$0.state;
                                    f3 = this.this$0.offsetY;
                                    j = this.this$0.center;
                                    float m7002getYimpl = f3 - IntOffset.m7002getYimpl(j);
                                    f4 = this.this$0.offsetX;
                                    j2 = this.this$0.center;
                                    atan = TimePickerKt.atan(m7002getYimpl, f4 - IntOffset.m7001getXimpl(j2));
                                    this.label = 1;
                                    if (AnalogTimePickerState.rotateTo$default(analogTimePickerState, atan, false, this, 2, null) != coroutine_suspended) {
                                        break;
                                    } else {
                                        return coroutine_suspended;
                                    }
                                case 1:
                                    ResultKt.throwOnFailure($result);
                                    break;
                                default:
                                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            return Unit.INSTANCE;
                        }
                    }

                    /* renamed from: invoke-Uv8p0NA  reason: not valid java name */
                    public final void m1933invokeUv8p0NA(PointerInputChange pointerInputChange, long dragAmount) {
                        AnalogTimePickerState analogTimePickerState;
                        float f;
                        float f2;
                        float maxDist;
                        long j;
                        BuildersKt__Builders_commonKt.launch$default(ClockDialNode.this.getCoroutineScope(), null, null, new AnonymousClass1(ClockDialNode.this, dragAmount, null), 3, null);
                        analogTimePickerState = ClockDialNode.this.state;
                        f = ClockDialNode.this.offsetX;
                        f2 = ClockDialNode.this.offsetY;
                        maxDist = ClockDialNode.this.getMaxDist();
                        j = ClockDialNode.this.center;
                        TimePickerKt.m2779moveSelectord3b8Pxo(analogTimePickerState, f, f2, maxDist, j);
                    }
                }, this, 5, null) != coroutine_suspended) {
                    break;
                } else {
                    return coroutine_suspended;
                }
            case 1:
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        return Unit.INSTANCE;
    }
}
