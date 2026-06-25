package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.utils.Exif;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_Packet<T> extends Packet<T> {
    private final CameraCaptureResult cameraCaptureResult;
    private final Rect cropRect;
    private final T data;
    private final Exif exif;
    private final int format;
    private final int rotationDegrees;
    private final Matrix sensorToBufferTransform;
    private final Size size;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Packet(T data, Exif exif, int format, Size size, Rect cropRect, int rotationDegrees, Matrix sensorToBufferTransform, CameraCaptureResult cameraCaptureResult) {
        if (data == null) {
            throw new NullPointerException("Null data");
        }
        this.data = data;
        this.exif = exif;
        this.format = format;
        if (size == null) {
            throw new NullPointerException("Null size");
        }
        this.size = size;
        if (cropRect == null) {
            throw new NullPointerException("Null cropRect");
        }
        this.cropRect = cropRect;
        this.rotationDegrees = rotationDegrees;
        if (sensorToBufferTransform == null) {
            throw new NullPointerException("Null sensorToBufferTransform");
        }
        this.sensorToBufferTransform = sensorToBufferTransform;
        if (cameraCaptureResult == null) {
            throw new NullPointerException("Null cameraCaptureResult");
        }
        this.cameraCaptureResult = cameraCaptureResult;
    }

    @Override // androidx.camera.core.processing.Packet
    public T getData() {
        return this.data;
    }

    @Override // androidx.camera.core.processing.Packet
    public Exif getExif() {
        return this.exif;
    }

    @Override // androidx.camera.core.processing.Packet
    public int getFormat() {
        return this.format;
    }

    @Override // androidx.camera.core.processing.Packet
    public Size getSize() {
        return this.size;
    }

    @Override // androidx.camera.core.processing.Packet
    public Rect getCropRect() {
        return this.cropRect;
    }

    @Override // androidx.camera.core.processing.Packet
    public int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.processing.Packet
    public Matrix getSensorToBufferTransform() {
        return this.sensorToBufferTransform;
    }

    @Override // androidx.camera.core.processing.Packet
    public CameraCaptureResult getCameraCaptureResult() {
        return this.cameraCaptureResult;
    }

    public String toString() {
        return "Packet{data=" + this.data + ", exif=" + this.exif + ", format=" + this.format + ", size=" + this.size + ", cropRect=" + this.cropRect + ", rotationDegrees=" + this.rotationDegrees + ", sensorToBufferTransform=" + this.sensorToBufferTransform + ", cameraCaptureResult=" + this.cameraCaptureResult + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof Packet) {
            Packet<?> that = (Packet) o;
            return this.data.equals(that.getData()) && (this.exif != null ? this.exif.equals(that.getExif()) : that.getExif() == null) && this.format == that.getFormat() && this.size.equals(that.getSize()) && this.cropRect.equals(that.getCropRect()) && this.rotationDegrees == that.getRotationDegrees() && this.sensorToBufferTransform.equals(that.getSensorToBufferTransform()) && this.cameraCaptureResult.equals(that.getCameraCaptureResult());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((((h$ ^ this.data.hashCode()) * 1000003) ^ (this.exif == null ? 0 : this.exif.hashCode())) * 1000003) ^ this.format) * 1000003) ^ this.size.hashCode()) * 1000003) ^ this.cropRect.hashCode()) * 1000003) ^ this.rotationDegrees) * 1000003) ^ this.sensorToBufferTransform.hashCode()) * 1000003) ^ this.cameraCaptureResult.hashCode();
    }
}
