package androidx.camera.camera2.internal;

import androidx.camera.camera2.internal.SupportedSurfaceCombination;
/* loaded from: classes.dex */
final class AutoValue_SupportedSurfaceCombination_FeatureSettings extends SupportedSurfaceCombination.FeatureSettings {
    private final int cameraMode;
    private final int requiredMaxBitDepth;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_SupportedSurfaceCombination_FeatureSettings(int cameraMode, int requiredMaxBitDepth) {
        this.cameraMode = cameraMode;
        this.requiredMaxBitDepth = requiredMaxBitDepth;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    int getCameraMode() {
        return this.cameraMode;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.FeatureSettings
    int getRequiredMaxBitDepth() {
        return this.requiredMaxBitDepth;
    }

    public String toString() {
        return "FeatureSettings{cameraMode=" + this.cameraMode + ", requiredMaxBitDepth=" + this.requiredMaxBitDepth + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SupportedSurfaceCombination.FeatureSettings) {
            SupportedSurfaceCombination.FeatureSettings that = (SupportedSurfaceCombination.FeatureSettings) o;
            return this.cameraMode == that.getCameraMode() && this.requiredMaxBitDepth == that.getRequiredMaxBitDepth();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.cameraMode) * 1000003) ^ this.requiredMaxBitDepth;
    }
}
