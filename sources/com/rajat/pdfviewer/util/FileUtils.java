package com.rajat.pdfviewer.util;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.util.Log;
import androidx.autofill.HintConstants;
import com.google.android.gms.common.internal.ImagesContract;
import com.itextpdf.kernel.xmp.PdfConst;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.Dispatchers;
/* compiled from: FileUtils.kt */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0005H\u0086@¢\u0006\u0002\u0010\u000bJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0007J\u001e\u0010\u0011\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0013H\u0086@¢\u0006\u0002\u0010\u0014J\u001e\u0010\u0015\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0005H\u0086@¢\u0006\u0002\u0010\u0019J\u000e\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00020\u0005J\u001e\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u0005J\u001a\u0010\u001f\u001a\u00020\r2\u0006\u0010\b\u001a\u00020\t2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0005J2\u0010!\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020\u00072\u0006\u0010#\u001a\u00020$2\u0012\u0010%\u001a\u000e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020\r0&J\u0018\u0010'\u001a\u00020(2\b\u0010\"\u001a\u0004\u0018\u00010\u0007H\u0086@¢\u0006\u0002\u0010)J\u0018\u0010*\u001a\u00020\u00052\u0006\u0010+\u001a\u00020\u00012\b\b\u0002\u0010,\u001a\u00020\u0005R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Lcom/rajat/pdfviewer/util/FileUtils;", "", "<init>", "()V", "TAG", "", "fileFromAsset", "Ljava/io/File;", "context", "Landroid/content/Context;", "assetName", "(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "copy", "", "inputStream", "Ljava/io/InputStream;", "output", "uriToFile", "uri", "Landroid/net/Uri;", "(Landroid/content/Context;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "createPdfDocumentUri", "contentResolver", "Landroid/content/ContentResolver;", "fileName", "(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getCachedFileName", ImagesContract.URL, "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "sessionToken", "clearPdfCache", "exceptFileName", "writeFile", "file", "totalLength", "", "onProgress", "Lkotlin/Function1;", "isValidPdf", "", "(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cachedFileNameWithFormat", HintConstants.AUTOFILL_HINT_NAME, PdfConst.Format, "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class FileUtils {
    public static final int $stable = 0;
    public static final FileUtils INSTANCE = new FileUtils();
    private static final String TAG = "PdfValidator";

    private FileUtils() {
    }

    public final Object fileFromAsset(Context context, String assetName, Continuation<? super File> continuation) throws IOException {
        return BuildersKt.withContext(Dispatchers.getIO(), new FileUtils$fileFromAsset$2(context, assetName, null), continuation);
    }

    public final void copy(InputStream inputStream, File output) throws IOException {
        Intrinsics.checkNotNullParameter(inputStream, "inputStream");
        Intrinsics.checkNotNullParameter(output, "output");
        InputStream inputStream2 = inputStream;
        try {
            InputStream input = inputStream2;
            FileOutputStream fileOutputStream = new FileOutputStream(output);
            FileOutputStream outputStream = fileOutputStream;
            byte[] buffer = new byte[1024];
            while (true) {
                int it = input.read(buffer);
                if (it == -1) {
                    Unit unit = Unit.INSTANCE;
                    CloseableKt.closeFinally(fileOutputStream, null);
                    Unit unit2 = Unit.INSTANCE;
                    CloseableKt.closeFinally(inputStream2, null);
                    return;
                }
                outputStream.write(buffer, 0, it);
            }
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object uriToFile(android.content.Context r7, android.net.Uri r8, kotlin.coroutines.Continuation<? super java.io.File> r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof com.rajat.pdfviewer.util.FileUtils$uriToFile$1
            if (r0 == 0) goto L14
            r0 = r9
            com.rajat.pdfviewer.util.FileUtils$uriToFile$1 r0 = (com.rajat.pdfviewer.util.FileUtils$uriToFile$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            com.rajat.pdfviewer.util.FileUtils$uriToFile$1 r0 = new com.rajat.pdfviewer.util.FileUtils$uriToFile$1
            r0.<init>(r6, r9)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L31;
                case 1: goto L2c;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            r7.<init>(r8)
            throw r7
        L2c:
            kotlin.ResultKt.throwOnFailure(r1)
            r7 = r1
            goto L4c
        L31:
            kotlin.ResultKt.throwOnFailure(r1)
            kotlinx.coroutines.CoroutineDispatcher r3 = kotlinx.coroutines.Dispatchers.getIO()
            kotlin.coroutines.CoroutineContext r3 = (kotlin.coroutines.CoroutineContext) r3
            com.rajat.pdfviewer.util.FileUtils$uriToFile$2 r4 = new com.rajat.pdfviewer.util.FileUtils$uriToFile$2
            r5 = 0
            r4.<init>(r7, r8, r5)
            kotlin.jvm.functions.Function2 r4 = (kotlin.jvm.functions.Function2) r4
            r5 = 1
            r0.label = r5
            java.lang.Object r7 = kotlinx.coroutines.BuildersKt.withContext(r3, r4, r0)
            if (r7 != r2) goto L4c
            return r2
        L4c:
            java.lang.String r8 = "withContext(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r7, r8)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.util.FileUtils.uriToFile(android.content.Context, android.net.Uri, kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final Object createPdfDocumentUri(ContentResolver contentResolver, String fileName, Continuation<? super Uri> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new FileUtils$createPdfDocumentUri$2(contentResolver, fileName, null), continuation);
    }

    public final String getCachedFileName(String url) {
        Intrinsics.checkNotNullParameter(url, "url");
        return CacheHelper.INSTANCE.getRemoteDocumentCacheKey(url);
    }

    public final String getCachedFileName(String url, CacheStrategy cacheStrategy, String sessionToken) {
        Intrinsics.checkNotNullParameter(url, "url");
        Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
        Intrinsics.checkNotNullParameter(sessionToken, "sessionToken");
        return CacheHelper.INSTANCE.getRemoteDocumentCacheKey(url, cacheStrategy, sessionToken);
    }

    public static /* synthetic */ void clearPdfCache$default(FileUtils fileUtils, Context context, String str, int i, Object obj) {
        if ((i & 2) != 0) {
            str = null;
        }
        fileUtils.clearPdfCache(context, str);
    }

    public final void clearPdfCache(Context context, final String exceptFileName) {
        Intrinsics.checkNotNullParameter(context, "context");
        File cacheDir = context.getCacheDir();
        File[] listFiles = cacheDir.listFiles(new FilenameFilter() { // from class: com.rajat.pdfviewer.util.FileUtils$$ExternalSyntheticLambda0
            @Override // java.io.FilenameFilter
            public final boolean accept(File file, String str) {
                return FileUtils.clearPdfCache$lambda$3(exceptFileName, file, str);
            }
        });
        if (listFiles == null) {
            return;
        }
        for (File file : listFiles) {
            file.delete();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final boolean clearPdfCache$lambda$3(String $exceptFileName, File file, String name) {
        Intrinsics.checkNotNull(name);
        return StringsKt.endsWith$default(name, ".pdf", false, 2, (Object) null) && !Intrinsics.areEqual(name, $exceptFileName);
    }

    public final void writeFile(InputStream inputStream, File file, long totalLength, Function1<? super Long, Unit> onProgress) {
        FileOutputStream outputStream;
        byte[] data;
        long totalBytesRead;
        Intrinsics.checkNotNullParameter(inputStream, "inputStream");
        Intrinsics.checkNotNullParameter(file, "file");
        Intrinsics.checkNotNullParameter(onProgress, "onProgress");
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try {
            outputStream = fileOutputStream;
            data = new byte[8192];
            totalBytesRead = 0;
        } finally {
        }
        while (true) {
            int bytesRead = inputStream.read(data);
            if (bytesRead != -1) {
                outputStream.write(data, 0, bytesRead);
                totalBytesRead += bytesRead;
                try {
                    onProgress.invoke(Long.valueOf(totalBytesRead));
                } catch (Exception e) {
                    Log.w(TAG, "Progress callback failed: " + e.getMessage(), e);
                }
            } else {
                outputStream.flush();
                Unit unit = Unit.INSTANCE;
                CloseableKt.closeFinally(fileOutputStream, null);
                return;
            }
        }
    }

    public final Object isValidPdf(File file, Continuation<? super Boolean> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new FileUtils$isValidPdf$2(file, null), continuation);
    }

    public static /* synthetic */ String cachedFileNameWithFormat$default(FileUtils fileUtils, Object obj, String str, int i, Object obj2) {
        if ((i & 2) != 0) {
            str = ".jpg";
        }
        return fileUtils.cachedFileNameWithFormat(obj, str);
    }

    public final String cachedFileNameWithFormat(Object name, String format) {
        Intrinsics.checkNotNullParameter(name, "name");
        Intrinsics.checkNotNullParameter(format, "format");
        return name + format;
    }
}
