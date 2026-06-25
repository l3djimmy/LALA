package androidx.camera.video;

import androidx.camera.core.impl.utils.CloseGuardHelper;
import androidx.core.util.Preconditions;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public final class Recording implements AutoCloseable {
    private final boolean mIsPersistent;
    private final OutputOptions mOutputOptions;
    private final Recorder mRecorder;
    private final long mRecordingId;
    private final AtomicBoolean mIsClosed = new AtomicBoolean(false);
    private final CloseGuardHelper mCloseGuard = CloseGuardHelper.create();

    Recording(Recorder recorder, long recordingId, OutputOptions options, boolean isPersistent, boolean finalizedOnCreation) {
        this.mRecorder = recorder;
        this.mRecordingId = recordingId;
        this.mOutputOptions = options;
        this.mIsPersistent = isPersistent;
        if (finalizedOnCreation) {
            this.mIsClosed.set(true);
        } else {
            this.mCloseGuard.open("stop");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Recording from(PendingRecording pendingRecording, long recordingId) {
        Preconditions.checkNotNull(pendingRecording, "The given PendingRecording cannot be null.");
        return new Recording(pendingRecording.getRecorder(), recordingId, pendingRecording.getOutputOptions(), pendingRecording.isPersistent(), false);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Recording createFinalizedFrom(PendingRecording pendingRecording, long recordingId) {
        Preconditions.checkNotNull(pendingRecording, "The given PendingRecording cannot be null.");
        return new Recording(pendingRecording.getRecorder(), recordingId, pendingRecording.getOutputOptions(), pendingRecording.isPersistent(), true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public OutputOptions getOutputOptions() {
        return this.mOutputOptions;
    }

    public boolean isPersistent() {
        return this.mIsPersistent;
    }

    public void pause() {
        if (this.mIsClosed.get()) {
            throw new IllegalStateException("The recording has been stopped.");
        }
        this.mRecorder.pause(this);
    }

    public void resume() {
        if (this.mIsClosed.get()) {
            throw new IllegalStateException("The recording has been stopped.");
        }
        this.mRecorder.resume(this);
    }

    public void stop() {
        close();
    }

    public void mute(boolean muted) {
        if (this.mIsClosed.get()) {
            throw new IllegalStateException("The recording has been stopped.");
        }
        this.mRecorder.mute(this, muted);
    }

    @Override // java.lang.AutoCloseable
    public void close() {
        stopWithError(0, null);
    }

    protected void finalize() throws Throwable {
        try {
            this.mCloseGuard.warnIfOpen();
            stopWithError(10, new RuntimeException("Recording stopped due to being garbage collected."));
        } finally {
            super.finalize();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getRecordingId() {
        return this.mRecordingId;
    }

    public boolean isClosed() {
        return this.mIsClosed.get();
    }

    private void stopWithError(int error, Throwable errorCause) {
        this.mCloseGuard.close();
        if (this.mIsClosed.getAndSet(true)) {
            return;
        }
        this.mRecorder.stop(this, error, errorCause);
    }
}
