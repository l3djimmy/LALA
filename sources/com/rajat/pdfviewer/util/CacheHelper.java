package com.rajat.pdfviewer.util;

import android.util.Log;
import com.google.android.gms.common.internal.ImagesContract;
import com.itextpdf.kernel.xmp.PdfConst;
import com.rajat.pdfviewer.util.CachePolicy;
import java.io.File;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.comparisons.ComparisonsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.Dispatchers;
/* compiled from: CacheHelper.kt */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000f\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J.\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH\u0086@¢\u0006\u0002\u0010\u000eJ%\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u0011H\u0000¢\u0006\u0002\b\u0012J\u0015\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\tH\u0000¢\u0006\u0002\b\u0015J\u0010\u0010\u0016\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\tH\u0002J\u0010\u0010\u0017\u001a\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J\u000e\u0010\u0019\u001a\u00020\u00072\u0006\u0010\u001a\u001a\u00020\u0007J\u000e\u0010\u001b\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u0007J \u0010\u001b\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\u001d\u001a\u00020\u0007J\u0010\u0010\u001e\u001a\u00020\u00072\u0006\u0010\u001f\u001a\u00020\u0007H\u0002¨\u0006 "}, d2 = {"Lcom/rajat/pdfviewer/util/CacheHelper;", "", "<init>", "()V", "handleCacheStrategy", "", "origin", "", "cacheDir", "Ljava/io/File;", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "maxCachedPdfs", "", "(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "applyDocumentRetention", "cachePolicy", "Lcom/rajat/pdfviewer/util/CachePolicy;", "applyDocumentRetention$pdfViewer_release", "cleanupTransientDocument", "file", "cleanupTransientDocument$pdfViewer_release", "updateCacheAccessTime", "logDebug", "message", "getCacheKey", PdfConst.Source, "getRemoteDocumentCacheKey", ImagesContract.URL, "sessionToken", "sha256", "input", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class CacheHelper {
    public static final int $stable = 0;
    public static final CacheHelper INSTANCE = new CacheHelper();

    private CacheHelper() {
    }

    public final Object handleCacheStrategy(String origin, File cacheDir, CacheStrategy cacheStrategy, int maxCachedPdfs, Continuation<? super Unit> continuation) {
        Object withContext = BuildersKt.withContext(Dispatchers.getIO(), new CacheHelper$handleCacheStrategy$2(cacheStrategy, maxCachedPdfs, origin, cacheDir, null), continuation);
        return withContext == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? withContext : Unit.INSTANCE;
    }

    public final void applyDocumentRetention$pdfViewer_release(String origin, File cacheDir, CachePolicy cachePolicy) {
        File[] listFiles;
        Intrinsics.checkNotNullParameter(origin, "origin");
        Intrinsics.checkNotNullParameter(cacheDir, "cacheDir");
        Intrinsics.checkNotNullParameter(cachePolicy, "cachePolicy");
        if (cachePolicy.getMaxRetainedDocuments() <= 0) {
            return;
        }
        cacheDir.mkdirs();
        updateCacheAccessTime(cacheDir);
        File cacheRoot = cacheDir.getParentFile();
        if (cacheRoot == null || (listFiles = cacheRoot.listFiles()) == null) {
            return;
        }
        Collection destination$iv$iv = new ArrayList();
        for (File file : listFiles) {
            if (file.isDirectory()) {
                destination$iv$iv.add(file);
            }
        }
        List cachedFolders = (List) destination$iv$iv;
        int overflowCount = cachedFolders.size() - cachePolicy.getMaxRetainedDocuments();
        if (overflowCount <= 0) {
            return;
        }
        List $this$filter$iv = cachedFolders;
        Collection destination$iv$iv2 = new ArrayList();
        for (Object element$iv$iv : $this$filter$iv) {
            File it = (File) element$iv$iv;
            if (!Intrinsics.areEqual(it.getName(), cacheDir.getName())) {
                destination$iv$iv2.add(element$iv$iv);
            }
        }
        Iterable $this$sortedBy$iv = (List) destination$iv$iv2;
        Iterable $this$forEach$iv = CollectionsKt.take(CollectionsKt.sortedWith($this$sortedBy$iv, new Comparator() { // from class: com.rajat.pdfviewer.util.CacheHelper$applyDocumentRetention$$inlined$sortedBy$1
            @Override // java.util.Comparator
            public final int compare(T t, T t2) {
                File it2 = (File) t;
                File it3 = (File) t2;
                return ComparisonsKt.compareValues(Long.valueOf(it2.lastModified()), Long.valueOf(it3.lastModified()));
            }
        }), overflowCount);
        for (Object element$iv : $this$forEach$iv) {
            File file2 = (File) element$iv;
            INSTANCE.logDebug('[' + origin + "] Evicting cached folder: " + file2.getAbsolutePath());
            Intrinsics.checkNotNull(file2);
            FilesKt.deleteRecursively(file2);
        }
    }

    public final void cleanupTransientDocument$pdfViewer_release(File file) {
        Intrinsics.checkNotNullParameter(file, "file");
        try {
            Result.Companion companion = Result.Companion;
            CacheHelper cacheHelper = this;
            if (file.exists()) {
                file.delete();
            }
            File parent = file.getParentFile();
            if (parent == null) {
                return;
            }
            if (parent.exists()) {
                File[] listFiles = parent.listFiles();
                boolean z = true;
                if (listFiles != null) {
                    if (!(listFiles.length == 0)) {
                        z = false;
                    }
                }
                if (z) {
                    FilesKt.deleteRecursively(parent);
                }
            }
            Result.m7341constructorimpl(Unit.INSTANCE);
        } catch (Throwable th) {
            Result.Companion companion2 = Result.Companion;
            Result.m7341constructorimpl(ResultKt.createFailure(th));
        }
    }

    private final void updateCacheAccessTime(File cacheDir) {
        cacheDir.setLastModified(System.currentTimeMillis());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void logDebug(String message) {
        try {
            Result.Companion companion = Result.Companion;
            CacheHelper cacheHelper = this;
            Result.m7341constructorimpl(Integer.valueOf(Log.d("CacheHelper", message)));
        } catch (Throwable th) {
            Result.Companion companion2 = Result.Companion;
            Result.m7341constructorimpl(ResultKt.createFailure(th));
        }
    }

    public final String getCacheKey(String source) {
        Intrinsics.checkNotNullParameter(source, "source");
        String prefix = StringsKt.startsWith$default(source, "http", false, 2, (Object) null) ? "url_" : "file_";
        String hash = sha256(source);
        return prefix + hash;
    }

    public final String getRemoteDocumentCacheKey(String url) {
        Intrinsics.checkNotNullParameter(url, "url");
        return getCacheKey(url) + ".pdf";
    }

    public static /* synthetic */ String getRemoteDocumentCacheKey$default(CacheHelper cacheHelper, String str, CacheStrategy cacheStrategy, String str2, int i, Object obj) {
        if ((i & 4) != 0) {
            str2 = UUID.randomUUID().toString();
        }
        return cacheHelper.getRemoteDocumentCacheKey(str, cacheStrategy, str2);
    }

    public final String getRemoteDocumentCacheKey(String url, CacheStrategy cacheStrategy, String sessionToken) {
        Intrinsics.checkNotNullParameter(url, "url");
        Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
        Intrinsics.checkNotNullParameter(sessionToken, "sessionToken");
        CachePolicy cachePolicy = CachePolicy.Companion.from$default(CachePolicy.Companion, cacheStrategy, 0, 2, null);
        if (cachePolicy.getPersistRemoteFile()) {
            return getRemoteDocumentCacheKey(url);
        }
        return "session_" + sha256(url + '#' + sessionToken) + ".pdf";
    }

    private final String sha256(String input) {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        byte[] bytes = input.getBytes(Charsets.UTF_8);
        Intrinsics.checkNotNullExpressionValue(bytes, "getBytes(...)");
        byte[] bytes2 = messageDigest.digest(bytes);
        Intrinsics.checkNotNull(bytes2);
        return ArraysKt.joinToString$default(bytes2, (CharSequence) "", (CharSequence) null, (CharSequence) null, 0, (CharSequence) null, new Function1() { // from class: com.rajat.pdfviewer.util.CacheHelper$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return CacheHelper.sha256$lambda$6(((Byte) obj).byteValue());
            }
        }, 30, (Object) null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final CharSequence sha256$lambda$6(byte it) {
        String format = String.format("%02x", Arrays.copyOf(new Object[]{Byte.valueOf(it)}, 1));
        Intrinsics.checkNotNullExpressionValue(format, "format(...)");
        return format;
    }
}
