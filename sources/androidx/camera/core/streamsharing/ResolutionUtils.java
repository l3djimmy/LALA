package androidx.camera.core.streamsharing;

import android.util.Size;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.UseCaseConfig;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
class ResolutionUtils {
    private ResolutionUtils() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<Size> getMergedResolutions(List<Size> supportedResolutions, Size sensorSize, Set<UseCaseConfig<?>> useCaseConfigs) {
        for (UseCaseConfig<?> useCaseConfig : useCaseConfigs) {
            List<Size> customOrderedResolutions = (List) useCaseConfig.retrieveOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, null);
            if (customOrderedResolutions != null) {
                return customOrderedResolutions;
            }
        }
        return supportedResolutions;
    }
}
