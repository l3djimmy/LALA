package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.ImageWriter;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.internal.compat.ImageWriterCompat;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.os.OperationCanceledException;
import java.nio.ByteBuffer;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public abstract class ImageAnalysisAbstractAnalyzer implements ImageReaderProxy.OnImageAvailableListener {
    private static final String TAG = "ImageAnalysisAnalyzer";
    private volatile boolean mOnePixelShiftEnabled;
    private volatile boolean mOutputImageRotationEnabled;
    private volatile int mPrevBufferRotationDegrees;
    private SafeCloseImageReaderProxy mProcessedImageReaderProxy;
    private ImageWriter mProcessedImageWriter;
    ByteBuffer mRGBConvertedBuffer;
    private volatile int mRelativeRotation;
    private ImageAnalysis.Analyzer mSubscribedAnalyzer;
    ByteBuffer mURotatedBuffer;
    private Executor mUserExecutor;
    ByteBuffer mVRotatedBuffer;
    ByteBuffer mYRotatedBuffer;
    private volatile int mOutputImageFormat = 1;
    private Rect mOriginalViewPortCropRect = new Rect();
    private Rect mUpdatedViewPortCropRect = new Rect();
    private Matrix mOriginalSensorToBufferTransformMatrix = new Matrix();
    private Matrix mUpdatedSensorToBufferTransformMatrix = new Matrix();
    private final Object mAnalyzerLock = new Object();
    protected boolean mIsAttached = true;

    abstract ImageProxy acquireImage(ImageReaderProxy imageReaderProxy);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void clearCache();

    abstract void onValidImageAvailable(ImageProxy imageProxy);

    @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
    public void onImageAvailable(ImageReaderProxy imageReaderProxy) {
        try {
            ImageProxy imageProxy = acquireImage(imageReaderProxy);
            if (imageProxy != null) {
                onValidImageAvailable(imageProxy);
            }
        } catch (IllegalStateException e) {
            Logger.e(TAG, "Failed to acquire image.", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00c2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.common.util.concurrent.ListenableFuture<java.lang.Void> analyzeImage(final androidx.camera.core.ImageProxy r22) {
        /*
            Method dump skipped, instructions count: 283
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.ImageAnalysisAbstractAnalyzer.analyzeImage(androidx.camera.core.ImageProxy):com.google.common.util.concurrent.ListenableFuture");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$analyzeImage$1$androidx-camera-core-ImageAnalysisAbstractAnalyzer  reason: not valid java name */
    public /* synthetic */ Object m113x9959ff20(Executor executor, final ImageProxy imageProxy, final Matrix transformMatrix, final ImageProxy outputImageProxy, final Rect cropRect, final ImageAnalysis.Analyzer analyzer, final CallbackToFutureAdapter.Completer completer) throws Exception {
        executor.execute(new Runnable() { // from class: androidx.camera.core.ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ImageAnalysisAbstractAnalyzer.this.m112x6b8164c1(imageProxy, transformMatrix, outputImageProxy, cropRect, analyzer, completer);
            }
        });
        return "analyzeImage";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$analyzeImage$0$androidx-camera-core-ImageAnalysisAbstractAnalyzer  reason: not valid java name */
    public /* synthetic */ void m112x6b8164c1(ImageProxy imageProxy, Matrix transformMatrix, ImageProxy outputImageProxy, Rect cropRect, ImageAnalysis.Analyzer analyzer, CallbackToFutureAdapter.Completer completer) {
        if (this.mIsAttached) {
            ImageInfo imageInfo = ImmutableImageInfo.create(imageProxy.getImageInfo().getTagBundle(), imageProxy.getImageInfo().getTimestamp(), this.mOutputImageRotationEnabled ? 0 : this.mRelativeRotation, transformMatrix);
            ImageProxy outputSettableImageProxy = new SettableImageProxy(outputImageProxy, imageInfo);
            if (!cropRect.isEmpty()) {
                outputSettableImageProxy.setCropRect(cropRect);
            }
            analyzer.analyze(outputSettableImageProxy);
            completer.set(null);
            return;
        }
        completer.setException(new OperationCanceledException("ImageAnalysis is detached"));
    }

    private static SafeCloseImageReaderProxy createImageReaderProxy(int imageWidth, int imageHeight, int rotation, int format, int maxImages) {
        boolean flipWH = rotation == 90 || rotation == 270;
        int width = flipWH ? imageHeight : imageWidth;
        int height = flipWH ? imageWidth : imageHeight;
        return new SafeCloseImageReaderProxy(ImageReaderProxys.createIsolatedReader(width, height, format, maxImages));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setRelativeRotation(int relativeRotation) {
        this.mRelativeRotation = relativeRotation;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOutputImageRotationEnabled(boolean outputImageRotationEnabled) {
        this.mOutputImageRotationEnabled = outputImageRotationEnabled;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOutputImageFormat(int outputImageFormat) {
        this.mOutputImageFormat = outputImageFormat;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOnePixelShiftEnabled(boolean onePixelShiftEnabled) {
        this.mOnePixelShiftEnabled = onePixelShiftEnabled;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setViewPortCropRect(Rect viewPortCropRect) {
        synchronized (this.mAnalyzerLock) {
            this.mOriginalViewPortCropRect = viewPortCropRect;
            this.mUpdatedViewPortCropRect = new Rect(this.mOriginalViewPortCropRect);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSensorToBufferTransformMatrix(Matrix sensorToBufferTransformMatrix) {
        synchronized (this.mAnalyzerLock) {
            this.mOriginalSensorToBufferTransformMatrix = sensorToBufferTransformMatrix;
            this.mUpdatedSensorToBufferTransformMatrix = new Matrix(this.mOriginalSensorToBufferTransformMatrix);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setProcessedImageReaderProxy(SafeCloseImageReaderProxy processedImageReaderProxy) {
        synchronized (this.mAnalyzerLock) {
            this.mProcessedImageReaderProxy = processedImageReaderProxy;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setAnalyzer(Executor userExecutor, ImageAnalysis.Analyzer subscribedAnalyzer) {
        if (subscribedAnalyzer == null) {
            clearCache();
        }
        synchronized (this.mAnalyzerLock) {
            this.mSubscribedAnalyzer = subscribedAnalyzer;
            this.mUserExecutor = userExecutor;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void attach() {
        this.mIsAttached = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void detach() {
        this.mIsAttached = false;
        clearCache();
    }

    private void createHelperBuffer(ImageProxy imageProxy) {
        if (this.mOutputImageFormat == 1) {
            if (this.mYRotatedBuffer == null) {
                this.mYRotatedBuffer = ByteBuffer.allocateDirect(imageProxy.getWidth() * imageProxy.getHeight());
            }
            this.mYRotatedBuffer.position(0);
            if (this.mURotatedBuffer == null) {
                this.mURotatedBuffer = ByteBuffer.allocateDirect((imageProxy.getWidth() * imageProxy.getHeight()) / 4);
            }
            this.mURotatedBuffer.position(0);
            if (this.mVRotatedBuffer == null) {
                this.mVRotatedBuffer = ByteBuffer.allocateDirect((imageProxy.getWidth() * imageProxy.getHeight()) / 4);
            }
            this.mVRotatedBuffer.position(0);
        } else if (this.mOutputImageFormat == 2 && this.mRGBConvertedBuffer == null) {
            this.mRGBConvertedBuffer = ByteBuffer.allocateDirect(imageProxy.getWidth() * imageProxy.getHeight() * 4);
        }
    }

    private void recreateImageReaderProxy(ImageProxy imageProxy, int relativeRotation) {
        if (this.mProcessedImageReaderProxy == null) {
            return;
        }
        this.mProcessedImageReaderProxy.safeClose();
        this.mProcessedImageReaderProxy = createImageReaderProxy(imageProxy.getWidth(), imageProxy.getHeight(), relativeRotation, this.mProcessedImageReaderProxy.getImageFormat(), this.mProcessedImageReaderProxy.getMaxImages());
        if (this.mOutputImageFormat == 1) {
            if (this.mProcessedImageWriter != null) {
                ImageWriterCompat.close(this.mProcessedImageWriter);
            }
            this.mProcessedImageWriter = ImageWriterCompat.newInstance(this.mProcessedImageReaderProxy.getSurface(), this.mProcessedImageReaderProxy.getMaxImages());
        }
    }

    private void recalculateTransformMatrixAndCropRect(int originalWidth, int originalHeight, int rotatedWidth, int rotatedHeight) {
        Matrix additionalTransformMatrix = getAdditionalTransformMatrixAppliedByProcessor(originalWidth, originalHeight, rotatedWidth, rotatedHeight, this.mRelativeRotation);
        this.mUpdatedViewPortCropRect = getUpdatedCropRect(this.mOriginalViewPortCropRect, additionalTransformMatrix);
        this.mUpdatedSensorToBufferTransformMatrix.setConcat(this.mOriginalSensorToBufferTransformMatrix, additionalTransformMatrix);
    }

    static Rect getUpdatedCropRect(Rect originalCropRect, Matrix additionalTransformMatrix) {
        RectF rectF = new RectF(originalCropRect);
        additionalTransformMatrix.mapRect(rectF);
        Rect rect = new Rect();
        rectF.round(rect);
        return rect;
    }

    static Matrix getAdditionalTransformMatrixAppliedByProcessor(int originalWidth, int originalHeight, int rotatedWidth, int rotatedHeight, int relativeRotation) {
        Matrix matrix = new Matrix();
        if (relativeRotation > 0) {
            matrix.setRectToRect(new RectF(0.0f, 0.0f, originalWidth, originalHeight), TransformUtils.NORMALIZED_RECT, Matrix.ScaleToFit.FILL);
            matrix.postRotate(relativeRotation);
            matrix.postConcat(TransformUtils.getNormalizedToBuffer(new RectF(0.0f, 0.0f, rotatedWidth, rotatedHeight)));
        }
        return matrix;
    }
}
