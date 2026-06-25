package androidx.camera.core.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.UseCaseConfigFactory;
import java.util.List;
/* loaded from: classes.dex */
final class AutoValue_AttachedSurfaceInfo extends AttachedSurfaceInfo {
    private final List<UseCaseConfigFactory.CaptureType> captureTypes;
    private final DynamicRange dynamicRange;
    private final int imageFormat;
    private final Config implementationOptions;
    private final Size size;
    private final SurfaceConfig surfaceConfig;
    private final Range<Integer> targetFrameRate;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_AttachedSurfaceInfo(SurfaceConfig surfaceConfig, int imageFormat, Size size, DynamicRange dynamicRange, List<UseCaseConfigFactory.CaptureType> captureTypes, Config implementationOptions, Range<Integer> targetFrameRate) {
        if (surfaceConfig == null) {
            throw new NullPointerException("Null surfaceConfig");
        }
        this.surfaceConfig = surfaceConfig;
        this.imageFormat = imageFormat;
        if (size == null) {
            throw new NullPointerException("Null size");
        }
        this.size = size;
        if (dynamicRange == null) {
            throw new NullPointerException("Null dynamicRange");
        }
        this.dynamicRange = dynamicRange;
        if (captureTypes == null) {
            throw new NullPointerException("Null captureTypes");
        }
        this.captureTypes = captureTypes;
        this.implementationOptions = implementationOptions;
        this.targetFrameRate = targetFrameRate;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public SurfaceConfig getSurfaceConfig() {
        return this.surfaceConfig;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public int getImageFormat() {
        return this.imageFormat;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public Size getSize() {
        return this.size;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public DynamicRange getDynamicRange() {
        return this.dynamicRange;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public List<UseCaseConfigFactory.CaptureType> getCaptureTypes() {
        return this.captureTypes;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public Config getImplementationOptions() {
        return this.implementationOptions;
    }

    @Override // androidx.camera.core.impl.AttachedSurfaceInfo
    public Range<Integer> getTargetFrameRate() {
        return this.targetFrameRate;
    }

    public String toString() {
        return "AttachedSurfaceInfo{surfaceConfig=" + this.surfaceConfig + ", imageFormat=" + this.imageFormat + ", size=" + this.size + ", dynamicRange=" + this.dynamicRange + ", captureTypes=" + this.captureTypes + ", implementationOptions=" + this.implementationOptions + ", targetFrameRate=" + this.targetFrameRate + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AttachedSurfaceInfo) {
            AttachedSurfaceInfo that = (AttachedSurfaceInfo) o;
            if (this.surfaceConfig.equals(that.getSurfaceConfig()) && this.imageFormat == that.getImageFormat() && this.size.equals(that.getSize()) && this.dynamicRange.equals(that.getDynamicRange()) && this.captureTypes.equals(that.getCaptureTypes()) && (this.implementationOptions != null ? this.implementationOptions.equals(that.getImplementationOptions()) : that.getImplementationOptions() == null)) {
                if (this.targetFrameRate == null) {
                    if (that.getTargetFrameRate() == null) {
                        return true;
                    }
                } else if (this.targetFrameRate.equals(that.getTargetFrameRate())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((h$ ^ this.surfaceConfig.hashCode()) * 1000003) ^ this.imageFormat) * 1000003) ^ this.size.hashCode()) * 1000003) ^ this.dynamicRange.hashCode()) * 1000003) ^ this.captureTypes.hashCode()) * 1000003) ^ (this.implementationOptions == null ? 0 : this.implementationOptions.hashCode())) * 1000003) ^ (this.targetFrameRate != null ? this.targetFrameRate.hashCode() : 0);
    }
}
