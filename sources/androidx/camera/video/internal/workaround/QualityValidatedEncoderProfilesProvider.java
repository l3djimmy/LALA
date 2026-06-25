package androidx.camera.video.internal.workaround;

import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Quirks;
import androidx.camera.video.Quality;
import androidx.camera.video.internal.compat.quirk.VideoQualityQuirk;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class QualityValidatedEncoderProfilesProvider implements EncoderProfilesProvider {
    private static final Map<Integer, Quality> CAMCORDER_TO_VIDEO_QUALITY_MAP = new HashMap();
    private final CameraInfoInternal mCameraInfo;
    private final EncoderProfilesProvider mProvider;
    private final Quirks mQuirks;

    static {
        CAMCORDER_TO_VIDEO_QUALITY_MAP.put(1, Quality.HIGHEST);
        CAMCORDER_TO_VIDEO_QUALITY_MAP.put(8, Quality.UHD);
        CAMCORDER_TO_VIDEO_QUALITY_MAP.put(6, Quality.FHD);
        CAMCORDER_TO_VIDEO_QUALITY_MAP.put(5, Quality.HD);
        CAMCORDER_TO_VIDEO_QUALITY_MAP.put(4, Quality.SD);
        CAMCORDER_TO_VIDEO_QUALITY_MAP.put(0, Quality.LOWEST);
    }

    public QualityValidatedEncoderProfilesProvider(EncoderProfilesProvider provider, CameraInfoInternal cameraInfo, Quirks quirks) {
        this.mProvider = provider;
        this.mCameraInfo = cameraInfo;
        this.mQuirks = quirks;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return this.mProvider.hasProfile(quality) && isDeviceValidQuality(quality);
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        if (!hasProfile(quality)) {
            return null;
        }
        return this.mProvider.getAll(quality);
    }

    private boolean isDeviceValidQuality(int quality) {
        Quality videoQuality = CAMCORDER_TO_VIDEO_QUALITY_MAP.get(Integer.valueOf(quality));
        if (videoQuality != null) {
            for (VideoQualityQuirk quirk : this.mQuirks.getAll(VideoQualityQuirk.class)) {
                if (quirk != null && quirk.isProblematicVideoQuality(this.mCameraInfo, videoQuality) && !quirk.workaroundBySurfaceProcessing()) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }
}
