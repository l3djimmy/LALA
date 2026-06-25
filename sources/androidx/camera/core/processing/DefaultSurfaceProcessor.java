package androidx.camera.core.processing;

import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.opengl.Matrix;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Size;
import android.view.Surface;
import androidx.arch.core.util.Function;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageProcessingUtil;
import androidx.camera.core.Logger;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.utils.MatrixExt;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Triple;
/* loaded from: classes.dex */
public class DefaultSurfaceProcessor implements SurfaceProcessorInternal, SurfaceTexture.OnFrameAvailableListener {
    private static final String TAG = "DefaultSurfaceProcessor";
    private final Executor mGlExecutor;
    final Handler mGlHandler;
    private final OpenGlRenderer mGlRenderer;
    final HandlerThread mGlThread;
    private int mInputSurfaceCount;
    private final AtomicBoolean mIsReleaseRequested;
    private boolean mIsReleased;
    final Map<SurfaceOutput, Surface> mOutputSurfaces;
    private final List<PendingSnapshot> mPendingSnapshots;
    private final float[] mSurfaceOutputMatrix;
    private final float[] mTextureMatrix;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DefaultSurfaceProcessor(DynamicRange dynamicRange) {
        this(dynamicRange, ShaderProvider.DEFAULT);
    }

    DefaultSurfaceProcessor(DynamicRange dynamicRange, ShaderProvider shaderProvider) {
        this.mIsReleaseRequested = new AtomicBoolean(false);
        this.mTextureMatrix = new float[16];
        this.mSurfaceOutputMatrix = new float[16];
        this.mOutputSurfaces = new LinkedHashMap();
        this.mInputSurfaceCount = 0;
        this.mIsReleased = false;
        this.mPendingSnapshots = new ArrayList();
        this.mGlThread = new HandlerThread("GL Thread");
        this.mGlThread.start();
        this.mGlHandler = new Handler(this.mGlThread.getLooper());
        this.mGlExecutor = CameraXExecutors.newHandlerExecutor(this.mGlHandler);
        this.mGlRenderer = new OpenGlRenderer();
        try {
            initGlRenderer(dynamicRange, shaderProvider);
        } catch (RuntimeException e) {
            release();
            throw e;
        }
    }

    @Override // androidx.camera.core.SurfaceProcessor
    public void onInputSurface(final SurfaceRequest surfaceRequest) {
        if (this.mIsReleaseRequested.get()) {
            surfaceRequest.willNotProvideSurface();
            return;
        }
        Runnable runnable = new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                DefaultSurfaceProcessor.this.m160xeeb3c23e(surfaceRequest);
            }
        };
        Objects.requireNonNull(surfaceRequest);
        executeSafely(runnable, new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceRequest.this.willNotProvideSurface();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onInputSurface$1$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m160xeeb3c23e(SurfaceRequest surfaceRequest) {
        this.mInputSurfaceCount++;
        final SurfaceTexture surfaceTexture = new SurfaceTexture(this.mGlRenderer.getTextureName());
        surfaceTexture.setDefaultBufferSize(surfaceRequest.getResolution().getWidth(), surfaceRequest.getResolution().getHeight());
        final Surface surface = new Surface(surfaceTexture);
        surfaceRequest.provideSurface(surface, this.mGlExecutor, new Consumer() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda8
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                DefaultSurfaceProcessor.this.m159xc91fb93d(surfaceTexture, surface, (SurfaceRequest.Result) obj);
            }
        });
        surfaceTexture.setOnFrameAvailableListener(this, this.mGlHandler);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onInputSurface$0$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m159xc91fb93d(SurfaceTexture surfaceTexture, Surface surface, SurfaceRequest.Result result) {
        surfaceTexture.setOnFrameAvailableListener(null);
        surfaceTexture.release();
        surface.release();
        this.mInputSurfaceCount--;
        checkReadyToRelease();
    }

    @Override // androidx.camera.core.SurfaceProcessor
    public void onOutputSurface(final SurfaceOutput surfaceOutput) {
        if (this.mIsReleaseRequested.get()) {
            surfaceOutput.close();
            return;
        }
        Runnable runnable = new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                DefaultSurfaceProcessor.this.m162x7933371(surfaceOutput);
            }
        };
        Objects.requireNonNull(surfaceOutput);
        executeSafely(runnable, new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceOutput.this.close();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onOutputSurface$3$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m162x7933371(final SurfaceOutput surfaceOutput) {
        Surface surface = surfaceOutput.getSurface(this.mGlExecutor, new Consumer() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda0
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                DefaultSurfaceProcessor.this.m161xe1ff2a70(surfaceOutput, (SurfaceOutput.Event) obj);
            }
        });
        this.mGlRenderer.registerOutputSurface(surface);
        this.mOutputSurfaces.put(surfaceOutput, surface);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onOutputSurface$2$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m161xe1ff2a70(SurfaceOutput surfaceOutput, SurfaceOutput.Event event) {
        surfaceOutput.close();
        Surface removedSurface = this.mOutputSurfaces.remove(surfaceOutput);
        if (removedSurface != null) {
            this.mGlRenderer.unregisterOutputSurface(removedSurface);
        }
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorInternal
    public void release() {
        if (this.mIsReleaseRequested.getAndSet(true)) {
            return;
        }
        executeSafely(new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                DefaultSurfaceProcessor.this.m163x94a4be2c();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$4$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m163x94a4be2c() {
        this.mIsReleased = true;
        checkReadyToRelease();
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorInternal
    public ListenableFuture<Void> snapshot(final int jpegQuality, final int rotationDegrees) {
        return Futures.nonCancellationPropagating(CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda13
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DefaultSurfaceProcessor.this.m165xc377e846(jpegQuality, rotationDegrees, completer);
            }
        }));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$snapshot$7$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ Object m165xc377e846(int jpegQuality, int rotationDegrees, final CallbackToFutureAdapter.Completer completer) throws Exception {
        final PendingSnapshot pendingSnapshot = PendingSnapshot.of(jpegQuality, rotationDegrees, completer);
        executeSafely(new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda11
            @Override // java.lang.Runnable
            public final void run() {
                DefaultSurfaceProcessor.this.m164x784fd644(pendingSnapshot);
            }
        }, new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda12
            @Override // java.lang.Runnable
            public final void run() {
                CallbackToFutureAdapter.Completer.this.setException(new Exception("Failed to snapshot: OpenGLRenderer not ready."));
            }
        });
        return "DefaultSurfaceProcessor#snapshot";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$snapshot$5$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m164x784fd644(PendingSnapshot pendingSnapshot) {
        this.mPendingSnapshots.add(pendingSnapshot);
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        if (this.mIsReleaseRequested.get()) {
            return;
        }
        surfaceTexture.updateTexImage();
        surfaceTexture.getTransformMatrix(this.mTextureMatrix);
        Triple<Surface, Size, float[]> jpegOutput = null;
        for (Map.Entry<SurfaceOutput, Surface> entry : this.mOutputSurfaces.entrySet()) {
            Surface surface = entry.getValue();
            SurfaceOutput surfaceOutput = entry.getKey();
            surfaceOutput.updateTransformMatrix(this.mSurfaceOutputMatrix, this.mTextureMatrix);
            if (surfaceOutput.getFormat() == 34) {
                try {
                    this.mGlRenderer.render(surfaceTexture.getTimestamp(), this.mSurfaceOutputMatrix, surface);
                } catch (RuntimeException e) {
                    Logger.e(TAG, "Failed to render with OpenGL.", e);
                }
            } else {
                Preconditions.checkState(surfaceOutput.getFormat() == 256, "Unsupported format: " + surfaceOutput.getFormat());
                Preconditions.checkState(jpegOutput == null, "Only one JPEG output is supported.");
                jpegOutput = new Triple<>(surface, surfaceOutput.getSize(), (float[]) this.mSurfaceOutputMatrix.clone());
            }
        }
        try {
            takeSnapshotAndDrawJpeg(jpegOutput);
        } catch (RuntimeException e2) {
            failAllPendingSnapshots(e2);
        }
    }

    private void takeSnapshotAndDrawJpeg(Triple<Surface, Size, float[]> jpegOutput) {
        if (this.mPendingSnapshots.isEmpty()) {
            return;
        }
        if (jpegOutput == null) {
            failAllPendingSnapshots(new Exception("Failed to snapshot: no JPEG Surface."));
            return;
        }
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] jpegBytes = null;
            int jpegQuality = -1;
            int rotationDegrees = -1;
            Bitmap bitmap = null;
            Iterator<PendingSnapshot> iterator = this.mPendingSnapshots.iterator();
            while (iterator.hasNext()) {
                PendingSnapshot pendingSnapshot = iterator.next();
                if (rotationDegrees != pendingSnapshot.getRotationDegrees() || bitmap == null) {
                    int rotationDegrees2 = pendingSnapshot.getRotationDegrees();
                    if (bitmap != null) {
                        bitmap.recycle();
                    }
                    Bitmap bitmap2 = getBitmap(jpegOutput.getSecond(), jpegOutput.getThird(), rotationDegrees2);
                    jpegQuality = -1;
                    bitmap = bitmap2;
                    rotationDegrees = rotationDegrees2;
                }
                int rotationDegrees3 = pendingSnapshot.getJpegQuality();
                if (jpegQuality != rotationDegrees3) {
                    outputStream.reset();
                    int jpegQuality2 = pendingSnapshot.getJpegQuality();
                    bitmap.compress(Bitmap.CompressFormat.JPEG, jpegQuality2, outputStream);
                    jpegBytes = outputStream.toByteArray();
                    jpegQuality = jpegQuality2;
                }
                ImageProcessingUtil.writeJpegBytesToSurface(jpegOutput.getFirst(), (byte[]) Objects.requireNonNull(jpegBytes));
                pendingSnapshot.getCompleter().set(null);
                iterator.remove();
            }
            outputStream.close();
        } catch (IOException e) {
            failAllPendingSnapshots(e);
        }
    }

    private void failAllPendingSnapshots(Throwable throwable) {
        for (PendingSnapshot pendingSnapshot : this.mPendingSnapshots) {
            pendingSnapshot.getCompleter().setException(throwable);
        }
        this.mPendingSnapshots.clear();
    }

    private Bitmap getBitmap(Size size, float[] textureTransform, int rotationDegrees) {
        float[] snapshotTransform = new float[16];
        Matrix.setIdentityM(snapshotTransform, 0);
        MatrixExt.preVerticalFlip(snapshotTransform, 0.5f);
        MatrixExt.preRotate(snapshotTransform, rotationDegrees, 0.5f, 0.5f);
        Matrix.multiplyMM(snapshotTransform, 0, snapshotTransform, 0, textureTransform, 0);
        return this.mGlRenderer.snapshot(TransformUtils.rotateSize(size, rotationDegrees), snapshotTransform);
    }

    private void checkReadyToRelease() {
        if (this.mIsReleased && this.mInputSurfaceCount == 0) {
            for (SurfaceOutput surfaceOutput : this.mOutputSurfaces.keySet()) {
                surfaceOutput.close();
            }
            for (PendingSnapshot pendingSnapshot : this.mPendingSnapshots) {
                pendingSnapshot.getCompleter().setException(new Exception("Failed to snapshot: DefaultSurfaceProcessor is released."));
            }
            this.mOutputSurfaces.clear();
            this.mGlRenderer.release();
            this.mGlThread.quit();
        }
    }

    private void initGlRenderer(final DynamicRange dynamicRange, final ShaderProvider shaderProvider) {
        ListenableFuture<Void> initFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda10
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DefaultSurfaceProcessor.this.m158x5398b3bc(dynamicRange, shaderProvider, completer);
            }
        });
        try {
            initFuture.get();
        } catch (InterruptedException | ExecutionException e) {
            Throwable cause = e instanceof ExecutionException ? e.getCause() : e;
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            throw new IllegalStateException("Failed to create DefaultSurfaceProcessor", cause);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$initGlRenderer$9$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ Object m158x5398b3bc(final DynamicRange dynamicRange, final ShaderProvider shaderProvider, final CallbackToFutureAdapter.Completer completer) throws Exception {
        executeSafely(new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                DefaultSurfaceProcessor.this.m157x2e04aabb(dynamicRange, shaderProvider, completer);
            }
        });
        return "Init GlRenderer";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$initGlRenderer$8$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m157x2e04aabb(DynamicRange dynamicRange, ShaderProvider shaderProvider, CallbackToFutureAdapter.Completer completer) {
        try {
            this.mGlRenderer.init(dynamicRange, shaderProvider);
            completer.set(null);
        } catch (RuntimeException e) {
            completer.setException(e);
        }
    }

    private void executeSafely(Runnable runnable) {
        executeSafely(runnable, new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                DefaultSurfaceProcessor.lambda$executeSafely$10();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$executeSafely$10() {
    }

    private void executeSafely(final Runnable runnable, final Runnable onFailure) {
        try {
            this.mGlExecutor.execute(new Runnable() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    DefaultSurfaceProcessor.this.m156x1dd83064(onFailure, runnable);
                }
            });
        } catch (RejectedExecutionException e) {
            Logger.w(TAG, "Unable to executor runnable", e);
            onFailure.run();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$executeSafely$11$androidx-camera-core-processing-DefaultSurfaceProcessor  reason: not valid java name */
    public /* synthetic */ void m156x1dd83064(Runnable onFailure, Runnable runnable) {
        if (this.mIsReleased) {
            onFailure.run();
        } else {
            runnable.run();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class PendingSnapshot {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract CallbackToFutureAdapter.Completer<Void> getCompleter();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getJpegQuality();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getRotationDegrees();

        static AutoValue_DefaultSurfaceProcessor_PendingSnapshot of(int jpegQuality, int rotationDegrees, CallbackToFutureAdapter.Completer<Void> completer) {
            return new AutoValue_DefaultSurfaceProcessor_PendingSnapshot(jpegQuality, rotationDegrees, completer);
        }
    }

    /* loaded from: classes.dex */
    public static class Factory {
        private static Function<DynamicRange, SurfaceProcessorInternal> sSupplier = new Function() { // from class: androidx.camera.core.processing.DefaultSurfaceProcessor$Factory$$ExternalSyntheticLambda0
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return new DefaultSurfaceProcessor((DynamicRange) obj);
            }
        };

        private Factory() {
        }

        public static SurfaceProcessorInternal newInstance(DynamicRange dynamicRange) {
            return sSupplier.apply(dynamicRange);
        }

        public static void setSupplier(Function<DynamicRange, SurfaceProcessorInternal> supplier) {
            sSupplier = supplier;
        }
    }
}
