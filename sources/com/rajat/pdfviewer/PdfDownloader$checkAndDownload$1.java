package com.rajat.pdfviewer;

import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfDownloader.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfDownloader", f = "PdfDownloader.kt", i = {0, 0, 0}, l = {Property.MIN_WIDTH, Property.KEEP_WITH_NEXT, Property.LIST_SYMBOL_POSITION}, m = "checkAndDownload", n = {"downloadUrl", "cacheDir", "pdfFile"}, s = {"L$0", "L$1", "L$2"})
/* loaded from: classes12.dex */
public final class PdfDownloader$checkAndDownload$1 extends ContinuationImpl {
    Object L$0;
    Object L$1;
    Object L$2;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PdfDownloader this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfDownloader$checkAndDownload$1(PdfDownloader pdfDownloader, Continuation<? super PdfDownloader$checkAndDownload$1> continuation) {
        super(continuation);
        this.this$0 = pdfDownloader;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object checkAndDownload;
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        checkAndDownload = this.this$0.checkAndDownload(null, this);
        return checkAndDownload;
    }
}
