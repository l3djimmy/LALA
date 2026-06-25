package androidx.camera.video.internal;

import androidx.camera.core.Logger;
import androidx.core.util.Pair;
import androidx.core.util.Preconditions;
import java.io.Closeable;
import java.nio.ByteBuffer;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public final class SharedByteBuffer implements Closeable {
    private static final String TAG = "SharedByteBuffer";
    private final Object mCloseLock = new Object();
    private boolean mClosed = false;
    private final Pair<Executor, Runnable> mFinalCloseAction;
    private final int mShareId;
    private final ByteBuffer mSharedByteBuffer;
    private final AtomicInteger mSharedRefCount;

    static SharedByteBuffer newSharedInstance(ByteBuffer sharedBuf, Executor closeActionExecutor, Runnable finalCloseAction) {
        AtomicInteger sharedRefCount = new AtomicInteger(1);
        int shareId = System.identityHashCode(sharedBuf);
        ByteBuffer readOnlyBuf = ((ByteBuffer) Preconditions.checkNotNull(sharedBuf)).asReadOnlyBuffer();
        return new SharedByteBuffer(readOnlyBuf, sharedRefCount, new Pair((Executor) Preconditions.checkNotNull(closeActionExecutor), (Runnable) Preconditions.checkNotNull(finalCloseAction)), shareId);
    }

    private SharedByteBuffer(ByteBuffer sharedBuf, AtomicInteger sharedRefCount, Pair<Executor, Runnable> finalCloseAction, int shareId) {
        int refCount;
        this.mSharedByteBuffer = sharedBuf;
        this.mSharedRefCount = sharedRefCount;
        this.mFinalCloseAction = finalCloseAction;
        this.mShareId = shareId;
        if (Logger.isDebugEnabled(TAG) && (refCount = sharedRefCount.get()) < 1) {
            throw new AssertionError(String.format(Locale.US, "Cannot create new instance of SharedByteBuffer with invalid ref count %d. Ref count must be >= 1. [%s]", Integer.valueOf(refCount), toString()));
        }
    }

    SharedByteBuffer share() {
        int newRefCount;
        AtomicInteger sharedRefCountLocal;
        synchronized (this.mCloseLock) {
            checkNotClosed("share()");
            newRefCount = this.mSharedRefCount.incrementAndGet();
            sharedRefCountLocal = this.mSharedRefCount;
        }
        if (Logger.isDebugEnabled(TAG)) {
            if (newRefCount <= 1) {
                throw new AssertionError("Invalid ref count. share() should always produce a ref count of 2 or more.");
            }
            Logger.d(TAG, String.format(Locale.US, "Ref count incremented: %d [%s]", Integer.valueOf(newRefCount), toString()));
        }
        return new SharedByteBuffer(this.mSharedByteBuffer.asReadOnlyBuffer(), sharedRefCountLocal, this.mFinalCloseAction, this.mShareId);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        closeInternal();
    }

    public ByteBuffer get() {
        ByteBuffer byteBuffer;
        synchronized (this.mCloseLock) {
            checkNotClosed("get()");
            byteBuffer = this.mSharedByteBuffer;
        }
        return byteBuffer;
    }

    private void checkNotClosed(String caller) {
        if (this.mClosed) {
            throw new IllegalStateException("Cannot call " + caller + " on a closed SharedByteBuffer.");
        }
    }

    public String toString() {
        return String.format(Locale.US, "SharedByteBuffer[buf: %s, shareId: 0x%x, instanceId:0x%x]", this.mSharedByteBuffer, Integer.valueOf(this.mShareId), Integer.valueOf(System.identityHashCode(this)));
    }

    protected void finalize() throws Throwable {
        try {
            if (closeInternal()) {
                Logger.w(TAG, String.format(Locale.US, "SharedByteBuffer closed by finalizer, but should have been closed manually with SharedByteBuffer.close() [%s]", toString()));
            }
        } finally {
            super.finalize();
        }
    }

    private boolean closeInternal() {
        synchronized (this.mCloseLock) {
            if (this.mClosed) {
                return false;
            }
            this.mClosed = true;
            int newRefCount = this.mSharedRefCount.decrementAndGet();
            if (Logger.isDebugEnabled(TAG)) {
                if (newRefCount < 0) {
                    throw new AssertionError("Invalid ref count. close() should never produce a ref count below 0");
                }
                Logger.d(TAG, String.format(Locale.US, "Ref count decremented: %d [%s]", Integer.valueOf(newRefCount), toString()));
            }
            if (newRefCount == 0) {
                if (Logger.isDebugEnabled(TAG)) {
                    Logger.d(TAG, String.format(Locale.US, "Final reference released. Running final close action. [%s]", toString()));
                }
                try {
                    Executor executor = (Executor) Preconditions.checkNotNull(this.mFinalCloseAction.first);
                    Runnable runnable = (Runnable) Preconditions.checkNotNull(this.mFinalCloseAction.second);
                    executor.execute(runnable);
                } catch (RejectedExecutionException e) {
                    Logger.e(TAG, String.format(Locale.US, "Unable to execute final close action. [%s]", toString()), e);
                }
            }
            return true;
        }
    }
}
