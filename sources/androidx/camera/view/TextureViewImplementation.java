package androidx.camera.view;

import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.widget.FrameLayout;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.view.PreviewView;
import androidx.camera.view.PreviewViewImplementation;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.content.ContextCompat;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class TextureViewImplementation extends PreviewViewImplementation {
    private static final String TAG = "TextureViewImpl";
    SurfaceTexture mDetachedSurfaceTexture;
    Executor mFrameUpdateExecutor;
    boolean mIsSurfaceTextureDetachedFromView;
    AtomicReference<CallbackToFutureAdapter.Completer<Void>> mNextFrameCompleter;
    PreviewView.OnFrameUpdateListener mOnFrameUpdateListener;
    PreviewViewImplementation.OnSurfaceNotInUseListener mOnSurfaceNotInUseListener;
    ListenableFuture<SurfaceRequest.Result> mSurfaceReleaseFuture;
    SurfaceRequest mSurfaceRequest;
    SurfaceTexture mSurfaceTexture;
    TextureView mTextureView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public TextureViewImplementation(FrameLayout parent, PreviewTransformation previewTransform) {
        super(parent, previewTransform);
        this.mIsSurfaceTextureDetachedFromView = false;
        this.mNextFrameCompleter = new AtomicReference<>();
    }

    @Override // androidx.camera.view.PreviewViewImplementation
    View getPreview() {
        return this.mTextureView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void onAttachedToWindow() {
        reattachSurfaceTexture();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void onDetachedFromWindow() {
        this.mIsSurfaceTextureDetachedFromView = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void onSurfaceRequested(final SurfaceRequest surfaceRequest, PreviewViewImplementation.OnSurfaceNotInUseListener onSurfaceNotInUseListener) {
        this.mResolution = surfaceRequest.getResolution();
        this.mOnSurfaceNotInUseListener = onSurfaceNotInUseListener;
        initializePreview();
        if (this.mSurfaceRequest != null) {
            this.mSurfaceRequest.willNotProvideSurface();
        }
        this.mSurfaceRequest = surfaceRequest;
        surfaceRequest.addRequestCancellationListener(ContextCompat.getMainExecutor(this.mTextureView.getContext()), new Runnable() { // from class: androidx.camera.view.TextureViewImplementation$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                TextureViewImplementation.this.m265xce057d29(surfaceRequest);
            }
        });
        tryToProvidePreviewSurface();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onSurfaceRequested$0$androidx-camera-view-TextureViewImplementation  reason: not valid java name */
    public /* synthetic */ void m265xce057d29(SurfaceRequest surfaceRequest) {
        if (this.mSurfaceRequest != null && this.mSurfaceRequest == surfaceRequest) {
            this.mSurfaceRequest = null;
            this.mSurfaceReleaseFuture = null;
        }
        notifySurfaceNotInUse();
    }

    private void notifySurfaceNotInUse() {
        if (this.mOnSurfaceNotInUseListener != null) {
            this.mOnSurfaceNotInUseListener.onSurfaceNotInUse();
            this.mOnSurfaceNotInUseListener = null;
        }
    }

    @Override // androidx.camera.view.PreviewViewImplementation
    public void initializePreview() {
        Preconditions.checkNotNull(this.mParent);
        Preconditions.checkNotNull(this.mResolution);
        this.mTextureView = new TextureView(this.mParent.getContext());
        this.mTextureView.setLayoutParams(new FrameLayout.LayoutParams(this.mResolution.getWidth(), this.mResolution.getHeight()));
        this.mTextureView.setSurfaceTextureListener(new AnonymousClass1());
        this.mParent.removeAllViews();
        this.mParent.addView(this.mTextureView);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: androidx.camera.view.TextureViewImplementation$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements TextureView.SurfaceTextureListener {
        AnonymousClass1() {
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int width, int height) {
            Logger.d(TextureViewImplementation.TAG, "SurfaceTexture available. Size: " + width + "x" + height);
            TextureViewImplementation.this.mSurfaceTexture = surfaceTexture;
            ListenableFuture<SurfaceRequest.Result> listenableFuture = TextureViewImplementation.this.mSurfaceReleaseFuture;
            TextureViewImplementation textureViewImplementation = TextureViewImplementation.this;
            if (listenableFuture != null) {
                Preconditions.checkNotNull(textureViewImplementation.mSurfaceRequest);
                Logger.d(TextureViewImplementation.TAG, "Surface invalidated " + TextureViewImplementation.this.mSurfaceRequest);
                TextureViewImplementation.this.mSurfaceRequest.getDeferrableSurface().close();
                return;
            }
            textureViewImplementation.tryToProvidePreviewSurface();
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int width, int height) {
            Logger.d(TextureViewImplementation.TAG, "SurfaceTexture size changed: " + width + "x" + height);
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public boolean onSurfaceTextureDestroyed(final SurfaceTexture surfaceTexture) {
            TextureViewImplementation.this.mSurfaceTexture = null;
            if (TextureViewImplementation.this.mSurfaceReleaseFuture != null) {
                Futures.addCallback(TextureViewImplementation.this.mSurfaceReleaseFuture, new FutureCallback<SurfaceRequest.Result>() { // from class: androidx.camera.view.TextureViewImplementation.1.1
                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onSuccess(SurfaceRequest.Result result) {
                        Preconditions.checkState(result.getResultCode() != 3, "Unexpected result from SurfaceRequest. Surface was provided twice.");
                        Logger.d(TextureViewImplementation.TAG, "SurfaceTexture about to manually be destroyed");
                        surfaceTexture.release();
                        if (TextureViewImplementation.this.mDetachedSurfaceTexture != null) {
                            TextureViewImplementation.this.mDetachedSurfaceTexture = null;
                        }
                    }

                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onFailure(Throwable t) {
                        throw new IllegalStateException("SurfaceReleaseFuture did not complete nicely.", t);
                    }
                }, ContextCompat.getMainExecutor(TextureViewImplementation.this.mTextureView.getContext()));
                TextureViewImplementation.this.mDetachedSurfaceTexture = surfaceTexture;
                return false;
            }
            Logger.d(TextureViewImplementation.TAG, "SurfaceTexture about to be destroyed");
            return true;
        }

        @Override // android.view.TextureView.SurfaceTextureListener
        public void onSurfaceTextureUpdated(final SurfaceTexture surfaceTexture) {
            CallbackToFutureAdapter.Completer<Void> completer = TextureViewImplementation.this.mNextFrameCompleter.getAndSet(null);
            if (completer != null) {
                completer.set(null);
            }
            final PreviewView.OnFrameUpdateListener onFrameUpdateListener = TextureViewImplementation.this.mOnFrameUpdateListener;
            Executor frameUpdateExecutor = TextureViewImplementation.this.mFrameUpdateExecutor;
            if (onFrameUpdateListener != null && frameUpdateExecutor != null) {
                frameUpdateExecutor.execute(new Runnable() { // from class: androidx.camera.view.TextureViewImplementation$1$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        PreviewView.OnFrameUpdateListener.this.onFrameUpdate(surfaceTexture.getTimestamp());
                    }
                });
            }
        }
    }

    void tryToProvidePreviewSurface() {
        if (this.mResolution == null || this.mSurfaceTexture == null || this.mSurfaceRequest == null) {
            return;
        }
        this.mSurfaceTexture.setDefaultBufferSize(this.mResolution.getWidth(), this.mResolution.getHeight());
        final Surface surface = new Surface(this.mSurfaceTexture);
        final SurfaceRequest surfaceRequest = this.mSurfaceRequest;
        final ListenableFuture<SurfaceRequest.Result> surfaceReleaseFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.view.TextureViewImplementation$$ExternalSyntheticLambda3
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return TextureViewImplementation.this.m266xdd0bd278(surface, completer);
            }
        });
        this.mSurfaceReleaseFuture = surfaceReleaseFuture;
        this.mSurfaceReleaseFuture.addListener(new Runnable() { // from class: androidx.camera.view.TextureViewImplementation$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                TextureViewImplementation.this.m267x16d67457(surface, surfaceReleaseFuture, surfaceRequest);
            }
        }, ContextCompat.getMainExecutor(this.mTextureView.getContext()));
        onSurfaceProvided();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$tryToProvidePreviewSurface$1$androidx-camera-view-TextureViewImplementation  reason: not valid java name */
    public /* synthetic */ Object m266xdd0bd278(Surface surface, final CallbackToFutureAdapter.Completer completer) throws Exception {
        Logger.d(TAG, "Surface set on Preview.");
        SurfaceRequest surfaceRequest = this.mSurfaceRequest;
        Executor directExecutor = CameraXExecutors.directExecutor();
        Objects.requireNonNull(completer);
        surfaceRequest.provideSurface(surface, directExecutor, new Consumer() { // from class: androidx.camera.view.TextureViewImplementation$$ExternalSyntheticLambda2
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CallbackToFutureAdapter.Completer.this.set((SurfaceRequest.Result) obj);
            }
        });
        return "provideSurface[request=" + this.mSurfaceRequest + " surface=" + surface + "]";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$tryToProvidePreviewSurface$2$androidx-camera-view-TextureViewImplementation  reason: not valid java name */
    public /* synthetic */ void m267x16d67457(Surface surface, ListenableFuture surfaceReleaseFuture, SurfaceRequest surfaceRequest) {
        Logger.d(TAG, "Safe to release surface.");
        notifySurfaceNotInUse();
        surface.release();
        if (this.mSurfaceReleaseFuture == surfaceReleaseFuture) {
            this.mSurfaceReleaseFuture = null;
        }
        if (this.mSurfaceRequest == surfaceRequest) {
            this.mSurfaceRequest = null;
        }
    }

    private void reattachSurfaceTexture() {
        if (this.mIsSurfaceTextureDetachedFromView && this.mDetachedSurfaceTexture != null && this.mTextureView.getSurfaceTexture() != this.mDetachedSurfaceTexture) {
            this.mTextureView.setSurfaceTexture(this.mDetachedSurfaceTexture);
            this.mDetachedSurfaceTexture = null;
            this.mIsSurfaceTextureDetachedFromView = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public ListenableFuture<Void> waitForNextFrame() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.view.TextureViewImplementation$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return TextureViewImplementation.this.m268x86b0fc00(completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$waitForNextFrame$3$androidx-camera-view-TextureViewImplementation  reason: not valid java name */
    public /* synthetic */ Object m268x86b0fc00(CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mNextFrameCompleter.set(completer);
        return "textureViewImpl_waitForNextFrame";
    }

    @Override // androidx.camera.view.PreviewViewImplementation
    Bitmap getPreviewBitmap() {
        if (this.mTextureView == null || !this.mTextureView.isAvailable()) {
            return null;
        }
        return this.mTextureView.getBitmap();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.view.PreviewViewImplementation
    public void setFrameUpdateListener(Executor executor, PreviewView.OnFrameUpdateListener listener) {
        this.mOnFrameUpdateListener = listener;
        this.mFrameUpdateExecutor = executor;
    }
}
