package androidx.camera.core.processing;

import androidx.camera.core.processing.SurfaceProcessorNode;
import java.util.List;
/* loaded from: classes.dex */
final class AutoValue_SurfaceProcessorNode_In extends SurfaceProcessorNode.In {
    private final List<SurfaceProcessorNode.OutConfig> outConfigs;
    private final SurfaceEdge surfaceEdge;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_SurfaceProcessorNode_In(SurfaceEdge surfaceEdge, List<SurfaceProcessorNode.OutConfig> outConfigs) {
        if (surfaceEdge == null) {
            throw new NullPointerException("Null surfaceEdge");
        }
        this.surfaceEdge = surfaceEdge;
        if (outConfigs == null) {
            throw new NullPointerException("Null outConfigs");
        }
        this.outConfigs = outConfigs;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.In
    public SurfaceEdge getSurfaceEdge() {
        return this.surfaceEdge;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.In
    public List<SurfaceProcessorNode.OutConfig> getOutConfigs() {
        return this.outConfigs;
    }

    public String toString() {
        return "In{surfaceEdge=" + this.surfaceEdge + ", outConfigs=" + this.outConfigs + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SurfaceProcessorNode.In) {
            SurfaceProcessorNode.In that = (SurfaceProcessorNode.In) o;
            return this.surfaceEdge.equals(that.getSurfaceEdge()) && this.outConfigs.equals(that.getOutConfigs());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.surfaceEdge.hashCode()) * 1000003) ^ this.outConfigs.hashCode();
    }
}
