package androidx.camera.video.internal.config;

import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.internal.config.AudioMimeInfo;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_AudioMimeInfo extends AudioMimeInfo {
    private final EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile;
    private final String mimeType;
    private final int profile;

    private AutoValue_AudioMimeInfo(String mimeType, int profile, EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile) {
        this.mimeType = mimeType;
        this.profile = profile;
        this.compatibleAudioProfile = compatibleAudioProfile;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.video.internal.config.AudioMimeInfo
    public EncoderProfilesProxy.AudioProfileProxy getCompatibleAudioProfile() {
        return this.compatibleAudioProfile;
    }

    public String toString() {
        return "AudioMimeInfo{mimeType=" + this.mimeType + ", profile=" + this.profile + ", compatibleAudioProfile=" + this.compatibleAudioProfile + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AudioMimeInfo) {
            AudioMimeInfo that = (AudioMimeInfo) o;
            if (this.mimeType.equals(that.getMimeType()) && this.profile == that.getProfile()) {
                if (this.compatibleAudioProfile == null) {
                    if (that.getCompatibleAudioProfile() == null) {
                        return true;
                    }
                } else if (this.compatibleAudioProfile.equals(that.getCompatibleAudioProfile())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.mimeType.hashCode()) * 1000003) ^ this.profile) * 1000003) ^ (this.compatibleAudioProfile == null ? 0 : this.compatibleAudioProfile.hashCode());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class Builder extends AudioMimeInfo.Builder {
        private EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile;
        private String mimeType;
        private Integer profile;

        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public AudioMimeInfo.Builder setMimeType(String mimeType) {
            if (mimeType == null) {
                throw new NullPointerException("Null mimeType");
            }
            this.mimeType = mimeType;
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public AudioMimeInfo.Builder setProfile(int profile) {
            this.profile = Integer.valueOf(profile);
            return this;
        }

        @Override // androidx.camera.video.internal.config.AudioMimeInfo.Builder
        public AudioMimeInfo.Builder setCompatibleAudioProfile(EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile) {
            this.compatibleAudioProfile = compatibleAudioProfile;
            return this;
        }

        @Override // androidx.camera.video.internal.config.AudioMimeInfo.Builder, androidx.camera.video.internal.config.MimeInfo.Builder
        public AudioMimeInfo build() {
            String missing = this.mimeType == null ? " mimeType" : "";
            if (this.profile == null) {
                missing = missing + " profile";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_AudioMimeInfo(this.mimeType, this.profile.intValue(), this.compatibleAudioProfile);
        }
    }
}
