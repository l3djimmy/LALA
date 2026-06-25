package com.rajat.pdfviewer.util;

import android.net.Uri;
import com.google.android.gms.common.internal.ImagesContract;
import java.io.File;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PdfSource.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0004\u0006\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/rajat/pdfviewer/util/PdfSource;", "", "Remote", "LocalFile", "LocalUri", "PdfSourceFromAsset", "Lcom/rajat/pdfviewer/util/PdfSource$LocalFile;", "Lcom/rajat/pdfviewer/util/PdfSource$LocalUri;", "Lcom/rajat/pdfviewer/util/PdfSource$PdfSourceFromAsset;", "Lcom/rajat/pdfviewer/util/PdfSource$Remote;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public interface PdfSource {

    /* compiled from: PdfSource.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/rajat/pdfviewer/util/PdfSource$Remote;", "Lcom/rajat/pdfviewer/util/PdfSource;", ImagesContract.URL, "", "<init>", "(Ljava/lang/String;)V", "getUrl", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "", "hashCode", "", "toString", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Remote implements PdfSource {
        public static final int $stable = 0;
        private final String url;

        public static /* synthetic */ Remote copy$default(Remote remote, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = remote.url;
            }
            return remote.copy(str);
        }

        public final String component1() {
            return this.url;
        }

        public final Remote copy(String url) {
            Intrinsics.checkNotNullParameter(url, "url");
            return new Remote(url);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Remote) && Intrinsics.areEqual(this.url, ((Remote) obj).url);
        }

        public int hashCode() {
            return this.url.hashCode();
        }

        public String toString() {
            return "Remote(url=" + this.url + ')';
        }

        public Remote(String url) {
            Intrinsics.checkNotNullParameter(url, "url");
            this.url = url;
        }

        public final String getUrl() {
            return this.url;
        }
    }

    /* compiled from: PdfSource.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/rajat/pdfviewer/util/PdfSource$LocalFile;", "Lcom/rajat/pdfviewer/util/PdfSource;", "file", "Ljava/io/File;", "<init>", "(Ljava/io/File;)V", "getFile", "()Ljava/io/File;", "component1", "copy", "equals", "", "other", "", "hashCode", "", "toString", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class LocalFile implements PdfSource {
        public static final int $stable = 8;
        private final File file;

        public static /* synthetic */ LocalFile copy$default(LocalFile localFile, File file, int i, Object obj) {
            if ((i & 1) != 0) {
                file = localFile.file;
            }
            return localFile.copy(file);
        }

        public final File component1() {
            return this.file;
        }

        public final LocalFile copy(File file) {
            Intrinsics.checkNotNullParameter(file, "file");
            return new LocalFile(file);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof LocalFile) && Intrinsics.areEqual(this.file, ((LocalFile) obj).file);
        }

        public int hashCode() {
            return this.file.hashCode();
        }

        public String toString() {
            return "LocalFile(file=" + this.file + ')';
        }

        public LocalFile(File file) {
            Intrinsics.checkNotNullParameter(file, "file");
            this.file = file;
        }

        public final File getFile() {
            return this.file;
        }
    }

    /* compiled from: PdfSource.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/rajat/pdfviewer/util/PdfSource$LocalUri;", "Lcom/rajat/pdfviewer/util/PdfSource;", "uri", "Landroid/net/Uri;", "<init>", "(Landroid/net/Uri;)V", "getUri", "()Landroid/net/Uri;", "component1", "copy", "equals", "", "other", "", "hashCode", "", "toString", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class LocalUri implements PdfSource {
        public static final int $stable = 8;
        private final Uri uri;

        public static /* synthetic */ LocalUri copy$default(LocalUri localUri, Uri uri, int i, Object obj) {
            if ((i & 1) != 0) {
                uri = localUri.uri;
            }
            return localUri.copy(uri);
        }

        public final Uri component1() {
            return this.uri;
        }

        public final LocalUri copy(Uri uri) {
            Intrinsics.checkNotNullParameter(uri, "uri");
            return new LocalUri(uri);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof LocalUri) && Intrinsics.areEqual(this.uri, ((LocalUri) obj).uri);
        }

        public int hashCode() {
            return this.uri.hashCode();
        }

        public String toString() {
            return "LocalUri(uri=" + this.uri + ')';
        }

        public LocalUri(Uri uri) {
            Intrinsics.checkNotNullParameter(uri, "uri");
            this.uri = uri;
        }

        public final Uri getUri() {
            return this.uri;
        }
    }

    /* compiled from: PdfSource.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/rajat/pdfviewer/util/PdfSource$PdfSourceFromAsset;", "Lcom/rajat/pdfviewer/util/PdfSource;", "assetFileName", "", "<init>", "(Ljava/lang/String;)V", "getAssetFileName", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "", "hashCode", "", "toString", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class PdfSourceFromAsset implements PdfSource {
        public static final int $stable = 0;
        private final String assetFileName;

        public static /* synthetic */ PdfSourceFromAsset copy$default(PdfSourceFromAsset pdfSourceFromAsset, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pdfSourceFromAsset.assetFileName;
            }
            return pdfSourceFromAsset.copy(str);
        }

        public final String component1() {
            return this.assetFileName;
        }

        public final PdfSourceFromAsset copy(String assetFileName) {
            Intrinsics.checkNotNullParameter(assetFileName, "assetFileName");
            return new PdfSourceFromAsset(assetFileName);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof PdfSourceFromAsset) && Intrinsics.areEqual(this.assetFileName, ((PdfSourceFromAsset) obj).assetFileName);
        }

        public int hashCode() {
            return this.assetFileName.hashCode();
        }

        public String toString() {
            return "PdfSourceFromAsset(assetFileName=" + this.assetFileName + ')';
        }

        public PdfSourceFromAsset(String assetFileName) {
            Intrinsics.checkNotNullParameter(assetFileName, "assetFileName");
            this.assetFileName = assetFileName;
        }

        public final String getAssetFileName() {
            return this.assetFileName;
        }
    }
}
