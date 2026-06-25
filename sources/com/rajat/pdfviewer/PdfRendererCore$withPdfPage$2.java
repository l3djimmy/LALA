package com.rajat.pdfviewer;

import android.graphics.pdf.PdfRenderer;
import android.util.Log;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.JobKt;
import kotlinx.coroutines.sync.Mutex;
/* JADX INFO: Access modifiers changed from: package-private */
/* JADX INFO: Add missing generic type declarations: [T] */
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\b\n\u0002\b\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u0001H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", ExifInterface.GPS_DIRECTION_TRUE, "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$withPdfPage$2", f = "PdfRendererCore.kt", i = {0, 0}, l = {399}, m = "invokeSuspend", n = {"$this$withContext", "$this$withLock_u24default$iv"}, s = {"L$0", "L$1"})
/* loaded from: classes12.dex */
public final class PdfRendererCore$withPdfPage$2<T> extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super T>, Object> {
    final /* synthetic */ Function1<PdfRenderer.Page, T> $block;
    final /* synthetic */ int $pageNo;
    int I$0;
    private /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public PdfRendererCore$withPdfPage$2(PdfRendererCore pdfRendererCore, int i, Function1<? super PdfRenderer.Page, ? extends T> function1, Continuation<? super PdfRendererCore$withPdfPage$2> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
        this.$pageNo = i;
        this.$block = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        PdfRendererCore$withPdfPage$2 pdfRendererCore$withPdfPage$2 = new PdfRendererCore$withPdfPage$2(this.this$0, this.$pageNo, this.$block, continuation);
        pdfRendererCore$withPdfPage$2.L$0 = obj;
        return pdfRendererCore$withPdfPage$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(CoroutineScope coroutineScope, Object obj) {
        return invoke(coroutineScope, (Continuation) ((Continuation) obj));
    }

    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super T> continuation) {
        return ((PdfRendererCore$withPdfPage$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        CoroutineScope $this$withContext;
        Mutex $this$withLock_u24default$iv;
        PdfRendererCore pdfRendererCore;
        int i;
        Function1<PdfRenderer.Page, T> function1;
        Object owner$iv;
        boolean z;
        PdfRenderer pdfRenderer;
        PdfRenderer.Page page;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        T t = null;
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                $this$withContext = (CoroutineScope) this.L$0;
                $this$withLock_u24default$iv = this.this$0.renderLock;
                pdfRendererCore = this.this$0;
                i = this.$pageNo;
                function1 = this.$block;
                owner$iv = null;
                this.L$0 = $this$withContext;
                this.L$1 = $this$withLock_u24default$iv;
                this.L$2 = pdfRendererCore;
                this.L$3 = function1;
                this.I$0 = i;
                this.label = 1;
                if ($this$withLock_u24default$iv.lock(null, this) != coroutine_suspended) {
                    break;
                } else {
                    return coroutine_suspended;
                }
            case 1:
                i = this.I$0;
                function1 = (Function1) this.L$3;
                pdfRendererCore = (PdfRendererCore) this.L$2;
                $this$withLock_u24default$iv = (Mutex) this.L$1;
                $this$withContext = (CoroutineScope) this.L$0;
                ResultKt.throwOnFailure($result);
                owner$iv = null;
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        try {
            JobKt.ensureActive($this$withContext.getCoroutineContext());
            z = pdfRendererCore.isRendererOpen;
            if (!z) {
                $this$withLock_u24default$iv.unlock(owner$iv);
                return null;
            }
            try {
                try {
                    pdfRenderer = pdfRendererCore.pdfRenderer;
                    PdfRenderer.Page openPage = pdfRenderer.openPage(i);
                    Intrinsics.checkNotNullExpressionValue(openPage, "openPage(...)");
                    page = openPage;
                } catch (Exception e) {
                    Log.e("PdfRendererCore", "withPdfPage error: " + e.getMessage(), e);
                }
                try {
                    T invoke = function1.invoke(page);
                    AutoCloseableKt.closeFinally(page, null);
                    t = invoke;
                    $this$withLock_u24default$iv.unlock(owner$iv);
                    return t;
                } finally {
                }
            } catch (Throwable th) {
                th = th;
                $this$withLock_u24default$iv.unlock(owner$iv);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }
}
