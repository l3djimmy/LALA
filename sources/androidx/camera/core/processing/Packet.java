package androidx.camera.core.processing;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.core.util.Preconditions;
/* loaded from: classes.dex */
public abstract class Packet<T> {
    public abstract CameraCaptureResult getCameraCaptureResult();

    public abstract Rect getCropRect();

    public abstract T getData();

    public abstract Exif getExif();

    public abstract int getFormat();

    public abstract int getRotationDegrees();

    public abstract Matrix getSensorToBufferTransform();

    public abstract Size getSize();

    public boolean hasCropping() {
        return TransformUtils.hasCropping(getCropRect(), getSize());
    }

    public static Packet<Bitmap> of(Bitmap data, Exif exif, Rect cropRect, int rotationDegrees, Matrix sensorToBufferTransform, CameraCaptureResult cameraCaptureResult) {
        return new AutoValue_Packet(data, exif, 42, new Size(data.getWidth(), data.getHeight()), cropRect, rotationDegrees, sensorToBufferTransform, cameraCaptureResult);
    }

    public static Packet<ImageProxy> of(ImageProxy data, Exif exif, Rect cropRect, int rotationDegrees, Matrix sensorToBufferTransform, CameraCaptureResult cameraCaptureResult) {
        return of(data, exif, new Size(data.getWidth(), data.getHeight()), cropRect, rotationDegrees, sensorToBufferTransform, cameraCaptureResult);
    }

    public static Packet<ImageProxy> of(ImageProxy data, Exif exif, Size size, Rect cropRect, int rotationDegrees, Matrix sensorToBufferTransform, CameraCaptureResult cameraCaptureResult) {
        if (data.getFormat() == 256) {
            Preconditions.checkNotNull(exif, "JPEG image must have Exif.");
        }
        return new AutoValue_Packet(data, exif, data.getFormat(), size, cropRect, rotationDegrees, sensorToBufferTransform, cameraCaptureResult);
    }

    public static Packet<byte[]> of(byte[] data, Exif exif, int format, Size size, Rect cropRect, int rotationDegrees, Matrix sensorToBufferTransform, CameraCaptureResult cameraCaptureResult) {
        return new AutoValue_Packet(data, exif, format, size, cropRect, rotationDegrees, sensorToBufferTransform, cameraCaptureResult);
    }
}
