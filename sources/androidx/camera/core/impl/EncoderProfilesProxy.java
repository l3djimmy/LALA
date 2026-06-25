package androidx.camera.core.impl;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public interface EncoderProfilesProxy {
    public static final int CODEC_PROFILE_NONE = -1;

    List<AudioProfileProxy> getAudioProfiles();

    int getDefaultDurationSeconds();

    int getRecommendedFileFormat();

    List<VideoProfileProxy> getVideoProfiles();

    /* loaded from: classes.dex */
    public static abstract class VideoProfileProxy {
        public static final int BIT_DEPTH_10 = 10;
        public static final int BIT_DEPTH_8 = 8;
        public static final String MEDIA_TYPE_NONE = "video/none";

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface VideoEncoder {
        }

        public abstract int getBitDepth();

        public abstract int getBitrate();

        public abstract int getChromaSubsampling();

        public abstract int getCodec();

        public abstract int getFrameRate();

        public abstract int getHdrFormat();

        public abstract int getHeight();

        public abstract String getMediaType();

        public abstract int getProfile();

        public abstract int getWidth();

        public static VideoProfileProxy create(int codec, String mediaType, int bitrate, int frameRate, int width, int height, int profile, int bitDepth, int chromaSubsampling, int hdrFormat) {
            return new AutoValue_EncoderProfilesProxy_VideoProfileProxy(codec, mediaType, bitrate, frameRate, width, height, profile, bitDepth, chromaSubsampling, hdrFormat);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class AudioProfileProxy {
        public static final String MEDIA_TYPE_NONE = "audio/none";

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface AudioEncoder {
        }

        public abstract int getBitrate();

        public abstract int getChannels();

        public abstract int getCodec();

        public abstract String getMediaType();

        public abstract int getProfile();

        public abstract int getSampleRate();

        public static AudioProfileProxy create(int codec, String mediaType, int bitRate, int sampleRate, int channels, int profile) {
            return new AutoValue_EncoderProfilesProxy_AudioProfileProxy(codec, mediaType, bitRate, sampleRate, channels, profile);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class ImmutableEncoderProfilesProxy implements EncoderProfilesProxy {
        public static ImmutableEncoderProfilesProxy create(int defaultDurationSeconds, int recommendedFileFormat, List<AudioProfileProxy> audioProfiles, List<VideoProfileProxy> videoProfiles) {
            return new AutoValue_EncoderProfilesProxy_ImmutableEncoderProfilesProxy(defaultDurationSeconds, recommendedFileFormat, Collections.unmodifiableList(new ArrayList(audioProfiles)), Collections.unmodifiableList(new ArrayList(videoProfiles)));
        }
    }

    static String getVideoCodecMimeType(int codec) {
        switch (codec) {
            case 1:
                return "video/3gpp";
            case 2:
                return "video/avc";
            case 3:
                return "video/mp4v-es";
            case 4:
                return "video/x-vnd.on2.vp8";
            case 5:
                return "video/hevc";
            case 6:
                return "video/x-vnd.on2.vp9";
            case 7:
                return "video/dolby-vision";
            case 8:
                return "video/av01";
            default:
                return VideoProfileProxy.MEDIA_TYPE_NONE;
        }
    }

    static String getAudioCodecMimeType(int codec) {
        switch (codec) {
            case 1:
                return "audio/3gpp";
            case 2:
                return "audio/amr-wb";
            case 3:
            case 4:
            case 5:
                return "audio/mp4a-latm";
            case 6:
                return "audio/vorbis";
            case 7:
                return "audio/opus";
            default:
                return AudioProfileProxy.MEDIA_TYPE_NONE;
        }
    }

    static int getRequiredAudioProfile(int codec) {
        switch (codec) {
            case 3:
                return 2;
            case 4:
                return 5;
            case 5:
                return 39;
            default:
                return -1;
        }
    }
}
