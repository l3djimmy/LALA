package com.rajat.pdfviewer;

import android.graphics.pdf.PdfRenderer;
import android.os.ParcelFileDescriptor;
import android.util.Log;
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
import kotlinx.coroutines.sync.Mutex;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$closePdfRender$1", f = "PdfRendererCore.kt", i = {0, 0}, l = {399}, m = "invokeSuspend", n = {"$this$runBlocking", "$this$withLock_u24default$iv"}, s = {"L$0", "L$1"})
/* loaded from: classes12.dex */
public final class PdfRendererCore$closePdfRender$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    private /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$closePdfRender$1(PdfRendererCore pdfRendererCore, Continuation<? super PdfRendererCore$closePdfRender$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        PdfRendererCore$closePdfRender$1 pdfRendererCore$closePdfRender$1 = new PdfRendererCore$closePdfRender$1(this.this$0, continuation);
        pdfRendererCore$closePdfRender$1.L$0 = obj;
        return pdfRendererCore$closePdfRender$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$closePdfRender$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Mutex $this$withLock_u24default$iv;
        PdfRendererCore pdfRendererCore;
        Object owner$iv;
        boolean z;
        PdfRenderer pdfRenderer;
        ParcelFileDescriptor parcelFileDescriptor;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                CoroutineScope $this$runBlocking = (CoroutineScope) this.L$0;
                $this$withLock_u24default$iv = this.this$0.renderLock;
                pdfRendererCore = this.this$0;
                owner$iv = null;
                this.L$0 = $this$runBlocking;
                this.L$1 = $this$withLock_u24default$iv;
                this.L$2 = pdfRendererCore;
                this.label = 1;
                if ($this$withLock_u24default$iv.lock(null, this) != coroutine_suspended) {
                    break;
                } else {
                    return coroutine_suspended;
                }
            case 1:
                pdfRendererCore = (PdfRendererCore) this.L$2;
                owner$iv = null;
                $this$withLock_u24default$iv = (Mutex) this.L$1;
                CoroutineScope coroutineScope = (CoroutineScope) this.L$0;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        try {
            z = pdfRendererCore.isRendererOpen;
            if (z) {
                pdfRendererCore.isRendererOpen = false;
                Result.Companion companion = Result.Companion;
                pdfRenderer = pdfRendererCore.pdfRenderer;
                pdfRenderer.close();
                Throwable it = Result.m7344exceptionOrNullimpl(Result.m7341constructorimpl(Unit.INSTANCE));
                if (it != null) {
                    Log.e("PdfRendererCore", "Error closing PdfRenderer: " + it.getMessage(), it);
                }
                Result.Companion companion2 = Result.Companion;
                parcelFileDescriptor = pdfRendererCore.fileDescriptor;
                parcelFileDescriptor.close();
                Throwable it2 = Result.m7344exceptionOrNullimpl(Result.m7341constructorimpl(Unit.INSTANCE));
                if (it2 != null) {
                    Log.e("PdfRendererCore", "Error closing file descriptor: " + it2.getMessage(), it2);
                }
            }
            Unit unit = Unit.INSTANCE;
            $this$withLock_u24default$iv.unlock(owner$iv);
            return Unit.INSTANCE;
        } catch (Throwable th) {
            $this$withLock_u24default$iv.unlock(owner$iv);
            throw th;
        }
    }
}
