package androidx.camera.camera2.internal.compat.workaround;

import android.hardware.camera2.CaptureRequest;
import android.util.Rational;
import android.util.Size;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.PreviewPixelHDRnetQuirk;
import androidx.camera.core.impl.SessionConfig;
/* loaded from: classes.dex */
public class PreviewPixelHDRnet {
    public static final Rational ASPECT_RATIO_16_9 = new Rational(16, 9);

    private PreviewPixelHDRnet() {
    }

    public static void setHDRnet(Size resolution, SessionConfig.Builder sessionBuilder) {
        PreviewPixelHDRnetQuirk quirk = (PreviewPixelHDRnetQuirk) DeviceQuirks.get(PreviewPixelHDRnetQuirk.class);
        if (quirk == null || isAspectRatioMatch(resolution, ASPECT_RATIO_16_9)) {
            return;
        }
        Camera2ImplConfig.Builder camera2ConfigBuilder = new Camera2ImplConfig.Builder();
        camera2ConfigBuilder.setCaptureRequestOption(CaptureRequest.TONEMAP_MODE, 2);
        sessionBuilder.addImplementationOptions(camera2ConfigBuilder.build());
    }

    private static boolean isAspectRatioMatch(Size resolution, Rational aspectRatio) {
        return aspectRatio.equals(new Rational(resolution.getWidth(), resolution.getHeight()));
    }
}
