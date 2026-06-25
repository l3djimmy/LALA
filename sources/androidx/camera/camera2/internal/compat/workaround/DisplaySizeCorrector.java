package androidx.camera.camera2.internal.compat.workaround;

import android.util.Size;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.SmallDisplaySizeQuirk;
/* loaded from: classes.dex */
public class DisplaySizeCorrector {
    private final SmallDisplaySizeQuirk mSmallDisplaySizeQuirk = (SmallDisplaySizeQuirk) DeviceQuirks.get(SmallDisplaySizeQuirk.class);

    public Size getDisplaySize() {
        if (this.mSmallDisplaySizeQuirk != null) {
            return this.mSmallDisplaySizeQuirk.getDisplaySize();
        }
        return null;
    }
}
