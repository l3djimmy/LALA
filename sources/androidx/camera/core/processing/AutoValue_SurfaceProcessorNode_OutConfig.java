package androidx.camera.core.processing;

import android.graphics.Rect;
import android.util.Size;
import androidx.camera.core.processing.SurfaceProcessorNode;
import java.util.UUID;
/* loaded from: classes.dex */
final class AutoValue_SurfaceProcessorNode_OutConfig extends SurfaceProcessorNode.OutConfig {
    private final Rect cropRect;
    private final int format;
    private final boolean mirroring;
    private final int rotationDegrees;
    private final Size size;
    private final int targets;
    private final UUID uuid;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_SurfaceProcessorNode_OutConfig(UUID uuid, int targets, int format, Rect cropRect, Size size, int rotationDegrees, boolean mirroring) {
        if (uuid == null) {
            throw new NullPointerException("Null uuid");
        }
        this.uuid = uuid;
        this.targets = targets;
        this.format = format;
        if (cropRect == null) {
            throw new NullPointerException("Null cropRect");
        }
        this.cropRect = cropRect;
        if (size == null) {
            throw new NullPointerException("Null size");
        }
        this.size = size;
        this.rotationDegrees = rotationDegrees;
        this.mirroring = mirroring;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    UUID getUuid() {
        return this.uuid;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    public int getTargets() {
        return this.targets;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    public int getFormat() {
        return this.format;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    public Rect getCropRect() {
        return this.cropRect;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    public Size getSize() {
        return this.size;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    public int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.OutConfig
    public boolean getMirroring() {
        return this.mirroring;
    }

    public String toString() {
        return "OutConfig{uuid=" + this.uuid + ", targets=" + this.targets + ", format=" + this.format + ", cropRect=" + this.cropRect + ", size=" + this.size + ", rotationDegrees=" + this.rotationDegrees + ", mirroring=" + this.mirroring + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SurfaceProcessorNode.OutConfig) {
            SurfaceProcessorNode.OutConfig that = (SurfaceProcessorNode.OutConfig) o;
            return this.uuid.equals(that.getUuid()) && this.targets == that.getTargets() && this.format == that.getFormat() && this.cropRect.equals(that.getCropRect()) && this.size.equals(that.getSize()) && this.rotationDegrees == that.getRotationDegrees() && this.mirroring == that.getMirroring();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((h$ ^ this.uuid.hashCode()) * 1000003) ^ this.targets) * 1000003) ^ this.format) * 1000003) ^ this.cropRect.hashCode()) * 1000003) ^ this.size.hashCode()) * 1000003) ^ this.rotationDegrees) * 1000003) ^ (this.mirroring ? 1231 : 1237);
    }
}
