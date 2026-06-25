package androidx.camera.core.streamsharing;

import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.ForwardingCameraControl;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class VirtualCameraControl extends ForwardingCameraControl {
    private static final int DEFAULT_JPEG_QUALITY = 100;
    private static final int DEFAULT_ROTATION_DEGREES = 0;
    private final StreamSharing.Control mStreamSharingControl;

    /* JADX INFO: Access modifiers changed from: package-private */
    public VirtualCameraControl(CameraControlInternal parent, StreamSharing.Control streamSharingControl) {
        super(parent);
        this.mStreamSharingControl = streamSharingControl;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.impl.CameraControlInternal
    public ListenableFuture<List<Void>> submitStillCaptureRequests(List<CaptureConfig> captureConfigs, int captureMode, int flashType) {
        Preconditions.checkArgument(captureConfigs.size() == 1, "Only support one capture config.");
        return Futures.allAsList(Collections.singletonList(this.mStreamSharingControl.jpegSnapshot(getJpegQuality(captureConfigs.get(0)), getRotationDegrees(captureConfigs.get(0)))));
    }

    private int getJpegQuality(CaptureConfig captureConfig) {
        return ((Integer) Objects.requireNonNull((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_JPEG_QUALITY, 100))).intValue();
    }

    private int getRotationDegrees(CaptureConfig captureConfig) {
        return ((Integer) Objects.requireNonNull((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_ROTATION, 0))).intValue();
    }
}
