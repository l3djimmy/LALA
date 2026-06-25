package androidx.camera.core.imagecapture;

import android.util.Pair;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.SettableImageProxy;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.internal.CameraCaptureResultImageInfo;
import androidx.camera.core.streamsharing.VirtualCameraCaptureResult;
import androidx.core.util.Preconditions;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class NoMetadataImageReader implements ImageReaderProxy {
    private ProcessingRequest mPendingRequest;
    private final ImageReaderProxy mWrappedImageReader;

    /* JADX INFO: Access modifiers changed from: package-private */
    public NoMetadataImageReader(ImageReaderProxy imageReaderProxy) {
        this.mWrappedImageReader = imageReaderProxy;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void acceptProcessingRequest(ProcessingRequest request) {
        Preconditions.checkState(this.mPendingRequest == null, "Pending request should be null");
        this.mPendingRequest = request;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireLatestImage() {
        return createImageProxyWithEmptyMetadata(this.mWrappedImageReader.acquireLatestImage());
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireNextImage() {
        return createImageProxyWithEmptyMetadata(this.mWrappedImageReader.acquireNextImage());
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void close() {
        this.mWrappedImageReader.close();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getHeight() {
        return this.mWrappedImageReader.getHeight();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getWidth() {
        return this.mWrappedImageReader.getWidth();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getImageFormat() {
        return this.mWrappedImageReader.getImageFormat();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getMaxImages() {
        return this.mWrappedImageReader.getMaxImages();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public Surface getSurface() {
        return this.mWrappedImageReader.getSurface();
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void setOnImageAvailableListener(final ImageReaderProxy.OnImageAvailableListener listener, Executor executor) {
        this.mWrappedImageReader.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // from class: androidx.camera.core.imagecapture.NoMetadataImageReader$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                NoMetadataImageReader.this.m133xfcc2464(listener, imageReaderProxy);
            }
        }, executor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setOnImageAvailableListener$0$androidx-camera-core-imagecapture-NoMetadataImageReader  reason: not valid java name */
    public /* synthetic */ void m133xfcc2464(ImageReaderProxy.OnImageAvailableListener listener, ImageReaderProxy imageReader) {
        listener.onImageAvailable(this);
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void clearOnImageAvailableListener() {
        this.mWrappedImageReader.clearOnImageAvailableListener();
    }

    private ImageProxy createImageProxyWithEmptyMetadata(ImageProxy originalImage) {
        if (originalImage == null) {
            return null;
        }
        Preconditions.checkState(this.mPendingRequest != null, "Pending request should not be null");
        TagBundle tagBundle = TagBundle.create(new Pair(this.mPendingRequest.getTagBundleKey(), this.mPendingRequest.getStageIds().get(0)));
        this.mPendingRequest = null;
        return new SettableImageProxy(originalImage, new Size(originalImage.getWidth(), originalImage.getHeight()), new CameraCaptureResultImageInfo(new VirtualCameraCaptureResult(tagBundle, originalImage.getImageInfo().getTimestamp())));
    }
}
