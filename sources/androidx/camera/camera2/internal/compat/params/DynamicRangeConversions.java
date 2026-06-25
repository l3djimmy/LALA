package androidx.camera.camera2.internal.compat.params;

import android.hardware.camera2.params.DynamicRangeProfiles;
import androidx.camera.core.DynamicRange;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import okhttp3.internal.ws.RealWebSocket;
/* loaded from: classes.dex */
public final class DynamicRangeConversions {
    private static final Map<Long, DynamicRange> PROFILE_TO_DR_MAP = new HashMap();
    private static final Map<DynamicRange, List<Long>> DR_TO_PROFILE_MAP = new HashMap();

    static {
        PROFILE_TO_DR_MAP.put(1L, DynamicRange.SDR);
        DR_TO_PROFILE_MAP.put(DynamicRange.SDR, Collections.singletonList(1L));
        PROFILE_TO_DR_MAP.put(2L, DynamicRange.HLG_10_BIT);
        DR_TO_PROFILE_MAP.put(PROFILE_TO_DR_MAP.get(2L), Collections.singletonList(2L));
        PROFILE_TO_DR_MAP.put(4L, DynamicRange.HDR10_10_BIT);
        DR_TO_PROFILE_MAP.put(DynamicRange.HDR10_10_BIT, Collections.singletonList(4L));
        PROFILE_TO_DR_MAP.put(8L, DynamicRange.HDR10_PLUS_10_BIT);
        DR_TO_PROFILE_MAP.put(DynamicRange.HDR10_PLUS_10_BIT, Collections.singletonList(8L));
        List<Long> dolbyVision10BitProfilesOrdered = Arrays.asList(64L, 128L, 16L, 32L);
        for (Long profile : dolbyVision10BitProfilesOrdered) {
            PROFILE_TO_DR_MAP.put(profile, DynamicRange.DOLBY_VISION_10_BIT);
        }
        DR_TO_PROFILE_MAP.put(DynamicRange.DOLBY_VISION_10_BIT, dolbyVision10BitProfilesOrdered);
        List<Long> dolbyVision8BitProfilesOrdered = Arrays.asList(Long.valueOf((long) RealWebSocket.DEFAULT_MINIMUM_DEFLATE_SIZE), 2048L, 256L, 512L);
        for (Long profile2 : dolbyVision8BitProfilesOrdered) {
            PROFILE_TO_DR_MAP.put(profile2, DynamicRange.DOLBY_VISION_8_BIT);
        }
        DR_TO_PROFILE_MAP.put(DynamicRange.DOLBY_VISION_8_BIT, dolbyVision8BitProfilesOrdered);
    }

    public static DynamicRange profileToDynamicRange(long profile) {
        return PROFILE_TO_DR_MAP.get(Long.valueOf(profile));
    }

    public static Long dynamicRangeToFirstSupportedProfile(DynamicRange dynamicRange, DynamicRangeProfiles dynamicRangeProfiles) {
        List<Long> orderedProfiles = DR_TO_PROFILE_MAP.get(dynamicRange);
        if (orderedProfiles != null) {
            Set<Long> supportedList = dynamicRangeProfiles.getSupportedProfiles();
            for (Long profile : orderedProfiles) {
                if (supportedList.contains(profile)) {
                    return profile;
                }
            }
            return null;
        }
        return null;
    }

    private DynamicRangeConversions() {
    }
}
