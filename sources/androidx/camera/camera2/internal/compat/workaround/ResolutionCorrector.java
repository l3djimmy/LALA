package androidx.camera.camera2.internal.compat.workaround;

import android.util.Size;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ExtraCroppingQuirk;
import androidx.camera.core.impl.SurfaceConfig;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class ResolutionCorrector {
    private final ExtraCroppingQuirk mExtraCroppingQuirk;

    public ResolutionCorrector() {
        this((ExtraCroppingQuirk) DeviceQuirks.get(ExtraCroppingQuirk.class));
    }

    ResolutionCorrector(ExtraCroppingQuirk extraCroppingQuirk) {
        this.mExtraCroppingQuirk = extraCroppingQuirk;
    }

    public List<Size> insertOrPrioritize(SurfaceConfig.ConfigType configType, List<Size> supportedResolutions) {
        if (this.mExtraCroppingQuirk == null) {
            return supportedResolutions;
        }
        Size selectResolution = this.mExtraCroppingQuirk.getVerifiedResolution(configType);
        if (selectResolution == null) {
            return supportedResolutions;
        }
        List<Size> newResolutions = new ArrayList<>();
        newResolutions.add(selectResolution);
        for (Size size : supportedResolutions) {
            if (!size.equals(selectResolution)) {
                newResolutions.add(size);
            }
        }
        return newResolutions;
    }
}
