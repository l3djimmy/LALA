package com.rajat.pdfviewer;

import android.graphics.Bitmap;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$deliverRenderCallbacks$2", f = "PdfRendererCore.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
final class PdfRendererCore$deliverRenderCallbacks$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Bitmap $bitmap;
    final /* synthetic */ CopyOnWriteArrayList<Function3<Boolean, Integer, Bitmap, Unit>> $callbacks;
    final /* synthetic */ int $pageNo;
    final /* synthetic */ boolean $success;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererCore$deliverRenderCallbacks$2(CopyOnWriteArrayList<Function3<Boolean, Integer, Bitmap, Unit>> copyOnWriteArrayList, boolean z, int i, Bitmap bitmap, Continuation<? super PdfRendererCore$deliverRenderCallbacks$2> continuation) {
        super(2, continuation);
        this.$callbacks = copyOnWriteArrayList;
        this.$success = z;
        this.$pageNo = i;
        this.$bitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererCore$deliverRenderCallbacks$2(this.$callbacks, this.$success, this.$pageNo, this.$bitmap, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$deliverRenderCallbacks$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                Iterable $this$forEach$iv = this.$callbacks;
                boolean z = this.$success;
                int i = this.$pageNo;
                Bitmap bitmap = this.$bitmap;
                for (Object element$iv : $this$forEach$iv) {
                    ((Function3) element$iv).invoke(Boxing.boxBoolean(z), Boxing.boxInt(i), bitmap);
                }
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
