package com.rajat.pdfviewer;

import android.os.Handler;
import android.os.Looper;
import com.rajat.pdfviewer.PdfDownloader;
import java.io.File;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
import okhttp3.ResponseBody;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfDownloader.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfDownloader$downloadFile$2", f = "PdfDownloader.kt", i = {0, 1}, l = {154, 177}, m = "invokeSuspend", n = {"tempFile", "tempFile"}, s = {"L$0", "L$0"})
/* loaded from: classes12.dex */
public final class PdfDownloader$downloadFile$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Integer>, Object> {
    final /* synthetic */ String $downloadUrl;
    final /* synthetic */ File $pdfFile;
    Object L$0;
    int label;
    final /* synthetic */ PdfDownloader this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfDownloader$downloadFile$2(File file, PdfDownloader pdfDownloader, String str, Continuation<? super PdfDownloader$downloadFile$2> continuation) {
        super(2, continuation);
        this.$pdfFile = file;
        this.this$0 = pdfDownloader;
        this.$downloadUrl = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfDownloader$downloadFile$2(this.$pdfFile, this.this$0, this.$downloadUrl, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Integer> continuation) {
        return ((PdfDownloader$downloadFile$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0060 A[Catch: Exception -> 0x0068, TRY_LEAVE, TryCatch #5 {Exception -> 0x0068, blocks: (B:19:0x0058, B:21:0x0060), top: B:72:0x0058 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0081 A[Catch: Exception -> 0x0136, TRY_LEAVE, TryCatch #6 {Exception -> 0x0136, blocks: (B:26:0x006e, B:28:0x0081, B:33:0x00b4, B:35:0x00c0, B:48:0x0113, B:49:0x011d, B:62:0x012e, B:63:0x0135, B:29:0x0086, B:32:0x00ae, B:30:0x0092), top: B:69:0x006e }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00de A[Catch: Exception -> 0x010f, TRY_LEAVE, TryCatch #7 {Exception -> 0x010f, blocks: (B:39:0x00d6, B:41:0x00de, B:44:0x0102, B:45:0x010e), top: B:70:0x00d6 }] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0102 A[Catch: Exception -> 0x010f, TRY_ENTER, TryCatch #7 {Exception -> 0x010f, blocks: (B:39:0x00d6, B:41:0x00de, B:44:0x0102, B:45:0x010e), top: B:70:0x00d6 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x012e A[Catch: Exception -> 0x0136, TryCatch #6 {Exception -> 0x0136, blocks: (B:26:0x006e, B:28:0x0081, B:33:0x00b4, B:35:0x00c0, B:48:0x0113, B:49:0x011d, B:62:0x012e, B:63:0x0135, B:29:0x0086, B:32:0x00ae, B:30:0x0092), top: B:69:0x006e }] */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r1v21 */
    /* JADX WARN: Type inference failed for: r1v26 */
    /* JADX WARN: Type inference failed for: r1v6 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            Method dump skipped, instructions count: 328
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfDownloader$downloadFile$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit invokeSuspend$lambda$3$lambda$2$lambda$1(final PdfDownloader this$0, final ResponseBody $body, final long progress) {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.rajat.pdfviewer.PdfDownloader$downloadFile$2$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                PdfDownloader$downloadFile$2.invokeSuspend$lambda$3$lambda$2$lambda$1$lambda$0(PdfDownloader.this, progress, $body);
            }
        });
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void invokeSuspend$lambda$3$lambda$2$lambda$1$lambda$0(PdfDownloader this$0, long $progress, ResponseBody $body) {
        PdfDownloader.StatusListener statusListener;
        statusListener = this$0.listener;
        statusListener.onDownloadProgress($progress, $body.contentLength());
    }
}
