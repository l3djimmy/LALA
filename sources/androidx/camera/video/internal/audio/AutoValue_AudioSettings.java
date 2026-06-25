package androidx.camera.video.internal.audio;

import androidx.camera.video.internal.audio.AudioSettings;
/* loaded from: classes.dex */
final class AutoValue_AudioSettings extends AudioSettings {
    private final int audioFormat;
    private final int audioSource;
    private final int channelCount;
    private final int sampleRate;

    private AutoValue_AudioSettings(int audioSource, int sampleRate, int channelCount, int audioFormat) {
        this.audioSource = audioSource;
        this.sampleRate = sampleRate;
        this.channelCount = channelCount;
        this.audioFormat = audioFormat;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getAudioSource() {
        return this.audioSource;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getSampleRate() {
        return this.sampleRate;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getChannelCount() {
        return this.channelCount;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public int getAudioFormat() {
        return this.audioFormat;
    }

    public String toString() {
        return "AudioSettings{audioSource=" + this.audioSource + ", sampleRate=" + this.sampleRate + ", channelCount=" + this.channelCount + ", audioFormat=" + this.audioFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AudioSettings) {
            AudioSettings that = (AudioSettings) o;
            return this.audioSource == that.getAudioSource() && this.sampleRate == that.getSampleRate() && this.channelCount == that.getChannelCount() && this.audioFormat == that.getAudioFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.audioSource) * 1000003) ^ this.sampleRate) * 1000003) ^ this.channelCount) * 1000003) ^ this.audioFormat;
    }

    @Override // androidx.camera.video.internal.audio.AudioSettings
    public AudioSettings.Builder toBuilder() {
        return new Builder(this);
    }

    /* loaded from: classes.dex */
    static final class Builder extends AudioSettings.Builder {
        private Integer audioFormat;
        private Integer audioSource;
        private Integer channelCount;
        private Integer sampleRate;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Builder() {
        }

        private Builder(AudioSettings source) {
            this.audioSource = Integer.valueOf(source.getAudioSource());
            this.sampleRate = Integer.valueOf(source.getSampleRate());
            this.channelCount = Integer.valueOf(source.getChannelCount());
            this.audioFormat = Integer.valueOf(source.getAudioFormat());
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setAudioSource(int audioSource) {
            this.audioSource = Integer.valueOf(audioSource);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setSampleRate(int sampleRate) {
            this.sampleRate = Integer.valueOf(sampleRate);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setChannelCount(int channelCount) {
            this.channelCount = Integer.valueOf(channelCount);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        public AudioSettings.Builder setAudioFormat(int audioFormat) {
            this.audioFormat = Integer.valueOf(audioFormat);
            return this;
        }

        @Override // androidx.camera.video.internal.audio.AudioSettings.Builder
        AudioSettings autoBuild() {
            String missing = this.audioSource == null ? " audioSource" : "";
            if (this.sampleRate == null) {
                missing = missing + " sampleRate";
            }
            if (this.channelCount == null) {
                missing = missing + " channelCount";
            }
            if (this.audioFormat == null) {
                missing = missing + " audioFormat";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_AudioSettings(this.audioSource.intValue(), this.sampleRate.intValue(), this.channelCount.intValue(), this.audioFormat.intValue());
        }
    }
}
