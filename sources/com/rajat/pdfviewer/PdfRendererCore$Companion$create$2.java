package com.rajat.pdfviewer;

import android.content.Context;
import android.graphics.pdf.PdfRenderer;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.rajat.pdfviewer.util.CacheManager;
import com.rajat.pdfviewer.util.CacheStrategy;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "Lcom/rajat/pdfviewer/PdfRendererCore;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$Companion$create$2", f = "PdfRendererCore.kt", i = {0, 0}, l = {53}, m = "invokeSuspend", n = {"$this$withContext", "pdfRenderer"}, s = {"L$0", "L$1"})
/* loaded from: classes12.dex */
public final class PdfRendererCore$Companion$create$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super PdfRendererCore>, Object> {
    final /* synthetic */ String $cacheIdentifier;
    final /* synthetic */ CacheStrategy $cacheStrategy;
    final /* synthetic */ Context $context;
    final /* synthetic */ ParcelFileDescriptor $fileDescriptor;
    private /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$Companion$create$2(ParcelFileDescriptor parcelFileDescriptor, Context context, String str, CacheStrategy cacheStrategy, Continuation<? super PdfRendererCore$Companion$create$2> continuation) {
        super(2, continuation);
        this.$fileDescriptor = parcelFileDescriptor;
        this.$context = context;
        this.$cacheIdentifier = str;
        this.$cacheStrategy = cacheStrategy;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        PdfRendererCore$Companion$create$2 pdfRendererCore$Companion$create$2 = new PdfRendererCore$Companion$create$2(this.$fileDescriptor, this.$context, this.$cacheIdentifier, this.$cacheStrategy, continuation);
        pdfRendererCore$Companion$create$2.L$0 = obj;
        return pdfRendererCore$Companion$create$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super PdfRendererCore> continuation) {
        return ((PdfRendererCore$Companion$create$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object m7341constructorimpl;
        PdfRenderer pdfRenderer;
        CacheManager manager;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        try {
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    CoroutineScope $this$withContext = (CoroutineScope) this.L$0;
                    pdfRenderer = new PdfRenderer(this.$fileDescriptor);
                    manager = new CacheManager(this.$context, this.$cacheIdentifier, this.$cacheStrategy);
                    this.L$0 = $this$withContext;
                    this.L$1 = pdfRenderer;
                    this.L$2 = manager;
                    this.label = 1;
                    if (manager.initialize(this) != coroutine_suspended) {
                        break;
                    } else {
                        return coroutine_suspended;
                    }
                case 1:
                    manager = (CacheManager) this.L$2;
                    pdfRenderer = (PdfRenderer) this.L$1;
                    CoroutineScope coroutineScope = (CoroutineScope) this.L$0;
                    ResultKt.throwOnFailure($result);
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            PdfRendererCore core = new PdfRendererCore(this.$fileDescriptor, manager, pdfRenderer, null);
            core.preloadPageDimensions();
            return core;
        } catch (Exception e) {
            try {
                Result.Companion companion = Result.Companion;
                pdfRenderer.close();
                m7341constructorimpl = Result.m7341constructorimpl(Unit.INSTANCE);
            } catch (Throwable th) {
                Result.Companion companion2 = Result.Companion;
                m7341constructorimpl = Result.m7341constructorimpl(ResultKt.createFailure(th));
            }
            Throwable it = Result.m7344exceptionOrNullimpl(m7341constructorimpl);
            if (it != null) {
                Log.e("PdfRendererCore", "Error closing PdfRenderer during cleanup: " + it.getMessage(), it);
            }
            throw e;
        }
    }
}
