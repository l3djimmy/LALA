package androidx.camera.video.internal.config;

import android.util.Range;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
import androidx.core.util.Supplier;
/* loaded from: classes.dex */
public final class AudioEncoderConfigAudioProfileResolver implements Supplier<AudioEncoderConfig> {
    private static final String TAG = "AudioEncAdPrflRslvr";
    private final int mAudioProfile;
    private final EncoderProfilesProxy.AudioProfileProxy mAudioProfileProxy;
    private final AudioSettings mAudioSettings;
    private final AudioSpec mAudioSpec;
    private final Timebase mInputTimebase;
    private final String mMimeType;

    public AudioEncoderConfigAudioProfileResolver(String mimeType, int audioProfile, Timebase inputTimebase, AudioSpec audioSpec, AudioSettings audioSettings, EncoderProfilesProxy.AudioProfileProxy audioProfileProxy) {
        this.mMimeType = mimeType;
        this.mAudioProfile = audioProfile;
        this.mInputTimebase = inputTimebase;
        this.mAudioSpec = audioSpec;
        this.mAudioSettings = audioSettings;
        this.mAudioProfileProxy = audioProfileProxy;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.core.util.Supplier
    public AudioEncoderConfig get() {
        Logger.d(TAG, "Using resolved AUDIO bitrate from AudioProfile");
        Range<Integer> audioSpecBitrateRange = this.mAudioSpec.getBitrate();
        int resolvedBitrate = AudioConfigUtil.scaleAndClampBitrate(this.mAudioProfileProxy.getBitrate(), this.mAudioSettings.getChannelCount(), this.mAudioProfileProxy.getChannels(), this.mAudioSettings.getSampleRate(), this.mAudioProfileProxy.getSampleRate(), audioSpecBitrateRange);
        return AudioEncoderConfig.builder().setMimeType(this.mMimeType).setProfile(this.mAudioProfile).setInputTimebase(this.mInputTimebase).setChannelCount(this.mAudioSettings.getChannelCount()).setSampleRate(this.mAudioSettings.getSampleRate()).setBitrate(resolvedBitrate).build();
    }
}
