package androidx.camera.camera2.internal;

import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.util.Range;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.CameraControl;
import androidx.camera.core.ExposureState;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class ExposureControl {
    private static final int DEFAULT_EXPOSURE_COMPENSATION = 0;
    private final Camera2CameraControlImpl mCameraControl;
    private final Executor mExecutor;
    private final ExposureStateImpl mExposureStateImpl;
    private boolean mIsActive = false;
    private Camera2CameraControlImpl.CaptureResultListener mRunningCaptureResultListener;
    private CallbackToFutureAdapter.Completer<Integer> mRunningCompleter;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ExposureControl(Camera2CameraControlImpl cameraControl, CameraCharacteristicsCompat cameraCharacteristics, Executor executor) {
        this.mCameraControl = cameraControl;
        this.mExposureStateImpl = new ExposureStateImpl(cameraCharacteristics, 0);
        this.mExecutor = executor;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ExposureState getDefaultExposureState(CameraCharacteristicsCompat cameraCharacteristics) {
        return new ExposureStateImpl(cameraCharacteristics, 0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setActive(boolean isActive) {
        if (isActive == this.mIsActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!this.mIsActive) {
            this.mExposureStateImpl.setExposureCompensationIndex(0);
            clearRunningTask();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCaptureRequestOption(Camera2ImplConfig.Builder configBuilder) {
        configBuilder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(this.mExposureStateImpl.getExposureCompensationIndex()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ExposureState getExposureState() {
        return this.mExposureStateImpl;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<Integer> setExposureCompensationIndex(final int exposure) {
        if (!this.mExposureStateImpl.isExposureCompensationSupported()) {
            return Futures.immediateFailedFuture(new IllegalArgumentException("ExposureCompensation is not supported"));
        }
        Range<Integer> range = this.mExposureStateImpl.getExposureCompensationRange();
        if (!range.contains((Range<Integer>) Integer.valueOf(exposure))) {
            return Futures.immediateFailedFuture(new IllegalArgumentException("Requested ExposureCompensation " + exposure + " is not within valid range [" + range.getUpper() + ".." + range.getLower() + "]"));
        }
        this.mExposureStateImpl.setExposureCompensationIndex(exposure);
        return Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.ExposureControl$$ExternalSyntheticLambda2
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return ExposureControl.this.m41x8eaf9914(exposure, completer);
            }
        }));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setExposureCompensationIndex$2$androidx-camera-camera2-internal-ExposureControl  reason: not valid java name */
    public /* synthetic */ Object m41x8eaf9914(final int exposure, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ExposureControl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ExposureControl.this.m40x9d05f2f5(completer, exposure);
            }
        });
        return "setExposureCompensationIndex[" + exposure + "]";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setExposureCompensationIndex$1$androidx-camera-camera2-internal-ExposureControl  reason: not valid java name */
    public /* synthetic */ void m40x9d05f2f5(final CallbackToFutureAdapter.Completer completer, final int exposure) {
        if (!this.mIsActive) {
            this.mExposureStateImpl.setExposureCompensationIndex(0);
            completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            return;
        }
        clearRunningTask();
        Preconditions.checkState(this.mRunningCompleter == null, "mRunningCompleter should be null when starting set a new exposure compensation value");
        Preconditions.checkState(this.mRunningCaptureResultListener == null, "mRunningCaptureResultListener should be null when starting set a new exposure compensation value");
        this.mRunningCaptureResultListener = new Camera2CameraControlImpl.CaptureResultListener() { // from class: androidx.camera.camera2.internal.ExposureControl$$ExternalSyntheticLambda0
            @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
            public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                return ExposureControl.lambda$setExposureCompensationIndex$0(exposure, completer, totalCaptureResult);
            }
        };
        this.mRunningCompleter = completer;
        this.mCameraControl.addCaptureResultListener(this.mRunningCaptureResultListener);
        this.mCameraControl.updateSessionConfigSynchronous();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$setExposureCompensationIndex$0(int exposure, CallbackToFutureAdapter.Completer completer, TotalCaptureResult captureResult) {
        Integer state = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
        Integer evResult = (Integer) captureResult.get(CaptureResult.CONTROL_AE_EXPOSURE_COMPENSATION);
        if (state != null && evResult != null) {
            switch (state.intValue()) {
                case 2:
                case 3:
                case 4:
                    if (evResult.intValue() == exposure) {
                        completer.set(Integer.valueOf(exposure));
                        return true;
                    }
                    return false;
                default:
                    return false;
            }
        } else if (evResult != null && evResult.intValue() == exposure) {
            completer.set(Integer.valueOf(exposure));
            return true;
        } else {
            return false;
        }
    }

    private void clearRunningTask() {
        if (this.mRunningCompleter != null) {
            this.mRunningCompleter.setException(new CameraControl.OperationCanceledException("Cancelled by another setExposureCompensationIndex()"));
            this.mRunningCompleter = null;
        }
        if (this.mRunningCaptureResultListener != null) {
            this.mCameraControl.removeCaptureResultListener(this.mRunningCaptureResultListener);
            this.mRunningCaptureResultListener = null;
        }
    }
}
