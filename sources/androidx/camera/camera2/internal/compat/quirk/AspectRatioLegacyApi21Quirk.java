package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.impl.Quirk;
/* loaded from: classes.dex */
public class AspectRatioLegacyApi21Quirk implements Quirk {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean load(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        Integer level = (Integer) cameraCharacteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        if (level != null) {
            level.intValue();
            return false;
        }
        return false;
    }

    public int getCorrectedAspectRatio() {
        return 2;
    }
}
