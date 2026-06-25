package androidx.camera.core;

import android.graphics.Matrix;
import androidx.camera.core.impl.TagBundle;
/* loaded from: classes.dex */
final class AutoValue_ImmutableImageInfo extends ImmutableImageInfo {
    private final int rotationDegrees;
    private final Matrix sensorToBufferTransformMatrix;
    private final TagBundle tagBundle;
    private final long timestamp;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_ImmutableImageInfo(TagBundle tagBundle, long timestamp, int rotationDegrees, Matrix sensorToBufferTransformMatrix) {
        if (tagBundle == null) {
            throw new NullPointerException("Null tagBundle");
        }
        this.tagBundle = tagBundle;
        this.timestamp = timestamp;
        this.rotationDegrees = rotationDegrees;
        if (sensorToBufferTransformMatrix == null) {
            throw new NullPointerException("Null sensorToBufferTransformMatrix");
        }
        this.sensorToBufferTransformMatrix = sensorToBufferTransformMatrix;
    }

    @Override // androidx.camera.core.ImmutableImageInfo, androidx.camera.core.ImageInfo
    public TagBundle getTagBundle() {
        return this.tagBundle;
    }

    @Override // androidx.camera.core.ImmutableImageInfo, androidx.camera.core.ImageInfo
    public long getTimestamp() {
        return this.timestamp;
    }

    @Override // androidx.camera.core.ImmutableImageInfo, androidx.camera.core.ImageInfo
    public int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.ImmutableImageInfo, androidx.camera.core.ImageInfo
    public Matrix getSensorToBufferTransformMatrix() {
        return this.sensorToBufferTransformMatrix;
    }

    public String toString() {
        return "ImmutableImageInfo{tagBundle=" + this.tagBundle + ", timestamp=" + this.timestamp + ", rotationDegrees=" + this.rotationDegrees + ", sensorToBufferTransformMatrix=" + this.sensorToBufferTransformMatrix + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof ImmutableImageInfo) {
            ImmutableImageInfo that = (ImmutableImageInfo) o;
            return this.tagBundle.equals(that.getTagBundle()) && this.timestamp == that.getTimestamp() && this.rotationDegrees == that.getRotationDegrees() && this.sensorToBufferTransformMatrix.equals(that.getSensorToBufferTransformMatrix());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.tagBundle.hashCode()) * 1000003) ^ ((int) ((this.timestamp >>> 32) ^ this.timestamp))) * 1000003) ^ this.rotationDegrees) * 1000003) ^ this.sensorToBufferTransformMatrix.hashCode();
    }
}
