package androidx.camera.video.internal.compat.quirk;

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
        if (MediaFormatMustNotUseFrameRateToFindEncoderQuirk.load()) {
            quirks.add(new MediaFormatMustNotUseFrameRateToFindEncoderQuirk());
        }
        if (MediaCodecInfoReportIncorrectInfoQuirk.load()) {
            quirks.add(new MediaCodecInfoReportIncorrectInfoQuirk());
        }
        if (DeactivateEncoderSurfaceBeforeStopEncoderQuirk.load()) {
            quirks.add(new DeactivateEncoderSurfaceBeforeStopEncoderQuirk());
        }
        if (CameraUseInconsistentTimebaseQuirk.load()) {
            quirks.add(new CameraUseInconsistentTimebaseQuirk());
        }
        if (ReportedVideoQualityNotSupportedQuirk.load()) {
            quirks.add(new ReportedVideoQualityNotSupportedQuirk());
        }
        if (EncoderNotUsePersistentInputSurfaceQuirk.load()) {
            quirks.add(new EncoderNotUsePersistentInputSurfaceQuirk());
        }
        if (VideoEncoderCrashQuirk.load()) {
            quirks.add(new VideoEncoderCrashQuirk());
        }
        if (ExcludeStretchedVideoQualityQuirk.load()) {
            quirks.add(new ExcludeStretchedVideoQualityQuirk());
        }
        if (MediaStoreVideoCannotWrite.load()) {
            quirks.add(new MediaStoreVideoCannotWrite());
        }
        if (AudioEncoderIgnoresInputTimestampQuirk.load()) {
            quirks.add(new AudioEncoderIgnoresInputTimestampQuirk());
        }
        if (VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.load()) {
            quirks.add(new VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk());
        }
        if (NegativeLatLongSavesIncorrectlyQuirk.load()) {
            quirks.add(new NegativeLatLongSavesIncorrectlyQuirk());
        }
        if (PreviewStretchWhenVideoCaptureIsBoundQuirk.load()) {
            quirks.add(new PreviewStretchWhenVideoCaptureIsBoundQuirk());
        }
        if (PreviewDelayWhenVideoCaptureIsBoundQuirk.load()) {
            quirks.add(new PreviewDelayWhenVideoCaptureIsBoundQuirk());
        }
        if (AudioTimestampFramePositionIncorrectQuirk.load()) {
            quirks.add(new AudioTimestampFramePositionIncorrectQuirk());
        }
        if (ImageCaptureFailedWhenVideoCaptureIsBoundQuirk.load()) {
            quirks.add(new ImageCaptureFailedWhenVideoCaptureIsBoundQuirk());
        }
        if (ExtraSupportedResolutionQuirk.load()) {
            quirks.add(new ExtraSupportedResolutionQuirk());
        }
        return quirks;
    }
}
