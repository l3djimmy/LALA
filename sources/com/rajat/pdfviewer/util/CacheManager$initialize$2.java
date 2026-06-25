package com.rajat.pdfviewer.util;

import android.content.Context;
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
/* compiled from: CacheManager.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheManager$initialize$2", f = "CacheManager.kt", i = {}, l = {38}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheManager$initialize$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    int label;
    final /* synthetic */ CacheManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheManager$initialize$2(CacheManager cacheManager, Continuation<? super CacheManager$initialize$2> continuation) {
        super(2, continuation);
        this.this$0 = cacheManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CacheManager$initialize$2(this.this$0, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((CacheManager$initialize$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Context context;
        String str;
        CachePolicy cachePolicy;
        CachePolicy cachePolicy2;
        File file;
        File file2;
        CacheStrategy cacheStrategy;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                CacheManager cacheManager = this.this$0;
                context = this.this$0.context;
                File cacheDir = context.getCacheDir();
                StringBuilder append = new StringBuilder().append("___pdf___cache___/");
                str = this.this$0.currentOpenedFileName;
                cacheManager.cacheDir = new File(cacheDir, append.append(str).toString());
                cachePolicy = this.this$0.cachePolicy;
                if (!cachePolicy.getUseDiskBitmapCache()) {
                    this.this$0.purgeDiskBitmapFiles();
                }
                cachePolicy2 = this.this$0.cachePolicy;
                if (cachePolicy2.getMaxRetainedDocuments() > 0) {
                    file = this.this$0.cacheDir;
                    file.mkdirs();
                    CacheHelper cacheHelper = CacheHelper.INSTANCE;
                    file2 = this.this$0.cacheDir;
                    cacheStrategy = this.this$0.cacheStrategy;
                    this.label = 1;
                    if (cacheHelper.handleCacheStrategy("CacheManager", file2, cacheStrategy, 5, this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                } else {
                    return Unit.INSTANCE;
                }
                break;
            case 1:
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        return Unit.INSTANCE;
    }
}
