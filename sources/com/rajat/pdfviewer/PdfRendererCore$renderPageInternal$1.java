package com.rajat.pdfviewer;

import android.graphics.Bitmap;
import android.util.Log;
import androidx.compose.runtime.ComposerKt;
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
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1", f = "PdfRendererCore.kt", i = {0}, l = {150, 152, ComposerKt.referenceKey}, m = "invokeSuspend", n = {"$this$launch"}, s = {"L$0"})
/* loaded from: classes12.dex */
public final class PdfRendererCore$renderPageInternal$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Bitmap $bitmap;
    final /* synthetic */ Function3<Boolean, Integer, Bitmap, Unit> $onBitmapReady;
    final /* synthetic */ int $pageNo;
    final /* synthetic */ boolean $replaceActive;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ PdfRendererCore this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public PdfRendererCore$renderPageInternal$1(PdfRendererCore pdfRendererCore, int i, Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3, boolean z, Bitmap bitmap, Continuation<? super PdfRendererCore$renderPageInternal$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfRendererCore;
        this.$pageNo = i;
        this.$onBitmapReady = function3;
        this.$replaceActive = z;
        this.$bitmap = bitmap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        PdfRendererCore$renderPageInternal$1 pdfRendererCore$renderPageInternal$1 = new PdfRendererCore$renderPageInternal$1(this.this$0, this.$pageNo, this.$onBitmapReady, this.$replaceActive, this.$bitmap, continuation);
        pdfRendererCore$renderPageInternal$1.L$0 = obj;
        return pdfRendererCore$renderPageInternal$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererCore$renderPageInternal$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x006f  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            Method dump skipped, instructions count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfRendererCore.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$1", f = "PdfRendererCore.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$1  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Integer>, Object> {
        final /* synthetic */ Bitmap $cachedBitmap;
        final /* synthetic */ Function3<Boolean, Integer, Bitmap, Unit> $onBitmapReady;
        final /* synthetic */ int $pageNo;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass1(Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3, int i, Bitmap bitmap, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$onBitmapReady = function3;
            this.$pageNo = i;
            this.$cachedBitmap = bitmap;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.$onBitmapReady, this.$pageNo, this.$cachedBitmap, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Integer> continuation) {
            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    Function3<Boolean, Integer, Bitmap, Unit> function3 = this.$onBitmapReady;
                    if (function3 != null) {
                        function3.invoke(Boxing.boxBoolean(true), Boxing.boxInt(this.$pageNo), this.$cachedBitmap);
                    }
                    return Boxing.boxInt(Log.d("PdfRendererCore", "Page " + this.$pageNo + " loaded from cache"));
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfRendererCore.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$2", f = "PdfRendererCore.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$2  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        final /* synthetic */ Function3<Boolean, Integer, Bitmap, Unit> $onBitmapReady;
        final /* synthetic */ int $pageNo;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass2(Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3, int i, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$onBitmapReady = function3;
            this.$pageNo = i;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.$onBitmapReady, this.$pageNo, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    Function3<Boolean, Integer, Bitmap, Unit> function3 = this.$onBitmapReady;
                    if (function3 != null) {
                        function3.invoke(Boxing.boxBoolean(false), Boxing.boxInt(this.$pageNo), null);
                        return Unit.INSTANCE;
                    }
                    return null;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }
}
