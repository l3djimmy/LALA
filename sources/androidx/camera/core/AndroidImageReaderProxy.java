package androidx.camera.core;

import android.media.Image;
import android.media.ImageReader;
import android.view.Surface;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.utils.MainThreadAsyncHandler;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class AndroidImageReaderProxy implements ImageReaderProxy {
    private final ImageReader mImageReader;
    private final Object mLock = new Object();
    private boolean mIsImageAvailableListenerCleared = true;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AndroidImageReaderProxy(ImageReader imageReader) {
        this.mImageReader = imageReader;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireLatestImage() {
        Image image;
        synchronized (this.mLock) {
            try {
                image = this.mImageReader.acquireLatestImage();
            } catch (RuntimeException e) {
                if (isImageReaderContextNotInitializedException(e)) {
                    image = null;
                } else {
                    throw e;
                }
            }
            if (image == null) {
                return null;
            }
            return new AndroidImageProxy(image);
        }
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public ImageProxy acquireNextImage() {
        Image image;
        synchronized (this.mLock) {
            try {
                image = this.mImageReader.acquireNextImage();
            } catch (RuntimeException e) {
                if (isImageReaderContextNotInitializedException(e)) {
                    image = null;
                } else {
                    throw e;
                }
            }
            if (image == null) {
                return null;
            }
            return new AndroidImageProxy(image);
        }
    }

    private boolean isImageReaderContextNotInitializedException(RuntimeException e) {
        return "ImageReaderContext is not initialized".equals(e.getMessage());
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void close() {
        synchronized (this.mLock) {
            this.mImageReader.close();
        }
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getHeight() {
        int height;
        synchronized (this.mLock) {
            height = this.mImageReader.getHeight();
        }
        return height;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getWidth() {
        int width;
        synchronized (this.mLock) {
            width = this.mImageReader.getWidth();
        }
        return width;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getImageFormat() {
        int imageFormat;
        synchronized (this.mLock) {
            imageFormat = this.mImageReader.getImageFormat();
        }
        return imageFormat;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public int getMaxImages() {
        int maxImages;
        synchronized (this.mLock) {
            maxImages = this.mImageReader.getMaxImages();
        }
        return maxImages;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public Surface getSurface() {
        Surface surface;
        synchronized (this.mLock) {
            surface = this.mImageReader.getSurface();
        }
        return surface;
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void setOnImageAvailableListener(final ImageReaderProxy.OnImageAvailableListener listener, final Executor executor) {
        synchronized (this.mLock) {
            this.mIsImageAvailableListenerCleared = false;
            ImageReader.OnImageAvailableListener transformedListener = new ImageReader.OnImageAvailableListener() { // from class: androidx.camera.core.AndroidImageReaderProxy$$ExternalSyntheticLambda1
                @Override // android.media.ImageReader.OnImageAvailableListener
                public final void onImageAvailable(ImageReader imageReader) {
                    AndroidImageReaderProxy.this.m105x2fd48a6(executor, listener, imageReader);
                }
            };
            this.mImageReader.setOnImageAvailableListener(transformedListener, MainThreadAsyncHandler.getInstance());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setOnImageAvailableListener$1$androidx-camera-core-AndroidImageReaderProxy  reason: not valid java name */
    public /* synthetic */ void m105x2fd48a6(Executor executor, final ImageReaderProxy.OnImageAvailableListener listener, ImageReader imageReader) {
        synchronized (this.mLock) {
            if (!this.mIsImageAvailableListenerCleared) {
                executor.execute(new Runnable() { // from class: androidx.camera.core.AndroidImageReaderProxy$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        AndroidImageReaderProxy.this.m104x4985bb07(listener);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setOnImageAvailableListener$0$androidx-camera-core-AndroidImageReaderProxy  reason: not valid java name */
    public /* synthetic */ void m104x4985bb07(ImageReaderProxy.OnImageAvailableListener listener) {
        listener.onImageAvailable(this);
    }

    @Override // androidx.camera.core.impl.ImageReaderProxy
    public void clearOnImageAvailableListener() {
        synchronized (this.mLock) {
            this.mIsImageAvailableListenerCleared = true;
            this.mImageReader.setOnImageAvailableListener(null, null);
        }
    }
}
