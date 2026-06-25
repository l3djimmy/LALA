package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureRequest;
import android.os.Handler;
import androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat;
import androidx.core.util.Preconditions;
import java.util.List;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class CameraCaptureSessionCompatBaseImpl implements CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl {
    final CameraCaptureSession mCameraCaptureSession;
    final Object mObject;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraCaptureSessionCompatBaseImpl(CameraCaptureSession captureSession, Object implParams) {
        this.mCameraCaptureSession = (CameraCaptureSession) Preconditions.checkNotNull(captureSession);
        this.mObject = implParams;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl create(CameraCaptureSession captureSession, Handler compatHandler) {
        return new CameraCaptureSessionCompatBaseImpl(captureSession, new CameraCaptureSessionCompatParamsApi21(compatHandler));
    }

    @Override // androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl
    public int captureBurstRequests(List<CaptureRequest> requests, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        CameraCaptureSession.CaptureCallback cb = new CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper(executor, listener);
        CameraCaptureSessionCompatParamsApi21 params = (CameraCaptureSessionCompatParamsApi21) this.mObject;
        return this.mCameraCaptureSession.captureBurst(requests, cb, params.mCompatHandler);
    }

    @Override // androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl
    public int captureSingleRequest(CaptureRequest request, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        CameraCaptureSession.CaptureCallback cb = new CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper(executor, listener);
        CameraCaptureSessionCompatParamsApi21 params = (CameraCaptureSessionCompatParamsApi21) this.mObject;
        return this.mCameraCaptureSession.capture(request, cb, params.mCompatHandler);
    }

    @Override // androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl
    public int setRepeatingBurstRequests(List<CaptureRequest> requests, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        CameraCaptureSession.CaptureCallback cb = new CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper(executor, listener);
        CameraCaptureSessionCompatParamsApi21 params = (CameraCaptureSessionCompatParamsApi21) this.mObject;
        return this.mCameraCaptureSession.setRepeatingBurst(requests, cb, params.mCompatHandler);
    }

    @Override // androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl
    public int setSingleRepeatingRequest(CaptureRequest request, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        CameraCaptureSession.CaptureCallback cb = new CameraCaptureSessionCompat.CaptureCallbackExecutorWrapper(executor, listener);
        CameraCaptureSessionCompatParamsApi21 params = (CameraCaptureSessionCompatParamsApi21) this.mObject;
        return this.mCameraCaptureSession.setRepeatingRequest(request, cb, params.mCompatHandler);
    }

    @Override // androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat.CameraCaptureSessionCompatImpl
    public CameraCaptureSession unwrap() {
        return this.mCameraCaptureSession;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class CameraCaptureSessionCompatParamsApi21 {
        final Handler mCompatHandler;

        CameraCaptureSessionCompatParamsApi21(Handler compatHandler) {
            this.mCompatHandler = compatHandler;
        }
    }
}
