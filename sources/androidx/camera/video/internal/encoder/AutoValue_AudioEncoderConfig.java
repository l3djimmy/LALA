package androidx.camera.video.internal.encoder;

import androidx.camera.core.impl.Timebase;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
/* loaded from: classes.dex */
final class AutoValue_AudioEncoderConfig extends AudioEncoderConfig {
    private final int bitrate;
    private final int channelCount;
    private final Timebase inputTimebase;
    private final String mimeType;
    private final int profile;
    private final int sampleRate;

    private AutoValue_AudioEncoderConfig(String mimeType, int profile, Timebase inputTimebase, int bitrate, int sampleRate, int channelCount) {
        this.mimeType = mimeType;
        this.profile = profile;
        this.inputTimebase = inputTimebase;
        this.bitrate = bitrate;
        this.sampleRate = sampleRate;
        this.channelCount = channelCount;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public Timebase getInputTimebase() {
        return this.inputTimebase;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getBitrate() {
        return this.bitrate;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getSampleRate() {
        return this.sampleRate;
    }

    @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig
    public int getChannelCount() {
        return this.channelCount;
    }

    public String toString() {
        return "AudioEncoderConfig{mimeType=" + this.mimeType + ", profile=" + this.profile + ", inputTimebase=" + this.inputTimebase + ", bitrate=" + this.bitrate + ", sampleRate=" + this.sampleRate + ", channelCount=" + this.channelCount + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AudioEncoderConfig) {
            AudioEncoderConfig that = (AudioEncoderConfig) o;
            return this.mimeType.equals(that.getMimeType()) && this.profile == that.getProfile() && this.inputTimebase.equals(that.getInputTimebase()) && this.bitrate == that.getBitrate() && this.sampleRate == that.getSampleRate() && this.channelCount == that.getChannelCount();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.mimeType.hashCode()) * 1000003) ^ this.profile) * 1000003) ^ this.inputTimebase.hashCode()) * 1000003) ^ this.bitrate) * 1000003) ^ this.sampleRate) * 1000003) ^ this.channelCount;
    }

    /* loaded from: classes.dex */
    static final class Builder extends AudioEncoderConfig.Builder {
        private Integer bitrate;
        private Integer channelCount;
        private Timebase inputTimebase;
        private String mimeType;
        private Integer profile;
        private Integer sampleRate;

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setMimeType(String mimeType) {
            if (mimeType == null) {
                throw new NullPointerException("Null mimeType");
            }
            this.mimeType = mimeType;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setProfile(int profile) {
            this.profile = Integer.valueOf(profile);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setInputTimebase(Timebase inputTimebase) {
            if (inputTimebase == null) {
                throw new NullPointerException("Null inputTimebase");
            }
            this.inputTimebase = inputTimebase;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setBitrate(int bitrate) {
            this.bitrate = Integer.valueOf(bitrate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setSampleRate(int sampleRate) {
            this.sampleRate = Integer.valueOf(sampleRate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        public AudioEncoderConfig.Builder setChannelCount(int channelCount) {
            this.channelCount = Integer.valueOf(channelCount);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.AudioEncoderConfig.Builder
        AudioEncoderConfig autoBuild() {
            String missing = this.mimeType == null ? " mimeType" : "";
            if (this.profile == null) {
                missing = missing + " profile";
            }
            if (this.inputTimebase == null) {
                missing = missing + " inputTimebase";
            }
            if (this.bitrate == null) {
                missing = missing + " bitrate";
            }
            if (this.sampleRate == null) {
                missing = missing + " sampleRate";
            }
            if (this.channelCount == null) {
                missing = missing + " channelCount";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_AudioEncoderConfig(this.mimeType, this.profile.intValue(), this.inputTimebase, this.bitrate.intValue(), this.sampleRate.intValue(), this.channelCount.intValue());
        }
    }
}
