package com.hardlineforge.lala.ui.screens;

import android.content.Context;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.State;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.pdf.PdfGenerator;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.io.File;
import java.util.List;
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
/* compiled from: PdfPreviewScreen.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.PdfPreviewScreenKt$PdfPreviewScreen$2$1$1", f = "PdfPreviewScreen.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes5.dex */
public final class PdfPreviewScreenKt$PdfPreviewScreen$2$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ State<List<LogEntry>> $allEntries$delegate;
    final /* synthetic */ Context $context;
    final /* synthetic */ MutableState<File> $pdfFile$delegate;
    final /* synthetic */ LalaViewModel $viewModel;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public PdfPreviewScreenKt$PdfPreviewScreen$2$1$1(Context context, LalaViewModel lalaViewModel, State<? extends List<LogEntry>> state, MutableState<File> mutableState, Continuation<? super PdfPreviewScreenKt$PdfPreviewScreen$2$1$1> continuation) {
        super(2, continuation);
        this.$context = context;
        this.$viewModel = lalaViewModel;
        this.$allEntries$delegate = state;
        this.$pdfFile$delegate = mutableState;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfPreviewScreenKt$PdfPreviewScreen$2$1$1(this.$context, this.$viewModel, this.$allEntries$delegate, this.$pdfFile$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfPreviewScreenKt$PdfPreviewScreen$2$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        List<LogEntry> PdfPreviewScreen$lambda$23$lambda$13;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                File file = new File(this.$context.getCacheDir(), "preview.pdf");
                PdfGenerator pdfGen = this.$viewModel.getPdfGen();
                PdfPreviewScreen$lambda$23$lambda$13 = PdfPreviewScreenKt.PdfPreviewScreen$lambda$23$lambda$13(this.$allEntries$delegate);
                pdfGen.generate(PdfPreviewScreen$lambda$23$lambda$13, file);
                this.$pdfFile$delegate.setValue(file);
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
