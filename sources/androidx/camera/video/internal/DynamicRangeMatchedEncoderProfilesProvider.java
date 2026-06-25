package androidx.camera.video.internal;

import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.EncoderProfilesProvider;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.internal.utils.DynamicRangeUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public class DynamicRangeMatchedEncoderProfilesProvider implements EncoderProfilesProvider {
    private final DynamicRange mDynamicRange;
    private final Map<Integer, EncoderProfilesProxy> mEncoderProfilesCache = new HashMap();
    private final EncoderProfilesProvider mEncoderProfilesProvider;

    public DynamicRangeMatchedEncoderProfilesProvider(EncoderProfilesProvider provider, DynamicRange dynamicRange) {
        this.mEncoderProfilesProvider = provider;
        this.mDynamicRange = dynamicRange;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public boolean hasProfile(int quality) {
        return this.mEncoderProfilesProvider.hasProfile(quality) && getProfilesInternal(quality) != null;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProvider
    public EncoderProfilesProxy getAll(int quality) {
        return getProfilesInternal(quality);
    }

    private EncoderProfilesProxy getProfilesInternal(int quality) {
        if (this.mEncoderProfilesCache.containsKey(Integer.valueOf(quality))) {
            return this.mEncoderProfilesCache.get(Integer.valueOf(quality));
        }
        if (!this.mEncoderProfilesProvider.hasProfile(quality)) {
            return null;
        }
        EncoderProfilesProxy baseProfiles = this.mEncoderProfilesProvider.getAll(quality);
        EncoderProfilesProxy profiles = filterUnmatchedDynamicRange(baseProfiles, this.mDynamicRange);
        this.mEncoderProfilesCache.put(Integer.valueOf(quality), profiles);
        return profiles;
    }

    private static EncoderProfilesProxy filterUnmatchedDynamicRange(EncoderProfilesProxy encoderProfiles, DynamicRange dynamicRange) {
        if (encoderProfiles == null) {
            return null;
        }
        List<EncoderProfilesProxy.VideoProfileProxy> validVideoProfiles = new ArrayList<>();
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : encoderProfiles.getVideoProfiles()) {
            if (isBitDepthMatched(videoProfile, dynamicRange) && isHdrEncodingMatched(videoProfile, dynamicRange)) {
                validVideoProfiles.add(videoProfile);
            }
        }
        if (validVideoProfiles.isEmpty()) {
            return null;
        }
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(encoderProfiles.getDefaultDurationSeconds(), encoderProfiles.getRecommendedFileFormat(), encoderProfiles.getAudioProfiles(), validVideoProfiles);
    }

    private static boolean isBitDepthMatched(EncoderProfilesProxy.VideoProfileProxy videoProfile, DynamicRange dynamicRange) {
        Set<Integer> matchedBitDepths = DynamicRangeUtil.DR_TO_VP_BIT_DEPTH_MAP.get(Integer.valueOf(dynamicRange.getBitDepth()));
        return matchedBitDepths != null && matchedBitDepths.contains(Integer.valueOf(videoProfile.getBitDepth()));
    }

    private static boolean isHdrEncodingMatched(EncoderProfilesProxy.VideoProfileProxy videoProfile, DynamicRange dynamicRange) {
        Set<Integer> matchedHdrEncodings = DynamicRangeUtil.DR_TO_VP_FORMAT_MAP.get(Integer.valueOf(dynamicRange.getEncoding()));
        return matchedHdrEncodings != null && matchedHdrEncodings.contains(Integer.valueOf(videoProfile.getHdrFormat()));
    }
}
