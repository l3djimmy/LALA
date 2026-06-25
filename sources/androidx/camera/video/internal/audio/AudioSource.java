package androidx.camera.video.internal.audio;

import android.content.Context;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.video.AudioStats;
import androidx.camera.video.internal.BufferProvider;
import androidx.camera.video.internal.audio.AudioSource;
import androidx.camera.video.internal.audio.AudioStream;
import androidx.camera.video.internal.encoder.InputBuffer;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;
import java.util.Objects;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class AudioSource {
    static final long DEFAULT_START_RETRY_INTERVAL_MS = 3000;
    private static final String TAG = "AudioSource";
    private FutureCallback<InputBuffer> mAcquireBufferCallback;
    long mAmplitudeTimestamp;
    double mAudioAmplitude;
    private final int mAudioFormat;
    AudioSourceCallback mAudioSourceCallback;
    final AudioStream mAudioStream;
    boolean mAudioStreamSilenced;
    BufferProvider<? extends InputBuffer> mBufferProvider;
    BufferProvider.State mBufferProviderState;
    Executor mCallbackExecutor;
    final Executor mExecutor;
    boolean mInSilentStartState;
    boolean mIsSendingAudio;
    private long mLatestFailedStartTimeNs;
    boolean mMuted;
    final AtomicReference<Boolean> mNotifiedSilenceState;
    final AtomicBoolean mNotifiedSuspendState;
    final SilentAudioStream mSilentAudioStream;
    private final long mStartRetryIntervalNs;
    InternalState mState;
    private Observable.Observer<BufferProvider.State> mStateObserver;
    private byte[] mZeroBytes;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum InternalState {
        CONFIGURED,
        STARTED,
        RELEASED
    }

    public AudioSource(AudioSettings settings, Executor executor, Context attributionContext) throws AudioSourceAccessException {
        this(settings, executor, attributionContext, new AudioStreamFactory() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda12
            @Override // androidx.camera.video.internal.audio.AudioStreamFactory
            public final AudioStream create(AudioSettings audioSettings, Context context) {
                return new AudioStreamImpl(audioSettings, context);
            }
        }, DEFAULT_START_RETRY_INTERVAL_MS);
    }

    AudioSource(AudioSettings settings, Executor executor, Context attributionContext, AudioStreamFactory audioStreamFactory, long startRetryIntervalMs) throws AudioSourceAccessException {
        this.mNotifiedSilenceState = new AtomicReference<>(null);
        this.mNotifiedSuspendState = new AtomicBoolean(false);
        this.mState = InternalState.CONFIGURED;
        this.mBufferProviderState = BufferProvider.State.INACTIVE;
        this.mAmplitudeTimestamp = 0L;
        this.mExecutor = CameraXExecutors.newSequentialExecutor(executor);
        this.mStartRetryIntervalNs = TimeUnit.MILLISECONDS.toNanos(startRetryIntervalMs);
        try {
            this.mAudioStream = new BufferedAudioStream(audioStreamFactory.create(settings, attributionContext), settings);
            this.mAudioStream.setCallback(new AudioStreamCallback(), this.mExecutor);
            this.mSilentAudioStream = new SilentAudioStream(settings);
            this.mAudioFormat = settings.getAudioFormat();
        } catch (AudioStream.AudioStreamException | IllegalArgumentException e) {
            throw new AudioSourceAccessException("Unable to create AudioStream", e);
        }
    }

    /* loaded from: classes.dex */
    class AudioStreamCallback implements AudioStream.AudioStreamCallback {
        AudioStreamCallback() {
        }

        @Override // androidx.camera.video.internal.audio.AudioStream.AudioStreamCallback
        public void onSilenceStateChanged(boolean isSilenced) {
            AudioSource.this.mAudioStreamSilenced = isSilenced;
            if (AudioSource.this.mState == InternalState.STARTED) {
                AudioSource.this.notifySilenced();
            }
        }
    }

    public void setBufferProvider(final BufferProvider<? extends InputBuffer> bufferProvider) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda10
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m216x885db6e2(bufferProvider);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setBufferProvider$0$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m216x885db6e2(BufferProvider bufferProvider) {
        switch (this.mState) {
            case CONFIGURED:
            case STARTED:
                if (this.mBufferProvider != bufferProvider) {
                    resetBufferProvider(bufferProvider);
                    return;
                }
                return;
            case RELEASED:
                throw new AssertionError("AudioSource is released");
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$start$1$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m217lambda$start$1$androidxcameravideointernalaudioAudioSource() {
        start(this.mMuted);
    }

    public void start() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m217lambda$start$1$androidxcameravideointernalaudioAudioSource();
            }
        });
    }

    public void start(final boolean muted) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m218lambda$start$2$androidxcameravideointernalaudioAudioSource(muted);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$start$2$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m218lambda$start$2$androidxcameravideointernalaudioAudioSource(boolean muted) {
        switch (this.mState) {
            case CONFIGURED:
                this.mNotifiedSilenceState.set(null);
                this.mNotifiedSuspendState.set(false);
                setState(InternalState.STARTED);
                mute(muted);
                updateSendingAudio();
                return;
            case STARTED:
            default:
                return;
            case RELEASED:
                throw new AssertionError("AudioSource is released");
        }
    }

    public void stop() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m219lambda$stop$3$androidxcameravideointernalaudioAudioSource();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stop$3$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m219lambda$stop$3$androidxcameravideointernalaudioAudioSource() {
        switch (this.mState) {
            case CONFIGURED:
            default:
                return;
            case STARTED:
                setState(InternalState.CONFIGURED);
                updateSendingAudio();
                return;
            case RELEASED:
                Logger.w(TAG, "AudioSource is released. Calling stop() is a no-op.");
                return;
        }
    }

    public ListenableFuture<Void> release() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda2
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return AudioSource.this.m214xa561a489(completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$5$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ Object m214xa561a489(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m213xb3b7fe6a(completer);
            }
        });
        return "AudioSource-release";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$4$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m213xb3b7fe6a(CallbackToFutureAdapter.Completer completer) {
        try {
            switch (this.mState) {
                case CONFIGURED:
                case STARTED:
                    resetBufferProvider(null);
                    this.mSilentAudioStream.release();
                    this.mAudioStream.release();
                    stopSendingAudio();
                    setState(InternalState.RELEASED);
                    break;
            }
            completer.set(null);
        } catch (Throwable t) {
            completer.setException(t);
        }
    }

    public void setAudioSourceCallback(final Executor executor, final AudioSourceCallback callback) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m215xcbe526c1(executor, callback);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setAudioSourceCallback$6$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m215xcbe526c1(Executor executor, AudioSourceCallback callback) {
        switch (this.mState) {
            case CONFIGURED:
                this.mCallbackExecutor = executor;
                this.mAudioSourceCallback = callback;
                return;
            case STARTED:
            case RELEASED:
                throw new AssertionError("The audio recording callback must be registered before the audio source is started.");
            default:
                return;
        }
    }

    public void mute(final boolean muted) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                AudioSource.this.m211lambda$mute$7$androidxcameravideointernalaudioAudioSource(muted);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$mute$7$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m211lambda$mute$7$androidxcameravideointernalaudioAudioSource(boolean muted) {
        switch (this.mState) {
            case CONFIGURED:
            case STARTED:
                if (this.mMuted == muted) {
                    return;
                }
                this.mMuted = muted;
                if (this.mState == InternalState.STARTED) {
                    notifySilenced();
                    return;
                }
                return;
            case RELEASED:
                throw new AssertionError("AudioSource is released");
            default:
                return;
        }
    }

    private void resetBufferProvider(final BufferProvider<? extends InputBuffer> bufferProvider) {
        if (this.mBufferProvider != null) {
            this.mBufferProvider.removeObserver((Observable.Observer) Objects.requireNonNull(this.mStateObserver));
            this.mBufferProvider = null;
            this.mStateObserver = null;
            this.mAcquireBufferCallback = null;
            this.mBufferProviderState = BufferProvider.State.INACTIVE;
            updateSendingAudio();
        }
        if (bufferProvider != null) {
            this.mBufferProvider = bufferProvider;
            this.mStateObserver = new Observable.Observer<BufferProvider.State>() { // from class: androidx.camera.video.internal.audio.AudioSource.1
                @Override // androidx.camera.core.impl.Observable.Observer
                public void onNewData(BufferProvider.State state) {
                    Objects.requireNonNull(state);
                    if (AudioSource.this.mBufferProvider == bufferProvider) {
                        Logger.d(AudioSource.TAG, "Receive BufferProvider state change: " + AudioSource.this.mBufferProviderState + " to " + state);
                        if (AudioSource.this.mBufferProviderState != state) {
                            AudioSource.this.mBufferProviderState = state;
                            AudioSource.this.updateSendingAudio();
                        }
                    }
                }

                @Override // androidx.camera.core.impl.Observable.Observer
                public void onError(Throwable throwable) {
                    if (AudioSource.this.mBufferProvider == bufferProvider) {
                        AudioSource.this.notifyError(throwable);
                    }
                }
            };
            this.mAcquireBufferCallback = new FutureCallback<InputBuffer>() { // from class: androidx.camera.video.internal.audio.AudioSource.2
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(InputBuffer inputBuffer) {
                    if (!AudioSource.this.mIsSendingAudio || AudioSource.this.mBufferProvider != bufferProvider) {
                        inputBuffer.cancel();
                        return;
                    }
                    if (AudioSource.this.mInSilentStartState && AudioSource.this.isStartRetryIntervalReached()) {
                        AudioSource.this.retryStartAudioStream();
                    }
                    AudioStream audioStream = AudioSource.this.getCurrentAudioStream();
                    ByteBuffer byteBuffer = inputBuffer.getByteBuffer();
                    AudioStream.PacketInfo packetInfo = audioStream.read(byteBuffer);
                    if (packetInfo.getSizeInBytes() > 0) {
                        if (AudioSource.this.mMuted) {
                            AudioSource.this.overrideBySilence(byteBuffer, packetInfo.getSizeInBytes());
                        }
                        if (AudioSource.this.mCallbackExecutor != null && packetInfo.getTimestampNs() - AudioSource.this.mAmplitudeTimestamp >= 200) {
                            AudioSource.this.mAmplitudeTimestamp = packetInfo.getTimestampNs();
                            AudioSource.this.postMaxAmplitude(byteBuffer);
                        }
                        byteBuffer.limit(byteBuffer.position() + packetInfo.getSizeInBytes());
                        inputBuffer.setPresentationTimeUs(TimeUnit.NANOSECONDS.toMicros(packetInfo.getTimestampNs()));
                        inputBuffer.submit();
                    } else {
                        Logger.w(AudioSource.TAG, "Unable to read data from AudioStream.");
                        inputBuffer.cancel();
                    }
                    AudioSource.this.sendNextAudio();
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable throwable) {
                    if (AudioSource.this.mBufferProvider != bufferProvider) {
                        return;
                    }
                    Logger.d(AudioSource.TAG, "Unable to get input buffer, the BufferProvider could be transitioning to INACTIVE state.");
                    if (!(throwable instanceof IllegalStateException)) {
                        AudioSource.this.notifyError(throwable);
                    }
                }
            };
            BufferProvider.State state = fetchBufferProviderState(bufferProvider);
            if (state != null) {
                this.mBufferProviderState = state;
                updateSendingAudio();
            }
            this.mBufferProvider.addObserver(this.mExecutor, this.mStateObserver);
        }
    }

    AudioStream getCurrentAudioStream() {
        return this.mInSilentStartState ? this.mSilentAudioStream : this.mAudioStream;
    }

    void retryStartAudioStream() {
        Preconditions.checkState(this.mInSilentStartState);
        try {
            this.mAudioStream.start();
            Logger.d(TAG, "Retry start AudioStream succeed");
            this.mSilentAudioStream.stop();
            this.mInSilentStartState = false;
        } catch (AudioStream.AudioStreamException e) {
            Logger.w(TAG, "Retry start AudioStream failed", e);
            this.mLatestFailedStartTimeNs = getCurrentSystemTimeNs();
        }
    }

    boolean isStartRetryIntervalReached() {
        Preconditions.checkState(this.mLatestFailedStartTimeNs > 0);
        return getCurrentSystemTimeNs() - this.mLatestFailedStartTimeNs >= this.mStartRetryIntervalNs;
    }

    void notifyError(final Throwable throwable) {
        Executor executor = this.mCallbackExecutor;
        final AudioSourceCallback callback = this.mAudioSourceCallback;
        if (executor != null && callback != null) {
            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda11
                @Override // java.lang.Runnable
                public final void run() {
                    AudioSource.AudioSourceCallback.this.onError(throwable);
                }
            });
        }
    }

    void notifySilenced() {
        Executor executor = this.mCallbackExecutor;
        final AudioSourceCallback callback = this.mAudioSourceCallback;
        if (executor != null && callback != null) {
            final boolean isSilenced = this.mMuted || this.mInSilentStartState || this.mAudioStreamSilenced;
            if (!Objects.equals(this.mNotifiedSilenceState.getAndSet(Boolean.valueOf(isSilenced)), Boolean.valueOf(isSilenced))) {
                executor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda4
                    @Override // java.lang.Runnable
                    public final void run() {
                        AudioSource.AudioSourceCallback.this.onSilenceStateChanged(isSilenced);
                    }
                });
            }
        }
    }

    void notifySuspended(final boolean isSuspended) {
        Executor executor = this.mCallbackExecutor;
        final AudioSourceCallback callback = this.mAudioSourceCallback;
        if (executor != null && callback != null && this.mNotifiedSuspendState.getAndSet(isSuspended) != isSuspended) {
            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda9
                @Override // java.lang.Runnable
                public final void run() {
                    AudioSource.AudioSourceCallback.this.onSuspendStateChanged(isSuspended);
                }
            });
        }
    }

    void overrideBySilence(ByteBuffer byteBuffer, int sizeInBytes) {
        if (this.mZeroBytes == null || this.mZeroBytes.length < sizeInBytes) {
            this.mZeroBytes = new byte[sizeInBytes];
        }
        int positionBeforePut = byteBuffer.position();
        byteBuffer.put(this.mZeroBytes, 0, sizeInBytes);
        byteBuffer.limit(byteBuffer.position()).position(positionBeforePut);
    }

    void updateSendingAudio() {
        if (this.mState == InternalState.STARTED) {
            boolean isBufferProviderActive = this.mBufferProviderState == BufferProvider.State.ACTIVE;
            notifySuspended(isBufferProviderActive ? false : true);
            if (isBufferProviderActive) {
                startSendingAudio();
                return;
            } else {
                stopSendingAudio();
                return;
            }
        }
        stopSendingAudio();
    }

    private void startSendingAudio() {
        if (!this.mIsSendingAudio) {
            try {
                Logger.d(TAG, "startSendingAudio");
                this.mAudioStream.start();
                this.mInSilentStartState = false;
            } catch (AudioStream.AudioStreamException e) {
                Logger.w(TAG, "Failed to start AudioStream", e);
                this.mInSilentStartState = true;
                this.mSilentAudioStream.start();
                this.mLatestFailedStartTimeNs = getCurrentSystemTimeNs();
                notifySilenced();
            }
            this.mIsSendingAudio = true;
            sendNextAudio();
        }
    }

    private void stopSendingAudio() {
        if (!this.mIsSendingAudio) {
            return;
        }
        this.mIsSendingAudio = false;
        Logger.d(TAG, "stopSendingAudio");
        this.mAudioStream.stop();
    }

    void sendNextAudio() {
        Futures.addCallback(((BufferProvider) Objects.requireNonNull(this.mBufferProvider)).acquireBuffer(), (FutureCallback) Objects.requireNonNull(this.mAcquireBufferCallback), this.mExecutor);
    }

    void setState(InternalState state) {
        Logger.d(TAG, "Transitioning internal state: " + this.mState + " --> " + state);
        this.mState = state;
    }

    void postMaxAmplitude(ByteBuffer byteBuffer) {
        Executor executor = this.mCallbackExecutor;
        final AudioSourceCallback callback = this.mAudioSourceCallback;
        double maxAmplitude = AudioStats.AUDIO_AMPLITUDE_NONE;
        if (this.mAudioFormat == 2) {
            ShortBuffer shortBuffer = byteBuffer.asShortBuffer();
            while (shortBuffer.hasRemaining()) {
                maxAmplitude = Math.max(maxAmplitude, Math.abs((int) shortBuffer.get()));
            }
            this.mAudioAmplitude = maxAmplitude / 32767.0d;
            if (executor != null && callback != null) {
                executor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioSource$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        AudioSource.this.m212xdf9dee1c(callback);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$postMaxAmplitude$11$androidx-camera-video-internal-audio-AudioSource  reason: not valid java name */
    public /* synthetic */ void m212xdf9dee1c(AudioSourceCallback callback) {
        callback.onAmplitudeValue(this.mAudioAmplitude);
    }

    private static BufferProvider.State fetchBufferProviderState(BufferProvider<? extends InputBuffer> bufferProvider) {
        try {
            ListenableFuture<? extends InputBuffer> fetchData = bufferProvider.fetchData();
            if (fetchData.isDone()) {
                return (BufferProvider.State) fetchData.get();
            }
            return null;
        } catch (InterruptedException | ExecutionException e) {
            return null;
        }
    }

    public static boolean isSettingsSupported(int sampleRate, int channelCount, int audioFormat) {
        return AudioStreamImpl.isSettingsSupported(sampleRate, channelCount, audioFormat);
    }

    private static long getCurrentSystemTimeNs() {
        return System.nanoTime();
    }

    /* loaded from: classes.dex */
    public interface AudioSourceCallback {
        void onAmplitudeValue(double d);

        void onError(Throwable th);

        void onSilenceStateChanged(boolean z);

        default void onSuspendStateChanged(boolean suspended) {
        }
    }
}
