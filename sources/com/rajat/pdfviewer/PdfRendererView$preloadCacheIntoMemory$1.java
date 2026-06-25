package com.rajat.pdfviewer;

import java.util.Iterator;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.IntIterator;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererView.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererView$preloadCacheIntoMemory$1", f = "PdfRendererView.kt", i = {0}, l = {616}, m = "invokeSuspend", n = {"renderer"}, s = {"L$0"})
/* loaded from: classes12.dex */
public final class PdfRendererView$preloadCacheIntoMemory$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    Object L$0;
    Object L$1;
    int label;
    final /* synthetic */ PdfRendererView this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererView$preloadCacheIntoMemory$1(PdfRendererView pdfRendererView, Continuation<? super PdfRendererView$preloadCacheIntoMemory$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererView;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererView$preloadCacheIntoMemory$1(this.this$0, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererView$preloadCacheIntoMemory$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        PdfRendererCore pdfRendererCore;
        Iterator<Integer> it;
        PdfRendererCore pdfRendererCore2;
        PdfRendererView$preloadCacheIntoMemory$1 pdfRendererView$preloadCacheIntoMemory$1;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                pdfRendererCore = this.this$0.pdfRendererCore;
                if (pdfRendererCore == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("pdfRendererCore");
                    pdfRendererCore = null;
                }
                it = RangesKt.until(0, pdfRendererCore.getPageCount()).iterator();
                pdfRendererCore2 = pdfRendererCore;
                pdfRendererView$preloadCacheIntoMemory$1 = this;
                break;
            case 1:
                it = (Iterator) this.L$1;
                pdfRendererCore2 = (PdfRendererCore) this.L$0;
                ResultKt.throwOnFailure(obj);
                pdfRendererView$preloadCacheIntoMemory$1 = this;
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        while (it.hasNext()) {
            int nextInt = ((IntIterator) it).nextInt();
            pdfRendererView$preloadCacheIntoMemory$1.L$0 = pdfRendererCore2;
            pdfRendererView$preloadCacheIntoMemory$1.L$1 = it;
            pdfRendererView$preloadCacheIntoMemory$1.label = 1;
            if (pdfRendererCore2.getBitmapFromCache(nextInt, pdfRendererView$preloadCacheIntoMemory$1) == coroutine_suspended) {
                return coroutine_suspended;
            }
        }
        return Unit.INSTANCE;
    }
}
