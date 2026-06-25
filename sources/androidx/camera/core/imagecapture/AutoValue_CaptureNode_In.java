package androidx.camera.core.imagecapture;

import android.util.Size;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageReaderProxyProvider;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.processing.Edge;
/* loaded from: classes.dex */
final class AutoValue_CaptureNode_In extends CaptureNode.In {
    private final Edge<ImageCaptureException> errorEdge;
    private final ImageReaderProxyProvider imageReaderProxyProvider;
    private final int inputFormat;
    private final int outputFormat;
    private final Edge<ProcessingRequest> requestEdge;
    private final Size size;
    private final boolean virtualCamera;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_CaptureNode_In(Size size, int inputFormat, int outputFormat, boolean virtualCamera, ImageReaderProxyProvider imageReaderProxyProvider, Edge<ProcessingRequest> requestEdge, Edge<ImageCaptureException> errorEdge) {
        if (size == null) {
            throw new NullPointerException("Null size");
        }
        this.size = size;
        this.inputFormat = inputFormat;
        this.outputFormat = outputFormat;
        this.virtualCamera = virtualCamera;
        this.imageReaderProxyProvider = imageReaderProxyProvider;
        if (requestEdge == null) {
            throw new NullPointerException("Null requestEdge");
        }
        this.requestEdge = requestEdge;
        if (errorEdge == null) {
            throw new NullPointerException("Null errorEdge");
        }
        this.errorEdge = errorEdge;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    Size getSize() {
        return this.size;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    int getInputFormat() {
        return this.inputFormat;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    int getOutputFormat() {
        return this.outputFormat;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    boolean isVirtualCamera() {
        return this.virtualCamera;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    ImageReaderProxyProvider getImageReaderProxyProvider() {
        return this.imageReaderProxyProvider;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    Edge<ProcessingRequest> getRequestEdge() {
        return this.requestEdge;
    }

    @Override // androidx.camera.core.imagecapture.CaptureNode.In
    Edge<ImageCaptureException> getErrorEdge() {
        return this.errorEdge;
    }

    public String toString() {
        return "In{size=" + this.size + ", inputFormat=" + this.inputFormat + ", outputFormat=" + this.outputFormat + ", virtualCamera=" + this.virtualCamera + ", imageReaderProxyProvider=" + this.imageReaderProxyProvider + ", requestEdge=" + this.requestEdge + ", errorEdge=" + this.errorEdge + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof CaptureNode.In) {
            CaptureNode.In that = (CaptureNode.In) o;
            return this.size.equals(that.getSize()) && this.inputFormat == that.getInputFormat() && this.outputFormat == that.getOutputFormat() && this.virtualCamera == that.isVirtualCamera() && (this.imageReaderProxyProvider != null ? this.imageReaderProxyProvider.equals(that.getImageReaderProxyProvider()) : that.getImageReaderProxyProvider() == null) && this.requestEdge.equals(that.getRequestEdge()) && this.errorEdge.equals(that.getErrorEdge());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((((h$ ^ this.size.hashCode()) * 1000003) ^ this.inputFormat) * 1000003) ^ this.outputFormat) * 1000003) ^ (this.virtualCamera ? 1231 : 1237)) * 1000003) ^ (this.imageReaderProxyProvider == null ? 0 : this.imageReaderProxyProvider.hashCode())) * 1000003) ^ this.requestEdge.hashCode()) * 1000003) ^ this.errorEdge.hashCode();
    }
}
