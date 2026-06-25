package com.rajat.pdfviewer;

import android.graphics.pdf.PdfRenderer;
import android.util.Size;
import com.itextpdf.io.codec.TIFFConstants;
import java.util.Map;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2", f = "PdfRendererCore.kt", i = {}, l = {TIFFConstants.TIFFTAG_INKNAMES, TIFFConstants.TIFFTAG_TARGETPRINTER}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class PdfRendererCore$getPageDimensionsAsync$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Function1<Size, Unit> $callback;
    final /* synthetic */ int $pageNo;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public PdfRendererCore$getPageDimensionsAsync$2(PdfRendererCore pdfRendererCore, int i, Function1<? super Size, Unit> function1, Continuation<? super PdfRendererCore$getPageDimensionsAsync$2> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
        this.$pageNo = i;
        this.$callback = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererCore$getPageDimensionsAsync$2(this.this$0, this.$pageNo, this.$callback, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$getPageDimensionsAsync$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0060 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0061  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) {
        /*
            r8 = this;
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r8.label
            r2 = 1
            switch(r1) {
                case 0: goto L1b;
                case 1: goto L16;
                case 2: goto L12;
                default: goto La;
            }
        La:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r0)
            throw r9
        L12:
            kotlin.ResultKt.throwOnFailure(r9)
            goto L62
        L16:
            kotlin.ResultKt.throwOnFailure(r9)
            r1 = r9
            goto L3a
        L1b:
            kotlin.ResultKt.throwOnFailure(r9)
            com.rajat.pdfviewer.PdfRendererCore r1 = r8.this$0
            int r3 = r8.$pageNo
            com.rajat.pdfviewer.PdfRendererCore r4 = r8.this$0
            int r5 = r8.$pageNo
            com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0 r6 = new com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0
            r6.<init>()
            r4 = r8
            kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4
            r8.label = r2
            java.lang.Object r1 = com.rajat.pdfviewer.PdfRendererCore.access$withPdfPage(r1, r3, r6, r4)
            if (r1 != r0) goto L37
            return r0
        L37:
            r7 = r1
            r1 = r9
            r9 = r7
        L3a:
            android.util.Size r9 = (android.util.Size) r9
            if (r9 != 0) goto L43
            android.util.Size r9 = new android.util.Size
            r9.<init>(r2, r2)
        L43:
            kotlinx.coroutines.MainCoroutineDispatcher r2 = kotlinx.coroutines.Dispatchers.getMain()
            kotlin.coroutines.CoroutineContext r2 = (kotlin.coroutines.CoroutineContext) r2
            com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2$1 r3 = new com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2$1
            kotlin.jvm.functions.Function1<android.util.Size, kotlin.Unit> r4 = r8.$callback
            r5 = 0
            r3.<init>(r4, r9, r5)
            kotlin.jvm.functions.Function2 r3 = (kotlin.jvm.functions.Function2) r3
            r4 = r8
            kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4
            r5 = 2
            r8.label = r5
            java.lang.Object r9 = kotlinx.coroutines.BuildersKt.withContext(r2, r3, r4)
            if (r9 != r0) goto L61
            return r0
        L61:
            r9 = r1
        L62:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Size invokeSuspend$lambda$1(PdfRendererCore this$0, int $pageNo, PdfRenderer.Page page) {
        Map map;
        Size it = new Size(page.getWidth(), page.getHeight());
        Integer valueOf = Integer.valueOf($pageNo);
        map = this$0.pageDimensionCache;
        map.put(valueOf, it);
        return it;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfRendererCore.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2$1", f = "PdfRendererCore.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2$1  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        final /* synthetic */ Function1<Size, Unit> $callback;
        final /* synthetic */ Size $size;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass1(Function1<? super Size, Unit> function1, Size size, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$callback = function1;
            this.$size = size;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.$callback, this.$size, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    this.$callback.invoke(this.$size);
                    return Unit.INSTANCE;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }
}
