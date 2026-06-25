package androidx.compose.foundation.text.input.internal.selection;

import androidx.compose.foundation.gestures.PressGestureScope;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.interaction.PressInteraction;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: TextFieldSelectionState.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectTextFieldTapGestures$2$1$1", f = "TextFieldSelectionState.kt", i = {}, l = {TypedValues.PositionType.TYPE_DRAWPATH, TypedValues.PositionType.TYPE_POSITION_TYPE}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
public final class TextFieldSelectionState$detectTextFieldTapGestures$2$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ PressGestureScope $$this$detectTapAndPress;
    final /* synthetic */ MutableInteractionSource $interactionSource;
    final /* synthetic */ long $offset;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ TextFieldSelectionState this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TextFieldSelectionState$detectTextFieldTapGestures$2$1$1(PressGestureScope pressGestureScope, TextFieldSelectionState textFieldSelectionState, long j, MutableInteractionSource mutableInteractionSource, Continuation<? super TextFieldSelectionState$detectTextFieldTapGestures$2$1$1> continuation) {
        super(2, continuation);
        this.$$this$detectTapAndPress = pressGestureScope;
        this.this$0 = textFieldSelectionState;
        this.$offset = j;
        this.$interactionSource = mutableInteractionSource;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        TextFieldSelectionState$detectTextFieldTapGestures$2$1$1 textFieldSelectionState$detectTextFieldTapGestures$2$1$1 = new TextFieldSelectionState$detectTextFieldTapGestures$2$1$1(this.$$this$detectTapAndPress, this.this$0, this.$offset, this.$interactionSource, continuation);
        textFieldSelectionState$detectTextFieldTapGestures$2$1$1.L$0 = obj;
        return textFieldSelectionState$detectTextFieldTapGestures$2$1$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((TextFieldSelectionState$detectTextFieldTapGestures$2$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: TextFieldSelectionState.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectTextFieldTapGestures$2$1$1$1", f = "TextFieldSelectionState.kt", i = {1}, l = {494, 499}, m = "invokeSuspend", n = {"press"}, s = {"L$0"})
    /* renamed from: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectTextFieldTapGestures$2$1$1$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        final /* synthetic */ MutableInteractionSource $interactionSource;
        final /* synthetic */ long $offset;
        Object L$0;
        int label;
        final /* synthetic */ TextFieldSelectionState this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(TextFieldSelectionState textFieldSelectionState, long j, MutableInteractionSource mutableInteractionSource, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.this$0 = textFieldSelectionState;
            this.$offset = j;
            this.$interactionSource = mutableInteractionSource;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.this$0, this.$offset, this.$interactionSource, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        /* JADX WARN: Removed duplicated region for block: B:17:0x0069 A[RETURN] */
        /* JADX WARN: Removed duplicated region for block: B:18:0x006a  */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Object invokeSuspend(java.lang.Object r9) {
            /*
                r8 = this;
                java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
                int r1 = r8.label
                r2 = 0
                switch(r1) {
                    case 0: goto L24;
                    case 1: goto L1b;
                    case 2: goto L13;
                    default: goto La;
                }
            La:
                java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
                java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
                r9.<init>(r0)
                throw r9
            L13:
                java.lang.Object r0 = r8.L$0
                androidx.compose.foundation.interaction.PressInteraction$Press r0 = (androidx.compose.foundation.interaction.PressInteraction.Press) r0
                kotlin.ResultKt.throwOnFailure(r9)
                goto L6b
            L1b:
                r1 = 0
                java.lang.Object r3 = r8.L$0
                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r3 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r3
                kotlin.ResultKt.throwOnFailure(r9)
                goto L4a
            L24:
                kotlin.ResultKt.throwOnFailure(r9)
                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r1 = r8.this$0
                androidx.compose.foundation.interaction.PressInteraction$Press r1 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getPressInteraction$p(r1)
                if (r1 == 0) goto L4f
                androidx.compose.foundation.interaction.MutableInteractionSource r3 = r8.$interactionSource
                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r4 = r8.this$0
                r5 = 0
                androidx.compose.foundation.interaction.PressInteraction$Cancel r6 = new androidx.compose.foundation.interaction.PressInteraction$Cancel
                r6.<init>(r1)
                r1 = r6
                androidx.compose.foundation.interaction.Interaction r1 = (androidx.compose.foundation.interaction.Interaction) r1
                r8.L$0 = r4
                r7 = 1
                r8.label = r7
                java.lang.Object r1 = r3.emit(r1, r8)
                if (r1 != r0) goto L48
                return r0
            L48:
                r3 = r4
                r1 = r5
            L4a:
                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$setPressInteraction$p(r3, r2)
            L4f:
                androidx.compose.foundation.interaction.PressInteraction$Press r1 = new androidx.compose.foundation.interaction.PressInteraction$Press
                long r3 = r8.$offset
                r1.<init>(r3, r2)
                androidx.compose.foundation.interaction.MutableInteractionSource r2 = r8.$interactionSource
                r3 = r1
                androidx.compose.foundation.interaction.Interaction r3 = (androidx.compose.foundation.interaction.Interaction) r3
                r4 = r8
                kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4
                r8.L$0 = r1
                r5 = 2
                r8.label = r5
                java.lang.Object r2 = r2.emit(r3, r4)
                if (r2 != r0) goto L6a
                return r0
            L6a:
                r0 = r1
            L6b:
                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r1 = r8.this$0
                androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$setPressInteraction$p(r1, r0)
                kotlin.Unit r1 = kotlin.Unit.INSTANCE
                return r1
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectTextFieldTapGestures$2$1$1.AnonymousClass1.invokeSuspend(java.lang.Object):java.lang.Object");
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object $result2;
        PressInteraction.Press pressInteraction;
        PressInteraction endInteraction;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                CoroutineScope $this$coroutineScope = (CoroutineScope) this.L$0;
                BuildersKt__Builders_commonKt.launch$default($this$coroutineScope, null, null, new AnonymousClass1(this.this$0, this.$offset, this.$interactionSource, null), 3, null);
                this.label = 1;
                Object tryAwaitRelease = this.$$this$detectTapAndPress.tryAwaitRelease(this);
                if (tryAwaitRelease == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $result2 = $result;
                $result = tryAwaitRelease;
                break;
            case 1:
                ResultKt.throwOnFailure($result);
                $result2 = $result;
                break;
            case 2:
                ResultKt.throwOnFailure($result);
                this.this$0.pressInteraction = null;
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        boolean success = ((Boolean) $result).booleanValue();
        pressInteraction = this.this$0.pressInteraction;
        if (pressInteraction != null) {
            MutableInteractionSource mutableInteractionSource = this.$interactionSource;
            if (success) {
                endInteraction = new PressInteraction.Release(pressInteraction);
            } else {
                endInteraction = new PressInteraction.Cancel(pressInteraction);
            }
            this.label = 2;
            if (mutableInteractionSource.emit(endInteraction, this) == coroutine_suspended) {
                return coroutine_suspended;
            }
            $result = $result2;
        }
        this.this$0.pressInteraction = null;
        return Unit.INSTANCE;
    }
}
