package com.hardlineforge.lala.ui.viewmodel;

import com.hardlineforge.lala.data.LogEntry;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: LalaViewModel.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$saveEntry$1", f = "LalaViewModel.kt", i = {}, l = {Property.MAX_WIDTH, Property.KEEP_WITH_NEXT, Property.LIST_SYMBOL_POSITION}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes4.dex */
public final class LalaViewModel$saveEntry$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ String $editNote;
    final /* synthetic */ LogEntry $entry;
    final /* synthetic */ boolean $isNew;
    int label;
    final /* synthetic */ LalaViewModel this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LalaViewModel$saveEntry$1(boolean z, LalaViewModel lalaViewModel, LogEntry logEntry, String str, Continuation<? super LalaViewModel$saveEntry$1> continuation) {
        super(2, continuation);
        this.$isNew = z;
        this.this$0 = lalaViewModel;
        this.$entry = logEntry;
        this.$editNote = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new LalaViewModel$saveEntry$1(this.$isNew, this.this$0, this.$entry, this.$editNote, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((LalaViewModel$saveEntry$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x005d  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) {
        /*
            r9 = this;
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r9.label
            r2 = 1
            switch(r1) {
                case 0: goto L1e;
                case 1: goto L1a;
                case 2: goto L16;
                case 3: goto L12;
                default: goto La;
            }
        La:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L12:
            kotlin.ResultKt.throwOnFailure(r10)
            goto L81
        L16:
            kotlin.ResultKt.throwOnFailure(r10)
            goto L4d
        L1a:
            kotlin.ResultKt.throwOnFailure(r10)
            goto L39
        L1e:
            kotlin.ResultKt.throwOnFailure(r10)
            boolean r1 = r9.$isNew
            com.hardlineforge.lala.ui.viewmodel.LalaViewModel r3 = r9.this$0
            if (r1 == 0) goto L3a
            com.hardlineforge.lala.data.LogRepository r1 = com.hardlineforge.lala.ui.viewmodel.LalaViewModel.access$getRepo$p(r3)
            com.hardlineforge.lala.data.LogEntry r3 = r9.$entry
            r4 = r9
            kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4
            r9.label = r2
            java.lang.Object r1 = r1.insertEntry(r3, r4)
            if (r1 != r0) goto L39
            return r0
        L39:
            goto L84
        L3a:
            com.hardlineforge.lala.data.LogRepository r1 = com.hardlineforge.lala.ui.viewmodel.LalaViewModel.access$getRepo$p(r3)
            com.hardlineforge.lala.data.LogEntry r3 = r9.$entry
            r4 = r9
            kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4
            r5 = 2
            r9.label = r5
            java.lang.Object r1 = r1.updateEntry(r3, r4)
            if (r1 != r0) goto L4d
            return r0
        L4d:
            java.lang.String r1 = r9.$editNote
            java.lang.CharSequence r1 = (java.lang.CharSequence) r1
            if (r1 == 0) goto L5b
            boolean r1 = kotlin.text.StringsKt.isBlank(r1)
            if (r1 == 0) goto L5a
            goto L5b
        L5a:
            r2 = 0
        L5b:
            if (r2 != 0) goto L82
            com.hardlineforge.lala.ui.viewmodel.LalaViewModel r1 = r9.this$0
            com.hardlineforge.lala.data.LogRepository r1 = com.hardlineforge.lala.ui.viewmodel.LalaViewModel.access$getRepo$p(r1)
            com.hardlineforge.lala.data.EditHistory r2 = new com.hardlineforge.lala.data.EditHistory
            com.hardlineforge.lala.data.LogEntry r3 = r9.$entry
            java.lang.String r4 = r3.getId()
            java.lang.String r6 = r9.$editNote
            r7 = 5
            r8 = 0
            r3 = 0
            r5 = 0
            r2.<init>(r3, r4, r5, r6, r7, r8)
            r3 = r9
            kotlin.coroutines.Continuation r3 = (kotlin.coroutines.Continuation) r3
            r4 = 3
            r9.label = r4
            java.lang.Object r1 = r1.insertEditHistory(r2, r3)
            if (r1 != r0) goto L81
            return r0
        L81:
        L82:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
        L84:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.viewmodel.LalaViewModel$saveEntry$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
