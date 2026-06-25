package com.rajat.pdfviewer;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCore.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore", f = "PdfRendererCore.kt", i = {0, 0, 0, 0, 0, 1, 1, 1}, l = {306, 311}, m = "prefetchPagesAround", n = {"destination$iv$iv", "element$iv$iv", "currentPage", "fallbackWidth", "fallbackHeight", "fallbackWidth", "fallbackHeight", "pageNo"}, s = {"L$0", "L$2", "I$0", "I$1", "I$2", "I$0", "I$1", "I$2"})
/* loaded from: classes12.dex */
public final class PdfRendererCore$prefetchPagesAround$1 extends ContinuationImpl {
    int I$0;
    int I$1;
    int I$2;
    Object L$0;
    Object L$1;
    Object L$2;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$prefetchPagesAround$1(PdfRendererCore pdfRendererCore, Continuation<? super PdfRendererCore$prefetchPagesAround$1> continuation) {
        super(continuation);
        this.this$0 = pdfRendererCore;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object prefetchPagesAround;
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        prefetchPagesAround = this.this$0.prefetchPagesAround(0, 0, 0, 0, this);
        return prefetchPagesAround;
    }
}
