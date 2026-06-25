package androidx.camera.video.internal.encoder;

import android.media.MediaCodec;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class InputBufferImpl implements InputBuffer {
    private final int mBufferIndex;
    private final ByteBuffer mByteBuffer;
    private final MediaCodec mMediaCodec;
    private final CallbackToFutureAdapter.Completer<Void> mTerminationCompleter;
    private final ListenableFuture<Void> mTerminationFuture;
    private final AtomicBoolean mTerminated = new AtomicBoolean(false);
    private long mPresentationTimeUs = 0;
    private boolean mIsEndOfStream = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public InputBufferImpl(MediaCodec mediaCodec, int bufferIndex) throws MediaCodec.CodecException {
        this.mMediaCodec = (MediaCodec) Preconditions.checkNotNull(mediaCodec);
        this.mBufferIndex = Preconditions.checkArgumentNonnegative(bufferIndex);
        this.mByteBuffer = mediaCodec.getInputBuffer(bufferIndex);
        final AtomicReference<CallbackToFutureAdapter.Completer<Void>> ref = new AtomicReference<>();
        this.mTerminationFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.InputBufferImpl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return InputBufferImpl.lambda$new$0(ref, completer);
            }
        });
        this.mTerminationCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(ref.get());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$0(AtomicReference ref, CallbackToFutureAdapter.Completer completer) throws Exception {
        ref.set(completer);
        return "Terminate InputBuffer";
    }

    @Override // androidx.camera.video.internal.encoder.InputBuffer
    public ByteBuffer getByteBuffer() {
        throwIfTerminated();
        return this.mByteBuffer;
    }

    @Override // androidx.camera.video.internal.encoder.InputBuffer
    public void setPresentationTimeUs(long presentationTimeUs) {
        throwIfTerminated();
        Preconditions.checkArgument(presentationTimeUs >= 0);
        this.mPresentationTimeUs = presentationTimeUs;
    }

    @Override // androidx.camera.video.internal.encoder.InputBuffer
    public void setEndOfStream(boolean endOfStream) {
        throwIfTerminated();
        this.mIsEndOfStream = endOfStream;
    }

    @Override // androidx.camera.video.internal.encoder.InputBuffer
    public boolean submit() {
        if (this.mTerminated.getAndSet(true)) {
            return false;
        }
        try {
            this.mMediaCodec.queueInputBuffer(this.mBufferIndex, this.mByteBuffer.position(), this.mByteBuffer.limit(), this.mPresentationTimeUs, this.mIsEndOfStream ? 4 : 0);
            this.mTerminationCompleter.set(null);
            return true;
        } catch (IllegalStateException e) {
            this.mTerminationCompleter.setException(e);
            return false;
        }
    }

    @Override // androidx.camera.video.internal.encoder.InputBuffer
    public boolean cancel() {
        if (this.mTerminated.getAndSet(true)) {
            return false;
        }
        try {
            this.mMediaCodec.queueInputBuffer(this.mBufferIndex, 0, 0, 0L, 0);
            this.mTerminationCompleter.set(null);
        } catch (IllegalStateException e) {
            this.mTerminationCompleter.setException(e);
        }
        return true;
    }

    @Override // androidx.camera.video.internal.encoder.InputBuffer
    public ListenableFuture<Void> getTerminationFuture() {
        return Futures.nonCancellationPropagating(this.mTerminationFuture);
    }

    private void throwIfTerminated() {
        if (this.mTerminated.get()) {
            throw new IllegalStateException("The buffer is submitted or canceled.");
        }
    }
}
