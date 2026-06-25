package com.hardlineforge.lala.ui.screens;

import android.content.Context;
import androidx.activity.compose.ManagedActivityResultLauncher;
import androidx.camera.core.ImageCapture;
import androidx.camera.video.VideoCapture;
import androidx.camera.view.PreviewView;
import androidx.compose.runtime.MutableState;
import androidx.lifecycle.LifecycleOwner;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CameraCaptureScreen.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$1$1", f = "CameraCaptureScreen.kt", i = {0}, l = {Property.FILL_AVAILABLE_AREA_ON_SPLIT}, m = "invokeSuspend", n = {"future"}, s = {"L$0"})
/* loaded from: classes5.dex */
public final class CameraCaptureScreenKt$CameraCaptureScreen$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Context $context;
    final /* synthetic */ MutableState<Boolean> $hasCameraPermission$delegate;
    final /* synthetic */ MutableState<ImageCapture> $imageCapture$delegate;
    final /* synthetic */ MutableState<Integer> $lensFacing$delegate;
    final /* synthetic */ LifecycleOwner $lifecycleOwner;
    final /* synthetic */ MutableState<CaptureMode> $mode$delegate;
    final /* synthetic */ ManagedActivityResultLauncher<String, Boolean> $permissionLauncher;
    final /* synthetic */ PreviewView $previewView;
    final /* synthetic */ MutableState<VideoCapture<?>> $videoCapture$delegate;
    Object L$0;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CameraCaptureScreenKt$CameraCaptureScreen$1$1(ManagedActivityResultLauncher<String, Boolean> managedActivityResultLauncher, Context context, LifecycleOwner lifecycleOwner, MutableState<Boolean> mutableState, PreviewView previewView, MutableState<Integer> mutableState2, MutableState<CaptureMode> mutableState3, MutableState<ImageCapture> mutableState4, MutableState<VideoCapture<?>> mutableState5, Continuation<? super CameraCaptureScreenKt$CameraCaptureScreen$1$1> continuation) {
        super(2, continuation);
        this.$permissionLauncher = managedActivityResultLauncher;
        this.$context = context;
        this.$lifecycleOwner = lifecycleOwner;
        this.$hasCameraPermission$delegate = mutableState;
        this.$previewView = previewView;
        this.$lensFacing$delegate = mutableState2;
        this.$mode$delegate = mutableState3;
        this.$imageCapture$delegate = mutableState4;
        this.$videoCapture$delegate = mutableState5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new CameraCaptureScreenKt$CameraCaptureScreen$1$1(this.$permissionLauncher, this.$context, this.$lifecycleOwner, this.$hasCameraPermission$delegate, this.$previewView, this.$lensFacing$delegate, this.$mode$delegate, this.$imageCapture$delegate, this.$videoCapture$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((CameraCaptureScreenKt$CameraCaptureScreen$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x00a4 A[Catch: Exception -> 0x001e, TryCatch #0 {Exception -> 0x001e, blocks: (B:7:0x0019, B:20:0x0062, B:22:0x00a4, B:23:0x00cb), top: B:29:0x0019 }] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00cb A[Catch: Exception -> 0x001e, TRY_LEAVE, TryCatch #0 {Exception -> 0x001e, blocks: (B:7:0x0019, B:20:0x0062, B:22:0x00a4, B:23:0x00cb), top: B:29:0x0019 }] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r12) {
        /*
            Method dump skipped, instructions count: 274
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$1$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
