package com.rajat.pdfviewer;

import com.itextpdf.io.codec.TIFFConstants;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$schedulePrefetch$1", f = "PdfRendererCore.kt", i = {}, l = {TIFFConstants.TIFFTAG_GROUP4OPTIONS, 294}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class PdfRendererCore$schedulePrefetch$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ int $currentPage;
    final /* synthetic */ int $direction;
    final /* synthetic */ int $height;
    final /* synthetic */ int $width;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$schedulePrefetch$1(PdfRendererCore pdfRendererCore, int i, int i2, int i3, int i4, Continuation<? super PdfRendererCore$schedulePrefetch$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
        this.$currentPage = i;
        this.$width = i2;
        this.$height = i3;
        this.$direction = i4;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererCore$schedulePrefetch$1(this.this$0, this.$currentPage, this.$width, this.$height, this.$direction, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$schedulePrefetch$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0041 A[RETURN] */
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
            switch(r1) {
                case 0: goto L19;
                case 1: goto L15;
                case 2: goto L11;
                default: goto L9;
            }
        L9:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r0)
            throw r9
        L11:
            kotlin.ResultKt.throwOnFailure(r9)
            goto L42
        L15:
            kotlin.ResultKt.throwOnFailure(r9)
            goto L2b
        L19:
            kotlin.ResultKt.throwOnFailure(r9)
            r1 = r8
            kotlin.coroutines.Continuation r1 = (kotlin.coroutines.Continuation) r1
            r2 = 1
            r8.label = r2
            r2 = 100
            java.lang.Object r1 = kotlinx.coroutines.DelayKt.delay(r2, r1)
            if (r1 != r0) goto L2b
            return r0
        L2b:
            com.rajat.pdfviewer.PdfRendererCore r1 = r8.this$0
            int r2 = r8.$currentPage
            int r3 = r8.$width
            int r4 = r8.$height
            int r5 = r8.$direction
            r6 = r8
            kotlin.coroutines.Continuation r6 = (kotlin.coroutines.Continuation) r6
            r7 = 2
            r8.label = r7
            java.lang.Object r1 = com.rajat.pdfviewer.PdfRendererCore.access$prefetchPagesAround(r1, r2, r3, r4, r5, r6)
            if (r1 != r0) goto L42
            return r0
        L42:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererCore$schedulePrefetch$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
