package com.rajat.pdfviewer.util;

import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: Enums.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0004\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/rajat/pdfviewer/util/DownloadStatus;", "", "<init>", "()V", "Started", "Success", "Failure", "Progress", "Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;", "Lcom/rajat/pdfviewer/util/DownloadStatus$Progress;", "Lcom/rajat/pdfviewer/util/DownloadStatus$Started;", "Lcom/rajat/pdfviewer/util/DownloadStatus$Success;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public abstract class DownloadStatus {
    public static final int $stable = 0;

    public /* synthetic */ DownloadStatus(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    /* compiled from: Enums.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/rajat/pdfviewer/util/DownloadStatus$Started;", "Lcom/rajat/pdfviewer/util/DownloadStatus;", "<init>", "()V", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Started extends DownloadStatus {
        public static final int $stable = 0;
        public static final Started INSTANCE = new Started();

        private Started() {
            super(null);
        }
    }

    private DownloadStatus() {
    }

    /* compiled from: Enums.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/rajat/pdfviewer/util/DownloadStatus$Success;", "Lcom/rajat/pdfviewer/util/DownloadStatus;", "<init>", "()V", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Success extends DownloadStatus {
        public static final int $stable = 0;
        public static final Success INSTANCE = new Success();

        private Success() {
            super(null);
        }
    }

    /* compiled from: Enums.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/rajat/pdfviewer/util/DownloadStatus$Failure;", "Lcom/rajat/pdfviewer/util/DownloadStatus;", "<init>", "()V", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Failure extends DownloadStatus {
        public static final int $stable = 0;
        public static final Failure INSTANCE = new Failure();

        private Failure() {
            super(null);
        }
    }

    /* compiled from: Enums.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/rajat/pdfviewer/util/DownloadStatus$Progress;", "Lcom/rajat/pdfviewer/util/DownloadStatus;", "progress", "", "<init>", "(I)V", "getProgress", "()I", "component1", "copy", "equals", "", "other", "", "hashCode", "toString", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Progress extends DownloadStatus {
        public static final int $stable = 0;
        private final int progress;

        public static /* synthetic */ Progress copy$default(Progress progress, int i, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                i = progress.progress;
            }
            return progress.copy(i);
        }

        public final int component1() {
            return this.progress;
        }

        public final Progress copy(int i) {
            return new Progress(i);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Progress) && this.progress == ((Progress) obj).progress;
        }

        public int hashCode() {
            return Integer.hashCode(this.progress);
        }

        public String toString() {
            return "Progress(progress=" + this.progress + ')';
        }

        public Progress(int progress) {
            super(null);
            this.progress = progress;
        }

        public final int getProgress() {
            return this.progress;
        }
    }
}
