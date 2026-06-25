package androidx.camera.core.impl;

import android.util.Log;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public abstract class DeferrableSurface {
    private CallbackToFutureAdapter.Completer<Void> mCloseCompleter;
    private final ListenableFuture<Void> mCloseFuture;
    private boolean mClosed;
    Class<?> mContainerClass;
    private final Object mLock;
    private final Size mPrescribedSize;
    private final int mPrescribedStreamFormat;
    private CallbackToFutureAdapter.Completer<Void> mTerminationCompleter;
    private final ListenableFuture<Void> mTerminationFuture;
    private int mUseCount;
    public static final Size SIZE_UNDEFINED = new Size(0, 0);
    private static final String TAG = "DeferrableSurface";
    private static final boolean DEBUG = Logger.isDebugEnabled(TAG);
    private static final AtomicInteger USED_COUNT = new AtomicInteger(0);
    private static final AtomicInteger TOTAL_COUNT = new AtomicInteger(0);

    protected abstract ListenableFuture<Surface> provideSurface();

    /* loaded from: classes.dex */
    public static final class SurfaceUnavailableException extends Exception {
        public SurfaceUnavailableException(String message) {
            super(message);
        }
    }

    /* loaded from: classes.dex */
    public static final class SurfaceClosedException extends Exception {
        DeferrableSurface mDeferrableSurface;

        public SurfaceClosedException(String s, DeferrableSurface surface) {
            super(s);
            this.mDeferrableSurface = surface;
        }

        public DeferrableSurface getDeferrableSurface() {
            return this.mDeferrableSurface;
        }
    }

    public DeferrableSurface() {
        this(SIZE_UNDEFINED, 0);
    }

    public DeferrableSurface(Size size, int format) {
        this.mLock = new Object();
        this.mUseCount = 0;
        this.mClosed = false;
        this.mPrescribedSize = size;
        this.mPrescribedStreamFormat = format;
        this.mTerminationFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.impl.DeferrableSurface$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DeferrableSurface.this.m147lambda$new$0$androidxcameracoreimplDeferrableSurface(completer);
            }
        });
        this.mCloseFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.impl.DeferrableSurface$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DeferrableSurface.this.m148lambda$new$1$androidxcameracoreimplDeferrableSurface(completer);
            }
        });
        if (Logger.isDebugEnabled(TAG)) {
            printGlobalDebugCounts("Surface created", TOTAL_COUNT.incrementAndGet(), USED_COUNT.get());
            final String creationStackTrace = Log.getStackTraceString(new Exception());
            this.mTerminationFuture.addListener(new Runnable() { // from class: androidx.camera.core.impl.DeferrableSurface$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    DeferrableSurface.this.m149lambda$new$2$androidxcameracoreimplDeferrableSurface(creationStackTrace);
                }
            }, CameraXExecutors.directExecutor());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-core-impl-DeferrableSurface  reason: not valid java name */
    public /* synthetic */ Object m147lambda$new$0$androidxcameracoreimplDeferrableSurface(CallbackToFutureAdapter.Completer completer) throws Exception {
        synchronized (this.mLock) {
            this.mTerminationCompleter = completer;
        }
        return "DeferrableSurface-termination(" + this + ")";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$1$androidx-camera-core-impl-DeferrableSurface  reason: not valid java name */
    public /* synthetic */ Object m148lambda$new$1$androidxcameracoreimplDeferrableSurface(CallbackToFutureAdapter.Completer completer) throws Exception {
        synchronized (this.mLock) {
            this.mCloseCompleter = completer;
        }
        return "DeferrableSurface-close(" + this + ")";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$2$androidx-camera-core-impl-DeferrableSurface  reason: not valid java name */
    public /* synthetic */ void m149lambda$new$2$androidxcameracoreimplDeferrableSurface(String creationStackTrace) {
        try {
            this.mTerminationFuture.get();
            printGlobalDebugCounts("Surface terminated", TOTAL_COUNT.decrementAndGet(), USED_COUNT.get());
        } catch (Exception e) {
            Logger.e(TAG, "Unexpected surface termination for " + this + "\nStack Trace:\n" + creationStackTrace);
            synchronized (this.mLock) {
                throw new IllegalArgumentException(String.format("DeferrableSurface %s [closed: %b, use_count: %s] terminated with unexpected exception.", this, Boolean.valueOf(this.mClosed), Integer.valueOf(this.mUseCount)), e);
            }
        }
    }

    private void printGlobalDebugCounts(String prefix, int totalCount, int useCount) {
        if (!DEBUG && Logger.isDebugEnabled(TAG)) {
            Logger.d(TAG, "DeferrableSurface usage statistics may be inaccurate since debug logging was not enabled at static initialization time. App restart may be required to enable accurate usage statistics.");
        }
        Logger.d(TAG, prefix + "[total_surfaces=" + totalCount + ", used_surfaces=" + useCount + "](" + this + "}");
    }

    public final ListenableFuture<Surface> getSurface() {
        synchronized (this.mLock) {
            if (this.mClosed) {
                return Futures.immediateFailedFuture(new SurfaceClosedException("DeferrableSurface already closed.", this));
            }
            return provideSurface();
        }
    }

    public ListenableFuture<Void> getTerminationFuture() {
        return Futures.nonCancellationPropagating(this.mTerminationFuture);
    }

    public void incrementUseCount() throws SurfaceClosedException {
        synchronized (this.mLock) {
            if (this.mUseCount == 0 && this.mClosed) {
                throw new SurfaceClosedException("Cannot begin use on a closed surface.", this);
            }
            this.mUseCount++;
            if (Logger.isDebugEnabled(TAG)) {
                if (this.mUseCount == 1) {
                    printGlobalDebugCounts("New surface in use", TOTAL_COUNT.get(), USED_COUNT.incrementAndGet());
                }
                Logger.d(TAG, "use count+1, useCount=" + this.mUseCount + " " + this);
            }
        }
    }

    public void close() {
        CallbackToFutureAdapter.Completer<Void> terminationCompleter = null;
        synchronized (this.mLock) {
            if (!this.mClosed) {
                this.mClosed = true;
                this.mCloseCompleter.set(null);
                if (this.mUseCount == 0) {
                    terminationCompleter = this.mTerminationCompleter;
                    this.mTerminationCompleter = null;
                }
                if (Logger.isDebugEnabled(TAG)) {
                    Logger.d(TAG, "surface closed,  useCount=" + this.mUseCount + " closed=true " + this);
                }
            }
        }
        if (terminationCompleter != null) {
            terminationCompleter.set(null);
        }
    }

    public ListenableFuture<Void> getCloseFuture() {
        return Futures.nonCancellationPropagating(this.mCloseFuture);
    }

    public void decrementUseCount() {
        CallbackToFutureAdapter.Completer<Void> terminationCompleter = null;
        synchronized (this.mLock) {
            if (this.mUseCount == 0) {
                throw new IllegalStateException("Decrementing use count occurs more times than incrementing");
            }
            this.mUseCount--;
            if (this.mUseCount == 0 && this.mClosed) {
                terminationCompleter = this.mTerminationCompleter;
                this.mTerminationCompleter = null;
            }
            if (Logger.isDebugEnabled(TAG)) {
                Logger.d(TAG, "use count-1,  useCount=" + this.mUseCount + " closed=" + this.mClosed + " " + this);
                if (this.mUseCount == 0) {
                    printGlobalDebugCounts("Surface no longer in use", TOTAL_COUNT.get(), USED_COUNT.decrementAndGet());
                }
            }
        }
        if (terminationCompleter != null) {
            terminationCompleter.set(null);
        }
    }

    public Size getPrescribedSize() {
        return this.mPrescribedSize;
    }

    public int getPrescribedStreamFormat() {
        return this.mPrescribedStreamFormat;
    }

    public int getUseCount() {
        int i;
        synchronized (this.mLock) {
            i = this.mUseCount;
        }
        return i;
    }

    public boolean isClosed() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mClosed;
        }
        return z;
    }

    public Class<?> getContainerClass() {
        return this.mContainerClass;
    }

    public void setContainerClass(Class<?> containerClass) {
        this.mContainerClass = containerClass;
    }
}
