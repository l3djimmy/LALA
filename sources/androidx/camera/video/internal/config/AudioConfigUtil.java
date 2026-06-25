package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Rational;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.MediaSpec;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.camera.video.internal.audio.AudioSource;
import androidx.camera.video.internal.config.AudioMimeInfo;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
import androidx.core.util.Supplier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public final class AudioConfigUtil {
    static final int AUDIO_CHANNEL_COUNT_DEFAULT = 1;
    static final int AUDIO_SAMPLE_RATE_DEFAULT = 44100;
    static final int AUDIO_SOURCE_DEFAULT = 5;
    static final int AUDIO_SOURCE_FORMAT_DEFAULT = 2;
    private static final String TAG = "AudioConfigUtil";

    private AudioConfigUtil() {
    }

    public static AudioMimeInfo resolveAudioMimeInfo(MediaSpec mediaSpec, VideoValidatedEncoderProfilesProxy encoderProfiles) {
        String mediaSpecAudioMime = MediaSpec.outputFormatToAudioMime(mediaSpec.getOutputFormat());
        int mediaSpecAudioProfile = MediaSpec.outputFormatToAudioProfile(mediaSpec.getOutputFormat());
        String resolvedAudioMime = mediaSpecAudioMime;
        int resolvedAudioProfile = mediaSpecAudioProfile;
        EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile = null;
        if (encoderProfiles != null && encoderProfiles.getDefaultAudioProfile() != null) {
            EncoderProfilesProxy.AudioProfileProxy audioProfile = encoderProfiles.getDefaultAudioProfile();
            String encoderProfileAudioMime = audioProfile.getMediaType();
            int encoderProfileAudioProfile = audioProfile.getProfile();
            if (Objects.equals(encoderProfileAudioMime, EncoderProfilesProxy.AudioProfileProxy.MEDIA_TYPE_NONE)) {
                Logger.d(TAG, "EncoderProfiles contains undefined AUDIO mime type so cannot be used. May rely on fallback defaults to derive settings [chosen mime type: " + resolvedAudioMime + "(profile: " + resolvedAudioProfile + ")]");
            } else if (mediaSpec.getOutputFormat() == -1) {
                compatibleAudioProfile = audioProfile;
                resolvedAudioMime = encoderProfileAudioMime;
                resolvedAudioProfile = encoderProfileAudioProfile;
                Logger.d(TAG, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using EncoderProfiles to derive AUDIO settings [mime type: " + resolvedAudioMime + "(profile: " + resolvedAudioProfile + ")]");
            } else if (Objects.equals(mediaSpecAudioMime, encoderProfileAudioMime) && mediaSpecAudioProfile == encoderProfileAudioProfile) {
                compatibleAudioProfile = audioProfile;
                resolvedAudioMime = encoderProfileAudioMime;
                Logger.d(TAG, "MediaSpec audio mime/profile matches EncoderProfiles. Using EncoderProfiles to derive AUDIO settings [mime type: " + resolvedAudioMime + "(profile: " + resolvedAudioProfile + ")]");
            } else {
                Logger.d(TAG, "MediaSpec audio mime or profile does not match EncoderProfiles, so EncoderProfiles settings cannot be used. May rely on fallback defaults to derive AUDIO settings [EncoderProfiles mime type: " + encoderProfileAudioMime + "(profile: " + encoderProfileAudioProfile + "), chosen mime type: " + resolvedAudioMime + "(profile: " + resolvedAudioProfile + ")]");
            }
        }
        AudioMimeInfo.Builder mimeInfoBuilder = AudioMimeInfo.builder(resolvedAudioMime).setProfile(resolvedAudioProfile);
        if (compatibleAudioProfile != null) {
            mimeInfoBuilder.setCompatibleAudioProfile(compatibleAudioProfile);
        }
        return mimeInfoBuilder.build();
    }

    public static AudioSettings resolveAudioSettings(AudioMimeInfo audioMimeInfo, AudioSpec audioSpec) {
        Supplier<AudioSettings> settingsSupplier;
        EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile = audioMimeInfo.getCompatibleAudioProfile();
        if (compatibleAudioProfile != null) {
            settingsSupplier = new AudioSettingsAudioProfileResolver(audioSpec, compatibleAudioProfile);
        } else {
            settingsSupplier = new AudioSettingsDefaultResolver(audioSpec);
        }
        return settingsSupplier.get();
    }

    public static AudioEncoderConfig resolveAudioEncoderConfig(AudioMimeInfo audioMimeInfo, Timebase inputTimebase, AudioSettings audioSettings, AudioSpec audioSpec) {
        Supplier<AudioEncoderConfig> configSupplier;
        EncoderProfilesProxy.AudioProfileProxy compatibleAudioProfile = audioMimeInfo.getCompatibleAudioProfile();
        if (compatibleAudioProfile != null) {
            configSupplier = new AudioEncoderConfigAudioProfileResolver(audioMimeInfo.getMimeType(), audioMimeInfo.getProfile(), inputTimebase, audioSpec, audioSettings, compatibleAudioProfile);
        } else {
            configSupplier = new AudioEncoderConfigDefaultResolver(audioMimeInfo.getMimeType(), audioMimeInfo.getProfile(), inputTimebase, audioSpec, audioSettings);
        }
        return configSupplier.get();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int resolveAudioSource(AudioSpec audioSpec) {
        int resolvedAudioSource = audioSpec.getSource();
        if (resolvedAudioSource == -1) {
            Logger.d(TAG, "Using default AUDIO source: 5");
            return 5;
        }
        Logger.d(TAG, "Using provided AUDIO source: " + resolvedAudioSource);
        return resolvedAudioSource;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int resolveAudioSourceFormat(AudioSpec audioSpec) {
        int resolvedAudioSourceFormat = audioSpec.getSourceFormat();
        if (resolvedAudioSourceFormat == -1) {
            Logger.d(TAG, "Using default AUDIO source format: 2");
            return 2;
        }
        Logger.d(TAG, "Using provided AUDIO source format: " + resolvedAudioSourceFormat);
        return resolvedAudioSourceFormat;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int selectSampleRateOrNearestSupported(Range<Integer> targetRange, int channelCount, int sourceFormat, final int initialTargetSampleRate) {
        int selectedSampleRate = initialTargetSampleRate;
        List<Integer> sortedCommonSampleRates = null;
        int i = 0;
        while (true) {
            if (targetRange.contains((Range<Integer>) Integer.valueOf(selectedSampleRate))) {
                if (AudioSource.isSettingsSupported(selectedSampleRate, channelCount, sourceFormat)) {
                    return selectedSampleRate;
                }
                Logger.d(TAG, "Sample rate " + selectedSampleRate + "Hz is not supported by audio source with channel count " + channelCount + " and source format " + sourceFormat);
            } else {
                Logger.d(TAG, "Sample rate " + selectedSampleRate + "Hz is not in target range " + targetRange);
            }
            if (sortedCommonSampleRates == null) {
                Logger.d(TAG, "Trying common sample rates in proximity order to target " + initialTargetSampleRate + "Hz");
                List<Integer> sortedCommonSampleRates2 = new ArrayList<>(AudioSettings.COMMON_SAMPLE_RATES);
                Collections.sort(sortedCommonSampleRates2, new Comparator() { // from class: androidx.camera.video.internal.config.AudioConfigUtil$$ExternalSyntheticLambda0
                    @Override // java.util.Comparator
                    public final int compare(Object obj, Object obj2) {
                        return AudioConfigUtil.lambda$selectSampleRateOrNearestSupported$0(initialTargetSampleRate, (Integer) obj, (Integer) obj2);
                    }
                });
                sortedCommonSampleRates = sortedCommonSampleRates2;
            }
            if (i < sortedCommonSampleRates.size()) {
                selectedSampleRate = sortedCommonSampleRates.get(i).intValue();
                i++;
            } else {
                Logger.d(TAG, "No sample rate found in target range or supported by audio source. Falling back to default sample rate of 44100Hz");
                return AUDIO_SAMPLE_RATE_DEFAULT;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ int lambda$selectSampleRateOrNearestSupported$0(int initialTargetSampleRate, Integer x, Integer y) {
        int relativeDifference = Math.abs(x.intValue() - initialTargetSampleRate) - Math.abs(y.intValue() - initialTargetSampleRate);
        if (relativeDifference == 0) {
            return (int) Math.signum(x.intValue() - y.intValue());
        }
        return (int) Math.signum(relativeDifference);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int scaleAndClampBitrate(int baseBitrate, int actualChannelCount, int baseChannelCount, int actualSampleRate, int baseSampleRate, Range<Integer> clampedRange) {
        Rational channelCountRatio = new Rational(actualChannelCount, baseChannelCount);
        Rational sampleRateRatio = new Rational(actualSampleRate, baseSampleRate);
        int resolvedBitrate = (int) (baseBitrate * channelCountRatio.doubleValue() * sampleRateRatio.doubleValue());
        String debugString = "";
        if (Logger.isDebugEnabled(TAG)) {
            debugString = String.format("Base Bitrate(%dbps) * Channel Count Ratio(%d / %d) * Sample Rate Ratio(%d / %d) = %d", Integer.valueOf(baseBitrate), Integer.valueOf(actualChannelCount), Integer.valueOf(baseChannelCount), Integer.valueOf(actualSampleRate), Integer.valueOf(baseSampleRate), Integer.valueOf(resolvedBitrate));
        }
        if (!AudioSpec.BITRATE_RANGE_AUTO.equals(clampedRange)) {
            resolvedBitrate = clampedRange.clamp(Integer.valueOf(resolvedBitrate)).intValue();
            if (Logger.isDebugEnabled(TAG)) {
                debugString = debugString + String.format("\nClamped to range %s -> %dbps", clampedRange, Integer.valueOf(resolvedBitrate));
            }
        }
        Logger.d(TAG, debugString);
        return resolvedBitrate;
    }
}
