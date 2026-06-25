package androidx.camera.video;

import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.ResolutionValidatedEncoderProfilesProvider;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.video.Quality;
import androidx.camera.video.internal.BackupHdrProfileEncoderProfilesProvider;
import androidx.camera.video.internal.DynamicRangeMatchedEncoderProfilesProvider;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.workaround.QualityValidatedEncoderProfilesProvider;
import androidx.core.util.Preconditions;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
/* loaded from: classes.dex */
public final class RecorderVideoCapabilities implements VideoCapabilities {
    private static final String TAG = "RecorderVideoCapabilities";
    private final Map<DynamicRange, CapabilitiesByQuality> mCapabilitiesMapForFullySpecifiedDynamicRange = new HashMap();
    private final Map<DynamicRange, CapabilitiesByQuality> mCapabilitiesMapForNonFullySpecifiedDynamicRange = new HashMap();
    private final EncoderProfilesProvider mProfilesProvider;

    RecorderVideoCapabilities(CameraInfoInternal cameraInfoInternal, Function<EncoderProfilesProxy.VideoProfileProxy, EncoderProfilesProxy.VideoProfileProxy> backupVideoProfileValidator) {
        EncoderProfilesProvider encoderProfilesProvider = cameraInfoInternal.getEncoderProfilesProvider();
        encoderProfilesProvider = isHlg10SupportedByCamera(cameraInfoInternal) ? new BackupHdrProfileEncoderProfilesProvider(encoderProfilesProvider, backupVideoProfileValidator) : encoderProfilesProvider;
        Quirks cameraQuirks = cameraInfoInternal.getCameraQuirks();
        EncoderProfilesProvider encoderProfilesProvider2 = new ResolutionValidatedEncoderProfilesProvider(encoderProfilesProvider, cameraQuirks);
        Quirks deviceQuirks = DeviceQuirks.getAll();
        this.mProfilesProvider = new QualityValidatedEncoderProfilesProvider(encoderProfilesProvider2, cameraInfoInternal, deviceQuirks);
        for (DynamicRange dynamicRange : cameraInfoInternal.getSupportedDynamicRanges()) {
            EncoderProfilesProvider constrainedProvider = new DynamicRangeMatchedEncoderProfilesProvider(this.mProfilesProvider, dynamicRange);
            CapabilitiesByQuality capabilities = new CapabilitiesByQuality(constrainedProvider);
            if (!capabilities.getSupportedQualities().isEmpty()) {
                this.mCapabilitiesMapForFullySpecifiedDynamicRange.put(dynamicRange, capabilities);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static RecorderVideoCapabilities from(CameraInfo cameraInfo) {
        return new RecorderVideoCapabilities((CameraInfoInternal) cameraInfo, BackupHdrProfileEncoderProfilesProvider.DEFAULT_VALIDATOR);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public Set<DynamicRange> getSupportedDynamicRanges() {
        return this.mCapabilitiesMapForFullySpecifiedDynamicRange.keySet();
    }

    @Override // androidx.camera.video.VideoCapabilities
    public List<Quality> getSupportedQualities(DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        return capabilities == null ? new ArrayList() : capabilities.getSupportedQualities();
    }

    @Override // androidx.camera.video.VideoCapabilities
    public boolean isQualitySupported(Quality quality, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        return capabilities != null && capabilities.isQualitySupported(quality);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public VideoValidatedEncoderProfilesProxy getProfiles(Quality quality, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        if (capabilities == null) {
            return null;
        }
        return capabilities.getProfiles(quality);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public VideoValidatedEncoderProfilesProxy findHighestSupportedEncoderProfilesFor(Size size, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        if (capabilities == null) {
            return null;
        }
        return capabilities.findHighestSupportedEncoderProfilesFor(size);
    }

    @Override // androidx.camera.video.VideoCapabilities
    public Quality findHighestSupportedQualityFor(Size size, DynamicRange dynamicRange) {
        CapabilitiesByQuality capabilities = getCapabilities(dynamicRange);
        return capabilities == null ? Quality.NONE : capabilities.findHighestSupportedQualityFor(size);
    }

    private CapabilitiesByQuality getCapabilities(DynamicRange dynamicRange) {
        if (isFullySpecified(dynamicRange)) {
            return this.mCapabilitiesMapForFullySpecifiedDynamicRange.get(dynamicRange);
        }
        if (this.mCapabilitiesMapForNonFullySpecifiedDynamicRange.containsKey(dynamicRange)) {
            return this.mCapabilitiesMapForNonFullySpecifiedDynamicRange.get(dynamicRange);
        }
        CapabilitiesByQuality capabilities = generateCapabilitiesForNonFullySpecifiedDynamicRange(dynamicRange);
        this.mCapabilitiesMapForNonFullySpecifiedDynamicRange.put(dynamicRange, capabilities);
        return capabilities;
    }

    private static boolean isHlg10SupportedByCamera(CameraInfoInternal cameraInfoInternal) {
        Set<DynamicRange> dynamicRanges = cameraInfoInternal.getSupportedDynamicRanges();
        for (DynamicRange dynamicRange : dynamicRanges) {
            Integer encoding = Integer.valueOf(dynamicRange.getEncoding());
            int bitDepth = dynamicRange.getBitDepth();
            if (encoding.equals(3) && bitDepth == 10) {
                return true;
            }
        }
        return false;
    }

    private CapabilitiesByQuality generateCapabilitiesForNonFullySpecifiedDynamicRange(DynamicRange dynamicRange) {
        if (!canResolve(dynamicRange, getSupportedDynamicRanges())) {
            return null;
        }
        EncoderProfilesProvider constrainedProvider = new DynamicRangeMatchedEncoderProfilesProvider(this.mProfilesProvider, dynamicRange);
        return new CapabilitiesByQuality(constrainedProvider);
    }

    private static boolean canResolve(DynamicRange dynamicRangeToTest, Set<DynamicRange> fullySpecifiedDynamicRanges) {
        if (isFullySpecified(dynamicRangeToTest)) {
            return fullySpecifiedDynamicRanges.contains(dynamicRangeToTest);
        }
        for (DynamicRange fullySpecifiedDynamicRange : fullySpecifiedDynamicRanges) {
            if (canMatchBitDepth(dynamicRangeToTest, fullySpecifiedDynamicRange) && canMatchEncoding(dynamicRangeToTest, fullySpecifiedDynamicRange)) {
                return true;
            }
        }
        return false;
    }

    private static boolean canMatchBitDepth(DynamicRange dynamicRangeToTest, DynamicRange fullySpecifiedDynamicRange) {
        Preconditions.checkState(isFullySpecified(fullySpecifiedDynamicRange), "Fully specified range is not actually fully specified.");
        return dynamicRangeToTest.getBitDepth() == 0 || dynamicRangeToTest.getBitDepth() == fullySpecifiedDynamicRange.getBitDepth();
    }

    private static boolean canMatchEncoding(DynamicRange dynamicRangeToTest, DynamicRange fullySpecifiedDynamicRange) {
        Preconditions.checkState(isFullySpecified(fullySpecifiedDynamicRange), "Fully specified range is not actually fully specified.");
        int encodingToTest = dynamicRangeToTest.getEncoding();
        if (encodingToTest == 0) {
            return true;
        }
        int fullySpecifiedEncoding = fullySpecifiedDynamicRange.getEncoding();
        return (encodingToTest == 2 && fullySpecifiedEncoding != 1) || encodingToTest == fullySpecifiedEncoding;
    }

    private static boolean isFullySpecified(DynamicRange dynamicRange) {
        return (dynamicRange.getEncoding() == 0 || dynamicRange.getEncoding() == 2 || dynamicRange.getBitDepth() == 0) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class CapabilitiesByQuality {
        private final VideoValidatedEncoderProfilesProxy mHighestProfiles;
        private final VideoValidatedEncoderProfilesProxy mLowestProfiles;
        private final Map<Quality, VideoValidatedEncoderProfilesProxy> mSupportedProfilesMap = new LinkedHashMap();
        private final TreeMap<Size, Quality> mAreaSortedSizeToQualityMap = new TreeMap<>(new CompareSizesByArea());

        CapabilitiesByQuality(EncoderProfilesProvider provider) {
            for (Quality quality : Quality.getSortedQualities()) {
                EncoderProfilesProxy profiles = getEncoderProfiles(quality, provider);
                if (profiles != null) {
                    Logger.d(RecorderVideoCapabilities.TAG, "profiles = " + profiles);
                    VideoValidatedEncoderProfilesProxy validatedProfiles = toValidatedProfiles(profiles);
                    if (validatedProfiles == null) {
                        Logger.w(RecorderVideoCapabilities.TAG, "EncoderProfiles of quality " + quality + " has no video validated profiles.");
                    } else {
                        EncoderProfilesProxy.VideoProfileProxy videoProfile = validatedProfiles.getDefaultVideoProfile();
                        Size size = new Size(videoProfile.getWidth(), videoProfile.getHeight());
                        this.mAreaSortedSizeToQualityMap.put(size, quality);
                        this.mSupportedProfilesMap.put(quality, validatedProfiles);
                    }
                }
            }
            if (this.mSupportedProfilesMap.isEmpty()) {
                Logger.e(RecorderVideoCapabilities.TAG, "No supported EncoderProfiles");
                this.mLowestProfiles = null;
                this.mHighestProfiles = null;
                return;
            }
            Deque<VideoValidatedEncoderProfilesProxy> profileQueue = new ArrayDeque<>(this.mSupportedProfilesMap.values());
            this.mHighestProfiles = profileQueue.peekFirst();
            this.mLowestProfiles = profileQueue.peekLast();
        }

        public List<Quality> getSupportedQualities() {
            return new ArrayList(this.mSupportedProfilesMap.keySet());
        }

        public boolean isQualitySupported(Quality quality) {
            checkQualityConstantsOrThrow(quality);
            return getProfiles(quality) != null;
        }

        public VideoValidatedEncoderProfilesProxy getProfiles(Quality quality) {
            checkQualityConstantsOrThrow(quality);
            if (quality == Quality.HIGHEST) {
                return this.mHighestProfiles;
            }
            if (quality == Quality.LOWEST) {
                return this.mLowestProfiles;
            }
            return this.mSupportedProfilesMap.get(quality);
        }

        public VideoValidatedEncoderProfilesProxy findHighestSupportedEncoderProfilesFor(Size size) {
            VideoValidatedEncoderProfilesProxy encoderProfiles = null;
            Quality highestSupportedQuality = findHighestSupportedQualityFor(size);
            Logger.d(RecorderVideoCapabilities.TAG, "Using supported quality of " + highestSupportedQuality + " for size " + size);
            if (highestSupportedQuality != Quality.NONE && (encoderProfiles = getProfiles(highestSupportedQuality)) == null) {
                throw new AssertionError("Camera advertised available quality but did not produce EncoderProfiles for advertised quality.");
            }
            return encoderProfiles;
        }

        public Quality findHighestSupportedQualityFor(Size size) {
            Map.Entry<Size, Quality> ceilEntry = this.mAreaSortedSizeToQualityMap.ceilingEntry(size);
            if (ceilEntry != null) {
                return ceilEntry.getValue();
            }
            Map.Entry<Size, Quality> floorEntry = this.mAreaSortedSizeToQualityMap.floorEntry(size);
            if (floorEntry != null) {
                return floorEntry.getValue();
            }
            return Quality.NONE;
        }

        private EncoderProfilesProxy getEncoderProfiles(Quality quality, EncoderProfilesProvider provider) {
            Preconditions.checkState(quality instanceof Quality.ConstantQuality, "Currently only support ConstantQuality");
            int qualityValue = ((Quality.ConstantQuality) quality).getValue();
            return provider.getAll(qualityValue);
        }

        private VideoValidatedEncoderProfilesProxy toValidatedProfiles(EncoderProfilesProxy profiles) {
            List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles = profiles.getVideoProfiles();
            if (videoProfiles.isEmpty()) {
                return null;
            }
            return VideoValidatedEncoderProfilesProxy.from(profiles);
        }

        private static void checkQualityConstantsOrThrow(Quality quality) {
            Preconditions.checkArgument(Quality.containsQuality(quality), "Unknown quality: " + quality);
        }
    }
}
