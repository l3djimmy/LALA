package com.rajat.pdfviewer.util;

import android.graphics.Bitmap;
import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CacheManager.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"}, d2 = {"<anonymous>", "Lkotlin/Result;", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$2", f = "CacheManager.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheManager$writeBitmapToCache$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Result<? extends Boolean>>, Object> {
    final /* synthetic */ Bitmap $bitmap;
    final /* synthetic */ int $pageNo;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ CacheManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheManager$writeBitmapToCache$2(CacheManager cacheManager, int i, Bitmap bitmap, Continuation<? super CacheManager$writeBitmapToCache$2> continuation) {
        super(2, continuation);
        this.this$0 = cacheManager;
        this.$pageNo = i;
        this.$bitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        CacheManager$writeBitmapToCache$2 cacheManager$writeBitmapToCache$2 = new CacheManager$writeBitmapToCache$2(this.this$0, this.$pageNo, this.$bitmap, continuation);
        cacheManager$writeBitmapToCache$2.L$0 = obj;
        return cacheManager$writeBitmapToCache$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(CoroutineScope coroutineScope, Continuation<? super Result<? extends Boolean>> continuation) {
        return invoke2(coroutineScope, (Continuation<? super Result<Boolean>>) continuation);
    }

    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public final Object invoke2(CoroutineScope coroutineScope, Continuation<? super Result<Boolean>> continuation) {
        return ((CacheManager$writeBitmapToCache$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object m7341constructorimpl;
        File file;
        File file2;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                CoroutineScope coroutineScope = (CoroutineScope) this.L$0;
                CacheManager cacheManager = this.this$0;
                int i = this.$pageNo;
                Bitmap bitmap = this.$bitmap;
                try {
                    Result.Companion companion = Result.Companion;
                    file = cacheManager.cacheDir;
                    file.mkdirs();
                    file2 = cacheManager.cacheDir;
                    File savePath = new File(file2, FileUtils.cachedFileNameWithFormat$default(FileUtils.INSTANCE, Boxing.boxInt(i), null, 2, null));
                    File parentFile = savePath.getParentFile();
                    if (parentFile != null) {
                        Boxing.boxBoolean(parentFile.mkdirs());
                    }
                    FileOutputStream fileOutputStream = new FileOutputStream(savePath);
                    FileOutputStream fos = fileOutputStream;
                    boolean compress = bitmap.compress(Bitmap.CompressFormat.PNG, 100, fos);
                    CloseableKt.closeFinally(fileOutputStream, null);
                    m7341constructorimpl = Result.m7341constructorimpl(Boxing.boxBoolean(compress));
                } catch (Throwable th) {
                    Result.Companion companion2 = Result.Companion;
                    m7341constructorimpl = Result.m7341constructorimpl(ResultKt.createFailure(th));
                }
                int i2 = this.$pageNo;
                Throwable it = Result.m7344exceptionOrNullimpl(m7341constructorimpl);
                if (it != null) {
                    Log.e("CacheManager", "Error writing bitmap to cache (Page " + i2 + ')', it);
                }
                return Result.m7340boximpl(m7341constructorimpl);
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
