package com.rajat.pdfviewer;

import android.graphics.Bitmap;
import android.graphics.pdf.PdfRenderer;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1", f = "PdfRendererCore.kt", i = {0, 0, 1, 1}, l = {177, 187, 195, 195, 195}, m = "invokeSuspend", n = {"$this$launch", "success", "$this$launch", "success"}, s = {"L$0", "I$0", "L$0", "I$0"})
/* loaded from: classes12.dex */
final class PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Bitmap $bitmap;
    final /* synthetic */ int $pageNo;
    int I$0;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1(PdfRendererCore pdfRendererCore, int i, Bitmap bitmap, Continuation<? super PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
        this.$pageNo = i;
        this.$bitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1 pdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1 = new PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1(this.this$0, this.$pageNo, this.$bitmap, continuation);
        pdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1.L$0 = obj;
        return pdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x006c A[Catch: all -> 0x00c4, Exception -> 0x00cd, TRY_LEAVE, TryCatch #4 {Exception -> 0x00cd, all -> 0x00c4, blocks: (B:19:0x0068, B:21:0x006c), top: B:73:0x0068 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00c1 A[RETURN] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            Method dump skipped, instructions count: 380
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit invokeSuspend$lambda$0(Bitmap $bitmap, PdfRenderer.Page pdfPage) {
        pdfPage.render($bitmap, null, null, 1);
        return Unit.INSTANCE;
    }
}
