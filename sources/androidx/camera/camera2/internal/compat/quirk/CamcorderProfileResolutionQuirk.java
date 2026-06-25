package androidx.camera.camera2.internal.compat.quirk;

import android.hardware.camera2.CameraCharacteristics;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.quirk.ProfileResolutionQuirk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class CamcorderProfileResolutionQuirk implements ProfileResolutionQuirk {
    private static final String TAG = "CamcorderProfileResolutionQuirk";
    private final StreamConfigurationMapCompat mStreamConfigurationMapCompat;
    private List<Size> mSupportedResolutions = null;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean load(CameraCharacteristicsCompat characteristicsCompat) {
        Integer level = (Integer) characteristicsCompat.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
        return level != null && level.intValue() == 2;
    }

    public CamcorderProfileResolutionQuirk(CameraCharacteristicsCompat characteristicsCompat) {
        this.mStreamConfigurationMapCompat = characteristicsCompat.getStreamConfigurationMapCompat();
    }

    @Override // androidx.camera.core.impl.quirk.ProfileResolutionQuirk
    public List<Size> getSupportedResolutions() {
        if (this.mSupportedResolutions == null) {
            Size[] sizes = this.mStreamConfigurationMapCompat.getOutputSizes(34);
            this.mSupportedResolutions = sizes != null ? Arrays.asList((Size[]) sizes.clone()) : Collections.emptyList();
            Logger.d(TAG, "mSupportedResolutions = " + this.mSupportedResolutions);
        }
        return new ArrayList(this.mSupportedResolutions);
    }
}
