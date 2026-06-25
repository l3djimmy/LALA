package androidx.camera.video;

import android.util.Range;
import androidx.camera.video.VideoSpec;
/* loaded from: classes.dex */
final class AutoValue_VideoSpec extends VideoSpec {
    private final int aspectRatio;
    private final Range<Integer> bitrate;
    private final Range<Integer> frameRate;
    private final QualitySelector qualitySelector;

    private AutoValue_VideoSpec(QualitySelector qualitySelector, Range<Integer> frameRate, Range<Integer> bitrate, int aspectRatio) {
        this.qualitySelector = qualitySelector;
        this.frameRate = frameRate;
        this.bitrate = bitrate;
        this.aspectRatio = aspectRatio;
    }

    @Override // androidx.camera.video.VideoSpec
    public QualitySelector getQualitySelector() {
        return this.qualitySelector;
    }

    @Override // androidx.camera.video.VideoSpec
    public Range<Integer> getFrameRate() {
        return this.frameRate;
    }

    @Override // androidx.camera.video.VideoSpec
    public Range<Integer> getBitrate() {
        return this.bitrate;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.video.VideoSpec
    public int getAspectRatio() {
        return this.aspectRatio;
    }

    public String toString() {
        return "VideoSpec{qualitySelector=" + this.qualitySelector + ", frameRate=" + this.frameRate + ", bitrate=" + this.bitrate + ", aspectRatio=" + this.aspectRatio + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof VideoSpec) {
            VideoSpec that = (VideoSpec) o;
            return this.qualitySelector.equals(that.getQualitySelector()) && this.frameRate.equals(that.getFrameRate()) && this.bitrate.equals(that.getBitrate()) && this.aspectRatio == that.getAspectRatio();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.qualitySelector.hashCode()) * 1000003) ^ this.frameRate.hashCode()) * 1000003) ^ this.bitrate.hashCode()) * 1000003) ^ this.aspectRatio;
    }

    @Override // androidx.camera.video.VideoSpec
    public VideoSpec.Builder toBuilder() {
        return new Builder(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class Builder extends VideoSpec.Builder {
        private Integer aspectRatio;
        private Range<Integer> bitrate;
        private Range<Integer> frameRate;
        private QualitySelector qualitySelector;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Builder() {
        }

        private Builder(VideoSpec source) {
            this.qualitySelector = source.getQualitySelector();
            this.frameRate = source.getFrameRate();
            this.bitrate = source.getBitrate();
            this.aspectRatio = Integer.valueOf(source.getAspectRatio());
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setQualitySelector(QualitySelector qualitySelector) {
            if (qualitySelector == null) {
                throw new NullPointerException("Null qualitySelector");
            }
            this.qualitySelector = qualitySelector;
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setFrameRate(Range<Integer> frameRate) {
            if (frameRate == null) {
                throw new NullPointerException("Null frameRate");
            }
            this.frameRate = frameRate;
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setBitrate(Range<Integer> bitrate) {
            if (bitrate == null) {
                throw new NullPointerException("Null bitrate");
            }
            this.bitrate = bitrate;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec.Builder setAspectRatio(int aspectRatio) {
            this.aspectRatio = Integer.valueOf(aspectRatio);
            return this;
        }

        @Override // androidx.camera.video.VideoSpec.Builder
        public VideoSpec build() {
            String missing = this.qualitySelector == null ? " qualitySelector" : "";
            if (this.frameRate == null) {
                missing = missing + " frameRate";
            }
            if (this.bitrate == null) {
                missing = missing + " bitrate";
            }
            if (this.aspectRatio == null) {
                missing = missing + " aspectRatio";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_VideoSpec(this.qualitySelector, this.frameRate, this.bitrate, this.aspectRatio.intValue());
        }
    }
}
