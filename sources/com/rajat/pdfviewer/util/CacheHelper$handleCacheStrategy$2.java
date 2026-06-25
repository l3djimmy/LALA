package com.rajat.pdfviewer.util;

import java.io.File;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CacheHelper.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheHelper$handleCacheStrategy$2", f = "CacheHelper.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheHelper$handleCacheStrategy$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ File $cacheDir;
    final /* synthetic */ CacheStrategy $cacheStrategy;
    final /* synthetic */ int $maxCachedPdfs;
    final /* synthetic */ String $origin;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheHelper$handleCacheStrategy$2(CacheStrategy cacheStrategy, int i, String str, File file, Continuation<? super CacheHelper$handleCacheStrategy$2> continuation) {
        super(2, continuation);
        this.$cacheStrategy = cacheStrategy;
        this.$maxCachedPdfs = i;
        this.$origin = str;
        this.$cacheDir = file;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CacheHelper$handleCacheStrategy$2(this.$cacheStrategy, this.$maxCachedPdfs, this.$origin, this.$cacheDir, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((CacheHelper$handleCacheStrategy$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                CachePolicy cachePolicy = CachePolicy.Companion.from(this.$cacheStrategy, this.$maxCachedPdfs);
                CacheHelper.INSTANCE.logDebug('[' + this.$origin + "] Cache Strategy: " + this.$cacheStrategy + " | Directory: " + this.$cacheDir);
                CacheHelper.INSTANCE.applyDocumentRetention$pdfViewer_release(this.$origin, this.$cacheDir, cachePolicy);
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
