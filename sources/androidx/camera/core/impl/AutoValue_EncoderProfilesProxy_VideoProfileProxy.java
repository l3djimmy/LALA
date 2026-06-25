package androidx.camera.core.impl;

import androidx.camera.core.impl.EncoderProfilesProxy;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_EncoderProfilesProxy_VideoProfileProxy extends EncoderProfilesProxy.VideoProfileProxy {
    private final int bitDepth;
    private final int bitrate;
    private final int chromaSubsampling;
    private final int codec;
    private final int frameRate;
    private final int hdrFormat;
    private final int height;
    private final String mediaType;
    private final int profile;
    private final int width;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_EncoderProfilesProxy_VideoProfileProxy(int codec, String mediaType, int bitrate, int frameRate, int width, int height, int profile, int bitDepth, int chromaSubsampling, int hdrFormat) {
        this.codec = codec;
        if (mediaType == null) {
            throw new NullPointerException("Null mediaType");
        }
        this.mediaType = mediaType;
        this.bitrate = bitrate;
        this.frameRate = frameRate;
        this.width = width;
        this.height = height;
        this.profile = profile;
        this.bitDepth = bitDepth;
        this.chromaSubsampling = chromaSubsampling;
        this.hdrFormat = hdrFormat;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getCodec() {
        return this.codec;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public String getMediaType() {
        return this.mediaType;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getBitrate() {
        return this.bitrate;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getFrameRate() {
        return this.frameRate;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getWidth() {
        return this.width;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getHeight() {
        return this.height;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getProfile() {
        return this.profile;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getBitDepth() {
        return this.bitDepth;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getChromaSubsampling() {
        return this.chromaSubsampling;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.VideoProfileProxy
    public int getHdrFormat() {
        return this.hdrFormat;
    }

    public String toString() {
        return "VideoProfileProxy{codec=" + this.codec + ", mediaType=" + this.mediaType + ", bitrate=" + this.bitrate + ", frameRate=" + this.frameRate + ", width=" + this.width + ", height=" + this.height + ", profile=" + this.profile + ", bitDepth=" + this.bitDepth + ", chromaSubsampling=" + this.chromaSubsampling + ", hdrFormat=" + this.hdrFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof EncoderProfilesProxy.VideoProfileProxy) {
            EncoderProfilesProxy.VideoProfileProxy that = (EncoderProfilesProxy.VideoProfileProxy) o;
            return this.codec == that.getCodec() && this.mediaType.equals(that.getMediaType()) && this.bitrate == that.getBitrate() && this.frameRate == that.getFrameRate() && this.width == that.getWidth() && this.height == that.getHeight() && this.profile == that.getProfile() && this.bitDepth == that.getBitDepth() && this.chromaSubsampling == that.getChromaSubsampling() && this.hdrFormat == that.getHdrFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((((((h$ ^ this.codec) * 1000003) ^ this.mediaType.hashCode()) * 1000003) ^ this.bitrate) * 1000003) ^ this.frameRate) * 1000003) ^ this.width) * 1000003) ^ this.height) * 1000003) ^ this.profile) * 1000003) ^ this.bitDepth) * 1000003) ^ this.chromaSubsampling) * 1000003) ^ this.hdrFormat;
    }
}
