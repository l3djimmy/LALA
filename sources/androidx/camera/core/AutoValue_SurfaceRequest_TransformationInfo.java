package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import androidx.camera.core.SurfaceRequest;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_SurfaceRequest_TransformationInfo extends SurfaceRequest.TransformationInfo {
    private final Rect getCropRect;
    private final boolean getMirroring;
    private final int getRotationDegrees;
    private final Matrix getSensorToBufferTransform;
    private final int getTargetRotation;
    private final boolean hasCameraTransform;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_SurfaceRequest_TransformationInfo(Rect getCropRect, int getRotationDegrees, int getTargetRotation, boolean hasCameraTransform, Matrix getSensorToBufferTransform, boolean getMirroring) {
        if (getCropRect == null) {
            throw new NullPointerException("Null getCropRect");
        }
        this.getCropRect = getCropRect;
        this.getRotationDegrees = getRotationDegrees;
        this.getTargetRotation = getTargetRotation;
        this.hasCameraTransform = hasCameraTransform;
        if (getSensorToBufferTransform == null) {
            throw new NullPointerException("Null getSensorToBufferTransform");
        }
        this.getSensorToBufferTransform = getSensorToBufferTransform;
        this.getMirroring = getMirroring;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public Rect getCropRect() {
        return this.getCropRect;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public int getRotationDegrees() {
        return this.getRotationDegrees;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public int getTargetRotation() {
        return this.getTargetRotation;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public boolean hasCameraTransform() {
        return this.hasCameraTransform;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public Matrix getSensorToBufferTransform() {
        return this.getSensorToBufferTransform;
    }

    @Override // androidx.camera.core.SurfaceRequest.TransformationInfo
    public boolean getMirroring() {
        return this.getMirroring;
    }

    public String toString() {
        return "TransformationInfo{getCropRect=" + this.getCropRect + ", getRotationDegrees=" + this.getRotationDegrees + ", getTargetRotation=" + this.getTargetRotation + ", hasCameraTransform=" + this.hasCameraTransform + ", getSensorToBufferTransform=" + this.getSensorToBufferTransform + ", getMirroring=" + this.getMirroring + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SurfaceRequest.TransformationInfo) {
            SurfaceRequest.TransformationInfo that = (SurfaceRequest.TransformationInfo) o;
            return this.getCropRect.equals(that.getCropRect()) && this.getRotationDegrees == that.getRotationDegrees() && this.getTargetRotation == that.getTargetRotation() && this.hasCameraTransform == that.hasCameraTransform() && this.getSensorToBufferTransform.equals(that.getSensorToBufferTransform()) && this.getMirroring == that.getMirroring();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ this.getCropRect.hashCode()) * 1000003) ^ this.getRotationDegrees) * 1000003) ^ this.getTargetRotation) * 1000003) ^ (this.hasCameraTransform ? 1231 : 1237)) * 1000003) ^ this.getSensorToBufferTransform.hashCode()) * 1000003) ^ (this.getMirroring ? 1231 : 1237);
    }
}
