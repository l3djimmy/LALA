package androidx.camera.core.impl;

import androidx.camera.core.impl.EncoderProfilesProxy;
/* loaded from: classes.dex */
final class AutoValue_EncoderProfilesProxy_AudioProfileProxy extends EncoderProfilesProxy.AudioProfileProxy {
    private final int bitrate;
    private final int channels;
    private final int codec;
    private final String mediaType;
    private final int profile;
    private final int sampleRate;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_EncoderProfilesProxy_AudioProfileProxy(int codec, String mediaType, int bitrate, int sampleRate, int channels, int profile) {
        this.codec = codec;
        if (mediaType == null) {
            throw new NullPointerException("Null mediaType");
        }
        this.mediaType = mediaType;
        this.bitrate = bitrate;
        this.sampleRate = sampleRate;
        this.channels = channels;
        this.profile = profile;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.AudioProfileProxy
    public int getCodec() {
        return this.codec;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.AudioProfileProxy
    public String getMediaType() {
        return this.mediaType;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.AudioProfileProxy
    public int getBitrate() {
        return this.bitrate;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.AudioProfileProxy
    public int getSampleRate() {
        return this.sampleRate;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.AudioProfileProxy
    public int getChannels() {
        return this.channels;
    }

    @Override // androidx.camera.core.impl.EncoderProfilesProxy.AudioProfileProxy
    public int getProfile() {
        return this.profile;
    }

    public String toString() {
        return "AudioProfileProxy{codec=" + this.codec + ", mediaType=" + this.mediaType + ", bitrate=" + this.bitrate + ", sampleRate=" + this.sampleRate + ", channels=" + this.channels + ", profile=" + this.profile + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof EncoderProfilesProxy.AudioProfileProxy) {
            EncoderProfilesProxy.AudioProfileProxy that = (EncoderProfilesProxy.AudioProfileProxy) o;
            return this.codec == that.getCodec() && this.mediaType.equals(that.getMediaType()) && this.bitrate == that.getBitrate() && this.sampleRate == that.getSampleRate() && this.channels == that.getChannels() && this.profile == that.getProfile();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.codec) * 1000003) ^ this.mediaType.hashCode()) * 1000003) ^ this.bitrate) * 1000003) ^ this.sampleRate) * 1000003) ^ this.channels) * 1000003) ^ this.profile;
    }
}
