package com.rajat.pdfviewer.util;

import android.graphics.pdf.PdfRenderer;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.functions.Function2;
import kotlin.text.Charsets;
import kotlin.text.StringsKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: FileUtils.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.FileUtils$isValidPdf$2", f = "FileUtils.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
final class FileUtils$isValidPdf$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Boolean>, Object> {
    final /* synthetic */ File $file;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FileUtils$isValidPdf$2(File file, Continuation<? super FileUtils$isValidPdf$2> continuation) {
        super(2, continuation);
        this.$file = file;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new FileUtils$isValidPdf$2(this.$file, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Boolean> continuation) {
        return ((FileUtils$isValidPdf$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        FileInputStream fileInputStream;
        File file;
        byte[] buffer;
        int bytesRead;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                boolean z = false;
                if (this.$file == null || !this.$file.exists() || this.$file.length() < 4) {
                    Log.e("PdfValidator", "Validation failed: File is null, does not exist, or is too small.");
                    return Boxing.boxBoolean(false);
                }
                try {
                    fileInputStream = new FileInputStream(this.$file);
                    file = this.$file;
                    FileInputStream inputStream = fileInputStream;
                    buffer = new byte[1024];
                    bytesRead = inputStream.read(buffer);
                } catch (Exception e) {
                    Log.e("PdfValidator", "Validation failed: " + e.getMessage(), e);
                }
                if (bytesRead == -1) {
                    Log.e("PdfValidator", "Validation failed: Unable to read file content.");
                    Boolean boxBoolean = Boxing.boxBoolean(false);
                    CloseableKt.closeFinally(fileInputStream, null);
                    return boxBoolean;
                }
                String pdfContent = new String(buffer, Charsets.US_ASCII);
                int pdfIndex = StringsKt.indexOf$default((CharSequence) pdfContent, "%PDF", 0, false, 6, (Object) null);
                if (pdfIndex == -1) {
                    Log.e("PdfValidator", "Validation failed: `%PDF` signature not found in first 1024 bytes.");
                    Boolean boxBoolean2 = Boxing.boxBoolean(false);
                    CloseableKt.closeFinally(fileInputStream, null);
                    return boxBoolean2;
                }
                Log.d("PdfValidator", "PDF signature found at byte offset: " + pdfIndex);
                ParcelFileDescriptor open = ParcelFileDescriptor.open(file, 268435456);
                try {
                    ParcelFileDescriptor pfd = open;
                    PdfRenderer pdfRenderer = new PdfRenderer(pfd);
                    PdfRenderer renderer = pdfRenderer;
                    if (renderer.getPageCount() <= 0) {
                        Log.e("PdfValidator", "Validation failed: PDF has no pages.");
                        Boolean boxBoolean3 = Boxing.boxBoolean(false);
                        AutoCloseableKt.closeFinally(pdfRenderer, null);
                        CloseableKt.closeFinally(open, null);
                        CloseableKt.closeFinally(fileInputStream, null);
                        return boxBoolean3;
                    }
                    Log.d("PdfValidator", "Validation successful: PDF is valid with " + renderer.getPageCount() + " pages.");
                    AutoCloseableKt.closeFinally(pdfRenderer, null);
                    CloseableKt.closeFinally(open, null);
                    CloseableKt.closeFinally(fileInputStream, null);
                    z = true;
                    return Boxing.boxBoolean(z);
                } finally {
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
