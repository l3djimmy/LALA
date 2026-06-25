package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import androidx.camera.camera2.internal.Camera2CameraControlImpl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.workaround.CameraCharacteristicsProvider;
import androidx.camera.camera2.internal.compat.workaround.FlashAvailabilityChecker;
import androidx.camera.core.CameraControl;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class TorchControl {
    static final int DEFAULT_TORCH_STATE = 0;
    private static final String TAG = "TorchControl";
    private final Camera2CameraControlImpl mCamera2CameraControlImpl;
    CallbackToFutureAdapter.Completer<Void> mEnableTorchCompleter;
    private final Executor mExecutor;
    private final boolean mHasFlashUnit;
    private boolean mIsActive;
    boolean mTargetTorchEnabled;
    private final MutableLiveData<Integer> mTorchState;

    /* JADX INFO: Access modifiers changed from: package-private */
    public TorchControl(Camera2CameraControlImpl camera2CameraControlImpl, final CameraCharacteristicsCompat cameraCharacteristics, Executor executor) {
        this.mCamera2CameraControlImpl = camera2CameraControlImpl;
        this.mExecutor = executor;
        Objects.requireNonNull(cameraCharacteristics);
        this.mHasFlashUnit = FlashAvailabilityChecker.isFlashAvailable(new CameraCharacteristicsProvider() { // from class: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda1
            @Override // androidx.camera.camera2.internal.compat.workaround.CameraCharacteristicsProvider
            public final Object get(CameraCharacteristics.Key key) {
                return CameraCharacteristicsCompat.this.get(key);
            }
        });
        this.mTorchState = new MutableLiveData<>(0);
        Camera2CameraControlImpl.CaptureResultListener captureResultListener = new Camera2CameraControlImpl.CaptureResultListener() { // from class: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda2
            @Override // androidx.camera.camera2.internal.Camera2CameraControlImpl.CaptureResultListener
            public final boolean onCaptureResult(TotalCaptureResult totalCaptureResult) {
                return TorchControl.this.m68lambda$new$0$androidxcameracamera2internalTorchControl(totalCaptureResult);
            }
        };
        this.mCamera2CameraControlImpl.addCaptureResultListener(captureResultListener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-camera2-internal-TorchControl  reason: not valid java name */
    public /* synthetic */ boolean m68lambda$new$0$androidxcameracamera2internalTorchControl(TotalCaptureResult captureResult) {
        if (this.mEnableTorchCompleter != null) {
            CaptureRequest captureRequest = captureResult.getRequest();
            Integer flashMode = (Integer) captureRequest.get(CaptureRequest.FLASH_MODE);
            boolean torchEnabled = flashMode != null && flashMode.intValue() == 2;
            if (torchEnabled == this.mTargetTorchEnabled) {
                this.mEnableTorchCompleter.set(null);
                this.mEnableTorchCompleter = null;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setActive(boolean isActive) {
        if (this.mIsActive == isActive) {
            return;
        }
        this.mIsActive = isActive;
        if (!isActive) {
            if (this.mTargetTorchEnabled) {
                this.mTargetTorchEnabled = false;
                this.mCamera2CameraControlImpl.enableTorchInternal(false);
                setLiveDataValue(this.mTorchState, 0);
            }
            if (this.mEnableTorchCompleter != null) {
                this.mEnableTorchCompleter.setException(new CameraControl.OperationCanceledException("Camera is not active."));
                this.mEnableTorchCompleter = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<Void> enableTorch(final boolean enabled) {
        if (!this.mHasFlashUnit) {
            Logger.d(TAG, "Unable to enableTorch due to there is no flash unit.");
            return Futures.immediateFailedFuture(new IllegalStateException("No flash unit"));
        }
        setLiveDataValue(this.mTorchState, Integer.valueOf(enabled ? 1 : 0));
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return TorchControl.this.m67x328afed3(enabled, completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$enableTorch$2$androidx-camera-camera2-internal-TorchControl  reason: not valid java name */
    public /* synthetic */ Object m67x328afed3(final boolean enabled, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.TorchControl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                TorchControl.this.m66xbd10d892(completer, enabled);
            }
        });
        return "enableTorch: " + enabled;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LiveData<Integer> getTorchState() {
        return this.mTorchState;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: enableTorchInternal */
    public void m66xbd10d892(CallbackToFutureAdapter.Completer<Void> completer, boolean enabled) {
        if (!this.mHasFlashUnit) {
            if (completer != null) {
                completer.setException(new IllegalStateException("No flash unit"));
            }
        } else if (!this.mIsActive) {
            setLiveDataValue(this.mTorchState, 0);
            if (completer != null) {
                completer.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            }
        } else {
            this.mTargetTorchEnabled = enabled;
            this.mCamera2CameraControlImpl.enableTorchInternal(enabled);
            setLiveDataValue(this.mTorchState, Integer.valueOf(enabled ? 1 : 0));
            if (this.mEnableTorchCompleter != null) {
                this.mEnableTorchCompleter.setException(new CameraControl.OperationCanceledException("There is a new enableTorch being set"));
            }
            this.mEnableTorchCompleter = completer;
        }
    }

    private <T> void setLiveDataValue(MutableLiveData<T> liveData, T value) {
        if (Threads.isMainThread()) {
            liveData.setValue(value);
        } else {
            liveData.postValue(value);
        }
    }
}
