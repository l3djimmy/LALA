package androidx.camera.video.internal.config;

import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.video.internal.config.VideoMimeInfo;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_VideoMimeInfo extends VideoMimeInfo {
    private final EncoderProfilesProxy.VideoProfileProxy compatibleVideoProfile;
    private final String mimeType;
    private final int profile;

    private AutoValue_VideoMimeInfo(String mimeType, int profile, EncoderProfilesProxy.VideoProfileProxy compatibleVideoProfile) {
        this.mimeType = mimeType;
        this.profile = profile;
        this.compatibleVideoProfile = compatibleVideoProfile;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // androidx.camera.video.internal.config.MimeInfo
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.video.internal.config.VideoMimeInfo
    public EncoderProfilesProxy.VideoProfileProxy getCompatibleVideoProfile() {
        return this.compatibleVideoProfile;
    }

    public String toString() {
        return "VideoMimeInfo{mimeType=" + this.mimeType + ", profile=" + this.profile + ", compatibleVideoProfile=" + this.compatibleVideoProfile + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof VideoMimeInfo) {
            VideoMimeInfo that = (VideoMimeInfo) o;
            if (this.mimeType.equals(that.getMimeType()) && this.profile == that.getProfile()) {
                if (this.compatibleVideoProfile == null) {
                    if (that.getCompatibleVideoProfile() == null) {
                        return true;
                    }
                } else if (this.compatibleVideoProfile.equals(that.getCompatibleVideoProfile())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.mimeType.hashCode()) * 1000003) ^ this.profile) * 1000003) ^ (this.compatibleVideoProfile == null ? 0 : this.compatibleVideoProfile.hashCode());
    }

    /* loaded from: classes.dex */
    static final class Builder extends VideoMimeInfo.Builder {
        private EncoderProfilesProxy.VideoProfileProxy compatibleVideoProfile;
        private String mimeType;
        private Integer profile;

        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public VideoMimeInfo.Builder setMimeType(String mimeType) {
            if (mimeType == null) {
                throw new NullPointerException("Null mimeType");
            }
            this.mimeType = mimeType;
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.internal.config.MimeInfo.Builder
        public VideoMimeInfo.Builder setProfile(int profile) {
            this.profile = Integer.valueOf(profile);
            return this;
        }

        @Override // androidx.camera.video.internal.config.VideoMimeInfo.Builder
        public VideoMimeInfo.Builder setCompatibleVideoProfile(EncoderProfilesProxy.VideoProfileProxy compatibleVideoProfile) {
            this.compatibleVideoProfile = compatibleVideoProfile;
            return this;
        }

        @Override // androidx.camera.video.internal.config.VideoMimeInfo.Builder, androidx.camera.video.internal.config.MimeInfo.Builder
        public VideoMimeInfo build() {
            String missing = this.mimeType == null ? " mimeType" : "";
            if (this.profile == null) {
                missing = missing + " profile";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_VideoMimeInfo(this.mimeType, this.profile.intValue(), this.compatibleVideoProfile);
        }
    }
}
