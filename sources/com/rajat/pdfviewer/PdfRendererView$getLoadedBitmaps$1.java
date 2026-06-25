package com.rajat.pdfviewer;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererView.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererView", f = "PdfRendererView.kt", i = {0}, l = {555}, m = "getLoadedBitmaps", n = {"destination$iv$iv"}, s = {"L$0"})
/* loaded from: classes12.dex */
public final class PdfRendererView$getLoadedBitmaps$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PdfRendererView this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererView$getLoadedBitmaps$1(PdfRendererView pdfRendererView, Continuation<? super PdfRendererView$getLoadedBitmaps$1> continuation) {
        super(continuation);
        this.this$0 = pdfRendererView;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.getLoadedBitmaps(this);
    }
}
