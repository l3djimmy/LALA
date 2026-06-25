package androidx.camera.camera2.internal.compat;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.params.InputConfiguration;
import android.os.Handler;
import androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat;
import androidx.camera.camera2.internal.compat.CameraDeviceCompatBaseImpl;
import androidx.camera.camera2.internal.compat.params.InputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.core.util.Preconditions;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class CameraDeviceCompatApi24Impl extends CameraDeviceCompatApi23Impl {
    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraDeviceCompatApi24Impl(CameraDevice cameraDevice, Object implParams) {
        super(cameraDevice, implParams);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CameraDeviceCompatApi24Impl create(CameraDevice cameraDevice, Handler compatHandler) {
        return new CameraDeviceCompatApi24Impl(cameraDevice, new CameraDeviceCompatBaseImpl.CameraDeviceCompatParamsApi21(compatHandler));
    }

    @Override // androidx.camera.camera2.internal.compat.CameraDeviceCompatApi23Impl, androidx.camera.camera2.internal.compat.CameraDeviceCompatBaseImpl, androidx.camera.camera2.internal.compat.CameraDeviceCompat.CameraDeviceCompatImpl
    public void createCaptureSession(SessionConfigurationCompat config) throws CameraAccessExceptionCompat {
        checkPreconditions(this.mCameraDevice, config);
        CameraCaptureSession.StateCallback cb = new CameraCaptureSessionCompat.StateCallbackExecutorWrapper(config.getExecutor(), config.getStateCallback());
        List<OutputConfigurationCompat> outputs = config.getOutputConfigurations();
        CameraDeviceCompatBaseImpl.CameraDeviceCompatParamsApi21 params = (CameraDeviceCompatBaseImpl.CameraDeviceCompatParamsApi21) this.mImplParams;
        Handler handler = ((CameraDeviceCompatBaseImpl.CameraDeviceCompatParamsApi21) Preconditions.checkNotNull(params)).mCompatHandler;
        InputConfigurationCompat inputConfigCompat = config.getInputConfiguration();
        try {
            if (inputConfigCompat != null) {
                InputConfiguration inputConfig = (InputConfiguration) inputConfigCompat.unwrap();
                Preconditions.checkNotNull(inputConfig);
                this.mCameraDevice.createReprocessableCaptureSessionByConfigurations(inputConfig, SessionConfigurationCompat.transformFromCompat(outputs), cb, handler);
            } else if (config.getSessionType() == 1) {
                this.mCameraDevice.createConstrainedHighSpeedCaptureSession(unpackSurfaces(outputs), cb, handler);
            } else {
                this.mCameraDevice.createCaptureSessionByOutputConfigurations(SessionConfigurationCompat.transformFromCompat(outputs), cb, handler);
            }
        } catch (CameraAccessException e) {
            throw CameraAccessExceptionCompat.toCameraAccessExceptionCompat(e);
        }
    }
}
