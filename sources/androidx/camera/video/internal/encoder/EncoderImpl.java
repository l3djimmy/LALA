package androidx.camera.video.internal.encoder;

import android.media.MediaCodec;
import android.media.MediaCodecInfo;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Range;
import android.view.Surface;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.video.internal.BufferProvider;
import androidx.camera.video.internal.DebugUtils;
import androidx.camera.video.internal.compat.quirk.AudioEncoderIgnoresInputTimestampQuirk;
import androidx.camera.video.internal.compat.quirk.CameraUseInconsistentTimebaseQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.EncoderNotUsePersistentInputSurfaceQuirk;
import androidx.camera.video.internal.compat.quirk.VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk;
import androidx.camera.video.internal.encoder.Encoder;
import androidx.camera.video.internal.encoder.EncoderImpl;
import androidx.camera.video.internal.workaround.EncoderFinder;
import androidx.camera.video.internal.workaround.VideoTimebaseConverter;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class EncoderImpl implements Encoder {
    private static final boolean DEBUG = false;
    private static final int FAKE_BUFFER_INDEX = -9999;
    private static final long NO_LIMIT_LONG = Long.MAX_VALUE;
    private static final Range<Long> NO_RANGE = Range.create(Long.MAX_VALUE, Long.MAX_VALUE);
    private static final long STOP_TIMEOUT_MS = 1000;
    final Executor mEncoderExecutor;
    private final EncoderInfo mEncoderInfo;
    final Encoder.EncoderInput mEncoderInput;
    final Timebase mInputTimebase;
    final boolean mIsVideoEncoder;
    final MediaCodec mMediaCodec;
    private final MediaFormat mMediaFormat;
    private final CallbackToFutureAdapter.Completer<Void> mReleasedCompleter;
    private final ListenableFuture<Void> mReleasedFuture;
    InternalState mState;
    final String mTag;
    final Object mLock = new Object();
    final Queue<Integer> mFreeInputBufferIndexQueue = new ArrayDeque();
    private final Queue<CallbackToFutureAdapter.Completer<InputBuffer>> mAcquisitionQueue = new ArrayDeque();
    private final Set<InputBuffer> mInputBufferSet = new HashSet();
    final Set<EncodedDataImpl> mEncodedDataSet = new HashSet();
    final Deque<Range<Long>> mActivePauseResumeTimeRanges = new ArrayDeque();
    final TimeProvider mTimeProvider = new SystemTimeProvider();
    EncoderCallback mEncoderCallback = EncoderCallback.EMPTY;
    Executor mEncoderCallbackExecutor = CameraXExecutors.directExecutor();
    Range<Long> mStartStopTimeRangeUs = NO_RANGE;
    long mTotalPausedDurationUs = 0;
    boolean mPendingCodecStop = false;
    Long mLastDataStopTimestamp = null;
    Future<?> mStopTimeoutFuture = null;
    private MediaCodecCallback mMediaCodecCallback = null;
    private boolean mIsFlushedAfterEndOfStream = false;
    private boolean mSourceStoppedSignalled = false;
    boolean mMediaCodecEosSignalled = false;
    final EncoderFinder mEncoderFinder = new EncoderFinder();

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum InternalState {
        CONFIGURED,
        STARTED,
        PAUSED,
        STOPPING,
        PENDING_START,
        PENDING_START_PAUSED,
        PENDING_RELEASE,
        ERROR,
        RELEASED
    }

    public EncoderImpl(Executor executor, EncoderConfig encoderConfig) throws InvalidConfigException {
        Preconditions.checkNotNull(executor);
        Preconditions.checkNotNull(encoderConfig);
        this.mEncoderExecutor = CameraXExecutors.newSequentialExecutor(executor);
        if (encoderConfig instanceof AudioEncoderConfig) {
            this.mTag = "AudioEncoder";
            this.mIsVideoEncoder = false;
            this.mEncoderInput = new ByteBufferInput();
        } else if (encoderConfig instanceof VideoEncoderConfig) {
            this.mTag = "VideoEncoder";
            this.mIsVideoEncoder = true;
            this.mEncoderInput = new SurfaceInput();
        } else {
            throw new InvalidConfigException("Unknown encoder config type");
        }
        this.mInputTimebase = encoderConfig.getInputTimebase();
        Logger.d(this.mTag, "mInputTimebase = " + this.mInputTimebase);
        this.mMediaFormat = encoderConfig.toMediaFormat();
        Logger.d(this.mTag, "mMediaFormat = " + this.mMediaFormat);
        this.mMediaCodec = this.mEncoderFinder.findEncoder(this.mMediaFormat);
        Logger.i(this.mTag, "Selected encoder: " + this.mMediaCodec.getName());
        this.mEncoderInfo = createEncoderInfo(this.mIsVideoEncoder, this.mMediaCodec.getCodecInfo(), encoderConfig.getMimeType());
        if (this.mIsVideoEncoder) {
            VideoEncoderInfo videoEncoderInfo = (VideoEncoderInfo) this.mEncoderInfo;
            clampVideoBitrateIfNotSupported(videoEncoderInfo, this.mMediaFormat);
        }
        try {
            reset();
            final AtomicReference<CallbackToFutureAdapter.Completer<Void>> releaseFutureRef = new AtomicReference<>();
            this.mReleasedFuture = Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda15
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return EncoderImpl.lambda$new$0(releaseFutureRef, completer);
                }
            }));
            this.mReleasedCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(releaseFutureRef.get());
            setState(InternalState.CONFIGURED);
        } catch (MediaCodec.CodecException e) {
            throw new InvalidConfigException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$0(AtomicReference releaseFutureRef, CallbackToFutureAdapter.Completer completer) throws Exception {
        releaseFutureRef.set(completer);
        return "mReleasedFuture";
    }

    private void clampVideoBitrateIfNotSupported(VideoEncoderInfo videoEncoderInfo, MediaFormat mediaFormat) {
        Preconditions.checkState(this.mIsVideoEncoder);
        if (mediaFormat.containsKey("bitrate")) {
            int origBitrate = mediaFormat.getInteger("bitrate");
            int newBitrate = videoEncoderInfo.getSupportedBitrateRange().clamp(Integer.valueOf(origBitrate)).intValue();
            if (origBitrate != newBitrate) {
                mediaFormat.setInteger("bitrate", newBitrate);
                Logger.d(this.mTag, "updated bitrate from " + origBitrate + " to " + newBitrate);
            }
        }
    }

    private void reset() {
        this.mStartStopTimeRangeUs = NO_RANGE;
        this.mTotalPausedDurationUs = 0L;
        this.mActivePauseResumeTimeRanges.clear();
        this.mFreeInputBufferIndexQueue.clear();
        for (CallbackToFutureAdapter.Completer<InputBuffer> completer : this.mAcquisitionQueue) {
            completer.setCancelled();
        }
        this.mAcquisitionQueue.clear();
        this.mMediaCodec.reset();
        this.mIsFlushedAfterEndOfStream = false;
        this.mSourceStoppedSignalled = false;
        this.mMediaCodecEosSignalled = false;
        this.mPendingCodecStop = false;
        if (this.mStopTimeoutFuture != null) {
            this.mStopTimeoutFuture.cancel(true);
            this.mStopTimeoutFuture = null;
        }
        if (this.mMediaCodecCallback != null) {
            this.mMediaCodecCallback.stop();
        }
        this.mMediaCodecCallback = new MediaCodecCallback();
        this.mMediaCodec.setCallback(this.mMediaCodecCallback);
        this.mMediaCodec.configure(this.mMediaFormat, (Surface) null, (MediaCrypto) null, 1);
        if (this.mEncoderInput instanceof SurfaceInput) {
            ((SurfaceInput) this.mEncoderInput).resetSurface();
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public Encoder.EncoderInput getInput() {
        return this.mEncoderInput;
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public EncoderInfo getEncoderInfo() {
        return this.mEncoderInfo;
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public int getConfiguredBitrate() {
        if (!this.mMediaFormat.containsKey("bitrate")) {
            return 0;
        }
        int configuredBitrate = this.mMediaFormat.getInteger("bitrate");
        return configuredBitrate;
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void start() {
        final long startTriggerTimeUs = generatePresentationTimeUs();
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda10
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m232x86ab6b23(startTriggerTimeUs);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$start$1$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m232x86ab6b23(long startTriggerTimeUs) {
        switch (this.mState) {
            case CONFIGURED:
                this.mLastDataStopTimestamp = null;
                Logger.d(this.mTag, "Start on " + DebugUtils.readableUs(startTriggerTimeUs));
                try {
                    if (this.mIsFlushedAfterEndOfStream) {
                        reset();
                    }
                    this.mStartStopTimeRangeUs = Range.create(Long.valueOf(startTriggerTimeUs), Long.MAX_VALUE);
                    this.mMediaCodec.start();
                    if (this.mEncoderInput instanceof ByteBufferInput) {
                        ((ByteBufferInput) this.mEncoderInput).setActive(true);
                    }
                    setState(InternalState.STARTED);
                    return;
                } catch (MediaCodec.CodecException e) {
                    handleEncodeError(e);
                    return;
                }
            case STARTED:
            case PENDING_START:
            case ERROR:
                return;
            case PAUSED:
                this.mLastDataStopTimestamp = null;
                Range<Long> pauseRange = this.mActivePauseResumeTimeRanges.removeLast();
                Preconditions.checkState(pauseRange != null && pauseRange.getUpper().longValue() == Long.MAX_VALUE, "There should be a \"pause\" before \"resume\"");
                long pauseTimeUs = pauseRange.getLower().longValue();
                this.mActivePauseResumeTimeRanges.addLast(Range.create(Long.valueOf(pauseTimeUs), Long.valueOf(startTriggerTimeUs)));
                Logger.d(this.mTag, "Resume on " + DebugUtils.readableUs(startTriggerTimeUs) + "\nPaused duration = " + DebugUtils.readableUs(startTriggerTimeUs - pauseTimeUs));
                if ((this.mIsVideoEncoder || DeviceQuirks.get(AudioEncoderIgnoresInputTimestampQuirk.class) == null) && (!this.mIsVideoEncoder || DeviceQuirks.get(VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.class) == null)) {
                    setMediaCodecPaused(false);
                    if (this.mEncoderInput instanceof ByteBufferInput) {
                        ((ByteBufferInput) this.mEncoderInput).setActive(true);
                    }
                }
                if (this.mIsVideoEncoder) {
                    requestKeyFrameToMediaCodec();
                }
                setState(InternalState.STARTED);
                return;
            case STOPPING:
            case PENDING_START_PAUSED:
                setState(InternalState.PENDING_START);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void stop() {
        stop(-1L);
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void stop(final long expectedStopTimeUs) {
        final long stopTriggerTimeUs = generatePresentationTimeUs();
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda11
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m235lambda$stop$4$androidxcameravideointernalencoderEncoderImpl(expectedStopTimeUs, stopTriggerTimeUs);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stop$4$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m235lambda$stop$4$androidxcameravideointernalencoderEncoderImpl(long expectedStopTimeUs, long stopTriggerTimeUs) {
        long stopTimeUs;
        switch (this.mState) {
            case CONFIGURED:
            case STOPPING:
            case ERROR:
                return;
            case STARTED:
            case PAUSED:
                InternalState currentState = this.mState;
                setState(InternalState.STOPPING);
                long startTimeUs = this.mStartStopTimeRangeUs.getLower().longValue();
                if (startTimeUs == Long.MAX_VALUE) {
                    throw new AssertionError("There should be a \"start\" before \"stop\"");
                }
                if (expectedStopTimeUs == -1) {
                    stopTimeUs = stopTriggerTimeUs;
                } else if (expectedStopTimeUs < startTimeUs) {
                    Logger.w(this.mTag, "The expected stop time is less than the start time. Use current time as stop time.");
                    stopTimeUs = stopTriggerTimeUs;
                } else {
                    stopTimeUs = expectedStopTimeUs;
                }
                if (stopTimeUs < startTimeUs) {
                    throw new AssertionError("The start time should be before the stop time.");
                }
                this.mStartStopTimeRangeUs = Range.create(Long.valueOf(startTimeUs), Long.valueOf(stopTimeUs));
                Logger.d(this.mTag, "Stop on " + DebugUtils.readableUs(stopTimeUs));
                if (currentState == InternalState.PAUSED && this.mLastDataStopTimestamp != null) {
                    signalCodecStop();
                    return;
                }
                this.mPendingCodecStop = true;
                this.mStopTimeoutFuture = CameraXExecutors.mainThreadExecutor().schedule(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda9
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderImpl.this.m234lambda$stop$3$androidxcameravideointernalencoderEncoderImpl();
                    }
                }, 1000L, TimeUnit.MILLISECONDS);
                return;
            case PENDING_START_PAUSED:
            case PENDING_START:
                setState(InternalState.CONFIGURED);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stop$3$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m234lambda$stop$3$androidxcameravideointernalencoderEncoderImpl() {
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m233lambda$stop$2$androidxcameravideointernalencoderEncoderImpl();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stop$2$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m233lambda$stop$2$androidxcameravideointernalencoderEncoderImpl() {
        if (this.mPendingCodecStop) {
            Logger.w(this.mTag, "The data didn't reach the expected timestamp before timeout, stop the codec.");
            this.mLastDataStopTimestamp = null;
            signalCodecStop();
            this.mPendingCodecStop = false;
        }
    }

    void signalCodecStop() {
        boolean z = this.mEncoderInput instanceof ByteBufferInput;
        Encoder.EncoderInput encoderInput = this.mEncoderInput;
        if (z) {
            ((ByteBufferInput) encoderInput).setActive(false);
            List<ListenableFuture<Void>> futures = new ArrayList<>();
            for (InputBuffer inputBuffer : this.mInputBufferSet) {
                futures.add(inputBuffer.getTerminationFuture());
            }
            Futures.successfulAsList(futures).addListener(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda8
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.this.signalEndOfInputStream();
                }
            }, this.mEncoderExecutor);
        } else if (encoderInput instanceof SurfaceInput) {
            try {
                this.mMediaCodec.signalEndOfInputStream();
                this.mMediaCodecEosSignalled = true;
            } catch (MediaCodec.CodecException e) {
                handleEncodeError(e);
            }
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void pause() {
        final long pauseTriggerTimeUs = generatePresentationTimeUs();
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m228x8740478b(pauseTriggerTimeUs);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$pause$5$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m228x8740478b(long pauseTriggerTimeUs) {
        switch (this.mState) {
            case CONFIGURED:
            case PAUSED:
            case STOPPING:
            case PENDING_START_PAUSED:
            case ERROR:
                return;
            case STARTED:
                Logger.d(this.mTag, "Pause on " + DebugUtils.readableUs(pauseTriggerTimeUs));
                this.mActivePauseResumeTimeRanges.addLast(Range.create(Long.valueOf(pauseTriggerTimeUs), Long.MAX_VALUE));
                setState(InternalState.PAUSED);
                return;
            case PENDING_START:
                setState(InternalState.PENDING_START_PAUSED);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void release() {
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m229x9ff0bd39();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$6$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m229x9ff0bd39() {
        switch (this.mState) {
            case CONFIGURED:
            case STARTED:
            case PAUSED:
            case ERROR:
                releaseInternal();
                return;
            case STOPPING:
            case PENDING_START_PAUSED:
            case PENDING_START:
                setState(InternalState.PENDING_RELEASE);
                return;
            case PENDING_RELEASE:
            case RELEASED:
                return;
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public ListenableFuture<Void> getReleasedFuture() {
        return this.mReleasedFuture;
    }

    public void signalSourceStopped() {
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m231xeb6ad495();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$signalSourceStopped$7$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m231xeb6ad495() {
        this.mSourceStoppedSignalled = true;
        if (this.mIsFlushedAfterEndOfStream) {
            this.mMediaCodec.stop();
            reset();
        }
    }

    private void releaseInternal() {
        if (this.mIsFlushedAfterEndOfStream) {
            this.mMediaCodec.stop();
            this.mIsFlushedAfterEndOfStream = false;
        }
        this.mMediaCodec.release();
        if (this.mEncoderInput instanceof SurfaceInput) {
            ((SurfaceInput) this.mEncoderInput).releaseSurface();
        }
        setState(InternalState.RELEASED);
        this.mReleasedCompleter.set(null);
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void setEncoderCallback(EncoderCallback encoderCallback, Executor executor) {
        synchronized (this.mLock) {
            this.mEncoderCallback = encoderCallback;
            this.mEncoderCallbackExecutor = executor;
        }
    }

    @Override // androidx.camera.video.internal.encoder.Encoder
    public void requestKeyFrame() {
        this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m230x8e3d44c1();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$requestKeyFrame$8$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m230x8e3d44c1() {
        switch (this.mState) {
            case CONFIGURED:
            case PAUSED:
            case STOPPING:
            case PENDING_START_PAUSED:
            case PENDING_START:
            case ERROR:
            default:
                return;
            case STARTED:
                requestKeyFrameToMediaCodec();
                return;
            case PENDING_RELEASE:
            case RELEASED:
                throw new IllegalStateException("Encoder is released");
        }
    }

    private void setState(InternalState state) {
        if (this.mState == state) {
            return;
        }
        Logger.d(this.mTag, "Transitioning encoder internal state: " + this.mState + " --> " + state);
        this.mState = state;
    }

    void setMediaCodecPaused(boolean paused) {
        Bundle bundle = new Bundle();
        bundle.putInt("drop-input-frames", paused ? 1 : 0);
        this.mMediaCodec.setParameters(bundle);
    }

    void requestKeyFrameToMediaCodec() {
        Bundle bundle = new Bundle();
        bundle.putInt("request-sync", 0);
        this.mMediaCodec.setParameters(bundle);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void signalEndOfInputStream() {
        Futures.addCallback(acquireInputBuffer(), new FutureCallback<InputBuffer>() { // from class: androidx.camera.video.internal.encoder.EncoderImpl.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(InputBuffer inputBuffer) {
                inputBuffer.setPresentationTimeUs(EncoderImpl.this.generatePresentationTimeUs());
                inputBuffer.setEndOfStream(true);
                inputBuffer.submit();
                Futures.addCallback(inputBuffer.getTerminationFuture(), new FutureCallback<Void>() { // from class: androidx.camera.video.internal.encoder.EncoderImpl.1.1
                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onSuccess(Void result) {
                    }

                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onFailure(Throwable t) {
                        boolean z = t instanceof MediaCodec.CodecException;
                        AnonymousClass1 anonymousClass1 = AnonymousClass1.this;
                        if (z) {
                            EncoderImpl.this.handleEncodeError((MediaCodec.CodecException) t);
                        } else {
                            EncoderImpl.this.handleEncodeError(0, t.getMessage(), t);
                        }
                    }
                }, EncoderImpl.this.mEncoderExecutor);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                EncoderImpl.this.handleEncodeError(0, "Unable to acquire InputBuffer.", t);
            }
        }, this.mEncoderExecutor);
    }

    void handleEncodeError(MediaCodec.CodecException e) {
        handleEncodeError(1, e.getMessage(), e);
    }

    void handleEncodeError(final int error, final String message, final Throwable throwable) {
        switch (this.mState) {
            case CONFIGURED:
                m226x9da6fdb3(error, message, throwable);
                reset();
                return;
            case STARTED:
            case PAUSED:
            case STOPPING:
            case PENDING_START_PAUSED:
            case PENDING_START:
            case PENDING_RELEASE:
                setState(InternalState.ERROR);
                stopMediaCodec(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda7
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderImpl.this.m226x9da6fdb3(error, message, throwable);
                    }
                });
                return;
            case ERROR:
                Logger.w(this.mTag, "Get more than one error: " + message + "(" + error + ")", throwable);
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: notifyError */
    public void m226x9da6fdb3(final int error, final String message, final Throwable throwable) {
        final EncoderCallback callback;
        Executor executor;
        synchronized (this.mLock) {
            callback = this.mEncoderCallback;
            executor = this.mEncoderCallbackExecutor;
        }
        try {
            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderCallback.this.onEncodeError(new EncodeException(error, message, throwable));
                }
            });
        } catch (RejectedExecutionException e) {
            Logger.e(this.mTag, "Unable to post to the supplied executor.", e);
        }
    }

    void stopMediaCodec(final Runnable afterStop) {
        final List<ListenableFuture<Void>> futures = new ArrayList<>();
        for (EncodedDataImpl dataToClose : this.mEncodedDataSet) {
            futures.add(dataToClose.getClosedFuture());
        }
        for (InputBuffer inputBuffer : this.mInputBufferSet) {
            futures.add(inputBuffer.getTerminationFuture());
        }
        if (!futures.isEmpty()) {
            Logger.d(this.mTag, "Waiting for resources to return. encoded data = " + this.mEncodedDataSet.size() + ", input buffers = " + this.mInputBufferSet.size());
        }
        Futures.successfulAsList(futures).addListener(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                EncoderImpl.this.m236xb3eec922(futures, afterStop);
            }
        }, this.mEncoderExecutor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stopMediaCodec$11$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m236xb3eec922(List futures, Runnable afterStop) {
        if (this.mState != InternalState.ERROR) {
            if (!futures.isEmpty()) {
                Logger.d(this.mTag, "encoded data and input buffers are returned");
            }
            if ((this.mEncoderInput instanceof SurfaceInput) && !this.mSourceStoppedSignalled) {
                this.mMediaCodec.flush();
                this.mIsFlushedAfterEndOfStream = true;
            } else {
                this.mMediaCodec.stop();
            }
        }
        if (afterStop != null) {
            afterStop.run();
        }
        handleStopped();
    }

    void handleStopped() {
        if (this.mState == InternalState.PENDING_RELEASE) {
            releaseInternal();
            return;
        }
        InternalState oldState = this.mState;
        if (!this.mIsFlushedAfterEndOfStream) {
            reset();
        }
        setState(InternalState.CONFIGURED);
        if (oldState == InternalState.PENDING_START || oldState == InternalState.PENDING_START_PAUSED) {
            start();
            if (oldState == InternalState.PENDING_START_PAUSED) {
                pause();
            }
        }
    }

    void updateTotalPausedDuration(long bufferPresentationTimeUs) {
        while (!this.mActivePauseResumeTimeRanges.isEmpty()) {
            Range<Long> pauseRange = this.mActivePauseResumeTimeRanges.getFirst();
            if (bufferPresentationTimeUs > pauseRange.getUpper().longValue()) {
                this.mActivePauseResumeTimeRanges.removeFirst();
                this.mTotalPausedDurationUs += pauseRange.getUpper().longValue() - pauseRange.getLower().longValue();
                Logger.d(this.mTag, "Total paused duration = " + DebugUtils.readableUs(this.mTotalPausedDurationUs));
            } else {
                return;
            }
        }
    }

    long getAdjustedTimeUs(MediaCodec.BufferInfo bufferInfo) {
        if (this.mTotalPausedDurationUs > 0) {
            long adjustedTimeUs = bufferInfo.presentationTimeUs - this.mTotalPausedDurationUs;
            return adjustedTimeUs;
        }
        long adjustedTimeUs2 = bufferInfo.presentationTimeUs;
        return adjustedTimeUs2;
    }

    boolean isInPauseRange(long timeUs) {
        for (Range<Long> range : this.mActivePauseResumeTimeRanges) {
            if (range.contains((Range<Long>) Long.valueOf(timeUs))) {
                return true;
            }
            if (timeUs < range.getLower().longValue()) {
                return false;
            }
        }
        return false;
    }

    ListenableFuture<InputBuffer> acquireInputBuffer() {
        switch (this.mState) {
            case CONFIGURED:
                return Futures.immediateFailedFuture(new IllegalStateException("Encoder is not started yet."));
            case STARTED:
            case PAUSED:
            case STOPPING:
            case PENDING_START_PAUSED:
            case PENDING_START:
            case PENDING_RELEASE:
                final AtomicReference<CallbackToFutureAdapter.Completer<InputBuffer>> ref = new AtomicReference<>();
                ListenableFuture<InputBuffer> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda12
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return EncoderImpl.lambda$acquireInputBuffer$12(ref, completer);
                    }
                });
                final CallbackToFutureAdapter.Completer<InputBuffer> completer = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(ref.get());
                this.mAcquisitionQueue.offer(completer);
                completer.addCancellationListener(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda13
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderImpl.this.m225x6d8c1d20(completer);
                    }
                }, this.mEncoderExecutor);
                matchAcquisitionsAndFreeBufferIndexes();
                return future;
            case ERROR:
                return Futures.immediateFailedFuture(new IllegalStateException("Encoder is in error state."));
            case RELEASED:
                return Futures.immediateFailedFuture(new IllegalStateException("Encoder is released."));
            default:
                throw new IllegalStateException("Unknown state: " + this.mState);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$acquireInputBuffer$12(AtomicReference ref, CallbackToFutureAdapter.Completer completer) throws Exception {
        ref.set(completer);
        return "acquireInputBuffer";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$acquireInputBuffer$13$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m225x6d8c1d20(CallbackToFutureAdapter.Completer completer) {
        this.mAcquisitionQueue.remove(completer);
    }

    void matchAcquisitionsAndFreeBufferIndexes() {
        while (!this.mAcquisitionQueue.isEmpty() && !this.mFreeInputBufferIndexQueue.isEmpty()) {
            CallbackToFutureAdapter.Completer<InputBuffer> completer = (CallbackToFutureAdapter.Completer) Objects.requireNonNull(this.mAcquisitionQueue.poll());
            int bufferIndex = ((Integer) Objects.requireNonNull(this.mFreeInputBufferIndexQueue.poll())).intValue();
            try {
                final InputBufferImpl inputBuffer = new InputBufferImpl(this.mMediaCodec, bufferIndex);
                if (completer.set(inputBuffer)) {
                    this.mInputBufferSet.add(inputBuffer);
                    inputBuffer.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$$ExternalSyntheticLambda14
                        @Override // java.lang.Runnable
                        public final void run() {
                            EncoderImpl.this.m227xd7c194f9(inputBuffer);
                        }
                    }, this.mEncoderExecutor);
                } else {
                    inputBuffer.cancel();
                }
            } catch (MediaCodec.CodecException e) {
                handleEncodeError(e);
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$matchAcquisitionsAndFreeBufferIndexes$14$androidx-camera-video-internal-encoder-EncoderImpl  reason: not valid java name */
    public /* synthetic */ void m227xd7c194f9(InputBufferImpl inputBuffer) {
        this.mInputBufferSet.remove(inputBuffer);
    }

    private static EncoderInfo createEncoderInfo(boolean isVideoEncoder, MediaCodecInfo codecInfo, String mime) throws InvalidConfigException {
        return isVideoEncoder ? new VideoEncoderInfoImpl(codecInfo, mime) : new AudioEncoderInfoImpl(codecInfo, mime);
    }

    long generatePresentationTimeUs() {
        return this.mTimeProvider.uptimeUs();
    }

    static boolean isKeyFrame(MediaCodec.BufferInfo bufferInfo) {
        return (bufferInfo.flags & 1) != 0;
    }

    static boolean hasEndOfStreamFlag(MediaCodec.BufferInfo bufferInfo) {
        return (bufferInfo.flags & 4) != 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class MediaCodecCallback extends MediaCodec.Callback {
        private final VideoTimebaseConverter mVideoTimestampConverter;
        private boolean mHasSendStartCallback = false;
        private boolean mHasFirstData = false;
        private boolean mHasEndData = false;
        private long mLastPresentationTimeUs = 0;
        private long mLastSentAdjustedTimeUs = 0;
        private boolean mIsOutputBufferInPauseState = false;
        private boolean mIsKeyFrameRequired = false;
        private boolean mStopped = false;

        MediaCodecCallback() {
            Timebase inputTimebase;
            if (EncoderImpl.this.mIsVideoEncoder) {
                if (DeviceQuirks.get(CameraUseInconsistentTimebaseQuirk.class) != null) {
                    Logger.w(EncoderImpl.this.mTag, "CameraUseInconsistentTimebaseQuirk is enabled");
                    inputTimebase = null;
                } else {
                    inputTimebase = EncoderImpl.this.mInputTimebase;
                }
                this.mVideoTimestampConverter = new VideoTimebaseConverter(EncoderImpl.this.mTimeProvider, inputTimebase);
                return;
            }
            this.mVideoTimestampConverter = null;
        }

        @Override // android.media.MediaCodec.Callback
        public void onInputBufferAvailable(MediaCodec mediaCodec, final int index) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m246xa20c30ed(index);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onInputBufferAvailable$0$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback  reason: not valid java name */
        public /* synthetic */ void m246xa20c30ed(int index) {
            if (this.mStopped) {
                Logger.w(EncoderImpl.this.mTag, "Receives input frame after codec is reset.");
                return;
            }
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START_PAUSED:
                case PENDING_START:
                case PENDING_RELEASE:
                    EncoderImpl.this.mFreeInputBufferIndexQueue.offer(Integer.valueOf(index));
                    EncoderImpl.this.matchAcquisitionsAndFreeBufferIndexes();
                    return;
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        @Override // android.media.MediaCodec.Callback
        public void onOutputBufferAvailable(final MediaCodec mediaCodec, final int index, final MediaCodec.BufferInfo bufferInfo) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m248x9e380be0(bufferInfo, mediaCodec, index);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onOutputBufferAvailable$2$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback  reason: not valid java name */
        public /* synthetic */ void m248x9e380be0(MediaCodec.BufferInfo bufferInfo, MediaCodec mediaCodec, int index) {
            final EncoderCallback encoderCallback;
            final Executor executor;
            if (this.mStopped) {
                Logger.w(EncoderImpl.this.mTag, "Receives frame after codec is reset.");
                return;
            }
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START_PAUSED:
                case PENDING_START:
                case PENDING_RELEASE:
                    synchronized (EncoderImpl.this.mLock) {
                        encoderCallback = EncoderImpl.this.mEncoderCallback;
                        executor = EncoderImpl.this.mEncoderCallbackExecutor;
                    }
                    if (!this.mHasSendStartCallback) {
                        this.mHasSendStartCallback = true;
                        try {
                            Objects.requireNonNull(encoderCallback);
                            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda3
                                @Override // java.lang.Runnable
                                public final void run() {
                                    EncoderCallback.this.onEncodeStart();
                                }
                            });
                        } catch (RejectedExecutionException e) {
                            Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                        }
                    }
                    if (checkBufferInfo(bufferInfo)) {
                        if (!this.mHasFirstData) {
                            this.mHasFirstData = true;
                            Logger.d(EncoderImpl.this.mTag, "data timestampUs = " + bufferInfo.presentationTimeUs + ", data timebase = " + EncoderImpl.this.mInputTimebase + ", current system uptimeMs = " + SystemClock.uptimeMillis() + ", current system realtimeMs = " + SystemClock.elapsedRealtime());
                        }
                        MediaCodec.BufferInfo outBufferInfo = resolveOutputBufferInfo(bufferInfo);
                        this.mLastSentAdjustedTimeUs = outBufferInfo.presentationTimeUs;
                        try {
                            EncodedDataImpl encodedData = new EncodedDataImpl(mediaCodec, index, outBufferInfo);
                            sendEncodedData(encodedData, encoderCallback, executor);
                        } catch (MediaCodec.CodecException e2) {
                            EncoderImpl.this.handleEncodeError(e2);
                            return;
                        }
                    } else if (index != EncoderImpl.FAKE_BUFFER_INDEX) {
                        try {
                            EncoderImpl.this.mMediaCodec.releaseOutputBuffer(index, false);
                        } catch (MediaCodec.CodecException e3) {
                            EncoderImpl.this.handleEncodeError(e3);
                            return;
                        }
                    }
                    if (!this.mHasEndData && isEndOfStream(bufferInfo)) {
                        this.mHasEndData = true;
                        EncoderImpl.this.stopMediaCodec(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda4
                            @Override // java.lang.Runnable
                            public final void run() {
                                EncoderImpl.MediaCodecCallback.this.m247xbb0c589f(executor, encoderCallback);
                            }
                        });
                        return;
                    }
                    return;
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onOutputBufferAvailable$1$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback  reason: not valid java name */
        public /* synthetic */ void m247xbb0c589f(Executor executor, final EncoderCallback encoderCallback) {
            if (EncoderImpl.this.mState == InternalState.ERROR) {
                return;
            }
            try {
                Objects.requireNonNull(encoderCallback);
                executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderCallback.this.onEncodeStop();
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
            }
        }

        private MediaCodec.BufferInfo resolveOutputBufferInfo(MediaCodec.BufferInfo bufferInfo) {
            long adjustedTimeUs = EncoderImpl.this.getAdjustedTimeUs(bufferInfo);
            if (bufferInfo.presentationTimeUs == adjustedTimeUs) {
                return bufferInfo;
            }
            Preconditions.checkState(adjustedTimeUs > this.mLastSentAdjustedTimeUs);
            MediaCodec.BufferInfo newBufferInfo = new MediaCodec.BufferInfo();
            newBufferInfo.set(bufferInfo.offset, bufferInfo.size, adjustedTimeUs, bufferInfo.flags);
            return newBufferInfo;
        }

        private void sendEncodedData(final EncodedDataImpl encodedData, final EncoderCallback callback, Executor executor) {
            EncoderImpl.this.mEncodedDataSet.add(encodedData);
            Futures.addCallback(encodedData.getClosedFuture(), new FutureCallback<Void>() { // from class: androidx.camera.video.internal.encoder.EncoderImpl.MediaCodecCallback.1
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void result) {
                    EncoderImpl.this.mEncodedDataSet.remove(encodedData);
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    EncoderImpl.this.mEncodedDataSet.remove(encodedData);
                    boolean z = t instanceof MediaCodec.CodecException;
                    MediaCodecCallback mediaCodecCallback = MediaCodecCallback.this;
                    if (z) {
                        EncoderImpl.this.handleEncodeError((MediaCodec.CodecException) t);
                    } else {
                        EncoderImpl.this.handleEncodeError(0, t.getMessage(), t);
                    }
                }
            }, EncoderImpl.this.mEncoderExecutor);
            try {
                executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda5
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderCallback.this.onEncodedData(encodedData);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                encodedData.close();
            }
        }

        private boolean checkBufferInfo(MediaCodec.BufferInfo bufferInfo) {
            if (this.mHasEndData) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by already reach end of stream.");
                return false;
            } else if (bufferInfo.size <= 0) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by invalid buffer size.");
                return false;
            } else if ((bufferInfo.flags & 2) != 0) {
                Logger.d(EncoderImpl.this.mTag, "Drop buffer by codec config.");
                return false;
            } else {
                if (this.mVideoTimestampConverter != null) {
                    bufferInfo.presentationTimeUs = this.mVideoTimestampConverter.convertToUptimeUs(bufferInfo.presentationTimeUs);
                }
                if (bufferInfo.presentationTimeUs <= this.mLastPresentationTimeUs) {
                    Logger.d(EncoderImpl.this.mTag, "Drop buffer by out of order buffer from MediaCodec.");
                    return false;
                }
                this.mLastPresentationTimeUs = bufferInfo.presentationTimeUs;
                if (!EncoderImpl.this.mStartStopTimeRangeUs.contains((Range<Long>) Long.valueOf(bufferInfo.presentationTimeUs))) {
                    Logger.d(EncoderImpl.this.mTag, "Drop buffer by not in start-stop range.");
                    if (EncoderImpl.this.mPendingCodecStop && bufferInfo.presentationTimeUs >= EncoderImpl.this.mStartStopTimeRangeUs.getUpper().longValue()) {
                        if (EncoderImpl.this.mStopTimeoutFuture != null) {
                            EncoderImpl.this.mStopTimeoutFuture.cancel(true);
                        }
                        EncoderImpl.this.mLastDataStopTimestamp = Long.valueOf(bufferInfo.presentationTimeUs);
                        EncoderImpl.this.signalCodecStop();
                        EncoderImpl.this.mPendingCodecStop = false;
                    }
                    return false;
                }
                boolean updatePauseRangeStateAndCheckIfBufferPaused = updatePauseRangeStateAndCheckIfBufferPaused(bufferInfo);
                EncoderImpl encoderImpl = EncoderImpl.this;
                if (updatePauseRangeStateAndCheckIfBufferPaused) {
                    Logger.d(encoderImpl.mTag, "Drop buffer by pause.");
                    return false;
                } else if (encoderImpl.getAdjustedTimeUs(bufferInfo) <= this.mLastSentAdjustedTimeUs) {
                    Logger.d(EncoderImpl.this.mTag, "Drop buffer by adjusted time is less than the last sent time.");
                    if (EncoderImpl.this.mIsVideoEncoder && EncoderImpl.isKeyFrame(bufferInfo)) {
                        this.mIsKeyFrameRequired = true;
                    }
                    return false;
                } else {
                    if (!this.mHasFirstData && !this.mIsKeyFrameRequired && EncoderImpl.this.mIsVideoEncoder) {
                        this.mIsKeyFrameRequired = true;
                    }
                    if (this.mIsKeyFrameRequired) {
                        if (!EncoderImpl.isKeyFrame(bufferInfo)) {
                            Logger.d(EncoderImpl.this.mTag, "Drop buffer by not a key frame.");
                            EncoderImpl.this.requestKeyFrameToMediaCodec();
                            return false;
                        }
                        this.mIsKeyFrameRequired = false;
                    }
                    return true;
                }
            }
        }

        private boolean isEndOfStream(MediaCodec.BufferInfo bufferInfo) {
            return EncoderImpl.hasEndOfStreamFlag(bufferInfo) || isEosSignalledAndStopTimeReached(bufferInfo);
        }

        private boolean isEosSignalledAndStopTimeReached(MediaCodec.BufferInfo bufferInfo) {
            return EncoderImpl.this.mMediaCodecEosSignalled && bufferInfo.presentationTimeUs > EncoderImpl.this.mStartStopTimeRangeUs.getUpper().longValue();
        }

        private boolean updatePauseRangeStateAndCheckIfBufferPaused(MediaCodec.BufferInfo bufferInfo) {
            Executor executor;
            final EncoderCallback encoderCallback;
            EncoderImpl.this.updateTotalPausedDuration(bufferInfo.presentationTimeUs);
            boolean isInPauseRange = EncoderImpl.this.isInPauseRange(bufferInfo.presentationTimeUs);
            if (!this.mIsOutputBufferInPauseState && isInPauseRange) {
                Logger.d(EncoderImpl.this.mTag, "Switch to pause state");
                this.mIsOutputBufferInPauseState = true;
                synchronized (EncoderImpl.this.mLock) {
                    executor = EncoderImpl.this.mEncoderCallbackExecutor;
                    encoderCallback = EncoderImpl.this.mEncoderCallback;
                }
                Objects.requireNonNull(encoderCallback);
                executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        EncoderCallback.this.onEncodePaused();
                    }
                });
                if (EncoderImpl.this.mState == InternalState.PAUSED && ((EncoderImpl.this.mIsVideoEncoder || DeviceQuirks.get(AudioEncoderIgnoresInputTimestampQuirk.class) == null) && (!EncoderImpl.this.mIsVideoEncoder || DeviceQuirks.get(VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk.class) == null))) {
                    if (EncoderImpl.this.mEncoderInput instanceof ByteBufferInput) {
                        ((ByteBufferInput) EncoderImpl.this.mEncoderInput).setActive(false);
                    }
                    EncoderImpl.this.setMediaCodecPaused(true);
                }
                EncoderImpl.this.mLastDataStopTimestamp = Long.valueOf(bufferInfo.presentationTimeUs);
                if (EncoderImpl.this.mPendingCodecStop) {
                    if (EncoderImpl.this.mStopTimeoutFuture != null) {
                        EncoderImpl.this.mStopTimeoutFuture.cancel(true);
                    }
                    EncoderImpl.this.signalCodecStop();
                    EncoderImpl.this.mPendingCodecStop = false;
                }
            } else if (this.mIsOutputBufferInPauseState && !isInPauseRange) {
                Logger.d(EncoderImpl.this.mTag, "Switch to resume state");
                this.mIsOutputBufferInPauseState = false;
                if (EncoderImpl.this.mIsVideoEncoder && !EncoderImpl.isKeyFrame(bufferInfo)) {
                    this.mIsKeyFrameRequired = true;
                }
            }
            return this.mIsOutputBufferInPauseState;
        }

        @Override // android.media.MediaCodec.Callback
        public void onError(MediaCodec mediaCodec, final MediaCodec.CodecException e) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda9
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m245x7242b142(e);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onError$4$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback  reason: not valid java name */
        public /* synthetic */ void m245x7242b142(MediaCodec.CodecException e) {
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START_PAUSED:
                case PENDING_START:
                case PENDING_RELEASE:
                    EncoderImpl.this.handleEncodeError(e);
                    return;
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        @Override // android.media.MediaCodec.Callback
        public void onOutputFormatChanged(MediaCodec mediaCodec, final MediaFormat mediaFormat) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda10
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.MediaCodecCallback.this.m249xd741dd39(mediaFormat);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onOutputFormatChanged$7$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback  reason: not valid java name */
        public /* synthetic */ void m249xd741dd39(final MediaFormat mediaFormat) {
            final EncoderCallback encoderCallback;
            Executor executor;
            if (this.mStopped) {
                Logger.w(EncoderImpl.this.mTag, "Receives onOutputFormatChanged after codec is reset.");
                return;
            }
            switch (EncoderImpl.this.mState) {
                case CONFIGURED:
                case ERROR:
                case RELEASED:
                    return;
                case STARTED:
                case PAUSED:
                case STOPPING:
                case PENDING_START_PAUSED:
                case PENDING_START:
                case PENDING_RELEASE:
                    synchronized (EncoderImpl.this.mLock) {
                        encoderCallback = EncoderImpl.this.mEncoderCallback;
                        executor = EncoderImpl.this.mEncoderCallbackExecutor;
                    }
                    try {
                        executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda7
                            @Override // java.lang.Runnable
                            public final void run() {
                                EncoderCallback.this.onOutputConfigUpdate(new OutputConfig() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda6
                                    @Override // androidx.camera.video.internal.encoder.OutputConfig
                                    public final MediaFormat getMediaFormat() {
                                        return EncoderImpl.MediaCodecCallback.lambda$onOutputFormatChanged$5(r1);
                                    }
                                });
                            }
                        });
                        return;
                    } catch (RejectedExecutionException e) {
                        Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                        return;
                    }
                default:
                    throw new IllegalStateException("Unknown state: " + EncoderImpl.this.mState);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ MediaFormat lambda$onOutputFormatChanged$5(MediaFormat mediaFormat) {
            return mediaFormat;
        }

        void stop() {
            this.mStopped = true;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class SurfaceInput implements Encoder.SurfaceInput {
        private final Object mLock = new Object();
        private final Set<Surface> mObsoleteSurfaces = new HashSet();
        private Surface mSurface;
        private Executor mSurfaceUpdateExecutor;
        private Encoder.SurfaceInput.OnSurfaceUpdateListener mSurfaceUpdateListener;

        SurfaceInput() {
        }

        @Override // androidx.camera.video.internal.encoder.Encoder.SurfaceInput
        public void setOnSurfaceUpdateListener(Executor executor, Encoder.SurfaceInput.OnSurfaceUpdateListener listener) {
            Surface surface;
            synchronized (this.mLock) {
                this.mSurfaceUpdateListener = (Encoder.SurfaceInput.OnSurfaceUpdateListener) Preconditions.checkNotNull(listener);
                this.mSurfaceUpdateExecutor = (Executor) Preconditions.checkNotNull(executor);
                surface = this.mSurface;
            }
            if (surface != null) {
                notifySurfaceUpdate(executor, listener, surface);
            }
        }

        void resetSurface() {
            Surface surface;
            Encoder.SurfaceInput.OnSurfaceUpdateListener listener;
            Executor executor;
            EncoderNotUsePersistentInputSurfaceQuirk quirk = (EncoderNotUsePersistentInputSurfaceQuirk) DeviceQuirks.get(EncoderNotUsePersistentInputSurfaceQuirk.class);
            synchronized (this.mLock) {
                Surface surface2 = this.mSurface;
                if (quirk == null) {
                    if (surface2 == null) {
                        this.mSurface = Api23Impl.createPersistentInputSurface();
                        surface = this.mSurface;
                    } else {
                        surface = null;
                    }
                    Api23Impl.setInputSurface(EncoderImpl.this.mMediaCodec, this.mSurface);
                } else {
                    if (surface2 != null) {
                        this.mObsoleteSurfaces.add(this.mSurface);
                    }
                    this.mSurface = EncoderImpl.this.mMediaCodec.createInputSurface();
                    surface = this.mSurface;
                }
                listener = this.mSurfaceUpdateListener;
                executor = this.mSurfaceUpdateExecutor;
            }
            if (surface != null && listener != null && executor != null) {
                notifySurfaceUpdate(executor, listener, surface);
            }
        }

        void releaseSurface() {
            Surface surface;
            Set<Surface> obsoleteSurfaces;
            synchronized (this.mLock) {
                surface = this.mSurface;
                this.mSurface = null;
                obsoleteSurfaces = new HashSet<>(this.mObsoleteSurfaces);
                this.mObsoleteSurfaces.clear();
            }
            if (surface != null) {
                surface.release();
            }
            for (Surface obsoleteSurface : obsoleteSurfaces) {
                obsoleteSurface.release();
            }
        }

        private void notifySurfaceUpdate(Executor executor, final Encoder.SurfaceInput.OnSurfaceUpdateListener listener, final Surface surface) {
            try {
                executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        Encoder.SurfaceInput.OnSurfaceUpdateListener.this.onSurfaceUpdate(surface);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class ByteBufferInput implements Encoder.ByteBufferInput {
        private final Map<Observable.Observer<? super BufferProvider.State>, Executor> mStateObservers = new LinkedHashMap();
        private BufferProvider.State mBufferProviderState = BufferProvider.State.INACTIVE;
        private final List<ListenableFuture<InputBuffer>> mAcquisitionList = new ArrayList();

        ByteBufferInput() {
        }

        @Override // androidx.camera.core.impl.Observable
        public ListenableFuture<BufferProvider.State> fetchData() {
            return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda1
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return EncoderImpl.ByteBufferInput.this.m243xdbdcf33f(completer);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$fetchData$0$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ void m242x3f6ef6e0(CallbackToFutureAdapter.Completer completer) {
            completer.set(this.mBufferProviderState);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$fetchData$1$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ Object m243xdbdcf33f(final CallbackToFutureAdapter.Completer completer) throws Exception {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m242x3f6ef6e0(completer);
                }
            });
            return "fetchData";
        }

        @Override // androidx.camera.video.internal.BufferProvider
        public ListenableFuture<InputBuffer> acquireBuffer() {
            return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda2
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return EncoderImpl.ByteBufferInput.this.m240xc1b33249(completer);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$acquireBuffer$5$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ Object m240xc1b33249(final CallbackToFutureAdapter.Completer completer) throws Exception {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m239x254535ea(completer);
                }
            });
            return "acquireBuffer";
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$acquireBuffer$4$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ void m239x254535ea(CallbackToFutureAdapter.Completer completer) {
            if (this.mBufferProviderState != BufferProvider.State.ACTIVE) {
                if (this.mBufferProviderState == BufferProvider.State.INACTIVE) {
                    completer.setException(new IllegalStateException("BufferProvider is not active."));
                    return;
                } else {
                    completer.setException(new IllegalStateException("Unknown state: " + this.mBufferProviderState));
                    return;
                }
            }
            final ListenableFuture<InputBuffer> future = EncoderImpl.this.acquireInputBuffer();
            Futures.propagate(future, completer);
            completer.addCancellationListener(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m237xec693d2c(future);
                }
            }, CameraXExecutors.directExecutor());
            this.mAcquisitionList.add(future);
            future.addListener(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m238x88d7398b(future);
                }
            }, EncoderImpl.this.mEncoderExecutor);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$acquireBuffer$3$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ void m238x88d7398b(ListenableFuture future) {
            this.mAcquisitionList.remove(future);
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* renamed from: cancelInputBuffer */
        public void m237xec693d2c(ListenableFuture<InputBuffer> inputBufferFuture) {
            if (!inputBufferFuture.cancel(true)) {
                Preconditions.checkState(inputBufferFuture.isDone());
                try {
                    inputBufferFuture.get().cancel();
                } catch (InterruptedException | CancellationException | ExecutionException e) {
                    Logger.w(EncoderImpl.this.mTag, "Unable to cancel the input buffer: " + e);
                }
            }
        }

        @Override // androidx.camera.core.impl.Observable
        public void addObserver(final Executor executor, final Observable.Observer<? super BufferProvider.State> observer) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m241x11117d06(observer, executor);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$addObserver$7$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ void m241x11117d06(final Observable.Observer observer, Executor executor) {
            this.mStateObservers.put((Observable.Observer) Preconditions.checkNotNull(observer), (Executor) Preconditions.checkNotNull(executor));
            final BufferProvider.State state = this.mBufferProviderState;
            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda8
                @Override // java.lang.Runnable
                public final void run() {
                    Observable.Observer.this.onNewData(state);
                }
            });
        }

        @Override // androidx.camera.core.impl.Observable
        public void removeObserver(final Observable.Observer<? super BufferProvider.State> observer) {
            EncoderImpl.this.mEncoderExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda9
                @Override // java.lang.Runnable
                public final void run() {
                    EncoderImpl.ByteBufferInput.this.m244x87db4ec8(observer);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$removeObserver$8$androidx-camera-video-internal-encoder-EncoderImpl$ByteBufferInput  reason: not valid java name */
        public /* synthetic */ void m244x87db4ec8(Observable.Observer observer) {
            this.mStateObservers.remove(Preconditions.checkNotNull(observer));
        }

        void setActive(boolean isActive) {
            final BufferProvider.State newState = isActive ? BufferProvider.State.ACTIVE : BufferProvider.State.INACTIVE;
            if (this.mBufferProviderState == newState) {
                return;
            }
            this.mBufferProviderState = newState;
            if (newState == BufferProvider.State.INACTIVE) {
                for (ListenableFuture<InputBuffer> future : this.mAcquisitionList) {
                    future.cancel(true);
                }
                this.mAcquisitionList.clear();
            }
            for (final Map.Entry<Observable.Observer<? super BufferProvider.State>, Executor> entry : this.mStateObservers.entrySet()) {
                try {
                    entry.getValue().execute(new Runnable() { // from class: androidx.camera.video.internal.encoder.EncoderImpl$ByteBufferInput$$ExternalSyntheticLambda7
                        @Override // java.lang.Runnable
                        public final void run() {
                            ((Observable.Observer) entry.getKey()).onNewData(newState);
                        }
                    });
                } catch (RejectedExecutionException e) {
                    Logger.e(EncoderImpl.this.mTag, "Unable to post to the supplied executor.", e);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class Api23Impl {
        private Api23Impl() {
        }

        static Surface createPersistentInputSurface() {
            return MediaCodec.createPersistentInputSurface();
        }

        static void setInputSurface(MediaCodec mediaCodec, Surface surface) {
            mediaCodec.setInputSurface(surface);
        }
    }
}
