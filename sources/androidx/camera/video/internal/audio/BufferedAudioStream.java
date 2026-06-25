package androidx.camera.video.internal.audio;

import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.video.internal.audio.AudioStream;
import androidx.core.util.Preconditions;
import java.nio.ByteBuffer;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class BufferedAudioStream implements AudioStream {
    private static final int DATA_WAITING_TIME_MILLIS = 1;
    private static final int DEFAULT_BUFFER_SIZE_IN_FRAME = 1024;
    private static final int DEFAULT_QUEUE_SIZE = 500;
    private static final String TAG = "BufferedAudioStream";
    private final AudioStream mAudioStream;
    private int mBufferSize;
    private final int mBytesPerFrame;
    private final int mQueueMaxSize;
    private final int mSampleRate;
    private final AtomicBoolean mIsStarted = new AtomicBoolean(false);
    private final AtomicBoolean mIsReleased = new AtomicBoolean(false);
    private final Queue<AudioData> mAudioDataQueue = new ConcurrentLinkedQueue();
    private final Executor mProducerExecutor = CameraXExecutors.newSequentialExecutor(CameraXExecutors.audioExecutor());
    private final Object mLock = new Object();
    private AudioData mAudioDataNotFullyRead = null;
    private final AtomicBoolean mIsCollectingAudioData = new AtomicBoolean(false);

    public BufferedAudioStream(AudioStream audioStream, AudioSettings audioSettings) {
        this.mAudioStream = audioStream;
        this.mBytesPerFrame = audioSettings.getBytesPerFrame();
        this.mSampleRate = audioSettings.getSampleRate();
        Preconditions.checkArgument(((long) this.mBytesPerFrame) > 0, "mBytesPerFrame must be greater than 0.");
        Preconditions.checkArgument(((long) this.mSampleRate) > 0, "mSampleRate must be greater than 0.");
        this.mQueueMaxSize = 500;
        this.mBufferSize = this.mBytesPerFrame * 1024;
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void start() throws AudioStream.AudioStreamException, IllegalStateException {
        checkNotReleasedOrThrow();
        if (this.mIsStarted.getAndSet(true)) {
            return;
        }
        RunnableFuture<Void> startTask = new FutureTask<>(new Runnable() { // from class: androidx.camera.video.internal.audio.BufferedAudioStream$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                BufferedAudioStream.this.m222x4e044ff9();
            }
        }, null);
        this.mProducerExecutor.execute(startTask);
        try {
            startTask.get();
        } catch (InterruptedException | ExecutionException e) {
            this.mIsStarted.set(false);
            throw new AudioStream.AudioStreamException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$start$0$androidx-camera-video-internal-audio-BufferedAudioStream  reason: not valid java name */
    public /* synthetic */ void m222x4e044ff9() {
        try {
            this.mAudioStream.start();
            startCollectingAudioData();
        } catch (AudioStream.AudioStreamException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void stop() throws IllegalStateException {
        checkNotReleasedOrThrow();
        if (!this.mIsStarted.getAndSet(false)) {
            return;
        }
        this.mProducerExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.BufferedAudioStream$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                BufferedAudioStream.this.m223xb26ac95e();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$stop$1$androidx-camera-video-internal-audio-BufferedAudioStream  reason: not valid java name */
    public /* synthetic */ void m223xb26ac95e() {
        this.mIsCollectingAudioData.set(false);
        this.mAudioStream.stop();
        synchronized (this.mLock) {
            this.mAudioDataNotFullyRead = null;
            this.mAudioDataQueue.clear();
        }
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void release() {
        if (this.mIsReleased.getAndSet(true)) {
            return;
        }
        this.mProducerExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.BufferedAudioStream$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                BufferedAudioStream.this.m220x4385f432();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$2$androidx-camera-video-internal-audio-BufferedAudioStream  reason: not valid java name */
    public /* synthetic */ void m220x4385f432() {
        this.mIsCollectingAudioData.set(false);
        this.mAudioStream.release();
        synchronized (this.mLock) {
            this.mAudioDataNotFullyRead = null;
            this.mAudioDataQueue.clear();
        }
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public AudioStream.PacketInfo read(ByteBuffer byteBuffer) {
        boolean isWaitingForData;
        checkNotReleasedOrThrow();
        checkStartedOrThrow();
        updateCollectionBufferSizeAsync(byteBuffer.remaining());
        AudioStream.PacketInfo packetInfo = AudioStream.PacketInfo.of(0, 0L);
        do {
            synchronized (this.mLock) {
                AudioData audioData = this.mAudioDataNotFullyRead;
                this.mAudioDataNotFullyRead = null;
                if (audioData == null) {
                    audioData = this.mAudioDataQueue.poll();
                }
                if (audioData != null) {
                    packetInfo = audioData.read(byteBuffer);
                    if (audioData.getRemainingBufferSizeInBytes() > 0) {
                        this.mAudioDataNotFullyRead = audioData;
                    }
                }
            }
            isWaitingForData = packetInfo.getSizeInBytes() <= 0 && this.mIsStarted.get() && !this.mIsReleased.get();
            if (isWaitingForData) {
                try {
                    Thread.sleep(1L);
                } catch (InterruptedException e) {
                    Logger.w(TAG, "Interruption while waiting for audio data", e);
                }
            }
        } while (isWaitingForData);
        return packetInfo;
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void setCallback(final AudioStream.AudioStreamCallback callback, final Executor executor) {
        boolean z = true;
        Preconditions.checkState(!this.mIsStarted.get(), "AudioStream can not be started when setCallback.");
        checkNotReleasedOrThrow();
        if (callback != null && executor == null) {
            z = false;
        }
        Preconditions.checkArgument(z, "executor can't be null with non-null callback.");
        this.mProducerExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.BufferedAudioStream$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                BufferedAudioStream.this.m221xf8dcf611(callback, executor);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setCallback$3$androidx-camera-video-internal-audio-BufferedAudioStream  reason: not valid java name */
    public /* synthetic */ void m221xf8dcf611(AudioStream.AudioStreamCallback callback, Executor executor) {
        this.mAudioStream.setCallback(callback, executor);
    }

    private void checkNotReleasedOrThrow() {
        Preconditions.checkState(!this.mIsReleased.get(), "AudioStream has been released.");
    }

    private void checkStartedOrThrow() {
        Preconditions.checkState(this.mIsStarted.get(), "AudioStream has not been started.");
    }

    private void updateCollectionBufferSizeAsync(final int bufferSize) {
        this.mProducerExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.BufferedAudioStream$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                BufferedAudioStream.this.m224x75a1ac03(bufferSize);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: updateCollectionBufferSize */
    public void m224x75a1ac03(int bufferSize) {
        if (this.mBufferSize == bufferSize) {
            return;
        }
        int originalBufferSize = this.mBufferSize;
        int newFrameSize = bufferSize / this.mBytesPerFrame;
        this.mBufferSize = this.mBytesPerFrame * newFrameSize;
        Logger.d(TAG, "Update buffer size from " + originalBufferSize + " to " + this.mBufferSize);
    }

    private void startCollectingAudioData() {
        if (this.mIsCollectingAudioData.getAndSet(true)) {
            return;
        }
        collectAudioData();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void collectAudioData() {
        if (!this.mIsCollectingAudioData.get()) {
            return;
        }
        ByteBuffer byteBuffer = ByteBuffer.allocateDirect(this.mBufferSize);
        AudioStream.PacketInfo packetInfo = this.mAudioStream.read(byteBuffer);
        AudioData audioData = new AudioData(byteBuffer, packetInfo, this.mBytesPerFrame, this.mSampleRate);
        int queueMaxSize = this.mQueueMaxSize;
        synchronized (this.mLock) {
            this.mAudioDataQueue.offer(audioData);
            while (this.mAudioDataQueue.size() > queueMaxSize) {
                this.mAudioDataQueue.poll();
                Logger.w(TAG, "Drop audio data due to full of queue.");
            }
        }
        if (this.mIsCollectingAudioData.get()) {
            this.mProducerExecutor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.BufferedAudioStream$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    BufferedAudioStream.this.collectAudioData();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class AudioData {
        private final ByteBuffer mByteBuffer;
        private final int mBytesPerFrame;
        private final int mSampleRate;
        private long mTimestampNs;

        AudioData(ByteBuffer byteBuffer, AudioStream.PacketInfo packetInfo, int bytesPerFrame, int sampleRate) {
            byteBuffer.rewind();
            int bufferSize = byteBuffer.limit() - byteBuffer.position();
            if (bufferSize != packetInfo.getSizeInBytes()) {
                throw new IllegalStateException("Byte buffer size is not match with packet info: " + bufferSize + " != " + packetInfo.getSizeInBytes());
            }
            this.mBytesPerFrame = bytesPerFrame;
            this.mSampleRate = sampleRate;
            this.mByteBuffer = byteBuffer;
            this.mTimestampNs = packetInfo.getTimestampNs();
        }

        public int getRemainingBufferSizeInBytes() {
            return this.mByteBuffer.remaining();
        }

        public AudioStream.PacketInfo read(ByteBuffer byteBuffer) {
            int readSizeInBytes;
            long timestampNs = this.mTimestampNs;
            int originalSourcePosition = this.mByteBuffer.position();
            int originalDestinationPosition = byteBuffer.position();
            if (this.mByteBuffer.remaining() > byteBuffer.remaining()) {
                readSizeInBytes = byteBuffer.remaining();
                long readFrames = AudioUtils.sizeToFrameCount(readSizeInBytes, this.mBytesPerFrame);
                long readDurationNs = AudioUtils.frameCountToDurationNs(readFrames, this.mSampleRate);
                this.mTimestampNs += readDurationNs;
                ByteBuffer duplicatedByteBuffer = this.mByteBuffer.duplicate();
                duplicatedByteBuffer.position(originalSourcePosition).limit(originalSourcePosition + readSizeInBytes);
                byteBuffer.put(duplicatedByteBuffer).limit(originalDestinationPosition + readSizeInBytes).position(originalDestinationPosition);
            } else {
                readSizeInBytes = this.mByteBuffer.remaining();
                byteBuffer.put(this.mByteBuffer).limit(originalDestinationPosition + readSizeInBytes).position(originalDestinationPosition);
            }
            this.mByteBuffer.position(originalSourcePosition + readSizeInBytes);
            return AudioStream.PacketInfo.of(readSizeInBytes, timestampNs);
        }
    }
}
