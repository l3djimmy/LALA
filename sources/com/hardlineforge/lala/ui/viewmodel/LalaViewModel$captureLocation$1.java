package com.hardlineforge.lala.ui.viewmodel;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: LalaViewModel.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel", f = "LalaViewModel.kt", i = {}, l = {174}, m = "captureLocation", n = {}, s = {})
/* loaded from: classes4.dex */
public final class LalaViewModel$captureLocation$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ LalaViewModel this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LalaViewModel$captureLocation$1(LalaViewModel lalaViewModel, Continuation<? super LalaViewModel$captureLocation$1> continuation) {
        super(continuation);
        this.this$0 = lalaViewModel;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.captureLocation(this);
    }
}
