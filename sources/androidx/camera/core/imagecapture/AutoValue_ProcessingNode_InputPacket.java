package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.ProcessingNode;
/* loaded from: classes.dex */
final class AutoValue_ProcessingNode_InputPacket extends ProcessingNode.InputPacket {
    private final ImageProxy imageProxy;
    private final ProcessingRequest processingRequest;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_ProcessingNode_InputPacket(ProcessingRequest processingRequest, ImageProxy imageProxy) {
        if (processingRequest == null) {
            throw new NullPointerException("Null processingRequest");
        }
        this.processingRequest = processingRequest;
        if (imageProxy == null) {
            throw new NullPointerException("Null imageProxy");
        }
        this.imageProxy = imageProxy;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.InputPacket
    ProcessingRequest getProcessingRequest() {
        return this.processingRequest;
    }

    @Override // androidx.camera.core.imagecapture.ProcessingNode.InputPacket
    ImageProxy getImageProxy() {
        return this.imageProxy;
    }

    public String toString() {
        return "InputPacket{processingRequest=" + this.processingRequest + ", imageProxy=" + this.imageProxy + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof ProcessingNode.InputPacket) {
            ProcessingNode.InputPacket that = (ProcessingNode.InputPacket) o;
            return this.processingRequest.equals(that.getProcessingRequest()) && this.imageProxy.equals(that.getImageProxy());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.processingRequest.hashCode()) * 1000003) ^ this.imageProxy.hashCode();
    }
}
