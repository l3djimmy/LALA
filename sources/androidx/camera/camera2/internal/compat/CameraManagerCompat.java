package androidx.camera.camera2.internal.compat;

import android.content.Context;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.os.Build;
import android.os.Handler;
import android.util.ArrayMap;
import androidx.camera.camera2.internal.compat.ApiCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.core.impl.utils.MainThreadAsyncHandler;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class CameraManagerCompat {
    private final Map<String, CameraCharacteristicsCompat> mCameraCharacteristicsMap = new ArrayMap(4);
    private final CameraManagerCompatImpl mImpl;

    private CameraManagerCompat(CameraManagerCompatImpl impl) {
        this.mImpl = impl;
    }

    public static CameraManagerCompat from(Context context) {
        return from(context, MainThreadAsyncHandler.getInstance());
    }

    public static CameraManagerCompat from(Context context, Handler compatHandler) {
        return new CameraManagerCompat(CameraManagerCompatImpl.from(context, compatHandler));
    }

    public static CameraManagerCompat from(CameraManagerCompatImpl impl) {
        return new CameraManagerCompat(impl);
    }

    public String[] getCameraIdList() throws CameraAccessExceptionCompat {
        return this.mImpl.getCameraIdList();
    }

    public Set<Set<String>> getConcurrentCameraIds() throws CameraAccessExceptionCompat {
        return this.mImpl.getConcurrentCameraIds();
    }

    public void registerAvailabilityCallback(Executor executor, CameraManager.AvailabilityCallback callback) {
        this.mImpl.registerAvailabilityCallback(executor, callback);
    }

    public void unregisterAvailabilityCallback(CameraManager.AvailabilityCallback callback) {
        this.mImpl.unregisterAvailabilityCallback(callback);
    }

    public CameraCharacteristicsCompat getCameraCharacteristicsCompat(String cameraId) throws CameraAccessExceptionCompat {
        CameraCharacteristicsCompat characteristics;
        synchronized (this.mCameraCharacteristicsMap) {
            characteristics = this.mCameraCharacteristicsMap.get(cameraId);
            if (characteristics == null) {
                try {
                    characteristics = CameraCharacteristicsCompat.toCameraCharacteristicsCompat(this.mImpl.getCameraCharacteristics(cameraId), cameraId);
                    this.mCameraCharacteristicsMap.put(cameraId, characteristics);
                } catch (AssertionError e) {
                    throw new CameraAccessExceptionCompat(CameraAccessExceptionCompat.CAMERA_CHARACTERISTICS_CREATION_ERROR, e.getMessage(), e);
                }
            }
        }
        return characteristics;
    }

    public void openCamera(String cameraId, Executor executor, CameraDevice.StateCallback callback) throws CameraAccessExceptionCompat {
        this.mImpl.openCamera(cameraId, executor, callback);
    }

    public CameraManager unwrap() {
        return this.mImpl.getCameraManager();
    }

    /* loaded from: classes.dex */
    public interface CameraManagerCompatImpl {
        CameraCharacteristics getCameraCharacteristics(String str) throws CameraAccessExceptionCompat;

        String[] getCameraIdList() throws CameraAccessExceptionCompat;

        CameraManager getCameraManager();

        Set<Set<String>> getConcurrentCameraIds() throws CameraAccessExceptionCompat;

        void openCamera(String str, Executor executor, CameraDevice.StateCallback stateCallback) throws CameraAccessExceptionCompat;

        void registerAvailabilityCallback(Executor executor, CameraManager.AvailabilityCallback availabilityCallback);

        void unregisterAvailabilityCallback(CameraManager.AvailabilityCallback availabilityCallback);

        static CameraManagerCompatImpl from(Context context, Handler compatHandler) {
            if (Build.VERSION.SDK_INT >= 30) {
                return new CameraManagerCompatApi30Impl(context);
            }
            if (Build.VERSION.SDK_INT >= 29) {
                return new CameraManagerCompatApi29Impl(context);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return CameraManagerCompatApi28Impl.create(context);
            }
            return CameraManagerCompatBaseImpl.create(context, compatHandler);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class AvailabilityCallbackExecutorWrapper extends CameraManager.AvailabilityCallback {
        private final Executor mExecutor;
        final CameraManager.AvailabilityCallback mWrappedCallback;
        private final Object mLock = new Object();
        private boolean mDisabled = false;

        /* JADX INFO: Access modifiers changed from: package-private */
        public AvailabilityCallbackExecutorWrapper(Executor executor, CameraManager.AvailabilityCallback wrappedCallback) {
            this.mExecutor = executor;
            this.mWrappedCallback = wrappedCallback;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void setDisabled() {
            synchronized (this.mLock) {
                this.mDisabled = true;
            }
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraAccessPrioritiesChanged() {
            synchronized (this.mLock) {
                if (!this.mDisabled) {
                    this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraManagerCompat$AvailabilityCallbackExecutorWrapper$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraManagerCompat.AvailabilityCallbackExecutorWrapper.this.m92x9626b29c();
                        }
                    });
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onCameraAccessPrioritiesChanged$0$androidx-camera-camera2-internal-compat-CameraManagerCompat$AvailabilityCallbackExecutorWrapper  reason: not valid java name */
        public /* synthetic */ void m92x9626b29c() {
            ApiCompat.Api29Impl.onCameraAccessPrioritiesChanged(this.mWrappedCallback);
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraAvailable(final String cameraId) {
            synchronized (this.mLock) {
                if (!this.mDisabled) {
                    this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraManagerCompat$AvailabilityCallbackExecutorWrapper$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraManagerCompat.AvailabilityCallbackExecutorWrapper.this.m93x4d412d8(cameraId);
                        }
                    });
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onCameraAvailable$1$androidx-camera-camera2-internal-compat-CameraManagerCompat$AvailabilityCallbackExecutorWrapper  reason: not valid java name */
        public /* synthetic */ void m93x4d412d8(String cameraId) {
            this.mWrappedCallback.onCameraAvailable(cameraId);
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraUnavailable(final String cameraId) {
            synchronized (this.mLock) {
                if (!this.mDisabled) {
                    this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.compat.CameraManagerCompat$AvailabilityCallbackExecutorWrapper$$ExternalSyntheticLambda2
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraManagerCompat.AvailabilityCallbackExecutorWrapper.this.m94x572f6ee0(cameraId);
                        }
                    });
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onCameraUnavailable$2$androidx-camera-camera2-internal-compat-CameraManagerCompat$AvailabilityCallbackExecutorWrapper  reason: not valid java name */
        public /* synthetic */ void m94x572f6ee0(String cameraId) {
            this.mWrappedCallback.onCameraUnavailable(cameraId);
        }
    }
}
