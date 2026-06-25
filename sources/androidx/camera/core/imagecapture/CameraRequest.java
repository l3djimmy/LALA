package androidx.camera.core.imagecapture;

import androidx.camera.core.impl.CaptureConfig;
import java.util.List;
/* loaded from: classes.dex */
public final class CameraRequest {
    private final TakePictureCallback mCallback;
    private final List<CaptureConfig> mCaptureConfigs;

    public CameraRequest(List<CaptureConfig> captureConfigs, TakePictureCallback callback) {
        this.mCaptureConfigs = captureConfigs;
        this.mCallback = callback;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<CaptureConfig> getCaptureConfigs() {
        return this.mCaptureConfigs;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isAborted() {
        return this.mCallback.isAborted();
    }
}
