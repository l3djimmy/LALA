package androidx.camera.video.internal.encoder;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import androidx.camera.video.internal.workaround.EncoderFinder;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class EncoderInfoImpl implements EncoderInfo {
    protected final MediaCodecInfo.CodecCapabilities mCodecCapabilities;
    private final MediaCodecInfo mMediaCodecInfo;

    /* JADX INFO: Access modifiers changed from: package-private */
    public EncoderInfoImpl(MediaCodecInfo codecInfo, String mime) throws InvalidConfigException {
        this.mMediaCodecInfo = codecInfo;
        try {
            this.mCodecCapabilities = (MediaCodecInfo.CodecCapabilities) Objects.requireNonNull(codecInfo.getCapabilitiesForType(mime));
        } catch (RuntimeException e) {
            throw new InvalidConfigException("Unable to get CodecCapabilities for mime: " + mime, e);
        }
    }

    @Override // androidx.camera.video.internal.encoder.EncoderInfo
    public String getName() {
        return this.mMediaCodecInfo.getName();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static MediaCodecInfo findCodecAndGetCodecInfo(EncoderConfig encoderConfig) throws InvalidConfigException {
        MediaCodec codec = new EncoderFinder().findEncoder(encoderConfig.toMediaFormat());
        MediaCodecInfo codecInfo = codec.getCodecInfo();
        codec.release();
        return codecInfo;
    }
}
