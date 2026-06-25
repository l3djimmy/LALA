package androidx.camera.camera2.internal;

import android.graphics.Rect;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.util.ArrayMap;
import android.util.Rational;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.workaround.AeFpsRange;
import androidx.camera.camera2.internal.compat.workaround.AutoFlashAEModeDisabler;
import androidx.camera.camera2.interop.Camera2CameraControl;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.CameraControl;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicLong;
/* loaded from: classes.dex */
public class Camera2CameraControlImpl implements CameraControlInternal {
    private static final int DEFAULT_TEMPLATE = 1;
    private static final String TAG = "Camera2CameraControlImp";
    static final String TAG_SESSION_UPDATE_ID = "CameraControlSessionUpdateId";
    private final AeFpsRange mAeFpsRange;
    private final AutoFlashAEModeDisabler mAutoFlashAEModeDisabler;
    private final Camera2CameraControl mCamera2CameraControl;
    private final Camera2CapturePipeline mCamera2CapturePipeline;
    private final CameraCaptureCallbackSet mCameraCaptureCallbackSet;
    private final CameraCharacteristicsCompat mCameraCharacteristics;
    private final CameraControlInternal.ControlUpdateCallback mControlUpdateCallback;
    private long mCurrentSessionUpdateId;
    final Executor mExecutor;
    private final ExposureControl mExposureControl;
    private volatile int mFlashMode;
    private volatile ListenableFuture<Void> mFlashModeChangeSessionUpdateFuture;
    private final FocusMeteringControl mFocusMeteringControl;
    private volatile boolean mIsTorchOn;
    private final Object mLock;
    private final AtomicLong mNextSessionUpdateId;
    final CameraControlSessionCallback mSessionCallback;
    private final SessionConfig.Builder mSessionConfigBuilder;
    private int mTemplate;
    private final TorchControl mTorchControl;
    private int mUseCount;
    private final ZoomControl mZoomControl;
    ZslControl mZslControl;

    /* loaded from: classes.dex */
    public interface CaptureResultListener {
        boolean onCaptureResult(TotalCaptureResult totalCaptureResult);
    }

    Camera2CameraControlImpl(CameraCharacteristicsCompat cameraCharacteristics, ScheduledExecutorService scheduler, Executor executor, CameraControlInternal.ControlUpdateCallback controlUpdateCallback) {
        this(cameraCharacteristics, scheduler, executor, controlUpdateCallback, new Quirks(new ArrayList()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Camera2CameraControlImpl(CameraCharacteristicsCompat cameraCharacteristics, ScheduledExecutorService scheduler, Executor executor, CameraControlInternal.ControlUpdateCallback controlUpdateCallback, Quirks cameraQuirks) {
        this.mLock = new Object();
        this.mSessionConfigBuilder = new SessionConfig.Builder();
        this.mUseCount = 0;
        this.mIsTorchOn = false;
        this.mFlashMode = 2;
        this.mNextSessionUpdateId = new AtomicLong(0L);
        this.mFlashModeChangeSessionUpdateFuture = Futures.immediateFuture(null);
        this.mTemplate = 1;
        this.mCurrentSessionUpdateId = 0L;
        this.mCameraCaptureCallbackSet = new CameraCaptureCallbackSet();
        this.mCameraCharacteristics = cameraCharacteristics;
        this.mControlUpdateCallback = controlUpdateCallback;
        this.mExecutor = executor;
        this.mSessionCallback = new CameraControlSessionCallback(this.mExecutor);
        this.mSessionConfigBuilder.setTemplateType(this.mTemplate);
        this.mSessionConfigBuilder.addRepeatingCameraCaptureCallback(CaptureCallbackContainer.create(this.mSessionCallback));
        this.mSessionConfigBuilder.addRepeatingCameraCaptureCallback(this.mCameraCaptureCallbackSet);
        this.mExposureControl = new ExposureControl(this, this.mCameraCharacteristics, this.mExecutor);
        this.mFocusMeteringControl = new FocusMeteringControl(this, scheduler, this.mExecutor, cameraQuirks);
        this.mZoomControl = new ZoomControl(this, this.mCameraCharacteristics, this.mExecutor);
        this.mTorchControl = new TorchControl(this, this.mCameraCharacteristics, this.mExecutor);
        this.mZslControl = new ZslControlImpl(this.mCameraCharacteristics);
        this.mAeFpsRange = new AeFpsRange(cameraQuirks);
        this.mAutoFlashAEModeDisabler = new AutoFlashAEModeDisabler(cameraQuirks);
        this.mCamera2CameraControl = new Camera2CameraControl(this, this.mExecutor);
        this.mCamera2CapturePipeline = new Camera2CapturePipeline(this, this.mCameraCharacteristics, cameraQuirks, this.mExecutor);
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda10
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.this.m5xc707fb02();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ void m5xc707fb02() {
        addCaptureResultListener(this.mCamera2CameraControl.getCaptureRequestListener());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void incrementUseCount() {
        synchronized (this.mLock) {
            this.mUseCount++;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void decrementUseCount() {
        synchronized (this.mLock) {
            if (this.mUseCount == 0) {
                throw new IllegalStateException("Decrementing use count occurs more times than incrementing");
            }
            this.mUseCount--;
        }
    }

    int getUseCount() {
        int i;
        synchronized (this.mLock) {
            i = this.mUseCount;
        }
        return i;
    }

    public ZoomControl getZoomControl() {
        return this.mZoomControl;
    }

    public FocusMeteringControl getFocusMeteringControl() {
        return this.mFocusMeteringControl;
    }

    public TorchControl getTorchControl() {
        return this.mTorchControl;
    }

    public ExposureControl getExposureControl() {
        return this.mExposureControl;
    }

    public ZslControl getZslControl() {
        return this.mZslControl;
    }

    public Camera2CameraControl getCamera2CameraControl() {
        return this.mCamera2CameraControl;
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void addInteropConfig(Config config) {
        ListenableFuture<Void> future = this.mCamera2CameraControl.addCaptureRequestOptions(CaptureRequestOptions.Builder.from(config).build());
        future.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.lambda$addInteropConfig$1();
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$addInteropConfig$1() {
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void clearInteropConfig() {
        ListenableFuture<Void> future = this.mCamera2CameraControl.clearCaptureRequestOptions();
        future.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.lambda$clearInteropConfig$2();
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$clearInteropConfig$2() {
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public Config getInteropConfig() {
        return this.mCamera2CameraControl.getCamera2ImplConfig();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setActive(boolean isActive) {
        this.mFocusMeteringControl.setActive(isActive);
        this.mZoomControl.setActive(isActive);
        this.mTorchControl.setActive(isActive);
        this.mExposureControl.setActive(isActive);
        this.mCamera2CameraControl.setActive(isActive);
    }

    public void setPreviewAspectRatio(Rational previewAspectRatio) {
        this.mFocusMeteringControl.setPreviewAspectRatio(previewAspectRatio);
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
        if (!isControlInUse()) {
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        return Futures.nonCancellationPropagating(this.mFocusMeteringControl.startFocusAndMetering(action));
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> cancelFocusAndMetering() {
        if (!isControlInUse()) {
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        return Futures.nonCancellationPropagating(this.mFocusMeteringControl.cancelFocusAndMetering());
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> setZoomRatio(float ratio) {
        if (!isControlInUse()) {
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        return Futures.nonCancellationPropagating(this.mZoomControl.setZoomRatio(ratio));
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> setLinearZoom(float linearZoom) {
        if (!isControlInUse()) {
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        return Futures.nonCancellationPropagating(this.mZoomControl.setLinearZoom(linearZoom));
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public int getFlashMode() {
        return this.mFlashMode;
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void setFlashMode(int flashMode) {
        if (!isControlInUse()) {
            Logger.w(TAG, "Camera is not active.");
            return;
        }
        this.mFlashMode = flashMode;
        ZslControl zslControl = this.mZslControl;
        boolean z = true;
        if (this.mFlashMode != 1 && this.mFlashMode != 0) {
            z = false;
        }
        zslControl.setZslDisabledByFlashMode(z);
        this.mFlashModeChangeSessionUpdateFuture = updateSessionConfigAsync();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void addZslConfig(SessionConfig.Builder sessionConfigBuilder) {
        this.mZslControl.addZslConfig(sessionConfigBuilder);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public void setZslDisabledByUserCaseConfig(boolean disabled) {
        this.mZslControl.setZslDisabledByUserCaseConfig(disabled);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public boolean isZslDisabledByByUserCaseConfig() {
        return this.mZslControl.isZslDisabledByUserCaseConfig();
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Void> enableTorch(boolean torch) {
        if (!isControlInUse()) {
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        return Futures.nonCancellationPropagating(this.mTorchControl.enableTorch(torch));
    }

    private ListenableFuture<Void> waitForSessionUpdateId(final long sessionUpdateIdToWait) {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda4
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraControlImpl.this.m10x20143706(sessionUpdateIdToWait, completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$waitForSessionUpdateId$4$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ Object m10x20143706(final long sessionUpdateIdToWait, final CallbackToFutureAdapter.Completer completer) throws Exception {
        addCaptureResultListener(new CaptureResultListener() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda5
            @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
            public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                return Camera2CameraControlImpl.lambda$waitForSessionUpdateId$3(sessionUpdateIdToWait, completer, totalCaptureResult);
            }
        });
        return "waitForSessionUpdateId:" + sessionUpdateIdToWait;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$waitForSessionUpdateId$3(long sessionUpdateIdToWait, CallbackToFutureAdapter.Completer completer, TotalCaptureResult captureResult) {
        boolean updated = isSessionUpdated(captureResult, sessionUpdateIdToWait);
        if (updated) {
            completer.set(null);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isSessionUpdated(TotalCaptureResult captureResult, long sessionUpdateId) {
        Long tagLong;
        if (captureResult.getRequest() == null) {
            return false;
        }
        Object tag = captureResult.getRequest().getTag();
        if (!(tag instanceof TagBundle) || (tagLong = (Long) ((TagBundle) tag).getTag(TAG_SESSION_UPDATE_ID)) == null) {
            return false;
        }
        long sessionUpdateIdInCaptureResult = tagLong.longValue();
        return sessionUpdateIdInCaptureResult >= sessionUpdateId;
    }

    @Override // androidx.camera.core.CameraControl
    public ListenableFuture<Integer> setExposureCompensationIndex(int exposure) {
        if (!isControlInUse()) {
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        return this.mExposureControl.setExposureCompensationIndex(exposure);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public ListenableFuture<List<Void>> submitStillCaptureRequests(final List<CaptureConfig> captureConfigs, final int captureMode, final int flashType) {
        if (!isControlInUse()) {
            Logger.w(TAG, "Camera is not active.");
            return Futures.immediateFailedFuture(new CameraControl.OperationCanceledException("Camera is not active."));
        }
        final int flashMode = getFlashMode();
        return FutureChain.from(Futures.nonCancellationPropagating(this.mFlashModeChangeSessionUpdateFuture)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return Camera2CameraControlImpl.this.m7xd133171b(captureConfigs, captureMode, flashMode, flashType, (Void) obj);
            }
        }, this.mExecutor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$submitStillCaptureRequests$5$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ ListenableFuture m7xd133171b(List captureConfigs, int captureMode, int flashMode, int flashType, Void v) throws Exception {
        return this.mCamera2CapturePipeline.submitStillCaptures(captureConfigs, captureMode, flashMode, flashType);
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public SessionConfig getSessionConfig() {
        this.mSessionConfigBuilder.setTemplateType(this.mTemplate);
        this.mSessionConfigBuilder.setImplementationOptions(getSessionOptions());
        Object tag = this.mCamera2CameraControl.getCamera2ImplConfig().getCaptureRequestTag(null);
        if (tag != null && (tag instanceof Integer)) {
            this.mSessionConfigBuilder.addTag(Camera2CameraControl.TAG_KEY, tag);
        }
        this.mSessionConfigBuilder.addTag(TAG_SESSION_UPDATE_ID, Long.valueOf(this.mCurrentSessionUpdateId));
        return this.mSessionConfigBuilder.build();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTemplate(int template) {
        this.mTemplate = template;
        this.mFocusMeteringControl.setTemplate(this.mTemplate);
        this.mCamera2CapturePipeline.setTemplate(this.mTemplate);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resetTemplate() {
        setTemplate(1);
    }

    private boolean isControlInUse() {
        return getUseCount() > 0;
    }

    public void updateSessionConfig() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.this.updateSessionConfigSynchronous();
            }
        });
    }

    ListenableFuture<Void> updateSessionConfigAsync() {
        ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda7
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraControlImpl.this.m9x6775df50(completer);
            }
        });
        return Futures.nonCancellationPropagating(future);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$updateSessionConfigAsync$7$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ Object m9x6775df50(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.this.m8x56c0128f(completer);
            }
        });
        return "updateSessionConfigAsync";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$updateSessionConfigAsync$6$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ void m8x56c0128f(CallbackToFutureAdapter.Completer completer) {
        long sessionUpdateId = updateSessionConfigSynchronous();
        Futures.propagate(waitForSessionUpdateId(sessionUpdateId), completer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long updateSessionConfigSynchronous() {
        this.mCurrentSessionUpdateId = this.mNextSessionUpdateId.getAndIncrement();
        this.mControlUpdateCallback.onCameraControlUpdateSessionConfig();
        return this.mCurrentSessionUpdateId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Rect getCropSensorRegion() {
        return this.mZoomControl.getCropSensorRegion();
    }

    @Override // androidx.camera.core.impl.CameraControlInternal
    public Rect getSensorRect() {
        return (Rect) Preconditions.checkNotNull((Rect) this.mCameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeCaptureResultListener(CaptureResultListener listener) {
        this.mSessionCallback.removeListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addCaptureResultListener(CaptureResultListener listener) {
        this.mSessionCallback.addListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addSessionCameraCaptureCallback(final Executor executor, final CameraCaptureCallback cameraCaptureCallback) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.this.m4x48c3417b(executor, cameraCaptureCallback);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$addSessionCameraCaptureCallback$8$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ void m4x48c3417b(Executor executor, CameraCaptureCallback cameraCaptureCallback) {
        this.mCameraCaptureCallbackSet.addCaptureCallback(executor, cameraCaptureCallback);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeSessionCameraCaptureCallback(final CameraCaptureCallback cameraCaptureCallback) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraControlImpl.this.m6xd0890cf9(cameraCaptureCallback);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$removeSessionCameraCaptureCallback$9$androidx-camera-camera2-internal-Camera2CameraControlImpl  reason: not valid java name */
    public /* synthetic */ void m6xd0890cf9(CameraCaptureCallback cameraCaptureCallback) {
        this.mCameraCaptureCallbackSet.removeCaptureCallback(cameraCaptureCallback);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void enableTorchInternal(boolean torch) {
        this.mIsTorchOn = torch;
        if (!torch) {
            CaptureConfig.Builder singleRequestBuilder = new CaptureConfig.Builder();
            singleRequestBuilder.setTemplateType(this.mTemplate);
            singleRequestBuilder.setUseRepeatingSurface(true);
            Camera2ImplConfig.Builder configBuilder = new Camera2ImplConfig.Builder();
            configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(getSupportedAeMode(1)));
            configBuilder.setCaptureRequestOption(CaptureRequest.FLASH_MODE, 0);
            singleRequestBuilder.addImplementationOptions(configBuilder.build());
            submitCaptureRequestsInternal(Collections.singletonList(singleRequestBuilder.build()));
        }
        updateSessionConfigSynchronous();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isTorchOn() {
        return this.mIsTorchOn;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void submitCaptureRequestsInternal(List<CaptureConfig> captureConfigs) {
        this.mControlUpdateCallback.onCameraControlCaptureRequests(captureConfigs);
    }

    Config getSessionOptions() {
        Camera2ImplConfig.Builder builder = new Camera2ImplConfig.Builder();
        builder.setCaptureRequestOption(CaptureRequest.CONTROL_MODE, 1);
        this.mFocusMeteringControl.addFocusMeteringOptions(builder);
        this.mAeFpsRange.addAeFpsRangeOptions(builder);
        this.mZoomControl.addZoomOption(builder);
        int aeMode = 1;
        if (this.mIsTorchOn) {
            builder.setCaptureRequestOption(CaptureRequest.FLASH_MODE, 2);
        } else {
            switch (this.mFlashMode) {
                case 0:
                    aeMode = this.mAutoFlashAEModeDisabler.getCorrectedAeMode(2);
                    break;
                case 1:
                    aeMode = 3;
                    break;
                case 2:
                    aeMode = 1;
                    break;
            }
        }
        builder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(getSupportedAeMode(aeMode)));
        builder.setCaptureRequestOption(CaptureRequest.CONTROL_AWB_MODE, Integer.valueOf(getSupportedAwbMode(1)));
        this.mExposureControl.setCaptureRequestOption(builder);
        Config currentConfig = this.mCamera2CameraControl.getCamera2ImplConfig();
        for (Config.Option<?> option : currentConfig.listOptions()) {
            builder.getMutableConfig().insertOption(option, Config.OptionPriority.ALWAYS_OVERRIDE, currentConfig.retrieveOption(option));
        }
        return builder.build();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getSupportedAfMode(int preferredMode) {
        int[] modes = (int[]) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
        if (modes == null) {
            return 0;
        }
        if (isModeInList(preferredMode, modes)) {
            return preferredMode;
        }
        if (isModeInList(4, modes)) {
            return 4;
        }
        if (!isModeInList(1, modes)) {
            return 0;
        }
        return 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getSupportedAeMode(int preferredMode) {
        int[] modes = (int[]) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_MODES);
        if (modes == null) {
            return 0;
        }
        if (isModeInList(preferredMode, modes)) {
            return preferredMode;
        }
        if (!isModeInList(1, modes)) {
            return 0;
        }
        return 1;
    }

    private int getSupportedAwbMode(int preferredMode) {
        int[] modes = (int[]) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES);
        if (modes == null) {
            return 0;
        }
        if (isModeInList(preferredMode, modes)) {
            return preferredMode;
        }
        if (!isModeInList(1, modes)) {
            return 0;
        }
        return 1;
    }

    private boolean isModeInList(int mode, int[] modeList) {
        for (int m : modeList) {
            if (mode == m) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getMaxAfRegionCount() {
        Integer count = (Integer) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AF);
        if (count == null) {
            return 0;
        }
        return count.intValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getMaxAeRegionCount() {
        Integer count = (Integer) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AE);
        if (count == null) {
            return 0;
        }
        return count.intValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getMaxAwbRegionCount() {
        Integer count = (Integer) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_MAX_REGIONS_AWB);
        if (count == null) {
            return 0;
        }
        return count.intValue();
    }

    long getCurrentSessionUpdateId() {
        return this.mCurrentSessionUpdateId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class CameraControlSessionCallback extends CameraCaptureSession.CaptureCallback {
        private final Executor mExecutor;
        final Set<CaptureResultListener> mResultListeners = new HashSet();

        CameraControlSessionCallback(Executor executor) {
            this.mExecutor = executor;
        }

        void addListener(CaptureResultListener listener) {
            this.mResultListeners.add(listener);
        }

        void removeListener(CaptureResultListener listener) {
            this.mResultListeners.remove(listener);
        }

        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, final TotalCaptureResult result) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$CameraControlSessionCallback$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraControlImpl.CameraControlSessionCallback.this.m11xf57ef947(result);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onCaptureCompleted$0$androidx-camera-camera2-internal-Camera2CameraControlImpl$CameraControlSessionCallback  reason: not valid java name */
        public /* synthetic */ void m11xf57ef947(TotalCaptureResult result) {
            Set<CaptureResultListener> removeSet = new HashSet<>();
            for (CaptureResultListener listener : this.mResultListeners) {
                boolean isFinished = listener.onCaptureResult(result);
                if (isFinished) {
                    removeSet.add(listener);
                }
            }
            if (!removeSet.isEmpty()) {
                this.mResultListeners.removeAll(removeSet);
            }
        }
    }

    /* loaded from: classes.dex */
    static final class CameraCaptureCallbackSet extends CameraCaptureCallback {
        Set<CameraCaptureCallback> mCallbacks = new HashSet();
        Map<CameraCaptureCallback, Executor> mCallbackExecutors = new ArrayMap();

        CameraCaptureCallbackSet() {
        }

        void addCaptureCallback(Executor executor, CameraCaptureCallback callback) {
            this.mCallbacks.add(callback);
            this.mCallbackExecutors.put(callback, executor);
        }

        void removeCaptureCallback(CameraCaptureCallback callback) {
            this.mCallbacks.remove(callback);
            this.mCallbackExecutors.remove(callback);
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(final CameraCaptureResult cameraCaptureResult) {
            for (final CameraCaptureCallback callback : this.mCallbacks) {
                try {
                    this.mCallbackExecutors.get(callback).execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraCaptureCallback.this.onCaptureCompleted(cameraCaptureResult);
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(Camera2CameraControlImpl.TAG, "Executor rejected to invoke onCaptureCompleted.", e);
                }
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureFailed(final CameraCaptureFailure failure) {
            for (final CameraCaptureCallback callback : this.mCallbacks) {
                try {
                    this.mCallbackExecutors.get(callback).execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraCaptureCallback.this.onCaptureFailed(failure);
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(Camera2CameraControlImpl.TAG, "Executor rejected to invoke onCaptureFailed.", e);
                }
            }
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCancelled() {
            for (final CameraCaptureCallback callback : this.mCallbacks) {
                try {
                    this.mCallbackExecutors.get(callback).execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraControlImpl$CameraCaptureCallbackSet$$ExternalSyntheticLambda2
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraCaptureCallback.this.onCaptureCancelled();
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(Camera2CameraControlImpl.TAG, "Executor rejected to invoke onCaptureCancelled.", e);
                }
            }
        }
    }
}
