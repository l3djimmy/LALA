package com.rajat.pdfviewer;

import com.rajat.pdfviewer.PdfViewAdapter;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: PdfViewAdapter.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1", f = "PdfViewAdapter.kt", i = {}, l = {213}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
final class PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Ref.IntRef $attempt;
    final /* synthetic */ long $delayMs;
    final /* synthetic */ int $page;
    final /* synthetic */ int $retries;
    final /* synthetic */ Ref.ObjectRef<Runnable> $task;
    int label;
    final /* synthetic */ PdfViewAdapter.PdfPageViewHolder this$0;
    final /* synthetic */ PdfViewAdapter this$1;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1(PdfViewAdapter.PdfPageViewHolder pdfPageViewHolder, int i, PdfViewAdapter pdfViewAdapter, Ref.IntRef intRef, int i2, Ref.ObjectRef<Runnable> objectRef, long j, Continuation<? super PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfPageViewHolder;
        this.$page = i;
        this.this$1 = pdfViewAdapter;
        this.$attempt = intRef;
        this.$retries = i2;
        this.$task = objectRef;
        this.$delayMs = j;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1(this.this$0, this.$page, this.this$1, this.$attempt, this.$retries, this.$task, this.$delayMs, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a7, code lost:
        if (r9 != false) goto L20;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) {
        /*
            Method dump skipped, instructions count: 266
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
