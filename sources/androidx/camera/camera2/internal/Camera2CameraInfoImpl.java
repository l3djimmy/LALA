package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.camera.camera2.internal.Camera2CameraInfoImpl;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.quirk.CameraQuirks;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ZslDisablerQuirk;
import androidx.camera.camera2.internal.compat.workaround.CameraCharacteristicsProvider;
import androidx.camera.camera2.internal.compat.workaround.FlashAvailabilityChecker;
import androidx.camera.camera2.interop.Camera2CameraInfo;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraState;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ExposureState;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.Logger;
import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MediatorLiveData;
import androidx.lifecycle.Observer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class Camera2CameraInfoImpl implements CameraInfoInternal {
    private static final String TAG = "Camera2CameraInfo";
    private Camera2CameraControlImpl mCamera2CameraControlImpl;
    private final EncoderProfilesProvider mCamera2EncoderProfilesProvider;
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    private final String mCameraId;
    private final CameraManagerCompat mCameraManager;
    private final Quirks mCameraQuirks;
    private final Object mLock = new Object();
    private RedirectableLiveData<Integer> mRedirectTorchStateLiveData = null;
    private RedirectableLiveData<ZoomState> mRedirectZoomStateLiveData = null;
    private List<Pair<CameraCaptureCallback, Executor>> mCameraCaptureCallbacks = null;
    private final Camera2CameraInfo mCamera2CameraInfo = new Camera2CameraInfo(this);
    private final RedirectableLiveData<CameraState> mCameraStateLiveData = new RedirectableLiveData<>(CameraState.create(CameraState.Type.CLOSED));

    public Camera2CameraInfoImpl(String cameraId, CameraManagerCompat cameraManager) throws CameraAccessExceptionCompat {
        this.mCameraId = (String) Preconditions.checkNotNull(cameraId);
        this.mCameraManager = cameraManager;
        this.mCameraCharacteristicsCompat = cameraManager.getCameraCharacteristicsCompat(this.mCameraId);
        this.mCameraQuirks = CameraQuirks.get(cameraId, this.mCameraCharacteristicsCompat);
        this.mCamera2EncoderProfilesProvider = new Camera2EncoderProfilesProvider(cameraId);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void linkWithCameraControl(Camera2CameraControlImpl camera2CameraControlImpl) {
        synchronized (this.mLock) {
            this.mCamera2CameraControlImpl = camera2CameraControlImpl;
            if (this.mRedirectZoomStateLiveData != null) {
                this.mRedirectZoomStateLiveData.redirectTo(this.mCamera2CameraControlImpl.getZoomControl().getZoomState());
            }
            if (this.mRedirectTorchStateLiveData != null) {
                this.mRedirectTorchStateLiveData.redirectTo(this.mCamera2CameraControlImpl.getTorchControl().getTorchState());
            }
            if (this.mCameraCaptureCallbacks != null) {
                for (Pair<CameraCaptureCallback, Executor> pair : this.mCameraCaptureCallbacks) {
                    this.mCamera2CameraControlImpl.addSessionCameraCaptureCallback((Executor) pair.second, (CameraCaptureCallback) pair.first);
                }
                this.mCameraCaptureCallbacks = null;
            }
        }
        logDeviceInfo();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCameraStateSource(LiveData<CameraState> cameraStateSource) {
        this.mCameraStateLiveData.redirectTo(cameraStateSource);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public String getCameraId() {
        return this.mCameraId;
    }

    public CameraCharacteristicsCompat getCameraCharacteristicsCompat() {
        return this.mCameraCharacteristicsCompat;
    }

    @Override // androidx.camera.core.CameraInfo
    public int getLensFacing() {
        Integer lensFacing = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.LENS_FACING);
        Preconditions.checkArgument(lensFacing != null, "Unable to get the lens facing of the camera.");
        return LensFacingUtil.getCameraSelectorLensFacing(lensFacing.intValue());
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees(int relativeRotation) {
        int sensorOrientation = getSensorOrientation();
        int relativeRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(relativeRotation);
        int lensFacing = getLensFacing();
        boolean isOppositeFacingScreen = 1 == lensFacing;
        return CameraOrientationUtil.getRelativeImageRotation(relativeRotationDegrees, sensorOrientation, isOppositeFacingScreen);
    }

    int getSensorOrientation() {
        Integer sensorOrientation = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_ORIENTATION);
        Preconditions.checkNotNull(sensorOrientation);
        return sensorOrientation.intValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getSupportedHardwareLevel() {
        Integer deviceLevel = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        Preconditions.checkNotNull(deviceLevel);
        return deviceLevel.intValue();
    }

    @Override // androidx.camera.core.CameraInfo
    public int getSensorRotationDegrees() {
        return getSensorRotationDegrees(0);
    }

    private void logDeviceInfo() {
        logDeviceLevel();
    }

    private void logDeviceLevel() {
        String levelString;
        int deviceLevel = getSupportedHardwareLevel();
        switch (deviceLevel) {
            case 0:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED";
                break;
            case 1:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_FULL";
                break;
            case 2:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY";
                break;
            case 3:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_3";
                break;
            case 4:
                levelString = "INFO_SUPPORTED_HARDWARE_LEVEL_EXTERNAL";
                break;
            default:
                levelString = "Unknown value: " + deviceLevel;
                break;
        }
        Logger.i(TAG, "Device Level: " + levelString);
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean hasFlashUnit() {
        final CameraCharacteristicsCompat cameraCharacteristicsCompat = this.mCameraCharacteristicsCompat;
        Objects.requireNonNull(cameraCharacteristicsCompat);
        return FlashAvailabilityChecker.isFlashAvailable(new CameraCharacteristicsProvider() { // from class: androidx.camera.camera2.internal.Camera2CameraInfoImpl$$ExternalSyntheticLambda0
            @Override // androidx.camera.camera2.internal.compat.workaround.CameraCharacteristicsProvider
            public final Object get(CameraCharacteristics.Key key) {
                return CameraCharacteristicsCompat.this.get(key);
            }
        });
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<Integer> getTorchState() {
        synchronized (this.mLock) {
            Camera2CameraControlImpl camera2CameraControlImpl = this.mCamera2CameraControlImpl;
            RedirectableLiveData<Integer> redirectableLiveData = this.mRedirectTorchStateLiveData;
            if (camera2CameraControlImpl == null) {
                if (redirectableLiveData == null) {
                    this.mRedirectTorchStateLiveData = new RedirectableLiveData<>(0);
                }
                return this.mRedirectTorchStateLiveData;
            } else if (redirectableLiveData != null) {
                return this.mRedirectTorchStateLiveData;
            } else {
                return this.mCamera2CameraControlImpl.getTorchControl().getTorchState();
            }
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<ZoomState> getZoomState() {
        synchronized (this.mLock) {
            Camera2CameraControlImpl camera2CameraControlImpl = this.mCamera2CameraControlImpl;
            RedirectableLiveData<ZoomState> redirectableLiveData = this.mRedirectZoomStateLiveData;
            if (camera2CameraControlImpl == null) {
                if (redirectableLiveData == null) {
                    this.mRedirectZoomStateLiveData = new RedirectableLiveData<>(ZoomControl.getDefaultZoomState(this.mCameraCharacteristicsCompat));
                }
                return this.mRedirectZoomStateLiveData;
            } else if (redirectableLiveData != null) {
                return this.mRedirectZoomStateLiveData;
            } else {
                return this.mCamera2CameraControlImpl.getZoomControl().getZoomState();
            }
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public ExposureState getExposureState() {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                return ExposureControl.getDefaultExposureState(this.mCameraCharacteristicsCompat);
            }
            return this.mCamera2CameraControlImpl.getExposureControl().getExposureState();
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public LiveData<CameraState> getCameraState() {
        return this.mCameraStateLiveData;
    }

    @Override // androidx.camera.core.CameraInfo
    public String getImplementationType() {
        int hardwareLevel = getSupportedHardwareLevel();
        return hardwareLevel == 2 ? CameraInfo.IMPLEMENTATION_TYPE_CAMERA2_LEGACY : CameraInfo.IMPLEMENTATION_TYPE_CAMERA2;
    }

    @Override // androidx.camera.core.CameraInfo
    public float getIntrinsicZoomRatio() {
        Integer lensFacing = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.LENS_FACING);
        if (lensFacing == null) {
            return 1.0f;
        }
        try {
            int fovDegrees = FovUtil.focalLengthToViewAngleDegrees(FovUtil.getDefaultFocalLength(this.mCameraCharacteristicsCompat), FovUtil.getSensorHorizontalLength(this.mCameraCharacteristicsCompat));
            int defaultFovDegrees = FovUtil.getDeviceDefaultViewAngleDegrees(this.mCameraManager, lensFacing.intValue());
            return defaultFovDegrees / fovDegrees;
        } catch (Exception e) {
            Logger.e(TAG, "The camera is unable to provide necessary information to resolve its intrinsic zoom ratio with error: " + e);
            return 1.0f;
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isFocusMeteringSupported(FocusMeteringAction action) {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                return false;
            }
            return this.mCamera2CameraControlImpl.getFocusMeteringControl().isFocusMeteringSupported(action);
        }
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isZslSupported() {
        return isPrivateReprocessingSupported() && DeviceQuirks.get(ZslDisablerQuirk.class) == null;
    }

    @Override // androidx.camera.core.CameraInfo
    public boolean isPrivateReprocessingSupported() {
        return ZslUtil.isCapabilitySupported(this.mCameraCharacteristicsCompat, 4);
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public EncoderProfilesProvider getEncoderProfilesProvider() {
        return this.mCamera2EncoderProfilesProvider;
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Timebase getTimebase() {
        Integer timeSource = (Integer) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.SENSOR_INFO_TIMESTAMP_SOURCE);
        Preconditions.checkNotNull(timeSource);
        switch (timeSource.intValue()) {
            case 1:
                return Timebase.REALTIME;
            default:
                return Timebase.UPTIME;
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedResolutions(int format) {
        StreamConfigurationMapCompat mapCompat = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        Size[] size = mapCompat.getOutputSizes(format);
        return size != null ? Arrays.asList(size) : Collections.emptyList();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public List<Size> getSupportedHighResolutions(int format) {
        StreamConfigurationMapCompat mapCompat = this.mCameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        Size[] size = mapCompat.getHighResolutionOutputSizes(format);
        return size != null ? Arrays.asList(size) : Collections.emptyList();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Set<DynamicRange> getSupportedDynamicRanges() {
        DynamicRangesCompat dynamicRangesCompat = DynamicRangesCompat.fromCameraCharacteristics(this.mCameraCharacteristicsCompat);
        return dynamicRangesCompat.getSupportedDynamicRanges();
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void addSessionCaptureCallback(Executor executor, CameraCaptureCallback callback) {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mCameraCaptureCallbacks == null) {
                    this.mCameraCaptureCallbacks = new ArrayList();
                }
                this.mCameraCaptureCallbacks.add(new Pair<>(callback, executor));
                return;
            }
            this.mCamera2CameraControlImpl.addSessionCameraCaptureCallback(executor, callback);
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public void removeSessionCaptureCallback(CameraCaptureCallback callback) {
        synchronized (this.mLock) {
            if (this.mCamera2CameraControlImpl == null) {
                if (this.mCameraCaptureCallbacks == null) {
                    return;
                }
                Iterator<Pair<CameraCaptureCallback, Executor>> it = this.mCameraCaptureCallbacks.iterator();
                while (it.hasNext()) {
                    Pair<CameraCaptureCallback, Executor> pair = it.next();
                    if (pair.first == callback) {
                        it.remove();
                    }
                }
                return;
            }
            this.mCamera2CameraControlImpl.removeSessionCameraCaptureCallback(callback);
        }
    }

    @Override // androidx.camera.core.impl.CameraInfoInternal
    public Quirks getCameraQuirks() {
        return this.mCameraQuirks;
    }

    @Override // androidx.camera.core.CameraInfo
    public Set<Range<Integer>> getSupportedFrameRateRanges() {
        Range<Integer>[] availableTargetFpsRanges = (Range[]) this.mCameraCharacteristicsCompat.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
        if (availableTargetFpsRanges != null) {
            return new HashSet(Arrays.asList(availableTargetFpsRanges));
        }
        return Collections.emptySet();
    }

    public Camera2CameraInfo getCamera2CameraInfo() {
        return this.mCamera2CameraInfo;
    }

    public Map<String, CameraCharacteristics> getCameraCharacteristicsMap() {
        LinkedHashMap<String, CameraCharacteristics> map = new LinkedHashMap<>();
        map.put(this.mCameraId, this.mCameraCharacteristicsCompat.toCameraCharacteristics());
        for (String physicalCameraId : this.mCameraCharacteristicsCompat.getPhysicalCameraIds()) {
            if (!Objects.equals(physicalCameraId, this.mCameraId)) {
                try {
                    map.put(physicalCameraId, this.mCameraManager.getCameraCharacteristicsCompat(physicalCameraId).toCameraCharacteristics());
                } catch (CameraAccessExceptionCompat e) {
                    Logger.e(TAG, "Failed to get CameraCharacteristics for cameraId " + physicalCameraId, e);
                }
            }
        }
        return map;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class RedirectableLiveData<T> extends MediatorLiveData<T> {
        private final T mInitialValue;
        private LiveData<T> mLiveDataSource;

        RedirectableLiveData(T initialValue) {
            this.mInitialValue = initialValue;
        }

        /* JADX WARN: Multi-variable type inference failed */
        void redirectTo(LiveData<T> liveDataSource) {
            if (this.mLiveDataSource != null) {
                super.removeSource((LiveData<T>) this.mLiveDataSource);
            }
            this.mLiveDataSource = liveDataSource;
            super.addSource(liveDataSource, new Observer() { // from class: androidx.camera.camera2.internal.Camera2CameraInfoImpl$RedirectableLiveData$$ExternalSyntheticLambda0
                @Override // androidx.lifecycle.Observer
                public final void onChanged(Object obj) {
                    Camera2CameraInfoImpl.RedirectableLiveData.this.setValue(obj);
                }
            });
        }

        @Override // androidx.lifecycle.MediatorLiveData
        public <S> void addSource(LiveData<S> source, Observer<? super S> onChanged) {
            throw new UnsupportedOperationException();
        }

        @Override // androidx.lifecycle.LiveData
        public T getValue() {
            return this.mLiveDataSource == null ? this.mInitialValue : this.mLiveDataSource.getValue();
        }
    }
}
