package com.rajat.pdfviewer;

import android.view.MenuItem;
import com.rajat.pdfviewer.PdfRendererView;
import com.rajat.pdfviewer.util.ViewerStrings;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PdfViewerActivity.kt */
@Metadata(d1 = {"\u00001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0003\n\u0002\b\u0004*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H\u0016J\b\u0010\u0004\u001a\u00020\u0003H\u0016J\b\u0010\u0005\u001a\u00020\u0003H\u0016J'\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0016¢\u0006\u0002\u0010\fJ\u0010\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0018\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\b2\u0006\u0010\u0015\u001a\u00020\bH\u0016¨\u0006\u0016"}, d2 = {"com/rajat/pdfviewer/PdfViewerActivity$init$1", "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;", "onPdfLoadStart", "", "onPdfRenderSuccess", "onPdfRenderStart", "onPdfLoadProgress", "progress", "", "downloadedBytes", "", "totalBytes", "(IJLjava/lang/Long;)V", "onPdfLoadSuccess", "absolutePath", "", "onError", "error", "", "onPageChanged", "currentPage", "totalPage", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfViewerActivity$init$1 implements PdfRendererView.StatusCallBack {
    final /* synthetic */ PdfViewerActivity this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfViewerActivity$init$1(PdfViewerActivity $receiver) {
        this.this$0 = $receiver;
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onPdfLoadStart() {
        this.this$0.showProgressBar(true);
        this.this$0.updateDownloadButtonState(false);
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onPdfRenderSuccess() {
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onPdfRenderStart() {
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onPdfLoadProgress(int progress, long downloadedBytes, Long totalBytes) {
        this.this$0.showProgressBar(true);
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onPdfLoadSuccess(final String absolutePath) {
        Intrinsics.checkNotNullParameter(absolutePath, "absolutePath");
        PdfViewerActivity pdfViewerActivity = this.this$0;
        final PdfViewerActivity pdfViewerActivity2 = this.this$0;
        pdfViewerActivity.runOnUiThread(new Runnable() { // from class: com.rajat.pdfviewer.PdfViewerActivity$init$1$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                PdfViewerActivity$init$1.onPdfLoadSuccess$lambda$0(PdfViewerActivity.this, absolutePath);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void onPdfLoadSuccess$lambda$0(PdfViewerActivity this$0, String $absolutePath) {
        MenuItem menuItem;
        this$0.showProgressBar(false);
        this$0.setDownloadedFilePath($absolutePath);
        menuItem = this$0.menuItem;
        if (menuItem == null) {
            this$0.isDownloadButtonEnabled = true;
        } else {
            this$0.updateDownloadButtonState(true);
        }
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onError(final Throwable error) {
        Intrinsics.checkNotNullParameter(error, "error");
        PdfViewerActivity pdfViewerActivity = this.this$0;
        final PdfViewerActivity pdfViewerActivity2 = this.this$0;
        pdfViewerActivity.runOnUiThread(new Runnable() { // from class: com.rajat.pdfviewer.PdfViewerActivity$init$1$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                PdfViewerActivity$init$1.onError$lambda$1(PdfViewerActivity.this, error);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void onError$lambda$1(PdfViewerActivity this$0, Throwable $error) {
        boolean isRetryable;
        this$0.showProgressBar(false);
        ViewerStrings strings = ViewerStrings.Companion.from(this$0);
        String errorMessage = ViewerStrings.Companion.getMessageForError(strings, $error);
        isRetryable = this$0.isRetryable($error);
        this$0.showErrorDialog(errorMessage, isRetryable);
    }

    @Override // com.rajat.pdfviewer.PdfRendererView.StatusCallBack
    public void onPageChanged(int currentPage, int totalPage) {
    }
}
