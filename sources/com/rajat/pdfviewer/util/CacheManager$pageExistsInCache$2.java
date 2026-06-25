package com.rajat.pdfviewer.util;

import android.util.LruCache;
import java.io.File;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CacheManager.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheManager$pageExistsInCache$2", f = "CacheManager.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheManager$pageExistsInCache$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Boolean>, Object> {
    final /* synthetic */ int $pageNo;
    int label;
    final /* synthetic */ CacheManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheManager$pageExistsInCache$2(CacheManager cacheManager, int i, Continuation<? super CacheManager$pageExistsInCache$2> continuation) {
        super(2, continuation);
        this.this$0 = cacheManager;
        this.$pageNo = i;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CacheManager$pageExistsInCache$2(this.this$0, this.$pageNo, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Boolean> continuation) {
        return ((CacheManager$pageExistsInCache$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CachePolicy cachePolicy;
        CachePolicy cachePolicy2;
        File file;
        LruCache lruCache;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                cachePolicy = this.this$0.cachePolicy;
                if (cachePolicy.getUseMemoryBitmapCache()) {
                    lruCache = this.this$0.memoryCache;
                    if (lruCache.get(Boxing.boxInt(this.$pageNo)) != null) {
                        return Boxing.boxBoolean(true);
                    }
                }
                cachePolicy2 = this.this$0.cachePolicy;
                if (cachePolicy2.getUseDiskBitmapCache()) {
                    file = this.this$0.cacheDir;
                    return Boxing.boxBoolean(new File(file, FileUtils.cachedFileNameWithFormat$default(FileUtils.INSTANCE, Boxing.boxInt(this.$pageNo), null, 2, null)).exists());
                }
                return Boxing.boxBoolean(false);
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
