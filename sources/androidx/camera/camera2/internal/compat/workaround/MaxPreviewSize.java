package androidx.camera.camera2.internal.compat.workaround;

import android.util.Size;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ExtraCroppingQuirk;
import androidx.camera.core.impl.SurfaceConfig;
/* loaded from: classes.dex */
public class MaxPreviewSize {
    private final ExtraCroppingQuirk mExtraCroppingQuirk;

    public MaxPreviewSize() {
        this((ExtraCroppingQuirk) DeviceQuirks.get(ExtraCroppingQuirk.class));
    }

    MaxPreviewSize(ExtraCroppingQuirk extraCroppingQuirk) {
        this.mExtraCroppingQuirk = extraCroppingQuirk;
    }

    public Size getMaxPreviewResolution(Size defaultMaxPreviewResolution) {
        if (this.mExtraCroppingQuirk == null) {
            return defaultMaxPreviewResolution;
        }
        Size selectResolution = this.mExtraCroppingQuirk.getVerifiedResolution(SurfaceConfig.ConfigType.PRIV);
        if (selectResolution == null) {
            return defaultMaxPreviewResolution;
        }
        boolean isSelectResolutionLarger = selectResolution.getWidth() * selectResolution.getHeight() > defaultMaxPreviewResolution.getWidth() * defaultMaxPreviewResolution.getHeight();
        return isSelectResolutionLarger ? selectResolution : defaultMaxPreviewResolution;
    }
}
