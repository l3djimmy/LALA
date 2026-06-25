package androidx.camera.core.imagecapture;

import android.util.Size;
import android.view.Surface;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.ImageReaderProxyProvider;
import androidx.camera.core.ImageReaderProxys;
import androidx.camera.core.Logger;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.Edge;
import androidx.camera.core.processing.Node;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class CaptureNode implements Node<In, Out> {
    static final int MAX_IMAGES = 4;
    private static final String TAG = "CaptureNode";
    private In mInputEdge;
    private Out mOutputEdge;
    SafeCloseImageReaderProxy mSafeCloseImageReaderProxy;
    private final Set<Integer> mPendingStageIds = new HashSet();
    ProcessingRequest mCurrentRequest = null;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.camera.core.processing.Node
    public Out transform(In inputEdge) {
        ImageReaderProxy wrappedImageReader;
        Consumer<ProcessingRequest> requestConsumer;
        Preconditions.checkState(this.mInputEdge == null && this.mSafeCloseImageReaderProxy == null, "CaptureNode does not support recreation yet.");
        this.mInputEdge = inputEdge;
        Size size = inputEdge.getSize();
        int format = inputEdge.getInputFormat();
        boolean hasMetadata = true ^ inputEdge.isVirtualCamera();
        if (hasMetadata && inputEdge.getImageReaderProxyProvider() == null) {
            MetadataImageReader metadataImageReader = new MetadataImageReader(size.getWidth(), size.getHeight(), format, 4);
            inputEdge.setCameraCaptureCallback(metadataImageReader.getCameraCaptureCallback());
            wrappedImageReader = metadataImageReader;
            requestConsumer = new Consumer() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda0
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    CaptureNode.this.onRequestAvailable((ProcessingRequest) obj);
                }
            };
        } else {
            final NoMetadataImageReader noMetadataImageReader = new NoMetadataImageReader(createImageReaderProxy(inputEdge.getImageReaderProxyProvider(), size.getWidth(), size.getHeight(), format));
            wrappedImageReader = noMetadataImageReader;
            requestConsumer = new Consumer() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda1
                @Override // androidx.core.util.Consumer
                public final void accept(Object obj) {
                    CaptureNode.this.m131lambda$transform$0$androidxcameracoreimagecaptureCaptureNode(noMetadataImageReader, (ProcessingRequest) obj);
                }
            };
        }
        inputEdge.setSurface((Surface) Objects.requireNonNull(wrappedImageReader.getSurface()));
        this.mSafeCloseImageReaderProxy = new SafeCloseImageReaderProxy(wrappedImageReader);
        wrappedImageReader.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                CaptureNode.this.m132lambda$transform$1$androidxcameracoreimagecaptureCaptureNode(imageReaderProxy);
            }
        }, CameraXExecutors.mainThreadExecutor());
        inputEdge.getRequestEdge().setListener(requestConsumer);
        inputEdge.getErrorEdge().setListener(new Consumer() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda3
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CaptureNode.this.sendCaptureError((ImageCaptureException) obj);
            }
        });
        this.mOutputEdge = Out.of(inputEdge.getInputFormat(), inputEdge.getOutputFormat());
        return this.mOutputEdge;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$transform$0$androidx-camera-core-imagecapture-CaptureNode  reason: not valid java name */
    public /* synthetic */ void m131lambda$transform$0$androidxcameracoreimagecaptureCaptureNode(NoMetadataImageReader noMetadataImageReader, ProcessingRequest request) {
        onRequestAvailable(request);
        noMetadataImageReader.acceptProcessingRequest(request);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$transform$1$androidx-camera-core-imagecapture-CaptureNode  reason: not valid java name */
    public /* synthetic */ void m132lambda$transform$1$androidxcameracoreimagecaptureCaptureNode(ImageReaderProxy imageReader) {
        try {
            ImageProxy image = imageReader.acquireLatestImage();
            if (image != null) {
                onImageProxyAvailable(image);
            } else {
                sendCaptureError(new ImageCaptureException(2, "Failed to acquire latest image", null));
            }
        } catch (IllegalStateException e) {
            sendCaptureError(new ImageCaptureException(2, "Failed to acquire latest image", e));
        }
    }

    private static ImageReaderProxy createImageReaderProxy(ImageReaderProxyProvider imageReaderProxyProvider, int width, int height, int format) {
        return imageReaderProxyProvider != null ? imageReaderProxyProvider.newInstance(width, height, format, 4, 0L) : ImageReaderProxys.createIsolatedReader(width, height, format, 4);
    }

    void onImageProxyAvailable(ImageProxy imageProxy) {
        Threads.checkMainThread();
        if (this.mCurrentRequest == null) {
            Logger.d(TAG, "Discarding ImageProxy which was inadvertently acquired: " + imageProxy);
            imageProxy.close();
            return;
        }
        matchAndPropagateImage(imageProxy);
    }

    private void matchAndPropagateImage(ImageProxy imageProxy) {
        int stageId = ((Integer) Objects.requireNonNull(imageProxy.getImageInfo().getTagBundle().getTag(this.mCurrentRequest.getTagBundleKey()))).intValue();
        Preconditions.checkState(this.mPendingStageIds.contains(Integer.valueOf(stageId)), "Received an unexpected stage id" + stageId);
        this.mPendingStageIds.remove(Integer.valueOf(stageId));
        ((Out) Objects.requireNonNull(this.mOutputEdge)).getImageEdge().accept(imageProxy);
        if (this.mPendingStageIds.isEmpty()) {
            ProcessingRequest request = this.mCurrentRequest;
            this.mCurrentRequest = null;
            request.onImageCaptured();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onRequestAvailable(final ProcessingRequest request) {
        Threads.checkMainThread();
        boolean z = true;
        Preconditions.checkState(getCapacity() > 0, "Too many acquire images. Close image to be able to process next.");
        if (this.mCurrentRequest != null && !this.mPendingStageIds.isEmpty()) {
            z = false;
        }
        Preconditions.checkState(z, "The previous request is not complete");
        this.mCurrentRequest = request;
        this.mPendingStageIds.addAll(request.getStageIds());
        ((Out) Objects.requireNonNull(this.mOutputEdge)).getRequestEdge().accept(request);
        Futures.addCallback(request.getCaptureFuture(), new FutureCallback<Void>() { // from class: androidx.camera.core.imagecapture.CaptureNode.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Threads.checkMainThread();
                if (request == CaptureNode.this.mCurrentRequest) {
                    CaptureNode.this.mCurrentRequest = null;
                }
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendCaptureError(ImageCaptureException e) {
        Threads.checkMainThread();
        if (this.mCurrentRequest != null) {
            this.mCurrentRequest.onCaptureFailure(e);
        }
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        Threads.checkMainThread();
        releaseInputResources((In) Objects.requireNonNull(this.mInputEdge), (SafeCloseImageReaderProxy) Objects.requireNonNull(this.mSafeCloseImageReaderProxy));
    }

    private void releaseInputResources(In inputEdge, final SafeCloseImageReaderProxy imageReader) {
        inputEdge.getSurface().close();
        ListenableFuture<Void> terminationFuture = inputEdge.getSurface().getTerminationFuture();
        Objects.requireNonNull(imageReader);
        terminationFuture.addListener(new Runnable() { // from class: androidx.camera.core.imagecapture.CaptureNode$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                SafeCloseImageReaderProxy.this.safeClose();
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    In getInputEdge() {
        return (In) Objects.requireNonNull(this.mInputEdge);
    }

    public SafeCloseImageReaderProxy getSafeCloseImageReaderProxy() {
        return (SafeCloseImageReaderProxy) Objects.requireNonNull(this.mSafeCloseImageReaderProxy);
    }

    public int getCapacity() {
        Threads.checkMainThread();
        Preconditions.checkState(this.mSafeCloseImageReaderProxy != null, "The ImageReader is not initialized.");
        return this.mSafeCloseImageReaderProxy.getCapacity();
    }

    public void setOnImageCloseListener(ForwardingImageProxy.OnImageCloseListener listener) {
        Threads.checkMainThread();
        Preconditions.checkState(this.mSafeCloseImageReaderProxy != null, "The ImageReader is not initialized.");
        this.mSafeCloseImageReaderProxy.setOnImageCloseListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class In {
        private CameraCaptureCallback mCameraCaptureCallback = new CameraCaptureCallback() { // from class: androidx.camera.core.imagecapture.CaptureNode.In.1
        };
        private DeferrableSurface mSurface;

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Edge<ImageCaptureException> getErrorEdge();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract ImageReaderProxyProvider getImageReaderProxyProvider();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getInputFormat();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getOutputFormat();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Edge<ProcessingRequest> getRequestEdge();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Size getSize();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract boolean isVirtualCamera();

        /* JADX INFO: Access modifiers changed from: package-private */
        public DeferrableSurface getSurface() {
            return (DeferrableSurface) Objects.requireNonNull(this.mSurface);
        }

        void setSurface(Surface surface) {
            Preconditions.checkState(this.mSurface == null, "The surface is already set.");
            this.mSurface = new ImmediateSurface(surface, getSize(), getInputFormat());
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public CameraCaptureCallback getCameraCaptureCallback() {
            return this.mCameraCaptureCallback;
        }

        void setCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCameraCaptureCallback = cameraCaptureCallback;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static In of(Size size, int inputFormat, int outputFormat, boolean isVirtualCamera, ImageReaderProxyProvider imageReaderProxyProvider) {
            return new AutoValue_CaptureNode_In(size, inputFormat, outputFormat, isVirtualCamera, imageReaderProxyProvider, new Edge(), new Edge());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class Out {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Edge<ImageProxy> getImageEdge();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getInputFormat();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getOutputFormat();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Edge<ProcessingRequest> getRequestEdge();

        static Out of(int inputFormat, int outputFormat) {
            return new AutoValue_CaptureNode_Out(new Edge(), new Edge(), inputFormat, outputFormat);
        }
    }
}
