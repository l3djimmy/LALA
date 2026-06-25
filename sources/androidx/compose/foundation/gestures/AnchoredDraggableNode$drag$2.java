package androidx.compose.foundation.gestures;

import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.gestures.DragEvent;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.nestedscroll.NestedScrollSource;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
/* JADX INFO: Add missing generic type declarations: [T] */
/* compiled from: AnchoredDraggable.kt */
@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0005H\u008a@"}, d2 = {"<anonymous>", "", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/foundation/gestures/AnchoredDragScope;", "it", "Landroidx/compose/foundation/gestures/DraggableAnchors;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.gestures.AnchoredDraggableNode$drag$2", f = "AnchoredDraggable.kt", i = {}, l = {408}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
final class AnchoredDraggableNode$drag$2<T> extends SuspendLambda implements Function3<AnchoredDragScope, DraggableAnchors<T>, Continuation<? super Unit>, Object> {
    final /* synthetic */ Function2<Function1<? super DragEvent.DragDelta, Unit>, Continuation<? super Unit>, Object> $forEachDelta;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ AnchoredDraggableNode<T> this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public AnchoredDraggableNode$drag$2(Function2<? super Function1<? super DragEvent.DragDelta, Unit>, ? super Continuation<? super Unit>, ? extends Object> function2, AnchoredDraggableNode<T> anchoredDraggableNode, Continuation<? super AnchoredDraggableNode$drag$2> continuation) {
        super(3, continuation);
        this.$forEachDelta = function2;
        this.this$0 = anchoredDraggableNode;
    }

    public final Object invoke(AnchoredDragScope anchoredDragScope, DraggableAnchors<T> draggableAnchors, Continuation<? super Unit> continuation) {
        AnchoredDraggableNode$drag$2 anchoredDraggableNode$drag$2 = new AnchoredDraggableNode$drag$2(this.$forEachDelta, this.this$0, continuation);
        anchoredDraggableNode$drag$2.L$0 = anchoredDragScope;
        return anchoredDraggableNode$drag$2.invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.jvm.functions.Function3
    public /* bridge */ /* synthetic */ Object invoke(AnchoredDragScope anchoredDragScope, Object obj, Continuation<? super Unit> continuation) {
        return invoke(anchoredDragScope, (DraggableAnchors) ((DraggableAnchors) obj), continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                final AnchoredDragScope $this$anchoredDrag = (AnchoredDragScope) this.L$0;
                Function2<Function1<? super DragEvent.DragDelta, Unit>, Continuation<? super Unit>, Object> function2 = this.$forEachDelta;
                final AnchoredDraggableNode<T> anchoredDraggableNode = this.this$0;
                Function1<DragEvent.DragDelta, Unit> function1 = new Function1<DragEvent.DragDelta, Unit>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableNode$drag$2.1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(DragEvent.DragDelta dragDelta) {
                        invoke2(dragDelta);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(DragEvent.DragDelta dragDelta) {
                        long m657reverseIfNeededMKHz9U;
                        float oneDirectionalDelta;
                        OverscrollEffect overscrollEffect;
                        OverscrollEffect overscrollEffect2;
                        long m660toOffsettuRUvjQ;
                        AnchoredDraggableState anchoredDraggableState;
                        AnchoredDraggableNode<T> anchoredDraggableNode2 = anchoredDraggableNode;
                        m657reverseIfNeededMKHz9U = anchoredDraggableNode.m657reverseIfNeededMKHz9U(dragDelta.m681getDeltaF1C5BW0());
                        oneDirectionalDelta = anchoredDraggableNode2.m659toFloatk4lQ0M(m657reverseIfNeededMKHz9U);
                        overscrollEffect = ((AnchoredDraggableNode) anchoredDraggableNode).overscrollEffect;
                        if (overscrollEffect != null) {
                            overscrollEffect2 = ((AnchoredDraggableNode) anchoredDraggableNode).overscrollEffect;
                            Intrinsics.checkNotNull(overscrollEffect2);
                            m660toOffsettuRUvjQ = anchoredDraggableNode.m660toOffsettuRUvjQ(oneDirectionalDelta);
                            int m5405getUserInputWNlRxjI = NestedScrollSource.Companion.m5405getUserInputWNlRxjI();
                            final AnchoredDraggableNode<T> anchoredDraggableNode3 = anchoredDraggableNode;
                            final AnchoredDragScope anchoredDragScope = $this$anchoredDrag;
                            overscrollEffect2.mo481applyToScrollRhakbz0(m660toOffsettuRUvjQ, m5405getUserInputWNlRxjI, new Function1<Offset, Offset>() { // from class: androidx.compose.foundation.gestures.AnchoredDraggableNode.drag.2.1.1
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Offset invoke(Offset offset) {
                                    return Offset.m4037boximpl(m664invokeMKHz9U(offset.m4058unboximpl()));
                                }

                                /* renamed from: invoke-MK-Hz9U  reason: not valid java name */
                                public final long m664invokeMKHz9U(long deltaForDrag) {
                                    AnchoredDraggableState anchoredDraggableState2;
                                    float m659toFloatk4lQ0M;
                                    AnchoredDraggableState anchoredDraggableState3;
                                    long consumedDelta;
                                    anchoredDraggableState2 = ((AnchoredDraggableNode) anchoredDraggableNode3).state;
                                    m659toFloatk4lQ0M = anchoredDraggableNode3.m659toFloatk4lQ0M(deltaForDrag);
                                    float dragOffset = anchoredDraggableState2.newOffsetForDelta$foundation_release(m659toFloatk4lQ0M);
                                    AnchoredDraggableNode<T> anchoredDraggableNode4 = anchoredDraggableNode3;
                                    anchoredDraggableState3 = ((AnchoredDraggableNode) anchoredDraggableNode3).state;
                                    consumedDelta = anchoredDraggableNode4.m660toOffsettuRUvjQ(dragOffset - anchoredDraggableState3.requireOffset());
                                    AnchoredDragScope.dragTo$default(anchoredDragScope, dragOffset, 0.0f, 2, null);
                                    return consumedDelta;
                                }
                            });
                            return;
                        }
                        AnchoredDragScope anchoredDragScope2 = $this$anchoredDrag;
                        anchoredDraggableState = ((AnchoredDraggableNode) anchoredDraggableNode).state;
                        AnchoredDragScope.dragTo$default(anchoredDragScope2, anchoredDraggableState.newOffsetForDelta$foundation_release(oneDirectionalDelta), 0.0f, 2, null);
                    }
                };
                this.label = 1;
                if (function2.invoke(function1, this) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                break;
            case 1:
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        return Unit.INSTANCE;
    }
}
