package androidx.camera.camera2.internal;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.ZoomControl;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.CameraControl;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class CropRegionZoomImpl implements ZoomControl.ZoomImpl {
    public static final float MIN_DIGITAL_ZOOM = 1.0f;
    private final CameraCharacteristicsCompat mCameraCharacteristics;
    private Rect mCurrentCropRect = null;
    private Rect mPendingZoomCropRegion = null;
    private CallbackToFutureAdapter.Completer<Void> mPendingZoomRatioCompleter;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CropRegionZoomImpl(CameraCharacteristicsCompat cameraCharacteristics) {
        this.mCameraCharacteristics = cameraCharacteristics;
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public float getMinZoom() {
        return 1.0f;
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public float getMaxZoom() {
        Float maxZoom = (Float) this.mCameraCharacteristics.get(CameraCharacteristics.SCALER_AVAILABLE_MAX_DIGITAL_ZOOM);
        if (maxZoom == null) {
            return 1.0f;
        }
        if (maxZoom.floatValue() < getMinZoom()) {
            return getMinZoom();
        }
        return maxZoom.floatValue();
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public void addRequestOption(Camera2ImplConfig.Builder builder) {
        if (this.mCurrentCropRect != null) {
            builder.setCaptureRequestOption(CaptureRequest.SCALER_CROP_REGION, this.mCurrentCropRect);
        }
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public void resetZoom() {
        this.mPendingZoomCropRegion = null;
        this.mCurrentCropRect = null;
        if (this.mPendingZoomRatioCompleter != null) {
            this.mPendingZoomRatioCompleter.setException(new CameraControl.OperationCanceledException("Camera is not active."));
            this.mPendingZoomRatioCompleter = null;
        }
    }

    private Rect getSensorRect() {
        return (Rect) Preconditions.checkNotNull((Rect) this.mCameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE));
    }

    private static Rect getCropRectByRatio(Rect sensorRect, float ratio) {
        float cropWidth = sensorRect.width() / ratio;
        float cropHeight = sensorRect.height() / ratio;
        float left = (sensorRect.width() - cropWidth) / 2.0f;
        float top = (sensorRect.height() - cropHeight) / 2.0f;
        return new Rect((int) left, (int) top, (int) (left + cropWidth), (int) (top + cropHeight));
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public void setZoomRatio(float zoomRatio, CallbackToFutureAdapter.Completer<Void> completer) {
        Rect sensorRect = getSensorRect();
        this.mCurrentCropRect = getCropRectByRatio(sensorRect, zoomRatio);
        if (this.mPendingZoomRatioCompleter != null) {
            this.mPendingZoomRatioCompleter.setException(new CameraControl.OperationCanceledException("There is a new zoomRatio being set"));
        }
        this.mPendingZoomCropRegion = this.mCurrentCropRect;
        this.mPendingZoomRatioCompleter = completer;
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public void onCaptureResult(TotalCaptureResult captureResult) {
        Rect cropRect;
        if (this.mPendingZoomRatioCompleter != null) {
            CaptureRequest request = captureResult.getRequest();
            if (request == null) {
                cropRect = null;
            } else {
                cropRect = (Rect) request.get(CaptureRequest.SCALER_CROP_REGION);
            }
            if (this.mPendingZoomCropRegion != null && this.mPendingZoomCropRegion.equals(cropRect)) {
                this.mPendingZoomRatioCompleter.set(null);
                this.mPendingZoomRatioCompleter = null;
                this.mPendingZoomCropRegion = null;
            }
        }
    }

    @Override // androidx.camera.camera2.internal.ZoomControl.ZoomImpl
    public Rect getCropSensorRegion() {
        return this.mCurrentCropRect != null ? this.mCurrentCropRect : getSensorRect();
    }
}
