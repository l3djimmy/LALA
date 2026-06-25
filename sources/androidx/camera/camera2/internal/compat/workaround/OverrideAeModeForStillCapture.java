package androidx.camera.camera2.internal.compat.workaround;

import androidx.camera.camera2.internal.compat.quirk.AutoFlashUnderExposedQuirk;
import androidx.camera.core.impl.Quirks;
/* loaded from: classes.dex */
public class OverrideAeModeForStillCapture {
    private boolean mAePrecaptureStarted = false;
    private final boolean mHasAutoFlashUnderExposedQuirk;

    public OverrideAeModeForStillCapture(Quirks cameraQuirks) {
        this.mHasAutoFlashUnderExposedQuirk = cameraQuirks.get(AutoFlashUnderExposedQuirk.class) != null;
    }

    public void onAePrecaptureStarted() {
        this.mAePrecaptureStarted = true;
    }

    public void onAePrecaptureFinished() {
        this.mAePrecaptureStarted = false;
    }

    public boolean shouldSetAeModeAlwaysFlash(int flashMode) {
        return this.mAePrecaptureStarted && flashMode == 0 && this.mHasAutoFlashUnderExposedQuirk;
    }
}
