package androidx.camera.core.impl.compat;

import android.media.EncoderProfiles;
import androidx.camera.core.impl.EncoderProfilesProxy;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
class EncoderProfilesProxyCompatApi31Impl {
    public static EncoderProfilesProxy from(EncoderProfiles encoderProfiles) {
        return EncoderProfilesProxy.ImmutableEncoderProfilesProxy.create(encoderProfiles.getDefaultDurationSeconds(), encoderProfiles.getRecommendedFileFormat(), fromAudioProfiles(encoderProfiles.getAudioProfiles()), fromVideoProfiles(encoderProfiles.getVideoProfiles()));
    }

    private static List<EncoderProfilesProxy.VideoProfileProxy> fromVideoProfiles(List<EncoderProfiles.VideoProfile> profiles) {
        List<EncoderProfilesProxy.VideoProfileProxy> proxies = new ArrayList<>();
        for (EncoderProfiles.VideoProfile profile : profiles) {
            proxies.add(EncoderProfilesProxy.VideoProfileProxy.create(profile.getCodec(), profile.getMediaType(), profile.getBitrate(), profile.getFrameRate(), profile.getWidth(), profile.getHeight(), profile.getProfile(), 8, 0, 0));
        }
        return proxies;
    }

    private static List<EncoderProfilesProxy.AudioProfileProxy> fromAudioProfiles(List<EncoderProfiles.AudioProfile> profiles) {
        List<EncoderProfilesProxy.AudioProfileProxy> proxies = new ArrayList<>();
        for (EncoderProfiles.AudioProfile profile : profiles) {
            proxies.add(EncoderProfilesProxy.AudioProfileProxy.create(profile.getCodec(), profile.getMediaType(), profile.getBitrate(), profile.getSampleRate(), profile.getChannels(), profile.getProfile()));
        }
        return proxies;
    }

    private EncoderProfilesProxyCompatApi31Impl() {
    }
}
