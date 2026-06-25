package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.MediaSpec;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.config.VideoMimeInfo;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.camera.video.internal.encoder.VideoEncoderDataSpace;
import androidx.camera.video.internal.utils.DynamicRangeUtil;
import androidx.core.util.Preconditions;
import androidx.core.util.Supplier;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public final class VideoConfigUtil {
    private static final Map<String, Map<Integer, VideoEncoderDataSpace>> MIME_TO_DATA_SPACE_MAP = new HashMap();
    private static final String TAG = "VideoConfigUtil";

    static {
        Map<Integer, VideoEncoderDataSpace> profHevcMap = new HashMap<>();
        profHevcMap.put(1, VideoEncoderDataSpace.ENCODER_DATA_SPACE_UNSPECIFIED);
        profHevcMap.put(2, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_HLG);
        profHevcMap.put(4096, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        profHevcMap.put(8192, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        Map<Integer, VideoEncoderDataSpace> profAv1Map = new HashMap<>();
        profAv1Map.put(1, VideoEncoderDataSpace.ENCODER_DATA_SPACE_UNSPECIFIED);
        profAv1Map.put(2, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_HLG);
        profAv1Map.put(4096, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        profAv1Map.put(8192, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        Map<Integer, VideoEncoderDataSpace> profVp9Map = new HashMap<>();
        profVp9Map.put(1, VideoEncoderDataSpace.ENCODER_DATA_SPACE_UNSPECIFIED);
        profVp9Map.put(4, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_HLG);
        profVp9Map.put(4096, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        profVp9Map.put(16384, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        profVp9Map.put(2, VideoEncoderDataSpace.ENCODER_DATA_SPACE_UNSPECIFIED);
        profVp9Map.put(8, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_HLG);
        profVp9Map.put(8192, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        profVp9Map.put(32768, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_PQ);
        Map<Integer, VideoEncoderDataSpace> profDvMap = new HashMap<>();
        profDvMap.put(256, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT2020_HLG);
        profDvMap.put(512, VideoEncoderDataSpace.ENCODER_DATA_SPACE_BT709);
        MIME_TO_DATA_SPACE_MAP.put("video/hevc", profHevcMap);
        MIME_TO_DATA_SPACE_MAP.put("video/av01", profAv1Map);
        MIME_TO_DATA_SPACE_MAP.put("video/x-vnd.on2.vp9", profVp9Map);
        MIME_TO_DATA_SPACE_MAP.put("video/dolby-vision", profDvMap);
    }

    private VideoConfigUtil() {
    }

    public static VideoMimeInfo resolveVideoMimeInfo(MediaSpec mediaSpec, DynamicRange dynamicRange, VideoValidatedEncoderProfilesProxy encoderProfiles) {
        Preconditions.checkState(dynamicRange.isFullySpecified(), "Dynamic range must be a fully specified dynamic range [provided dynamic range: " + dynamicRange + "]");
        String mediaSpecVideoMime = MediaSpec.outputFormatToVideoMime(mediaSpec.getOutputFormat());
        String resolvedVideoMime = mediaSpecVideoMime;
        EncoderProfilesProxy.VideoProfileProxy compatibleVideoProfile = null;
        if (encoderProfiles != null) {
            Set<Integer> encoderHdrFormats = DynamicRangeUtil.dynamicRangeToVideoProfileHdrFormats(dynamicRange);
            Set<Integer> encoderBitDepths = DynamicRangeUtil.dynamicRangeToVideoProfileBitDepth(dynamicRange);
            for (EncoderProfilesProxy.VideoProfileProxy videoProfile : encoderProfiles.getVideoProfiles()) {
                if (encoderHdrFormats.contains(Integer.valueOf(videoProfile.getHdrFormat())) && encoderBitDepths.contains(Integer.valueOf(videoProfile.getBitDepth()))) {
                    String videoProfileMime = videoProfile.getMediaType();
                    if (!Objects.equals(mediaSpecVideoMime, videoProfileMime)) {
                        if (mediaSpec.getOutputFormat() == -1) {
                            Logger.d(TAG, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using CamcorderProfile to derive VIDEO settings [mime type: " + resolvedVideoMime + ", dynamic range: " + dynamicRange + "]");
                        }
                    } else {
                        Logger.d(TAG, "MediaSpec video mime matches EncoderProfiles. Using EncoderProfiles to derive VIDEO settings [mime type: " + resolvedVideoMime + "]");
                    }
                    compatibleVideoProfile = videoProfile;
                    resolvedVideoMime = videoProfileMime;
                    break;
                }
            }
        }
        if (compatibleVideoProfile == null) {
            if (mediaSpec.getOutputFormat() == -1) {
                resolvedVideoMime = getDynamicRangeDefaultMime(dynamicRange);
            }
            if (encoderProfiles == null) {
                Logger.d(TAG, "No EncoderProfiles present. May rely on fallback defaults to derive VIDEO settings [chosen mime type: " + resolvedVideoMime + ", dynamic range: " + dynamicRange + "]");
            } else {
                Logger.d(TAG, "No video EncoderProfile is compatible with requested output format and dynamic range. May rely on fallback defaults to derive VIDEO settings [chosen mime type: " + resolvedVideoMime + ", dynamic range: " + dynamicRange + "]");
            }
        }
        VideoMimeInfo.Builder mimeInfoBuilder = VideoMimeInfo.builder(resolvedVideoMime);
        if (compatibleVideoProfile != null) {
            mimeInfoBuilder.setCompatibleVideoProfile(compatibleVideoProfile);
        }
        return mimeInfoBuilder.build();
    }

    private static String getDynamicRangeDefaultMime(DynamicRange dynamicRange) {
        switch (dynamicRange.getEncoding()) {
            case 1:
                return "video/avc";
            case 2:
            default:
                throw new UnsupportedOperationException("Unsupported dynamic range: " + dynamicRange + "\nNo supported default mime type available.");
            case 3:
            case 4:
            case 5:
                return "video/hevc";
            case 6:
                return "video/dolby-vision";
        }
    }

    public static VideoEncoderConfig resolveVideoEncoderConfig(VideoMimeInfo videoMimeInfo, Timebase inputTimebase, VideoSpec videoSpec, Size surfaceSize, DynamicRange dynamicRange, Range<Integer> expectedFrameRateRange) {
        Supplier<VideoEncoderConfig> configSupplier;
        EncoderProfilesProxy.VideoProfileProxy videoProfile = videoMimeInfo.getCompatibleVideoProfile();
        if (videoProfile != null) {
            configSupplier = new VideoEncoderConfigVideoProfileResolver(videoMimeInfo.getMimeType(), inputTimebase, videoSpec, surfaceSize, videoProfile, dynamicRange, expectedFrameRateRange);
        } else {
            configSupplier = new VideoEncoderConfigDefaultResolver(videoMimeInfo.getMimeType(), inputTimebase, videoSpec, surfaceSize, dynamicRange, expectedFrameRateRange);
        }
        return configSupplier.get();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int scaleAndClampBitrate(int baseBitrate, int actualBitDepth, int baseBitDepth, int actualFrameRate, int baseFrameRate, int actualWidth, int baseWidth, int actualHeight, int baseHeight, Range<Integer> clampedRange) {
        Rational bitDepthRatio = new Rational(actualBitDepth, baseBitDepth);
        Rational frameRateRatio = new Rational(actualFrameRate, baseFrameRate);
        Rational widthRatio = new Rational(actualWidth, baseWidth);
        Rational heightRatio = new Rational(actualHeight, baseHeight);
        int resolvedBitrate = (int) (baseBitrate * bitDepthRatio.doubleValue() * frameRateRatio.doubleValue() * widthRatio.doubleValue() * heightRatio.doubleValue());
        String debugString = "";
        if (Logger.isDebugEnabled(TAG)) {
            debugString = String.format("Base Bitrate(%dbps) * Bit Depth Ratio (%d / %d) * Frame Rate Ratio(%d / %d) * Width Ratio(%d / %d) * Height Ratio(%d / %d) = %d", Integer.valueOf(baseBitrate), Integer.valueOf(actualBitDepth), Integer.valueOf(baseBitDepth), Integer.valueOf(actualFrameRate), Integer.valueOf(baseFrameRate), Integer.valueOf(actualWidth), Integer.valueOf(baseWidth), Integer.valueOf(actualHeight), Integer.valueOf(baseHeight), Integer.valueOf(resolvedBitrate));
        }
        if (!VideoSpec.BITRATE_RANGE_AUTO.equals(clampedRange)) {
            resolvedBitrate = clampedRange.clamp(Integer.valueOf(resolvedBitrate)).intValue();
            if (Logger.isDebugEnabled(TAG)) {
                debugString = debugString + String.format("\nClamped to range %s -> %dbps", clampedRange, Integer.valueOf(resolvedBitrate));
            }
        }
        Logger.d(TAG, debugString);
        return resolvedBitrate;
    }

    public static VideoEncoderDataSpace mimeAndProfileToEncoderDataSpace(String mimeType, int codecProfileLevel) {
        VideoEncoderDataSpace dataSpace;
        Map<Integer, VideoEncoderDataSpace> profileToDataSpaceMap = MIME_TO_DATA_SPACE_MAP.get(mimeType);
        if (profileToDataSpaceMap != null && (dataSpace = profileToDataSpaceMap.get(Integer.valueOf(codecProfileLevel))) != null) {
            return dataSpace;
        }
        Logger.w(TAG, String.format("Unsupported mime type %s or profile level %d. Data space is unspecified.", mimeType, Integer.valueOf(codecProfileLevel)));
        return VideoEncoderDataSpace.ENCODER_DATA_SPACE_UNSPECIFIED;
    }
}
