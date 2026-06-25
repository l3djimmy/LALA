package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import androidx.arch.core.util.Function;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.Camera2CapturePipeline;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.workaround.CameraCharacteristicsProvider;
import androidx.camera.camera2.internal.compat.workaround.FlashAvailabilityChecker;
import androidx.camera.camera2.internal.compat.workaround.OverrideAeModeForStillCapture;
import androidx.camera.camera2.internal.compat.workaround.UseTorchAsFlash;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureMetaData;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraCaptureResults;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class Camera2CapturePipeline {
    private static final Set<CameraCaptureMetaData.AeState> AE_TORCH_AS_FLASH_CONVERGED_STATE_SET;
    private static final String TAG = "Camera2CapturePipeline";
    private final Camera2CameraControlImpl mCameraControl;
    private final Quirks mCameraQuirk;
    private final Executor mExecutor;
    private final boolean mHasFlashUnit;
    private final boolean mIsLegacyDevice;
    private int mTemplate = 1;
    private final UseTorchAsFlash mUseTorchAsFlash;
    private static final Set<CameraCaptureMetaData.AfState> AF_CONVERGED_STATE_SET = Collections.unmodifiableSet(EnumSet.of(CameraCaptureMetaData.AfState.PASSIVE_FOCUSED, CameraCaptureMetaData.AfState.PASSIVE_NOT_FOCUSED, CameraCaptureMetaData.AfState.LOCKED_FOCUSED, CameraCaptureMetaData.AfState.LOCKED_NOT_FOCUSED));
    private static final Set<CameraCaptureMetaData.AwbState> AWB_CONVERGED_STATE_SET = Collections.unmodifiableSet(EnumSet.of(CameraCaptureMetaData.AwbState.CONVERGED, CameraCaptureMetaData.AwbState.UNKNOWN));
    private static final Set<CameraCaptureMetaData.AeState> AE_CONVERGED_STATE_SET = Collections.unmodifiableSet(EnumSet.of(CameraCaptureMetaData.AeState.CONVERGED, CameraCaptureMetaData.AeState.FLASH_REQUIRED, CameraCaptureMetaData.AeState.UNKNOWN));

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface PipelineTask {
        boolean isCaptureResultNeeded();

        void postCapture();

        ListenableFuture<Boolean> preCapture(TotalCaptureResult totalCaptureResult);
    }

    static {
        EnumSet<CameraCaptureMetaData.AeState> aeStateSet = EnumSet.copyOf((Collection) AE_CONVERGED_STATE_SET);
        aeStateSet.remove(CameraCaptureMetaData.AeState.FLASH_REQUIRED);
        aeStateSet.remove(CameraCaptureMetaData.AeState.UNKNOWN);
        AE_TORCH_AS_FLASH_CONVERGED_STATE_SET = Collections.unmodifiableSet(aeStateSet);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Camera2CapturePipeline(Camera2CameraControlImpl cameraControl, final CameraCharacteristicsCompat cameraCharacteristics, Quirks cameraQuirks, Executor executor) {
        boolean z = true;
        this.mCameraControl = cameraControl;
        Integer level = (Integer) cameraCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        this.mIsLegacyDevice = (level == null || level.intValue() != 2) ? false : false;
        this.mExecutor = executor;
        this.mCameraQuirk = cameraQuirks;
        this.mUseTorchAsFlash = new UseTorchAsFlash(cameraQuirks);
        Objects.requireNonNull(cameraCharacteristics);
        this.mHasFlashUnit = FlashAvailabilityChecker.isFlashAvailable(new CameraCharacteristicsProvider() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$$ExternalSyntheticLambda0
            @Override // androidx.camera.camera2.internal.compat.workaround.CameraCharacteristicsProvider
            public final Object get(CameraCharacteristics.Key key) {
                return CameraCharacteristicsCompat.this.get(key);
            }
        });
    }

    public void setTemplate(int template) {
        this.mTemplate = template;
    }

    public ListenableFuture<List<Void>> submitStillCaptures(List<CaptureConfig> captureConfigs, int captureMode, int flashMode, int flashType) {
        OverrideAeModeForStillCapture aeQuirk = new OverrideAeModeForStillCapture(this.mCameraQuirk);
        Pipeline pipeline = new Pipeline(this.mTemplate, this.mExecutor, this.mCameraControl, this.mIsLegacyDevice, aeQuirk);
        if (captureMode == 0) {
            pipeline.addTask(new AfTask(this.mCameraControl));
        }
        if (this.mHasFlashUnit) {
            if (isTorchAsFlash(flashType)) {
                pipeline.addTask(new TorchTask(this.mCameraControl, flashMode, this.mExecutor));
            } else {
                pipeline.addTask(new AePreCaptureTask(this.mCameraControl, flashMode, aeQuirk));
            }
        }
        return Futures.nonCancellationPropagating(pipeline.executeCapture(captureConfigs, flashMode));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class Pipeline {
        private static final long CHECK_3A_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(1);
        private static final long CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(5);
        private final Camera2CameraControlImpl mCameraControl;
        private final Executor mExecutor;
        private final boolean mIsLegacyDevice;
        private final OverrideAeModeForStillCapture mOverrideAeModeForStillCapture;
        private final int mTemplate;
        private long mTimeout3A = CHECK_3A_TIMEOUT_IN_NS;
        final List<PipelineTask> mTasks = new ArrayList();
        private final PipelineTask mPipelineSubTask = new AnonymousClass1();

        /* renamed from: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$1  reason: invalid class name */
        /* loaded from: classes.dex */
        class AnonymousClass1 implements PipelineTask {
            AnonymousClass1() {
            }

            @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
            public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
                ArrayList<ListenableFuture<Boolean>> futures = new ArrayList<>();
                for (PipelineTask task : Pipeline.this.mTasks) {
                    futures.add(task.preCapture(captureResult));
                }
                return Futures.transform(Futures.allAsList(futures), new Function() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$1$$ExternalSyntheticLambda0
                    @Override // androidx.arch.core.util.Function
                    public final Object apply(Object obj) {
                        Boolean valueOf;
                        valueOf = Boolean.valueOf(((List) obj).contains(true));
                        return valueOf;
                    }
                }, CameraXExecutors.directExecutor());
            }

            @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
            public boolean isCaptureResultNeeded() {
                for (PipelineTask task : Pipeline.this.mTasks) {
                    if (task.isCaptureResultNeeded()) {
                        return true;
                    }
                }
                return false;
            }

            @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
            public void postCapture() {
                for (PipelineTask task : Pipeline.this.mTasks) {
                    task.postCapture();
                }
            }
        }

        Pipeline(int template, Executor executor, Camera2CameraControlImpl cameraControl, boolean isLegacyDevice, OverrideAeModeForStillCapture overrideAeModeForStillCapture) {
            this.mTemplate = template;
            this.mExecutor = executor;
            this.mCameraControl = cameraControl;
            this.mIsLegacyDevice = isLegacyDevice;
            this.mOverrideAeModeForStillCapture = overrideAeModeForStillCapture;
        }

        void addTask(PipelineTask task) {
            this.mTasks.add(task);
        }

        private void setTimeout3A(long timeout3A) {
            this.mTimeout3A = timeout3A;
        }

        ListenableFuture<List<Void>> executeCapture(final List<CaptureConfig> captureConfigs, final int flashMode) {
            ListenableFuture<TotalCaptureResult> getResult;
            ListenableFuture<TotalCaptureResult> preCapture = Futures.immediateFuture(null);
            if (!this.mTasks.isEmpty()) {
                if (this.mPipelineSubTask.isCaptureResultNeeded()) {
                    getResult = Camera2CapturePipeline.waitForResult(0L, this.mCameraControl, null);
                } else {
                    getResult = Futures.immediateFuture(null);
                }
                preCapture = FutureChain.from(getResult).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda2
                    @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                    public final ListenableFuture apply(Object obj) {
                        return Camera2CapturePipeline.Pipeline.this.m30xe4aaa129(flashMode, (TotalCaptureResult) obj);
                    }
                }, this.mExecutor).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda3
                    @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                    public final ListenableFuture apply(Object obj) {
                        return Camera2CapturePipeline.Pipeline.this.m31xb909b167((Boolean) obj);
                    }
                }, this.mExecutor);
            }
            ListenableFuture<List<Void>> future = FutureChain.from(preCapture).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda4
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    return Camera2CapturePipeline.Pipeline.this.m32x23393986(captureConfigs, flashMode, (TotalCaptureResult) obj);
                }
            }, this.mExecutor);
            final PipelineTask pipelineTask = this.mPipelineSubTask;
            Objects.requireNonNull(pipelineTask);
            future.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CapturePipeline.PipelineTask.this.postCapture();
                }
            }, this.mExecutor);
            return future;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$executeCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline  reason: not valid java name */
        public /* synthetic */ ListenableFuture m30xe4aaa129(int flashMode, TotalCaptureResult captureResult) throws Exception {
            if (Camera2CapturePipeline.isFlashRequired(flashMode, captureResult)) {
                setTimeout3A(CHECK_3A_WITH_FLASH_TIMEOUT_IN_NS);
            }
            return this.mPipelineSubTask.preCapture(captureResult);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$executeCapture$2$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline  reason: not valid java name */
        public /* synthetic */ ListenableFuture m31xb909b167(Boolean is3aConvergeRequired) throws Exception {
            if (Boolean.TRUE.equals(is3aConvergeRequired)) {
                return Camera2CapturePipeline.waitForResult(this.mTimeout3A, this.mCameraControl, new ResultListener.Checker() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda0
                    @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.ResultListener.Checker
                    public final boolean check(TotalCaptureResult totalCaptureResult) {
                        boolean is3AConverged;
                        is3AConverged = Camera2CapturePipeline.is3AConverged(totalCaptureResult, false);
                        return is3AConverged;
                    }
                });
            }
            return Futures.immediateFuture(null);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$executeCapture$3$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline  reason: not valid java name */
        public /* synthetic */ ListenableFuture m32x23393986(List captureConfigs, int flashMode, TotalCaptureResult v) throws Exception {
            return submitConfigsInternal(captureConfigs, flashMode);
        }

        ListenableFuture<List<Void>> submitConfigsInternal(List<CaptureConfig> captureConfigs, int flashMode) {
            List<ListenableFuture<Void>> futureList = new ArrayList<>();
            List<CaptureConfig> configsToSubmit = new ArrayList<>();
            for (CaptureConfig captureConfig : captureConfigs) {
                final CaptureConfig.Builder configBuilder = CaptureConfig.Builder.from(captureConfig);
                CameraCaptureResult cameraCaptureResult = null;
                if (captureConfig.getTemplateType() == 5 && !this.mCameraControl.getZslControl().isZslDisabledByFlashMode() && !this.mCameraControl.getZslControl().isZslDisabledByUserCaseConfig()) {
                    ImageProxy imageProxy = this.mCameraControl.getZslControl().dequeueImageFromBuffer();
                    boolean isSuccess = imageProxy != null && this.mCameraControl.getZslControl().enqueueImageToImageWriter(imageProxy);
                    if (isSuccess) {
                        cameraCaptureResult = CameraCaptureResults.retrieveCameraCaptureResult(imageProxy.getImageInfo());
                    }
                }
                if (cameraCaptureResult != null) {
                    configBuilder.setCameraCaptureResult(cameraCaptureResult);
                } else {
                    applyStillCaptureTemplate(configBuilder, captureConfig);
                }
                if (this.mOverrideAeModeForStillCapture.shouldSetAeModeAlwaysFlash(flashMode)) {
                    applyAeModeQuirk(configBuilder);
                }
                futureList.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda1
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return Camera2CapturePipeline.Pipeline.this.m33x1f41775a(configBuilder, completer);
                    }
                }));
                configsToSubmit.add(configBuilder.build());
            }
            this.mCameraControl.submitCaptureRequestsInternal(configsToSubmit);
            return Futures.allAsList(futureList);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$submitConfigsInternal$4$androidx-camera-camera2-internal-Camera2CapturePipeline$Pipeline  reason: not valid java name */
        public /* synthetic */ Object m33x1f41775a(CaptureConfig.Builder configBuilder, final CallbackToFutureAdapter.Completer completer) throws Exception {
            configBuilder.addCameraCaptureCallback(new CameraCaptureCallback() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline.Pipeline.2
                @Override // androidx.camera.core.impl.CameraCaptureCallback
                public void onCaptureCompleted(CameraCaptureResult result) {
                    completer.set(null);
                }

                @Override // androidx.camera.core.impl.CameraCaptureCallback
                public void onCaptureFailed(CameraCaptureFailure failure) {
                    String msg = "Capture request failed with reason " + failure.getReason();
                    completer.setException(new ImageCaptureException(2, msg, null));
                }

                @Override // androidx.camera.core.impl.CameraCaptureCallback
                public void onCaptureCancelled() {
                    completer.setException(new ImageCaptureException(3, "Capture request is cancelled because camera is closed", null));
                }
            });
            return "submitStillCapture";
        }

        private void applyStillCaptureTemplate(CaptureConfig.Builder configBuilder, CaptureConfig captureConfig) {
            int templateToModify = -1;
            if (this.mTemplate == 3 && !this.mIsLegacyDevice) {
                templateToModify = 4;
            } else if (captureConfig.getTemplateType() == -1 || captureConfig.getTemplateType() == 5) {
                templateToModify = 2;
            }
            if (templateToModify != -1) {
                configBuilder.setTemplateType(templateToModify);
            }
        }

        private void applyAeModeQuirk(CaptureConfig.Builder configBuilder) {
            Camera2ImplConfig.Builder impBuilder = new Camera2ImplConfig.Builder();
            impBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_MODE, 3);
            configBuilder.addImplementationOptions(impBuilder.build());
        }
    }

    static ListenableFuture<TotalCaptureResult> waitForResult(long waitTimeout, Camera2CameraControlImpl cameraControl, ResultListener.Checker checker) {
        ResultListener resultListener = new ResultListener(waitTimeout, checker);
        cameraControl.addCaptureResultListener(resultListener);
        return resultListener.getFuture();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean is3AConverged(TotalCaptureResult totalCaptureResult, boolean isTorchAsFlash) {
        boolean isAeReady;
        if (totalCaptureResult == null) {
            return false;
        }
        Camera2CameraCaptureResult captureResult = new Camera2CameraCaptureResult(totalCaptureResult);
        boolean isAfReady = captureResult.getAfMode() == CameraCaptureMetaData.AfMode.OFF || captureResult.getAfMode() == CameraCaptureMetaData.AfMode.UNKNOWN || AF_CONVERGED_STATE_SET.contains(captureResult.getAfState());
        boolean isAeModeOff = ((Integer) totalCaptureResult.get(CaptureResult.CONTROL_AE_MODE)).intValue() == 0;
        if (isTorchAsFlash) {
            isAeReady = isAeModeOff || AE_TORCH_AS_FLASH_CONVERGED_STATE_SET.contains(captureResult.getAeState());
        } else {
            isAeReady = isAeModeOff || AE_CONVERGED_STATE_SET.contains(captureResult.getAeState());
        }
        boolean isAwbModeOff = ((Integer) totalCaptureResult.get(CaptureResult.CONTROL_AWB_MODE)).intValue() == 0;
        boolean isAwbReady = isAwbModeOff || AWB_CONVERGED_STATE_SET.contains(captureResult.getAwbState());
        Logger.d(TAG, "checkCaptureResult, AE=" + captureResult.getAeState() + " AF =" + captureResult.getAfState() + " AWB=" + captureResult.getAwbState());
        return isAfReady && isAeReady && isAwbReady;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class AfTask implements PipelineTask {
        private final Camera2CameraControlImpl mCameraControl;
        private boolean mIsExecuted = false;

        AfTask(Camera2CameraControlImpl cameraControl) {
            this.mCameraControl = cameraControl;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            ListenableFuture<Boolean> ret = Futures.immediateFuture(true);
            if (captureResult == null) {
                return ret;
            }
            Integer afMode = (Integer) captureResult.get(CaptureResult.CONTROL_AF_MODE);
            if (afMode == null) {
                return ret;
            }
            switch (afMode.intValue()) {
                case 1:
                case 2:
                    Logger.d(Camera2CapturePipeline.TAG, "TriggerAf? AF mode auto");
                    Integer afState = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    if (afState != null && afState.intValue() == 0) {
                        Logger.d(Camera2CapturePipeline.TAG, "Trigger AF");
                        this.mIsExecuted = true;
                        this.mCameraControl.getFocusMeteringControl().triggerAf(null, false);
                        return ret;
                    }
                    break;
            }
            return ret;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return true;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            if (this.mIsExecuted) {
                Logger.d(Camera2CapturePipeline.TAG, "cancel TriggerAF");
                this.mCameraControl.getFocusMeteringControl().cancelAfAeTrigger(true, false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class TorchTask implements PipelineTask {
        private static final long CHECK_3A_WITH_TORCH_TIMEOUT_IN_NS = TimeUnit.SECONDS.toNanos(2);
        private final Camera2CameraControlImpl mCameraControl;
        private final Executor mExecutor;
        private final int mFlashMode;
        private boolean mIsExecuted = false;

        TorchTask(Camera2CameraControlImpl cameraControl, int flashMode, Executor executor) {
            this.mCameraControl = cameraControl;
            this.mFlashMode = flashMode;
            this.mExecutor = executor;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            if (Camera2CapturePipeline.isFlashRequired(this.mFlashMode, captureResult)) {
                if (this.mCameraControl.isTorchOn()) {
                    Logger.d(Camera2CapturePipeline.TAG, "Torch already on, not turn on");
                } else {
                    Logger.d(Camera2CapturePipeline.TAG, "Turn on torch");
                    this.mIsExecuted = true;
                    ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda0
                        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                        public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                            return Camera2CapturePipeline.TorchTask.this.m35x3ebf0c8c(completer);
                        }
                    });
                    return FutureChain.from(future).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda1
                        @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                        public final ListenableFuture apply(Object obj) {
                            return Camera2CapturePipeline.TorchTask.this.m36xf642040e((Void) obj);
                        }
                    }, this.mExecutor).transform(new Function() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda2
                        @Override // androidx.arch.core.util.Function
                        public final Object apply(Object obj) {
                            return Camera2CapturePipeline.TorchTask.lambda$preCapture$3((TotalCaptureResult) obj);
                        }
                    }, CameraXExecutors.directExecutor());
                }
            }
            return Futures.immediateFuture(false);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$preCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$TorchTask  reason: not valid java name */
        public /* synthetic */ Object m35x3ebf0c8c(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCameraControl.getTorchControl().m66xbd10d892(completer, true);
            return "TorchOn";
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$preCapture$2$androidx-camera-camera2-internal-Camera2CapturePipeline$TorchTask  reason: not valid java name */
        public /* synthetic */ ListenableFuture m36xf642040e(Void input) throws Exception {
            return Camera2CapturePipeline.waitForResult(CHECK_3A_WITH_TORCH_TIMEOUT_IN_NS, this.mCameraControl, new ResultListener.Checker() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$TorchTask$$ExternalSyntheticLambda3
                @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.ResultListener.Checker
                public final boolean check(TotalCaptureResult totalCaptureResult) {
                    boolean is3AConverged;
                    is3AConverged = Camera2CapturePipeline.is3AConverged(totalCaptureResult, true);
                    return is3AConverged;
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ Boolean lambda$preCapture$3(TotalCaptureResult input) {
            return false;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return this.mFlashMode == 0;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            if (this.mIsExecuted) {
                this.mCameraControl.getTorchControl().m66xbd10d892(null, false);
                Logger.d(Camera2CapturePipeline.TAG, "Turn off torch");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class AePreCaptureTask implements PipelineTask {
        private final Camera2CameraControlImpl mCameraControl;
        private final int mFlashMode;
        private boolean mIsExecuted = false;
        private final OverrideAeModeForStillCapture mOverrideAeModeForStillCapture;

        AePreCaptureTask(Camera2CameraControlImpl cameraControl, int flashMode, OverrideAeModeForStillCapture overrideAeModeForStillCapture) {
            this.mCameraControl = cameraControl;
            this.mFlashMode = flashMode;
            this.mOverrideAeModeForStillCapture = overrideAeModeForStillCapture;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public ListenableFuture<Boolean> preCapture(TotalCaptureResult captureResult) {
            if (Camera2CapturePipeline.isFlashRequired(this.mFlashMode, captureResult)) {
                Logger.d(Camera2CapturePipeline.TAG, "Trigger AE");
                this.mIsExecuted = true;
                ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda0
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return Camera2CapturePipeline.AePreCaptureTask.this.m29x78c3ed41(completer);
                    }
                });
                return FutureChain.from(future).transform(new Function() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$AePreCaptureTask$$ExternalSyntheticLambda1
                    @Override // androidx.arch.core.util.Function
                    public final Object apply(Object obj) {
                        return Camera2CapturePipeline.AePreCaptureTask.lambda$preCapture$1((Void) obj);
                    }
                }, CameraXExecutors.directExecutor());
            }
            return Futures.immediateFuture(false);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$preCapture$0$androidx-camera-camera2-internal-Camera2CapturePipeline$AePreCaptureTask  reason: not valid java name */
        public /* synthetic */ Object m29x78c3ed41(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCameraControl.getFocusMeteringControl().triggerAePrecapture(completer);
            this.mOverrideAeModeForStillCapture.onAePrecaptureStarted();
            return "AePreCapture";
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ Boolean lambda$preCapture$1(Void input) {
            return true;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public boolean isCaptureResultNeeded() {
            return this.mFlashMode == 0;
        }

        @Override // androidx.camera.camera2.internal.Camera2CapturePipeline.PipelineTask
        public void postCapture() {
            if (this.mIsExecuted) {
                Logger.d(Camera2CapturePipeline.TAG, "cancel TriggerAePreCapture");
                this.mCameraControl.getFocusMeteringControl().cancelAfAeTrigger(false, true);
                this.mOverrideAeModeForStillCapture.onAePrecaptureFinished();
            }
        }
    }

    static boolean isFlashRequired(int flashMode, TotalCaptureResult result) {
        switch (flashMode) {
            case 0:
                Integer aeState = result != null ? (Integer) result.get(CaptureResult.CONTROL_AE_STATE) : null;
                return aeState != null && aeState.intValue() == 4;
            case 1:
                return true;
            case 2:
                return false;
            default:
                throw new AssertionError(flashMode);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class ResultListener implements Camera2CameraControlImpl.CaptureResultListener {
        static final long NO_TIMEOUT = 0;
        private final Checker mChecker;
        private CallbackToFutureAdapter.Completer<TotalCaptureResult> mCompleter;
        private final long mTimeLimitNs;
        private final ListenableFuture<TotalCaptureResult> mFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CapturePipeline$ResultListener$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CapturePipeline.ResultListener.this.m34xaa6bbe23(completer);
            }
        });
        private volatile Long mTimestampOfFirstUpdateNs = null;

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes.dex */
        public interface Checker {
            boolean check(TotalCaptureResult totalCaptureResult);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$new$0$androidx-camera-camera2-internal-Camera2CapturePipeline$ResultListener  reason: not valid java name */
        public /* synthetic */ Object m34xaa6bbe23(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCompleter = completer;
            return "waitFor3AResult";
        }

        ResultListener(long timeLimitNs, Checker checker) {
            this.mTimeLimitNs = timeLimitNs;
            this.mChecker = checker;
        }

        public ListenableFuture<TotalCaptureResult> getFuture() {
            return this.mFuture;
        }

        @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
        public boolean onCaptureResult(TotalCaptureResult captureResult) {
            Long currentTimestampNs = (Long) captureResult.get(CaptureResult.SENSOR_TIMESTAMP);
            if (currentTimestampNs != null && this.mTimestampOfFirstUpdateNs == null) {
                this.mTimestampOfFirstUpdateNs = currentTimestampNs;
            }
            Long timestampOfFirstUpdateNs = this.mTimestampOfFirstUpdateNs;
            if (0 != this.mTimeLimitNs && timestampOfFirstUpdateNs != null && currentTimestampNs != null && currentTimestampNs.longValue() - timestampOfFirstUpdateNs.longValue() > this.mTimeLimitNs) {
                this.mCompleter.set(null);
                Logger.d(Camera2CapturePipeline.TAG, "Wait for capture result timeout, current:" + currentTimestampNs + " first: " + timestampOfFirstUpdateNs);
                return true;
            } else if (this.mChecker != null && !this.mChecker.check(captureResult)) {
                return false;
            } else {
                this.mCompleter.set(captureResult);
                return true;
            }
        }
    }

    private boolean isTorchAsFlash(int flashType) {
        return this.mUseTorchAsFlash.shouldUseTorchAsFlash() || this.mTemplate == 3 || flashType == 1;
    }
}
