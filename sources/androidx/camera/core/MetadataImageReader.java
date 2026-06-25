package androidx.camera.core;

import android.media.ImageReader;
import android.util.LongSparseArray;
import android.view.Surface;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.internal.CameraCaptureResultImageInfo;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class MetadataImageReader implements ImageReaderProxy, ForwardingImageProxy.OnImageCloseListener {
    private static final String TAG = "MetadataImageReader";
    private final List<ImageProxy> mAcquiredImageProxies;
    private CameraCaptureCallback mCameraCaptureCallback;
    private boolean mClosed;
    private Executor mExecutor;
    private int mImageProxiesIndex;
    private final ImageReaderProxy mImageReaderProxy;
    ImageReaderProxy.OnImageAvailableListener mListener;
    private final Object mLock;
    private final List<ImageProxy> mMatchedImageProxies;
    private final LongSparseArray<ImageInfo> mPendingImageInfos;
    private final LongSparseArray<ImageProxy> mPendingImages;
    private ImageReaderProxy.OnImageAvailableListener mTransformedListener;
    private int mUnAcquiredAvailableImageCount;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-core-MetadataImageReader  reason: not valid java name */
    public /* synthetic */ void m124lambda$new$0$androidxcameracoreMetadataImageReader(ImageReaderProxy reader) {
        synchronized (this.mLock) {
            this.mUnAcquiredAvailableImageCount++;
        }
        imageIncoming(reader);
    }

    public MetadataImageReader(int width, int height, int format, int maxImages) {
        this(createImageReaderProxy(width, height, format, maxImages));
    }

    private static ImageReaderProxy createImageReaderProxy(int width, int height, int format, int maxImages) {
        return new AndroidImageReaderProxy(ImageReader.newInstance(width, height, format, maxImages));
    }

    MetadataImageReader(ImageReaderProxy imageReaderProxy) {
        this.mLock = new Object();
        this.mCameraCaptureCallback = new CameraCaptureCallback() { // from class: androidx.camera.core.MetadataImageReader.1
            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCompleted(CameraCaptureResult cameraCaptureResult) {
                super.onCaptureCompleted(cameraCaptureResult);
                MetadataImageReader.this.resultIncoming(cameraCaptureResult);
            }
        };
        this.mUnAcquiredAvailableImageCount = 0;
        this.mTransformedListener = new ImageReaderProxy.OnImageAvailableListener() { // from class: androidx.camera.core.MetadataImageReader$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy2) {
                MetadataImageReader.this.m124lambda$new$0$androidxcameracoreMetadataImageReader(imageReaderProxy2);
            }
        };
        this.mClosed = false;
        this.mPendingImageInfos = new LongSparseArray<>();
        this.mPendingImages = new LongSparseArray<>();
        this.mAcquiredImageProxies = new ArrayList();
        this.mImageReaderProxy = imageReaderProxy;
        this.mImageProxiesIndex = 0;
        this.mMatchedImageProxies = new ArrayList(getMaxImages());
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireLatestImage() {
        synchronized (this.mLock) {
            if (this.mMatchedImageProxies.isEmpty()) {
                return null;
            }
            if (this.mImageProxiesIndex >= this.mMatchedImageProxies.size()) {
                throw new IllegalStateException("Maximum image number reached.");
            }
            List<ImageProxy> toClose = new ArrayList<>();
            for (int i = 0; i < this.mMatchedImageProxies.size() - 1; i++) {
                if (!this.mAcquiredImageProxies.contains(this.mMatchedImageProxies.get(i))) {
                    toClose.add(this.mMatchedImageProxies.get(i));
                }
            }
            for (ImageProxy image : toClose) {
                image.close();
            }
            this.mImageProxiesIndex = this.mMatchedImageProxies.size() - 1;
            List<ImageProxy> list = this.mMatchedImageProxies;
            int i2 = this.mImageProxiesIndex;
            this.mImageProxiesIndex = i2 + 1;
            ImageProxy acquiredImage = list.get(i2);
            this.mAcquiredImageProxies.add(acquiredImage);
            return acquiredImage;
        }
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireNextImage() {
        synchronized (this.mLock) {
            if (this.mMatchedImageProxies.isEmpty()) {
                return null;
            }
            if (this.mImageProxiesIndex >= this.mMatchedImageProxies.size()) {
                throw new IllegalStateException("Maximum image number reached.");
            }
            List<ImageProxy> list = this.mMatchedImageProxies;
            int i = this.mImageProxiesIndex;
            this.mImageProxiesIndex = i + 1;
            ImageProxy acquiredImage = list.get(i);
            this.mAcquiredImageProxies.add(acquiredImage);
            return acquiredImage;
        }
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void close() {
        synchronized (this.mLock) {
            if (this.mClosed) {
                return;
            }
            List<ImageProxy> imagesToClose = new ArrayList<>(this.mMatchedImageProxies);
            for (ImageProxy image : imagesToClose) {
                image.close();
            }
            this.mMatchedImageProxies.clear();
            this.mImageReaderProxy.close();
            this.mClosed = true;
        }
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getHeight() {
        int height;
        synchronized (this.mLock) {
            height = this.mImageReaderProxy.getHeight();
        }
        return height;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getWidth() {
        int width;
        synchronized (this.mLock) {
            width = this.mImageReaderProxy.getWidth();
        }
        return width;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getImageFormat() {
        int imageFormat;
        synchronized (this.mLock) {
            imageFormat = this.mImageReaderProxy.getImageFormat();
        }
        return imageFormat;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getMaxImages() {
        int maxImages;
        synchronized (this.mLock) {
            maxImages = this.mImageReaderProxy.getMaxImages();
        }
        return maxImages;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public Surface getSurface() {
        Surface surface;
        synchronized (this.mLock) {
            surface = this.mImageReaderProxy.getSurface();
        }
        return surface;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void setOnImageAvailableListener(ImageReaderProxy.OnImageAvailableListener listener, Executor executor) {
        synchronized (this.mLock) {
            this.mListener = (ImageReaderProxy.OnImageAvailableListener) Preconditions.checkNotNull(listener);
            this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
            this.mImageReaderProxy.setOnImageAvailableListener(this.mTransformedListener, executor);
        }
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void clearOnImageAvailableListener() {
        synchronized (this.mLock) {
            this.mImageReaderProxy.clearOnImageAvailableListener();
            this.mListener = null;
            this.mExecutor = null;
            this.mUnAcquiredAvailableImageCount = 0;
        }
    }

    @Override // androidx.camera.core.ForwardingImageProxy.OnImageCloseListener
    public void onImageClose(ImageProxy image) {
        synchronized (this.mLock) {
            dequeImageProxy(image);
        }
    }

    private void enqueueImageProxy(SettableImageProxy image) {
        final ImageReaderProxy.OnImageAvailableListener listener;
        Executor executor;
        synchronized (this.mLock) {
            if (this.mMatchedImageProxies.size() < getMaxImages()) {
                image.addOnImageCloseListener(this);
                this.mMatchedImageProxies.add(image);
                listener = this.mListener;
                executor = this.mExecutor;
            } else {
                Logger.d("TAG", "Maximum image number reached.");
                image.close();
                listener = null;
                executor = null;
            }
        }
        if (listener != null) {
            if (executor != null) {
                executor.execute(new Runnable() { // from class: androidx.camera.core.MetadataImageReader$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        MetadataImageReader.this.m123xfaac2cde(listener);
                    }
                });
            } else {
                listener.onImageAvailable(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$enqueueImageProxy$1$androidx-camera-core-MetadataImageReader  reason: not valid java name */
    public /* synthetic */ void m123xfaac2cde(ImageReaderProxy.OnImageAvailableListener listener) {
        listener.onImageAvailable(this);
    }

    private void dequeImageProxy(ImageProxy image) {
        synchronized (this.mLock) {
            int index = this.mMatchedImageProxies.indexOf(image);
            if (index >= 0) {
                this.mMatchedImageProxies.remove(index);
                if (index <= this.mImageProxiesIndex) {
                    this.mImageProxiesIndex--;
                }
            }
            this.mAcquiredImageProxies.remove(image);
            if (this.mUnAcquiredAvailableImageCount > 0) {
                imageIncoming(this.mImageReaderProxy);
            }
        }
    }

    public CameraCaptureCallback getCameraCaptureCallback() {
        return this.mCameraCaptureCallback;
    }

    void imageIncoming(ImageReaderProxy imageReader) {
        synchronized (this.mLock) {
            if (this.mClosed) {
                return;
            }
            int numAcquired = this.mPendingImages.size() + this.mMatchedImageProxies.size();
            if (numAcquired >= imageReader.getMaxImages()) {
                Logger.d(TAG, "Skip to acquire the next image because the acquired image count has reached the max images count.");
                return;
            }
            do {
                ImageProxy image = null;
                try {
                    image = imageReader.acquireNextImage();
                } catch (IllegalStateException e) {
                    Logger.d(TAG, "Failed to acquire next image.", e);
                    if (0 != 0) {
                        this.mUnAcquiredAvailableImageCount--;
                        numAcquired++;
                        this.mPendingImages.put(image.getImageInfo().getTimestamp(), null);
                    }
                }
                if (image != null) {
                    this.mUnAcquiredAvailableImageCount--;
                    numAcquired++;
                    this.mPendingImages.put(image.getImageInfo().getTimestamp(), image);
                    matchImages();
                }
                if (image == null || this.mUnAcquiredAvailableImageCount <= 0) {
                    break;
                }
            } while (numAcquired < imageReader.getMaxImages());
        }
    }

    void resultIncoming(CameraCaptureResult cameraCaptureResult) {
        synchronized (this.mLock) {
            if (this.mClosed) {
                return;
            }
            this.mPendingImageInfos.put(cameraCaptureResult.getTimestamp(), new CameraCaptureResultImageInfo(cameraCaptureResult));
            matchImages();
        }
    }

    private void removeStaleData() {
        synchronized (this.mLock) {
            if (this.mPendingImages.size() != 0 && this.mPendingImageInfos.size() != 0) {
                Long minImageProxyTimestamp = Long.valueOf(this.mPendingImages.keyAt(0));
                Long minImageInfoTimestamp = Long.valueOf(this.mPendingImageInfos.keyAt(0));
                Preconditions.checkArgument(minImageInfoTimestamp.equals(minImageProxyTimestamp) ? false : true);
                if (minImageInfoTimestamp.longValue() > minImageProxyTimestamp.longValue()) {
                    for (int i = this.mPendingImages.size() - 1; i >= 0; i--) {
                        if (this.mPendingImages.keyAt(i) < minImageInfoTimestamp.longValue()) {
                            ImageProxy imageProxy = this.mPendingImages.valueAt(i);
                            imageProxy.close();
                            this.mPendingImages.removeAt(i);
                        }
                    }
                } else {
                    for (int i2 = this.mPendingImageInfos.size() - 1; i2 >= 0; i2--) {
                        if (this.mPendingImageInfos.keyAt(i2) < minImageProxyTimestamp.longValue()) {
                            this.mPendingImageInfos.removeAt(i2);
                        }
                    }
                }
            }
        }
    }

    private void matchImages() {
        synchronized (this.mLock) {
            for (int i = this.mPendingImageInfos.size() - 1; i >= 0; i--) {
                ImageInfo imageInfo = this.mPendingImageInfos.valueAt(i);
                long timestamp = imageInfo.getTimestamp();
                ImageProxy image = this.mPendingImages.get(timestamp);
                if (image != null) {
                    this.mPendingImages.remove(timestamp);
                    this.mPendingImageInfos.removeAt(i);
                    enqueueImageProxy(new SettableImageProxy(image, imageInfo));
                }
            }
            removeStaleData();
        }
    }
}
