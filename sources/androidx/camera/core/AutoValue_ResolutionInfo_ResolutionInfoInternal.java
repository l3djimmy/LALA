package androidx.camera.core;

import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.ResolutionInfo;
/* loaded from: classes.dex */
final class AutoValue_ResolutionInfo_ResolutionInfoInternal extends ResolutionInfo.ResolutionInfoInternal {
    private final Rect cropRect;
    private final Size resolution;
    private final int rotationDegrees;

    private AutoValue_ResolutionInfo_ResolutionInfoInternal(Size resolution, Rect cropRect, int rotationDegrees) {
        this.resolution = resolution;
        this.cropRect = cropRect;
        this.rotationDegrees = rotationDegrees;
    }

    @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal
    Size getResolution() {
        return this.resolution;
    }

    @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal
    Rect getCropRect() {
        return this.cropRect;
    }

    @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal
    int getRotationDegrees() {
        return this.rotationDegrees;
    }

    public String toString() {
        return "ResolutionInfoInternal{resolution=" + this.resolution + ", cropRect=" + this.cropRect + ", rotationDegrees=" + this.rotationDegrees + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof ResolutionInfo.ResolutionInfoInternal) {
            ResolutionInfo.ResolutionInfoInternal that = (ResolutionInfo.ResolutionInfoInternal) o;
            return this.resolution.equals(that.getResolution()) && this.cropRect.equals(that.getCropRect()) && this.rotationDegrees == that.getRotationDegrees();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.resolution.hashCode()) * 1000003) ^ this.cropRect.hashCode()) * 1000003) ^ this.rotationDegrees;
    }

    /* loaded from: classes.dex */
    static final class Builder extends ResolutionInfo.ResolutionInfoInternal.Builder {
        private Rect cropRect;
        private Size resolution;
        private Integer rotationDegrees;

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal.Builder
        public ResolutionInfo.ResolutionInfoInternal.Builder setResolution(Size resolution) {
            if (resolution == null) {
                throw new NullPointerException("Null resolution");
            }
            this.resolution = resolution;
            return this;
        }

        @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal.Builder
        ResolutionInfo.ResolutionInfoInternal.Builder setCropRect(Rect cropRect) {
            if (cropRect == null) {
                throw new NullPointerException("Null cropRect");
            }
            this.cropRect = cropRect;
            return this;
        }

        @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal.Builder
        ResolutionInfo.ResolutionInfoInternal.Builder setRotationDegrees(int rotationDegrees) {
            this.rotationDegrees = Integer.valueOf(rotationDegrees);
            return this;
        }

        @Override // androidx.camera.core.ResolutionInfo.ResolutionInfoInternal.Builder
        ResolutionInfo.ResolutionInfoInternal build() {
            String missing = this.resolution == null ? " resolution" : "";
            if (this.cropRect == null) {
                missing = missing + " cropRect";
            }
            if (this.rotationDegrees == null) {
                missing = missing + " rotationDegrees";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_ResolutionInfo_ResolutionInfoInternal(this.resolution, this.cropRect, this.rotationDegrees.intValue());
        }
    }
}
