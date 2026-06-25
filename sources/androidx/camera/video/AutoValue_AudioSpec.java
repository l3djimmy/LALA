package androidx.camera.video;

import android.util.Range;
import androidx.camera.video.AudioSpec;
/* loaded from: classes.dex */
final class AutoValue_AudioSpec extends AudioSpec {
    private final Range<Integer> bitrate;
    private final int channelCount;
    private final Range<Integer> sampleRate;
    private final int source;
    private final int sourceFormat;

    private AutoValue_AudioSpec(Range<Integer> bitrate, int sourceFormat, int source, Range<Integer> sampleRate, int channelCount) {
        this.bitrate = bitrate;
        this.sourceFormat = sourceFormat;
        this.source = source;
        this.sampleRate = sampleRate;
        this.channelCount = channelCount;
    }

    @Override // androidx.camera.video.AudioSpec
    public Range<Integer> getBitrate() {
        return this.bitrate;
    }

    @Override // androidx.camera.video.AudioSpec
    public int getSourceFormat() {
        return this.sourceFormat;
    }

    @Override // androidx.camera.video.AudioSpec
    public int getSource() {
        return this.source;
    }

    @Override // androidx.camera.video.AudioSpec
    public Range<Integer> getSampleRate() {
        return this.sampleRate;
    }

    @Override // androidx.camera.video.AudioSpec
    public int getChannelCount() {
        return this.channelCount;
    }

    public String toString() {
        return "AudioSpec{bitrate=" + this.bitrate + ", sourceFormat=" + this.sourceFormat + ", source=" + this.source + ", sampleRate=" + this.sampleRate + ", channelCount=" + this.channelCount + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AudioSpec) {
            AudioSpec that = (AudioSpec) o;
            return this.bitrate.equals(that.getBitrate()) && this.sourceFormat == that.getSourceFormat() && this.source == that.getSource() && this.sampleRate.equals(that.getSampleRate()) && this.channelCount == that.getChannelCount();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((h$ ^ this.bitrate.hashCode()) * 1000003) ^ this.sourceFormat) * 1000003) ^ this.source) * 1000003) ^ this.sampleRate.hashCode()) * 1000003) ^ this.channelCount;
    }

    @Override // androidx.camera.video.AudioSpec
    public AudioSpec.Builder toBuilder() {
        return new Builder(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class Builder extends AudioSpec.Builder {
        private Range<Integer> bitrate;
        private Integer channelCount;
        private Range<Integer> sampleRate;
        private Integer source;
        private Integer sourceFormat;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Builder() {
        }

        private Builder(AudioSpec source) {
            this.bitrate = source.getBitrate();
            this.sourceFormat = Integer.valueOf(source.getSourceFormat());
            this.source = Integer.valueOf(source.getSource());
            this.sampleRate = source.getSampleRate();
            this.channelCount = Integer.valueOf(source.getChannelCount());
        }

        @Override // androidx.camera.video.AudioSpec.Builder
        public AudioSpec.Builder setBitrate(Range<Integer> bitrate) {
            if (bitrate == null) {
                throw new NullPointerException("Null bitrate");
            }
            this.bitrate = bitrate;
            return this;
        }

        @Override // androidx.camera.video.AudioSpec.Builder
        public AudioSpec.Builder setSourceFormat(int sourceFormat) {
            this.sourceFormat = Integer.valueOf(sourceFormat);
            return this;
        }

        @Override // androidx.camera.video.AudioSpec.Builder
        public AudioSpec.Builder setSource(int source) {
            this.source = Integer.valueOf(source);
            return this;
        }

        @Override // androidx.camera.video.AudioSpec.Builder
        public AudioSpec.Builder setSampleRate(Range<Integer> sampleRate) {
            if (sampleRate == null) {
                throw new NullPointerException("Null sampleRate");
            }
            this.sampleRate = sampleRate;
            return this;
        }

        @Override // androidx.camera.video.AudioSpec.Builder
        public AudioSpec.Builder setChannelCount(int channelCount) {
            this.channelCount = Integer.valueOf(channelCount);
            return this;
        }

        @Override // androidx.camera.video.AudioSpec.Builder
        public AudioSpec build() {
            String missing = this.bitrate == null ? " bitrate" : "";
            if (this.sourceFormat == null) {
                missing = missing + " sourceFormat";
            }
            if (this.source == null) {
                missing = missing + " source";
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
            return new AutoValue_AudioSpec(this.bitrate, this.sourceFormat.intValue(), this.source.intValue(), this.sampleRate, this.channelCount.intValue());
        }
    }
}
