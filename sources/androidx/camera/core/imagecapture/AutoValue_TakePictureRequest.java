package androidx.camera.core.imagecapture;

import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.impl.CameraCaptureCallback;
import java.util.List;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_TakePictureRequest extends TakePictureRequest {
    private final Executor appExecutor;
    private final int captureMode;
    private final Rect cropRect;
    private final ImageCapture.OnImageCapturedCallback inMemoryCallback;
    private final int jpegQuality;
    private final ImageCapture.OnImageSavedCallback onDiskCallback;
    private final ImageCapture.OutputFileOptions outputFileOptions;
    private final int rotationDegrees;
    private final Matrix sensorToBufferTransform;
    private final List<CameraCaptureCallback> sessionConfigCameraCaptureCallbacks;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_TakePictureRequest(Executor appExecutor, ImageCapture.OnImageCapturedCallback inMemoryCallback, ImageCapture.OnImageSavedCallback onDiskCallback, ImageCapture.OutputFileOptions outputFileOptions, Rect cropRect, Matrix sensorToBufferTransform, int rotationDegrees, int jpegQuality, int captureMode, List<CameraCaptureCallback> sessionConfigCameraCaptureCallbacks) {
        if (appExecutor == null) {
            throw new NullPointerException("Null appExecutor");
        }
        this.appExecutor = appExecutor;
        this.inMemoryCallback = inMemoryCallback;
        this.onDiskCallback = onDiskCallback;
        this.outputFileOptions = outputFileOptions;
        if (cropRect == null) {
            throw new NullPointerException("Null cropRect");
        }
        this.cropRect = cropRect;
        if (sensorToBufferTransform == null) {
            throw new NullPointerException("Null sensorToBufferTransform");
        }
        this.sensorToBufferTransform = sensorToBufferTransform;
        this.rotationDegrees = rotationDegrees;
        this.jpegQuality = jpegQuality;
        this.captureMode = captureMode;
        if (sessionConfigCameraCaptureCallbacks == null) {
            throw new NullPointerException("Null sessionConfigCameraCaptureCallbacks");
        }
        this.sessionConfigCameraCaptureCallbacks = sessionConfigCameraCaptureCallbacks;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    Executor getAppExecutor() {
        return this.appExecutor;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    ImageCapture.OnImageCapturedCallback getInMemoryCallback() {
        return this.inMemoryCallback;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    ImageCapture.OnImageSavedCallback getOnDiskCallback() {
        return this.onDiskCallback;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    ImageCapture.OutputFileOptions getOutputFileOptions() {
        return this.outputFileOptions;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    Rect getCropRect() {
        return this.cropRect;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    Matrix getSensorToBufferTransform() {
        return this.sensorToBufferTransform;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    int getJpegQuality() {
        return this.jpegQuality;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    int getCaptureMode() {
        return this.captureMode;
    }

    @Override // androidx.camera.core.imagecapture.TakePictureRequest
    List<CameraCaptureCallback> getSessionConfigCameraCaptureCallbacks() {
        return this.sessionConfigCameraCaptureCallbacks;
    }

    public String toString() {
        return "TakePictureRequest{appExecutor=" + this.appExecutor + ", inMemoryCallback=" + this.inMemoryCallback + ", onDiskCallback=" + this.onDiskCallback + ", outputFileOptions=" + this.outputFileOptions + ", cropRect=" + this.cropRect + ", sensorToBufferTransform=" + this.sensorToBufferTransform + ", rotationDegrees=" + this.rotationDegrees + ", jpegQuality=" + this.jpegQuality + ", captureMode=" + this.captureMode + ", sessionConfigCameraCaptureCallbacks=" + this.sessionConfigCameraCaptureCallbacks + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof TakePictureRequest) {
            TakePictureRequest that = (TakePictureRequest) o;
            return this.appExecutor.equals(that.getAppExecutor()) && (this.inMemoryCallback != null ? this.inMemoryCallback.equals(that.getInMemoryCallback()) : that.getInMemoryCallback() == null) && (this.onDiskCallback != null ? this.onDiskCallback.equals(that.getOnDiskCallback()) : that.getOnDiskCallback() == null) && (this.outputFileOptions != null ? this.outputFileOptions.equals(that.getOutputFileOptions()) : that.getOutputFileOptions() == null) && this.cropRect.equals(that.getCropRect()) && this.sensorToBufferTransform.equals(that.getSensorToBufferTransform()) && this.rotationDegrees == that.getRotationDegrees() && this.jpegQuality == that.getJpegQuality() && this.captureMode == that.getCaptureMode() && this.sessionConfigCameraCaptureCallbacks.equals(that.getSessionConfigCameraCaptureCallbacks());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((((((h$ ^ this.appExecutor.hashCode()) * 1000003) ^ (this.inMemoryCallback == null ? 0 : this.inMemoryCallback.hashCode())) * 1000003) ^ (this.onDiskCallback == null ? 0 : this.onDiskCallback.hashCode())) * 1000003) ^ (this.outputFileOptions != null ? this.outputFileOptions.hashCode() : 0)) * 1000003) ^ this.cropRect.hashCode()) * 1000003) ^ this.sensorToBufferTransform.hashCode()) * 1000003) ^ this.rotationDegrees) * 1000003) ^ this.jpegQuality) * 1000003) ^ this.captureMode) * 1000003) ^ this.sessionConfigCameraCaptureCallbacks.hashCode();
    }
}
