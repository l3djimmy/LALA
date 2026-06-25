package com.rajat.pdfviewer;

import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfDownloader.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfDownloader", f = "PdfDownloader.kt", i = {0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 4, 4, 4, 4, 5, 5, 5, 5}, l = {Property.FONT_SET, 104, 105, 109, Property.CAPTION_SIDE, Property.ORPHANS_CONTROL}, m = "retryDownload", n = {"downloadUrl", "cacheDir", "pdfFile", "downloadUrl", "cacheDir", "pdfFile", "attempt", "downloadUrl", "cacheDir", "pdfFile", "attempt", "downloadUrl", "cacheDir", "pdfFile", "attempt", "downloadUrl", "cacheDir", "pdfFile", "attempt"}, s = {"L$0", "L$1", "L$2", "L$0", "L$1", "L$2", "I$0", "L$0", "L$1", "L$2", "I$0", "L$0", "L$1", "L$2", "I$0", "L$0", "L$1", "L$2", "I$0"})
/* loaded from: classes12.dex */
public final class PdfDownloader$retryDownload$1 extends ContinuationImpl {
    int I$0;
    Object L$0;
    Object L$1;
    Object L$2;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PdfDownloader this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfDownloader$retryDownload$1(PdfDownloader pdfDownloader, Continuation<? super PdfDownloader$retryDownload$1> continuation) {
        super(continuation);
        this.this$0 = pdfDownloader;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object retryDownload;
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        retryDownload = this.this$0.retryDownload(null, null, null, this);
        return retryDownload;
    }
}
