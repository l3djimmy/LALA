package androidx.camera.core.imagecapture;

import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.processing.Edge;
/* loaded from: classes.dex */
final class AutoValue_ProcessingNode_In extends ProcessingNode.In {
    private final Edge<ProcessingNode.InputPacket> edge;
    private final int inputFormat;
    private final int outputFormat;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_ProcessingNode_In(Edge<ProcessingNode.InputPacket> edge, int inputFormat, int outputFormat) {
        if (edge == null) {
            throw new NullPointerException("Null edge");
        }
        this.edge = edge;
        this.inputFormat = inputFormat;
        this.outputFormat = outputFormat;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.In
    Edge<ProcessingNode.InputPacket> getEdge() {
        return this.edge;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.In
    int getInputFormat() {
        return this.inputFormat;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.In
    int getOutputFormat() {
        return this.outputFormat;
    }

    public String toString() {
        return "In{edge=" + this.edge + ", inputFormat=" + this.inputFormat + ", outputFormat=" + this.outputFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof ProcessingNode.In) {
            ProcessingNode.In that = (ProcessingNode.In) o;
            return this.edge.equals(that.getEdge()) && this.inputFormat == that.getInputFormat() && this.outputFormat == that.getOutputFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.edge.hashCode()) * 1000003) ^ this.inputFormat) * 1000003) ^ this.outputFormat;
    }
}
