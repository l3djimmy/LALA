package androidx.camera.core.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfigFactory;
import java.util.List;
/* loaded from: classes.dex */
public abstract class AttachedSurfaceInfo {
    public abstract List<UseCaseConfigFactory.CaptureType> getCaptureTypes();

    public abstract DynamicRange getDynamicRange();

    public abstract int getImageFormat();

    public abstract Config getImplementationOptions();

    public abstract Size getSize();

    public abstract SurfaceConfig getSurfaceConfig();

    public abstract Range<Integer> getTargetFrameRate();

    public static AttachedSurfaceInfo create(SurfaceConfig surfaceConfig, int imageFormat, Size size, DynamicRange dynamicRange, List<UseCaseConfigFactory.CaptureType> captureTypes, Config implementationOptions, Range<Integer> targetFrameRate) {
        return new AutoValue_AttachedSurfaceInfo(surfaceConfig, imageFormat, size, dynamicRange, captureTypes, implementationOptions, targetFrameRate);
    }

    public StreamSpec toStreamSpec(Config implementationOptions) {
        StreamSpec.Builder streamSpecBuilder = StreamSpec.builder(getSize()).setDynamicRange(getDynamicRange()).setImplementationOptions(implementationOptions);
        if (getTargetFrameRate() != null) {
            streamSpecBuilder.setExpectedFrameRateRange(getTargetFrameRate());
        }
        return streamSpecBuilder.build();
    }
}
