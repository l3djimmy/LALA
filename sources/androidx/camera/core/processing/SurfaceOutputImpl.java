package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.utils.MatrixExt;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicReference;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SurfaceOutputImpl implements SurfaceOutput {
    private static final String TAG = "SurfaceOutputImpl";
    private CameraInternal mCameraInternal;
    private final ListenableFuture<Void> mCloseFuture;
    private CallbackToFutureAdapter.Completer<Void> mCloseFutureCompleter;
    private Consumer<SurfaceOutput.Event> mEventListener;
    private Executor mExecutor;
    private final int mFormat;
    private final Rect mInputCropRect;
    private final Size mInputSize;
    private final boolean mMirroring;
    private final int mRotationDegrees;
    private Matrix mSensorToBufferTransform;
    private final Size mSize;
    private final Surface mSurface;
    private final int mTargets;
    private final Object mLock = new Object();
    private final float[] mAdditionalTransform = new float[16];
    private final float[] mInvertedTextureTransform = new float[16];
    private boolean mHasPendingCloseRequest = false;
    private boolean mIsClosed = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SurfaceOutputImpl(Surface surface, int targets, int format, Size size, Size inputSize, Rect inputCropRect, int rotationDegree, boolean mirroring, CameraInternal cameraInternal, Matrix sensorToBufferTransform) {
        this.mSurface = surface;
        this.mTargets = targets;
        this.mFormat = format;
        this.mSize = size;
        this.mInputSize = inputSize;
        this.mInputCropRect = new Rect(inputCropRect);
        this.mMirroring = mirroring;
        this.mRotationDegrees = rotationDegree;
        this.mCameraInternal = cameraInternal;
        this.mSensorToBufferTransform = sensorToBufferTransform;
        calculateAdditionalTransform();
        this.mCloseFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.SurfaceOutputImpl$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return SurfaceOutputImpl.this.m174lambda$new$0$androidxcameracoreprocessingSurfaceOutputImpl(completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-core-processing-SurfaceOutputImpl  reason: not valid java name */
    public /* synthetic */ Object m174lambda$new$0$androidxcameracoreprocessingSurfaceOutputImpl(CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mCloseFutureCompleter = completer;
        return "SurfaceOutputImpl close future complete";
    }

    @Override // androidx.camera.core.SurfaceOutput
    public Surface getSurface(Executor executor, Consumer<SurfaceOutput.Event> listener) {
        boolean hasPendingCloseRequest;
        synchronized (this.mLock) {
            this.mExecutor = executor;
            this.mEventListener = listener;
            hasPendingCloseRequest = this.mHasPendingCloseRequest;
        }
        if (hasPendingCloseRequest) {
            requestClose();
        }
        return this.mSurface;
    }

    public void requestClose() {
        final AtomicReference<Consumer<SurfaceOutput.Event>> eventListenerRef = new AtomicReference<>();
        Executor executor = null;
        synchronized (this.mLock) {
            if (this.mExecutor != null && this.mEventListener != null) {
                if (!this.mIsClosed) {
                    eventListenerRef.set(this.mEventListener);
                    executor = this.mExecutor;
                    this.mHasPendingCloseRequest = false;
                }
            }
            this.mHasPendingCloseRequest = true;
        }
        if (executor != null) {
            try {
                executor.execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceOutputImpl$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        SurfaceOutputImpl.this.m175x4fbd8e2d(eventListenerRef);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.d(TAG, "Processor executor closed. Close request not posted.", e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$requestClose$1$androidx-camera-core-processing-SurfaceOutputImpl  reason: not valid java name */
    public /* synthetic */ void m175x4fbd8e2d(AtomicReference eventListenerRef) {
        ((Consumer) eventListenerRef.get()).accept(SurfaceOutput.Event.of(0, this));
    }

    @Override // androidx.camera.core.SurfaceOutput
    public int getTargets() {
        return this.mTargets;
    }

    @Override // androidx.camera.core.SurfaceOutput
    public int getFormat() {
        return this.mFormat;
    }

    @Override // androidx.camera.core.SurfaceOutput
    public Size getSize() {
        return this.mSize;
    }

    public Rect getInputCropRect() {
        return this.mInputCropRect;
    }

    public Size getInputSize() {
        return this.mInputSize;
    }

    public int getRotationDegrees() {
        return this.mRotationDegrees;
    }

    public boolean getMirroring() {
        return this.mMirroring;
    }

    public CameraInternal getCamera() {
        return this.mCameraInternal;
    }

    @Override // androidx.camera.core.SurfaceOutput, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        synchronized (this.mLock) {
            if (!this.mIsClosed) {
                this.mIsClosed = true;
            }
        }
        this.mCloseFutureCompleter.set(null);
    }

    public boolean isClosed() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mIsClosed;
        }
        return z;
    }

    public ListenableFuture<Void> getCloseFuture() {
        return this.mCloseFuture;
    }

    @Override // androidx.camera.core.SurfaceOutput
    public void updateTransformMatrix(float[] output, float[] input) {
        android.opengl.Matrix.multiplyMM(output, 0, input, 0, this.mAdditionalTransform, 0);
    }

    @Override // androidx.camera.core.SurfaceOutput
    public Matrix getSensorToBufferTransform() {
        return new Matrix(this.mSensorToBufferTransform);
    }

    private void calculateAdditionalTransform() {
        android.opengl.Matrix.setIdentityM(this.mAdditionalTransform, 0);
        MatrixExt.preVerticalFlip(this.mAdditionalTransform, 0.5f);
        MatrixExt.preRotate(this.mAdditionalTransform, this.mRotationDegrees, 0.5f, 0.5f);
        if (this.mMirroring) {
            android.opengl.Matrix.translateM(this.mAdditionalTransform, 0, 1.0f, 0.0f, 0.0f);
            android.opengl.Matrix.scaleM(this.mAdditionalTransform, 0, -1.0f, 1.0f, 1.0f);
        }
        Size rotatedSize = TransformUtils.rotateSize(this.mInputSize, this.mRotationDegrees);
        Matrix imageTransform = TransformUtils.getRectToRect(TransformUtils.sizeToRectF(this.mInputSize), TransformUtils.sizeToRectF(rotatedSize), this.mRotationDegrees, this.mMirroring);
        RectF rotatedCroppedRect = new RectF(this.mInputCropRect);
        imageTransform.mapRect(rotatedCroppedRect);
        float offsetX = rotatedCroppedRect.left / rotatedSize.getWidth();
        float offsetY = ((rotatedSize.getHeight() - rotatedCroppedRect.height()) - rotatedCroppedRect.top) / rotatedSize.getHeight();
        float scaleX = rotatedCroppedRect.width() / rotatedSize.getWidth();
        float scaleY = rotatedCroppedRect.height() / rotatedSize.getHeight();
        android.opengl.Matrix.translateM(this.mAdditionalTransform, 0, offsetX, offsetY, 0.0f);
        android.opengl.Matrix.scaleM(this.mAdditionalTransform, 0, scaleX, scaleY, 1.0f);
        calculateInvertedTextureTransform();
        android.opengl.Matrix.multiplyMM(this.mAdditionalTransform, 0, this.mInvertedTextureTransform, 0, this.mAdditionalTransform, 0);
    }

    private void calculateInvertedTextureTransform() {
        android.opengl.Matrix.setIdentityM(this.mInvertedTextureTransform, 0);
        MatrixExt.preVerticalFlip(this.mInvertedTextureTransform, 0.5f);
        if (this.mCameraInternal != null) {
            Preconditions.checkState(this.mCameraInternal.getHasTransform(), "Camera has no transform.");
            MatrixExt.preRotate(this.mInvertedTextureTransform, this.mCameraInternal.getCameraInfo().getSensorRotationDegrees(), 0.5f, 0.5f);
            if (this.mCameraInternal.isFrontFacing()) {
                android.opengl.Matrix.translateM(this.mInvertedTextureTransform, 0, 1.0f, 0.0f, 0.0f);
                android.opengl.Matrix.scaleM(this.mInvertedTextureTransform, 0, -1.0f, 1.0f, 1.0f);
            }
        }
        android.opengl.Matrix.invertM(this.mInvertedTextureTransform, 0, this.mInvertedTextureTransform, 0);
    }
}
