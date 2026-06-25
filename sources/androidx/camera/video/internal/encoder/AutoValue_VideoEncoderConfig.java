package androidx.camera.video.internal.encoder;

import android.util.Size;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
/* loaded from: classes.dex */
final class AutoValue_VideoEncoderConfig extends VideoEncoderConfig {
    private final int IFrameInterval;
    private final int bitrate;
    private final int colorFormat;
    private final VideoEncoderDataSpace dataSpace;
    private final int frameRate;
    private final Timebase inputTimebase;
    private final String mimeType;
    private final int profile;
    private final Size resolution;

    private AutoValue_VideoEncoderConfig(String mimeType, int profile, Timebase inputTimebase, Size resolution, int colorFormat, VideoEncoderDataSpace dataSpace, int frameRate, int IFrameInterval, int bitrate) {
        this.mimeType = mimeType;
        this.profile = profile;
        this.inputTimebase = inputTimebase;
        this.resolution = resolution;
        this.colorFormat = colorFormat;
        this.dataSpace = dataSpace;
        this.frameRate = frameRate;
        this.IFrameInterval = IFrameInterval;
        this.bitrate = bitrate;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig, androidx.camera.video.internal.encoder.EncoderConfig
    public Timebase getInputTimebase() {
        return this.inputTimebase;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig
    public Size getResolution() {
        return this.resolution;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig
    public int getColorFormat() {
        return this.colorFormat;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig
    public VideoEncoderDataSpace getDataSpace() {
        return this.dataSpace;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig
    public int getFrameRate() {
        return this.frameRate;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig
    public int getIFrameInterval() {
        return this.IFrameInterval;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig
    public int getBitrate() {
        return this.bitrate;
    }

    public String toString() {
        return "VideoEncoderConfig{mimeType=" + this.mimeType + ", profile=" + this.profile + ", inputTimebase=" + this.inputTimebase + ", resolution=" + this.resolution + ", colorFormat=" + this.colorFormat + ", dataSpace=" + this.dataSpace + ", frameRate=" + this.frameRate + ", IFrameInterval=" + this.IFrameInterval + ", bitrate=" + this.bitrate + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof VideoEncoderConfig) {
            VideoEncoderConfig that = (VideoEncoderConfig) o;
            return this.mimeType.equals(that.getMimeType()) && this.profile == that.getProfile() && this.inputTimebase.equals(that.getInputTimebase()) && this.resolution.equals(that.getResolution()) && this.colorFormat == that.getColorFormat() && this.dataSpace.equals(that.getDataSpace()) && this.frameRate == that.getFrameRate() && this.IFrameInterval == that.getIFrameInterval() && this.bitrate == that.getBitrate();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((((h$ ^ this.mimeType.hashCode()) * 1000003) ^ this.profile) * 1000003) ^ this.inputTimebase.hashCode()) * 1000003) ^ this.resolution.hashCode()) * 1000003) ^ this.colorFormat) * 1000003) ^ this.dataSpace.hashCode()) * 1000003) ^ this.frameRate) * 1000003) ^ this.IFrameInterval) * 1000003) ^ this.bitrate;
    }

    /* loaded from: classes.dex */
    static final class Builder extends VideoEncoderConfig.Builder {
        private Integer IFrameInterval;
        private Integer bitrate;
        private Integer colorFormat;
        private VideoEncoderDataSpace dataSpace;
        private Integer frameRate;
        private Timebase inputTimebase;
        private String mimeType;
        private Integer profile;
        private Size resolution;

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setMimeType(String mimeType) {
            if (mimeType == null) {
                throw new NullPointerException("Null mimeType");
            }
            this.mimeType = mimeType;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setProfile(int profile) {
            this.profile = Integer.valueOf(profile);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setInputTimebase(Timebase inputTimebase) {
            if (inputTimebase == null) {
                throw new NullPointerException("Null inputTimebase");
            }
            this.inputTimebase = inputTimebase;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setResolution(Size resolution) {
            if (resolution == null) {
                throw new NullPointerException("Null resolution");
            }
            this.resolution = resolution;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setColorFormat(int colorFormat) {
            this.colorFormat = Integer.valueOf(colorFormat);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setDataSpace(VideoEncoderDataSpace dataSpace) {
            if (dataSpace == null) {
                throw new NullPointerException("Null dataSpace");
            }
            this.dataSpace = dataSpace;
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setFrameRate(int frameRate) {
            this.frameRate = Integer.valueOf(frameRate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setIFrameInterval(int IFrameInterval) {
            this.IFrameInterval = Integer.valueOf(IFrameInterval);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig.Builder setBitrate(int bitrate) {
            this.bitrate = Integer.valueOf(bitrate);
            return this;
        }

        @Override // androidx.camera.video.internal.encoder.VideoEncoderConfig.Builder
        public VideoEncoderConfig build() {
            String missing = this.mimeType == null ? " mimeType" : "";
            if (this.profile == null) {
                missing = missing + " profile";
            }
            if (this.inputTimebase == null) {
                missing = missing + " inputTimebase";
            }
            if (this.resolution == null) {
                missing = missing + " resolution";
            }
            if (this.colorFormat == null) {
                missing = missing + " colorFormat";
            }
            if (this.dataSpace == null) {
                missing = missing + " dataSpace";
            }
            if (this.frameRate == null) {
                missing = missing + " frameRate";
            }
            if (this.IFrameInterval == null) {
                missing = missing + " IFrameInterval";
            }
            if (this.bitrate == null) {
                missing = missing + " bitrate";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_VideoEncoderConfig(this.mimeType, this.profile.intValue(), this.inputTimebase, this.resolution, this.colorFormat.intValue(), this.dataSpace, this.frameRate.intValue(), this.IFrameInterval.intValue(), this.bitrate.intValue());
        }
    }
}
