package androidx.compose.foundation.text.selection;

import androidx.compose.foundation.text.TextDragObserver;
import androidx.compose.ui.input.pointer.AwaitPointerEventScope;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.input.pointer.PointerEvent_androidKt;
import androidx.compose.ui.input.pointer.PointerInputChange;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: SelectionGestures.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/ui/input/pointer/AwaitPointerEventScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.text.selection.SelectionGesturesKt$selectionGesturePointerInputBtf2$2", f = "SelectionGestures.kt", i = {0}, l = {209, 217, 220, 221}, m = "invokeSuspend", n = {"$this$awaitEachGesture"}, s = {"L$0"})
/* loaded from: classes.dex */
public final class SelectionGesturesKt$selectionGesturePointerInputBtf2$2 extends RestrictedSuspendLambda implements Function2<AwaitPointerEventScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ ClicksCounter $clicksCounter;
    final /* synthetic */ MouseSelectionObserver $mouseSelectionObserver;
    final /* synthetic */ TextDragObserver $textDragObserver;
    private /* synthetic */ Object L$0;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SelectionGesturesKt$selectionGesturePointerInputBtf2$2(ClicksCounter clicksCounter, MouseSelectionObserver mouseSelectionObserver, TextDragObserver textDragObserver, Continuation<? super SelectionGesturesKt$selectionGesturePointerInputBtf2$2> continuation) {
        super(2, continuation);
        this.$clicksCounter = clicksCounter;
        this.$mouseSelectionObserver = mouseSelectionObserver;
        this.$textDragObserver = textDragObserver;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        SelectionGesturesKt$selectionGesturePointerInputBtf2$2 selectionGesturesKt$selectionGesturePointerInputBtf2$2 = new SelectionGesturesKt$selectionGesturePointerInputBtf2$2(this.$clicksCounter, this.$mouseSelectionObserver, this.$textDragObserver, continuation);
        selectionGesturesKt$selectionGesturePointerInputBtf2$2.L$0 = obj;
        return selectionGesturesKt$selectionGesturePointerInputBtf2$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(AwaitPointerEventScope awaitPointerEventScope, Continuation<? super Unit> continuation) {
        return ((SelectionGesturesKt$selectionGesturePointerInputBtf2$2) create(awaitPointerEventScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object $result;
        AwaitPointerEventScope $this$awaitEachGesture;
        Object awaitDown;
        Object obj2;
        Object $result2;
        Object obj3;
        Object $result3;
        boolean z;
        Object mouseSelectionBtf2;
        Object $result4;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                $result = obj;
                $this$awaitEachGesture = (AwaitPointerEventScope) this.L$0;
                this.L$0 = $this$awaitEachGesture;
                this.label = 1;
                awaitDown = SelectionGesturesKt.awaitDown($this$awaitEachGesture, this);
                if (awaitDown == coroutine_suspended) {
                    return coroutine_suspended;
                }
                break;
            case 1:
                $result = obj;
                $this$awaitEachGesture = (AwaitPointerEventScope) this.L$0;
                ResultKt.throwOnFailure($result);
                awaitDown = $result;
                break;
            case 2:
                $result4 = obj;
                ResultKt.throwOnFailure($result4);
                Object $result5 = Unit.INSTANCE;
                return $result5;
            case 3:
                $result3 = obj;
                ResultKt.throwOnFailure($result3);
                Object $result52 = Unit.INSTANCE;
                return $result52;
            case 4:
                $result2 = obj;
                ResultKt.throwOnFailure($result2);
                Object $result522 = Unit.INSTANCE;
                return $result522;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        PointerEvent downEvent = (PointerEvent) awaitDown;
        this.$clicksCounter.update(downEvent);
        boolean isPrecise = SelectionGesturesKt.isPrecisePointer(downEvent);
        if (isPrecise && PointerEvent_androidKt.m5485isPrimaryPressedaHzCxE(downEvent.m5452getButtonsry648PA())) {
            List $this$fastForEach$iv$iv = downEvent.getChanges();
            int index$iv$iv = 0;
            int size = $this$fastForEach$iv$iv.size();
            while (true) {
                if (index$iv$iv < size) {
                    Object it$iv = $this$fastForEach$iv$iv.get(index$iv$iv);
                    PointerInputChange it = (PointerInputChange) it$iv;
                    z = false;
                    PointerInputChange it2 = !it.isConsumed() ? 1 : null;
                    if (it2 != null) {
                        index$iv$iv++;
                    }
                } else {
                    z = true;
                }
            }
            if (z) {
                this.L$0 = null;
                this.label = 2;
                mouseSelectionBtf2 = SelectionGesturesKt.mouseSelectionBtf2($this$awaitEachGesture, this.$mouseSelectionObserver, this.$clicksCounter, downEvent, this);
                if (mouseSelectionBtf2 == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $result4 = $result;
                Object $result5222 = Unit.INSTANCE;
                return $result5222;
            }
        }
        if (!isPrecise) {
            int clicks = this.$clicksCounter.getClicks();
            TextDragObserver textDragObserver = this.$textDragObserver;
            if (clicks == 1) {
                this.L$0 = null;
                this.label = 3;
                obj3 = SelectionGesturesKt.touchSelectionFirstPress($this$awaitEachGesture, textDragObserver, downEvent, this);
                if (obj3 == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $result3 = $result;
            } else {
                this.L$0 = null;
                this.label = 4;
                obj2 = SelectionGesturesKt.touchSelectionSubsequentPress($this$awaitEachGesture, textDragObserver, downEvent, this);
                if (obj2 == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $result2 = $result;
            }
        }
        Object $result52222 = Unit.INSTANCE;
        return $result52222;
    }
}
