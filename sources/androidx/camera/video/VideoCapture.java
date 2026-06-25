package androidx.camera.video;

import android.graphics.Rect;
import android.media.MediaCodec;
import android.os.SystemClock;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.ThreadConfig;
import androidx.camera.core.internal.UseCaseEventConfig;
import androidx.camera.core.processing.DefaultSurfaceProcessor;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.video.StreamInfo;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.impl.VideoCaptureConfig;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.ExtraSupportedResolutionQuirk;
import androidx.camera.video.internal.compat.quirk.ImageCaptureFailedWhenVideoCaptureIsBoundQuirk;
import androidx.camera.video.internal.compat.quirk.PreviewDelayWhenVideoCaptureIsBoundQuirk;
import androidx.camera.video.internal.compat.quirk.PreviewStretchWhenVideoCaptureIsBoundQuirk;
import androidx.camera.video.internal.compat.quirk.VideoQualityQuirk;
import androidx.camera.video.internal.config.VideoConfigUtil;
import androidx.camera.video.internal.config.VideoMimeInfo;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.camera.video.internal.encoder.VideoEncoderConfig;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.encoder.VideoEncoderInfoImpl;
import androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public final class VideoCapture<T extends VideoOutput> extends UseCase {
    private static final Defaults DEFAULT_CONFIG = new Defaults();
    private static final String SURFACE_UPDATE_KEY = "androidx.camera.video.VideoCapture.streamUpdate";
    private static final String TAG = "VideoCapture";
    private static final boolean USE_TEMPLATE_PREVIEW_BY_QUIRK;
    static boolean sEnableSurfaceProcessingByQuirk;
    private SurfaceEdge mCameraEdge;
    private Rect mCropRect;
    DeferrableSurface mDeferrableSurface;
    private boolean mHasCompensatingTransformation;
    private SurfaceProcessorNode mNode;
    private int mRotationDegrees;
    SessionConfig.Builder mSessionConfigBuilder;
    VideoOutput.SourceState mSourceState;
    StreamInfo mStreamInfo;
    private final Observable.Observer<StreamInfo> mStreamInfoObserver;
    private SurfaceRequest mSurfaceRequest;
    ListenableFuture<Void> mSurfaceUpdateFuture;
    private VideoEncoderInfo mVideoEncoderInfo;

    static {
        boolean z = true;
        boolean hasPreviewStretchQuirk = DeviceQuirks.get(PreviewStretchWhenVideoCaptureIsBoundQuirk.class) != null;
        boolean hasPreviewDelayQuirk = DeviceQuirks.get(PreviewDelayWhenVideoCaptureIsBoundQuirk.class) != null;
        boolean hasImageCaptureFailedQuirk = DeviceQuirks.get(ImageCaptureFailedWhenVideoCaptureIsBoundQuirk.class) != null;
        boolean hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing = hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing();
        boolean hasExtraSupportedResolutionQuirk = DeviceQuirks.get(ExtraSupportedResolutionQuirk.class) != null;
        USE_TEMPLATE_PREVIEW_BY_QUIRK = hasPreviewStretchQuirk || hasPreviewDelayQuirk || hasImageCaptureFailedQuirk;
        if (!hasPreviewDelayQuirk && !hasImageCaptureFailedQuirk && !hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing && !hasExtraSupportedResolutionQuirk) {
            z = false;
        }
        sEnableSurfaceProcessingByQuirk = z;
    }

    public static <T extends VideoOutput> VideoCapture<T> withOutput(T videoOutput) {
        return new Builder((VideoOutput) Preconditions.checkNotNull(videoOutput)).setCaptureType(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE).build();
    }

    VideoCapture(VideoCaptureConfig<T> config) {
        super(config);
        this.mStreamInfo = StreamInfo.STREAM_INFO_ANY_INACTIVE;
        this.mSessionConfigBuilder = new SessionConfig.Builder();
        this.mSurfaceUpdateFuture = null;
        this.mSourceState = VideoOutput.SourceState.INACTIVE;
        this.mHasCompensatingTransformation = false;
        this.mStreamInfoObserver = new Observable.Observer<StreamInfo>() { // from class: androidx.camera.video.VideoCapture.1
            @Override // androidx.camera.core.impl.Observable.Observer
            public void onNewData(StreamInfo streamInfo) {
                if (streamInfo == null) {
                    throw new IllegalArgumentException("StreamInfo can't be null");
                }
                if (VideoCapture.this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                    return;
                }
                Logger.d(VideoCapture.TAG, "Stream info update: old: " + VideoCapture.this.mStreamInfo + " new: " + streamInfo);
                StreamInfo currentStreamInfo = VideoCapture.this.mStreamInfo;
                VideoCapture.this.mStreamInfo = streamInfo;
                StreamSpec attachedStreamSpec = (StreamSpec) Preconditions.checkNotNull(VideoCapture.this.getAttachedStreamSpec());
                if (VideoCapture.this.isStreamIdChanged(currentStreamInfo.getId(), streamInfo.getId()) || VideoCapture.this.shouldResetCompensatingTransformation(currentStreamInfo, streamInfo)) {
                    VideoCapture.this.resetPipeline(VideoCapture.this.getCameraId(), (VideoCaptureConfig) VideoCapture.this.getCurrentConfig(), (StreamSpec) Preconditions.checkNotNull(VideoCapture.this.getAttachedStreamSpec()));
                } else if ((currentStreamInfo.getId() != -1 && streamInfo.getId() == -1) || (currentStreamInfo.getId() == -1 && streamInfo.getId() != -1)) {
                    VideoCapture.this.applyStreamInfoAndStreamSpecToSessionConfigBuilder(VideoCapture.this.mSessionConfigBuilder, streamInfo, attachedStreamSpec);
                    VideoCapture.this.updateSessionConfig(VideoCapture.this.mSessionConfigBuilder.build());
                    VideoCapture.this.notifyReset();
                } else if (currentStreamInfo.getStreamState() != streamInfo.getStreamState()) {
                    VideoCapture.this.applyStreamInfoAndStreamSpecToSessionConfigBuilder(VideoCapture.this.mSessionConfigBuilder, streamInfo, attachedStreamSpec);
                    VideoCapture.this.updateSessionConfig(VideoCapture.this.mSessionConfigBuilder.build());
                    VideoCapture.this.notifyUpdated();
                }
            }

            @Override // androidx.camera.core.impl.Observable.Observer
            public void onError(Throwable t) {
                Logger.w(VideoCapture.TAG, "Receive onError from StreamState observer", t);
            }
        };
    }

    public T getOutput() {
        return (T) ((VideoCaptureConfig) getCurrentConfig()).getVideoOutput();
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public Range<Integer> getTargetFrameRate() {
        return getTargetFrameRateInternal();
    }

    public void setTargetRotation(int rotation) {
        if (setTargetRotationInternal(rotation)) {
            sendTransformationInfoIfReady();
        }
    }

    public int getMirrorMode() {
        return getMirrorModeInternal();
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec suggestedStreamSpec) {
        Logger.d(TAG, "onSuggestedStreamSpecUpdated: " + suggestedStreamSpec);
        VideoCaptureConfig<T> config = (VideoCaptureConfig) getCurrentConfig();
        List<Size> customOrderedResolutions = config.getCustomOrderedResolutions(null);
        if (customOrderedResolutions != null && !customOrderedResolutions.contains(suggestedStreamSpec.getResolution())) {
            Logger.w(TAG, "suggested resolution " + suggestedStreamSpec.getResolution() + " is not in custom ordered resolutions " + customOrderedResolutions);
        }
        return suggestedStreamSpec;
    }

    public DynamicRange getDynamicRange() {
        return getCurrentConfig().hasDynamicRange() ? getCurrentConfig().getDynamicRange() : Defaults.DEFAULT_DYNAMIC_RANGE;
    }

    @Override // androidx.camera.core.UseCase
    public void onStateAttached() {
        super.onStateAttached();
        Preconditions.checkNotNull(getAttachedStreamSpec(), "The suggested stream specification should be already updated and shouldn't be null.");
        Preconditions.checkState(this.mSurfaceRequest == null, "The surface request should be null when VideoCapture is attached.");
        StreamSpec attachedStreamSpec = (StreamSpec) Preconditions.checkNotNull(getAttachedStreamSpec());
        this.mStreamInfo = (StreamInfo) fetchObservableValue(getOutput().getStreamInfo(), StreamInfo.STREAM_INFO_ANY_INACTIVE);
        this.mSessionConfigBuilder = createPipeline(getCameraId(), (VideoCaptureConfig) getCurrentConfig(), attachedStreamSpec);
        applyStreamInfoAndStreamSpecToSessionConfigBuilder(this.mSessionConfigBuilder, this.mStreamInfo, attachedStreamSpec);
        updateSessionConfig(this.mSessionConfigBuilder.build());
        notifyActive();
        getOutput().getStreamInfo().addObserver(CameraXExecutors.mainThreadExecutor(), this.mStreamInfoObserver);
        setSourceState(VideoOutput.SourceState.ACTIVE_NON_STREAMING);
    }

    @Override // androidx.camera.core.UseCase
    public void setViewPortCropRect(Rect viewPortCropRect) {
        super.setViewPortCropRect(viewPortCropRect);
        sendTransformationInfoIfReady();
    }

    @Override // androidx.camera.core.UseCase
    public void onStateDetached() {
        Preconditions.checkState(Threads.isMainThread(), "VideoCapture can only be detached on the main thread.");
        setSourceState(VideoOutput.SourceState.INACTIVE);
        getOutput().getStreamInfo().removeObserver(this.mStreamInfoObserver);
        if (this.mSurfaceUpdateFuture != null && this.mSurfaceUpdateFuture.cancel(false)) {
            Logger.d(TAG, "VideoCapture is detached from the camera. Surface update cancelled.");
        }
        clearPipeline();
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        this.mSessionConfigBuilder.addImplementationOptions(config);
        updateSessionConfig(this.mSessionConfigBuilder.build());
        return getAttachedStreamSpec().toBuilder().setImplementationOptions(config).build();
    }

    public String toString() {
        return "VideoCapture:" + getName();
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(DEFAULT_CONFIG.getConfig().getCaptureType(), 1);
        if (applyDefaultConfig) {
            captureConfig = Config.mergeConfigs(captureConfig, DEFAULT_CONFIG.getConfig());
        }
        if (captureConfig == null) {
            return null;
        }
        return getUseCaseConfigBuilder(captureConfig).getUseCaseConfig();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        updateCustomOrderedResolutionsByQuality(cameraInfo, builder);
        return builder.getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return Builder.fromConfig(config);
    }

    private void sendTransformationInfoIfReady() {
        CameraInternal cameraInternal = getCamera();
        SurfaceEdge cameraEdge = this.mCameraEdge;
        if (cameraInternal != null && cameraEdge != null) {
            this.mRotationDegrees = adjustRotationWithInProgressTransformation(getRelativeRotation(cameraInternal, isMirroringRequired(cameraInternal)));
            cameraEdge.updateTransformation(this.mRotationDegrees, getAppTargetRotation());
        }
    }

    private Rect adjustCropRectWithInProgressTransformation(Rect cropRect, int rotationDegrees) {
        if (!shouldCompensateTransformation()) {
            return cropRect;
        }
        Rect adjustedCropRect = TransformUtils.sizeToRect(TransformUtils.getRotatedSize(((SurfaceRequest.TransformationInfo) Preconditions.checkNotNull(this.mStreamInfo.getInProgressTransformationInfo())).getCropRect(), rotationDegrees));
        return adjustedCropRect;
    }

    private int adjustRotationWithInProgressTransformation(int rotationDegrees) {
        if (!shouldCompensateTransformation()) {
            return rotationDegrees;
        }
        int adjustedRotationDegrees = TransformUtils.within360(rotationDegrees - this.mStreamInfo.getInProgressTransformationInfo().getRotationDegrees());
        return adjustedRotationDegrees;
    }

    private Size adjustResolutionWithInProgressTransformation(Size resolution, Rect originalCropRect, Rect targetCropRect) {
        if (!shouldCompensateTransformation() || targetCropRect.equals(originalCropRect)) {
            return resolution;
        }
        float targetRatio = targetCropRect.height() / originalCropRect.height();
        Size nodeResolution = new Size((int) Math.ceil(resolution.getWidth() * targetRatio), (int) Math.ceil(resolution.getHeight() * targetRatio));
        return nodeResolution;
    }

    Rect getCropRect() {
        return this.mCropRect;
    }

    int getRotationDegrees() {
        return this.mRotationDegrees;
    }

    private Rect calculateCropRect(Size surfaceResolution, VideoEncoderInfo videoEncoderInfo) {
        Rect cropRect;
        if (getViewPortCropRect() != null) {
            cropRect = getViewPortCropRect();
        } else {
            cropRect = new Rect(0, 0, surfaceResolution.getWidth(), surfaceResolution.getHeight());
        }
        if (videoEncoderInfo == null || videoEncoderInfo.isSizeSupported(cropRect.width(), cropRect.height())) {
            return cropRect;
        }
        return adjustCropRectToValidSize(cropRect, surfaceResolution, videoEncoderInfo);
    }

    private SessionConfig.Builder createPipeline(final String cameraId, VideoCaptureConfig<T> config, final StreamSpec streamSpec) {
        Range<Integer> expectedFrameRate;
        final Timebase timebase;
        final VideoCaptureConfig<T> videoCaptureConfig;
        final VideoCapture<T> videoCapture = this;
        Threads.checkMainThread();
        final CameraInternal camera = (CameraInternal) Preconditions.checkNotNull(videoCapture.getCamera());
        Size resolution = streamSpec.getResolution();
        Runnable onSurfaceInvalidated = new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                VideoCapture.this.notifyReset();
            }
        };
        Range<Integer> expectedFrameRate2 = streamSpec.getExpectedFrameRateRange();
        if (!Objects.equals(expectedFrameRate2, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
            expectedFrameRate = expectedFrameRate2;
        } else {
            expectedFrameRate = Defaults.DEFAULT_FPS_RANGE;
        }
        MediaSpec mediaSpec = (MediaSpec) Objects.requireNonNull(videoCapture.getMediaSpec());
        VideoCapabilities videoCapabilities = videoCapture.getVideoCapabilities(camera.getCameraInfo());
        DynamicRange dynamicRange = streamSpec.getDynamicRange();
        VideoEncoderInfo videoEncoderInfo = videoCapture.getVideoEncoderInfo(config.getVideoEncoderInfoFinder(), videoCapabilities, dynamicRange, mediaSpec, resolution, expectedFrameRate);
        Range<Integer> expectedFrameRate3 = expectedFrameRate;
        videoCapture.mRotationDegrees = videoCapture.adjustRotationWithInProgressTransformation(videoCapture.getRelativeRotation(camera, videoCapture.isMirroringRequired(camera)));
        Rect originalCropRect = videoCapture.calculateCropRect(resolution, videoEncoderInfo);
        videoCapture.mCropRect = videoCapture.adjustCropRectWithInProgressTransformation(originalCropRect, videoCapture.mRotationDegrees);
        Size nodeResolution = videoCapture.adjustResolutionWithInProgressTransformation(resolution, originalCropRect, videoCapture.mCropRect);
        if (videoCapture.shouldCompensateTransformation()) {
            videoCapture.mHasCompensatingTransformation = true;
        }
        videoCapture.mNode = videoCapture.createNodeIfNeeded(camera, videoCapture.mCropRect, resolution, dynamicRange);
        if (videoCapture.mNode != null || !camera.getHasTransform()) {
            timebase = camera.getCameraInfoInternal().getTimebase();
        } else {
            timebase = Timebase.UPTIME;
        }
        Logger.d(TAG, "camera timebase = " + camera.getCameraInfoInternal().getTimebase() + ", processing timebase = " + timebase);
        StreamSpec updatedStreamSpec = streamSpec.toBuilder().setResolution(nodeResolution).setExpectedFrameRateRange(expectedFrameRate3).build();
        Preconditions.checkState(videoCapture.mCameraEdge == null);
        videoCapture.mCameraEdge = new SurfaceEdge(2, 34, updatedStreamSpec, videoCapture.getSensorToBufferTransformMatrix(), camera.getHasTransform(), videoCapture.mCropRect, videoCapture.mRotationDegrees, videoCapture.getAppTargetRotation(), videoCapture.shouldMirror(camera));
        videoCapture.mCameraEdge.addOnInvalidatedListener(onSurfaceInvalidated);
        SurfaceProcessorNode surfaceProcessorNode = videoCapture.mNode;
        SurfaceEdge surfaceEdge = videoCapture.mCameraEdge;
        if (surfaceProcessorNode != null) {
            SurfaceProcessorNode.OutConfig outConfig = SurfaceProcessorNode.OutConfig.of(surfaceEdge);
            SurfaceProcessorNode.In nodeInput = SurfaceProcessorNode.In.of(videoCapture.mCameraEdge, Collections.singletonList(outConfig));
            SurfaceProcessorNode.Out nodeOutput = videoCapture.mNode.transform(nodeInput);
            final SurfaceEdge appEdge = (SurfaceEdge) Objects.requireNonNull(nodeOutput.get(outConfig));
            videoCaptureConfig = config;
            videoCapture = this;
            appEdge.addOnInvalidatedListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    VideoCapture.this.m199lambda$createPipeline$1$androidxcameravideoVideoCapture(appEdge, camera, videoCaptureConfig, timebase);
                }
            });
            videoCapture.mSurfaceRequest = appEdge.createSurfaceRequest(camera);
            videoCapture.mDeferrableSurface = videoCapture.mCameraEdge.getDeferrableSurface();
            final DeferrableSurface latestDeferrableSurface = videoCapture.mDeferrableSurface;
            videoCapture.mDeferrableSurface.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    VideoCapture.this.m200lambda$createPipeline$2$androidxcameravideoVideoCapture(latestDeferrableSurface);
                }
            }, CameraXExecutors.mainThreadExecutor());
        } else {
            videoCaptureConfig = config;
            videoCapture.mSurfaceRequest = surfaceEdge.createSurfaceRequest(camera);
            videoCapture.mDeferrableSurface = videoCapture.mSurfaceRequest.getDeferrableSurface();
        }
        videoCaptureConfig.getVideoOutput().onSurfaceRequested(videoCapture.mSurfaceRequest, timebase);
        videoCapture.sendTransformationInfoIfReady();
        videoCapture.mDeferrableSurface.setContainerClass(MediaCodec.class);
        SessionConfig.Builder sessionConfigBuilder = SessionConfig.Builder.createFrom(videoCaptureConfig, streamSpec.getResolution());
        sessionConfigBuilder.setExpectedFrameRateRange(streamSpec.getExpectedFrameRateRange());
        sessionConfigBuilder.addErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda6
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                VideoCapture.this.m201lambda$createPipeline$3$androidxcameravideoVideoCapture(cameraId, videoCaptureConfig, streamSpec, sessionConfig, sessionError);
            }
        });
        if (USE_TEMPLATE_PREVIEW_BY_QUIRK) {
            sessionConfigBuilder.setTemplateType(1);
        }
        if (streamSpec.getImplementationOptions() != null) {
            sessionConfigBuilder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        return sessionConfigBuilder;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$createPipeline$2$androidx-camera-video-VideoCapture  reason: not valid java name */
    public /* synthetic */ void m200lambda$createPipeline$2$androidxcameravideoVideoCapture(DeferrableSurface latestDeferrableSurface) {
        if (latestDeferrableSurface == this.mDeferrableSurface) {
            clearPipeline();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$createPipeline$3$androidx-camera-video-VideoCapture  reason: not valid java name */
    public /* synthetic */ void m201lambda$createPipeline$3$androidxcameravideoVideoCapture(String cameraId, VideoCaptureConfig config, StreamSpec streamSpec, SessionConfig sessionConfig, SessionConfig.SessionError error) {
        resetPipeline(cameraId, config, streamSpec);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onAppEdgeInvalidated */
    public void m199lambda$createPipeline$1$androidxcameravideoVideoCapture(SurfaceEdge appEdge, CameraInternal camera, VideoCaptureConfig<T> config, Timebase timebase) {
        if (camera == getCamera()) {
            this.mSurfaceRequest = appEdge.createSurfaceRequest(camera);
            config.getVideoOutput().onSurfaceRequested(this.mSurfaceRequest, timebase);
            sendTransformationInfoIfReady();
        }
    }

    private void clearPipeline() {
        Threads.checkMainThread();
        if (this.mDeferrableSurface != null) {
            this.mDeferrableSurface.close();
            this.mDeferrableSurface = null;
        }
        if (this.mNode != null) {
            this.mNode.release();
            this.mNode = null;
        }
        if (this.mCameraEdge != null) {
            this.mCameraEdge.close();
            this.mCameraEdge = null;
        }
        this.mVideoEncoderInfo = null;
        this.mCropRect = null;
        this.mSurfaceRequest = null;
        this.mStreamInfo = StreamInfo.STREAM_INFO_ANY_INACTIVE;
        this.mRotationDegrees = 0;
        this.mHasCompensatingTransformation = false;
    }

    void resetPipeline(String cameraId, VideoCaptureConfig<T> config, StreamSpec streamSpec) {
        clearPipeline();
        if (isCurrentCamera(cameraId)) {
            this.mSessionConfigBuilder = createPipeline(cameraId, config, streamSpec);
            applyStreamInfoAndStreamSpecToSessionConfigBuilder(this.mSessionConfigBuilder, this.mStreamInfo, streamSpec);
            updateSessionConfig(this.mSessionConfigBuilder.build());
            notifyReset();
        }
    }

    SurfaceEdge getCameraEdge() {
        return this.mCameraEdge;
    }

    /* loaded from: classes.dex */
    public static final class Defaults implements ConfigProvider<VideoCaptureConfig<?>> {
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 5;
        private static final VideoOutput DEFAULT_VIDEO_OUTPUT = new VideoOutput() { // from class: androidx.camera.video.VideoCapture$Defaults$$ExternalSyntheticLambda1
            @Override // androidx.camera.video.VideoOutput
            public final void onSurfaceRequested(SurfaceRequest surfaceRequest) {
                surfaceRequest.willNotProvideSurface();
            }
        };
        private static final Function<VideoEncoderConfig, VideoEncoderInfo> DEFAULT_VIDEO_ENCODER_INFO_FINDER = createFinder();
        static final Range<Integer> DEFAULT_FPS_RANGE = new Range<>(30, 30);
        static final DynamicRange DEFAULT_DYNAMIC_RANGE = DynamicRange.SDR;
        private static final VideoCaptureConfig<?> DEFAULT_CONFIG = (VideoCaptureConfig<T>) new Builder(DEFAULT_VIDEO_OUTPUT).setSurfaceOccupancyPriority(5).setVideoEncoderInfoFinder(DEFAULT_VIDEO_ENCODER_INFO_FINDER).setDynamicRange(DEFAULT_DYNAMIC_RANGE).setCaptureType(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE).getUseCaseConfig();

        private static Function<VideoEncoderConfig, VideoEncoderInfo> createFinder() {
            return new Function() { // from class: androidx.camera.video.VideoCapture$Defaults$$ExternalSyntheticLambda0
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return VideoCapture.Defaults.lambda$createFinder$0((VideoEncoderConfig) obj);
                }
            };
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ VideoEncoderInfo lambda$createFinder$0(VideoEncoderConfig encoderConfig) {
            try {
                return VideoEncoderInfoImpl.from(encoderConfig);
            } catch (InvalidConfigException e) {
                Logger.w(VideoCapture.TAG, "Unable to find VideoEncoderInfo", e);
                return null;
            }
        }

        @Override // androidx.camera.core.impl.ConfigProvider
        public VideoCaptureConfig<?> getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    private MediaSpec getMediaSpec() {
        return (MediaSpec) fetchObservableValue(getOutput().getMediaSpec(), null);
    }

    private VideoCapabilities getVideoCapabilities(CameraInfo cameraInfo) {
        return getOutput().getMediaCapabilities(cameraInfo);
    }

    void applyStreamInfoAndStreamSpecToSessionConfigBuilder(SessionConfig.Builder sessionConfigBuilder, StreamInfo streamInfo, StreamSpec streamSpec) {
        boolean isStreamError = streamInfo.getId() == -1;
        boolean isStreamActive = streamInfo.getStreamState() == StreamInfo.StreamState.ACTIVE;
        if (isStreamError && isStreamActive) {
            throw new IllegalStateException("Unexpected stream state, stream is error but active");
        }
        sessionConfigBuilder.clearSurfaces();
        DynamicRange dynamicRange = streamSpec.getDynamicRange();
        if (!isStreamError) {
            DeferrableSurface deferrableSurface = this.mDeferrableSurface;
            if (isStreamActive) {
                sessionConfigBuilder.addSurface(deferrableSurface, dynamicRange);
            } else {
                sessionConfigBuilder.addNonRepeatingSurface(deferrableSurface, dynamicRange);
            }
        }
        setupSurfaceUpdateNotifier(sessionConfigBuilder, isStreamActive);
    }

    private SurfaceProcessorNode createNodeIfNeeded(CameraInternal camera, Rect cropRect, Size resolution, DynamicRange dynamicRange) {
        if (getEffect() != null || shouldEnableSurfaceProcessingByQuirk(camera) || shouldCrop(cropRect, resolution) || shouldMirror(camera) || shouldCompensateTransformation()) {
            Logger.d(TAG, "Surface processing is enabled.");
            return new SurfaceProcessorNode((CameraInternal) Objects.requireNonNull(getCamera()), getEffect() != null ? getEffect().createSurfaceProcessorInternal() : DefaultSurfaceProcessor.Factory.newInstance(dynamicRange));
        }
        return null;
    }

    SurfaceProcessorNode getNode() {
        return this.mNode;
    }

    private static Rect adjustCropRectToValidSize(final Rect cropRect, Size resolution, VideoEncoderInfo videoEncoderInfo) {
        Logger.d(TAG, String.format("Adjust cropRect %s by width/height alignment %d/%d and supported widths %s / supported heights %s", TransformUtils.rectToString(cropRect), Integer.valueOf(videoEncoderInfo.getWidthAlignment()), Integer.valueOf(videoEncoderInfo.getHeightAlignment()), videoEncoderInfo.getSupportedWidths(), videoEncoderInfo.getSupportedHeights()));
        int widthAlignment = videoEncoderInfo.getWidthAlignment();
        int heightAlignment = videoEncoderInfo.getHeightAlignment();
        Range<Integer> supportedWidths = videoEncoderInfo.getSupportedWidths();
        Range<Integer> supportedHeights = videoEncoderInfo.getSupportedHeights();
        int widthAlignedDown = alignDown(cropRect.width(), widthAlignment, supportedWidths);
        int widthAlignedUp = alignUp(cropRect.width(), widthAlignment, supportedWidths);
        int heightAlignedDown = alignDown(cropRect.height(), heightAlignment, supportedHeights);
        int heightAlignedUp = alignUp(cropRect.height(), heightAlignment, supportedHeights);
        Set<Size> candidateSet = new HashSet<>();
        addBySupportedSize(candidateSet, widthAlignedDown, heightAlignedDown, resolution, videoEncoderInfo);
        addBySupportedSize(candidateSet, widthAlignedDown, heightAlignedUp, resolution, videoEncoderInfo);
        addBySupportedSize(candidateSet, widthAlignedUp, heightAlignedDown, resolution, videoEncoderInfo);
        addBySupportedSize(candidateSet, widthAlignedUp, heightAlignedUp, resolution, videoEncoderInfo);
        if (candidateSet.isEmpty()) {
            Logger.w(TAG, "Can't find valid cropped size");
            return cropRect;
        }
        List<Size> candidatesList = new ArrayList<>(candidateSet);
        Logger.d(TAG, "candidatesList = " + candidatesList);
        Collections.sort(candidatesList, new Comparator() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda1
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return VideoCapture.lambda$adjustCropRectToValidSize$4(cropRect, (Size) obj, (Size) obj2);
            }
        });
        Logger.d(TAG, "sorted candidatesList = " + candidatesList);
        Size newSize = candidatesList.get(0);
        int newWidth = newSize.getWidth();
        int newHeight = newSize.getHeight();
        if (newWidth == cropRect.width() && newHeight == cropRect.height()) {
            Logger.d(TAG, "No need to adjust cropRect because crop size is valid.");
            return cropRect;
        }
        Preconditions.checkState(newWidth % 2 == 0 && newHeight % 2 == 0 && newWidth <= resolution.getWidth() && newHeight <= resolution.getHeight());
        Rect newCropRect = new Rect(cropRect);
        if (newWidth != cropRect.width()) {
            newCropRect.left = Math.max(0, cropRect.centerX() - (newWidth / 2));
            newCropRect.right = newCropRect.left + newWidth;
            if (newCropRect.right > resolution.getWidth()) {
                newCropRect.right = resolution.getWidth();
                newCropRect.left = newCropRect.right - newWidth;
            }
        }
        if (newHeight != cropRect.height()) {
            newCropRect.top = Math.max(0, cropRect.centerY() - (newHeight / 2));
            newCropRect.bottom = newCropRect.top + newHeight;
            if (newCropRect.bottom > resolution.getHeight()) {
                newCropRect.bottom = resolution.getHeight();
                newCropRect.top = newCropRect.bottom - newHeight;
            }
        }
        Logger.d(TAG, String.format("Adjust cropRect from %s to %s", TransformUtils.rectToString(cropRect), TransformUtils.rectToString(newCropRect)));
        return newCropRect;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ int lambda$adjustCropRectToValidSize$4(Rect cropRect, Size s1, Size s2) {
        return (Math.abs(s1.getWidth() - cropRect.width()) + Math.abs(s1.getHeight() - cropRect.height())) - (Math.abs(s2.getWidth() - cropRect.width()) + Math.abs(s2.getHeight() - cropRect.height()));
    }

    private static void addBySupportedSize(Set<Size> candidates, int width, int height, Size resolution, VideoEncoderInfo videoEncoderInfo) {
        if (width > resolution.getWidth() || height > resolution.getHeight()) {
            return;
        }
        try {
            Range<Integer> supportedHeights = videoEncoderInfo.getSupportedHeightsFor(width);
            candidates.add(new Size(width, supportedHeights.clamp(Integer.valueOf(height)).intValue()));
        } catch (IllegalArgumentException e) {
            Logger.w(TAG, "No supportedHeights for width: " + width, e);
        }
        try {
            Range<Integer> supportedWidths = videoEncoderInfo.getSupportedWidthsFor(height);
            candidates.add(new Size(supportedWidths.clamp(Integer.valueOf(width)).intValue(), height));
        } catch (IllegalArgumentException e2) {
            Logger.w(TAG, "No supportedWidths for height: " + height, e2);
        }
    }

    boolean isStreamIdChanged(int currentId, int newId) {
        return (StreamInfo.NON_SURFACE_STREAM_ID.contains(Integer.valueOf(currentId)) || StreamInfo.NON_SURFACE_STREAM_ID.contains(Integer.valueOf(newId)) || currentId == newId) ? false : true;
    }

    boolean shouldResetCompensatingTransformation(StreamInfo currentStreamInfo, StreamInfo streamInfo) {
        return this.mHasCompensatingTransformation && currentStreamInfo.getInProgressTransformationInfo() != null && streamInfo.getInProgressTransformationInfo() == null;
    }

    private boolean shouldMirror(CameraInternal camera) {
        return camera.getHasTransform() && isMirroringRequired(camera);
    }

    private boolean shouldCompensateTransformation() {
        return this.mStreamInfo.getInProgressTransformationInfo() != null;
    }

    private static boolean shouldCrop(Rect cropRect, Size resolution) {
        return (resolution.getWidth() == cropRect.width() && resolution.getHeight() == cropRect.height()) ? false : true;
    }

    private static boolean shouldEnableSurfaceProcessingByQuirk(CameraInternal camera) {
        return camera.getHasTransform() && sEnableSurfaceProcessingByQuirk;
    }

    private static int alignDown(int length, int alignment, Range<Integer> supportedLength) {
        return align(true, length, alignment, supportedLength);
    }

    private static int alignUp(int length, int alignment, Range<Integer> supportedRange) {
        return align(false, length, alignment, supportedRange);
    }

    private static int align(boolean alignDown, int length, int alignment, Range<Integer> supportedRange) {
        int newLength;
        int remainder = length % alignment;
        if (remainder == 0) {
            newLength = length;
        } else if (alignDown) {
            newLength = length - remainder;
        } else {
            int newLength2 = alignment - remainder;
            newLength = newLength2 + length;
        }
        return supportedRange.clamp(Integer.valueOf(newLength)).intValue();
    }

    private VideoEncoderInfo getVideoEncoderInfo(Function<VideoEncoderConfig, VideoEncoderInfo> videoEncoderInfoFinder, VideoCapabilities videoCapabilities, DynamicRange dynamicRange, MediaSpec mediaSpec, Size resolution, Range<Integer> expectedFrameRate) {
        if (this.mVideoEncoderInfo != null) {
            return this.mVideoEncoderInfo;
        }
        VideoValidatedEncoderProfilesProxy encoderProfiles = videoCapabilities.findHighestSupportedEncoderProfilesFor(resolution, dynamicRange);
        VideoEncoderInfo videoEncoderInfo = resolveVideoEncoderInfo(videoEncoderInfoFinder, encoderProfiles, mediaSpec, resolution, dynamicRange, expectedFrameRate);
        Size profileSize = null;
        if (videoEncoderInfo == null) {
            Logger.w(TAG, "Can't find videoEncoderInfo");
            return null;
        }
        if (encoderProfiles != null) {
            profileSize = new Size(encoderProfiles.getDefaultVideoProfile().getWidth(), encoderProfiles.getDefaultVideoProfile().getHeight());
        }
        VideoEncoderInfo videoEncoderInfo2 = VideoEncoderInfoWrapper.from(videoEncoderInfo, profileSize);
        this.mVideoEncoderInfo = videoEncoderInfo2;
        return videoEncoderInfo2;
    }

    private static VideoEncoderInfo resolveVideoEncoderInfo(Function<VideoEncoderConfig, VideoEncoderInfo> videoEncoderInfoFinder, VideoValidatedEncoderProfilesProxy encoderProfiles, MediaSpec mediaSpec, Size resolution, DynamicRange dynamicRange, Range<Integer> expectedFrameRate) {
        VideoMimeInfo videoMimeInfo = VideoConfigUtil.resolveVideoMimeInfo(mediaSpec, dynamicRange, encoderProfiles);
        VideoEncoderConfig videoEncoderConfig = VideoConfigUtil.resolveVideoEncoderConfig(videoMimeInfo, Timebase.UPTIME, mediaSpec.getVideoSpec(), resolution, dynamicRange, expectedFrameRate);
        return videoEncoderInfoFinder.apply(videoEncoderConfig);
    }

    private void setupSurfaceUpdateNotifier(final SessionConfig.Builder sessionConfigBuilder, final boolean isStreamActive) {
        if (this.mSurfaceUpdateFuture != null && this.mSurfaceUpdateFuture.cancel(false)) {
            Logger.d(TAG, "A newer surface update is requested. Previous surface update cancelled.");
        }
        final ListenableFuture<Void> surfaceUpdateFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda2
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return VideoCapture.this.m202xc7537f7(sessionConfigBuilder, completer);
            }
        });
        this.mSurfaceUpdateFuture = surfaceUpdateFuture;
        Futures.addCallback(surfaceUpdateFuture, new FutureCallback<Void>() { // from class: androidx.camera.video.VideoCapture.3
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                if (surfaceUpdateFuture == VideoCapture.this.mSurfaceUpdateFuture && VideoCapture.this.mSourceState != VideoOutput.SourceState.INACTIVE) {
                    VideoCapture.this.setSourceState(isStreamActive ? VideoOutput.SourceState.ACTIVE_STREAMING : VideoOutput.SourceState.ACTIVE_NON_STREAMING);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (!(t instanceof CancellationException)) {
                    Logger.e(VideoCapture.TAG, "Surface update completed with unexpected exception", t);
                }
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setupSurfaceUpdateNotifier$6$androidx-camera-video-VideoCapture  reason: not valid java name */
    public /* synthetic */ Object m202xc7537f7(final SessionConfig.Builder sessionConfigBuilder, CallbackToFutureAdapter.Completer completer) throws Exception {
        sessionConfigBuilder.addTag(SURFACE_UPDATE_KEY, Integer.valueOf(completer.hashCode()));
        final AtomicBoolean surfaceUpdateComplete = new AtomicBoolean(false);
        final CameraCaptureCallback cameraCaptureCallback = new AnonymousClass2(surfaceUpdateComplete, completer, sessionConfigBuilder);
        completer.addCancellationListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                VideoCapture.lambda$setupSurfaceUpdateNotifier$5(surfaceUpdateComplete, sessionConfigBuilder, cameraCaptureCallback);
            }
        }, CameraXExecutors.directExecutor());
        sessionConfigBuilder.addRepeatingCameraCaptureCallback(cameraCaptureCallback);
        return String.format("%s[0x%x]", SURFACE_UPDATE_KEY, Integer.valueOf(completer.hashCode()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: androidx.camera.video.VideoCapture$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 extends CameraCaptureCallback {
        private boolean mIsFirstCaptureResult = true;
        final /* synthetic */ CallbackToFutureAdapter.Completer val$completer;
        final /* synthetic */ SessionConfig.Builder val$sessionConfigBuilder;
        final /* synthetic */ AtomicBoolean val$surfaceUpdateComplete;

        AnonymousClass2(AtomicBoolean atomicBoolean, CallbackToFutureAdapter.Completer completer, SessionConfig.Builder builder) {
            this.val$surfaceUpdateComplete = atomicBoolean;
            this.val$completer = completer;
            this.val$sessionConfigBuilder = builder;
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(CameraCaptureResult cameraCaptureResult) {
            Object tag;
            super.onCaptureCompleted(cameraCaptureResult);
            if (this.mIsFirstCaptureResult) {
                this.mIsFirstCaptureResult = false;
                Logger.d(VideoCapture.TAG, "cameraCaptureResult timestampNs = " + cameraCaptureResult.getTimestamp() + ", current system uptimeMs = " + SystemClock.uptimeMillis() + ", current system realtimeMs = " + SystemClock.elapsedRealtime());
            }
            if (!this.val$surfaceUpdateComplete.get() && (tag = cameraCaptureResult.getTagBundle().getTag(VideoCapture.SURFACE_UPDATE_KEY)) != null && ((Integer) tag).intValue() == this.val$completer.hashCode() && this.val$completer.set(null) && !this.val$surfaceUpdateComplete.getAndSet(true)) {
                ScheduledExecutorService mainThreadExecutor = CameraXExecutors.mainThreadExecutor();
                final SessionConfig.Builder builder = this.val$sessionConfigBuilder;
                mainThreadExecutor.execute(new Runnable() { // from class: androidx.camera.video.VideoCapture$2$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        VideoCapture.AnonymousClass2.this.m203lambda$onCaptureCompleted$0$androidxcameravideoVideoCapture$2(builder);
                    }
                });
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onCaptureCompleted$0$androidx-camera-video-VideoCapture$2  reason: not valid java name */
        public /* synthetic */ void m203lambda$onCaptureCompleted$0$androidxcameravideoVideoCapture$2(SessionConfig.Builder sessionConfigBuilder) {
            sessionConfigBuilder.removeCameraCaptureCallback(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$setupSurfaceUpdateNotifier$5(AtomicBoolean surfaceUpdateComplete, SessionConfig.Builder sessionConfigBuilder, CameraCaptureCallback cameraCaptureCallback) {
        Preconditions.checkState(Threads.isMainThread(), "Surface update cancellation should only occur on main thread.");
        surfaceUpdateComplete.set(true);
        sessionConfigBuilder.removeCameraCaptureCallback(cameraCaptureCallback);
    }

    private void updateCustomOrderedResolutionsByQuality(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) throws IllegalArgumentException {
        MediaSpec mediaSpec = getMediaSpec();
        Preconditions.checkArgument(mediaSpec != null, "Unable to update target resolution by null MediaSpec.");
        DynamicRange requestedDynamicRange = getDynamicRange();
        VideoCapabilities videoCapabilities = getVideoCapabilities(cameraInfo);
        List<Quality> supportedQualities = videoCapabilities.getSupportedQualities(requestedDynamicRange);
        if (supportedQualities.isEmpty()) {
            Logger.w(TAG, "Can't find any supported quality on the device.");
            return;
        }
        VideoSpec videoSpec = mediaSpec.getVideoSpec();
        QualitySelector qualitySelector = videoSpec.getQualitySelector();
        List<Quality> selectedQualities = qualitySelector.getPrioritizedQualities(supportedQualities);
        Logger.d(TAG, "Found selectedQualities " + selectedQualities + " by " + qualitySelector);
        if (selectedQualities.isEmpty()) {
            throw new IllegalArgumentException("Unable to find supported quality by QualitySelector");
        }
        int aspectRatio = videoSpec.getAspectRatio();
        Map<Quality, Size> sizeMap = QualitySelector.getQualityToResolutionMap(videoCapabilities, requestedDynamicRange);
        QualityRatioToResolutionsTable qualityRatioTable = new QualityRatioToResolutionsTable(cameraInfo.getSupportedResolutions(getImageFormat()), sizeMap);
        ArrayList arrayList = new ArrayList();
        for (Quality selectedQuality : selectedQualities) {
            arrayList.addAll(qualityRatioTable.getResolutions(selectedQuality, aspectRatio));
        }
        Logger.d(TAG, "Set custom ordered resolutions = " + arrayList);
        builder.getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, arrayList);
    }

    private static boolean hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing() {
        List<VideoQualityQuirk> quirks = DeviceQuirks.getAll(VideoQualityQuirk.class);
        for (VideoQualityQuirk quirk : quirks) {
            if (quirk.workaroundBySurfaceProcessing()) {
                return true;
            }
        }
        return false;
    }

    private static <T> T fetchObservableValue(Observable<T> observable, T valueIfMissing) {
        ListenableFuture<T> future = observable.fetchData();
        if (!future.isDone()) {
            return valueIfMissing;
        }
        try {
            return future.get();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException(e);
        }
    }

    void setSourceState(VideoOutput.SourceState newState) {
        VideoOutput.SourceState oldState = this.mSourceState;
        if (newState != oldState) {
            this.mSourceState = newState;
            getOutput().onSourceStateChanged(newState);
        }
    }

    SurfaceRequest getSurfaceRequest() {
        return (SurfaceRequest) Objects.requireNonNull(this.mSurfaceRequest);
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(2);
        return targets;
    }

    /* loaded from: classes.dex */
    public static final class Builder<T extends VideoOutput> implements UseCaseConfig.Builder<VideoCapture<T>, VideoCaptureConfig<T>, Builder<T>>, ImageOutputConfig.Builder<Builder<T>>, ImageInputConfig.Builder<Builder<T>>, ThreadConfig.Builder<Builder<T>> {
        private final MutableOptionsBundle mMutableConfig;

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Object setCustomOrderedResolutions(List list) {
            return setCustomOrderedResolutions((List<Size>) list);
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Object setSupportedResolutions(List list) {
            return setSupportedResolutions((List<Pair<Integer, Size[]>>) list);
        }

        public Builder(T videoOutput) {
            this(createInitialBundle(videoOutput));
        }

        private Builder(MutableOptionsBundle mutableConfig) {
            this.mMutableConfig = mutableConfig;
            if (!this.mMutableConfig.containsOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT)) {
                throw new IllegalArgumentException("VideoOutput is required");
            }
            Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (oldConfigClass != null && !oldConfigClass.equals(VideoCapture.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
            }
            setTargetClass((Class) VideoCapture.class);
        }

        static Builder<? extends VideoOutput> fromConfig(Config configuration) {
            return new Builder<>(MutableOptionsBundle.from(configuration));
        }

        public static <T extends VideoOutput> Builder<T> fromConfig(VideoCaptureConfig<T> configuration) {
            return new Builder<>(MutableOptionsBundle.from((Config) configuration));
        }

        private static <T extends VideoOutput> MutableOptionsBundle createInitialBundle(T videoOutput) {
            MutableOptionsBundle bundle = MutableOptionsBundle.create();
            bundle.insertOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT, videoOutput);
            return bundle;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public VideoCaptureConfig<T> getUseCaseConfig() {
            return new VideoCaptureConfig<>(OptionsBundle.from(this.mMutableConfig));
        }

        Builder<T> setVideoEncoderInfoFinder(Function<VideoEncoderConfig, VideoEncoderInfo> videoEncoderInfoFinder) {
            getMutableConfig().insertOption(VideoCaptureConfig.OPTION_VIDEO_ENCODER_INFO_FINDER, videoEncoderInfoFinder);
            return this;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public VideoCapture<T> build() {
            return new VideoCapture<>(getUseCaseConfig());
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder<T> setTargetClass(Class<VideoCapture<T>> targetClass) {
            getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_CLASS, targetClass);
            if (getMutableConfig().retrieveOption(TargetConfig.OPTION_TARGET_NAME, null) == null) {
                String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
                setTargetName(targetName);
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder<T> setTargetName(String targetName) {
            getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_NAME, targetName);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetAspectRatio(int aspectRatio) {
            throw new UnsupportedOperationException("setTargetAspectRatio is not supported.");
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetRotation(int rotation) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_ROTATION, Integer.valueOf(rotation));
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setMirrorMode(int mirrorMode) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_MIRROR_MODE, Integer.valueOf(mirrorMode));
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetResolution(Size resolution) {
            throw new UnsupportedOperationException("setTargetResolution is not supported.");
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setDefaultResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, resolution);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setMaxResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_MAX_RESOLUTION, resolution);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setSupportedResolutions(List<Pair<Integer, Size[]>> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, resolutions);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setCustomOrderedResolutions(List<Size> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, resolutions);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageInputConfig.Builder
        public Builder<T> setDynamicRange(DynamicRange dynamicRange) {
            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
            return this;
        }

        @Override // androidx.camera.core.internal.ThreadConfig.Builder
        public Builder<T> setBackgroundExecutor(Executor executor) {
            getMutableConfig().insertOption(ThreadConfig.OPTION_BACKGROUND_EXECUTOR, executor);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setDefaultSessionConfig(SessionConfig sessionConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setSurfaceOccupancyPriority(int priority) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(priority));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCameraSelector(CameraSelector cameraSelector) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAMERA_SELECTOR, cameraSelector);
            return this;
        }

        @Override // androidx.camera.core.internal.UseCaseEventConfig.Builder
        public Builder<T> setUseCaseEventCallback(UseCase.EventCallback useCaseEventCallback) {
            getMutableConfig().insertOption(UseCaseEventConfig.OPTION_USE_CASE_EVENT_CALLBACK, useCaseEventCallback);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setZslDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setHighResolutionDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        public Builder<T> setTargetFrameRate(Range<Integer> targetFrameRate) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, targetFrameRate);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCaptureType(UseCaseConfigFactory.CaptureType captureType) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, captureType);
            return this;
        }
    }
}
