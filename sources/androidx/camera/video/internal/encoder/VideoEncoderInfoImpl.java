package androidx.camera.video.internal.encoder;

import android.media.MediaCodecInfo;
import android.util.Range;
import java.util.Objects;
/* loaded from: classes.dex */
public class VideoEncoderInfoImpl extends EncoderInfoImpl implements VideoEncoderInfo {
    private final MediaCodecInfo.VideoCapabilities mVideoCapabilities;

    public static VideoEncoderInfoImpl from(VideoEncoderConfig encoderConfig) throws InvalidConfigException {
        return new VideoEncoderInfoImpl(findCodecAndGetCodecInfo(encoderConfig), encoderConfig.getMimeType());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public VideoEncoderInfoImpl(MediaCodecInfo codecInfo, String mime) throws InvalidConfigException {
        super(codecInfo, mime);
        this.mVideoCapabilities = (MediaCodecInfo.VideoCapabilities) Objects.requireNonNull(this.mCodecCapabilities.getVideoCapabilities());
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public boolean isSizeSupported(int width, int height) {
        return this.mVideoCapabilities.isSizeSupported(width, height);
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidths() {
        return this.mVideoCapabilities.getSupportedWidths();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeights() {
        return this.mVideoCapabilities.getSupportedHeights();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidthsFor(int height) {
        try {
            return this.mVideoCapabilities.getSupportedWidthsFor(height);
        } catch (Throwable t) {
            throw toIllegalArgumentException(t);
        }
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeightsFor(int width) {
        try {
            return this.mVideoCapabilities.getSupportedHeightsFor(width);
        } catch (Throwable t) {
            throw toIllegalArgumentException(t);
        }
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getWidthAlignment() {
        return this.mVideoCapabilities.getWidthAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getHeightAlignment() {
        return this.mVideoCapabilities.getHeightAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedBitrateRange() {
        return this.mVideoCapabilities.getBitrateRange();
    }

    private static IllegalArgumentException toIllegalArgumentException(Throwable t) {
        if (t instanceof IllegalArgumentException) {
            return (IllegalArgumentException) t;
        }
        return new IllegalArgumentException(t);
    }
}
