package com.rajat.pdfviewer;

import android.content.Context;
import com.rajat.pdfviewer.PdfDownloader;
import java.io.File;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
/* compiled from: PdfDownloadCallback.kt */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\b\f\b\u0001\u0018\u00002\u00020\u0001Be\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u001e\u0010\u0007\u001a\u001a\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u00060\b\u0012\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00060\f\u0012\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00060\f¢\u0006\u0004\b\u0010\u0010\u0011J\b\u0010\u0012\u001a\u00020\u0003H\u0016J\b\u0010\u0013\u001a\u00020\u0006H\u0016J\u0018\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\nH\u0016J\u0010\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\rH\u0016J\u0010\u0010\u0019\u001a\u00020\u00062\u0006\u0010\u001a\u001a\u00020\u000fH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R&\u0010\u0007\u001a\u001a\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u00060\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00060\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00060\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001b"}, d2 = {"Lcom/rajat/pdfviewer/PdfDownloadCallback;", "Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;", "context", "Landroid/content/Context;", "onStart", "Lkotlin/Function0;", "", "onProgress", "Lkotlin/Function3;", "", "", "onSuccess", "Lkotlin/Function1;", "Ljava/io/File;", "onError", "", "<init>", "(Landroid/content/Context;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V", "getContext", "onDownloadStart", "onDownloadProgress", "currentBytes", "totalBytes", "onDownloadSuccess", "downloadedFile", "onDownloadError", "error", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfDownloadCallback implements PdfDownloader.StatusListener {
    public static final int $stable = 8;
    private final Context context;
    private final Function1<Throwable, Unit> onError;
    private final Function3<Integer, Long, Long, Unit> onProgress;
    private final Function0<Unit> onStart;
    private final Function1<File, Unit> onSuccess;

    /* JADX WARN: Multi-variable type inference failed */
    public PdfDownloadCallback(Context context, Function0<Unit> onStart, Function3<? super Integer, ? super Long, ? super Long, Unit> onProgress, Function1<? super File, Unit> onSuccess, Function1<? super Throwable, Unit> onError) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(onStart, "onStart");
        Intrinsics.checkNotNullParameter(onProgress, "onProgress");
        Intrinsics.checkNotNullParameter(onSuccess, "onSuccess");
        Intrinsics.checkNotNullParameter(onError, "onError");
        this.context = context;
        this.onStart = onStart;
        this.onProgress = onProgress;
        this.onSuccess = onSuccess;
        this.onError = onError;
    }

    @Override // com.rajat.pdfviewer.PdfDownloader.StatusListener
    public Context getContext() {
        return this.context;
    }

    @Override // com.rajat.pdfviewer.PdfDownloader.StatusListener
    public void onDownloadStart() {
        this.onStart.invoke();
    }

    @Override // com.rajat.pdfviewer.PdfDownloader.StatusListener
    public void onDownloadProgress(long currentBytes, long totalBytes) {
        int progress = RangesKt.coerceAtMost((int) ((((float) currentBytes) / ((float) totalBytes)) * 100.0f), 100);
        this.onProgress.invoke(Integer.valueOf(progress), Long.valueOf(currentBytes), Long.valueOf(totalBytes));
    }

    @Override // com.rajat.pdfviewer.PdfDownloader.StatusListener
    public void onDownloadSuccess(File downloadedFile) {
        Intrinsics.checkNotNullParameter(downloadedFile, "downloadedFile");
        this.onSuccess.invoke(downloadedFile);
    }

    @Override // com.rajat.pdfviewer.PdfDownloader.StatusListener
    public void onDownloadError(Throwable error) {
        Intrinsics.checkNotNullParameter(error, "error");
        error.printStackTrace();
        this.onError.invoke(error);
    }
}
