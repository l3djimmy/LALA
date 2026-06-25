package androidx.camera.camera2.internal;

import android.util.Size;
import androidx.camera.camera2.internal.Camera2CameraImpl;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
/* loaded from: classes.dex */
final class AutoValue_Camera2CameraImpl_UseCaseInfo extends Camera2CameraImpl.UseCaseInfo {
    private final SessionConfig sessionConfig;
    private final Size surfaceResolution;
    private final UseCaseConfig<?> useCaseConfig;
    private final String useCaseId;
    private final Class<?> useCaseType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Camera2CameraImpl_UseCaseInfo(String useCaseId, Class<?> useCaseType, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, Size surfaceResolution) {
        if (useCaseId == null) {
            throw new NullPointerException("Null useCaseId");
        }
        this.useCaseId = useCaseId;
        if (useCaseType == null) {
            throw new NullPointerException("Null useCaseType");
        }
        this.useCaseType = useCaseType;
        if (sessionConfig == null) {
            throw new NullPointerException("Null sessionConfig");
        }
        this.sessionConfig = sessionConfig;
        if (useCaseConfig == null) {
            throw new NullPointerException("Null useCaseConfig");
        }
        this.useCaseConfig = useCaseConfig;
        this.surfaceResolution = surfaceResolution;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    String getUseCaseId() {
        return this.useCaseId;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    Class<?> getUseCaseType() {
        return this.useCaseType;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    SessionConfig getSessionConfig() {
        return this.sessionConfig;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    UseCaseConfig<?> getUseCaseConfig() {
        return this.useCaseConfig;
    }

    @Override // androidx.camera.camera2.internal.Camera2CameraImpl.UseCaseInfo
    Size getSurfaceResolution() {
        return this.surfaceResolution;
    }

    public String toString() {
        return "UseCaseInfo{useCaseId=" + this.useCaseId + ", useCaseType=" + this.useCaseType + ", sessionConfig=" + this.sessionConfig + ", useCaseConfig=" + this.useCaseConfig + ", surfaceResolution=" + this.surfaceResolution + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof Camera2CameraImpl.UseCaseInfo) {
            Camera2CameraImpl.UseCaseInfo that = (Camera2CameraImpl.UseCaseInfo) o;
            if (this.useCaseId.equals(that.getUseCaseId()) && this.useCaseType.equals(that.getUseCaseType()) && this.sessionConfig.equals(that.getSessionConfig()) && this.useCaseConfig.equals(that.getUseCaseConfig())) {
                if (this.surfaceResolution == null) {
                    if (that.getSurfaceResolution() == null) {
                        return true;
                    }
                } else if (this.surfaceResolution.equals(that.getSurfaceResolution())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((h$ ^ this.useCaseId.hashCode()) * 1000003) ^ this.useCaseType.hashCode()) * 1000003) ^ this.sessionConfig.hashCode()) * 1000003) ^ this.useCaseConfig.hashCode()) * 1000003) ^ (this.surfaceResolution == null ? 0 : this.surfaceResolution.hashCode());
    }
}
