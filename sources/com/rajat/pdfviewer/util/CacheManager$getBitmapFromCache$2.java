package com.rajat.pdfviewer.util;

import android.graphics.Bitmap;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CacheManager.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "Landroid/graphics/Bitmap;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheManager$getBitmapFromCache$2", f = "CacheManager.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheManager$getBitmapFromCache$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Bitmap>, Object> {
    final /* synthetic */ int $pageNo;
    int label;
    final /* synthetic */ CacheManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheManager$getBitmapFromCache$2(CacheManager cacheManager, int i, Continuation<? super CacheManager$getBitmapFromCache$2> continuation) {
        super(2, continuation);
        this.this$0 = cacheManager;
        this.$pageNo = i;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CacheManager$getBitmapFromCache$2(this.this$0, this.$pageNo, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Bitmap> continuation) {
        return ((CacheManager$getBitmapFromCache$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0043, code lost:
        r0 = r6.this$0.decodeBitmapFromDiskCache(r6.$pageNo);
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r7) {
        /*
            r6 = this;
            kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r0 = r6.label
            switch(r0) {
                case 0: goto L10;
                default: goto L8;
            }
        L8:
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r7.<init>(r0)
            throw r7
        L10:
            kotlin.ResultKt.throwOnFailure(r7)
            com.rajat.pdfviewer.util.CacheManager r0 = r6.this$0
            com.rajat.pdfviewer.util.CachePolicy r0 = com.rajat.pdfviewer.util.CacheManager.access$getCachePolicy$p(r0)
            boolean r0 = r0.getUseMemoryBitmapCache()
            if (r0 == 0) goto L35
            com.rajat.pdfviewer.util.CacheManager r0 = r6.this$0
            android.util.LruCache r0 = com.rajat.pdfviewer.util.CacheManager.access$getMemoryCache$p(r0)
            int r1 = r6.$pageNo
            java.lang.Integer r1 = kotlin.coroutines.jvm.internal.Boxing.boxInt(r1)
            java.lang.Object r0 = r0.get(r1)
            android.graphics.Bitmap r0 = (android.graphics.Bitmap) r0
            if (r0 == 0) goto L35
            r1 = 0
            return r0
        L35:
            com.rajat.pdfviewer.util.CacheManager r0 = r6.this$0
            com.rajat.pdfviewer.util.CachePolicy r0 = com.rajat.pdfviewer.util.CacheManager.access$getCachePolicy$p(r0)
            boolean r0 = r0.getUseDiskBitmapCache()
            r1 = 0
            if (r0 != 0) goto L43
            return r1
        L43:
            com.rajat.pdfviewer.util.CacheManager r0 = r6.this$0
            int r2 = r6.$pageNo
            android.graphics.Bitmap r0 = com.rajat.pdfviewer.util.CacheManager.access$decodeBitmapFromDiskCache(r0, r2)
            if (r0 == 0) goto L6a
            com.rajat.pdfviewer.util.CacheManager r1 = r6.this$0
            int r2 = r6.$pageNo
            r3 = r0
            r4 = 0
            com.rajat.pdfviewer.util.CachePolicy r5 = com.rajat.pdfviewer.util.CacheManager.access$getCachePolicy$p(r1)
            boolean r5 = r5.getUseMemoryBitmapCache()
            if (r5 == 0) goto L68
            android.util.LruCache r1 = com.rajat.pdfviewer.util.CacheManager.access$getMemoryCache$p(r1)
            java.lang.Integer r2 = kotlin.coroutines.jvm.internal.Boxing.boxInt(r2)
            r1.put(r2, r3)
        L68:
            r1 = r0
        L6a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.util.CacheManager$getBitmapFromCache$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
