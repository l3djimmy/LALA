package androidx.camera.video;

import androidx.camera.video.MediaSpec;
/* loaded from: classes.dex */
final class AutoValue_MediaSpec extends MediaSpec {
    private final AudioSpec audioSpec;
    private final int outputFormat;
    private final VideoSpec videoSpec;

    private AutoValue_MediaSpec(VideoSpec videoSpec, AudioSpec audioSpec, int outputFormat) {
        this.videoSpec = videoSpec;
        this.audioSpec = audioSpec;
        this.outputFormat = outputFormat;
    }

    @Override // androidx.camera.video.MediaSpec
    public VideoSpec getVideoSpec() {
        return this.videoSpec;
    }

    @Override // androidx.camera.video.MediaSpec
    public AudioSpec getAudioSpec() {
        return this.audioSpec;
    }

    @Override // androidx.camera.video.MediaSpec
    public int getOutputFormat() {
        return this.outputFormat;
    }

    public String toString() {
        return "MediaSpec{videoSpec=" + this.videoSpec + ", audioSpec=" + this.audioSpec + ", outputFormat=" + this.outputFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof MediaSpec) {
            MediaSpec that = (MediaSpec) o;
            return this.videoSpec.equals(that.getVideoSpec()) && this.audioSpec.equals(that.getAudioSpec()) && this.outputFormat == that.getOutputFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.videoSpec.hashCode()) * 1000003) ^ this.audioSpec.hashCode()) * 1000003) ^ this.outputFormat;
    }

    @Override // androidx.camera.video.MediaSpec
    public MediaSpec.Builder toBuilder() {
        return new Builder(this);
    }

    /* loaded from: classes.dex */
    static final class Builder extends MediaSpec.Builder {
        private AudioSpec audioSpec;
        private Integer outputFormat;
        private VideoSpec videoSpec;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Builder() {
        }

        private Builder(MediaSpec source) {
            this.videoSpec = source.getVideoSpec();
            this.audioSpec = source.getAudioSpec();
            this.outputFormat = Integer.valueOf(source.getOutputFormat());
        }

        @Override // androidx.camera.video.MediaSpec.Builder
        public MediaSpec.Builder setVideoSpec(VideoSpec videoSpec) {
            if (videoSpec == null) {
                throw new NullPointerException("Null videoSpec");
            }
            this.videoSpec = videoSpec;
            return this;
        }

        @Override // androidx.camera.video.MediaSpec.Builder
        VideoSpec getVideoSpec() {
            if (this.videoSpec == null) {
                throw new IllegalStateException("Property \"videoSpec\" has not been set");
            }
            return this.videoSpec;
        }

        @Override // androidx.camera.video.MediaSpec.Builder
        public MediaSpec.Builder setAudioSpec(AudioSpec audioSpec) {
            if (audioSpec == null) {
                throw new NullPointerException("Null audioSpec");
            }
            this.audioSpec = audioSpec;
            return this;
        }

        @Override // androidx.camera.video.MediaSpec.Builder
        AudioSpec getAudioSpec() {
            if (this.audioSpec == null) {
                throw new IllegalStateException("Property \"audioSpec\" has not been set");
            }
            return this.audioSpec;
        }

        @Override // androidx.camera.video.MediaSpec.Builder
        public MediaSpec.Builder setOutputFormat(int outputFormat) {
            this.outputFormat = Integer.valueOf(outputFormat);
            return this;
        }

        @Override // androidx.camera.video.MediaSpec.Builder
        public MediaSpec build() {
            String missing = this.videoSpec == null ? " videoSpec" : "";
            if (this.audioSpec == null) {
                missing = missing + " audioSpec";
            }
            if (this.outputFormat == null) {
                missing = missing + " outputFormat";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_MediaSpec(this.videoSpec, this.audioSpec, this.outputFormat.intValue());
        }
    }
}
