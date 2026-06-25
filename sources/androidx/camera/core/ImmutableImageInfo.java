package androidx.camera.core;

import android.graphics.Matrix;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.impl.utils.ExifData;
/* loaded from: classes.dex */
public abstract class ImmutableImageInfo implements ImageInfo {
    @Override // androidx.camera.core.ImageInfo
    public abstract int getRotationDegrees();

    @Override // androidx.camera.core.ImageInfo
    public abstract Matrix getSensorToBufferTransformMatrix();

    @Override // androidx.camera.core.ImageInfo
    public abstract TagBundle getTagBundle();

    @Override // androidx.camera.core.ImageInfo
    public abstract long getTimestamp();

    public static ImageInfo create(TagBundle tag, long timestamp, int rotationDegrees, Matrix sensorToBufferTransformMatrix) {
        return new AutoValue_ImmutableImageInfo(tag, timestamp, rotationDegrees, sensorToBufferTransformMatrix);
    }

    @Override // androidx.camera.core.ImageInfo
    public void populateExifData(ExifData.Builder exifBuilder) {
        exifBuilder.setOrientationDegrees(getRotationDegrees());
    }
}
