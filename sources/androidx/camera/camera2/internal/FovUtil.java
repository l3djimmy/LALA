package androidx.camera.camera2.internal;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics;
import android.util.Size;
import android.util.SizeF;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.core.util.Preconditions;
/* loaded from: classes.dex */
public class FovUtil {
    private static final String TAG = "FovUtil";

    private FovUtil() {
    }

    public static int focalLengthToViewAngleDegrees(float focalLength, float sensorLength) {
        Preconditions.checkArgument(focalLength > 0.0f, "Focal length should be positive.");
        Preconditions.checkArgument(sensorLength > 0.0f, "Sensor length should be positive.");
        int viewAngleDegrees = (int) Math.toDegrees(Math.atan(sensorLength / (2.0f * focalLength)) * 2.0d);
        Preconditions.checkArgumentInRange(viewAngleDegrees, 0, 360, "The provided focal length and sensor length result in an invalid view angle degrees.");
        return viewAngleDegrees;
    }

    public static int getDeviceDefaultViewAngleDegrees(CameraManagerCompat cameraManager, int lensFacing) {
        try {
            String[] cameraIds = cameraManager.getCameraIdList();
            for (String cameraId : cameraIds) {
                CameraCharacteristicsCompat cameraCharacteristics = cameraManager.getCameraCharacteristicsCompat(cameraId);
                Integer cameraCharacteristicsLensFacing = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
                Preconditions.checkNotNull(cameraCharacteristicsLensFacing, "Lens facing can not be null");
                if (cameraCharacteristicsLensFacing.intValue() == LensFacingUtil.getLensFacingInt(lensFacing)) {
                    return focalLengthToViewAngleDegrees(getDefaultFocalLength(cameraCharacteristics), getSensorHorizontalLength(cameraCharacteristics));
                }
            }
            throw new IllegalArgumentException("Unable to get the default focal length with the specified lens facing.");
        } catch (CameraAccessExceptionCompat e) {
            throw new IllegalArgumentException("Unable to get the default focal length.");
        }
    }

    public static float getSensorHorizontalLength(CameraCharacteristicsCompat cameraCharacteristics) {
        SizeF sensorSize = (SizeF) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
        Rect activeArrayRect = (Rect) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_ACTIVE_ARRAY_SIZE);
        Size pixelArraySize = (Size) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PIXEL_ARRAY_SIZE);
        Integer sensorOrientation = (Integer) cameraCharacteristics.get(CameraCharacteristics.SENSOR_ORIENTATION);
        Preconditions.checkNotNull(sensorSize, "The sensor size can't be null.");
        Preconditions.checkNotNull(sensorOrientation, "The sensor orientation can't be null.");
        Preconditions.checkNotNull(activeArrayRect, "The active array size can't be null.");
        Preconditions.checkNotNull(pixelArraySize, "The pixel array size can't be null.");
        Size activeArraySize = TransformUtils.rectToSize(activeArrayRect);
        if (TransformUtils.is90or270(sensorOrientation.intValue())) {
            sensorSize = TransformUtils.reverseSizeF(sensorSize);
            activeArraySize = TransformUtils.reverseSize(activeArraySize);
            pixelArraySize = TransformUtils.reverseSize(pixelArraySize);
        }
        return (sensorSize.getWidth() * activeArraySize.getWidth()) / pixelArraySize.getWidth();
    }

    public static float getDefaultFocalLength(CameraCharacteristicsCompat cameraCharacteristics) {
        float[] focalLengths = (float[]) cameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        Preconditions.checkNotNull(focalLengths, "The focal lengths can not be empty.");
        return focalLengths[0];
    }
}
