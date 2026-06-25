package androidx.camera.video.internal.config;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.camera.video.internal.encoder.VideoEncoderDataSpace;
import androidx.core.util.Supplier;
import java.util.Objects;
/* loaded from: classes.dex */
public class VideoEncoderConfigVideoProfileResolver implements Supplier<VideoEncoderConfig> {
    private static final String TAG = "VidEncVdPrflRslvr";
    private final DynamicRange mDynamicRange;
    private final Range<Integer> mExpectedFrameRateRange;
    private final Timebase mInputTimebase;
    private final String mMimeType;
    private final Size mSurfaceSize;
    private final EncoderProfilesProxy.VideoProfileProxy mVideoProfile;
    private final VideoSpec mVideoSpec;

    public VideoEncoderConfigVideoProfileResolver(String mimeType, Timebase inputTimebase, VideoSpec videoSpec, Size surfaceSize, EncoderProfilesProxy.VideoProfileProxy videoProfile, DynamicRange dynamicRange, Range<Integer> expectedFrameRateRange) {
        this.mMimeType = mimeType;
        this.mInputTimebase = inputTimebase;
        this.mVideoSpec = videoSpec;
        this.mSurfaceSize = surfaceSize;
        this.mVideoProfile = videoProfile;
        this.mDynamicRange = dynamicRange;
        this.mExpectedFrameRateRange = expectedFrameRateRange;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.core.util.Supplier
    public VideoEncoderConfig get() {
        int resolvedFrameRate = resolveFrameRate();
        Logger.d(TAG, "Resolved VIDEO frame rate: " + resolvedFrameRate + "fps");
        Range<Integer> videoSpecBitrateRange = this.mVideoSpec.getBitrate();
        Logger.d(TAG, "Using resolved VIDEO bitrate from EncoderProfiles");
        int resolvedBitrate = VideoConfigUtil.scaleAndClampBitrate(this.mVideoProfile.getBitrate(), this.mDynamicRange.getBitDepth(), this.mVideoProfile.getBitDepth(), resolvedFrameRate, this.mVideoProfile.getFrameRate(), this.mSurfaceSize.getWidth(), this.mVideoProfile.getWidth(), this.mSurfaceSize.getHeight(), this.mVideoProfile.getHeight(), videoSpecBitrateRange);
        int resolvedProfile = this.mVideoProfile.getProfile();
        VideoEncoderDataSpace dataSpace = VideoConfigUtil.mimeAndProfileToEncoderDataSpace(this.mMimeType, resolvedProfile);
        return VideoEncoderConfig.builder().setMimeType(this.mMimeType).setInputTimebase(this.mInputTimebase).setResolution(this.mSurfaceSize).setBitrate(resolvedBitrate).setFrameRate(resolvedFrameRate).setProfile(resolvedProfile).setDataSpace(dataSpace).build();
    }

    private int resolveFrameRate() {
        int resolvedFrameRate;
        int videoProfileFrameRate = this.mVideoProfile.getFrameRate();
        if (!Objects.equals(this.mExpectedFrameRateRange, SurfaceRequest.FRAME_RATE_RANGE_UNSPECIFIED)) {
            resolvedFrameRate = this.mExpectedFrameRateRange.clamp(Integer.valueOf(videoProfileFrameRate)).intValue();
        } else {
            resolvedFrameRate = videoProfileFrameRate;
        }
        Logger.d(TAG, String.format("Resolved frame rate %dfps [Video profile frame rate: %dfps, Expected operating range: %s]", Integer.valueOf(resolvedFrameRate), Integer.valueOf(videoProfileFrameRate), Objects.equals(this.mExpectedFrameRateRange, SurfaceRequest.FRAME_RATE_RANGE_UNSPECIFIED) ? this.mExpectedFrameRateRange : "<UNSPECIFIED>"));
        return resolvedFrameRate;
    }
}
