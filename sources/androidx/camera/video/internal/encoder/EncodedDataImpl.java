package androidx.camera.video.internal.encoder;

import android.media.MediaCodec;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class EncodedDataImpl implements EncodedData {
    private final int mBufferIndex;
    private final MediaCodec.BufferInfo mBufferInfo;
    private final ByteBuffer mByteBuffer;
    private final AtomicBoolean mClosed = new AtomicBoolean(false);
    private final CallbackToFutureAdapter.Completer<Void> mClosedCompleter;
    private final ListenableFuture<Void> mClosedFuture;
    private final MediaCodec mMediaCodec;

    /* JADX INFO: Access modifiers changed from: package-private */
    public EncodedDataImpl(MediaCodec mediaCodec, int bufferIndex, MediaCodec.BufferInfo bufferInfo) throws MediaCodec.CodecException {
        this.mMediaCodec = (MediaCodec) Preconditions.checkNotNull(mediaCodec);
        this.mBufferIndex = bufferIndex;
        this.mByteBuffer = mediaCodec.getOutputBuffer(bufferIndex);
        this.mBufferInfo = (MediaCodec.BufferInfo) Preconditions.checkNotNull(bufferInfo);
        final AtomicReference<CallbackToFutureAdapter.Completer<Void>> ref = new AtomicReference<>();
        this.mClosedFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.EncodedDataImpl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return EncodedDataImpl.lambda$new$0(ref, completer);
            }
        });
        this.mClosedCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(ref.get());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$0(AtomicReference ref, CallbackToFutureAdapter.Completer completer) throws Exception {
        ref.set(completer);
        return "Data closed";
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public ByteBuffer getByteBuffer() {
        throwIfClosed();
        this.mByteBuffer.position(this.mBufferInfo.offset);
        this.mByteBuffer.limit(this.mBufferInfo.offset + this.mBufferInfo.size);
        return this.mByteBuffer;
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public MediaCodec.BufferInfo getBufferInfo() {
        return this.mBufferInfo;
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public long getPresentationTimeUs() {
        return this.mBufferInfo.presentationTimeUs;
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public long size() {
        return this.mBufferInfo.size;
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public boolean isKeyFrame() {
        return (this.mBufferInfo.flags & 1) != 0;
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData, java.lang.AutoCloseable
    public void close() {
        if (this.mClosed.getAndSet(true)) {
            return;
        }
        try {
            this.mMediaCodec.releaseOutputBuffer(this.mBufferIndex, false);
            this.mClosedCompleter.set(null);
        } catch (IllegalStateException e) {
            this.mClosedCompleter.setException(e);
        }
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public ListenableFuture<Void> getClosedFuture() {
        return Futures.nonCancellationPropagating(this.mClosedFuture);
    }

    private void throwIfClosed() {
        if (this.mClosed.get()) {
            throw new IllegalStateException("encoded data is closed.");
        }
    }
}
