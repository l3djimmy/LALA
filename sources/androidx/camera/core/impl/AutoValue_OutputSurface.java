package androidx.camera.core.impl;

import android.util.Size;
import android.view.Surface;
/* loaded from: classes.dex */
final class AutoValue_OutputSurface extends OutputSurface {
    private final int imageFormat;
    private final Size size;
    private final Surface surface;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_OutputSurface(Surface surface, Size size, int imageFormat) {
        if (surface == null) {
            throw new NullPointerException("Null surface");
        }
        this.surface = surface;
        if (size == null) {
            throw new NullPointerException("Null size");
        }
        this.size = size;
        this.imageFormat = imageFormat;
    }

    @Override // androidx.camera.core.impl.OutputSurface
    public Surface getSurface() {
        return this.surface;
    }

    @Override // androidx.camera.core.impl.OutputSurface
    public Size getSize() {
        return this.size;
    }

    @Override // androidx.camera.core.impl.OutputSurface
    public int getImageFormat() {
        return this.imageFormat;
    }

    public String toString() {
        return "OutputSurface{surface=" + this.surface + ", size=" + this.size + ", imageFormat=" + this.imageFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof OutputSurface) {
            OutputSurface that = (OutputSurface) o;
            return this.surface.equals(that.getSurface()) && this.size.equals(that.getSize()) && this.imageFormat == that.getImageFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.surface.hashCode()) * 1000003) ^ this.size.hashCode()) * 1000003) ^ this.imageFormat;
    }
}
