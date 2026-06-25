package com.hardlineforge.lala.ui.screens;

import android.content.Context;
import androidx.camera.core.ImageCapture;
import androidx.compose.runtime.MutableState;
import androidx.navigation.NavHostController;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.util.concurrent.ExecutorService;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CameraCaptureScreen.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1", f = "CameraCaptureScreen.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes5.dex */
public final class CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Context $context;
    final /* synthetic */ String $entryId;
    final /* synthetic */ ExecutorService $executor;
    final /* synthetic */ MutableState<ImageCapture> $imageCapture$delegate;
    final /* synthetic */ NavHostController $navController;
    final /* synthetic */ LalaViewModel $vm;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1(Context context, ExecutorService executorService, String str, LalaViewModel lalaViewModel, NavHostController navHostController, MutableState<ImageCapture> mutableState, Continuation<? super CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1> continuation) {
        super(2, continuation);
        this.$context = context;
        this.$executor = executorService;
        this.$entryId = str;
        this.$vm = lalaViewModel;
        this.$navController = navHostController;
        this.$imageCapture$delegate = mutableState;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1(this.$context, this.$executor, this.$entryId, this.$vm, this.$navController, this.$imageCapture$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        ImageCapture CameraCaptureScreen$lambda$19;
        boolean ok;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                Context context = this.$context;
                CameraCaptureScreen$lambda$19 = CameraCaptureScreenKt.CameraCaptureScreen$lambda$19(this.$imageCapture$delegate);
                ExecutorService executorService = this.$executor;
                Intrinsics.checkNotNull(executorService);
                ok = CameraCaptureScreenKt.capturePhoto(context, CameraCaptureScreen$lambda$19, executorService, this.$entryId, this.$vm);
                if (ok) {
                    this.$navController.popBackStack();
                }
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
