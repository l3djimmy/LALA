package com.hardlineforge.lala.ui.screens;

import android.content.Context;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.video.FileOutputOptions;
import androidx.camera.video.Recorder;
import androidx.camera.video.Recording;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoRecordEvent;
import androidx.camera.view.PreviewView;
import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.filled.PhotoCameraKt;
import androidx.compose.material.icons.filled.StopKt;
import androidx.compose.material.icons.filled.VideocamKt;
import androidx.compose.material3.IconKt;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DisposableEffectResult;
import androidx.compose.runtime.DisposableEffectScope;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.ui.Modifier;
import androidx.core.content.ContextCompat;
import androidx.core.util.Consumer;
import androidx.navigation.NavHostController;
import com.hardlineforge.lala.data.Photo;
import com.hardlineforge.lala.data.Video;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.io.File;
import java.time.Instant;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: CameraCaptureScreen.kt */
@Metadata(d1 = {"\u0000P\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007H\u0007¢\u0006\u0002\u0010\b\u001a2\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0002\u001a0\u0010\u0011\u001a\u0004\u0018\u00010\u00122\u0006\u0010\u000b\u001a\u00020\f2\f\u0010\u0013\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u00142\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0002¨\u0006\u0015²\u0006\n\u0010\u0016\u001a\u00020\nX\u008a\u008e\u0002²\u0006\n\u0010\u0017\u001a\u00020\u0018X\u008a\u008e\u0002²\u0006\n\u0010\u0019\u001a\u00020\u001aX\u008a\u008e\u0002²\u0006\n\u0010\u001b\u001a\u00020\nX\u008a\u008e\u0002²\u0006\f\u0010\u001c\u001a\u0004\u0018\u00010\u0012X\u008a\u008e\u0002²\u0006\f\u0010\r\u001a\u0004\u0018\u00010\u000eX\u008a\u008e\u0002²\u0006\u0010\u0010\u0013\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0014X\u008a\u008e\u0002"}, d2 = {"CameraCaptureScreen", "", "navController", "Landroidx/navigation/NavHostController;", "entryId", "", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "capturePhoto", "", "context", "Landroid/content/Context;", "imageCapture", "Landroidx/camera/core/ImageCapture;", "executor", "Ljava/util/concurrent/ExecutorService;", "startRecording", "Landroidx/camera/video/Recording;", "videoCapture", "Landroidx/camera/video/VideoCapture;", "app_debug", "hasCameraPermission", "lensFacing", "", "mode", "Lcom/hardlineforge/lala/ui/screens/CaptureMode;", "isRecording", "recording"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class CameraCaptureScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$50(NavHostController navHostController, String str, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        CameraCaptureScreen(navHostController, str, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0376  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0387  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x03aa  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x03fe  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0412  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0455  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x04c2  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01fe  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x020c  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0230  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x026c  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0281  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x02a3  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x02ba  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x02df  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02f1  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0312  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0341  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0353  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void CameraCaptureScreen(final androidx.navigation.NavHostController r34, final java.lang.String r35, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r36, androidx.compose.runtime.Composer r37, final int r38, final int r39) {
        /*
            Method dump skipped, instructions count: 1254
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt.CameraCaptureScreen(androidx.navigation.NavHostController, java.lang.String, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean CameraCaptureScreen$lambda$1(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void CameraCaptureScreen$lambda$2(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$4$lambda$3(MutableState $hasCameraPermission$delegate, boolean granted) {
        CameraCaptureScreen$lambda$2($hasCameraPermission$delegate, granted);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int CameraCaptureScreen$lambda$6(MutableState<Integer> mutableState) {
        return mutableState.getValue().intValue();
    }

    private static final void CameraCaptureScreen$lambda$7(MutableState<Integer> mutableState, int i) {
        mutableState.setValue(Integer.valueOf(i));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CaptureMode CameraCaptureScreen$lambda$9(MutableState<CaptureMode> mutableState) {
        return mutableState.getValue();
    }

    private static final boolean CameraCaptureScreen$lambda$12(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void CameraCaptureScreen$lambda$13(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Recording CameraCaptureScreen$lambda$15(MutableState<Recording> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ImageCapture CameraCaptureScreen$lambda$19(MutableState<ImageCapture> mutableState) {
        return mutableState.getValue();
    }

    private static final VideoCapture<?> CameraCaptureScreen$lambda$22(MutableState<VideoCapture<?>> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final DisposableEffectResult CameraCaptureScreen$lambda$28$lambda$27(final ExecutorService $executor, final MutableState $recording$delegate, DisposableEffectScope DisposableEffect) {
        Intrinsics.checkNotNullParameter(DisposableEffect, "$this$DisposableEffect");
        return new DisposableEffectResult() { // from class: com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$lambda$28$lambda$27$$inlined$onDispose$1
            @Override // androidx.compose.runtime.DisposableEffectResult
            public void dispose() {
                Recording CameraCaptureScreen$lambda$15;
                try {
                    CameraCaptureScreen$lambda$15 = CameraCaptureScreenKt.CameraCaptureScreen$lambda$15($recording$delegate);
                    if (CameraCaptureScreen$lambda$15 != null) {
                        CameraCaptureScreen$lambda$15.close();
                    }
                } catch (Exception e) {
                }
                $executor.shutdown();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0315, code lost:
        if (r5 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0757  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x07f4  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0800  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0806  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0837  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x084d A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:131:0x08ad  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x08bf  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0944  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0961  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x09ef  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x09fb  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0a01  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0a34  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0a4a  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0ad9  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x0bc6  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x0d56  */
    /* JADX WARN: Removed duplicated region for block: B:180:0x0d7c  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0186  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0258  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x025e  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0291  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x02a7 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x030d  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0319  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x03f5  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0401  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0407  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x043a  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0450 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x04a3  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x04a6  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x04c4  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x04d2  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0507  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x050a  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0528  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0536  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0595  */
    /* JADX WARN: Type inference failed for: r13v3 */
    /* JADX WARN: Type inference failed for: r13v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r13v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit CameraCaptureScreen$lambda$49(final androidx.camera.view.PreviewView r109, final androidx.navigation.NavHostController r110, final androidx.compose.runtime.MutableState r111, final androidx.compose.runtime.MutableState r112, final androidx.compose.runtime.MutableState r113, final kotlinx.coroutines.CoroutineScope r114, final android.content.Context r115, final java.util.concurrent.ExecutorService r116, final java.lang.String r117, final com.hardlineforge.lala.ui.viewmodel.LalaViewModel r118, final androidx.compose.runtime.MutableState r119, final androidx.compose.runtime.MutableState r120, final androidx.compose.runtime.MutableState r121, androidx.compose.runtime.MutableState r122, androidx.compose.foundation.layout.PaddingValues r123, androidx.compose.runtime.Composer r124, int r125) {
        /*
            Method dump skipped, instructions count: 3464
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt.CameraCaptureScreen$lambda$49(androidx.camera.view.PreviewView, androidx.navigation.NavHostController, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, kotlinx.coroutines.CoroutineScope, android.content.Context, java.util.concurrent.ExecutorService, java.lang.String, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.foundation.layout.PaddingValues, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final PreviewView CameraCaptureScreen$lambda$49$lambda$48$lambda$30$lambda$29(PreviewView $previewView, Context it) {
        Intrinsics.checkNotNullParameter(it, "it");
        return $previewView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$49$lambda$48$lambda$38$lambda$32$lambda$31(NavHostController $navController) {
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$49$lambda$48$lambda$38$lambda$37$lambda$34$lambda$33(MutableState $isRecording$delegate, MutableState $mode$delegate) {
        if (!CameraCaptureScreen$lambda$12($isRecording$delegate)) {
            $mode$delegate.setValue(CaptureMode.PHOTO);
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$49$lambda$48$lambda$38$lambda$37$lambda$36$lambda$35(MutableState $isRecording$delegate, MutableState $mode$delegate) {
        if (!CameraCaptureScreen$lambda$12($isRecording$delegate)) {
            $mode$delegate.setValue(CaptureMode.VIDEO);
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$49$lambda$48$lambda$46$lambda$41$lambda$40(MutableState $lensFacing$delegate) {
        CameraCaptureScreen$lambda$7($lensFacing$delegate, CameraCaptureScreen$lambda$6($lensFacing$delegate) == 1 ? 0 : 1);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$49$lambda$48$lambda$46$lambda$45$lambda$43$lambda$42(CoroutineScope $scope, Context $context, String $entryId, LalaViewModel $vm, NavHostController $navController, MutableState $mode$delegate, ExecutorService $executor, MutableState $imageCapture$delegate, MutableState $isRecording$delegate, MutableState $videoCapture$delegate, MutableState $recording$delegate) {
        if (CameraCaptureScreen$lambda$9($mode$delegate) == CaptureMode.PHOTO) {
            BuildersKt__Builders_commonKt.launch$default($scope, null, null, new CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1($context, $executor, $entryId, $vm, $navController, $imageCapture$delegate, null), 3, null);
        } else if (!CameraCaptureScreen$lambda$12($isRecording$delegate)) {
            Recording rec = startRecording($context, CameraCaptureScreen$lambda$22($videoCapture$delegate), $entryId, $vm);
            if (rec != null) {
                $recording$delegate.setValue(rec);
                CameraCaptureScreen$lambda$13($isRecording$delegate, true);
            }
        } else {
            Recording CameraCaptureScreen$lambda$15 = CameraCaptureScreen$lambda$15($recording$delegate);
            if (CameraCaptureScreen$lambda$15 != null) {
                CameraCaptureScreen$lambda$15.close();
            }
            $recording$delegate.setValue(null);
            CameraCaptureScreen$lambda$13($isRecording$delegate, false);
            $navController.popBackStack();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit CameraCaptureScreen$lambda$49$lambda$48$lambda$46$lambda$45$lambda$44(MutableState $mode$delegate, MutableState $isRecording$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C:CameraCaptureScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1046640709, $changed, -1, "com.hardlineforge.lala.ui.screens.CameraCaptureScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (CameraCaptureScreen.kt:243)");
            }
            if (CameraCaptureScreen$lambda$9($mode$delegate) == CaptureMode.PHOTO) {
                $composer.startReplaceGroup(-989142194);
                ComposerKt.sourceInformation($composer, "247@10176L11,244@10012L215");
                IconKt.m2200Iconww6aTOc(PhotoCameraKt.getPhotoCamera(Icons.INSTANCE.getDefault()), "Take Photo", (Modifier) null, MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1950getOnPrimary0d7_KjU(), $composer, 48, 4);
                $composer.endReplaceGroup();
            } else {
                $composer.startReplaceGroup(-988864372);
                ComposerKt.sourceInformation($composer, "253@10551L11,250@10289L313");
                IconKt.m2200Iconww6aTOc(CameraCaptureScreen$lambda$12($isRecording$delegate) ? StopKt.getStop(Icons.INSTANCE.getDefault()) : VideocamKt.getVideocam(Icons.INSTANCE.getDefault()), CameraCaptureScreen$lambda$12($isRecording$delegate) ? "Stop" : "Record", (Modifier) null, MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1950getOnPrimary0d7_KjU(), $composer, 0, 4);
                $composer.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean capturePhoto(Context context, ImageCapture imageCapture, ExecutorService executor, final String entryId, final LalaViewModel vm) {
        if (imageCapture == null) {
            return false;
        }
        File file = new File(context.getFilesDir(), "photos/" + entryId);
        file.mkdirs();
        final File file2 = new File(file, UUID.randomUUID() + ".jpg");
        ImageCapture.OutputFileOptions opts = new ImageCapture.OutputFileOptions.Builder(file2).build();
        Intrinsics.checkNotNullExpressionValue(opts, "build(...)");
        final Ref.BooleanRef success = new Ref.BooleanRef();
        imageCapture.m117lambda$takePicture$2$androidxcameracoreImageCapture(opts, executor, new ImageCapture.OnImageSavedCallback() { // from class: com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$capturePhoto$1
            @Override // androidx.camera.core.ImageCapture.OnImageSavedCallback
            public void onError(ImageCaptureException exc) {
                Intrinsics.checkNotNullParameter(exc, "exc");
                Ref.BooleanRef.this.element = false;
            }

            @Override // androidx.camera.core.ImageCapture.OnImageSavedCallback
            public void onImageSaved(ImageCapture.OutputFileResults output) {
                Intrinsics.checkNotNullParameter(output, "output");
                LalaViewModel lalaViewModel = vm;
                String str = entryId;
                String absolutePath = file2.getAbsolutePath();
                Intrinsics.checkNotNullExpressionValue(absolutePath, "getAbsolutePath(...)");
                Instant now = Instant.now();
                Intrinsics.checkNotNullExpressionValue(now, "now(...)");
                lalaViewModel.addPhoto(new Photo(null, str, absolutePath, null, now, null, null, 105, null));
                Ref.BooleanRef.this.element = true;
            }
        });
        return success.element;
    }

    private static final Recording startRecording(Context context, VideoCapture<?> videoCapture, final String entryId, final LalaViewModel vm) {
        if (videoCapture == null) {
            return null;
        }
        File file = new File(context.getFilesDir(), "videos/" + entryId);
        file.mkdirs();
        final File file2 = new File(file, UUID.randomUUID() + ".mp4");
        FileOutputOptions opts = new FileOutputOptions.Builder(file2).build();
        Intrinsics.checkNotNullExpressionValue(opts, "build(...)");
        Object output = videoCapture.getOutput();
        Intrinsics.checkNotNullExpressionValue(output, "getOutput(...)");
        Recorder recorder = (Recorder) output;
        return recorder.prepareRecording(context, opts).start(ContextCompat.getMainExecutor(context), new Consumer() { // from class: com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$$ExternalSyntheticLambda4
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CameraCaptureScreenKt.startRecording$lambda$53(LalaViewModel.this, entryId, file2, (VideoRecordEvent) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void startRecording$lambda$53(LalaViewModel $vm, String $entryId, File $file, VideoRecordEvent event) {
        if ((event instanceof VideoRecordEvent.Finalize) && !((VideoRecordEvent.Finalize) event).hasError()) {
            int seconds = RangesKt.coerceAtLeast((int) (((VideoRecordEvent.Finalize) event).getRecordingStats().getRecordedDurationNanos() / 1000000000), 1);
            String absolutePath = $file.getAbsolutePath();
            Intrinsics.checkNotNullExpressionValue(absolutePath, "getAbsolutePath(...)");
            Instant now = Instant.now();
            Intrinsics.checkNotNullExpressionValue(now, "now(...)");
            $vm.addVideo(new Video(null, $entryId, absolutePath, seconds, null, now, null, null, 209, null));
        }
    }
}
