package androidx.camera.video.internal;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import android.os.Build;
import android.text.TextUtils;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.compat.Api28Impl;
import androidx.camera.video.internal.compat.Api31Impl;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public final class DebugUtils {
    private static final String AUDIO_CAPS_PREFIX = "[AudioCaps] ";
    private static final String CODEC_CAPS_PREFIX = "[CodecCaps] ";
    private static final String ENCODER_CAPS_PREFIX = "[EncoderCaps] ";
    private static final String TAG = "DebugUtils";
    private static final String VIDEO_CAPS_PREFIX = "[VideoCaps] ";

    private DebugUtils() {
    }

    public static String readableUs(long time) {
        return readableMs(TimeUnit.MICROSECONDS.toMillis(time));
    }

    public static String readableMs(long time) {
        return formatInterval(time);
    }

    public static String readableBufferInfo(MediaCodec.BufferInfo bufferInfo) {
        StringBuilder sb = new StringBuilder();
        sb.append("Dump BufferInfo: " + bufferInfo.toString() + "\n");
        sb.append("\toffset: " + bufferInfo.offset + "\n");
        sb.append("\tsize: " + bufferInfo.size + "\n");
        sb.append("\tflag: " + bufferInfo.flags);
        List<String> flagList = new ArrayList<>();
        if ((bufferInfo.flags & 4) != 0) {
            flagList.add("EOS");
        }
        if ((bufferInfo.flags & 2) != 0) {
            flagList.add("CODEC_CONFIG");
        }
        if ((bufferInfo.flags & 1) != 0) {
            flagList.add("KEY_FRAME");
        }
        if ((bufferInfo.flags & 8) != 0) {
            flagList.add("PARTIAL_FRAME");
        }
        if (!flagList.isEmpty()) {
            sb.append(" (").append(TextUtils.join(" | ", flagList)).append(")");
        }
        sb.append("\n");
        sb.append("\tpresentationTime: " + bufferInfo.presentationTimeUs + " (" + readableUs(bufferInfo.presentationTimeUs) + ")\n");
        return sb.toString();
    }

    private static String formatInterval(long millis) {
        long hr = TimeUnit.MILLISECONDS.toHours(millis);
        long min = TimeUnit.MILLISECONDS.toMinutes(millis - TimeUnit.HOURS.toMillis(hr));
        long sec = TimeUnit.MILLISECONDS.toSeconds((millis - TimeUnit.HOURS.toMillis(hr)) - TimeUnit.MINUTES.toMillis(min));
        long ms = ((millis - TimeUnit.HOURS.toMillis(hr)) - TimeUnit.MINUTES.toMillis(min)) - TimeUnit.SECONDS.toMillis(sec);
        return String.format(Locale.US, "%02d:%02d:%02d.%03d", Long.valueOf(hr), Long.valueOf(min), Long.valueOf(sec), Long.valueOf(ms));
    }

    public static String dumpMediaCodecListForFormat(MediaCodecList mediaCodecList, MediaFormat mediaFormat) {
        MediaCodecInfo[] codecInfos;
        StringBuilder sb = new StringBuilder();
        logToString(sb, "[Start] Dump MediaCodecList for mediaFormat " + mediaFormat);
        String mime = mediaFormat.getString("mime");
        for (MediaCodecInfo mediaCodecInfo : mediaCodecList.getCodecInfos()) {
            if (mediaCodecInfo.isEncoder()) {
                boolean z = true;
                try {
                    Preconditions.checkArgument(mime != null);
                    MediaCodecInfo.CodecCapabilities caps = mediaCodecInfo.getCapabilitiesForType(mime);
                    if (caps == null) {
                        z = false;
                    }
                    Preconditions.checkArgument(z);
                    logToString(sb, "[Start] [" + mediaCodecInfo.getName() + "]");
                    dumpCodecCapabilities(sb, caps, mediaFormat);
                    logToString(sb, "[End] [" + mediaCodecInfo.getName() + "]");
                } catch (IllegalArgumentException e) {
                    logToString(sb, "[" + mediaCodecInfo.getName() + "] does not support mime " + mime);
                }
            }
        }
        logToString(sb, "[End] Dump MediaCodecList");
        String log = sb.toString();
        stringToLog(log);
        return log;
    }

    public static String dumpCodecCapabilities(String mimeType, MediaCodec codec, MediaFormat mediaFormat) {
        StringBuilder sb = new StringBuilder();
        try {
            MediaCodecInfo.CodecCapabilities caps = codec.getCodecInfo().getCapabilitiesForType(mimeType);
            Preconditions.checkArgument(caps != null);
            dumpCodecCapabilities(sb, caps, mediaFormat);
        } catch (IllegalArgumentException e) {
            logToString(sb, "[" + codec.getName() + "] does not support mime " + mimeType);
        }
        return sb.toString();
    }

    private static void dumpCodecCapabilities(StringBuilder sb, MediaCodecInfo.CodecCapabilities caps, MediaFormat mediaFormat) {
        MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArr;
        try {
            logToString(sb, "[CodecCaps] isFormatSupported = " + caps.isFormatSupported(mediaFormat));
        } catch (ClassCastException e) {
            logToString(sb, "[CodecCaps] isFormatSupported=false");
        }
        logToString(sb, "[CodecCaps] getDefaultFormat = " + caps.getDefaultFormat());
        if (caps.profileLevels != null) {
            StringBuilder stringBuilder = new StringBuilder("[");
            List<String> profileLevelsStr = new ArrayList<>();
            for (MediaCodecInfo.CodecProfileLevel profileLevel : caps.profileLevels) {
                profileLevelsStr.add(toString(profileLevel));
            }
            stringBuilder.append(TextUtils.join(", ", profileLevelsStr)).append("]");
            logToString(sb, "[CodecCaps] profileLevels = " + ((Object) stringBuilder));
        }
        if (caps.colorFormats != null) {
            logToString(sb, "[CodecCaps] colorFormats = " + Arrays.toString(caps.colorFormats));
        }
        MediaCodecInfo.VideoCapabilities videoCaps = caps.getVideoCapabilities();
        if (videoCaps != null) {
            dumpVideoCapabilities(sb, videoCaps, mediaFormat);
        }
        MediaCodecInfo.AudioCapabilities audioCaps = caps.getAudioCapabilities();
        if (audioCaps != null) {
            dumpAudioCapabilities(sb, audioCaps, mediaFormat);
        }
        MediaCodecInfo.EncoderCapabilities encoderCaps = caps.getEncoderCapabilities();
        if (encoderCaps != null) {
            dumpEncoderCapabilities(sb, encoderCaps, mediaFormat);
        }
    }

    private static void dumpVideoCapabilities(StringBuilder sb, MediaCodecInfo.VideoCapabilities caps, MediaFormat mediaFormat) {
        int height;
        int width;
        int frameRate;
        logToString(sb, "[VideoCaps] getBitrateRange = " + caps.getBitrateRange());
        logToString(sb, "[VideoCaps] getSupportedWidths = " + caps.getSupportedWidths() + ", getWidthAlignment = " + caps.getWidthAlignment());
        logToString(sb, "[VideoCaps] getSupportedHeights = " + caps.getSupportedHeights() + ", getHeightAlignment = " + caps.getHeightAlignment());
        boolean hasSize = true;
        boolean z = true;
        try {
            width = mediaFormat.getInteger("width");
            height = mediaFormat.getInteger("height");
            Preconditions.checkArgument(width > 0 && height > 0);
        } catch (IllegalArgumentException | NullPointerException e) {
            logToString(sb, "[VideoCaps] mediaFormat does not contain valid width and height");
            height = 0;
            hasSize = false;
            width = 0;
        }
        if (hasSize) {
            try {
                logToString(sb, "[VideoCaps] getSupportedHeightsFor " + width + " = " + caps.getSupportedHeightsFor(width));
            } catch (IllegalArgumentException e2) {
                logToString(sb, "[VideoCaps] could not getSupportedHeightsFor " + width);
            }
            try {
                logToString(sb, "[VideoCaps] getSupportedWidthsFor " + height + " = " + caps.getSupportedWidthsFor(height));
            } catch (IllegalArgumentException e3) {
                logToString(sb, "[VideoCaps] could not getSupportedWidthsFor " + height);
            }
            logToString(sb, "[VideoCaps] isSizeSupported for " + width + "x" + height + " = " + caps.isSizeSupported(width, height));
        }
        logToString(sb, "[VideoCaps] getSupportedFrameRates = " + caps.getSupportedFrameRates());
        try {
            frameRate = mediaFormat.getInteger("frame-rate");
            if (frameRate <= 0) {
                z = false;
            }
            Preconditions.checkArgument(z);
        } catch (IllegalArgumentException | NullPointerException e4) {
            logToString(sb, "[VideoCaps] mediaFormat does not contain frame rate");
            frameRate = 0;
        }
        if (hasSize) {
            logToString(sb, "[VideoCaps] getSupportedFrameRatesFor " + width + "x" + height + " = " + caps.getSupportedFrameRatesFor(width, height));
        }
        if (hasSize && frameRate > 0) {
            logToString(sb, "[VideoCaps] areSizeAndRateSupported for " + width + "x" + height + ", " + frameRate + " = " + caps.areSizeAndRateSupported(width, height, frameRate));
        }
    }

    private static void dumpAudioCapabilities(StringBuilder sb, MediaCodecInfo.AudioCapabilities caps, MediaFormat mediaFormat) {
        logToString(sb, "[AudioCaps] getBitrateRange = " + caps.getBitrateRange());
        logToString(sb, "[AudioCaps] getMaxInputChannelCount = " + caps.getMaxInputChannelCount());
        if (Build.VERSION.SDK_INT >= 31) {
            logToString(sb, "[AudioCaps] getMinInputChannelCount = " + Api31Impl.getMinInputChannelCount(caps));
            logToString(sb, "[AudioCaps] getInputChannelCountRanges = " + Arrays.toString(Api31Impl.getInputChannelCountRanges(caps)));
        }
        logToString(sb, "[AudioCaps] getSupportedSampleRateRanges = " + Arrays.toString(caps.getSupportedSampleRateRanges()));
        logToString(sb, "[AudioCaps] getSupportedSampleRates = " + Arrays.toString(caps.getSupportedSampleRates()));
        try {
            int sampleRate = mediaFormat.getInteger("sample-rate");
            logToString(sb, "[AudioCaps] isSampleRateSupported for " + sampleRate + " = " + caps.isSampleRateSupported(sampleRate));
        } catch (IllegalArgumentException | NullPointerException e) {
            logToString(sb, "[AudioCaps] mediaFormat does not contain sample rate");
        }
    }

    private static void dumpEncoderCapabilities(StringBuilder sb, MediaCodecInfo.EncoderCapabilities caps, MediaFormat mediaFormat) {
        logToString(sb, "[EncoderCaps] getComplexityRange = " + caps.getComplexityRange());
        if (Build.VERSION.SDK_INT >= 28) {
            logToString(sb, "[EncoderCaps] getQualityRange = " + Api28Impl.getQualityRange(caps));
        }
        try {
            int bitrateMode = mediaFormat.getInteger("bitrate-mode");
            logToString(sb, "[EncoderCaps] isBitrateModeSupported = " + caps.isBitrateModeSupported(bitrateMode));
        } catch (IllegalArgumentException | NullPointerException e) {
            logToString(sb, "[EncoderCaps] mediaFormat does not contain bitrate mode");
        }
    }

    private static void logToString(StringBuilder sb, String message) {
        sb.append(message);
        sb.append("\n");
    }

    private static void stringToLog(String log) {
        if (Logger.isInfoEnabled(TAG)) {
            Scanner scan = new Scanner(log);
            while (scan.hasNextLine()) {
                Logger.i(TAG, scan.nextLine());
            }
        }
    }

    private static String toString(MediaCodecInfo.CodecProfileLevel codecProfileLevel) {
        if (codecProfileLevel == null) {
            return "null";
        }
        return String.format("{level=%d, profile=%d}", Integer.valueOf(codecProfileLevel.level), Integer.valueOf(codecProfileLevel.profile));
    }
}
