package com.rajat.pdfviewer.compose;

import android.content.Context;
import androidx.compose.runtime.MutableState;
import com.rajat.pdfviewer.util.FileUtils;
import com.rajat.pdfviewer.util.PdfSource;
import java.io.File;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfRendererCompose.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.compose.PdfRendererComposeKt$PdfRendererViewCompose$1$1", f = "PdfRendererCompose.kt", i = {}, l = {45}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class PdfRendererComposeKt$PdfRendererViewCompose$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Context $context;
    final /* synthetic */ MutableState<File> $resolvedFile$delegate;
    final /* synthetic */ PdfSource $source;
    Object L$0;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererComposeKt$PdfRendererViewCompose$1$1(PdfSource pdfSource, Context context, MutableState<File> mutableState, Continuation<? super PdfRendererComposeKt$PdfRendererViewCompose$1$1> continuation) {
        super(2, continuation);
        this.$source = pdfSource;
        this.$context = context;
        this.$resolvedFile$delegate = mutableState;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfRendererComposeKt$PdfRendererViewCompose$1$1(this.$source, this.$context, this.$resolvedFile$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfRendererComposeKt$PdfRendererViewCompose$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        MutableState<File> mutableState;
        Object $result2;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                if (this.$source instanceof PdfSource.PdfSourceFromAsset) {
                    mutableState = this.$resolvedFile$delegate;
                    this.L$0 = mutableState;
                    this.label = 1;
                    Object fileFromAsset = FileUtils.INSTANCE.fileFromAsset(this.$context, ((PdfSource.PdfSourceFromAsset) this.$source).getAssetFileName(), this);
                    if (fileFromAsset == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    $result2 = $result;
                    $result = fileFromAsset;
                    mutableState.setValue((File) $result);
                    break;
                }
                break;
            case 1:
                ResultKt.throwOnFailure($result);
                mutableState = (MutableState) this.L$0;
                $result2 = $result;
                mutableState.setValue((File) $result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        return Unit.INSTANCE;
    }
}
