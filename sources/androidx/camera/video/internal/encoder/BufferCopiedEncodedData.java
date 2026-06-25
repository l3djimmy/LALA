package androidx.camera.video.internal.encoder;

import android.media.MediaCodec;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class BufferCopiedEncodedData implements EncodedData {
    private final MediaCodec.BufferInfo mBufferInfo;
    private final ByteBuffer mByteBuffer;
    private final CallbackToFutureAdapter.Completer<Void> mClosedCompleter;
    private final ListenableFuture<Void> mClosedFuture;

    public BufferCopiedEncodedData(EncodedData encodedData) {
        this.mBufferInfo = generateCopiedByteInfo(encodedData);
        this.mByteBuffer = generateCopiedByteBuffer(encodedData);
        final AtomicReference<CallbackToFutureAdapter.Completer<Void>> ref = new AtomicReference<>();
        this.mClosedFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.internal.encoder.BufferCopiedEncodedData$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return BufferCopiedEncodedData.lambda$new$0(ref, completer);
            }
        });
        this.mClosedCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(ref.get());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$0(AtomicReference ref, CallbackToFutureAdapter.Completer completer) throws Exception {
        ref.set(completer);
        return "Data closed";
    }

    private MediaCodec.BufferInfo generateCopiedByteInfo(EncodedData encodedData) {
        MediaCodec.BufferInfo bufferInfo = encodedData.getBufferInfo();
        MediaCodec.BufferInfo copiedBufferInfo = new MediaCodec.BufferInfo();
        copiedBufferInfo.set(0, bufferInfo.size, bufferInfo.presentationTimeUs, bufferInfo.flags);
        return copiedBufferInfo;
    }

    private ByteBuffer generateCopiedByteBuffer(EncodedData encodedData) {
        ByteBuffer byteBuffer = encodedData.getByteBuffer();
        MediaCodec.BufferInfo bufferInfo = encodedData.getBufferInfo();
        byteBuffer.position(bufferInfo.offset);
        byteBuffer.limit(bufferInfo.offset + bufferInfo.size);
        ByteBuffer copiedByteBuffer = ByteBuffer.allocate(bufferInfo.size);
        copiedByteBuffer.order(byteBuffer.order());
        copiedByteBuffer.put(byteBuffer);
        copiedByteBuffer.flip();
        return copiedByteBuffer;
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public ByteBuffer getByteBuffer() {
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
        this.mClosedCompleter.set(null);
    }

    @Override // androidx.camera.video.internal.encoder.EncodedData
    public ListenableFuture<Void> getClosedFuture() {
        return Futures.nonCancellationPropagating(this.mClosedFuture);
    }
}
