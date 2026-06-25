package com.rajat.pdfviewer;

import android.graphics.Bitmap;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: PdfViewAdapter.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "Landroid/graphics/Bitmap;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1", f = "PdfViewAdapter.kt", i = {}, l = {214}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
final class PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Bitmap>, Object> {
    final /* synthetic */ int $page;
    int label;
    final /* synthetic */ PdfViewAdapter this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1(PdfViewAdapter pdfViewAdapter, int i, Continuation<? super PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfViewAdapter;
        this.$page = i;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1(this.this$0, this.$page, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Bitmap> continuation) {
        return ((PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                this.label = 1;
                Object bitmapFromCache = this.this$0.renderer.getBitmapFromCache(this.$page, this);
                if (bitmapFromCache == coroutine_suspended) {
                    return coroutine_suspended;
                }
                return bitmapFromCache;
            case 1:
                ResultKt.throwOnFailure($result);
                return $result;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
