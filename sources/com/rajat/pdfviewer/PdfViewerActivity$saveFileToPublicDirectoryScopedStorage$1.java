package com.rajat.pdfviewer;

import android.net.Uri;
import android.widget.Toast;
import com.itextpdf.io.codec.TIFFConstants;
import com.itextpdf.kernel.pdf.canvas.wmf.MetaDo;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.ByteStreamsKt;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfViewerActivity.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1", f = "PdfViewerActivity.kt", i = {}, l = {TIFFConstants.TIFFTAG_JPEGDCTABLES, 521, MetaDo.META_SETVIEWPORTEXT}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ String $fileName;
    final /* synthetic */ String $filePath;
    int label;
    final /* synthetic */ PdfViewerActivity this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1(PdfViewerActivity pdfViewerActivity, String str, String str2, Continuation<? super PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1> continuation) {
        super(2, continuation);
        this.this$0 = pdfViewerActivity;
        this.$fileName = str;
        this.$filePath = str2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1(this.this$0, this.$fileName, this.$filePath, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0060 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007d A[RETURN] */
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
            r2 = 0
            switch(r1) {
                case 0: goto L1f;
                case 1: goto L1a;
                case 2: goto L16;
                case 3: goto L12;
                default: goto La;
            }
        La:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r0)
            throw r9
        L12:
            kotlin.ResultKt.throwOnFailure(r9)
            goto L7e
        L16:
            kotlin.ResultKt.throwOnFailure(r9)
            goto L62
        L1a:
            kotlin.ResultKt.throwOnFailure(r9)
            r1 = r9
            goto L41
        L1f:
            kotlin.ResultKt.throwOnFailure(r9)
            com.rajat.pdfviewer.util.FileUtils r1 = com.rajat.pdfviewer.util.FileUtils.INSTANCE
            com.rajat.pdfviewer.PdfViewerActivity r3 = r8.this$0
            android.content.ContentResolver r3 = r3.getContentResolver()
            java.lang.String r4 = "getContentResolver(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r3, r4)
            java.lang.String r4 = r8.$fileName
            r5 = r8
            kotlin.coroutines.Continuation r5 = (kotlin.coroutines.Continuation) r5
            r6 = 1
            r8.label = r6
            java.lang.Object r1 = r1.createPdfDocumentUri(r3, r4, r5)
            if (r1 != r0) goto L3e
            return r0
        L3e:
            r7 = r1
            r1 = r9
            r9 = r7
        L41:
            android.net.Uri r9 = (android.net.Uri) r9
            kotlinx.coroutines.CoroutineDispatcher r3 = kotlinx.coroutines.Dispatchers.getIO()
            kotlin.coroutines.CoroutineContext r3 = (kotlin.coroutines.CoroutineContext) r3
            com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1 r4 = new com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1
            com.rajat.pdfviewer.PdfViewerActivity r5 = r8.this$0
            java.lang.String r6 = r8.$filePath
            r4.<init>(r5, r9, r6, r2)
            kotlin.jvm.functions.Function2 r4 = (kotlin.jvm.functions.Function2) r4
            r5 = r8
            kotlin.coroutines.Continuation r5 = (kotlin.coroutines.Continuation) r5
            r6 = 2
            r8.label = r6
            java.lang.Object r9 = kotlinx.coroutines.BuildersKt.withContext(r3, r4, r5)
            if (r9 != r0) goto L61
            return r0
        L61:
            r9 = r1
        L62:
            kotlinx.coroutines.MainCoroutineDispatcher r1 = kotlinx.coroutines.Dispatchers.getMain()
            kotlin.coroutines.CoroutineContext r1 = (kotlin.coroutines.CoroutineContext) r1
            com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$2 r3 = new com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$2
            com.rajat.pdfviewer.PdfViewerActivity r4 = r8.this$0
            r3.<init>(r4, r2)
            kotlin.jvm.functions.Function2 r3 = (kotlin.jvm.functions.Function2) r3
            r2 = r8
            kotlin.coroutines.Continuation r2 = (kotlin.coroutines.Continuation) r2
            r4 = 3
            r8.label = r4
            java.lang.Object r1 = kotlinx.coroutines.BuildersKt.withContext(r1, r3, r2)
            if (r1 != r0) goto L7e
            return r0
        L7e:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfViewerActivity.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1", f = "PdfViewerActivity.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Long>, Object> {
        final /* synthetic */ String $filePath;
        final /* synthetic */ Uri $uri;
        int label;
        final /* synthetic */ PdfViewerActivity this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(PdfViewerActivity pdfViewerActivity, Uri uri, String str, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.this$0 = pdfViewerActivity;
            this.$uri = uri;
            this.$filePath = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.this$0, this.$uri, this.$filePath, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Long> continuation) {
            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    OutputStream openOutputStream = this.this$0.getContentResolver().openOutputStream(this.$uri);
                    if (openOutputStream != null) {
                        OutputStream outputStream = openOutputStream;
                        try {
                            OutputStream outputStream2 = outputStream;
                            Long boxLong = Boxing.boxLong(ByteStreamsKt.copyTo$default(new FileInputStream(new File(this.$filePath)), outputStream2, 0, 2, null));
                            CloseableKt.closeFinally(outputStream, null);
                            return boxLong;
                        } catch (Throwable th) {
                            try {
                                throw th;
                            } catch (Throwable th2) {
                                CloseableKt.closeFinally(outputStream, th);
                                throw th2;
                            }
                        }
                    }
                    return null;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: PdfViewerActivity.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$2", f = "PdfViewerActivity.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$2  reason: invalid class name */
    /* loaded from: classes12.dex */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        int label;
        final /* synthetic */ PdfViewerActivity this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass2(PdfViewerActivity pdfViewerActivity, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.this$0 = pdfViewerActivity;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.this$0, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            String str;
            IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    PdfViewerActivity pdfViewerActivity = this.this$0;
                    str = this.this$0.file_saved_to_downloads;
                    if (str == null) {
                        Intrinsics.throwUninitializedPropertyAccessException("file_saved_to_downloads");
                        str = null;
                    }
                    Toast.makeText(pdfViewerActivity, str, 0).show();
                    return Unit.INSTANCE;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }
}
