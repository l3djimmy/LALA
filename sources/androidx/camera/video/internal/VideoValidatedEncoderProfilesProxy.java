package androidx.camera.video.internal;

import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public abstract class VideoValidatedEncoderProfilesProxy implements EncoderProfilesProxy {
    public abstract EncoderProfilesProxy.AudioProfileProxy getDefaultAudioProfile();

    public abstract EncoderProfilesProxy.VideoProfileProxy getDefaultVideoProfile();

    public static VideoValidatedEncoderProfilesProxy from(EncoderProfilesProxy profiles) {
        return create(profiles.getDefaultDurationSeconds(), profiles.getRecommendedFileFormat(), profiles.getAudioProfiles(), profiles.getVideoProfiles());
    }

    public static VideoValidatedEncoderProfilesProxy create(int defaultDurationSeconds, int recommendedFileFormat, List<EncoderProfilesProxy.AudioProfileProxy> audioProfiles, List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles) {
        EncoderProfilesProxy.AudioProfileProxy defaultAudioProfile;
        Preconditions.checkArgument(!videoProfiles.isEmpty(), "Should contain at least one VideoProfile.");
        EncoderProfilesProxy.VideoProfileProxy defaultVideoProfile = videoProfiles.get(0);
        if (audioProfiles.isEmpty()) {
            defaultAudioProfile = null;
        } else {
            EncoderProfilesProxy.AudioProfileProxy defaultAudioProfile2 = audioProfiles.get(0);
            defaultAudioProfile = defaultAudioProfile2;
        }
        return new AutoValue_VideoValidatedEncoderProfilesProxy(defaultDurationSeconds, recommendedFileFormat, Collections.unmodifiableList(new ArrayList(audioProfiles)), Collections.unmodifiableList(new ArrayList(videoProfiles)), defaultAudioProfile, defaultVideoProfile);
    }
}
