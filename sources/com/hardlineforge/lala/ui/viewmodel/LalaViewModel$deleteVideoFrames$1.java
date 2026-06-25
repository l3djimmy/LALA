package com.hardlineforge.lala.ui.viewmodel;

import com.hardlineforge.lala.data.LogRepository;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: LalaViewModel.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$deleteVideoFrames$1", f = "LalaViewModel.kt", i = {}, l = {Property.WIDOWS_CONTROL}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes4.dex */
final class LalaViewModel$deleteVideoFrames$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ String $videoId;
    int label;
    final /* synthetic */ LalaViewModel this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LalaViewModel$deleteVideoFrames$1(LalaViewModel lalaViewModel, String str, Continuation<? super LalaViewModel$deleteVideoFrames$1> continuation) {
        super(2, continuation);
        this.this$0 = lalaViewModel;
        this.$videoId = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new LalaViewModel$deleteVideoFrames$1(this.this$0, this.$videoId, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((LalaViewModel$deleteVideoFrames$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        LogRepository logRepository;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                logRepository = this.this$0.repo;
                this.label = 1;
                if (logRepository.deleteVideoFrames(this.$videoId, this) == coroutine_suspended) {
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
