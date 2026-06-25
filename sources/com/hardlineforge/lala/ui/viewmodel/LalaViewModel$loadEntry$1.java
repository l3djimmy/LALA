package com.hardlineforge.lala.ui.viewmodel;

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
@DebugMetadata(c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$loadEntry$1", f = "LalaViewModel.kt", i = {1, 2, 3}, l = {62, 65, 66, 67}, m = "invokeSuspend", n = {"entry", "entry", "entry"}, s = {"L$0", "L$0", "L$0"})
/* loaded from: classes4.dex */
public final class LalaViewModel$loadEntry$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ String $entryId;
    Object L$0;
    Object L$1;
    int label;
    final /* synthetic */ LalaViewModel this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LalaViewModel$loadEntry$1(LalaViewModel lalaViewModel, String str, Continuation<? super LalaViewModel$loadEntry$1> continuation) {
        super(2, continuation);
        this.this$0 = lalaViewModel;
        this.$entryId = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new LalaViewModel$loadEntry$1(this.this$0, this.$entryId, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((LalaViewModel$loadEntry$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00ad A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00d3 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00d4  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            Method dump skipped, instructions count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.viewmodel.LalaViewModel$loadEntry$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
