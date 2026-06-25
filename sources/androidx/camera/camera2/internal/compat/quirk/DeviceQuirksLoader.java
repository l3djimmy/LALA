package androidx.camera.camera2.internal.compat.quirk;

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
        if (ImageCapturePixelHDRPlusQuirk.load()) {
            quirks.add(new ImageCapturePixelHDRPlusQuirk());
        }
        if (ExtraCroppingQuirk.load()) {
            quirks.add(new ExtraCroppingQuirk());
        }
        if (Nexus4AndroidLTargetAspectRatioQuirk.load()) {
            quirks.add(new Nexus4AndroidLTargetAspectRatioQuirk());
        }
        if (ExcludedSupportedSizesQuirk.load()) {
            quirks.add(new ExcludedSupportedSizesQuirk());
        }
        if (CrashWhenTakingPhotoWithAutoFlashAEModeQuirk.load()) {
            quirks.add(new CrashWhenTakingPhotoWithAutoFlashAEModeQuirk());
        }
        if (PreviewPixelHDRnetQuirk.load()) {
            quirks.add(new PreviewPixelHDRnetQuirk());
        }
        if (StillCaptureFlashStopRepeatingQuirk.load()) {
            quirks.add(new StillCaptureFlashStopRepeatingQuirk());
        }
        if (ExtraSupportedSurfaceCombinationsQuirk.load()) {
            quirks.add(new ExtraSupportedSurfaceCombinationsQuirk());
        }
        if (FlashAvailabilityBufferUnderflowQuirk.load()) {
            quirks.add(new FlashAvailabilityBufferUnderflowQuirk());
        }
        if (RepeatingStreamConstraintForVideoRecordingQuirk.load()) {
            quirks.add(new RepeatingStreamConstraintForVideoRecordingQuirk());
        }
        if (TextureViewIsClosedQuirk.load()) {
            quirks.add(new TextureViewIsClosedQuirk());
        }
        if (CaptureSessionOnClosedNotCalledQuirk.load()) {
            quirks.add(new CaptureSessionOnClosedNotCalledQuirk());
        }
        if (TorchIsClosedAfterImageCapturingQuirk.load()) {
            quirks.add(new TorchIsClosedAfterImageCapturingQuirk());
        }
        if (ZslDisablerQuirk.load()) {
            quirks.add(new ZslDisablerQuirk());
        }
        if (ExtraSupportedOutputSizeQuirk.load()) {
            quirks.add(new ExtraSupportedOutputSizeQuirk());
        }
        if (InvalidVideoProfilesQuirk.load()) {
            quirks.add(new InvalidVideoProfilesQuirk());
        }
        if (SmallDisplaySizeQuirk.load()) {
            quirks.add(new SmallDisplaySizeQuirk());
        }
        return quirks;
    }
}
