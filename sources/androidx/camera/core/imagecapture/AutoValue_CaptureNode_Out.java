package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.processing.Edge;
/* loaded from: classes.dex */
final class AutoValue_CaptureNode_Out extends CaptureNode.Out {
    private final Edge<ImageProxy> imageEdge;
    private final int inputFormat;
    private final int outputFormat;
    private final Edge<ProcessingRequest> requestEdge;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_CaptureNode_Out(Edge<ImageProxy> imageEdge, Edge<ProcessingRequest> requestEdge, int inputFormat, int outputFormat) {
        if (imageEdge == null) {
            throw new NullPointerException("Null imageEdge");
        }
        this.imageEdge = imageEdge;
        if (requestEdge == null) {
            throw new NullPointerException("Null requestEdge");
        }
        this.requestEdge = requestEdge;
        this.inputFormat = inputFormat;
        this.outputFormat = outputFormat;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.Out
    Edge<ImageProxy> getImageEdge() {
        return this.imageEdge;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.Out
    Edge<ProcessingRequest> getRequestEdge() {
        return this.requestEdge;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.Out
    int getInputFormat() {
        return this.inputFormat;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.Out
    int getOutputFormat() {
        return this.outputFormat;
    }

    public String toString() {
        return "Out{imageEdge=" + this.imageEdge + ", requestEdge=" + this.requestEdge + ", inputFormat=" + this.inputFormat + ", outputFormat=" + this.outputFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof CaptureNode.Out) {
            CaptureNode.Out that = (CaptureNode.Out) o;
            return this.imageEdge.equals(that.getImageEdge()) && this.requestEdge.equals(that.getRequestEdge()) && this.inputFormat == that.getInputFormat() && this.outputFormat == that.getOutputFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.imageEdge.hashCode()) * 1000003) ^ this.requestEdge.hashCode()) * 1000003) ^ this.inputFormat) * 1000003) ^ this.outputFormat;
    }
}
