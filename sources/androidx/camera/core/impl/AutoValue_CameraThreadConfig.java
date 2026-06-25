package androidx.camera.core.impl;

import android.os.Handler;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
final class AutoValue_CameraThreadConfig extends CameraThreadConfig {
    private final Executor cameraExecutor;
    private final Handler schedulerHandler;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_CameraThreadConfig(Executor cameraExecutor, Handler schedulerHandler) {
        if (cameraExecutor == null) {
            throw new NullPointerException("Null cameraExecutor");
        }
        this.cameraExecutor = cameraExecutor;
        if (schedulerHandler == null) {
            throw new NullPointerException("Null schedulerHandler");
        }
        this.schedulerHandler = schedulerHandler;
    }

    @Override // androidx.camera.core.impl.CameraThreadConfig
    public Executor getCameraExecutor() {
        return this.cameraExecutor;
    }

    @Override // androidx.camera.core.impl.CameraThreadConfig
    public Handler getSchedulerHandler() {
        return this.schedulerHandler;
    }

    public String toString() {
        return "CameraThreadConfig{cameraExecutor=" + this.cameraExecutor + ", schedulerHandler=" + this.schedulerHandler + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof CameraThreadConfig) {
            CameraThreadConfig that = (CameraThreadConfig) o;
            return this.cameraExecutor.equals(that.getCameraExecutor()) && this.schedulerHandler.equals(that.getSchedulerHandler());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.cameraExecutor.hashCode()) * 1000003) ^ this.schedulerHandler.hashCode();
    }
}
