package com.rajat.pdfviewer;

import android.graphics.pdf.PdfRenderer;
import android.util.Size;
import com.itextpdf.io.codec.TIFFConstants;
import java.util.Map;
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
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$preloadPageDimensions$1", f = "PdfRendererCore.kt", i = {0}, l = {TIFFConstants.TIFFTAG_MAXSAMPLEVALUE}, m = "invokeSuspend", n = {"pageNo"}, s = {"I$0"})
/* loaded from: classes12.dex */
public final class PdfRendererCore$preloadPageDimensions$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    int I$0;
    int I$1;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$preloadPageDimensions$1(PdfRendererCore pdfRendererCore, Continuation<? super PdfRendererCore$preloadPageDimensions$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererCore$preloadPageDimensions$1(this.this$0, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$preloadPageDimensions$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x002b  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x0039 -> B:15:0x0055). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0051 -> B:15:0x0055). Please submit an issue!!! */
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
            r2 = 1
            switch(r1) {
                case 0: goto L1b;
                case 1: goto L12;
                default: goto La;
            }
        La:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r0)
            throw r9
        L12:
            int r1 = r8.I$1
            int r3 = r8.I$0
            kotlin.ResultKt.throwOnFailure(r9)
            r4 = r8
            goto L54
        L1b:
            kotlin.ResultKt.throwOnFailure(r9)
            r1 = 0
            com.rajat.pdfviewer.PdfRendererCore r3 = r8.this$0
            int r3 = r3.getPageCount()
            r4 = r3
            r3 = r1
            r1 = r4
            r4 = r8
        L29:
            if (r3 >= r1) goto L57
            com.rajat.pdfviewer.PdfRendererCore r5 = r4.this$0
            java.util.Map r5 = com.rajat.pdfviewer.PdfRendererCore.access$getPageDimensionCache$p(r5)
            java.lang.Integer r6 = kotlin.coroutines.jvm.internal.Boxing.boxInt(r3)
            boolean r5 = r5.containsKey(r6)
            if (r5 != 0) goto L55
            com.rajat.pdfviewer.PdfRendererCore r5 = r4.this$0
            com.rajat.pdfviewer.PdfRendererCore r6 = r4.this$0
            com.rajat.pdfviewer.PdfRendererCore$preloadPageDimensions$1$$ExternalSyntheticLambda0 r7 = new com.rajat.pdfviewer.PdfRendererCore$preloadPageDimensions$1$$ExternalSyntheticLambda0
            r7.<init>()
            r6 = r4
            kotlin.coroutines.Continuation r6 = (kotlin.coroutines.Continuation) r6
            r4.I$0 = r3
            r4.I$1 = r1
            r4.label = r2
            java.lang.Object r5 = com.rajat.pdfviewer.PdfRendererCore.access$withPdfPage(r5, r3, r7, r6)
            if (r5 != r0) goto L54
            return r0
        L54:
        L55:
            int r3 = r3 + r2
            goto L29
        L57:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererCore$preloadPageDimensions$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit invokeSuspend$lambda$0(PdfRendererCore this$0, int $pageNo, PdfRenderer.Page page) {
        Map map;
        Integer valueOf = Integer.valueOf($pageNo);
        map = this$0.pageDimensionCache;
        map.put(valueOf, new Size(page.getWidth(), page.getHeight()));
        return Unit.INSTANCE;
    }
}
