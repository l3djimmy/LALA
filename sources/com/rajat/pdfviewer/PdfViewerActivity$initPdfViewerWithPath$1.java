package com.rajat.pdfviewer;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfViewerActivity.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfViewerActivity", f = "PdfViewerActivity.kt", i = {}, l = {TypedValues.CycleType.TYPE_ALPHA, 405}, m = "initPdfViewerWithPath", n = {}, s = {})
/* loaded from: classes12.dex */
public final class PdfViewerActivity$initPdfViewerWithPath$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PdfViewerActivity this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfViewerActivity$initPdfViewerWithPath$1(PdfViewerActivity pdfViewerActivity, Continuation<? super PdfViewerActivity$initPdfViewerWithPath$1> continuation) {
        super(continuation);
        this.this$0 = pdfViewerActivity;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object initPdfViewerWithPath;
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        initPdfViewerWithPath = this.this$0.initPdfViewerWithPath(null, this);
        return initPdfViewerWithPath;
    }
}
