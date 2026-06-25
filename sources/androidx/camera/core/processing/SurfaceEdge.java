package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public class SurfaceEdge {
    private SurfaceOutputImpl mConsumerToNotify;
    private final Rect mCropRect;
    private final int mFormat;
    private final boolean mHasCameraTransform;
    private final boolean mMirroring;
    private SurfaceRequest mProviderSurfaceRequest;
    private int mRotationDegrees;
    private final Matrix mSensorToBufferTransform;
    private SettableSurface mSettableSurface;
    private final StreamSpec mStreamSpec;
    private int mTargetRotation;
    private final int mTargets;
    private boolean mHasConsumer = false;
    private final Set<Runnable> mOnInvalidatedListeners = new HashSet();
    private boolean mIsClosed = false;

    public SurfaceEdge(int targets, int format, StreamSpec streamSpec, Matrix sensorToBufferTransform, boolean hasCameraTransform, Rect cropRect, int rotationDegrees, int targetRotation, boolean mirroring) {
        this.mTargets = targets;
        this.mFormat = format;
        this.mStreamSpec = streamSpec;
        this.mSensorToBufferTransform = sensorToBufferTransform;
        this.mHasCameraTransform = hasCameraTransform;
        this.mCropRect = cropRect;
        this.mRotationDegrees = rotationDegrees;
        this.mTargetRotation = targetRotation;
        this.mMirroring = mirroring;
        this.mSettableSurface = new SettableSurface(streamSpec.getResolution(), this.mFormat);
    }

    public void addOnInvalidatedListener(Runnable onInvalidated) {
        Threads.checkMainThread();
        checkNotClosed();
        this.mOnInvalidatedListeners.add(onInvalidated);
    }

    public DeferrableSurface getDeferrableSurface() {
        Threads.checkMainThread();
        checkNotClosed();
        checkAndSetHasConsumer();
        return this.mSettableSurface;
    }

    public void setProvider(DeferrableSurface provider) throws DeferrableSurface.SurfaceClosedException {
        Threads.checkMainThread();
        checkNotClosed();
        this.mSettableSurface.setProvider(provider, new SurfaceEdge$$ExternalSyntheticLambda1(this));
    }

    public SurfaceRequest createSurfaceRequest(CameraInternal cameraInternal) {
        Threads.checkMainThread();
        checkNotClosed();
        SurfaceRequest surfaceRequest = new SurfaceRequest(this.mStreamSpec.getResolution(), cameraInternal, this.mStreamSpec.getDynamicRange(), this.mStreamSpec.getExpectedFrameRateRange(), new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceEdge.this.m171xa8c6a4fe();
            }
        });
        try {
            final DeferrableSurface deferrableSurface = surfaceRequest.getDeferrableSurface();
            if (this.mSettableSurface.setProvider(deferrableSurface, new SurfaceEdge$$ExternalSyntheticLambda1(this))) {
                ListenableFuture<Void> terminationFuture = this.mSettableSurface.getTerminationFuture();
                Objects.requireNonNull(deferrableSurface);
                terminationFuture.addListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        DeferrableSurface.this.close();
                    }
                }, CameraXExecutors.directExecutor());
            }
            this.mProviderSurfaceRequest = surfaceRequest;
            notifyTransformationInfoUpdate();
            return surfaceRequest;
        } catch (DeferrableSurface.SurfaceClosedException e) {
            throw new AssertionError("Surface is somehow already closed", e);
        } catch (RuntimeException e2) {
            surfaceRequest.willNotProvideSurface();
            throw e2;
        }
    }

    /* renamed from: lambda$createSurfaceRequest$1$androidx-camera-core-processing-SurfaceEdge */
    public /* synthetic */ void m171xa8c6a4fe() {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceEdge.this.m170xe25e27d();
            }
        });
    }

    /* renamed from: lambda$createSurfaceRequest$0$androidx-camera-core-processing-SurfaceEdge */
    public /* synthetic */ void m170xe25e27d() {
        if (!this.mIsClosed) {
            invalidate();
        }
    }

    public ListenableFuture<SurfaceOutput> createSurfaceOutputFuture(final Size inputSize, final int format, final Rect cropRect, final int rotationDegrees, final boolean mirroring, final CameraInternal cameraInternal) {
        Threads.checkMainThread();
        checkNotClosed();
        checkAndSetHasConsumer();
        final SettableSurface settableSurface = this.mSettableSurface;
        return Futures.transformAsync(this.mSettableSurface.getSurface(), new AsyncFunction() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda5
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return SurfaceEdge.this.m169xcd1514fc(settableSurface, format, inputSize, cropRect, rotationDegrees, mirroring, cameraInternal, (Surface) obj);
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    /* renamed from: lambda$createSurfaceOutputFuture$2$androidx-camera-core-processing-SurfaceEdge */
    public /* synthetic */ ListenableFuture m169xcd1514fc(final SettableSurface settableSurface, int format, Size inputSize, Rect cropRect, int rotationDegrees, boolean mirroring, CameraInternal cameraInternal, Surface surface) throws Exception {
        Preconditions.checkNotNull(surface);
        try {
            settableSurface.incrementUseCount();
            SurfaceOutputImpl surfaceOutputImpl = new SurfaceOutputImpl(surface, getTargets(), format, this.mStreamSpec.getResolution(), inputSize, cropRect, rotationDegrees, mirroring, cameraInternal, this.mSensorToBufferTransform);
            ListenableFuture<Void> closeFuture = surfaceOutputImpl.getCloseFuture();
            Objects.requireNonNull(settableSurface);
            closeFuture.addListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceEdge.SettableSurface.this.decrementUseCount();
                }
            }, CameraXExecutors.directExecutor());
            this.mConsumerToNotify = surfaceOutputImpl;
            return Futures.immediateFuture(surfaceOutputImpl);
        } catch (DeferrableSurface.SurfaceClosedException e) {
            return Futures.immediateFailedFuture(e);
        }
    }

    public void invalidate() {
        Threads.checkMainThread();
        checkNotClosed();
        if (this.mSettableSurface.canSetProvider()) {
            return;
        }
        disconnectWithoutCheckingClosed();
        this.mHasConsumer = false;
        this.mSettableSurface = new SettableSurface(this.mStreamSpec.getResolution(), this.mFormat);
        for (Runnable onInvalidated : this.mOnInvalidatedListeners) {
            onInvalidated.run();
        }
    }

    public final void close() {
        Threads.checkMainThread();
        disconnectWithoutCheckingClosed();
        this.mIsClosed = true;
    }

    public final void disconnect() {
        Threads.checkMainThread();
        checkNotClosed();
        disconnectWithoutCheckingClosed();
    }

    public void disconnectWithoutCheckingClosed() {
        Threads.checkMainThread();
        this.mSettableSurface.close();
        if (this.mConsumerToNotify != null) {
            this.mConsumerToNotify.requestClose();
            this.mConsumerToNotify = null;
        }
    }

    public int getTargets() {
        return this.mTargets;
    }

    public int getFormat() {
        return this.mFormat;
    }

    public Matrix getSensorToBufferTransform() {
        return this.mSensorToBufferTransform;
    }

    public boolean hasCameraTransform() {
        return this.mHasCameraTransform;
    }

    public Rect getCropRect() {
        return this.mCropRect;
    }

    public int getRotationDegrees() {
        return this.mRotationDegrees;
    }

    public void updateTransformation(int rotationDegrees) {
        updateTransformation(rotationDegrees, -1);
    }

    public void updateTransformation(final int rotationDegrees, final int targetRotation) {
        Threads.runOnMain(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceEdge.this.m172xb9042df4(rotationDegrees, targetRotation);
            }
        });
    }

    /* renamed from: lambda$updateTransformation$3$androidx-camera-core-processing-SurfaceEdge */
    public /* synthetic */ void m172xb9042df4(int rotationDegrees, int targetRotation) {
        boolean isDirty = false;
        if (this.mRotationDegrees != rotationDegrees) {
            isDirty = true;
            this.mRotationDegrees = rotationDegrees;
        }
        if (this.mTargetRotation != targetRotation) {
            isDirty = true;
            this.mTargetRotation = targetRotation;
        }
        if (isDirty) {
            notifyTransformationInfoUpdate();
        }
    }

    private void notifyTransformationInfoUpdate() {
        Threads.checkMainThread();
        if (this.mProviderSurfaceRequest != null) {
            this.mProviderSurfaceRequest.updateTransformationInfo(SurfaceRequest.TransformationInfo.of(this.mCropRect, this.mRotationDegrees, this.mTargetRotation, hasCameraTransform(), this.mSensorToBufferTransform, this.mMirroring));
        }
    }

    private void checkAndSetHasConsumer() {
        Preconditions.checkState(!this.mHasConsumer, "Consumer can only be linked once.");
        this.mHasConsumer = true;
    }

    public boolean getMirroring() {
        return this.mMirroring;
    }

    public StreamSpec getStreamSpec() {
        return this.mStreamSpec;
    }

    private void checkNotClosed() {
        Preconditions.checkState(!this.mIsClosed, "Edge is already closed.");
    }

    public DeferrableSurface getDeferrableSurfaceForTesting() {
        return this.mSettableSurface;
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public boolean hasProvider() {
        return this.mSettableSurface.hasProvider();
    }

    /* loaded from: classes.dex */
    public static class SettableSurface extends DeferrableSurface {
        CallbackToFutureAdapter.Completer<Surface> mCompleter;
        private DeferrableSurface mProvider;
        final ListenableFuture<Surface> mSurfaceFuture;

        /* renamed from: lambda$new$0$androidx-camera-core-processing-SurfaceEdge$SettableSurface */
        public /* synthetic */ Object m173xcee66962(CallbackToFutureAdapter.Completer completer) throws Exception {
            this.mCompleter = completer;
            return "SettableFuture hashCode: " + hashCode();
        }

        SettableSurface(Size size, int format) {
            super(size, format);
            this.mSurfaceFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.SurfaceEdge$SettableSurface$$ExternalSyntheticLambda1
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return SurfaceEdge.SettableSurface.this.m173xcee66962(completer);
                }
            });
        }

        @Override // androidx.camera.core.impl.DeferrableSurface
        protected ListenableFuture<Surface> provideSurface() {
            return this.mSurfaceFuture;
        }

        boolean canSetProvider() {
            Threads.checkMainThread();
            return this.mProvider == null && !isClosed();
        }

        boolean hasProvider() {
            return this.mProvider != null;
        }

        public boolean setProvider(final DeferrableSurface provider, Runnable onProviderClosed) throws DeferrableSurface.SurfaceClosedException {
            Threads.checkMainThread();
            Preconditions.checkNotNull(provider);
            if (this.mProvider == provider) {
                return false;
            }
            Preconditions.checkState(this.mProvider == null, "A different provider has been set. To change the provider, call SurfaceEdge#invalidate before calling SurfaceEdge#setProvider");
            Preconditions.checkArgument(getPrescribedSize().equals(provider.getPrescribedSize()), "The provider's size must match the parent");
            Preconditions.checkArgument(getPrescribedStreamFormat() == provider.getPrescribedStreamFormat(), "The provider's format must match the parent");
            Preconditions.checkState(!isClosed(), "The parent is closed. Call SurfaceEdge#invalidate() before setting a new provider.");
            this.mProvider = provider;
            Futures.propagate(provider.getSurface(), this.mCompleter);
            provider.incrementUseCount();
            ListenableFuture<Void> terminationFuture = getTerminationFuture();
            Objects.requireNonNull(provider);
            terminationFuture.addListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceEdge$SettableSurface$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    DeferrableSurface.this.decrementUseCount();
                }
            }, CameraXExecutors.directExecutor());
            provider.getCloseFuture().addListener(onProviderClosed, CameraXExecutors.mainThreadExecutor());
            return true;
        }
    }
}
