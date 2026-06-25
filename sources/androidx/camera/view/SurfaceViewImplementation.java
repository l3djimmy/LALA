package androidx.camera.view;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Size;
import android.view.PixelCopy;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.FrameLayout;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.view.PreviewView;
import androidx.camera.view.PreviewViewImplementation;
import androidx.camera.view.SurfaceViewImplementation;
import androidx.core.content.ContextCompat;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SurfaceViewImplementation extends PreviewViewImplementation {
    private static final int SCREENSHOT_TIMEOUT_MILLIS = 100;
    private static final String TAG = "SurfaceViewImpl";
    final SurfaceRequestCallback mSurfaceRequestCallback;
    SurfaceView mSurfaceView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SurfaceViewImplementation(FrameLayout parent, PreviewTransformation previewTransform) {
        super(parent, previewTransform);
        this.mSurfaceRequestCallback = new SurfaceRequestCallback();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void onSurfaceRequested(final SurfaceRequest surfaceRequest, final PreviewViewImplementation.OnSurfaceNotInUseListener onSurfaceNotInUseListener) {
        if (!shouldReusePreview(this.mSurfaceView, this.mResolution, surfaceRequest)) {
            this.mResolution = surfaceRequest.getResolution();
            initializePreview();
        }
        if (onSurfaceNotInUseListener != null) {
            Executor mainExecutor = ContextCompat.getMainExecutor(this.mSurfaceView.getContext());
            Objects.requireNonNull(onSurfaceNotInUseListener);
            surfaceRequest.addRequestCancellationListener(mainExecutor, new Runnable() { // from class: androidx.camera.view.SurfaceViewImplementation$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    PreviewViewImplementation.OnSurfaceNotInUseListener.this.onSurfaceNotInUse();
                }
            });
        }
        this.mSurfaceView.post(new Runnable() { // from class: androidx.camera.view.SurfaceViewImplementation$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceViewImplementation.this.m264x6305943b(surfaceRequest, onSurfaceNotInUseListener);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onSurfaceRequested$0$androidx-camera-view-SurfaceViewImplementation  reason: not valid java name */
    public /* synthetic */ void m264x6305943b(SurfaceRequest surfaceRequest, PreviewViewImplementation.OnSurfaceNotInUseListener onSurfaceNotInUseListener) {
        this.mSurfaceRequestCallback.setSurfaceRequest(surfaceRequest, onSurfaceNotInUseListener);
    }

    @Override // androidx.camera.view.PreviewViewImplementation
    void initializePreview() {
        Preconditions.checkNotNull(this.mParent);
        Preconditions.checkNotNull(this.mResolution);
        this.mSurfaceView = new SurfaceView(this.mParent.getContext());
        this.mSurfaceView.setLayoutParams(new FrameLayout.LayoutParams(this.mResolution.getWidth(), this.mResolution.getHeight()));
        this.mParent.removeAllViews();
        this.mParent.addView(this.mSurfaceView);
        this.mSurfaceView.getHolder().addCallback(this.mSurfaceRequestCallback);
    }

    @Override // androidx.camera.view.PreviewViewImplementation
    View getPreview() {
        return this.mSurfaceView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void onAttachedToWindow() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void onDetachedFromWindow() {
    }

    @Override // androidx.camera.view.PreviewViewImplementation
    Bitmap getPreviewBitmap() {
        if (this.mSurfaceView == null || this.mSurfaceView.getHolder().getSurface() == null || !this.mSurfaceView.getHolder().getSurface().isValid()) {
            return null;
        }
        final Semaphore screenshotLock = new Semaphore(0);
        Bitmap bitmap = Bitmap.createBitmap(this.mSurfaceView.getWidth(), this.mSurfaceView.getHeight(), Bitmap.Config.ARGB_8888);
        HandlerThread backgroundThread = new HandlerThread("pixelCopyRequest Thread");
        backgroundThread.start();
        Handler backgroundHandler = new Handler(backgroundThread.getLooper());
        Api24Impl.pixelCopyRequest(this.mSurfaceView, bitmap, new PixelCopy.OnPixelCopyFinishedListener() { // from class: androidx.camera.view.SurfaceViewImplementation$$ExternalSyntheticLambda2
            @Override // android.view.PixelCopy.OnPixelCopyFinishedListener
            public final void onPixelCopyFinished(int i) {
                SurfaceViewImplementation.lambda$getPreviewBitmap$1(screenshotLock, i);
            }
        }, backgroundHandler);
        try {
            try {
                boolean success = screenshotLock.tryAcquire(1, 100L, TimeUnit.MILLISECONDS);
                if (!success) {
                    Logger.e(TAG, "Timed out while trying to acquire screenshot.");
                }
            } catch (InterruptedException e) {
                Logger.e(TAG, "Interrupted while trying to acquire screenshot.", e);
            }
            return bitmap;
        } finally {
            backgroundThread.quitSafely();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$getPreviewBitmap$1(Semaphore screenshotLock, int copyResult) {
        if (copyResult == 0) {
            Logger.d(TAG, "PreviewView.SurfaceViewImplementation.getBitmap() succeeded");
        } else {
            Logger.e(TAG, "PreviewView.SurfaceViewImplementation.getBitmap() failed with error " + copyResult);
        }
        screenshotLock.release();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class SurfaceRequestCallback implements SurfaceHolder.Callback {
        private Size mCurrentSurfaceSize;
        private PreviewViewImplementation.OnSurfaceNotInUseListener mOnSurfaceNotInUseListener;
        private SurfaceRequest mSurfaceRequest;
        private SurfaceRequest mSurfaceRequestToBeInvalidated;
        private Size mTargetSize;
        private boolean mWasSurfaceProvided = false;
        private boolean mNeedToInvalidate = false;

        SurfaceRequestCallback() {
        }

        void setSurfaceRequest(SurfaceRequest surfaceRequest, PreviewViewImplementation.OnSurfaceNotInUseListener onSurfaceNotInUseListener) {
            cancelPreviousRequest();
            if (this.mNeedToInvalidate) {
                this.mNeedToInvalidate = false;
                surfaceRequest.invalidate();
                return;
            }
            this.mSurfaceRequest = surfaceRequest;
            this.mOnSurfaceNotInUseListener = onSurfaceNotInUseListener;
            Size targetSize = surfaceRequest.getResolution();
            this.mTargetSize = targetSize;
            this.mWasSurfaceProvided = false;
            if (!tryToComplete()) {
                Logger.d(SurfaceViewImplementation.TAG, "Wait for new Surface creation.");
                SurfaceViewImplementation.this.mSurfaceView.getHolder().setFixedSize(targetSize.getWidth(), targetSize.getHeight());
            }
        }

        private boolean tryToComplete() {
            Surface surface = SurfaceViewImplementation.this.mSurfaceView.getHolder().getSurface();
            if (canProvideSurface()) {
                Logger.d(SurfaceViewImplementation.TAG, "Surface set on Preview.");
                final PreviewViewImplementation.OnSurfaceNotInUseListener listener = this.mOnSurfaceNotInUseListener;
                ((SurfaceRequest) Objects.requireNonNull(this.mSurfaceRequest)).provideSurface(surface, ContextCompat.getMainExecutor(SurfaceViewImplementation.this.mSurfaceView.getContext()), new Consumer() { // from class: androidx.camera.view.SurfaceViewImplementation$SurfaceRequestCallback$$ExternalSyntheticLambda0
                    @Override // androidx.core.util.Consumer
                    public final void accept(Object obj) {
                        SurfaceViewImplementation.SurfaceRequestCallback.lambda$tryToComplete$0(PreviewViewImplementation.OnSurfaceNotInUseListener.this, (SurfaceRequest.Result) obj);
                    }
                });
                this.mWasSurfaceProvided = true;
                SurfaceViewImplementation.this.onSurfaceProvided();
                return true;
            }
            return false;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$tryToComplete$0(PreviewViewImplementation.OnSurfaceNotInUseListener listener, SurfaceRequest.Result result) {
            Logger.d(SurfaceViewImplementation.TAG, "Safe to release surface.");
            if (listener != null) {
                listener.onSurfaceNotInUse();
            }
        }

        private boolean canProvideSurface() {
            return (this.mWasSurfaceProvided || this.mSurfaceRequest == null || !Objects.equals(this.mTargetSize, this.mCurrentSurfaceSize)) ? false : true;
        }

        private void cancelPreviousRequest() {
            if (this.mSurfaceRequest != null) {
                Logger.d(SurfaceViewImplementation.TAG, "Request canceled: " + this.mSurfaceRequest);
                this.mSurfaceRequest.willNotProvideSurface();
            }
        }

        private void closeSurface() {
            if (this.mSurfaceRequest != null) {
                Logger.d(SurfaceViewImplementation.TAG, "Surface closed " + this.mSurfaceRequest);
                this.mSurfaceRequest.getDeferrableSurface().close();
            }
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceCreated(SurfaceHolder surfaceHolder) {
            Logger.d(SurfaceViewImplementation.TAG, "Surface created.");
            if (this.mNeedToInvalidate && this.mSurfaceRequestToBeInvalidated != null) {
                this.mSurfaceRequestToBeInvalidated.invalidate();
                this.mSurfaceRequestToBeInvalidated = null;
                this.mNeedToInvalidate = false;
            }
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceChanged(SurfaceHolder surfaceHolder, int format, int width, int height) {
            Logger.d(SurfaceViewImplementation.TAG, "Surface changed. Size: " + width + "x" + height);
            this.mCurrentSurfaceSize = new Size(width, height);
            tryToComplete();
        }

        @Override // android.view.SurfaceHolder.Callback
        public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
            Logger.d(SurfaceViewImplementation.TAG, "Surface destroyed.");
            if (this.mWasSurfaceProvided) {
                closeSurface();
            } else {
                cancelPreviousRequest();
            }
            this.mNeedToInvalidate = true;
            if (this.mSurfaceRequest != null) {
                this.mSurfaceRequestToBeInvalidated = this.mSurfaceRequest;
            }
            this.mWasSurfaceProvided = false;
            this.mSurfaceRequest = null;
            this.mOnSurfaceNotInUseListener = null;
            this.mCurrentSurfaceSize = null;
            this.mTargetSize = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public ListenableFuture<Void> waitForNextFrame() {
        return Futures.immediateFuture(null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void setFrameUpdateListener(Executor executor, PreviewView.OnFrameUpdateListener listener) {
        throw new IllegalArgumentException("SurfaceView doesn't support frame update listener");
    }

    /* loaded from: classes.dex */
    private static class Api24Impl {
        private Api24Impl() {
        }

        static void pixelCopyRequest(SurfaceView source, Bitmap dest, PixelCopy.OnPixelCopyFinishedListener listener, Handler handler) {
            PixelCopy.request(source, dest, listener, handler);
        }
    }

    private static boolean shouldReusePreview(SurfaceView surfaceView, Size resolution, SurfaceRequest surfaceRequest) {
        boolean isSameResolution = Objects.equals(resolution, surfaceRequest.getResolution());
        return surfaceView != null && isSameResolution;
    }
}
