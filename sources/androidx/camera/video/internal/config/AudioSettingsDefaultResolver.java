package androidx.camera.video.internal.config;

import android.util.Range;
import androidx.camera.core.Logger;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.core.util.Supplier;
/* loaded from: classes.dex */
public final class AudioSettingsDefaultResolver implements Supplier<AudioSettings> {
    private static final String TAG = "DefAudioResolver";
    private final AudioSpec mAudioSpec;

    public AudioSettingsDefaultResolver(AudioSpec audioSpec) {
        this.mAudioSpec = audioSpec;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.core.util.Supplier
    public AudioSettings get() {
        int resolvedChannelCount;
        int resolvedSampleRate;
        int resolvedAudioSource = AudioConfigUtil.resolveAudioSource(this.mAudioSpec);
        int resolvedSourceFormat = AudioConfigUtil.resolveAudioSourceFormat(this.mAudioSpec);
        int audioSpecChannelCount = this.mAudioSpec.getChannelCount();
        if (audioSpecChannelCount == -1) {
            resolvedChannelCount = 1;
            Logger.d(TAG, "Using fallback AUDIO channel count: 1");
        } else {
            resolvedChannelCount = audioSpecChannelCount;
            Logger.d(TAG, "Using supplied AUDIO channel count: " + audioSpecChannelCount);
        }
        Range<Integer> audioSpecSampleRateRange = this.mAudioSpec.getSampleRate();
        if (AudioSpec.SAMPLE_RATE_RANGE_AUTO.equals(audioSpecSampleRateRange)) {
            resolvedSampleRate = 44100;
            Logger.d(TAG, "Using fallback AUDIO sample rate: 44100Hz");
        } else {
            resolvedSampleRate = AudioConfigUtil.selectSampleRateOrNearestSupported(audioSpecSampleRateRange, resolvedChannelCount, resolvedSourceFormat, audioSpecSampleRateRange.getUpper().intValue());
            Logger.d(TAG, "Using AUDIO sample rate resolved from AudioSpec: " + resolvedSampleRate + "Hz");
        }
        return AudioSettings.builder().setAudioSource(resolvedAudioSource).setAudioFormat(resolvedSourceFormat).setChannelCount(resolvedChannelCount).setSampleRate(resolvedSampleRate).build();
    }
}
