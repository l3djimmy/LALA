package androidx.camera.video.internal.workaround;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.MediaCodecInfoReportIncorrectInfoQuirk;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.core.util.Preconditions;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class VideoEncoderInfoWrapper implements VideoEncoderInfo {
    private static final int HEIGHT_4KDCI = 2160;
    private static final String TAG = "VideoEncoderInfoWrapper";
    private static final int WIDTH_4KDCI = 4096;
    private final Set<Size> mExtraSupportedSizes = new HashSet();
    private final Range<Integer> mSupportedHeights;
    private final Range<Integer> mSupportedWidths;
    private final VideoEncoderInfo mVideoEncoderInfo;

    public static VideoEncoderInfo from(VideoEncoderInfo videoEncoderInfo, Size validSizeToCheck) {
        boolean toWrap;
        if (videoEncoderInfo instanceof VideoEncoderInfoWrapper) {
            toWrap = false;
        } else if (DeviceQuirks.get(MediaCodecInfoReportIncorrectInfoQuirk.class) != null) {
            toWrap = true;
        } else if (validSizeToCheck != null && !videoEncoderInfo.isSizeSupported(validSizeToCheck.getWidth(), validSizeToCheck.getHeight())) {
            Logger.w(TAG, String.format("Detected that the device does not support a size %s that should be valid in widths/heights = %s/%s", validSizeToCheck, videoEncoderInfo.getSupportedWidths(), videoEncoderInfo.getSupportedHeights()));
            toWrap = true;
        } else {
            toWrap = false;
        }
        return toWrap ? new VideoEncoderInfoWrapper(videoEncoderInfo, validSizeToCheck) : videoEncoderInfo;
    }

    VideoEncoderInfoWrapper(VideoEncoderInfo videoEncoderInfo, Size validSize) {
        this.mVideoEncoderInfo = videoEncoderInfo;
        int widthAlignment = videoEncoderInfo.getWidthAlignment();
        int maxWidth = ((int) Math.ceil(4096.0d / widthAlignment)) * widthAlignment;
        this.mSupportedWidths = Range.create(Integer.valueOf(widthAlignment), Integer.valueOf(maxWidth));
        int heightAlignment = videoEncoderInfo.getHeightAlignment();
        int maxHeight = ((int) Math.ceil(2160.0d / heightAlignment)) * heightAlignment;
        this.mSupportedHeights = Range.create(Integer.valueOf(heightAlignment), Integer.valueOf(maxHeight));
        if (validSize != null) {
            this.mExtraSupportedSizes.add(validSize);
        }
        this.mExtraSupportedSizes.addAll(MediaCodecInfoReportIncorrectInfoQuirk.getExtraSupportedSizes());
    }

    @Override // androidx.camera.video.internal.encoder.EncoderInfo
    public String getName() {
        return this.mVideoEncoderInfo.getName();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public boolean isSizeSupported(int width, int height) {
        if (this.mExtraSupportedSizes.isEmpty() || !this.mExtraSupportedSizes.contains(new Size(width, height))) {
            return this.mSupportedWidths.contains((Range<Integer>) Integer.valueOf(width)) && this.mSupportedHeights.contains((Range<Integer>) Integer.valueOf(height)) && width % this.mVideoEncoderInfo.getWidthAlignment() == 0 && height % this.mVideoEncoderInfo.getHeightAlignment() == 0;
        }
        return true;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidths() {
        return this.mSupportedWidths;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeights() {
        return this.mSupportedHeights;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedWidthsFor(int height) {
        Preconditions.checkArgument(this.mSupportedHeights.contains((Range<Integer>) Integer.valueOf(height)) && height % this.mVideoEncoderInfo.getHeightAlignment() == 0, "Not supported height: " + height + " which is not in " + this.mSupportedHeights + " or can not be divided by alignment " + this.mVideoEncoderInfo.getHeightAlignment());
        return this.mSupportedWidths;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedHeightsFor(int width) {
        Preconditions.checkArgument(this.mSupportedWidths.contains((Range<Integer>) Integer.valueOf(width)) && width % this.mVideoEncoderInfo.getWidthAlignment() == 0, "Not supported width: " + width + " which is not in " + this.mSupportedWidths + " or can not be divided by alignment " + this.mVideoEncoderInfo.getWidthAlignment());
        return this.mSupportedHeights;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getWidthAlignment() {
        return this.mVideoEncoderInfo.getWidthAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public int getHeightAlignment() {
        return this.mVideoEncoderInfo.getHeightAlignment();
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderInfo
    public Range<Integer> getSupportedBitrateRange() {
        return this.mVideoEncoderInfo.getSupportedBitrateRange();
    }
}
