package androidx.camera.camera2.internal.compat.workaround;

import android.hardware.camera2.CaptureRequest;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ImageCapturePixelHDRPlusQuirk;
/* loaded from: classes.dex */
public class ImageCapturePixelHDRPlus {
    public void toggleHDRPlus(int captureMode, Camera2ImplConfig.Builder builder) {
        ImageCapturePixelHDRPlusQuirk quirk = (ImageCapturePixelHDRPlusQuirk) DeviceQuirks.get(ImageCapturePixelHDRPlusQuirk.class);
        if (quirk == null) {
            return;
        }
        switch (captureMode) {
            case 0:
                builder.setCaptureRequestOption(CaptureRequest.CONTROL_ENABLE_ZSL, true);
                return;
            case 1:
                builder.setCaptureRequestOption(CaptureRequest.CONTROL_ENABLE_ZSL, false);
                return;
            default:
                return;
        }
    }
}
