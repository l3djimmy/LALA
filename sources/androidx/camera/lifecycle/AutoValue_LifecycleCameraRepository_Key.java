package androidx.camera.lifecycle;

import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.camera.lifecycle.LifecycleCameraRepository;
import androidx.lifecycle.LifecycleOwner;
/* loaded from: classes.dex */
final class AutoValue_LifecycleCameraRepository_Key extends LifecycleCameraRepository.Key {
    private final CameraUseCaseAdapter.CameraId cameraId;
    private final LifecycleOwner lifecycleOwner;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_LifecycleCameraRepository_Key(LifecycleOwner lifecycleOwner, CameraUseCaseAdapter.CameraId cameraId) {
        if (lifecycleOwner == null) {
            throw new NullPointerException("Null lifecycleOwner");
        }
        this.lifecycleOwner = lifecycleOwner;
        if (cameraId == null) {
            throw new NullPointerException("Null cameraId");
        }
        this.cameraId = cameraId;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraRepository.Key
    public LifecycleOwner getLifecycleOwner() {
        return this.lifecycleOwner;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraRepository.Key
    public CameraUseCaseAdapter.CameraId getCameraId() {
        return this.cameraId;
    }

    public String toString() {
        return "Key{lifecycleOwner=" + this.lifecycleOwner + ", cameraId=" + this.cameraId + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof LifecycleCameraRepository.Key) {
            LifecycleCameraRepository.Key that = (LifecycleCameraRepository.Key) o;
            return this.lifecycleOwner.equals(that.getLifecycleOwner()) && this.cameraId.equals(that.getCameraId());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.lifecycleOwner.hashCode()) * 1000003) ^ this.cameraId.hashCode();
    }
}
