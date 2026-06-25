package androidx.camera.camera2.internal.compat.workaround;

import android.util.Size;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.RepeatingStreamConstraintForVideoRecordingQuirk;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import com.itextpdf.io.codec.TIFFConstants;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes.dex */
public class SupportedRepeatingSurfaceSize {
    private static final Size MINI_PREVIEW_SIZE_HUAWEI_MATE_9 = new Size(TIFFConstants.TIFFTAG_COLORMAP, 240);
    private static final Comparator<Size> SIZE_COMPARATOR = new CompareSizesByArea();
    private final RepeatingStreamConstraintForVideoRecordingQuirk mQuirk = (RepeatingStreamConstraintForVideoRecordingQuirk) DeviceQuirks.get(RepeatingStreamConstraintForVideoRecordingQuirk.class);

    public Size[] getSupportedSizes(Size[] sizes) {
        if (this.mQuirk != null && RepeatingStreamConstraintForVideoRecordingQuirk.isHuaweiMate9()) {
            List<Size> supportedSizes = new ArrayList<>();
            for (Size s : sizes) {
                if (SIZE_COMPARATOR.compare(s, MINI_PREVIEW_SIZE_HUAWEI_MATE_9) >= 0) {
                    supportedSizes.add(s);
                }
            }
            return (Size[]) supportedSizes.toArray(new Size[0]);
        }
        return sizes;
    }
}
