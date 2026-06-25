package androidx.camera.video.internal.audio;

import androidx.camera.core.Logger;
import androidx.camera.video.internal.audio.AudioStream;
import androidx.core.util.Preconditions;
import java.nio.ByteBuffer;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class SilentAudioStream implements AudioStream {
    private static final String TAG = "SilentAudioStream";
    private AudioStream.AudioStreamCallback mAudioStreamCallback;
    private final int mBytesPerFrame;
    private Executor mCallbackExecutor;
    private long mCurrentReadTimeNs;
    private final int mSampleRate;
    private byte[] mZeroBytes;
    private final AtomicBoolean mIsStarted = new AtomicBoolean(false);
    private final AtomicBoolean mIsReleased = new AtomicBoolean(false);

    public SilentAudioStream(AudioSettings audioSettings) {
        this.mBytesPerFrame = audioSettings.getBytesPerFrame();
        this.mSampleRate = audioSettings.getSampleRate();
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void setCallback(AudioStream.AudioStreamCallback callback, Executor executor) {
        boolean z = true;
        Preconditions.checkState(!this.mIsStarted.get(), "AudioStream can not be started when setCallback.");
        checkNotReleasedOrThrow();
        if (callback != null && executor == null) {
            z = false;
        }
        Preconditions.checkArgument(z, "executor can't be null with non-null callback.");
        this.mAudioStreamCallback = callback;
        this.mCallbackExecutor = executor;
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void start() {
        checkNotReleasedOrThrow();
        if (this.mIsStarted.getAndSet(true)) {
            return;
        }
        this.mCurrentReadTimeNs = currentSystemTimeNs();
        notifySilenced();
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void stop() {
        checkNotReleasedOrThrow();
        this.mIsStarted.set(false);
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void release() {
        this.mIsReleased.getAndSet(true);
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public AudioStream.PacketInfo read(ByteBuffer byteBuffer) {
        checkNotReleasedOrThrow();
        checkStartedOrThrow();
        long requiredFrameCount = AudioUtils.sizeToFrameCount(byteBuffer.remaining(), this.mBytesPerFrame);
        int requiredSize = (int) AudioUtils.frameCountToSize(requiredFrameCount, this.mBytesPerFrame);
        if (requiredSize <= 0) {
            return AudioStream.PacketInfo.of(0, this.mCurrentReadTimeNs);
        }
        long requiredDurationNs = AudioUtils.frameCountToDurationNs(requiredFrameCount, this.mSampleRate);
        long nextReadTimeNs = this.mCurrentReadTimeNs + requiredDurationNs;
        blockUntilSystemTimeReached(nextReadTimeNs);
        writeSilenceToBuffer(byteBuffer, requiredSize);
        AudioStream.PacketInfo packetInfo = AudioStream.PacketInfo.of(requiredSize, this.mCurrentReadTimeNs);
        this.mCurrentReadTimeNs = nextReadTimeNs;
        return packetInfo;
    }

    private void writeSilenceToBuffer(ByteBuffer byteBuffer, int sizeInBytes) {
        Preconditions.checkState(sizeInBytes <= byteBuffer.remaining());
        if (this.mZeroBytes == null || this.mZeroBytes.length < sizeInBytes) {
            this.mZeroBytes = new byte[sizeInBytes];
        }
        int originalPosition = byteBuffer.position();
        byteBuffer.put(this.mZeroBytes, 0, sizeInBytes).limit(originalPosition + sizeInBytes).position(originalPosition);
    }

    private void notifySilenced() {
        final AudioStream.AudioStreamCallback callback = this.mAudioStreamCallback;
        Executor executor = this.mCallbackExecutor;
        if (callback != null && executor != null) {
            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.SilentAudioStream$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AudioStream.AudioStreamCallback.this.onSilenceStateChanged(true);
                }
            });
        }
    }

    private void checkNotReleasedOrThrow() {
        Preconditions.checkState(!this.mIsReleased.get(), "AudioStream has been released.");
    }

    private void checkStartedOrThrow() {
        Preconditions.checkState(this.mIsStarted.get(), "AudioStream has not been started.");
    }

    private static long currentSystemTimeNs() {
        return System.nanoTime();
    }

    private static void blockUntilSystemTimeReached(long nextReadTimeNs) {
        long requiredBlockTimeNs = nextReadTimeNs - currentSystemTimeNs();
        if (requiredBlockTimeNs > 0) {
            try {
                Thread.sleep(TimeUnit.NANOSECONDS.toMillis(requiredBlockTimeNs));
            } catch (InterruptedException e) {
                Logger.w(TAG, "Ignore interruption", e);
            }
        }
    }
}
