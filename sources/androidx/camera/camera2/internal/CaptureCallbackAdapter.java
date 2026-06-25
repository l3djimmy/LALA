package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.TagBundle;
import androidx.core.util.Preconditions;
/* loaded from: classes.dex */
final class CaptureCallbackAdapter extends CameraCaptureSession.CaptureCallback {
    private final CameraCaptureCallback mCameraCaptureCallback;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CaptureCallbackAdapter(CameraCaptureCallback cameraCaptureCallback) {
        if (cameraCaptureCallback == null) {
            throw new NullPointerException("cameraCaptureCallback is null");
        }
        this.mCameraCaptureCallback = cameraCaptureCallback;
    }

    @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
    public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
        TagBundle tagBundle;
        super.onCaptureCompleted(session, request, result);
        Object captureRequestTag = request.getTag();
        if (captureRequestTag != null) {
            Preconditions.checkArgument(captureRequestTag instanceof TagBundle, "The tagBundle object from the CaptureResult is not a TagBundle object.");
            tagBundle = (TagBundle) captureRequestTag;
        } else {
            tagBundle = TagBundle.emptyBundle();
        }
        this.mCameraCaptureCallback.onCaptureCompleted(new Camera2CameraCaptureResult(tagBundle, result));
    }

    @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
    public void onCaptureFailed(CameraCaptureSession session, CaptureRequest request, CaptureFailure failure) {
        super.onCaptureFailed(session, request, failure);
        CameraCaptureFailure cameraFailure = new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR);
        this.mCameraCaptureCallback.onCaptureFailed(cameraFailure);
    }
}
