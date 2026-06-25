package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class SurfaceRequest {
    public static final Range<Integer> FRAME_RATE_RANGE_UNSPECIFIED = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
    private final CameraInternal mCamera;
    private final DynamicRange mDynamicRange;
    private final Range<Integer> mExpectedFrameRate;
    private final DeferrableSurface mInternalDeferrableSurface;
    private final Object mLock;
    private final CallbackToFutureAdapter.Completer<Void> mRequestCancellationCompleter;
    private final Size mResolution;
    private final ListenableFuture<Void> mSessionStatusFuture;
    private final CallbackToFutureAdapter.Completer<Surface> mSurfaceCompleter;
    final ListenableFuture<Surface> mSurfaceFuture;
    private final CallbackToFutureAdapter.Completer<Void> mSurfaceRecreationCompleter;
    private TransformationInfo mTransformationInfo;
    private Executor mTransformationInfoExecutor;
    private TransformationInfoListener mTransformationInfoListener;

    /* loaded from: classes.dex */
    public interface TransformationInfoListener {
        void onTransformationInfoUpdate(TransformationInfo transformationInfo);
    }

    public SurfaceRequest(Size resolution, CameraInternal camera, Runnable onInvalidated) {
        this(resolution, camera, DynamicRange.SDR, FRAME_RATE_RANGE_UNSPECIFIED, onInvalidated);
    }

    public SurfaceRequest(Size resolution, CameraInternal camera, DynamicRange dynamicRange, Range<Integer> expectedFrameRate, Runnable onInvalidated) {
        this.mLock = new Object();
        this.mResolution = resolution;
        this.mCamera = camera;
        this.mDynamicRange = dynamicRange;
        this.mExpectedFrameRate = expectedFrameRate;
        final String surfaceRequestString = "SurfaceRequest[size: " + resolution + ", id: " + hashCode() + "]";
        final AtomicReference<CallbackToFutureAdapter.Completer<Void>> cancellationCompleterRef = new AtomicReference<>(null);
        final ListenableFuture<Void> requestCancellationFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda4
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceRequest.lambda$new$0(cancellationCompleterRef, surfaceRequestString, completer);
            }
        });
        final CallbackToFutureAdapter.Completer<Void> requestCancellationCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(cancellationCompleterRef.get());
        this.mRequestCancellationCompleter = requestCancellationCompleter;
        final AtomicReference<CallbackToFutureAdapter.Completer<Void>> sessionStatusCompleterRef = new AtomicReference<>(null);
        this.mSessionStatusFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda5
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceRequest.lambda$new$1(sessionStatusCompleterRef, surfaceRequestString, completer);
            }
        });
        Futures.addCallback(this.mSessionStatusFuture, new FutureCallback<Void>() { // from class: androidx.camera.core.SurfaceRequest.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                Preconditions.checkState(requestCancellationCompleter.set(null));
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (t instanceof RequestCancelledException) {
                    Preconditions.checkState(requestCancellationFuture.cancel(false));
                } else {
                    Preconditions.checkState(requestCancellationCompleter.set(null));
                }
            }
        }, CameraXExecutors.directExecutor());
        final CallbackToFutureAdapter.Completer<Void> sessionStatusCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(sessionStatusCompleterRef.get());
        final AtomicReference<CallbackToFutureAdapter.Completer<Surface>> surfaceCompleterRef = new AtomicReference<>(null);
        this.mSurfaceFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda6
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceRequest.lambda$new$2(surfaceCompleterRef, surfaceRequestString, completer);
            }
        });
        this.mSurfaceCompleter = (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(surfaceCompleterRef.get());
        this.mInternalDeferrableSurface = new DeferrableSurface(resolution, 34) { // from class: androidx.camera.core.SurfaceRequest.2
            @Override // androidx.camera.core.impl.DeferrableSurface
            protected ListenableFuture<Surface> provideSurface() {
                return SurfaceRequest.this.mSurfaceFuture;
            }
        };
        final ListenableFuture<Void> terminationFuture = this.mInternalDeferrableSurface.getTerminationFuture();
        Futures.addCallback(this.mSurfaceFuture, new FutureCallback<Surface>() { // from class: androidx.camera.core.SurfaceRequest.3
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Surface result) {
                Futures.propagate(terminationFuture, sessionStatusCompleter);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                boolean z = t instanceof CancellationException;
                CallbackToFutureAdapter.Completer completer = sessionStatusCompleter;
                if (z) {
                    Preconditions.checkState(completer.setException(new RequestCancelledException(surfaceRequestString + " cancelled.", t)));
                } else {
                    completer.set(null);
                }
            }
        }, CameraXExecutors.directExecutor());
        terminationFuture.addListener(new Runnable() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceRequest.this.m130lambda$new$3$androidxcameracoreSurfaceRequest();
            }
        }, CameraXExecutors.directExecutor());
        this.mSurfaceRecreationCompleter = initialSurfaceRecreationCompleter(CameraXExecutors.directExecutor(), onInvalidated);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$0(AtomicReference cancellationCompleterRef, String surfaceRequestString, CallbackToFutureAdapter.Completer completer) throws Exception {
        cancellationCompleterRef.set(completer);
        return surfaceRequestString + "-cancellation";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$1(AtomicReference sessionStatusCompleterRef, String surfaceRequestString, CallbackToFutureAdapter.Completer completer) throws Exception {
        sessionStatusCompleterRef.set(completer);
        return surfaceRequestString + "-status";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$new$2(AtomicReference surfaceCompleterRef, String surfaceRequestString, CallbackToFutureAdapter.Completer completer) throws Exception {
        surfaceCompleterRef.set(completer);
        return surfaceRequestString + "-Surface";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$3$androidx-camera-core-SurfaceRequest  reason: not valid java name */
    public /* synthetic */ void m130lambda$new$3$androidxcameracoreSurfaceRequest() {
        this.mSurfaceFuture.cancel(true);
    }

    public DeferrableSurface getDeferrableSurface() {
        return this.mInternalDeferrableSurface;
    }

    public boolean isServiced() {
        return this.mSurfaceFuture.isDone();
    }

    public Size getResolution() {
        return this.mResolution;
    }

    public DynamicRange getDynamicRange() {
        return this.mDynamicRange;
    }

    public Range<Integer> getExpectedFrameRate() {
        return this.mExpectedFrameRate;
    }

    public CameraInternal getCamera() {
        return this.mCamera;
    }

    public void provideSurface(final Surface surface, Executor executor, final Consumer<Result> resultListener) {
        if (this.mSurfaceCompleter.set(surface) || this.mSurfaceFuture.isCancelled()) {
            Futures.addCallback(this.mSessionStatusFuture, new FutureCallback<Void>() { // from class: androidx.camera.core.SurfaceRequest.4
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void result) {
                    resultListener.accept(Result.of(0, surface));
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    Preconditions.checkState(t instanceof RequestCancelledException, "Camera surface session should only fail with request cancellation. Instead failed due to:\n" + t);
                    resultListener.accept(Result.of(1, surface));
                }
            }, executor);
            return;
        }
        Preconditions.checkState(this.mSurfaceFuture.isDone());
        try {
            this.mSurfaceFuture.get();
            executor.execute(new Runnable() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    Consumer.this.accept(SurfaceRequest.Result.of(3, surface));
                }
            });
        } catch (InterruptedException | ExecutionException e) {
            executor.execute(new Runnable() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    Consumer.this.accept(SurfaceRequest.Result.of(4, surface));
                }
            });
        }
    }

    public boolean willNotProvideSurface() {
        return this.mSurfaceCompleter.setException(new DeferrableSurface.SurfaceUnavailableException("Surface request will not complete."));
    }

    private CallbackToFutureAdapter.Completer<Void> initialSurfaceRecreationCompleter(Executor executor, final Runnable runnable) {
        final AtomicReference<CallbackToFutureAdapter.Completer<Void>> completerRef = new AtomicReference<>(null);
        ListenableFuture<Void> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda8
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceRequest.this.m129xee56265b(completerRef, completer);
            }
        });
        Futures.addCallback(future, new FutureCallback<Void>() { // from class: androidx.camera.core.SurfaceRequest.5
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                runnable.run();
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
            }
        }, executor);
        return (CallbackToFutureAdapter.Completer) Preconditions.checkNotNull(completerRef.get());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$initialSurfaceRecreationCompleter$6$androidx-camera-core-SurfaceRequest  reason: not valid java name */
    public /* synthetic */ Object m129xee56265b(AtomicReference completerRef, CallbackToFutureAdapter.Completer completer) throws Exception {
        completerRef.set(completer);
        return "SurfaceRequest-surface-recreation(" + hashCode() + ")";
    }

    public boolean invalidate() {
        willNotProvideSurface();
        return this.mSurfaceRecreationCompleter.set(null);
    }

    public void addRequestCancellationListener(Executor executor, Runnable listener) {
        this.mRequestCancellationCompleter.addCancellationListener(listener, executor);
    }

    public void updateTransformationInfo(final TransformationInfo transformationInfo) {
        final TransformationInfoListener listener;
        Executor executor;
        synchronized (this.mLock) {
            this.mTransformationInfo = transformationInfo;
            listener = this.mTransformationInfoListener;
            executor = this.mTransformationInfoExecutor;
        }
        if (listener != null && executor != null) {
            executor.execute(new Runnable() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceRequest.TransformationInfoListener.this.onTransformationInfoUpdate(transformationInfo);
                }
            });
        }
    }

    public void setTransformationInfoListener(Executor executor, final TransformationInfoListener listener) {
        final TransformationInfo transformationInfo;
        synchronized (this.mLock) {
            this.mTransformationInfoListener = listener;
            this.mTransformationInfoExecutor = executor;
            transformationInfo = this.mTransformationInfo;
        }
        if (transformationInfo != null) {
            executor.execute(new Runnable() { // from class: androidx.camera.core.SurfaceRequest$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceRequest.TransformationInfoListener.this.onTransformationInfoUpdate(transformationInfo);
                }
            });
        }
    }

    public void clearTransformationInfoListener() {
        synchronized (this.mLock) {
            this.mTransformationInfoListener = null;
            this.mTransformationInfoExecutor = null;
        }
    }

    /* loaded from: classes.dex */
    private static final class RequestCancelledException extends RuntimeException {
        RequestCancelledException(String message, Throwable cause) {
            super(message, cause);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class Result {
        public static final int RESULT_INVALID_SURFACE = 2;
        public static final int RESULT_REQUEST_CANCELLED = 1;
        public static final int RESULT_SURFACE_ALREADY_PROVIDED = 3;
        public static final int RESULT_SURFACE_USED_SUCCESSFULLY = 0;
        public static final int RESULT_WILL_NOT_PROVIDE_SURFACE = 4;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: classes.dex */
        public @interface ResultCode {
        }

        public abstract int getResultCode();

        public abstract Surface getSurface();

        static Result of(int code, Surface surface) {
            return new AutoValue_SurfaceRequest_Result(code, surface);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class TransformationInfo {
        public abstract Rect getCropRect();

        public abstract boolean getMirroring();

        public abstract int getRotationDegrees();

        public abstract Matrix getSensorToBufferTransform();

        public abstract int getTargetRotation();

        public abstract boolean hasCameraTransform();

        public static TransformationInfo of(Rect cropRect, int rotationDegrees, int targetRotation, boolean hasCameraTransform, Matrix sensorToBufferTransform, boolean mirroring) {
            return new AutoValue_SurfaceRequest_TransformationInfo(cropRect, rotationDegrees, targetRotation, hasCameraTransform, sensorToBufferTransform, mirroring);
        }
    }
}
