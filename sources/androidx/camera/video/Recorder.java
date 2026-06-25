package androidx.camera.video;

import android.content.ContentValues;
import android.content.Context;
import android.location.Location;
import android.media.MediaMuxer;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.MutableStateObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.StateObservable;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.utils.CloseGuardHelper;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.utils.ArrayRingBuffer;
import androidx.camera.core.internal.utils.RingBuffer;
import androidx.camera.video.AudioSpec;
import androidx.camera.video.MediaSpec;
import androidx.camera.video.Recorder;
import androidx.camera.video.StreamInfo;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.VideoRecordEvent;
import androidx.camera.video.VideoSpec;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.audio.AudioSettings;
import androidx.camera.video.internal.audio.AudioSource;
import androidx.camera.video.internal.audio.AudioSourceAccessException;
import androidx.camera.video.internal.compat.Api26Impl;
import androidx.camera.video.internal.compat.quirk.DeactivateEncoderSurfaceBeforeStopEncoderQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.EncoderNotUsePersistentInputSurfaceQuirk;
import androidx.camera.video.internal.config.AudioConfigUtil;
import androidx.camera.video.internal.config.AudioMimeInfo;
import androidx.camera.video.internal.encoder.AudioEncoderConfig;
import androidx.camera.video.internal.encoder.BufferCopiedEncodedData;
import androidx.camera.video.internal.encoder.EncodeException;
import androidx.camera.video.internal.encoder.EncodedData;
import androidx.camera.video.internal.encoder.Encoder;
import androidx.camera.video.internal.encoder.EncoderCallback;
import androidx.camera.video.internal.encoder.EncoderConfig;
import androidx.camera.video.internal.encoder.EncoderFactory;
import androidx.camera.video.internal.encoder.EncoderImpl;
import androidx.camera.video.internal.encoder.InvalidConfigException;
import androidx.camera.video.internal.encoder.OutputConfig;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.utils.OutputUtil;
import androidx.camera.video.internal.workaround.CorrectNegativeLatLongForMediaMuxer;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class Recorder implements VideoOutput {
    private static final int AUDIO_CACHE_SIZE = 60;
    private static final String MEDIA_COLUMN = "_data";
    private static final int NOT_PENDING = 0;
    private static final int PENDING = 1;
    private static final long SOURCE_NON_STREAMING_TIMEOUT_MS = 1000;
    private static final String TAG = "Recorder";
    RecordingRecord mActiveRecordingRecord;
    Surface mActiveSurface;
    double mAudioAmplitude;
    Encoder mAudioEncoder;
    private final EncoderFactory mAudioEncoderFactory;
    Throwable mAudioErrorCause;
    OutputConfig mAudioOutputConfig;
    AudioSource mAudioSource;
    AudioState mAudioState;
    Integer mAudioTrackIndex;
    long mDurationLimitNs;
    private final boolean mEncoderNotUsePersistentInputSurface;
    final List<ListenableFuture<Void>> mEncodingFutures;
    private final Executor mExecutor;
    long mFileSizeLimitInBytes;
    long mFirstRecordingAudioDataTimeUs;
    int mFirstRecordingVideoBitrate;
    long mFirstRecordingVideoDataTimeUs;
    RecordingRecord mInProgressRecording;
    boolean mInProgressRecordingStopping;
    private SurfaceRequest.TransformationInfo mInProgressTransformationInfo;
    boolean mIsAudioSourceSilenced;
    private long mLastGeneratedRecordingId;
    Surface mLatestSurface;
    SurfaceRequest mLatestSurfaceRequest;
    private final Object mLock = new Object();
    MediaMuxer mMediaMuxer;
    final MutableStateObservable<MediaSpec> mMediaSpec;
    private boolean mNeedsResetBeforeNextStart;
    private State mNonPendingState;
    Uri mOutputUri;
    final RingBuffer<EncodedData> mPendingAudioRingBuffer;
    EncodedData mPendingFirstVideoData;
    RecordingRecord mPendingRecordingRecord;
    long mPreviousRecordingAudioDataTimeUs;
    long mPreviousRecordingVideoDataTimeUs;
    long mRecordingBytes;
    long mRecordingDurationNs;
    int mRecordingStopError;
    Throwable mRecordingStopErrorCause;
    private VideoValidatedEncoderProfilesProxy mResolvedEncoderProfiles;
    final Executor mSequentialExecutor;
    private boolean mShouldSendResumeEvent;
    ScheduledFuture<?> mSourceNonStreamingTimeout;
    VideoOutput.SourceState mSourceState;
    private SurfaceRequest.TransformationInfo mSourceTransformationInfo;
    private State mState;
    int mStreamId;
    private final MutableStateObservable<StreamInfo> mStreamInfo;
    private final Executor mUserProvidedExecutor;
    Encoder mVideoEncoder;
    Range<Integer> mVideoEncoderBitrateRange;
    private final EncoderFactory mVideoEncoderFactory;
    VideoEncoderSession mVideoEncoderSession;
    VideoEncoderSession mVideoEncoderSessionToRelease;
    OutputConfig mVideoOutputConfig;
    Timebase mVideoSourceTimebase;
    Integer mVideoTrackIndex;
    private static final Set<State> PENDING_STATES = Collections.unmodifiableSet(EnumSet.of(State.PENDING_RECORDING, State.PENDING_PAUSED));
    private static final Set<State> VALID_NON_PENDING_STATES_WHILE_PENDING = Collections.unmodifiableSet(EnumSet.of(State.CONFIGURING, State.IDLING, State.RESETTING, State.STOPPING, State.ERROR));
    public static final QualitySelector DEFAULT_QUALITY_SELECTOR = QualitySelector.fromOrderedList(Arrays.asList(Quality.FHD, Quality.HD, Quality.SD), FallbackStrategy.higherQualityOrLowerThan(Quality.FHD));
    private static final VideoSpec VIDEO_SPEC_DEFAULT = VideoSpec.builder().setQualitySelector(DEFAULT_QUALITY_SELECTOR).setAspectRatio(-1).build();
    private static final MediaSpec MEDIA_SPEC_DEFAULT = MediaSpec.builder().setOutputFormat(-1).setVideoSpec(VIDEO_SPEC_DEFAULT).build();
    private static final Exception PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE = new RuntimeException("The video frame producer became inactive before any data was received.");
    static final EncoderFactory DEFAULT_ENCODER_FACTORY = new EncoderFactory() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda18
        @Override // androidx.camera.video.internal.encoder.EncoderFactory
        public final Encoder createEncoder(Executor executor, EncoderConfig encoderConfig) {
            return new EncoderImpl(executor, encoderConfig);
        }
    };
    private static final Executor AUDIO_EXECUTOR = CameraXExecutors.newSequentialExecutor(CameraXExecutors.ioExecutor());

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum AudioState {
        INITIALIZING,
        IDLING,
        DISABLED,
        ENABLED,
        ERROR_ENCODER,
        ERROR_SOURCE
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum State {
        CONFIGURING,
        PENDING_RECORDING,
        PENDING_PAUSED,
        IDLING,
        RECORDING,
        PAUSED,
        STOPPING,
        RESETTING,
        ERROR
    }

    Recorder(Executor executor, MediaSpec mediaSpec, EncoderFactory videoEncoderFactory, EncoderFactory audioEncoderFactory) {
        this.mEncoderNotUsePersistentInputSurface = DeviceQuirks.get(EncoderNotUsePersistentInputSurfaceQuirk.class) != null;
        this.mState = State.CONFIGURING;
        this.mNonPendingState = null;
        this.mStreamId = 0;
        this.mActiveRecordingRecord = null;
        this.mPendingRecordingRecord = null;
        this.mLastGeneratedRecordingId = 0L;
        this.mInProgressRecording = null;
        this.mInProgressRecordingStopping = false;
        this.mInProgressTransformationInfo = null;
        this.mSourceTransformationInfo = null;
        this.mResolvedEncoderProfiles = null;
        this.mEncodingFutures = new ArrayList();
        this.mAudioTrackIndex = null;
        this.mVideoTrackIndex = null;
        this.mLatestSurface = null;
        this.mActiveSurface = null;
        this.mMediaMuxer = null;
        this.mAudioSource = null;
        this.mVideoEncoder = null;
        this.mVideoOutputConfig = null;
        this.mAudioEncoder = null;
        this.mAudioOutputConfig = null;
        this.mAudioState = AudioState.INITIALIZING;
        this.mOutputUri = Uri.EMPTY;
        this.mRecordingBytes = 0L;
        this.mRecordingDurationNs = 0L;
        this.mFirstRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mFirstRecordingVideoBitrate = 0;
        this.mVideoEncoderBitrateRange = null;
        this.mFirstRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mFileSizeLimitInBytes = 0L;
        this.mDurationLimitNs = 0L;
        this.mRecordingStopError = 1;
        this.mRecordingStopErrorCause = null;
        this.mPendingFirstVideoData = null;
        this.mPendingAudioRingBuffer = new ArrayRingBuffer(60);
        this.mAudioErrorCause = null;
        this.mIsAudioSourceSilenced = false;
        this.mSourceState = VideoOutput.SourceState.INACTIVE;
        this.mSourceNonStreamingTimeout = null;
        this.mNeedsResetBeforeNextStart = false;
        this.mVideoEncoderSessionToRelease = null;
        this.mAudioAmplitude = AudioStats.AUDIO_AMPLITUDE_NONE;
        this.mShouldSendResumeEvent = false;
        this.mUserProvidedExecutor = executor;
        this.mExecutor = executor != null ? executor : CameraXExecutors.ioExecutor();
        this.mSequentialExecutor = CameraXExecutors.newSequentialExecutor(this.mExecutor);
        this.mMediaSpec = MutableStateObservable.withInitialState(composeRecorderMediaSpec(mediaSpec));
        this.mStreamInfo = MutableStateObservable.withInitialState(StreamInfo.of(this.mStreamId, internalStateToStreamState(this.mState)));
        this.mVideoEncoderFactory = videoEncoderFactory;
        this.mAudioEncoderFactory = audioEncoderFactory;
        this.mVideoEncoderSession = new VideoEncoderSession(this.mVideoEncoderFactory, this.mSequentialExecutor, this.mExecutor);
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSurfaceRequested(SurfaceRequest request) {
        onSurfaceRequested(request, Timebase.UPTIME);
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSurfaceRequested(final SurfaceRequest request, final Timebase timebase) {
        synchronized (this.mLock) {
            Logger.d(TAG, "Surface is requested in state: " + this.mState + ", Current surface: " + this.mStreamId);
            if (this.mState == State.ERROR) {
                setState(State.CONFIGURING);
            }
        }
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda13
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.this.m187lambda$onSurfaceRequested$0$androidxcameravideoRecorder(request, timebase);
            }
        });
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<MediaSpec> getMediaSpec() {
        return this.mMediaSpec;
    }

    @Override // androidx.camera.video.VideoOutput
    public Observable<StreamInfo> getStreamInfo() {
        return this.mStreamInfo;
    }

    @Override // androidx.camera.video.VideoOutput
    public void onSourceStateChanged(final VideoOutput.SourceState newState) {
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda14
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.this.m186lambda$onSourceStateChanged$1$androidxcameravideoRecorder(newState);
            }
        });
    }

    @Override // androidx.camera.video.VideoOutput
    public VideoCapabilities getMediaCapabilities(CameraInfo cameraInfo) {
        return getVideoCapabilities(cameraInfo);
    }

    public PendingRecording prepareRecording(Context context, FileOutputOptions fileOutputOptions) {
        return prepareRecordingInternal(context, fileOutputOptions);
    }

    public PendingRecording prepareRecording(Context context, FileDescriptorOutputOptions fileDescriptorOutputOptions) {
        return prepareRecordingInternal(context, fileDescriptorOutputOptions);
    }

    public PendingRecording prepareRecording(Context context, MediaStoreOutputOptions mediaStoreOutputOptions) {
        return prepareRecordingInternal(context, mediaStoreOutputOptions);
    }

    private PendingRecording prepareRecordingInternal(Context context, OutputOptions options) {
        Preconditions.checkNotNull(options, "The OutputOptions cannot be null.");
        return new PendingRecording(context, this, options);
    }

    public QualitySelector getQualitySelector() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getQualitySelector();
    }

    int getAudioSource() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getAudioSpec().getSource();
    }

    public Executor getExecutor() {
        return this.mUserProvidedExecutor;
    }

    public int getTargetVideoEncodingBitRate() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getBitrate().getLower().intValue();
    }

    public int getAspectRatio() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getVideoSpec().getAspectRatio();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0079 -> B:42:0x008a). Please submit an issue!!! */
    public Recording start(PendingRecording pendingRecording) {
        long recordingId;
        Preconditions.checkNotNull(pendingRecording, "The given PendingRecording cannot be null.");
        RecordingRecord alreadyInProgressRecording = null;
        int error = 0;
        Throwable errorCause = null;
        synchronized (this.mLock) {
            recordingId = this.mLastGeneratedRecordingId + 1;
            this.mLastGeneratedRecordingId = recordingId;
            switch (this.mState) {
                case PAUSED:
                case RECORDING:
                    alreadyInProgressRecording = this.mActiveRecordingRecord;
                    break;
                case PENDING_PAUSED:
                case PENDING_RECORDING:
                    alreadyInProgressRecording = (RecordingRecord) Preconditions.checkNotNull(this.mPendingRecordingRecord);
                    break;
                case RESETTING:
                case STOPPING:
                case CONFIGURING:
                case ERROR:
                case IDLING:
                    if (this.mState == State.IDLING) {
                        Preconditions.checkState(this.mActiveRecordingRecord == null && this.mPendingRecordingRecord == null, "Expected recorder to be idle but a recording is either pending or in progress.");
                    }
                    try {
                        RecordingRecord recordingRecord = RecordingRecord.from(pendingRecording, recordingId);
                        recordingRecord.initializeRecording(pendingRecording.getApplicationContext());
                        this.mPendingRecordingRecord = recordingRecord;
                        if (this.mState == State.IDLING) {
                            setState(State.PENDING_RECORDING);
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda1
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.tryServicePendingRecording();
                                }
                            });
                        } else if (this.mState == State.ERROR) {
                            setState(State.PENDING_RECORDING);
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda2
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.m192lambda$start$2$androidxcameravideoRecorder();
                                }
                            });
                        } else {
                            setState(State.PENDING_RECORDING);
                        }
                    } catch (IOException e) {
                        error = 5;
                        errorCause = e;
                    }
                    break;
            }
        }
        if (alreadyInProgressRecording != null) {
            throw new IllegalStateException("A recording is already in progress. Previous recordings must be stopped before a new recording can be started.");
        }
        if (error != 0) {
            Logger.e(TAG, "Recording was started when the Recorder had encountered error " + errorCause);
            finalizePendingRecording(RecordingRecord.from(pendingRecording, recordingId), error, errorCause);
            return Recording.createFinalizedFrom(pendingRecording, recordingId);
        }
        return Recording.from(pendingRecording, recordingId);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$start$2$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ void m192lambda$start$2$androidxcameravideoRecorder() {
        if (this.mLatestSurfaceRequest == null) {
            throw new AssertionError("surface request is required to retry initialization.");
        }
        configureInternal(this.mLatestSurfaceRequest, this.mVideoSourceTimebase);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void pause(Recording activeRecording) {
        synchronized (this.mLock) {
            if (!isSameRecording(activeRecording, this.mPendingRecordingRecord) && !isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "pause() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
                return;
            }
            switch (this.mState) {
                case RECORDING:
                    setState(State.PAUSED);
                    final RecordingRecord finalActiveRecordingRecord = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda5
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m188lambda$pause$3$androidxcameravideoRecorder(finalActiveRecordingRecord);
                        }
                    });
                    break;
                case PENDING_RECORDING:
                    setState(State.PENDING_PAUSED);
                    break;
                case CONFIGURING:
                case IDLING:
                    throw new IllegalStateException("Called pause() from invalid state: " + this.mState);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resume(Recording activeRecording) {
        synchronized (this.mLock) {
            if (!isSameRecording(activeRecording, this.mPendingRecordingRecord) && !isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "resume() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
                return;
            }
            switch (this.mState) {
                case PAUSED:
                    setState(State.RECORDING);
                    final RecordingRecord finalActiveRecordingRecord = this.mActiveRecordingRecord;
                    this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda16
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.this.m189lambda$resume$4$androidxcameravideoRecorder(finalActiveRecordingRecord);
                        }
                    });
                    break;
                case PENDING_PAUSED:
                    setState(State.PENDING_RECORDING);
                    break;
                case CONFIGURING:
                case IDLING:
                    throw new IllegalStateException("Called resume() from invalid state: " + this.mState);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stop(Recording activeRecording, int error, Throwable errorCause) {
        final int error2;
        final Throwable errorCause2;
        RecordingRecord pendingRecordingToFinalize = null;
        synchronized (this.mLock) {
            try {
                try {
                    if (!isSameRecording(activeRecording, this.mPendingRecordingRecord)) {
                        try {
                            if (!isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                                Logger.d(TAG, "stop() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
                                return;
                            }
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                    switch (this.mState) {
                        case PAUSED:
                        case RECORDING:
                            setState(State.STOPPING);
                            final long explicitlyStopTimeUs = TimeUnit.NANOSECONDS.toMicros(System.nanoTime());
                            final RecordingRecord finalActiveRecordingRecord = this.mActiveRecordingRecord;
                            error2 = error;
                            errorCause2 = errorCause;
                            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda9
                                @Override // java.lang.Runnable
                                public final void run() {
                                    Recorder.this.m193lambda$stop$5$androidxcameravideoRecorder(finalActiveRecordingRecord, explicitlyStopTimeUs, error2, errorCause2);
                                }
                            });
                            break;
                        case PENDING_PAUSED:
                        case PENDING_RECORDING:
                            Preconditions.checkState(isSameRecording(activeRecording, this.mPendingRecordingRecord));
                            pendingRecordingToFinalize = this.mPendingRecordingRecord;
                            this.mPendingRecordingRecord = null;
                            restoreNonPendingState();
                            error2 = error;
                            errorCause2 = errorCause;
                            break;
                        case RESETTING:
                        case STOPPING:
                            Preconditions.checkState(isSameRecording(activeRecording, this.mActiveRecordingRecord));
                            error2 = error;
                            errorCause2 = errorCause;
                            break;
                        case CONFIGURING:
                        case IDLING:
                            throw new IllegalStateException("Calling stop() while idling or initializing is invalid.");
                        case ERROR:
                        default:
                            error2 = error;
                            errorCause2 = errorCause;
                            break;
                    }
                    if (pendingRecordingToFinalize != null) {
                        if (error2 == 10) {
                            Logger.e(TAG, "Recording was stopped due to recording being garbage collected before any valid data has been produced.");
                        }
                        finalizePendingRecording(pendingRecordingToFinalize, 8, new RuntimeException("Recording was stopped before any data could be produced.", errorCause2));
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void mute(Recording activeRecording, final boolean muted) {
        synchronized (this.mLock) {
            if (!isSameRecording(activeRecording, this.mPendingRecordingRecord) && !isSameRecording(activeRecording, this.mActiveRecordingRecord)) {
                Logger.d(TAG, "mute() called on a recording that is no longer active: " + activeRecording.getOutputOptions());
                return;
            }
            final RecordingRecord finalRecordingRecord = isSameRecording(activeRecording, this.mPendingRecordingRecord) ? this.mPendingRecordingRecord : this.mActiveRecordingRecord;
            this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda17
                @Override // java.lang.Runnable
                public final void run() {
                    Recorder.this.m185lambda$mute$6$androidxcameravideoRecorder(finalRecordingRecord, muted);
                }
            });
        }
    }

    private void finalizePendingRecording(RecordingRecord recordingToFinalize, int error, Throwable cause) {
        recordingToFinalize.finalizeRecording(Uri.EMPTY);
        recordingToFinalize.updateVideoRecordEvent(VideoRecordEvent.finalizeWithError(recordingToFinalize.getOutputOptions(), RecordingStats.of(0L, 0L, AudioStats.of(1, this.mAudioErrorCause, AudioStats.AUDIO_AMPLITUDE_NONE)), OutputResults.of(Uri.EMPTY), error, cause));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onSurfaceRequestedInternal */
    public void m187lambda$onSurfaceRequested$0$androidxcameravideoRecorder(SurfaceRequest request, Timebase timebase) {
        if (this.mLatestSurfaceRequest != null && !this.mLatestSurfaceRequest.isServiced()) {
            this.mLatestSurfaceRequest.willNotProvideSurface();
        }
        this.mLatestSurfaceRequest = request;
        this.mVideoSourceTimebase = timebase;
        configureInternal(request, timebase);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: onSourceStateChangedInternal */
    public void m186lambda$onSourceStateChanged$1$androidxcameravideoRecorder(VideoOutput.SourceState newState) {
        VideoOutput.SourceState oldState = this.mSourceState;
        this.mSourceState = newState;
        if (oldState != newState) {
            Logger.d(TAG, "Video source has transitioned to state: " + newState);
            if (newState == VideoOutput.SourceState.INACTIVE) {
                if (this.mActiveSurface == null) {
                    requestReset(4, null, false);
                    return;
                }
                this.mNeedsResetBeforeNextStart = true;
                if (this.mInProgressRecording != null && !this.mInProgressRecording.isPersistent()) {
                    onInProgressRecordingInternalError(this.mInProgressRecording, 4, null);
                    return;
                }
                return;
            } else if (newState == VideoOutput.SourceState.ACTIVE_NON_STREAMING && this.mSourceNonStreamingTimeout != null && this.mSourceNonStreamingTimeout.cancel(false) && this.mVideoEncoder != null) {
                notifyEncoderSourceStopped(this.mVideoEncoder);
                return;
            } else {
                return;
            }
        }
        Logger.d(TAG, "Video source transitions to the same state: " + newState);
    }

    void requestReset(int errorCode, Throwable errorCause, boolean videoOnly) {
        boolean shouldReset = false;
        boolean shouldStop = false;
        synchronized (this.mLock) {
            try {
            } catch (Throwable th) {
                th = th;
            }
            try {
                switch (this.mState) {
                    case PAUSED:
                    case RECORDING:
                        Preconditions.checkState(this.mInProgressRecording != null, "In-progress recording shouldn't be null when in state " + this.mState);
                        if (this.mActiveRecordingRecord != this.mInProgressRecording) {
                            throw new AssertionError("In-progress recording does not match the active recording. Unable to reset encoder.");
                        }
                        if (isPersistentRecordingInProgress()) {
                            shouldReset = true;
                            break;
                        } else {
                            shouldStop = true;
                            setState(State.RESETTING);
                            break;
                        }
                    case PENDING_PAUSED:
                    case PENDING_RECORDING:
                        shouldReset = true;
                        updateNonPendingState(State.RESETTING);
                        break;
                    case STOPPING:
                        setState(State.RESETTING);
                        break;
                    case CONFIGURING:
                    case ERROR:
                    case IDLING:
                        shouldReset = true;
                        break;
                }
                if (shouldReset) {
                    if (videoOnly) {
                        resetVideo();
                    } else {
                        reset();
                    }
                } else if (shouldStop) {
                    m193lambda$stop$5$androidxcameravideoRecorder(this.mInProgressRecording, -1L, errorCode, errorCause);
                }
            } catch (Throwable th2) {
                th = th2;
                while (true) {
                    try {
                        throw th;
                    } catch (Throwable th3) {
                        th = th3;
                    }
                }
            }
        }
    }

    private void configureInternal(SurfaceRequest surfaceRequest, Timebase videoSourceTimebase) {
        if (surfaceRequest.isServiced()) {
            Logger.w(TAG, "Ignore the SurfaceRequest since it is already served.");
            return;
        }
        surfaceRequest.setTransformationInfoListener(this.mSequentialExecutor, new SurfaceRequest.TransformationInfoListener() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda4
            @Override // androidx.camera.core.SurfaceRequest.TransformationInfoListener
            public final void onTransformationInfoUpdate(SurfaceRequest.TransformationInfo transformationInfo) {
                Recorder.this.m184lambda$configureInternal$7$androidxcameravideoRecorder(transformationInfo);
            }
        });
        Size surfaceSize = surfaceRequest.getResolution();
        DynamicRange dynamicRange = surfaceRequest.getDynamicRange();
        VideoCapabilities capabilities = getVideoCapabilities(surfaceRequest.getCamera().getCameraInfo());
        Quality highestSupportedQuality = capabilities.findHighestSupportedQualityFor(surfaceSize, dynamicRange);
        Logger.d(TAG, "Using supported quality of " + highestSupportedQuality + " for surface size " + surfaceSize);
        if (highestSupportedQuality != Quality.NONE) {
            this.mResolvedEncoderProfiles = capabilities.getProfiles(highestSupportedQuality, dynamicRange);
            if (this.mResolvedEncoderProfiles == null) {
                throw new AssertionError("Camera advertised available quality but did not produce EncoderProfiles  for advertised quality.");
            }
        }
        setupVideo(surfaceRequest, videoSourceTimebase);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$configureInternal$7$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ void m184lambda$configureInternal$7$androidxcameravideoRecorder(SurfaceRequest.TransformationInfo transformationInfo) {
        this.mSourceTransformationInfo = transformationInfo;
    }

    private void setupVideo(final SurfaceRequest request, final Timebase timebase) {
        safeToCloseVideoEncoder().addListener(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda15
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.this.m191lambda$setupVideo$8$androidxcameravideoRecorder(request, timebase);
            }
        }, this.mSequentialExecutor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setupVideo$8$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ void m191lambda$setupVideo$8$androidxcameravideoRecorder(SurfaceRequest request, Timebase timebase) {
        if (request.isServiced() || (this.mVideoEncoderSession.isConfiguredSurfaceRequest(request) && !isPersistentRecordingInProgress())) {
            Logger.w(TAG, "Ignore the SurfaceRequest " + request + " isServiced: " + request.isServiced() + " VideoEncoderSession: " + this.mVideoEncoderSession + " has been configured with a persistent in-progress recording.");
            return;
        }
        final VideoEncoderSession videoEncoderSession = new VideoEncoderSession(this.mVideoEncoderFactory, this.mSequentialExecutor, this.mExecutor);
        MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
        ListenableFuture<Encoder> configureFuture = videoEncoderSession.configure(request, timebase, mediaSpec, this.mResolvedEncoderProfiles);
        this.mVideoEncoderSession = videoEncoderSession;
        Futures.addCallback(configureFuture, new FutureCallback<Encoder>() { // from class: androidx.camera.video.Recorder.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Encoder result) {
                Logger.d(Recorder.TAG, "VideoEncoder is created. " + result);
                if (result == null) {
                    return;
                }
                Preconditions.checkState(Recorder.this.mVideoEncoderSession == videoEncoderSession);
                Preconditions.checkState(Recorder.this.mVideoEncoder == null);
                Recorder.this.onVideoEncoderReady(videoEncoderSession);
                Recorder.this.onConfigured();
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.d(Recorder.TAG, "VideoEncoder Setup error: " + t);
                Recorder.this.onEncoderSetupError(t);
            }
        }, this.mSequentialExecutor);
    }

    boolean isPersistentRecordingInProgress() {
        return this.mInProgressRecording != null && this.mInProgressRecording.isPersistent();
    }

    private ListenableFuture<Void> safeToCloseVideoEncoder() {
        Logger.d(TAG, "Try to safely release video encoder: " + this.mVideoEncoder);
        return this.mVideoEncoderSession.signalTermination();
    }

    void onVideoEncoderReady(final VideoEncoderSession videoEncoderSession) {
        this.mVideoEncoder = videoEncoderSession.getVideoEncoder();
        this.mVideoEncoderBitrateRange = ((VideoEncoderInfo) this.mVideoEncoder.getEncoderInfo()).getSupportedBitrateRange();
        this.mFirstRecordingVideoBitrate = this.mVideoEncoder.getConfiguredBitrate();
        this.mActiveSurface = videoEncoderSession.getActiveSurface();
        setLatestSurface(this.mActiveSurface);
        videoEncoderSession.setOnSurfaceUpdateListener(this.mSequentialExecutor, new Encoder.SurfaceInput.OnSurfaceUpdateListener() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda6
            @Override // androidx.camera.video.internal.encoder.Encoder.SurfaceInput.OnSurfaceUpdateListener
            public final void onSurfaceUpdate(Surface surface) {
                Recorder.this.setLatestSurface(surface);
            }
        });
        Futures.addCallback(videoEncoderSession.getReadyToReleaseFuture(), new FutureCallback<Encoder>() { // from class: androidx.camera.video.Recorder.2
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Encoder result) {
                Logger.d(Recorder.TAG, "VideoEncoder can be released: " + result);
                if (result == null) {
                    return;
                }
                if (Recorder.this.mSourceNonStreamingTimeout != null && Recorder.this.mSourceNonStreamingTimeout.cancel(false) && Recorder.this.mVideoEncoder != null && Recorder.this.mVideoEncoder == result) {
                    Recorder.notifyEncoderSourceStopped(Recorder.this.mVideoEncoder);
                }
                Recorder.this.mVideoEncoderSessionToRelease = videoEncoderSession;
                Recorder.this.setLatestSurface(null);
                Recorder.this.requestReset(4, null, Recorder.this.isPersistentRecordingInProgress());
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.d(Recorder.TAG, "Error in ReadyToReleaseFuture: " + t);
            }
        }, this.mSequentialExecutor);
    }

    void onConfigured() {
        RecordingRecord recordingToStart = null;
        RecordingRecord pendingRecordingToFinalize = null;
        boolean continuePersistentRecording = false;
        int error = 0;
        Throwable errorCause = null;
        boolean recordingPaused = false;
        synchronized (this.mLock) {
            switch (this.mState) {
                case PAUSED:
                    recordingPaused = true;
                case RECORDING:
                    Preconditions.checkState(isPersistentRecordingInProgress(), "Unexpectedly invoke onConfigured() when there's a non-persistent in-progress recording");
                    continuePersistentRecording = true;
                    break;
                case PENDING_PAUSED:
                    recordingPaused = true;
                case PENDING_RECORDING:
                    if (this.mActiveRecordingRecord != null) {
                        break;
                    } else if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                        pendingRecordingToFinalize = this.mPendingRecordingRecord;
                        this.mPendingRecordingRecord = null;
                        restoreNonPendingState();
                        error = 4;
                        errorCause = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
                        break;
                    } else {
                        recordingToStart = makePendingRecordingActiveLocked(this.mState);
                        break;
                    }
                case RESETTING:
                case IDLING:
                    throw new AssertionError("Incorrectly invoke onConfigured() in state " + this.mState);
                case STOPPING:
                    if (!this.mEncoderNotUsePersistentInputSurface) {
                        throw new AssertionError("Unexpectedly invoke onConfigured() in a STOPPING state when it's not waiting for a new surface.");
                    }
                    break;
                case CONFIGURING:
                    setState(State.IDLING);
                    break;
                case ERROR:
                    Logger.e(TAG, "onConfigured() was invoked when the Recorder had encountered error");
                    break;
            }
        }
        if (continuePersistentRecording) {
            updateEncoderCallbacks(this.mInProgressRecording, true);
            this.mVideoEncoder.start();
            if (this.mShouldSendResumeEvent) {
                this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.resume(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
                this.mShouldSendResumeEvent = false;
            }
            if (recordingPaused) {
                this.mVideoEncoder.pause();
            }
        } else if (recordingToStart != null) {
            startRecording(recordingToStart, recordingPaused);
        } else if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, error, errorCause);
        }
    }

    private MediaSpec composeRecorderMediaSpec(MediaSpec mediaSpec) {
        MediaSpec.Builder mediaSpecBuilder = mediaSpec.toBuilder();
        VideoSpec videoSpec = mediaSpec.getVideoSpec();
        if (videoSpec.getAspectRatio() == -1) {
            mediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda0
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setAspectRatio(Recorder.VIDEO_SPEC_DEFAULT.getAspectRatio());
                }
            });
        }
        return mediaSpecBuilder.build();
    }

    private static boolean isSameRecording(Recording activeRecording, RecordingRecord recordingRecord) {
        return recordingRecord != null && activeRecording.getRecordingId() == recordingRecord.getRecordingId();
    }

    private void setupAudio(RecordingRecord recordingToStart) throws AudioSourceAccessException, InvalidConfigException {
        MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
        AudioMimeInfo audioMimeInfo = AudioConfigUtil.resolveAudioMimeInfo(mediaSpec, this.mResolvedEncoderProfiles);
        Timebase audioSourceTimebase = Timebase.UPTIME;
        AudioSettings audioSettings = AudioConfigUtil.resolveAudioSettings(audioMimeInfo, mediaSpec.getAudioSpec());
        if (this.mAudioSource != null) {
            releaseCurrentAudioSource();
        }
        this.mAudioSource = setupAudioSource(recordingToStart, audioSettings);
        Logger.d(TAG, String.format("Set up new audio source: 0x%x", Integer.valueOf(this.mAudioSource.hashCode())));
        AudioEncoderConfig audioEncoderConfig = AudioConfigUtil.resolveAudioEncoderConfig(audioMimeInfo, audioSourceTimebase, audioSettings, mediaSpec.getAudioSpec());
        this.mAudioEncoder = this.mAudioEncoderFactory.createEncoder(this.mExecutor, audioEncoderConfig);
        Encoder.EncoderInput bufferProvider = this.mAudioEncoder.getInput();
        if (!(bufferProvider instanceof Encoder.ByteBufferInput)) {
            throw new AssertionError("The EncoderInput of audio isn't a ByteBufferInput.");
        }
        this.mAudioSource.setBufferProvider((Encoder.ByteBufferInput) bufferProvider);
    }

    private AudioSource setupAudioSource(RecordingRecord recordingToStart, AudioSettings audioSettings) throws AudioSourceAccessException {
        return recordingToStart.performOneTimeAudioSourceCreation(audioSettings, AUDIO_EXECUTOR);
    }

    private void releaseCurrentAudioSource() {
        if (this.mAudioSource == null) {
            throw new AssertionError("Cannot release null audio source.");
        }
        final AudioSource audioSource = this.mAudioSource;
        this.mAudioSource = null;
        Logger.d(TAG, String.format("Releasing audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
        Futures.addCallback(audioSource.release(), new FutureCallback<Void>() { // from class: androidx.camera.video.Recorder.3
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                Logger.d(Recorder.TAG, String.format("Released audio source successfully: 0x%x", Integer.valueOf(audioSource.hashCode())));
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.d(Recorder.TAG, String.format("An error occurred while attempting to release audio source: 0x%x", Integer.valueOf(audioSource.hashCode())));
            }
        }, CameraXExecutors.directExecutor());
    }

    void onEncoderSetupError(Throwable cause) {
        RecordingRecord pendingRecordingToFinalize = null;
        synchronized (this.mLock) {
            switch (this.mState) {
                case PAUSED:
                case RECORDING:
                case RESETTING:
                case STOPPING:
                case IDLING:
                    throw new AssertionError("Encountered encoder setup error while in unexpected state " + this.mState + ": " + cause);
                case PENDING_PAUSED:
                case PENDING_RECORDING:
                    pendingRecordingToFinalize = this.mPendingRecordingRecord;
                    this.mPendingRecordingRecord = null;
                case CONFIGURING:
                    setStreamId(-1);
                    setState(State.ERROR);
                    break;
            }
        }
        if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, 7, cause);
        }
    }

    void setupAndStartMediaMuxer(RecordingRecord recordingToStart) {
        if (this.mMediaMuxer != null) {
            throw new AssertionError("Unable to set up media muxer when one already exists.");
        }
        if (isAudioEnabled() && this.mPendingAudioRingBuffer.isEmpty()) {
            throw new AssertionError("Audio is enabled but no audio sample is ready. Cannot start media muxer.");
        }
        if (this.mPendingFirstVideoData == null) {
            throw new AssertionError("Media muxer cannot be started without an encoded video frame.");
        }
        EncodedData videoDataToWrite = this.mPendingFirstVideoData;
        try {
            this.mPendingFirstVideoData = null;
            List<EncodedData> audioDataToWrite = getAudioDataToWriteAndClearCache(videoDataToWrite.getPresentationTimeUs());
            long firstDataSize = videoDataToWrite.size();
            for (EncodedData data : audioDataToWrite) {
                firstDataSize += data.size();
            }
            if (this.mFileSizeLimitInBytes != 0 && firstDataSize > this.mFileSizeLimitInBytes) {
                Logger.d(TAG, String.format("Initial data exceeds file size limit %d > %d", Long.valueOf(firstDataSize), Long.valueOf(this.mFileSizeLimitInBytes)));
                onInProgressRecordingInternalError(recordingToStart, 2, null);
                if (videoDataToWrite != null) {
                    videoDataToWrite.close();
                    return;
                }
                return;
            }
            try {
                MediaSpec mediaSpec = (MediaSpec) getObservableData(this.mMediaSpec);
                int muxerOutputFormat = mediaSpec.getOutputFormat() == -1 ? supportedMuxerFormatOrDefaultFrom(this.mResolvedEncoderProfiles, MediaSpec.outputFormatToMuxerFormat(MEDIA_SPEC_DEFAULT.getOutputFormat())) : MediaSpec.outputFormatToMuxerFormat(mediaSpec.getOutputFormat());
                MediaMuxer mediaMuxer = recordingToStart.performOneTimeMediaMuxerCreation(muxerOutputFormat, new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda7
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        Recorder.this.m190lambda$setupAndStartMediaMuxer$10$androidxcameravideoRecorder((Uri) obj);
                    }
                });
                SurfaceRequest.TransformationInfo transformationInfo = this.mSourceTransformationInfo;
                if (transformationInfo != null) {
                    setInProgressTransformationInfo(transformationInfo);
                    mediaMuxer.setOrientationHint(transformationInfo.getRotationDegrees());
                }
                Location location = recordingToStart.getOutputOptions().getLocation();
                if (location != null) {
                    try {
                        Pair<Double, Double> geoLocation = CorrectNegativeLatLongForMediaMuxer.adjustGeoLocation(location.getLatitude(), location.getLongitude());
                        mediaMuxer.setLocation((float) ((Double) geoLocation.first).doubleValue(), (float) ((Double) geoLocation.second).doubleValue());
                    } catch (IllegalArgumentException e) {
                        mediaMuxer.release();
                        onInProgressRecordingInternalError(recordingToStart, 5, e);
                        if (videoDataToWrite != null) {
                            videoDataToWrite.close();
                            return;
                        }
                        return;
                    }
                }
                this.mVideoTrackIndex = Integer.valueOf(mediaMuxer.addTrack(this.mVideoOutputConfig.getMediaFormat()));
                if (isAudioEnabled()) {
                    this.mAudioTrackIndex = Integer.valueOf(mediaMuxer.addTrack(this.mAudioOutputConfig.getMediaFormat()));
                }
                mediaMuxer.start();
                this.mMediaMuxer = mediaMuxer;
                writeVideoData(videoDataToWrite, recordingToStart);
                for (EncodedData data2 : audioDataToWrite) {
                    writeAudioData(data2, recordingToStart);
                }
                if (videoDataToWrite != null) {
                    videoDataToWrite.close();
                }
            } catch (IOException e2) {
                onInProgressRecordingInternalError(recordingToStart, 5, e2);
                if (videoDataToWrite != null) {
                    videoDataToWrite.close();
                }
            }
        } catch (Throwable th) {
            if (videoDataToWrite != null) {
                try {
                    videoDataToWrite.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setupAndStartMediaMuxer$10$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ void m190lambda$setupAndStartMediaMuxer$10$androidxcameravideoRecorder(Uri uri) {
        this.mOutputUri = uri;
    }

    private List<EncodedData> getAudioDataToWriteAndClearCache(long firstVideoDataTimeUs) {
        List<EncodedData> res = new ArrayList<>();
        while (!this.mPendingAudioRingBuffer.isEmpty()) {
            EncodedData data = this.mPendingAudioRingBuffer.dequeue();
            if (data.getPresentationTimeUs() >= firstVideoDataTimeUs) {
                res.add(data);
            }
        }
        return res;
    }

    private void startInternal(RecordingRecord recordingToStart) {
        AudioState audioState;
        if (this.mInProgressRecording != null) {
            throw new AssertionError("Attempted to start a new recording while another was in progress.");
        }
        if (recordingToStart.getOutputOptions().getFileSizeLimit() > 0) {
            this.mFileSizeLimitInBytes = Math.round(recordingToStart.getOutputOptions().getFileSizeLimit() * 0.95d);
            Logger.d(TAG, "File size limit in bytes: " + this.mFileSizeLimitInBytes);
        } else {
            this.mFileSizeLimitInBytes = 0L;
        }
        if (recordingToStart.getOutputOptions().getDurationLimitMillis() > 0) {
            this.mDurationLimitNs = TimeUnit.MILLISECONDS.toNanos(recordingToStart.getOutputOptions().getDurationLimitMillis());
            Logger.d(TAG, "Duration limit in nanoseconds: " + this.mDurationLimitNs);
        } else {
            this.mDurationLimitNs = 0L;
        }
        this.mInProgressRecording = recordingToStart;
        switch (this.mAudioState) {
            case ERROR_ENCODER:
            case ERROR_SOURCE:
            case ENABLED:
            case DISABLED:
                throw new AssertionError("Incorrectly invoke startInternal in audio state " + this.mAudioState);
            case IDLING:
                setAudioState(recordingToStart.hasAudioEnabled() ? AudioState.ENABLED : AudioState.DISABLED);
                break;
            case INITIALIZING:
                if (recordingToStart.hasAudioEnabled()) {
                    if (!isAudioSupported()) {
                        throw new AssertionError("The Recorder doesn't support recording with audio");
                    }
                    try {
                        if (!this.mInProgressRecording.isPersistent() || this.mAudioEncoder == null) {
                            setupAudio(recordingToStart);
                        }
                        setAudioState(AudioState.ENABLED);
                        break;
                    } catch (AudioSourceAccessException | InvalidConfigException e) {
                        Logger.e(TAG, "Unable to create audio resource with error: ", e);
                        if (e instanceof InvalidConfigException) {
                            audioState = AudioState.ERROR_ENCODER;
                        } else {
                            audioState = AudioState.ERROR_SOURCE;
                        }
                        setAudioState(audioState);
                        this.mAudioErrorCause = e;
                        break;
                    }
                }
                break;
        }
        updateEncoderCallbacks(recordingToStart, false);
        if (isAudioEnabled()) {
            this.mAudioSource.start(recordingToStart.isMuted());
            this.mAudioEncoder.start();
        }
        this.mVideoEncoder.start();
        this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.start(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
    }

    private void updateEncoderCallbacks(final RecordingRecord recordingToStart, boolean videoOnly) {
        if (!this.mEncodingFutures.isEmpty()) {
            ListenableFuture<List<Void>> listFuture = Futures.allAsList(this.mEncodingFutures);
            if (!listFuture.isDone()) {
                listFuture.cancel(true);
            }
            this.mEncodingFutures.clear();
        }
        this.mEncodingFutures.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda11
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Recorder.this.m195lambda$updateEncoderCallbacks$11$androidxcameravideoRecorder(recordingToStart, completer);
            }
        }));
        if (isAudioEnabled() && !videoOnly) {
            this.mEncodingFutures.add(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda12
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Recorder.this.m197lambda$updateEncoderCallbacks$13$androidxcameravideoRecorder(recordingToStart, completer);
                }
            }));
        }
        Futures.addCallback(Futures.allAsList(this.mEncodingFutures), new FutureCallback<List<Void>>() { // from class: androidx.camera.video.Recorder.7
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(List<Void> result) {
                Logger.d(Recorder.TAG, "Encodings end successfully.");
                Recorder.this.finalizeInProgressRecording(Recorder.this.mRecordingStopError, Recorder.this.mRecordingStopErrorCause);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Preconditions.checkState(Recorder.this.mInProgressRecording != null, "In-progress recording shouldn't be null");
                if (!Recorder.this.mInProgressRecording.isPersistent()) {
                    Logger.d(Recorder.TAG, "Encodings end with error: " + t);
                    Recorder.this.finalizeInProgressRecording(Recorder.this.mMediaMuxer == null ? 8 : 6, t);
                }
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$updateEncoderCallbacks$11$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ Object m195lambda$updateEncoderCallbacks$11$androidxcameravideoRecorder(final RecordingRecord recordingToStart, final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mVideoEncoder.setEncoderCallback(new EncoderCallback() { // from class: androidx.camera.video.Recorder.4
            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStart() {
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStop() {
                completer.set(null);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeError(EncodeException e) {
                completer.setException(e);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodedData(EncodedData encodedData) {
                if (Recorder.this.mMediaMuxer == null) {
                    if (!Recorder.this.mInProgressRecordingStopping) {
                        boolean cachedDataDropped = false;
                        if (Recorder.this.mPendingFirstVideoData != null) {
                            cachedDataDropped = true;
                            Recorder.this.mPendingFirstVideoData.close();
                            Recorder.this.mPendingFirstVideoData = null;
                        }
                        if (encodedData.isKeyFrame()) {
                            Recorder.this.mPendingFirstVideoData = encodedData;
                            if (!Recorder.this.isAudioEnabled() || !Recorder.this.mPendingAudioRingBuffer.isEmpty()) {
                                Logger.d(Recorder.TAG, "Received video keyframe. Starting muxer...");
                                Recorder.this.setupAndStartMediaMuxer(recordingToStart);
                                return;
                            } else if (cachedDataDropped) {
                                Logger.d(Recorder.TAG, "Replaced cached video keyframe with newer keyframe.");
                                return;
                            } else {
                                Logger.d(Recorder.TAG, "Cached video keyframe while we wait for first audio sample before starting muxer.");
                                return;
                            }
                        }
                        if (cachedDataDropped) {
                            Logger.d(Recorder.TAG, "Dropped cached keyframe since we have new video data and have not yet received audio data.");
                        }
                        Logger.d(Recorder.TAG, "Dropped video data since muxer has not yet started and data is not a keyframe.");
                        Recorder.this.mVideoEncoder.requestKeyFrame();
                        encodedData.close();
                        return;
                    }
                    Logger.d(Recorder.TAG, "Drop video data since recording is stopping.");
                    encodedData.close();
                    return;
                }
                try {
                    Recorder.this.writeVideoData(encodedData, recordingToStart);
                    if (encodedData != null) {
                        encodedData.close();
                    }
                } catch (Throwable th) {
                    if (encodedData != null) {
                        try {
                            encodedData.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onOutputConfigUpdate(OutputConfig outputConfig) {
                Recorder.this.mVideoOutputConfig = outputConfig;
            }
        }, this.mSequentialExecutor);
        return "videoEncodingFuture";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$updateEncoderCallbacks$13$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ Object m197lambda$updateEncoderCallbacks$13$androidxcameravideoRecorder(final RecordingRecord recordingToStart, final CallbackToFutureAdapter.Completer completer) throws Exception {
        final Consumer<Throwable> audioErrorConsumer = new Consumer() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda10
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                Recorder.this.m196lambda$updateEncoderCallbacks$12$androidxcameravideoRecorder(completer, (Throwable) obj);
            }
        };
        this.mAudioSource.setAudioSourceCallback(this.mSequentialExecutor, new AudioSource.AudioSourceCallback() { // from class: androidx.camera.video.Recorder.5
            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public void onSilenceStateChanged(boolean silenced) {
                if (Recorder.this.mIsAudioSourceSilenced != silenced) {
                    Recorder.this.mIsAudioSourceSilenced = silenced;
                    Recorder.this.updateInProgressStatusEvent();
                    return;
                }
                Logger.w(Recorder.TAG, "Audio source silenced transitions to the same state " + silenced);
            }

            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public void onError(Throwable throwable) {
                Logger.e(Recorder.TAG, "Error occurred after audio source started.", throwable);
                if (throwable instanceof AudioSourceAccessException) {
                    audioErrorConsumer.accept(throwable);
                }
            }

            @Override // androidx.camera.video.internal.audio.AudioSource.AudioSourceCallback
            public void onAmplitudeValue(double maxAmplitude) {
                Recorder.this.mAudioAmplitude = maxAmplitude;
            }
        });
        this.mAudioEncoder.setEncoderCallback(new EncoderCallback() { // from class: androidx.camera.video.Recorder.6
            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStart() {
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeStop() {
                completer.set(null);
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodeError(EncodeException e) {
                if (Recorder.this.mAudioErrorCause == null) {
                    audioErrorConsumer.accept(e);
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onEncodedData(EncodedData encodedData) {
                if (Recorder.this.mAudioState == AudioState.DISABLED) {
                    encodedData.close();
                    throw new AssertionError("Audio is not enabled but audio encoded data is being produced.");
                } else if (Recorder.this.mMediaMuxer == null) {
                    if (!Recorder.this.mInProgressRecordingStopping) {
                        Recorder.this.mPendingAudioRingBuffer.enqueue(new BufferCopiedEncodedData(encodedData));
                        if (Recorder.this.mPendingFirstVideoData != null) {
                            Logger.d(Recorder.TAG, "Received audio data. Starting muxer...");
                            Recorder.this.setupAndStartMediaMuxer(recordingToStart);
                        } else {
                            Logger.d(Recorder.TAG, "Cached audio data while we wait for video keyframe before starting muxer.");
                        }
                    } else {
                        Logger.d(Recorder.TAG, "Drop audio data since recording is stopping.");
                    }
                    encodedData.close();
                } else {
                    try {
                        Recorder.this.writeAudioData(encodedData, recordingToStart);
                        if (encodedData != null) {
                            encodedData.close();
                        }
                    } catch (Throwable th) {
                        if (encodedData != null) {
                            try {
                                encodedData.close();
                            } catch (Throwable th2) {
                                th.addSuppressed(th2);
                            }
                        }
                        throw th;
                    }
                }
            }

            @Override // androidx.camera.video.internal.encoder.EncoderCallback
            public void onOutputConfigUpdate(OutputConfig outputConfig) {
                Recorder.this.mAudioOutputConfig = outputConfig;
            }
        }, this.mSequentialExecutor);
        return "audioEncodingFuture";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$updateEncoderCallbacks$12$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ void m196lambda$updateEncoderCallbacks$12$androidxcameravideoRecorder(CallbackToFutureAdapter.Completer completer, Throwable throwable) {
        if (this.mAudioErrorCause == null) {
            if (throwable instanceof EncodeException) {
                setAudioState(AudioState.ERROR_ENCODER);
            } else {
                setAudioState(AudioState.ERROR_SOURCE);
            }
            this.mAudioErrorCause = throwable;
            updateInProgressStatusEvent();
            completer.set(null);
        }
    }

    void writeVideoData(EncodedData encodedData, RecordingRecord recording) {
        if (this.mVideoTrackIndex == null) {
            throw new AssertionError("Video data comes before the track is added to MediaMuxer.");
        }
        long newRecordingBytes = this.mRecordingBytes + encodedData.size();
        if (this.mFileSizeLimitInBytes != 0 && newRecordingBytes > this.mFileSizeLimitInBytes) {
            Logger.d(TAG, String.format("Reach file size limit %d > %d", Long.valueOf(newRecordingBytes), Long.valueOf(this.mFileSizeLimitInBytes)));
            onInProgressRecordingInternalError(recording, 2, null);
            return;
        }
        long newRecordingDurationNs = 0;
        long currentPresentationTimeUs = encodedData.getPresentationTimeUs();
        if (this.mFirstRecordingVideoDataTimeUs == Long.MAX_VALUE) {
            this.mFirstRecordingVideoDataTimeUs = currentPresentationTimeUs;
            Logger.d(TAG, String.format("First video time: %d (%s)", Long.valueOf(this.mFirstRecordingVideoDataTimeUs), DebugUtils.readableUs(this.mFirstRecordingVideoDataTimeUs)));
        } else {
            newRecordingDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - Math.min(this.mFirstRecordingVideoDataTimeUs, this.mFirstRecordingAudioDataTimeUs));
            Preconditions.checkState(this.mPreviousRecordingVideoDataTimeUs != Long.MAX_VALUE, "There should be a previous data for adjusting the duration.");
            long adjustedDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - this.mPreviousRecordingVideoDataTimeUs) + newRecordingDurationNs;
            if (this.mDurationLimitNs != 0 && adjustedDurationNs > this.mDurationLimitNs) {
                Logger.d(TAG, String.format("Video data reaches duration limit %d > %d", Long.valueOf(adjustedDurationNs), Long.valueOf(this.mDurationLimitNs)));
                onInProgressRecordingInternalError(recording, 9, null);
                return;
            }
        }
        this.mMediaMuxer.writeSampleData(this.mVideoTrackIndex.intValue(), encodedData.getByteBuffer(), encodedData.getBufferInfo());
        this.mRecordingBytes = newRecordingBytes;
        this.mRecordingDurationNs = newRecordingDurationNs;
        this.mPreviousRecordingVideoDataTimeUs = currentPresentationTimeUs;
        updateInProgressStatusEvent();
    }

    void writeAudioData(EncodedData encodedData, RecordingRecord recording) {
        long newRecordingBytes = this.mRecordingBytes + encodedData.size();
        if (this.mFileSizeLimitInBytes != 0 && newRecordingBytes > this.mFileSizeLimitInBytes) {
            Logger.d(TAG, String.format("Reach file size limit %d > %d", Long.valueOf(newRecordingBytes), Long.valueOf(this.mFileSizeLimitInBytes)));
            onInProgressRecordingInternalError(recording, 2, null);
            return;
        }
        long currentPresentationTimeUs = encodedData.getPresentationTimeUs();
        if (this.mFirstRecordingAudioDataTimeUs == Long.MAX_VALUE) {
            this.mFirstRecordingAudioDataTimeUs = currentPresentationTimeUs;
            Logger.d(TAG, String.format("First audio time: %d (%s)", Long.valueOf(this.mFirstRecordingAudioDataTimeUs), DebugUtils.readableUs(this.mFirstRecordingAudioDataTimeUs)));
        } else {
            long newRecordingDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - Math.min(this.mFirstRecordingVideoDataTimeUs, this.mFirstRecordingAudioDataTimeUs));
            Preconditions.checkState(this.mPreviousRecordingAudioDataTimeUs != Long.MAX_VALUE, "There should be a previous data for adjusting the duration.");
            long adjustedDurationNs = TimeUnit.MICROSECONDS.toNanos(currentPresentationTimeUs - this.mPreviousRecordingAudioDataTimeUs) + newRecordingDurationNs;
            if (this.mDurationLimitNs != 0 && adjustedDurationNs > this.mDurationLimitNs) {
                Logger.d(TAG, String.format("Audio data reaches duration limit %d > %d", Long.valueOf(adjustedDurationNs), Long.valueOf(this.mDurationLimitNs)));
                onInProgressRecordingInternalError(recording, 9, null);
                return;
            }
        }
        this.mMediaMuxer.writeSampleData(this.mAudioTrackIndex.intValue(), encodedData.getByteBuffer(), encodedData.getBufferInfo());
        this.mRecordingBytes = newRecordingBytes;
        this.mPreviousRecordingAudioDataTimeUs = currentPresentationTimeUs;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: pauseInternal */
    public void m188lambda$pause$3$androidxcameravideoRecorder(RecordingRecord recordingToPause) {
        if (this.mInProgressRecording == recordingToPause && !this.mInProgressRecordingStopping) {
            if (isAudioEnabled()) {
                this.mAudioEncoder.pause();
            }
            this.mVideoEncoder.pause();
            this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.pause(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: resumeInternal */
    public void m189lambda$resume$4$androidxcameravideoRecorder(RecordingRecord recordingToResume) {
        if (this.mInProgressRecording == recordingToResume && !this.mInProgressRecordingStopping) {
            if (isAudioEnabled()) {
                this.mAudioEncoder.start();
            }
            if (this.mVideoEncoder != null) {
                this.mVideoEncoder.start();
                this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.resume(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
                return;
            }
            this.mShouldSendResumeEvent = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: stopInternal */
    public void m193lambda$stop$5$androidxcameravideoRecorder(RecordingRecord recordingToStop, long explicitlyStopTime, int stopError, Throwable errorCause) {
        if (this.mInProgressRecording == recordingToStop && !this.mInProgressRecordingStopping) {
            this.mInProgressRecordingStopping = true;
            this.mRecordingStopError = stopError;
            this.mRecordingStopErrorCause = errorCause;
            if (isAudioEnabled()) {
                clearPendingAudioRingBuffer();
                this.mAudioEncoder.stop(explicitlyStopTime);
            }
            if (this.mPendingFirstVideoData != null) {
                this.mPendingFirstVideoData.close();
                this.mPendingFirstVideoData = null;
            }
            if (this.mSourceState != VideoOutput.SourceState.ACTIVE_NON_STREAMING) {
                final Encoder finalVideoEncoder = this.mVideoEncoder;
                this.mSourceNonStreamingTimeout = CameraXExecutors.mainThreadExecutor().schedule(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        Recorder.this.m194lambda$stopInternal$15$androidxcameravideoRecorder(finalVideoEncoder);
                    }
                }, 1000L, TimeUnit.MILLISECONDS);
            } else {
                notifyEncoderSourceStopped(this.mVideoEncoder);
            }
            this.mVideoEncoder.stop(explicitlyStopTime);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stopInternal$15$androidx-camera-video-Recorder  reason: not valid java name */
    public /* synthetic */ void m194lambda$stopInternal$15$androidxcameravideoRecorder(final Encoder finalVideoEncoder) {
        this.mSequentialExecutor.execute(new Runnable() { // from class: androidx.camera.video.Recorder$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                Recorder.lambda$stopInternal$14(Encoder.this);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$stopInternal$14(Encoder finalVideoEncoder) {
        Logger.d(TAG, "The source didn't become non-streaming before timeout. Waited 1000ms");
        if (DeviceQuirks.get(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class) != null) {
            notifyEncoderSourceStopped(finalVideoEncoder);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: muteInternal */
    public void m185lambda$mute$6$androidxcameravideoRecorder(RecordingRecord recordingToMute, boolean muted) {
        if (recordingToMute.isMuted() == muted) {
            return;
        }
        recordingToMute.mute(muted);
        if (this.mInProgressRecording == recordingToMute && !this.mInProgressRecordingStopping && this.mAudioSource != null) {
            this.mAudioSource.mute(muted);
        }
    }

    static void notifyEncoderSourceStopped(Encoder encoder) {
        if (encoder instanceof EncoderImpl) {
            ((EncoderImpl) encoder).signalSourceStopped();
        }
    }

    private void clearPendingAudioRingBuffer() {
        while (!this.mPendingAudioRingBuffer.isEmpty()) {
            this.mPendingAudioRingBuffer.dequeue();
        }
    }

    private void reset() {
        if (this.mAudioEncoder != null) {
            Logger.d(TAG, "Releasing audio encoder.");
            this.mAudioEncoder.release();
            this.mAudioEncoder = null;
            this.mAudioOutputConfig = null;
        }
        if (this.mAudioSource != null) {
            releaseCurrentAudioSource();
        }
        setAudioState(AudioState.INITIALIZING);
        resetVideo();
    }

    private void tryReleaseVideoEncoder() {
        if (this.mVideoEncoderSessionToRelease != null) {
            Preconditions.checkState(this.mVideoEncoderSessionToRelease.getVideoEncoder() == this.mVideoEncoder);
            Logger.d(TAG, "Releasing video encoder: " + this.mVideoEncoder);
            this.mVideoEncoderSessionToRelease.terminateNow();
            this.mVideoEncoderSessionToRelease = null;
            this.mVideoEncoder = null;
            this.mVideoOutputConfig = null;
            setLatestSurface(null);
            return;
        }
        safeToCloseVideoEncoder();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private void onResetVideo() {
        boolean shouldConfigure = true;
        synchronized (this.mLock) {
            switch (this.mState) {
                case PAUSED:
                case RECORDING:
                case ERROR:
                    if (isPersistentRecordingInProgress()) {
                        shouldConfigure = false;
                        break;
                    }
                    setState(State.CONFIGURING);
                    break;
                case PENDING_PAUSED:
                case PENDING_RECORDING:
                    updateNonPendingState(State.CONFIGURING);
                    break;
                case RESETTING:
                case STOPPING:
                case IDLING:
                    setState(State.CONFIGURING);
                    break;
            }
        }
        this.mNeedsResetBeforeNextStart = false;
        if (shouldConfigure && this.mLatestSurfaceRequest != null && !this.mLatestSurfaceRequest.isServiced()) {
            configureInternal(this.mLatestSurfaceRequest, this.mVideoSourceTimebase);
        }
    }

    private void resetVideo() {
        if (this.mVideoEncoder != null) {
            Logger.d(TAG, "Releasing video encoder.");
            tryReleaseVideoEncoder();
        }
        onResetVideo();
    }

    private int internalAudioStateToAudioStatsState(AudioState audioState) {
        switch (audioState) {
            case ERROR_ENCODER:
                return 3;
            case ERROR_SOURCE:
                return 4;
            case ENABLED:
                if (this.mInProgressRecording != null && this.mInProgressRecording.isMuted()) {
                    return 5;
                }
                if (this.mIsAudioSourceSilenced) {
                    return 2;
                }
                return 0;
            case DISABLED:
            case INITIALIZING:
                return 1;
            case IDLING:
            default:
                throw new AssertionError("Invalid internal audio state: " + audioState);
        }
    }

    private StreamInfo.StreamState internalStateToStreamState(State state) {
        DeactivateEncoderSurfaceBeforeStopEncoderQuirk quirk = (DeactivateEncoderSurfaceBeforeStopEncoderQuirk) DeviceQuirks.get(DeactivateEncoderSurfaceBeforeStopEncoderQuirk.class);
        return (state == State.RECORDING || (state == State.STOPPING && quirk == null)) ? StreamInfo.StreamState.ACTIVE : StreamInfo.StreamState.INACTIVE;
    }

    boolean isAudioEnabled() {
        return this.mAudioState == AudioState.ENABLED;
    }

    void finalizeInProgressRecording(int error, Throwable throwable) {
        VideoRecordEvent.Finalize finalizeWithError;
        if (this.mInProgressRecording == null) {
            throw new AssertionError("Attempted to finalize in-progress recording, but no recording is in progress.");
        }
        int errorToSend = error;
        if (this.mMediaMuxer != null) {
            try {
                this.mMediaMuxer.stop();
                this.mMediaMuxer.release();
            } catch (IllegalStateException e) {
                Logger.e(TAG, "MediaMuxer failed to stop or release with error: " + e.getMessage());
                if (errorToSend == 0) {
                    errorToSend = 1;
                }
            }
            this.mMediaMuxer = null;
        } else if (errorToSend == 0) {
            errorToSend = 8;
        }
        this.mInProgressRecording.finalizeRecording(this.mOutputUri);
        OutputOptions outputOptions = this.mInProgressRecording.getOutputOptions();
        RecordingStats stats = getInProgressRecordingStats();
        OutputResults outputResults = OutputResults.of(this.mOutputUri);
        RecordingRecord recordingRecord = this.mInProgressRecording;
        if (errorToSend == 0) {
            finalizeWithError = VideoRecordEvent.finalize(outputOptions, stats, outputResults);
        } else {
            finalizeWithError = VideoRecordEvent.finalizeWithError(outputOptions, stats, outputResults, errorToSend, throwable);
        }
        recordingRecord.updateVideoRecordEvent(finalizeWithError);
        RecordingRecord finalizedRecording = this.mInProgressRecording;
        this.mInProgressRecording = null;
        this.mInProgressRecordingStopping = false;
        this.mAudioTrackIndex = null;
        this.mVideoTrackIndex = null;
        this.mEncodingFutures.clear();
        this.mOutputUri = Uri.EMPTY;
        this.mRecordingBytes = 0L;
        this.mRecordingDurationNs = 0L;
        this.mFirstRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mFirstRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingVideoDataTimeUs = Long.MAX_VALUE;
        this.mPreviousRecordingAudioDataTimeUs = Long.MAX_VALUE;
        this.mRecordingStopError = 1;
        this.mRecordingStopErrorCause = null;
        this.mAudioErrorCause = null;
        this.mAudioAmplitude = AudioStats.AUDIO_AMPLITUDE_NONE;
        clearPendingAudioRingBuffer();
        setInProgressTransformationInfo(null);
        switch (this.mAudioState) {
            case ERROR_ENCODER:
            case ERROR_SOURCE:
                setAudioState(AudioState.INITIALIZING);
                break;
            case ENABLED:
            case DISABLED:
                setAudioState(AudioState.IDLING);
                this.mAudioSource.stop();
                break;
            case IDLING:
                throw new AssertionError("Incorrectly finalize recording when audio state is IDLING");
        }
        onRecordingFinalized(finalizedRecording);
    }

    private void onRecordingFinalized(RecordingRecord finalizedRecording) {
        boolean needsReset = false;
        boolean startRecordingPaused = false;
        boolean needsConfigure = false;
        RecordingRecord recordingToStart = null;
        RecordingRecord pendingRecordingToFinalize = null;
        int error = 0;
        Throwable errorCause = null;
        synchronized (this.mLock) {
            if (this.mActiveRecordingRecord != finalizedRecording) {
                throw new AssertionError("Active recording did not match finalized recording on finalize.");
            }
            this.mActiveRecordingRecord = null;
            switch (this.mState) {
                case PAUSED:
                case RECORDING:
                case STOPPING:
                    if (this.mEncoderNotUsePersistentInputSurface) {
                        this.mActiveSurface = null;
                        if (this.mLatestSurfaceRequest != null && !this.mLatestSurfaceRequest.isServiced()) {
                            needsConfigure = true;
                        }
                        setState(State.CONFIGURING);
                        break;
                    } else {
                        setState(State.IDLING);
                        break;
                    }
                    break;
                case PENDING_PAUSED:
                    startRecordingPaused = true;
                case PENDING_RECORDING:
                    if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                        pendingRecordingToFinalize = this.mPendingRecordingRecord;
                        this.mPendingRecordingRecord = null;
                        setState(State.CONFIGURING);
                        error = 4;
                        errorCause = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
                        break;
                    } else if (this.mEncoderNotUsePersistentInputSurface) {
                        this.mActiveSurface = null;
                        if (this.mLatestSurfaceRequest != null && !this.mLatestSurfaceRequest.isServiced()) {
                            needsConfigure = true;
                        }
                        updateNonPendingState(State.CONFIGURING);
                        break;
                    } else if (this.mVideoEncoder != null) {
                        recordingToStart = makePendingRecordingActiveLocked(this.mState);
                        break;
                    }
                    break;
                case RESETTING:
                    needsReset = true;
                    break;
                case IDLING:
                    throw new AssertionError("Unexpected state on finalize of recording: " + this.mState);
            }
        }
        if (needsConfigure) {
            configureInternal(this.mLatestSurfaceRequest, this.mVideoSourceTimebase);
        } else if (needsReset) {
            reset();
        } else if (recordingToStart != null) {
            if (this.mEncoderNotUsePersistentInputSurface) {
                throw new AssertionError("Attempt to start a pending recording while the Recorder is waiting for a new surface request.");
            }
            startRecording(recordingToStart, startRecordingPaused);
        } else if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, error, errorCause);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003c  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x003d A[Catch: all -> 0x0045, TryCatch #1 {all -> 0x0045, blocks: (B:9:0x0016, B:10:0x0030, B:11:0x0031, B:12:0x0038, B:15:0x003d, B:16:0x0044), top: B:34:0x0012 }] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0057  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void onInProgressRecordingInternalError(androidx.camera.video.Recorder.RecordingRecord r10, int r11, java.lang.Throwable r12) {
        /*
            r9 = this;
            androidx.camera.video.Recorder$RecordingRecord r0 = r9.mInProgressRecording
            if (r10 != r0) goto L63
            r1 = 0
            java.lang.Object r2 = r9.mLock
            monitor-enter(r2)
            int[] r0 = androidx.camera.video.Recorder.AnonymousClass8.$SwitchMap$androidx$camera$video$Recorder$State     // Catch: java.lang.Throwable -> L5b
            androidx.camera.video.Recorder$State r3 = r9.mState     // Catch: java.lang.Throwable -> L5b
            int r3 = r3.ordinal()     // Catch: java.lang.Throwable -> L5b
            r0 = r0[r3]     // Catch: java.lang.Throwable -> L5b
            switch(r0) {
                case 1: goto L31;
                case 2: goto L31;
                case 3: goto L38;
                case 4: goto L38;
                case 5: goto L38;
                case 6: goto L38;
                case 7: goto L16;
                case 8: goto L16;
                case 9: goto L16;
                default: goto L15;
            }
        L15:
            goto L4a
        L16:
            java.lang.AssertionError r0 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L45
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L45
            r3.<init>()     // Catch: java.lang.Throwable -> L45
            java.lang.String r4 = "In-progress recording error occurred while in unexpected state: "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Throwable -> L45
            androidx.camera.video.Recorder$State r4 = r9.mState     // Catch: java.lang.Throwable -> L45
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch: java.lang.Throwable -> L45
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L45
            r0.<init>(r3)     // Catch: java.lang.Throwable -> L45
            throw r0     // Catch: java.lang.Throwable -> L45
        L31:
            androidx.camera.video.Recorder$State r0 = androidx.camera.video.Recorder.State.STOPPING     // Catch: java.lang.Throwable -> L45
            r9.setState(r0)     // Catch: java.lang.Throwable -> L45
            r0 = 1
            r1 = r0
        L38:
            androidx.camera.video.Recorder$RecordingRecord r0 = r9.mActiveRecordingRecord     // Catch: java.lang.Throwable -> L45
            if (r10 != r0) goto L3d
            goto L4a
        L3d:
            java.lang.AssertionError r0 = new java.lang.AssertionError     // Catch: java.lang.Throwable -> L45
            java.lang.String r3 = "Internal error occurred for recording but it is not the active recording."
            r0.<init>(r3)     // Catch: java.lang.Throwable -> L45
            throw r0     // Catch: java.lang.Throwable -> L45
        L45:
            r0 = move-exception
            r4 = r10
            r7 = r11
            r8 = r12
            goto L5f
        L4a:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L5b
            if (r1 == 0) goto L57
            r5 = -1
            r3 = r9
            r4 = r10
            r7 = r11
            r8 = r12
            r3.m193lambda$stop$5$androidxcameravideoRecorder(r4, r5, r7, r8)
            goto L5a
        L57:
            r4 = r10
            r7 = r11
            r8 = r12
        L5a:
            return
        L5b:
            r0 = move-exception
            r4 = r10
            r7 = r11
            r8 = r12
        L5f:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L61
            throw r0
        L61:
            r0 = move-exception
            goto L5f
        L63:
            r4 = r10
            r7 = r11
            java.lang.AssertionError r10 = new java.lang.AssertionError
            java.lang.String r11 = "Internal error occurred on recording that is not the current in-progress recording."
            r10.<init>(r11)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.Recorder.onInProgressRecordingInternalError(androidx.camera.video.Recorder$RecordingRecord, int, java.lang.Throwable):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void tryServicePendingRecording() {
        boolean startRecordingPaused = false;
        RecordingRecord recordingToStart = null;
        RecordingRecord pendingRecordingToFinalize = null;
        int error = 0;
        Throwable errorCause = null;
        synchronized (this.mLock) {
            switch (this.mState) {
                case PENDING_PAUSED:
                    startRecordingPaused = true;
                case PENDING_RECORDING:
                    if (this.mActiveRecordingRecord == null && !this.mNeedsResetBeforeNextStart) {
                        if (this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                            pendingRecordingToFinalize = this.mPendingRecordingRecord;
                            this.mPendingRecordingRecord = null;
                            restoreNonPendingState();
                            error = 4;
                            errorCause = PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE;
                            break;
                        } else if (this.mVideoEncoder != null) {
                            recordingToStart = makePendingRecordingActiveLocked(this.mState);
                            break;
                        }
                    }
                    break;
            }
        }
        if (recordingToStart != null) {
            startRecording(recordingToStart, startRecordingPaused);
        } else if (pendingRecordingToFinalize != null) {
            finalizePendingRecording(pendingRecordingToFinalize, error, errorCause);
        }
    }

    private RecordingRecord makePendingRecordingActiveLocked(State state) {
        boolean startRecordingPaused = false;
        if (state == State.PENDING_PAUSED) {
            startRecordingPaused = true;
        } else if (state != State.PENDING_RECORDING) {
            throw new AssertionError("makePendingRecordingActiveLocked() can only be called from a pending state.");
        }
        if (this.mActiveRecordingRecord != null) {
            throw new AssertionError("Cannot make pending recording active because another recording is already active.");
        }
        if (this.mPendingRecordingRecord == null) {
            throw new AssertionError("Pending recording should exist when in a PENDING state.");
        }
        RecordingRecord recordingToStart = this.mPendingRecordingRecord;
        this.mActiveRecordingRecord = recordingToStart;
        this.mPendingRecordingRecord = null;
        if (startRecordingPaused) {
            setState(State.PAUSED);
        } else {
            setState(State.RECORDING);
        }
        return recordingToStart;
    }

    private void startRecording(RecordingRecord recordingToStart, boolean startRecordingPaused) {
        startInternal(recordingToStart);
        if (startRecordingPaused) {
            m188lambda$pause$3$androidxcameravideoRecorder(recordingToStart);
        }
    }

    void updateInProgressStatusEvent() {
        if (this.mInProgressRecording != null) {
            this.mInProgressRecording.updateVideoRecordEvent(VideoRecordEvent.status(this.mInProgressRecording.getOutputOptions(), getInProgressRecordingStats()));
        }
    }

    RecordingStats getInProgressRecordingStats() {
        return RecordingStats.of(this.mRecordingDurationNs, this.mRecordingBytes, AudioStats.of(internalAudioStateToAudioStatsState(this.mAudioState), this.mAudioErrorCause, this.mAudioAmplitude));
    }

    <T> T getObservableData(StateObservable<T> observable) {
        ListenableFuture<T> future = observable.fetchData();
        try {
            return future.get();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isAudioSupported() {
        return ((MediaSpec) getObservableData(this.mMediaSpec)).getAudioSpec().getChannelCount() != 0;
    }

    void setState(State state) {
        if (this.mState == state) {
            throw new AssertionError("Attempted to transition to state " + state + ", but Recorder is already in state " + state);
        }
        Logger.d(TAG, "Transitioning Recorder internal state: " + this.mState + " --> " + state);
        StreamInfo.StreamState streamState = null;
        if (PENDING_STATES.contains(state)) {
            if (!PENDING_STATES.contains(this.mState)) {
                if (!VALID_NON_PENDING_STATES_WHILE_PENDING.contains(this.mState)) {
                    throw new AssertionError("Invalid state transition. Should not be transitioning to a PENDING state from state " + this.mState);
                }
                this.mNonPendingState = this.mState;
                streamState = internalStateToStreamState(this.mNonPendingState);
            }
        } else if (this.mNonPendingState != null) {
            this.mNonPendingState = null;
        }
        this.mState = state;
        if (streamState == null) {
            streamState = internalStateToStreamState(this.mState);
        }
        this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, streamState, this.mInProgressTransformationInfo));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setLatestSurface(Surface surface) {
        int hashCode;
        if (this.mLatestSurface == surface) {
            return;
        }
        this.mLatestSurface = surface;
        synchronized (this.mLock) {
            if (surface == null) {
                hashCode = 0;
            } else {
                try {
                    hashCode = surface.hashCode();
                } catch (Throwable th) {
                    throw th;
                }
            }
            setStreamId(hashCode);
        }
    }

    private void setStreamId(int streamId) {
        if (this.mStreamId == streamId) {
            return;
        }
        Logger.d(TAG, "Transitioning streamId: " + this.mStreamId + " --> " + streamId);
        this.mStreamId = streamId;
        this.mStreamInfo.setState(StreamInfo.of(streamId, internalStateToStreamState(this.mState), this.mInProgressTransformationInfo));
    }

    void setInProgressTransformationInfo(SurfaceRequest.TransformationInfo transformationInfo) {
        Logger.d(TAG, "Update stream transformation info: " + transformationInfo);
        this.mInProgressTransformationInfo = transformationInfo;
        synchronized (this.mLock) {
            this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, internalStateToStreamState(this.mState), transformationInfo));
        }
    }

    private void updateNonPendingState(State state) {
        if (!PENDING_STATES.contains(this.mState)) {
            throw new AssertionError("Can only updated non-pending state from a pending state, but state is " + this.mState);
        }
        if (!VALID_NON_PENDING_STATES_WHILE_PENDING.contains(state)) {
            throw new AssertionError("Invalid state transition. State is not a valid non-pending state while in a pending state: " + state);
        }
        if (this.mNonPendingState != state) {
            this.mNonPendingState = state;
            this.mStreamInfo.setState(StreamInfo.of(this.mStreamId, internalStateToStreamState(state), this.mInProgressTransformationInfo));
        }
    }

    private void restoreNonPendingState() {
        if (!PENDING_STATES.contains(this.mState)) {
            throw new AssertionError("Cannot restore non-pending state when in state " + this.mState);
        }
        setState(this.mNonPendingState);
    }

    void setAudioState(AudioState audioState) {
        Logger.d(TAG, "Transitioning audio state: " + this.mAudioState + " --> " + audioState);
        this.mAudioState = audioState;
    }

    private static int supportedMuxerFormatOrDefaultFrom(VideoValidatedEncoderProfilesProxy profilesProxy, int defaultMuxerFormat) {
        if (profilesProxy != null) {
            switch (profilesProxy.getRecommendedFileFormat()) {
                case 1:
                    return 2;
                case 2:
                    return 0;
                case 9:
                    return 1;
            }
        }
        return defaultMuxerFormat;
    }

    public static VideoCapabilities getVideoCapabilities(CameraInfo cameraInfo) {
        return RecorderVideoCapabilities.from(cameraInfo);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class RecordingRecord implements AutoCloseable {
        private final CloseGuardHelper mCloseGuard = CloseGuardHelper.create();
        private final AtomicBoolean mInitialized = new AtomicBoolean(false);
        private final AtomicReference<MediaMuxerSupplier> mMediaMuxerSupplier = new AtomicReference<>(null);
        private final AtomicReference<AudioSourceSupplier> mAudioSourceSupplier = new AtomicReference<>(null);
        private final AtomicReference<Consumer<Uri>> mRecordingFinalizer = new AtomicReference<>(new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda5
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                Recorder.RecordingRecord.lambda$new$0((Uri) obj);
            }
        });
        private final AtomicBoolean mMuted = new AtomicBoolean(false);

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes.dex */
        public interface AudioSourceSupplier {
            AudioSource get(AudioSettings audioSettings, Executor executor) throws AudioSourceAccessException;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes.dex */
        public interface MediaMuxerSupplier {
            MediaMuxer get(int i, Consumer<Uri> consumer) throws IOException;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Executor getCallbackExecutor();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Consumer<VideoRecordEvent> getEventListener();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract OutputOptions getOutputOptions();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract long getRecordingId();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract boolean hasAudioEnabled();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract boolean isPersistent();

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$new$0(Uri ignored) {
        }

        static RecordingRecord from(PendingRecording pendingRecording, long recordingId) {
            return new AutoValue_Recorder_RecordingRecord(pendingRecording.getOutputOptions(), pendingRecording.getListenerExecutor(), pendingRecording.getEventListener(), pendingRecording.isAudioEnabled(), pendingRecording.isPersistent(), recordingId);
        }

        void initializeRecording(final Context context) throws IOException {
            final ParcelFileDescriptor dupedParcelFileDescriptor;
            if (this.mInitialized.getAndSet(true)) {
                throw new AssertionError("Recording " + this + " has already been initialized");
            }
            final OutputOptions outputOptions = getOutputOptions();
            if (outputOptions instanceof FileDescriptorOutputOptions) {
                dupedParcelFileDescriptor = ((FileDescriptorOutputOptions) outputOptions).getParcelFileDescriptor().dup();
            } else {
                dupedParcelFileDescriptor = null;
            }
            this.mCloseGuard.open("finalizeRecording");
            MediaMuxerSupplier mediaMuxerSupplier = new MediaMuxerSupplier() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda0
                @Override // androidx.camera.video.Recorder.RecordingRecord.MediaMuxerSupplier
                public final MediaMuxer get(int i, Consumer consumer) {
                    return Recorder.RecordingRecord.lambda$initializeRecording$1(OutputOptions.this, dupedParcelFileDescriptor, i, consumer);
                }
            };
            this.mMediaMuxerSupplier.set(mediaMuxerSupplier);
            Consumer<Uri> recordingFinalizer = null;
            if (hasAudioEnabled()) {
                if (Build.VERSION.SDK_INT >= 31) {
                    AudioSourceSupplier audioSourceSupplier = new AudioSourceSupplier() { // from class: androidx.camera.video.Recorder.RecordingRecord.1
                        @Override // androidx.camera.video.Recorder.RecordingRecord.AudioSourceSupplier
                        public AudioSource get(AudioSettings settings, Executor executor) throws AudioSourceAccessException {
                            return new AudioSource(settings, executor, context);
                        }
                    };
                    this.mAudioSourceSupplier.set(audioSourceSupplier);
                } else {
                    AudioSourceSupplier audioSourceSupplier2 = new AudioSourceSupplier() { // from class: androidx.camera.video.Recorder.RecordingRecord.2
                        @Override // androidx.camera.video.Recorder.RecordingRecord.AudioSourceSupplier
                        public AudioSource get(AudioSettings settings, Executor executor) throws AudioSourceAccessException {
                            return new AudioSource(settings, executor, null);
                        }
                    };
                    this.mAudioSourceSupplier.set(audioSourceSupplier2);
                }
            }
            if (outputOptions instanceof MediaStoreOutputOptions) {
                final MediaStoreOutputOptions mediaStoreOutputOptions = (MediaStoreOutputOptions) outputOptions;
                if (Build.VERSION.SDK_INT >= 29) {
                    recordingFinalizer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda1
                        @Override // androidx.core.util.Consumer
                        public final void accept(Object obj) {
                            Recorder.RecordingRecord.lambda$initializeRecording$2(MediaStoreOutputOptions.this, (Uri) obj);
                        }
                    };
                } else {
                    recordingFinalizer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda2
                        @Override // androidx.core.util.Consumer
                        public final void accept(Object obj) {
                            Recorder.RecordingRecord.lambda$initializeRecording$4(MediaStoreOutputOptions.this, context, (Uri) obj);
                        }
                    };
                }
            } else if (outputOptions instanceof FileDescriptorOutputOptions) {
                recordingFinalizer = new Consumer() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda3
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        Recorder.RecordingRecord.lambda$initializeRecording$5(dupedParcelFileDescriptor, (Uri) obj);
                    }
                };
            }
            if (recordingFinalizer != null) {
                this.mRecordingFinalizer.set(recordingFinalizer);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ MediaMuxer lambda$initializeRecording$1(OutputOptions outputOptions, ParcelFileDescriptor dupedParcelFileDescriptor, int muxerOutputFormat, Consumer outputUriCreatedCallback) throws IOException {
            MediaMuxer mediaMuxer;
            Uri outputUri = Uri.EMPTY;
            if (outputOptions instanceof FileOutputOptions) {
                FileOutputOptions fileOutputOptions = (FileOutputOptions) outputOptions;
                File file = fileOutputOptions.getFile();
                if (!OutputUtil.createParentFolder(file)) {
                    Logger.w(Recorder.TAG, "Failed to create folder for " + file.getAbsolutePath());
                }
                mediaMuxer = new MediaMuxer(file.getAbsolutePath(), muxerOutputFormat);
                outputUri = Uri.fromFile(file);
            } else if (outputOptions instanceof FileDescriptorOutputOptions) {
                mediaMuxer = Api26Impl.createMediaMuxer(dupedParcelFileDescriptor.getFileDescriptor(), muxerOutputFormat);
            } else if (outputOptions instanceof MediaStoreOutputOptions) {
                MediaStoreOutputOptions mediaStoreOutputOptions = (MediaStoreOutputOptions) outputOptions;
                ContentValues contentValues = new ContentValues(mediaStoreOutputOptions.getContentValues());
                if (Build.VERSION.SDK_INT >= 29) {
                    contentValues.put("is_pending", (Integer) 1);
                }
                try {
                    outputUri = mediaStoreOutputOptions.getContentResolver().insert(mediaStoreOutputOptions.getCollectionUri(), contentValues);
                    if (outputUri == null) {
                        throw new IOException("Unable to create MediaStore entry.");
                    }
                    ParcelFileDescriptor fileDescriptor = mediaStoreOutputOptions.getContentResolver().openFileDescriptor(outputUri, "rw");
                    MediaMuxer mediaMuxer2 = Api26Impl.createMediaMuxer(fileDescriptor.getFileDescriptor(), muxerOutputFormat);
                    fileDescriptor.close();
                    mediaMuxer = mediaMuxer2;
                } catch (RuntimeException e) {
                    throw new IOException("Unable to create MediaStore entry by " + e, e);
                }
            } else {
                throw new AssertionError("Invalid output options type: " + outputOptions.getClass().getSimpleName());
            }
            outputUriCreatedCallback.accept(outputUri);
            return mediaMuxer;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$initializeRecording$2(MediaStoreOutputOptions mediaStoreOutputOptions, Uri outputUri) {
            if (outputUri.equals(Uri.EMPTY)) {
                return;
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("is_pending", (Integer) 0);
            mediaStoreOutputOptions.getContentResolver().update(outputUri, contentValues, null, null);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$initializeRecording$4(MediaStoreOutputOptions mediaStoreOutputOptions, Context context, Uri outputUri) {
            if (outputUri.equals(Uri.EMPTY)) {
                return;
            }
            String filePath = OutputUtil.getAbsolutePathFromUri(mediaStoreOutputOptions.getContentResolver(), outputUri, Recorder.MEDIA_COLUMN);
            if (filePath == null) {
                Logger.d(Recorder.TAG, "Skipping media scanner scan. Unable to retrieve file path from URI: " + outputUri);
            } else {
                MediaScannerConnection.scanFile(context, new String[]{filePath}, null, new MediaScannerConnection.OnScanCompletedListener() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda4
                    @Override // android.media.MediaScannerConnection.OnScanCompletedListener
                    public final void onScanCompleted(String str, Uri uri) {
                        Recorder.RecordingRecord.lambda$initializeRecording$3(str, uri);
                    }
                });
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$initializeRecording$3(String path, Uri uri) {
            if (uri == null) {
                Logger.e(Recorder.TAG, String.format("File scanning operation failed [path: %s]", path));
            } else {
                Logger.d(Recorder.TAG, String.format("File scan completed successfully [path: %s, URI: %s]", path, uri));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$initializeRecording$5(ParcelFileDescriptor dupedParcelFileDescriptor, Uri ignored) {
            try {
                dupedParcelFileDescriptor.close();
            } catch (IOException e) {
                Logger.e(Recorder.TAG, "Failed to close dup'd ParcelFileDescriptor", e);
            }
        }

        void updateVideoRecordEvent(final VideoRecordEvent event) {
            if (!Objects.equals(event.getOutputOptions(), getOutputOptions())) {
                throw new AssertionError("Attempted to update event listener with event from incorrect recording [Recording: " + event.getOutputOptions() + ", Expected: " + getOutputOptions() + "]");
            }
            String message = "Sending VideoRecordEvent " + event.getClass().getSimpleName();
            if (event instanceof VideoRecordEvent.Finalize) {
                VideoRecordEvent.Finalize finalizeEvent = (VideoRecordEvent.Finalize) event;
                if (finalizeEvent.hasError()) {
                    message = message + String.format(" [error: %s]", VideoRecordEvent.Finalize.errorToString(finalizeEvent.getError()));
                }
            }
            Logger.d(Recorder.TAG, message);
            if (getCallbackExecutor() != null && getEventListener() != null) {
                try {
                    getCallbackExecutor().execute(new Runnable() { // from class: androidx.camera.video.Recorder$RecordingRecord$$ExternalSyntheticLambda6
                        @Override // java.lang.Runnable
                        public final void run() {
                            Recorder.RecordingRecord.this.m198x1386b2b0(event);
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(Recorder.TAG, "The callback executor is invalid.", e);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$updateVideoRecordEvent$6$androidx-camera-video-Recorder$RecordingRecord  reason: not valid java name */
        public /* synthetic */ void m198x1386b2b0(VideoRecordEvent event) {
            getEventListener().accept(event);
        }

        AudioSource performOneTimeAudioSourceCreation(AudioSettings settings, Executor audioSourceExecutor) throws AudioSourceAccessException {
            if (!hasAudioEnabled()) {
                throw new AssertionError("Recording does not have audio enabled. Unable to create audio source for recording " + this);
            }
            AudioSourceSupplier audioSourceSupplier = this.mAudioSourceSupplier.getAndSet(null);
            if (audioSourceSupplier == null) {
                throw new AssertionError("One-time audio source creation has already occurred for recording " + this);
            }
            return audioSourceSupplier.get(settings, audioSourceExecutor);
        }

        MediaMuxer performOneTimeMediaMuxerCreation(int muxerOutputFormat, Consumer<Uri> outputUriCreatedCallback) throws IOException {
            if (!this.mInitialized.get()) {
                throw new AssertionError("Recording " + this + " has not been initialized");
            }
            MediaMuxerSupplier mediaMuxerSupplier = this.mMediaMuxerSupplier.getAndSet(null);
            if (mediaMuxerSupplier == null) {
                throw new AssertionError("One-time media muxer creation has already occurred for recording " + this);
            }
            try {
                return mediaMuxerSupplier.get(muxerOutputFormat, outputUriCreatedCallback);
            } catch (RuntimeException e) {
                throw new IOException("Failed to create MediaMuxer by " + e, e);
            }
        }

        void finalizeRecording(Uri uri) {
            if (!this.mInitialized.get()) {
                return;
            }
            finalizeRecordingInternal(this.mRecordingFinalizer.getAndSet(null), uri);
        }

        void mute(boolean muted) {
            this.mMuted.set(muted);
        }

        boolean isMuted() {
            return this.mMuted.get();
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            finalizeRecording(Uri.EMPTY);
        }

        protected void finalize() throws Throwable {
            try {
                this.mCloseGuard.warnIfOpen();
                Consumer<Uri> finalizer = this.mRecordingFinalizer.getAndSet(null);
                if (finalizer != null) {
                    finalizeRecordingInternal(finalizer, Uri.EMPTY);
                }
            } finally {
                super.finalize();
            }
        }

        private void finalizeRecordingInternal(Consumer<Uri> finalizer, Uri uri) {
            if (finalizer == null) {
                throw new AssertionError("Recording " + this + " has already been finalized");
            }
            this.mCloseGuard.close();
            finalizer.accept(uri);
        }
    }

    /* loaded from: classes.dex */
    public static final class Builder {
        private Executor mExecutor = null;
        private EncoderFactory mVideoEncoderFactory = Recorder.DEFAULT_ENCODER_FACTORY;
        private EncoderFactory mAudioEncoderFactory = Recorder.DEFAULT_ENCODER_FACTORY;
        private final MediaSpec.Builder mMediaSpecBuilder = MediaSpec.builder();

        public Builder setExecutor(Executor executor) {
            Preconditions.checkNotNull(executor, "The specified executor can't be null.");
            this.mExecutor = executor;
            return this;
        }

        public Builder setQualitySelector(final QualitySelector qualitySelector) {
            Preconditions.checkNotNull(qualitySelector, "The specified quality selector can't be null.");
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda3
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setQualitySelector(QualitySelector.this);
                }
            });
            return this;
        }

        public Builder setTargetVideoEncodingBitRate(final int bitrate) {
            if (bitrate <= 0) {
                throw new IllegalArgumentException("The requested target bitrate " + bitrate + " is not supported. Target bitrate must be greater than 0.");
            }
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda0
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setBitrate(new Range<>(Integer.valueOf(r0), Integer.valueOf(bitrate)));
                }
            });
            return this;
        }

        public Builder setAspectRatio(final int aspectRatio) {
            this.mMediaSpecBuilder.configureVideo(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda2
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((VideoSpec.Builder) obj).setAspectRatio(aspectRatio);
                }
            });
            return this;
        }

        Builder setAudioSource(final int source) {
            this.mMediaSpecBuilder.configureAudio(new Consumer() { // from class: androidx.camera.video.Recorder$Builder$$ExternalSyntheticLambda1
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    ((AudioSpec.Builder) obj).setSource(source);
                }
            });
            return this;
        }

        Builder setVideoEncoderFactory(EncoderFactory videoEncoderFactory) {
            this.mVideoEncoderFactory = videoEncoderFactory;
            return this;
        }

        Builder setAudioEncoderFactory(EncoderFactory audioEncoderFactory) {
            this.mAudioEncoderFactory = audioEncoderFactory;
            return this;
        }

        public Recorder build() {
            return new Recorder(this.mExecutor, this.mMediaSpecBuilder.build(), this.mVideoEncoderFactory, this.mAudioEncoderFactory);
        }
    }
}
