package com.rajat.pdfviewer.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.LruCache;
import java.io.File;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.Dispatchers;
import okhttp3.internal.ws.RealWebSocket;
/* compiled from: CacheManager.kt */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0007\u0018\u0000 $2\u00020\u0001:\u0001$B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u000e\u0010\u0012\u001a\u00020\u0013H\u0086@¢\u0006\u0002\u0010\u0014J\u0014\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000f0\rH\u0002J\b\u0010\u0016\u001a\u00020\u0013H\u0002J\u0018\u0010\u0017\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0018\u001a\u00020\u000eH\u0086@¢\u0006\u0002\u0010\u0019J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0018\u001a\u00020\u000eH\u0002J\u001e\u0010\u001b\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u000fH\u0086@¢\u0006\u0002\u0010\u001dJ&\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020 0\u001f2\u0006\u0010\u0018\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u000fH\u0082@¢\u0006\u0004\b!\u0010\u001dJ\u0016\u0010\"\u001a\u00020 2\u0006\u0010\u0018\u001a\u00020\u000eH\u0086@¢\u0006\u0002\u0010\u0019J\u0006\u0010#\u001a\u00020 R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000f0\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006%"}, d2 = {"Lcom/rajat/pdfviewer/util/CacheManager;", "", "context", "Landroid/content/Context;", "currentOpenedFileName", "", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "<init>", "(Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;)V", "cachePolicy", "Lcom/rajat/pdfviewer/util/CachePolicy;", "memoryCache", "Landroid/util/LruCache;", "", "Landroid/graphics/Bitmap;", "cacheDir", "Ljava/io/File;", "initialize", "", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "createMemoryCache", "purgeDiskBitmapFiles", "getBitmapFromCache", "pageNo", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "decodeBitmapFromDiskCache", "addBitmapToCache", "bitmap", "(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "writeBitmapToCache", "Lkotlin/Result;", "", "writeBitmapToCache-0E7RQCE", "pageExistsInCache", "shouldPrefetch", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class CacheManager {
    public static final String CACHE_PATH = "___pdf___cache___";
    private File cacheDir;
    private final CachePolicy cachePolicy;
    private final CacheStrategy cacheStrategy;
    private final Context context;
    private final String currentOpenedFileName;
    private final LruCache<Integer, Bitmap> memoryCache;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public CacheManager(Context context, String currentOpenedFileName, CacheStrategy cacheStrategy) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(currentOpenedFileName, "currentOpenedFileName");
        Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
        this.context = context;
        this.currentOpenedFileName = currentOpenedFileName;
        this.cacheStrategy = cacheStrategy;
        this.cachePolicy = CachePolicy.Companion.from(this.cacheStrategy, 5);
        this.memoryCache = createMemoryCache();
        this.cacheDir = new File(this.context.getCacheDir(), "___pdf___cache___/" + this.currentOpenedFileName);
    }

    public /* synthetic */ CacheManager(Context context, String str, CacheStrategy cacheStrategy, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, str, (i & 4) != 0 ? CacheStrategy.MAXIMIZE_PERFORMANCE : cacheStrategy);
    }

    public final Object initialize(Continuation<? super Unit> continuation) {
        Object withContext = BuildersKt.withContext(Dispatchers.getIO(), new CacheManager$initialize$2(this, null), continuation);
        return withContext == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? withContext : Unit.INSTANCE;
    }

    private final LruCache<Integer, Bitmap> createMemoryCache() {
        int maxMemory = (int) (Runtime.getRuntime().maxMemory() / RealWebSocket.DEFAULT_MINIMUM_DEFLATE_SIZE);
        final int cacheSize = maxMemory / 6;
        return new LruCache<Integer, Bitmap>(cacheSize) { // from class: com.rajat.pdfviewer.util.CacheManager$createMemoryCache$1
            @Override // android.util.LruCache
            public /* bridge */ /* synthetic */ int sizeOf(Integer num, Bitmap bitmap) {
                return sizeOf(num.intValue(), bitmap);
            }

            protected int sizeOf(int key, Bitmap value) {
                Intrinsics.checkNotNullParameter(value, "value");
                return value.getByteCount() / 1024;
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void purgeDiskBitmapFiles() {
        if (this.cacheDir.exists()) {
            Sequence $this$forEach$iv = SequencesKt.filter(FilesKt.walkTopDown(this.cacheDir), new Function1() { // from class: com.rajat.pdfviewer.util.CacheManager$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return Boolean.valueOf(CacheManager.purgeDiskBitmapFiles$lambda$0((File) obj));
                }
            });
            for (Object element$iv : $this$forEach$iv) {
                File file = (File) element$iv;
                file.delete();
            }
            if (this.cacheDir.exists()) {
                File[] listFiles = this.cacheDir.listFiles();
                boolean z = true;
                if (listFiles != null) {
                    if (!(listFiles.length == 0)) {
                        z = false;
                    }
                }
                if (z) {
                    FilesKt.deleteRecursively(this.cacheDir);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final boolean purgeDiskBitmapFiles$lambda$0(File it) {
        Intrinsics.checkNotNullParameter(it, "it");
        return it.isFile() && StringsKt.equals(FilesKt.getExtension(it), "jpg", true);
    }

    public final Object getBitmapFromCache(int pageNo, Continuation<? super Bitmap> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new CacheManager$getBitmapFromCache$2(this, pageNo, null), continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Bitmap decodeBitmapFromDiskCache(int pageNo) {
        File file = new File(this.cacheDir, FileUtils.cachedFileNameWithFormat$default(FileUtils.INSTANCE, Integer.valueOf(pageNo), null, 2, null));
        if (file.exists()) {
            return BitmapFactory.decodeFile(file.getAbsolutePath());
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0036  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object addBitmapToCache(int r7, android.graphics.Bitmap r8, kotlin.coroutines.Continuation<? super kotlin.Unit> r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof com.rajat.pdfviewer.util.CacheManager$addBitmapToCache$1
            if (r0 == 0) goto L14
            r0 = r9
            com.rajat.pdfviewer.util.CacheManager$addBitmapToCache$1 r0 = (com.rajat.pdfviewer.util.CacheManager$addBitmapToCache$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            com.rajat.pdfviewer.util.CacheManager$addBitmapToCache$1 r0 = new com.rajat.pdfviewer.util.CacheManager$addBitmapToCache$1
            r0.<init>(r6, r9)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L36;
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
            kotlin.Result r7 = (kotlin.Result) r7
            r7.m7350unboximpl()
            goto L5d
        L36:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r6
            com.rajat.pdfviewer.util.CachePolicy r4 = r3.cachePolicy
            boolean r4 = r4.getUseMemoryBitmapCache()
            if (r4 == 0) goto L4b
            android.util.LruCache<java.lang.Integer, android.graphics.Bitmap> r4 = r3.memoryCache
            java.lang.Integer r5 = kotlin.coroutines.jvm.internal.Boxing.boxInt(r7)
            r4.put(r5, r8)
        L4b:
            com.rajat.pdfviewer.util.CachePolicy r4 = r3.cachePolicy
            boolean r4 = r4.getUseDiskBitmapCache()
            if (r4 == 0) goto L60
            r4 = 1
            r0.label = r4
            java.lang.Object r7 = r3.m7336writeBitmapToCache0E7RQCE(r7, r8, r0)
            if (r7 != r2) goto L5d
            return r2
        L5d:
            kotlin.Unit r7 = kotlin.Unit.INSTANCE
            return r7
        L60:
            kotlin.Unit r7 = kotlin.Unit.INSTANCE
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.util.CacheManager.addBitmapToCache(int, android.graphics.Bitmap, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0031  */
    /* renamed from: writeBitmapToCache-0E7RQCE  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m7336writeBitmapToCache0E7RQCE(int r8, android.graphics.Bitmap r9, kotlin.coroutines.Continuation<? super kotlin.Result<java.lang.Boolean>> r10) {
        /*
            r7 = this;
            boolean r0 = r10 instanceof com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$1
            if (r0 == 0) goto L14
            r0 = r10
            com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$1 r0 = (com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$1 r0 = new com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$1
            r0.<init>(r7, r10)
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
            java.lang.IllegalStateException r8 = new java.lang.IllegalStateException
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            r8.<init>(r9)
            throw r8
        L2c:
            kotlin.ResultKt.throwOnFailure(r1)
            r8 = r1
            goto L4d
        L31:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r7
            kotlinx.coroutines.CoroutineDispatcher r4 = kotlinx.coroutines.Dispatchers.getIO()
            kotlin.coroutines.CoroutineContext r4 = (kotlin.coroutines.CoroutineContext) r4
            com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$2 r5 = new com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$2
            r6 = 0
            r5.<init>(r3, r8, r9, r6)
            kotlin.jvm.functions.Function2 r5 = (kotlin.jvm.functions.Function2) r5
            r6 = 1
            r0.label = r6
            java.lang.Object r8 = kotlinx.coroutines.BuildersKt.withContext(r4, r5, r0)
            if (r8 != r2) goto L4d
            return r2
        L4d:
            kotlin.Result r8 = (kotlin.Result) r8
            java.lang.Object r8 = r8.m7350unboximpl()
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.util.CacheManager.m7336writeBitmapToCache0E7RQCE(int, android.graphics.Bitmap, kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final Object pageExistsInCache(int pageNo, Continuation<? super Boolean> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new CacheManager$pageExistsInCache$2(this, pageNo, null), continuation);
    }

    public final boolean shouldPrefetch() {
        return this.cachePolicy.getEnablePrefetch();
    }

    /* compiled from: CacheManager.kt */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/rajat/pdfviewer/util/CacheManager$Companion;", "", "<init>", "()V", "CACHE_PATH", "", "clearCacheDir", "", "context", "Landroid/content/Context;", "(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final Object clearCacheDir(Context context, Continuation<? super Unit> continuation) {
            Object withContext = BuildersKt.withContext(Dispatchers.getIO(), new CacheManager$Companion$clearCacheDir$2(context, null), continuation);
            return withContext == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? withContext : Unit.INSTANCE;
        }
    }
}
