package androidx.camera.camera2.internal;

import android.content.Context;
import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.concurrent.Camera2CameraCoordinator;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.InitializationException;
import androidx.camera.core.Logger;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraFactory;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.camera.core.impl.CameraThreadConfig;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public final class Camera2CameraFactory implements CameraFactory {
    private static final int DEFAULT_ALLOWED_CONCURRENT_OPEN_CAMERAS = 1;
    private static final String TAG = "Camera2CameraFactory";
    private final List<String> mAvailableCameraIds;
    private final CameraCoordinator mCameraCoordinator;
    private final Map<String, Camera2CameraInfoImpl> mCameraInfos = new HashMap();
    private final CameraManagerCompat mCameraManager;
    private final CameraStateRegistry mCameraStateRegistry;
    private final DisplayInfoManager mDisplayInfoManager;
    private final CameraThreadConfig mThreadConfig;

    public Camera2CameraFactory(Context context, CameraThreadConfig threadConfig, CameraSelector availableCamerasSelector) throws InitializationException {
        this.mThreadConfig = threadConfig;
        this.mCameraManager = CameraManagerCompat.from(context, this.mThreadConfig.getSchedulerHandler());
        this.mDisplayInfoManager = DisplayInfoManager.getInstance(context);
        List<String> optimizedCameraIds = CameraSelectionOptimizer.getSelectedAvailableCameraIds(this, availableCamerasSelector);
        this.mAvailableCameraIds = getBackwardCompatibleCameraIds(optimizedCameraIds);
        this.mCameraCoordinator = new Camera2CameraCoordinator(this.mCameraManager);
        this.mCameraStateRegistry = new CameraStateRegistry(this.mCameraCoordinator, 1);
        this.mCameraCoordinator.addListener(this.mCameraStateRegistry);
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public CameraInternal getCamera(String cameraId) throws CameraUnavailableException {
        if (this.mAvailableCameraIds.contains(cameraId)) {
            return new Camera2CameraImpl(this.mCameraManager, cameraId, getCameraInfo(cameraId), this.mCameraCoordinator, this.mCameraStateRegistry, this.mThreadConfig.getCameraExecutor(), this.mThreadConfig.getSchedulerHandler(), this.mDisplayInfoManager);
        }
        throw new IllegalArgumentException("The given camera id is not on the available camera id list.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Camera2CameraInfoImpl getCameraInfo(String cameraId) throws CameraUnavailableException {
        try {
            Camera2CameraInfoImpl camera2CameraInfoImpl = this.mCameraInfos.get(cameraId);
            if (camera2CameraInfoImpl == null) {
                Camera2CameraInfoImpl camera2CameraInfoImpl2 = new Camera2CameraInfoImpl(cameraId, this.mCameraManager);
                this.mCameraInfos.put(cameraId, camera2CameraInfoImpl2);
                return camera2CameraInfoImpl2;
            }
            return camera2CameraInfoImpl;
        } catch (CameraAccessExceptionCompat e) {
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public Set<String> getAvailableCameraIds() {
        return new LinkedHashSet(this.mAvailableCameraIds);
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public CameraCoordinator getCameraCoordinator() {
        return this.mCameraCoordinator;
    }

    @Override // androidx.camera.core.impl.CameraFactory
    public CameraManagerCompat getCameraManager() {
        return this.mCameraManager;
    }

    private List<String> getBackwardCompatibleCameraIds(List<String> availableCameraIds) throws InitializationException {
        List<String> backwardCompatibleCameraIds = new ArrayList<>();
        for (String cameraId : availableCameraIds) {
            if (cameraId.equals("0") || cameraId.equals("1")) {
                backwardCompatibleCameraIds.add(cameraId);
            } else if (isBackwardCompatible(cameraId)) {
                backwardCompatibleCameraIds.add(cameraId);
            } else {
                Logger.d(TAG, "Camera " + cameraId + " is filtered out because its capabilities do not contain REQUEST_AVAILABLE_CAPABILITIES_BACKWARD_COMPATIBLE.");
            }
        }
        return backwardCompatibleCameraIds;
    }

    private boolean isBackwardCompatible(String cameraId) throws InitializationException {
        if ("robolectric".equals(Build.FINGERPRINT)) {
            return true;
        }
        try {
            int[] availableCapabilities = (int[]) this.mCameraManager.getCameraCharacteristicsCompat(cameraId).get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
            if (availableCapabilities != null) {
                for (int capability : availableCapabilities) {
                    if (capability == 0) {
                        return true;
                    }
                }
            }
            return false;
        } catch (CameraAccessExceptionCompat e) {
            throw new InitializationException(CameraUnavailableExceptionHelper.createFrom(e));
        }
    }
}
