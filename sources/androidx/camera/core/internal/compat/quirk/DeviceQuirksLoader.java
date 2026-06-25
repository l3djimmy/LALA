package androidx.camera.core.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class DeviceQuirksLoader {
    private DeviceQuirksLoader() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<Quirk> loadQuirks() {
        List<Quirk> quirks = new ArrayList<>();
        if (ImageCaptureRotationOptionQuirk.load()) {
            quirks.add(new ImageCaptureRotationOptionQuirk());
        }
        if (SurfaceOrderQuirk.load()) {
            quirks.add(new SurfaceOrderQuirk());
        }
        if (CaptureFailedRetryQuirk.load()) {
            quirks.add(new CaptureFailedRetryQuirk());
        }
        if (LowMemoryQuirk.load()) {
            quirks.add(new LowMemoryQuirk());
        }
        if (LargeJpegImageQuirk.load()) {
            quirks.add(new LargeJpegImageQuirk());
        }
        if (IncorrectJpegMetadataQuirk.load()) {
            quirks.add(new IncorrectJpegMetadataQuirk());
        }
        return quirks;
    }
}
