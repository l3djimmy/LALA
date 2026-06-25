package androidx.camera.video;

import android.util.Size;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.FallbackStrategy;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public final class QualitySelector {
    private static final String TAG = "QualitySelector";
    private final FallbackStrategy mFallbackStrategy;
    private final List<Quality> mPreferredQualityList;

    @Deprecated
    public static List<Quality> getSupportedQualities(CameraInfo cameraInfo) {
        return Recorder.getVideoCapabilities(cameraInfo).getSupportedQualities(DynamicRange.SDR);
    }

    @Deprecated
    public static boolean isQualitySupported(CameraInfo cameraInfo, Quality quality) {
        return Recorder.getVideoCapabilities(cameraInfo).isQualitySupported(quality, DynamicRange.SDR);
    }

    public static Size getResolution(CameraInfo cameraInfo, Quality quality) {
        checkQualityConstantsOrThrow(quality);
        VideoCapabilities videoCapabilities = Recorder.getVideoCapabilities(cameraInfo);
        VideoValidatedEncoderProfilesProxy profiles = videoCapabilities.getProfiles(quality, DynamicRange.SDR);
        if (profiles != null) {
            return getProfileVideoSize(profiles);
        }
        return null;
    }

    public static Map<Quality, Size> getQualityToResolutionMap(VideoCapabilities videoCapabilities, DynamicRange dynamicRange) {
        Map<Quality, Size> map = new HashMap<>();
        for (Quality supportedQuality : videoCapabilities.getSupportedQualities(dynamicRange)) {
            map.put(supportedQuality, getProfileVideoSize((VideoValidatedEncoderProfilesProxy) Objects.requireNonNull(videoCapabilities.getProfiles(supportedQuality, dynamicRange))));
        }
        return map;
    }

    QualitySelector(List<Quality> preferredQualityList, FallbackStrategy fallbackStrategy) {
        Preconditions.checkArgument((preferredQualityList.isEmpty() && fallbackStrategy == FallbackStrategy.NONE) ? false : true, "No preferred quality and fallback strategy.");
        this.mPreferredQualityList = Collections.unmodifiableList(new ArrayList(preferredQualityList));
        this.mFallbackStrategy = fallbackStrategy;
    }

    public static QualitySelector from(Quality quality) {
        return from(quality, FallbackStrategy.NONE);
    }

    public static QualitySelector from(Quality quality, FallbackStrategy fallbackStrategy) {
        Preconditions.checkNotNull(quality, "quality cannot be null");
        Preconditions.checkNotNull(fallbackStrategy, "fallbackStrategy cannot be null");
        checkQualityConstantsOrThrow(quality);
        return new QualitySelector(Collections.singletonList(quality), fallbackStrategy);
    }

    public static QualitySelector fromOrderedList(List<Quality> qualities) {
        return fromOrderedList(qualities, FallbackStrategy.NONE);
    }

    public static QualitySelector fromOrderedList(List<Quality> qualities, FallbackStrategy fallbackStrategy) {
        Preconditions.checkNotNull(qualities, "qualities cannot be null");
        Preconditions.checkNotNull(fallbackStrategy, "fallbackStrategy cannot be null");
        Preconditions.checkArgument(!qualities.isEmpty(), "qualities cannot be empty");
        checkQualityConstantsOrThrow(qualities);
        return new QualitySelector(qualities, fallbackStrategy);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<Quality> getPrioritizedQualities(List<Quality> supportedQualities) {
        if (supportedQualities.isEmpty()) {
            Logger.w(TAG, "No supported quality on the device.");
            return new ArrayList();
        }
        Logger.d(TAG, "supportedQualities = " + supportedQualities);
        Set<Quality> sortedQualities = new LinkedHashSet<>();
        Iterator<Quality> it = this.mPreferredQualityList.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Quality quality = it.next();
            if (quality == Quality.HIGHEST) {
                sortedQualities.addAll(supportedQualities);
                break;
            } else if (quality == Quality.LOWEST) {
                List<Quality> reversedList = new ArrayList<>(supportedQualities);
                Collections.reverse(reversedList);
                sortedQualities.addAll(reversedList);
                break;
            } else if (supportedQualities.contains(quality)) {
                sortedQualities.add(quality);
            } else {
                Logger.w(TAG, "quality is not supported and will be ignored: " + quality);
            }
        }
        addByFallbackStrategy(supportedQualities, sortedQualities);
        return new ArrayList(sortedQualities);
    }

    public String toString() {
        return "QualitySelector{preferredQualities=" + this.mPreferredQualityList + ", fallbackStrategy=" + this.mFallbackStrategy + "}";
    }

    private void addByFallbackStrategy(List<Quality> supportedQualities, Set<Quality> priorityQualities) {
        Quality fallbackQuality;
        if (supportedQualities.isEmpty() || priorityQualities.containsAll(supportedQualities)) {
            return;
        }
        Logger.d(TAG, "Select quality by fallbackStrategy = " + this.mFallbackStrategy);
        if (this.mFallbackStrategy == FallbackStrategy.NONE) {
            return;
        }
        Preconditions.checkState(this.mFallbackStrategy instanceof FallbackStrategy.RuleStrategy, "Currently only support type RuleStrategy");
        FallbackStrategy.RuleStrategy fallbackStrategy = (FallbackStrategy.RuleStrategy) this.mFallbackStrategy;
        List<Quality> sizeSortedQualities = Quality.getSortedQualities();
        if (fallbackStrategy.getFallbackQuality() == Quality.HIGHEST) {
            fallbackQuality = sizeSortedQualities.get(0);
        } else {
            Quality fallbackQuality2 = fallbackStrategy.getFallbackQuality();
            if (fallbackQuality2 == Quality.LOWEST) {
                fallbackQuality = sizeSortedQualities.get(sizeSortedQualities.size() - 1);
            } else {
                fallbackQuality = fallbackStrategy.getFallbackQuality();
            }
        }
        int index = sizeSortedQualities.indexOf(fallbackQuality);
        Preconditions.checkState(index != -1);
        List<Quality> largerQualities = new ArrayList<>();
        for (int i = index - 1; i >= 0; i--) {
            Quality quality = sizeSortedQualities.get(i);
            if (supportedQualities.contains(quality)) {
                largerQualities.add(quality);
            }
        }
        List<Quality> smallerQualities = new ArrayList<>();
        for (int i2 = index + 1; i2 < sizeSortedQualities.size(); i2++) {
            Quality quality2 = sizeSortedQualities.get(i2);
            if (supportedQualities.contains(quality2)) {
                smallerQualities.add(quality2);
            }
        }
        Logger.d(TAG, "sizeSortedQualities = " + sizeSortedQualities + ", fallback quality = " + fallbackQuality + ", largerQualities = " + largerQualities + ", smallerQualities = " + smallerQualities);
        switch (fallbackStrategy.getFallbackRule()) {
            case 0:
                return;
            case 1:
                priorityQualities.addAll(largerQualities);
                priorityQualities.addAll(smallerQualities);
                return;
            case 2:
                priorityQualities.addAll(largerQualities);
                return;
            case 3:
                priorityQualities.addAll(smallerQualities);
                priorityQualities.addAll(largerQualities);
                return;
            case 4:
                priorityQualities.addAll(smallerQualities);
                return;
            default:
                throw new AssertionError("Unhandled fallback strategy: " + this.mFallbackStrategy);
        }
    }

    private static Size getProfileVideoSize(VideoValidatedEncoderProfilesProxy profiles) {
        EncoderProfilesProxy.VideoProfileProxy videoProfile = profiles.getDefaultVideoProfile();
        return new Size(videoProfile.getWidth(), videoProfile.getHeight());
    }

    private static void checkQualityConstantsOrThrow(List<Quality> qualities) {
        for (Quality quality : qualities) {
            Preconditions.checkArgument(Quality.containsQuality(quality), "qualities contain invalid quality: " + quality);
        }
    }

    private static void checkQualityConstantsOrThrow(Quality quality) {
        Preconditions.checkArgument(Quality.containsQuality(quality), "Invalid quality: " + quality);
    }
}
