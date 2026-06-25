package com.rajat.pdfviewer;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;
import com.rajat.pdfviewer.util.DownloadStatus;
import kotlin.Metadata;
/* compiled from: PdfViewerViewModel.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\b¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/rajat/pdfviewer/PdfViewerViewModel;", "Landroidx/lifecycle/ViewModel;", "<init>", "()V", "_downloadStatus", "Landroidx/lifecycle/MutableLiveData;", "Lcom/rajat/pdfviewer/util/DownloadStatus;", "downloadStatus", "Landroidx/lifecycle/LiveData;", "getDownloadStatus", "()Landroidx/lifecycle/LiveData;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfViewerViewModel extends ViewModel {
    public static final int $stable = 8;
    private final MutableLiveData<DownloadStatus> _downloadStatus = new MutableLiveData<>();
    private final LiveData<DownloadStatus> downloadStatus = this._downloadStatus;

    public final LiveData<DownloadStatus> getDownloadStatus() {
        return this.downloadStatus;
    }
}
