package androidx.camera.core.imagecapture;

import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.internal.compat.workaround.CaptureFailedRetryEnabler;
import androidx.core.util.Preconditions;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public abstract class TakePictureRequest {
    private int mRemainingRetires = new CaptureFailedRetryEnabler().getRetryCount();

    /* loaded from: classes.dex */
    interface RetryControl {
        void retryRequest(TakePictureRequest takePictureRequest);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract Executor getAppExecutor();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract int getCaptureMode();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract Rect getCropRect();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract ImageCapture.OnImageCapturedCallback getInMemoryCallback();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract int getJpegQuality();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract ImageCapture.OnImageSavedCallback getOnDiskCallback();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract ImageCapture.OutputFileOptions getOutputFileOptions();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract int getRotationDegrees();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract Matrix getSensorToBufferTransform();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract List<CameraCaptureCallback> getSessionConfigCameraCaptureCallbacks();

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean decrementRetryCounter() {
        Threads.checkMainThread();
        if (this.mRemainingRetires > 0) {
            this.mRemainingRetires--;
            return true;
        }
        return false;
    }

    void incrementRetryCounter() {
        Threads.checkMainThread();
        this.mRemainingRetires++;
    }

    int getRemainingRetries() {
        Threads.checkMainThread();
        return this.mRemainingRetires;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onError(final ImageCaptureException imageCaptureException) {
        getAppExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m141x9daf4b5c(imageCaptureException);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onError$0$androidx-camera-core-imagecapture-TakePictureRequest  reason: not valid java name */
    public /* synthetic */ void m141x9daf4b5c(ImageCaptureException imageCaptureException) {
        boolean hasInMemory = getInMemoryCallback() != null;
        boolean hasOnDisk = getOnDiskCallback() != null;
        if (hasInMemory && !hasOnDisk) {
            ((ImageCapture.OnImageCapturedCallback) Objects.requireNonNull(getInMemoryCallback())).onError(imageCaptureException);
        } else if (hasOnDisk && !hasInMemory) {
            ((ImageCapture.OnImageSavedCallback) Objects.requireNonNull(getOnDiskCallback())).onError(imageCaptureException);
        } else {
            throw new IllegalStateException("One and only one callback is allowed.");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onResult$1$androidx-camera-core-imagecapture-TakePictureRequest  reason: not valid java name */
    public /* synthetic */ void m142x75636bce(ImageCapture.OutputFileResults outputFileResults) {
        ((ImageCapture.OnImageSavedCallback) Objects.requireNonNull(getOnDiskCallback())).onImageSaved((ImageCapture.OutputFileResults) Objects.requireNonNull(outputFileResults));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onResult(final ImageCapture.OutputFileResults outputFileResults) {
        getAppExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m142x75636bce(outputFileResults);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onResult$2$androidx-camera-core-imagecapture-TakePictureRequest  reason: not valid java name */
    public /* synthetic */ void m143x8f7eea6d(ImageProxy imageProxy) {
        ((ImageCapture.OnImageCapturedCallback) Objects.requireNonNull(getInMemoryCallback())).onCaptureSuccess((ImageProxy) Objects.requireNonNull(imageProxy));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onResult(final ImageProxy imageProxy) {
        getAppExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.TakePictureRequest$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                TakePictureRequest.this.m143x8f7eea6d(imageProxy);
            }
        });
    }

    public static TakePictureRequest of(Executor appExecutor, ImageCapture.OnImageCapturedCallback inMemoryCallback, ImageCapture.OnImageSavedCallback onDiskCallback, ImageCapture.OutputFileOptions outputFileOptions, Rect cropRect, Matrix sensorToBufferTransform, int rotationDegrees, int jpegQuality, int captureMode, List<CameraCaptureCallback> sessionConfigCameraCaptureCallbacks) {
        Preconditions.checkArgument((onDiskCallback == null) == (outputFileOptions == null), "onDiskCallback and outputFileOptions should be both null or both non-null.");
        Preconditions.checkArgument((inMemoryCallback == null) ^ (onDiskCallback == null), "One and only one on-disk or in-memory callback should be present.");
        return new AutoValue_TakePictureRequest(appExecutor, inMemoryCallback, onDiskCallback, outputFileOptions, cropRect, sensorToBufferTransform, rotationDegrees, jpegQuality, captureMode, sessionConfigCameraCaptureCallbacks);
    }
}
