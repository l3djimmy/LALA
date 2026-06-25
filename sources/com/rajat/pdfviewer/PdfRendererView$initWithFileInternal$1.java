package com.rajat.pdfviewer;

import com.rajat.pdfviewer.PdfRendererView;
import com.rajat.pdfviewer.util.CacheStrategy;
import java.io.File;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererView.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererView$initWithFileInternal$1", f = "PdfRendererView.kt", i = {0}, l = {186, 188, 195}, m = "invokeSuspend", n = {"fileDescriptor"}, s = {"L$0"})
/* loaded from: classes12.dex */
public final class PdfRendererView$initWithFileInternal$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ String $cacheIdentifier;
    final /* synthetic */ CacheStrategy $cacheStrategy;
    final /* synthetic */ Function0<Unit> $documentCleanupAction;
    final /* synthetic */ File $file;
    Object L$0;
    int label;
    final /* synthetic */ PdfRendererView this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererView$initWithFileInternal$1(File file, PdfRendererView pdfRendererView, String str, CacheStrategy cacheStrategy, Function0<Unit> function0, Continuation<? super PdfRendererView$initWithFileInternal$1> continuation) {
        super(2, continuation);
        this.$file = file;
        this.this$0 = pdfRendererView;
        this.$cacheIdentifier = str;
        this.$cacheStrategy = cacheStrategy;
        this.$documentCleanupAction = function0;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererView$initWithFileInternal$1(this.$file, this.this$0, this.$cacheIdentifier, this.$cacheStrategy, this.$documentCleanupAction, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererView$initWithFileInternal$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0080 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c1 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00c2  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            Method dump skipped, instructions count: 216
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererView$initWithFileInternal$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfRendererView.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererView$initWithFileInternal$1$1", f = "PdfRendererView.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfRendererView$initWithFileInternal$1$1  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        final /* synthetic */ Function0<Unit> $documentCleanupAction;
        final /* synthetic */ File $file;
        final /* synthetic */ PdfRendererCore $renderer;
        int label;
        final /* synthetic */ PdfRendererView this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(PdfRendererView pdfRendererView, PdfRendererCore pdfRendererCore, Function0<Unit> function0, File file, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.this$0 = pdfRendererView;
            this.$renderer = pdfRendererCore;
            this.$documentCleanupAction = function0;
            this.$file = file;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.this$0, this.$renderer, this.$documentCleanupAction, this.$file, continuation);
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
                    this.this$0.initializeRenderer(this.$renderer, this.$documentCleanupAction);
                    PdfRendererView.StatusCallBack statusListener = this.this$0.getStatusListener();
                    if (statusListener != null) {
                        String absolutePath = this.$file.getAbsolutePath();
                        Intrinsics.checkNotNullExpressionValue(absolutePath, "getAbsolutePath(...)");
                        statusListener.onPdfLoadSuccess(absolutePath);
                        return Unit.INSTANCE;
                    }
                    return null;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfRendererView.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfRendererView$initWithFileInternal$1$2", f = "PdfRendererView.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfRendererView$initWithFileInternal$1$2  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        final /* synthetic */ Exception $e;
        int label;
        final /* synthetic */ PdfRendererView this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass2(PdfRendererView pdfRendererView, Exception exc, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.this$0 = pdfRendererView;
            this.$e = exc;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.this$0, this.$e, continuation);
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
                    PdfRendererView.StatusCallBack statusListener = this.this$0.getStatusListener();
                    if (statusListener != null) {
                        statusListener.onError(this.$e);
                        return Unit.INSTANCE;
                    }
                    return null;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }
}
