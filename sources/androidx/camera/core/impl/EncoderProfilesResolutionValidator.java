package androidx.camera.core.impl;

import android.util.Size;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.quirk.ProfileResolutionQuirk;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public class EncoderProfilesResolutionValidator {
    private final List<ProfileResolutionQuirk> mQuirks = new ArrayList();
    private final Set<Size> mSupportedResolutions;

    public EncoderProfilesResolutionValidator(List<ProfileResolutionQuirk> quirks) {
        if (quirks != null) {
            this.mQuirks.addAll(quirks);
        }
        this.mSupportedResolutions = generateSupportedResolutions(quirks);
    }

    private Set<Size> generateSupportedResolutions(List<ProfileResolutionQuirk> quirks) {
        if (quirks == null || quirks.isEmpty()) {
            return Collections.emptySet();
        }
        Set<Size> supportedResolutions = new HashSet<>(quirks.get(0).getSupportedResolutions());
        for (int i = 1; i < quirks.size(); i++) {
            supportedResolutions.retainAll(quirks.get(i).getSupportedResolutions());
        }
        return supportedResolutions;
    }

    public boolean hasQuirk() {
        return !this.mQuirks.isEmpty();
    }

    public boolean hasValidVideoResolution(EncoderProfilesProxy profiles) {
        if (profiles == null) {
            return false;
        }
        if (!hasQuirk()) {
            return !profiles.getVideoProfiles().isEmpty();
        }
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : profiles.getVideoProfiles()) {
            Size videoSize = new Size(videoProfile.getWidth(), videoProfile.getHeight());
            if (this.mSupportedResolutions.contains(videoSize)) {
                return true;
            }
        }
        return false;
    }

    public EncoderProfilesProxy filterInvalidVideoResolution(EncoderProfilesProxy profiles) {
        if (profiles == null) {
            return null;
        }
        if (!hasQuirk()) {
            return profiles;
        }
        List<EncoderProfilesProxy.VideoProfileProxy> validVideoProfiles = new ArrayList<>();
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : profiles.getVideoProfiles()) {
            Size videoSize = new Size(videoProfile.getWidth(), videoProfile.getHeight());
            if (this.mSupportedResolutions.contains(videoSize)) {
                validVideoProfiles.add(videoProfile);
            }
        }
        if (validVideoProfiles.isEmpty()) {
            return null;
        }
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(profiles.getDefaultDurationSeconds(), profiles.getRecommendedFileFormat(), profiles.getAudioProfiles(), validVideoProfiles);
    }
}
