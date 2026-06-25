package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.os.Build;
import androidx.camera.camera2.internal.compat.workaround.OutputSizesCorrector;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public class CameraCharacteristicsCompat {
    private final CameraCharacteristicsCompatImpl mCameraCharacteristicsImpl;
    private final String mCameraId;
    private final Map<CameraCharacteristics.Key<?>, Object> mValuesCache = new HashMap();
    private StreamConfigurationMapCompat mStreamConfigurationMapCompat = null;

    /* loaded from: classes.dex */
    public interface CameraCharacteristicsCompatImpl {
        <T> T get(CameraCharacteristics.Key<T> key);

        Set<String> getPhysicalCameraIds();

        CameraCharacteristics unwrap();
    }

    private CameraCharacteristicsCompat(CameraCharacteristics cameraCharacteristics, String cameraId) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.mCameraCharacteristicsImpl = new CameraCharacteristicsApi28Impl(cameraCharacteristics);
        } else {
            this.mCameraCharacteristicsImpl = new CameraCharacteristicsBaseImpl(cameraCharacteristics);
        }
        this.mCameraId = cameraId;
    }

    public static CameraCharacteristicsCompat toCameraCharacteristicsCompat(CameraCharacteristics characteristics, String cameraId) {
        return new CameraCharacteristicsCompat(characteristics, cameraId);
    }

    private boolean isKeyNonCacheable(CameraCharacteristics.Key<?> key) {
        if (key.equals(CameraCharacteristics.SENSOR_ORIENTATION)) {
            return true;
        }
        return false;
    }

    public <T> T get(CameraCharacteristics.Key<T> key) {
        if (isKeyNonCacheable(key)) {
            return (T) this.mCameraCharacteristicsImpl.get(key);
        }
        synchronized (this) {
            T value = (T) this.mValuesCache.get(key);
            if (value != null) {
                return value;
            }
            T value2 = (T) this.mCameraCharacteristicsImpl.get(key);
            if (value2 != null) {
                this.mValuesCache.put(key, value2);
            }
            return value2;
        }
    }

    public Set<String> getPhysicalCameraIds() {
        return this.mCameraCharacteristicsImpl.getPhysicalCameraIds();
    }

    public StreamConfigurationMapCompat getStreamConfigurationMapCompat() {
        if (this.mStreamConfigurationMapCompat == null) {
            try {
                StreamConfigurationMap map = (StreamConfigurationMap) get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
                if (map == null) {
                    throw new IllegalArgumentException("StreamConfigurationMap is null!");
                }
                OutputSizesCorrector outputSizesCorrector = new OutputSizesCorrector(this.mCameraId);
                this.mStreamConfigurationMapCompat = StreamConfigurationMapCompat.toStreamConfigurationMapCompat(map, outputSizesCorrector);
            } catch (AssertionError e) {
                throw new IllegalArgumentException(e.getMessage());
            }
        }
        return this.mStreamConfigurationMapCompat;
    }

    public CameraCharacteristics toCameraCharacteristics() {
        return this.mCameraCharacteristicsImpl.unwrap();
    }
}
