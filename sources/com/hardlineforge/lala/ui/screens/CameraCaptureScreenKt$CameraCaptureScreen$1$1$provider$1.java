package com.hardlineforge.lala.ui.screens;

import androidx.camera.lifecycle.ProcessCameraProvider;
import com.google.common.util.concurrent.ListenableFuture;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: CameraCaptureScreen.kt */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\n \u0002*\u0004\u0018\u00010\u00010\u0001*\u00020\u0003H\n"}, d2 = {"<anonymous>", "Landroidx/camera/lifecycle/ProcessCameraProvider;", "kotlin.jvm.PlatformType", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1", f = "CameraCaptureScreen.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes5.dex */
final class CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super ProcessCameraProvider>, Object> {
    final /* synthetic */ ListenableFuture<ProcessCameraProvider> $future;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1(ListenableFuture<ProcessCameraProvider> listenableFuture, Continuation<? super CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1> continuation) {
        super(2, continuation);
        this.$future = listenableFuture;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1(this.$future, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super ProcessCameraProvider> continuation) {
        return ((CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                return this.$future.get();
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
