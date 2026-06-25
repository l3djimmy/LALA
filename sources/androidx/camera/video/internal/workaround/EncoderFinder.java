package androidx.camera.video.internal.workaround;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.text.TextUtils;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.MediaCodecInfoReportIncorrectInfoQuirk;
import androidx.camera.video.internal.compat.quirk.MediaFormatMustNotUseFrameRateToFindEncoderQuirk;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.core.util.Preconditions;
import java.io.IOException;
/* loaded from: classes.dex */
public class EncoderFinder {
    private static final String TAG = "EncoderFinder";
    private final boolean mShouldRemoveKeyFrameRate;

    public EncoderFinder() {
        MediaFormatMustNotUseFrameRateToFindEncoderQuirk quirk = (MediaFormatMustNotUseFrameRateToFindEncoderQuirk) DeviceQuirks.get(MediaFormatMustNotUseFrameRateToFindEncoderQuirk.class);
        this.mShouldRemoveKeyFrameRate = quirk != null;
    }

    public MediaCodec findEncoder(MediaFormat mediaFormat) throws InvalidConfigException {
        MediaCodecList mediaCodecList = new MediaCodecList(1);
        String encoderName = findEncoderForFormat(mediaFormat, mediaCodecList);
        try {
            if (TextUtils.isEmpty(encoderName)) {
                String mimeType = mediaFormat.getString("mime");
                MediaCodec codec = MediaCodec.createEncoderByType(mimeType);
                String msg = DebugUtils.dumpCodecCapabilities(mimeType, codec, mediaFormat);
                Logger.w(TAG, String.format("No encoder found that supports requested MediaFormat %s. Create encoder by MIME type. Dump codec info:\n%s", mediaFormat, msg));
                return codec;
            }
            return MediaCodec.createByCodecName(encoderName);
        } catch (IOException | IllegalArgumentException | NullPointerException e) {
            boolean isMediaFormatInQuirk = shouldCreateCodecByType(mediaFormat);
            String msg2 = DebugUtils.dumpMediaCodecListForFormat(mediaCodecList, mediaFormat);
            throw new InvalidConfigException("Encoder cannot created: " + encoderName + ", isMediaFormatInQuirk: " + isMediaFormatInQuirk + "\n" + msg2, e);
        }
    }

    String findEncoderForFormat(MediaFormat mediaFormat, MediaCodecList mediaCodecList) {
        Integer tempFrameRate = null;
        Integer tempAacProfile = null;
        try {
            if (this.mShouldRemoveKeyFrameRate && mediaFormat.containsKey("frame-rate")) {
                tempFrameRate = Integer.valueOf(mediaFormat.getInteger("frame-rate"));
                mediaFormat.setString("frame-rate", null);
            }
            String name = mediaCodecList.findEncoderForFormat(mediaFormat);
            if (name == null) {
                name = findEncoderWithNearestCompatibleBitrate(mediaFormat, mediaCodecList.getCodecInfos());
            }
            return name;
        } finally {
            if (tempFrameRate != null) {
                mediaFormat.setInteger("frame-rate", tempFrameRate.intValue());
            }
            if (0 != 0) {
                mediaFormat.setInteger("aac-profile", tempAacProfile.intValue());
            }
        }
    }

    private String findEncoderWithNearestCompatibleBitrate(MediaFormat mediaFormat, MediaCodecInfo[] codecInfoList) {
        MediaCodecInfo.CodecCapabilities caps;
        int newBitrate;
        String mime = mediaFormat.getString("mime");
        String str = null;
        if (mime == null) {
            Logger.w(TAG, "MediaFormat does not contain mime info.");
            return null;
        }
        for (MediaCodecInfo info : codecInfoList) {
            if (info.isEncoder()) {
                Integer origBitrate = null;
                try {
                    caps = info.getCapabilitiesForType(mime);
                    boolean z = true;
                    Preconditions.checkArgument(caps != null, "MIME type is not supported");
                    newBitrate = -1;
                    if (mediaFormat.containsKey("bitrate")) {
                        MediaCodecInfo.VideoCapabilities videoCaps = caps.getVideoCapabilities();
                        if (videoCaps == null) {
                            z = false;
                        }
                        Preconditions.checkArgument(z, "Not video codec");
                        origBitrate = Integer.valueOf(mediaFormat.getInteger("bitrate"));
                        newBitrate = videoCaps.getBitrateRange().clamp(origBitrate).intValue();
                        mediaFormat.setInteger("bitrate", newBitrate);
                    }
                } catch (IllegalArgumentException e) {
                    if (origBitrate == null) {
                    }
                } catch (Throwable th) {
                    if (origBitrate != null) {
                        mediaFormat.setInteger("bitrate", origBitrate.intValue());
                    }
                    throw th;
                }
                if (caps.isFormatSupported(mediaFormat)) {
                    Logger.w(TAG, String.format("No encoder found that supports requested bitrate. Adjusting bitrate to nearest supported bitrate [requested: %dbps, nearest: %dbps]", origBitrate, Integer.valueOf(newBitrate)));
                    String name = info.getName();
                    if (origBitrate != null) {
                        mediaFormat.setInteger("bitrate", origBitrate.intValue());
                    }
                    return name;
                }
                if (origBitrate == null) {
                }
                mediaFormat.setInteger("bitrate", origBitrate.intValue());
            }
        }
        return str;
    }

    private boolean shouldCreateCodecByType(MediaFormat mediaFormat) {
        MediaCodecInfoReportIncorrectInfoQuirk quirk = (MediaCodecInfoReportIncorrectInfoQuirk) DeviceQuirks.get(MediaCodecInfoReportIncorrectInfoQuirk.class);
        if (quirk == null) {
            return false;
        }
        return quirk.isUnSupportMediaCodecInfo(mediaFormat);
    }
}
