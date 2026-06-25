package androidx.camera.video.internal.audio;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioRecordingConfiguration;
import android.media.AudioTimestamp;
import android.os.Build;
import androidx.camera.core.Logger;
import androidx.camera.video.internal.audio.AudioStream;
import androidx.camera.video.internal.compat.Api23Impl;
import androidx.camera.video.internal.compat.Api24Impl;
import androidx.camera.video.internal.compat.Api29Impl;
import androidx.camera.video.internal.compat.Api31Impl;
import androidx.camera.video.internal.compat.quirk.AudioTimestampFramePositionIncorrectQuirk;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.core.util.Preconditions;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class AudioStreamImpl implements AudioStream {
    private static final String TAG = "AudioStreamImpl";
    final AudioRecord mAudioRecord;
    private AudioManager.AudioRecordingCallback mAudioRecordingCallback;
    private AudioStream.AudioStreamCallback mAudioStreamCallback;
    private final int mBufferSize;
    private final int mBytesPerFrame;
    private Executor mCallbackExecutor;
    private final AtomicBoolean mIsReleased = new AtomicBoolean(false);
    private final AtomicBoolean mIsStarted = new AtomicBoolean(false);
    private final AtomicReference<Boolean> mNotifiedSilenceState = new AtomicReference<>(null);
    private final AudioSettings mSettings;
    private long mTotalFramesRead;

    public AudioStreamImpl(AudioSettings settings, Context attributionContext) throws IllegalArgumentException, AudioStream.AudioStreamException {
        if (!isSettingsSupported(settings.getSampleRate(), settings.getChannelCount(), settings.getAudioFormat())) {
            throw new UnsupportedOperationException(String.format("The combination of sample rate %d, channel count %d and audio format %d is not supported.", Integer.valueOf(settings.getSampleRate()), Integer.valueOf(settings.getChannelCount()), Integer.valueOf(settings.getAudioFormat())));
        }
        this.mSettings = settings;
        this.mBytesPerFrame = settings.getBytesPerFrame();
        int minBufferSize = getMinBufferSize(settings.getSampleRate(), settings.getChannelCount(), settings.getAudioFormat());
        Preconditions.checkState(minBufferSize > 0);
        this.mBufferSize = minBufferSize * 2;
        AudioFormat audioFormatObj = new AudioFormat.Builder().setSampleRate(settings.getSampleRate()).setChannelMask(AudioUtils.channelCountToChannelMask(settings.getChannelCount())).setEncoding(settings.getAudioFormat()).build();
        AudioRecord.Builder audioRecordBuilder = Api23Impl.createAudioRecordBuilder();
        if (Build.VERSION.SDK_INT >= 31 && attributionContext != null) {
            Api31Impl.setContext(audioRecordBuilder, attributionContext);
        }
        Api23Impl.setAudioSource(audioRecordBuilder, settings.getAudioSource());
        Api23Impl.setAudioFormat(audioRecordBuilder, audioFormatObj);
        Api23Impl.setBufferSizeInBytes(audioRecordBuilder, this.mBufferSize);
        this.mAudioRecord = Api23Impl.build(audioRecordBuilder);
        if (this.mAudioRecord.getState() != 1) {
            this.mAudioRecord.release();
            throw new AudioStream.AudioStreamException("Unable to initialize AudioRecord");
        }
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void start() throws AudioStream.AudioStreamException {
        checkNotReleasedOrThrow();
        boolean z = true;
        if (this.mIsStarted.getAndSet(true)) {
            return;
        }
        this.mAudioRecord.startRecording();
        if (this.mAudioRecord.getRecordingState() != 3) {
            this.mIsStarted.set(false);
            throw new AudioStream.AudioStreamException("Unable to start AudioRecord with state: " + this.mAudioRecord.getRecordingState());
        }
        this.mTotalFramesRead = 0L;
        this.mNotifiedSilenceState.set(null);
        boolean isSilenced = false;
        if (Build.VERSION.SDK_INT >= 29) {
            AudioRecordingConfiguration config = Api29Impl.getActiveRecordingConfiguration(this.mAudioRecord);
            if (config == null || !Api29Impl.isClientSilenced(config)) {
                z = false;
            }
            isSilenced = z;
        }
        notifySilenced(isSilenced);
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void stop() {
        checkNotReleasedOrThrow();
        if (!this.mIsStarted.getAndSet(false)) {
            return;
        }
        this.mAudioRecord.stop();
        if (this.mAudioRecord.getRecordingState() != 1) {
            Logger.w(TAG, "Failed to stop AudioRecord with state: " + this.mAudioRecord.getRecordingState());
        }
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public void release() {
        if (this.mIsReleased.getAndSet(true)) {
            return;
        }
        if (Build.VERSION.SDK_INT >= 29 && this.mAudioRecordingCallback != null) {
            Api29Impl.unregisterAudioRecordingCallback(this.mAudioRecord, this.mAudioRecordingCallback);
        }
        this.mAudioRecord.release();
    }

    @Override // androidx.camera.video.internal.audio.AudioStream
    public AudioStream.PacketInfo read(ByteBuffer byteBuffer) {
        checkNotReleasedOrThrow();
        checkStartedOrThrow();
        int sizeInBytes = this.mAudioRecord.read(byteBuffer, this.mBufferSize);
        long timestampNs = 0;
        if (sizeInBytes > 0) {
            byteBuffer.limit(sizeInBytes);
            timestampNs = generatePresentationTimeNs();
            this.mTotalFramesRead += AudioUtils.sizeToFrameCount(sizeInBytes, this.mBytesPerFrame);
        }
        return AudioStream.PacketInfo.of(sizeInBytes, timestampNs);
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
        if (Build.VERSION.SDK_INT >= 29) {
            if (this.mAudioRecordingCallback != null) {
                Api29Impl.unregisterAudioRecordingCallback(this.mAudioRecord, this.mAudioRecordingCallback);
            }
            if (callback == null) {
                return;
            }
            if (this.mAudioRecordingCallback == null) {
                this.mAudioRecordingCallback = new AudioRecordingApi29Callback();
            }
            Api29Impl.registerAudioRecordingCallback(this.mAudioRecord, executor, this.mAudioRecordingCallback);
        }
    }

    void notifySilenced(final boolean isSilenced) {
        Executor executor = this.mCallbackExecutor;
        final AudioStream.AudioStreamCallback callback = this.mAudioStreamCallback;
        if (executor != null && callback != null && !Objects.equals(this.mNotifiedSilenceState.getAndSet(Boolean.valueOf(isSilenced)), Boolean.valueOf(isSilenced))) {
            executor.execute(new Runnable() { // from class: androidx.camera.video.internal.audio.AudioStreamImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    AudioStream.AudioStreamCallback.this.onSilenceStateChanged(isSilenced);
                }
            });
        }
    }

    private long generatePresentationTimeNs() {
        long presentationTimeNs = -1;
        if (!hasAudioTimestampQuirk()) {
            AudioTimestamp audioTimestamp = new AudioTimestamp();
            if (Api24Impl.getTimestamp(this.mAudioRecord, audioTimestamp, 0) == 0) {
                presentationTimeNs = computeInterpolatedTimeNs(this.mSettings.getSampleRate(), this.mTotalFramesRead, audioTimestamp);
            } else {
                Logger.w(TAG, "Unable to get audio timestamp");
            }
        }
        if (presentationTimeNs == -1) {
            return System.nanoTime();
        }
        return presentationTimeNs;
    }

    private void checkNotReleasedOrThrow() {
        Preconditions.checkState(!this.mIsReleased.get(), "AudioStream has been released.");
    }

    private void checkStartedOrThrow() {
        Preconditions.checkState(this.mIsStarted.get(), "AudioStream has not been started.");
    }

    public static boolean isSettingsSupported(int sampleRate, int channelCount, int audioFormat) {
        return sampleRate > 0 && channelCount > 0 && getMinBufferSize(sampleRate, channelCount, audioFormat) > 0;
    }

    private static boolean hasAudioTimestampQuirk() {
        return DeviceQuirks.get(AudioTimestampFramePositionIncorrectQuirk.class) != null;
    }

    private static long computeInterpolatedTimeNs(int sampleRate, long framePosition, AudioTimestamp timestamp) {
        long frameDiff = framePosition - timestamp.framePosition;
        long compensateTimeInNanoSec = AudioUtils.frameCountToDurationNs(frameDiff, sampleRate);
        long resultInNanoSec = timestamp.nanoTime + compensateTimeInNanoSec;
        if (resultInNanoSec < 0) {
            return 0L;
        }
        return resultInNanoSec;
    }

    private static int getMinBufferSize(int sampleRate, int channelCount, int audioFormat) {
        return AudioRecord.getMinBufferSize(sampleRate, AudioUtils.channelCountToChannelConfig(channelCount), audioFormat);
    }

    /* loaded from: classes.dex */
    class AudioRecordingApi29Callback extends AudioManager.AudioRecordingCallback {
        AudioRecordingApi29Callback() {
        }

        @Override // android.media.AudioManager.AudioRecordingCallback
        public void onRecordingConfigChanged(List<AudioRecordingConfiguration> configs) {
            for (AudioRecordingConfiguration config : configs) {
                if (Api24Impl.getClientAudioSessionId(config) == AudioStreamImpl.this.mAudioRecord.getAudioSessionId()) {
                    boolean isSilenced = Api29Impl.isClientSilenced(config);
                    AudioStreamImpl.this.notifySilenced(isSilenced);
                    return;
                }
            }
        }
    }
}
