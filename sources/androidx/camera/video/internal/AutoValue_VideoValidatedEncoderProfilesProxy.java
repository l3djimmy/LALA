package androidx.camera.video.internal;

import androidx.camera.core.impl.EncoderProfilesProxy;
import java.util.List;
/* loaded from: classes.dex */
final class AutoValue_VideoValidatedEncoderProfilesProxy extends VideoValidatedEncoderProfilesProxy {
    private final List<EncoderProfilesProxy.AudioProfileProxy> audioProfiles;
    private final EncoderProfilesProxy.AudioProfileProxy defaultAudioProfile;
    private final int defaultDurationSeconds;
    private final EncoderProfilesProxy.VideoProfileProxy defaultVideoProfile;
    private final int recommendedFileFormat;
    private final List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_VideoValidatedEncoderProfilesProxy(int defaultDurationSeconds, int recommendedFileFormat, List<EncoderProfilesProxy.AudioProfileProxy> audioProfiles, List<EncoderProfilesProxy.VideoProfileProxy> videoProfiles, EncoderProfilesProxy.AudioProfileProxy defaultAudioProfile, EncoderProfilesProxy.VideoProfileProxy defaultVideoProfile) {
        this.defaultDurationSeconds = defaultDurationSeconds;
        this.recommendedFileFormat = recommendedFileFormat;
        if (audioProfiles == null) {
            throw new NullPointerException("Null audioProfiles");
        }
        this.audioProfiles = audioProfiles;
        if (videoProfiles == null) {
            throw new NullPointerException("Null videoProfiles");
        }
        this.videoProfiles = videoProfiles;
        this.defaultAudioProfile = defaultAudioProfile;
        if (defaultVideoProfile == null) {
            throw new NullPointerException("Null defaultVideoProfile");
        }
        this.defaultVideoProfile = defaultVideoProfile;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public int getDefaultDurationSeconds() {
        return this.defaultDurationSeconds;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public int getRecommendedFileFormat() {
        return this.recommendedFileFormat;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public List<EncoderProfilesProxy.AudioProfileProxy> getAudioProfiles() {
        return this.audioProfiles;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy
    public List<EncoderProfilesProxy.VideoProfileProxy> getVideoProfiles() {
        return this.videoProfiles;
    }

    @Override // androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy
    public EncoderProfilesProxy.AudioProfileProxy getDefaultAudioProfile() {
        return this.defaultAudioProfile;
    }

    @Override // androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy
    public EncoderProfilesProxy.VideoProfileProxy getDefaultVideoProfile() {
        return this.defaultVideoProfile;
    }

    public String toString() {
        return "VideoValidatedEncoderProfilesProxy{defaultDurationSeconds=" + this.defaultDurationSeconds + ", recommendedFileFormat=" + this.recommendedFileFormat + ", audioProfiles=" + this.audioProfiles + ", videoProfiles=" + this.videoProfiles + ", defaultAudioProfile=" + this.defaultAudioProfile + ", defaultVideoProfile=" + this.defaultVideoProfile + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof VideoValidatedEncoderProfilesProxy) {
            VideoValidatedEncoderProfilesProxy that = (VideoValidatedEncoderProfilesProxy) o;
            return this.defaultDurationSeconds == that.getDefaultDurationSeconds() && this.recommendedFileFormat == that.getRecommendedFileFormat() && this.audioProfiles.equals(that.getAudioProfiles()) && this.videoProfiles.equals(that.getVideoProfiles()) && (this.defaultAudioProfile != null ? this.defaultAudioProfile.equals(that.getDefaultAudioProfile()) : that.getDefaultAudioProfile() == null) && this.defaultVideoProfile.equals(that.getDefaultVideoProfile());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.defaultDurationSeconds) * 1000003) ^ this.recommendedFileFormat) * 1000003) ^ this.audioProfiles.hashCode()) * 1000003) ^ this.videoProfiles.hashCode()) * 1000003) ^ (this.defaultAudioProfile == null ? 0 : this.defaultAudioProfile.hashCode())) * 1000003) ^ this.defaultVideoProfile.hashCode();
    }
}
