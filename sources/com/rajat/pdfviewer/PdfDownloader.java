package com.rajat.pdfviewer;

import android.content.Context;
import com.google.android.gms.common.internal.ImagesContract;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import com.rajat.pdfviewer.util.CacheHelper;
import com.rajat.pdfviewer.util.CachePolicy;
import com.rajat.pdfviewer.util.CacheStrategy;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Dispatchers;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
/* compiled from: PdfDownloader.kt */
@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u0000 ,2\u00020\u0001:\u0002+,BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e¢\u0006\u0004\b\u000f\u0010\u0010J\u0006\u0010\u0013\u001a\u00020\u0014J\u0016\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0007H\u0082@¢\u0006\u0002\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J&\u0010\u001b\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001c\u001a\u00020\u001aH\u0082@¢\u0006\u0002\u0010\u001dJ\u001e\u0010\u001e\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001c\u001a\u00020\u001aH\u0082@¢\u0006\u0002\u0010\u001fJ\u0010\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020#H\u0002J\u001e\u0010$\u001a\u00020%2\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u001aH\u0082@¢\u0006\u0002\u0010&J\u0010\u0010'\u001a\u00020(2\u0006\u0010\u0016\u001a\u00020\u0007H\u0002J\u0010\u0010)\u001a\u00020\u00142\u0006\u0010*\u001a\u00020(H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Lcom/rajat/pdfviewer/PdfDownloader;", "", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "headers", "Lcom/rajat/pdfviewer/HeaderData;", ImagesContract.URL, "", "cachedFileName", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;", "httpClient", "Lokhttp3/OkHttpClient;", "<init>", "(Lkotlinx/coroutines/CoroutineScope;Lcom/rajat/pdfviewer/HeaderData;Ljava/lang/String;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;Lokhttp3/OkHttpClient;)V", "cachePolicy", "Lcom/rajat/pdfviewer/util/CachePolicy;", "start", "", "checkAndDownload", "downloadUrl", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "prepareDownloadDirectory", "cacheDir", "Ljava/io/File;", "retryDownload", "pdfFile", "(Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "completeSuccessfulDownload", "(Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "isInvalidFileError", "", "error", "Ljava/io/IOException;", "downloadFile", "", "(Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "makeNetworkRequest", "Lokhttp3/Response;", "validateResponse", "response", "StatusListener", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfDownloader {
    private static final int MAX_RETRIES = 2;
    private static final long RETRY_DELAY = 2000;
    private static final String TAG = "PdfDownloader";
    private final CachePolicy cachePolicy;
    private final CacheStrategy cacheStrategy;
    private final String cachedFileName;
    private final CoroutineScope coroutineScope;
    private final HeaderData headers;
    private final OkHttpClient httpClient;
    private final StatusListener listener;
    private final String url;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    /* compiled from: PdfDownloader.kt */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0003\n\u0000\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\b\u0010\u0004\u001a\u00020\u0005H&J\u0018\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bH&J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\fH&J\u0010\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fH&¨\u0006\u0010"}, d2 = {"Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;", "", "getContext", "Landroid/content/Context;", "onDownloadStart", "", "onDownloadProgress", "currentBytes", "", "totalBytes", "onDownloadSuccess", "downloadedFile", "Ljava/io/File;", "onDownloadError", "error", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public interface StatusListener {
        Context getContext();

        void onDownloadError(Throwable th);

        void onDownloadProgress(long j, long j2);

        void onDownloadStart();

        void onDownloadSuccess(File file);
    }

    public PdfDownloader(CoroutineScope coroutineScope, HeaderData headers, String url, String cachedFileName, CacheStrategy cacheStrategy, StatusListener listener, OkHttpClient httpClient) {
        Intrinsics.checkNotNullParameter(coroutineScope, "coroutineScope");
        Intrinsics.checkNotNullParameter(headers, "headers");
        Intrinsics.checkNotNullParameter(url, "url");
        Intrinsics.checkNotNullParameter(cachedFileName, "cachedFileName");
        Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
        Intrinsics.checkNotNullParameter(listener, "listener");
        Intrinsics.checkNotNullParameter(httpClient, "httpClient");
        this.coroutineScope = coroutineScope;
        this.headers = headers;
        this.url = url;
        this.cachedFileName = cachedFileName;
        this.cacheStrategy = cacheStrategy;
        this.listener = listener;
        this.httpClient = httpClient;
        this.cachePolicy = CachePolicy.Companion.from$default(CachePolicy.Companion, this.cacheStrategy, 0, 2, null);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ PdfDownloader(kotlinx.coroutines.CoroutineScope r10, com.rajat.pdfviewer.HeaderData r11, java.lang.String r12, java.lang.String r13, com.rajat.pdfviewer.util.CacheStrategy r14, com.rajat.pdfviewer.PdfDownloader.StatusListener r15, okhttp3.OkHttpClient r16, int r17, kotlin.jvm.internal.DefaultConstructorMarker r18) {
        /*
            r9 = this;
            r0 = r17 & 64
            if (r0 == 0) goto Lc
            com.rajat.pdfviewer.PdfDownloader$Companion r0 = com.rajat.pdfviewer.PdfDownloader.Companion
            okhttp3.OkHttpClient r0 = com.rajat.pdfviewer.PdfDownloader.Companion.access$defaultHttpClient(r0)
            r8 = r0
            goto Le
        Lc:
            r8 = r16
        Le:
            r1 = r9
            r2 = r10
            r3 = r11
            r4 = r12
            r5 = r13
            r6 = r14
            r7 = r15
            r1.<init>(r2, r3, r4, r5, r6, r7, r8)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfDownloader.<init>(kotlinx.coroutines.CoroutineScope, com.rajat.pdfviewer.HeaderData, java.lang.String, java.lang.String, com.rajat.pdfviewer.util.CacheStrategy, com.rajat.pdfviewer.PdfDownloader$StatusListener, okhttp3.OkHttpClient, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final void start() {
        BuildersKt__Builders_commonKt.launch$default(this.coroutineScope, Dispatchers.getIO(), null, new PdfDownloader$start$1(this, null), 2, null);
    }

    /* compiled from: PdfDownloader.kt */
    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\n\u001a\u00020\u000bH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/rajat/pdfviewer/PdfDownloader$Companion;", "", "<init>", "()V", "TAG", "", "MAX_RETRIES", "", "RETRY_DELAY", "", "defaultHttpClient", "Lokhttp3/OkHttpClient;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final OkHttpClient defaultHttpClient() {
            return new OkHttpClient.Builder().followRedirects(true).followSslRedirects(true).protocols(CollectionsKt.listOf((Object[]) new Protocol[]{Protocol.HTTP_2, Protocol.HTTP_1_1})).build();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object checkAndDownload(java.lang.String r11, kotlin.coroutines.Continuation<? super kotlin.Unit> r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof com.rajat.pdfviewer.PdfDownloader$checkAndDownload$1
            if (r0 == 0) goto L14
            r0 = r12
            com.rajat.pdfviewer.PdfDownloader$checkAndDownload$1 r0 = (com.rajat.pdfviewer.PdfDownloader$checkAndDownload$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            com.rajat.pdfviewer.PdfDownloader$checkAndDownload$1 r0 = new com.rajat.pdfviewer.PdfDownloader$checkAndDownload$1
            r0.<init>(r10, r12)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 0
            switch(r3) {
                case 0: goto L44;
                case 1: goto L32;
                case 2: goto L2d;
                case 3: goto L2d;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r11 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r11.<init>(r0)
            throw r11
        L2d:
            kotlin.ResultKt.throwOnFailure(r1)
            goto Lb3
        L32:
            r11 = r10
            java.lang.Object r3 = r0.L$2
            java.io.File r3 = (java.io.File) r3
            java.lang.Object r5 = r0.L$1
            java.io.File r5 = (java.io.File) r5
            java.lang.Object r6 = r0.L$0
            java.lang.String r6 = (java.lang.String) r6
            kotlin.ResultKt.throwOnFailure(r1)
            r7 = r1
            goto L9b
        L44:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r10
            r6 = r11
            java.io.File r11 = new java.io.File
            com.rajat.pdfviewer.PdfDownloader$StatusListener r5 = r3.listener
            android.content.Context r5 = r5.getContext()
            java.io.File r5 = r5.getCacheDir()
            java.lang.StringBuilder r7 = new java.lang.StringBuilder
            r7.<init>()
            java.lang.String r8 = "___pdf___cache___/"
            java.lang.StringBuilder r7 = r7.append(r8)
            java.lang.String r8 = r3.cachedFileName
            java.lang.StringBuilder r7 = r7.append(r8)
            java.lang.String r7 = r7.toString()
            r11.<init>(r5, r7)
            r5 = r11
            r3.prepareDownloadDirectory(r5)
            java.io.File r11 = new java.io.File
            java.lang.String r7 = r3.cachedFileName
            r11.<init>(r5, r7)
            com.rajat.pdfviewer.util.CachePolicy r7 = r3.cachePolicy
            boolean r7 = r7.getReuseRemoteFile()
            if (r7 == 0) goto Lb9
            boolean r7 = r11.exists()
            if (r7 == 0) goto Lb9
            com.rajat.pdfviewer.util.FileUtils r7 = com.rajat.pdfviewer.util.FileUtils.INSTANCE
            r0.L$0 = r6
            r0.L$1 = r5
            r0.L$2 = r11
            r8 = 1
            r0.label = r8
            java.lang.Object r7 = r7.isValidPdf(r11, r0)
            if (r7 != r2) goto L98
            return r2
        L98:
            r9 = r3
            r3 = r11
            r11 = r9
        L9b:
            java.lang.Boolean r7 = (java.lang.Boolean) r7
            boolean r7 = r7.booleanValue()
            if (r7 == 0) goto Lb6
            r0.L$0 = r4
            r0.L$1 = r4
            r0.L$2 = r4
            r4 = 2
            r0.label = r4
            java.lang.Object r11 = r11.completeSuccessfulDownload(r5, r3, r0)
            if (r11 != r2) goto Lb3
            return r2
        Lb3:
            kotlin.Unit r11 = kotlin.Unit.INSTANCE
            return r11
        Lb6:
            r9 = r3
            r3 = r11
            r11 = r9
        Lb9:
            r0.L$0 = r4
            r0.L$1 = r4
            r0.L$2 = r4
            r4 = 3
            r0.label = r4
            java.lang.Object r11 = r3.retryDownload(r6, r5, r11, r0)
            if (r11 != r2) goto Lb3
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfDownloader.checkAndDownload(java.lang.String, kotlin.coroutines.Continuation):java.lang.Object");
    }

    private final void prepareDownloadDirectory(File cacheDir) {
        if (!this.cachePolicy.getPersistRemoteFile() && cacheDir.exists()) {
            FilesKt.deleteRecursively(cacheDir);
        }
        cacheDir.mkdirs();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't wrap try/catch for region: R(6:1|(2:3|(4:5|6|7|8))|62|6|7|8) */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x00a2, code lost:
        r0 = e;
     */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x012f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0169  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01e2  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0100 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x01a4 -> B:28:0x00fd). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:59:0x01d2 -> B:60:0x01df). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object retryDownload(java.lang.String r18, java.io.File r19, java.io.File r20, kotlin.coroutines.Continuation<? super kotlin.Unit> r21) {
        /*
            Method dump skipped, instructions count: 504
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfDownloader.retryDownload(java.lang.String, java.io.File, java.io.File, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object completeSuccessfulDownload(File cacheDir, File pdfFile, Continuation<? super Unit> continuation) {
        if (this.cachePolicy.getPersistRemoteFile()) {
            CacheHelper.INSTANCE.applyDocumentRetention$pdfViewer_release(TAG, cacheDir, this.cachePolicy);
        }
        Object withContext = BuildersKt.withContext(Dispatchers.getMain(), new PdfDownloader$completeSuccessfulDownload$2(this, pdfFile, null), continuation);
        return withContext == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? withContext : Unit.INSTANCE;
    }

    private final boolean isInvalidFileError(IOException error) {
        String message = error.getMessage();
        if (message == null) {
            return false;
        }
        return StringsKt.contains((CharSequence) message, (CharSequence) "Invalid content type", true) || StringsKt.contains((CharSequence) message, (CharSequence) "Downloaded file is not a valid PDF", true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object downloadFile(String downloadUrl, File pdfFile, Continuation<? super Integer> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new PdfDownloader$downloadFile$2(pdfFile, this, downloadUrl, null), continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Response makeNetworkRequest(String downloadUrl) {
        Request.Builder requestBuilder = new Request.Builder().url(downloadUrl);
        Map $this$forEach$iv = this.headers.getHeaders();
        for (Map.Entry element$iv : $this$forEach$iv.entrySet()) {
            String key = element$iv.getKey();
            String value = element$iv.getValue();
            requestBuilder.addHeader(key, value);
        }
        return this.httpClient.newCall(requestBuilder.build()).execute();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void validateResponse(Response response) {
        if (!response.isSuccessful()) {
            throw new DownloadFailedException("Failed to download PDF, HTTP Status: " + response.code(), null, 2, null);
        }
        String contentType = response.header("Content-Type", "");
        String str = contentType;
        if (!(str == null || str.length() == 0) && !StringsKt.contains((CharSequence) contentType, (CharSequence) "application/pdf", true)) {
            throw new InvalidPdfException("Invalid content type received: " + contentType + ". Expected a PDF file.");
        }
    }
}
